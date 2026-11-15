"""Isolated receiver contract, never a deployed service or a legacy route.

The caller supplies a private SQLite destination and an authored build registry.
No request bodies, arbitrary headers or rejected values are logged. A production
adapter still needs verified authentication, request limits, hosting/logging,
access, expiry and rights handling before the client delivery gate can change.
"""
from __future__ import annotations

import hashlib
import json
import math
import re
import sqlite3
from functools import lru_cache
from pathlib import Path

MAX_BODY = 65_536
NOTICE = "sticky-diagnostics-1"
ERROR_CODES = {"unclassified", "level_load", "save_failure", "resource_unavailable"}


@lru_cache(maxsize=1)
def authored_frames():
    # The game and this receiver fixture share this authored build artifact.
    # A deployed adapter must package/review it with the accepted build registry.
    path = Path(__file__).resolve().parents[2] / "datafiles" / "telemetry_frames.json"
    body = path.read_bytes()
    if len(body) > 262144:
        raise ValueError("authored_registry_too_large")
    value = json.loads(body)
    if value["schema"] != 1 or value["game_build"] != "sp-telemetry-v1-dev":
        raise ValueError("authored_registry_mismatch")
    return value["resources"]


class InvalidReport(ValueError):
    """Fixed public reason; never reflect a rejected value."""


def _reject():
    raise InvalidReport("invalid_report")


def _object(pairs):
    result = {}
    for key, value in pairs:
        if key in result:
            _reject()
        result[key] = value
    return result


def _keys(value, allowed, required=()):
    if type(value) is not dict or set(value) - set(allowed) or set(required) - set(value):
        _reject()


def _integer(value, lower, upper):
    if type(value) not in (int, float) or not math.isfinite(value) or value != math.floor(value) or not lower <= value <= upper:
        _reject()


def _enum(value, choices):
    if type(value) is not str or value not in choices:
        _reject()


def validate(body: bytes, builds: frozenset[str]) -> dict:
    if type(body) is not bytes or not 0 < len(body) <= MAX_BODY:
        _reject()
    try:
        report = json.loads(body.decode("utf-8", errors="strict"),
                            object_pairs_hook=_object,
                            parse_constant=lambda _: _reject())
    except (UnicodeError, ValueError, RecursionError):
        _reject()
    core = {"schema_version", "kind", "report_id", "game_build", "platform",
            "notice_version", "submission_mode", "error"}
    _keys(report, core | {"environment", "context", "performance", "manual"}, core)
    _integer(report["schema_version"], 1, 1)
    _enum(report["kind"], {"crash"})
    if type(report["report_id"]) is not str or not re.fullmatch(r"[0-9a-f]{32}", report["report_id"]):
        _reject()
    _enum(report["game_build"], builds)
    _enum(report["platform"], {"windows"})
    _enum(report["notice_version"], {NOTICE})
    _enum(report["submission_mode"], {"automatic", "manual"})
    _keys(report["error"], {"code", "frames"}, {"code"})
    _enum(report["error"]["code"], ERROR_CODES)
    if "frames" in report["error"]:
        frames = report["error"]["frames"]
        if type(frames) is not list or not 1 <= len(frames) <= 16:
            _reject()
        for frame in frames:
            _keys(frame, {"resource", "event", "line"}, {"resource"})
            if type(frame["resource"]) is not str or frame["resource"] not in authored_frames():
                _reject()
            if "event" in frame:
                _enum(frame["event"], authored_frames()[frame["resource"]])
            if "line" in frame:
                _integer(frame["line"], 1, 1000000)
    for group, definitions in {
        "environment": {"os_release": {"windows_10", "windows_11"},
                        "renderer": {"d3d11", "opengl", "vulkan"},
                        "gpu_vendor": {"amd", "intel", "nvidia", "other"}},
        "context": {"mode": {"menu", "play", "editor"},
                    "content_origin": {"official", "custom", "none"}},
    }.items():
        if group in report:
            value = report[group]
            _keys(value, definitions)
            if not value:
                _reject()
            for key, item in value.items():
                _enum(item, definitions[key])
    if "performance" in report:
        value = report["performance"]
        _keys(value, {"fps_mean", "frame_sample_count", "process_memory_mib"})
        if not value or (("fps_mean" in value) != ("frame_sample_count" in value)):
            _reject()
        if "fps_mean" in value:
            _integer(value["fps_mean"], 0, 1000)
            _integer(value["frame_sample_count"], 1, 300)
        if "process_memory_mib" in value:
            _integer(value["process_memory_mib"], 0, 1048576)
            if value["process_memory_mib"] % 64:
                _reject()
    if "manual" in report:
        if report["submission_mode"] != "manual":
            _reject()
        _keys(report["manual"], {"summary"}, {"summary"})
        value = report["manual"]["summary"]
        if type(value) is not str or not value.strip() or len(value) > 2000:
            _reject()
        try:
            if len(value.encode("utf-8", errors="strict")) > 8192:
                _reject()
        except UnicodeError:
            _reject()
    return report


class Receiver:
    """Durable isolated-storage acceptance and exact-byte deduplication."""

    def __init__(self, database: Path, builds: frozenset[str]):
        if not builds or any(not re.fullmatch(r"[A-Za-z0-9_.-]{1,64}", b) for b in builds):
            raise ValueError("authored_build_registry_required")
        self.builds = builds
        self.db = sqlite3.connect(database, isolation_level=None)
        self.db.execute("PRAGMA journal_mode=DELETE")
        self.db.execute("PRAGMA synchronous=FULL")
        self.db.execute("CREATE TABLE IF NOT EXISTS reports "
                        "(report_id TEXT PRIMARY KEY, digest TEXT NOT NULL, "
                        "body BLOB NOT NULL, accepted_at INTEGER NOT NULL)")

    def accept(self, body: bytes, now: int) -> tuple[int, bytes]:
        if type(now) is not int or now < 0:
            raise ValueError("verified_clock_required")
        try:
            report = validate(body, self.builds)
        except InvalidReport:
            return 422, b'{"status":"rejected"}'
        digest = hashlib.sha256(body).hexdigest()
        try:
            self.db.execute("BEGIN IMMEDIATE")
            previous = self.db.execute("SELECT digest FROM reports WHERE report_id=?",
                                       (report["report_id"],)).fetchone()
            if previous is not None and previous[0] != digest:
                self.db.execute("ROLLBACK")
                return 409, b'{"status":"rejected"}'
            if previous is None:
                self.db.execute("INSERT INTO reports VALUES (?,?,?,?)",
                                (report["report_id"], digest, body, now))
            self.db.execute("COMMIT")
        except sqlite3.Error:
            if self.db.in_transaction:
                self.db.execute("ROLLBACK")
            return 503, b'{"status":"unavailable"}'
        # Only after COMMIT. No path, time, request headers or extra properties.
        ack = {"status": "stored", "report_id": report["report_id"],
               "schema_version": 1, "payload_sha256": digest}
        return (201 if previous is None else 200), json.dumps(ack, separators=(",", ":")).encode("utf-8")

    def expire(self, now: int) -> int:
        """Isolated live rows only; no claim about backups/host logs/soft delete."""
        if type(now) is not int or now < 0:
            raise ValueError("verified_clock_required")
        return self.db.execute("DELETE FROM reports WHERE accepted_at<=?",
                               (now - 30 * 86400,)).rowcount

    def close(self):
        self.db.close()
