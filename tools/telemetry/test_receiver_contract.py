import copy
import hashlib
import json
from pathlib import Path
import tempfile
import unittest

from receiver_contract import Receiver, InvalidReport, validate
from make_contract_cases import cases

BUILD = "sp-telemetry-v1-dev"


def sample():
    return {"schema_version": 1, "kind": "crash", "report_id": "0" * 31 + "1",
            "game_build": BUILD, "platform": "windows", "notice_version": "sticky-diagnostics-1",
            "submission_mode": "manual", "error": {"code": "unclassified"},
            "manual": {"summary": "Invented reproduction: café, 猫, 🐾"}}


def encode(value):
    return json.dumps(value, ensure_ascii=False, separators=(",", ":")).encode("utf-8")


class ReceiverContractTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.path = Path(self.temp.name) / "isolated.sqlite3"
        self.receiver = Receiver(self.path, frozenset({BUILD}))
        self.addCleanup(lambda: self.receiver.close())

    def test_durable_ack_exact_bytes_lost_response_and_duplicate(self):
        body = encode(sample())
        code, ack = self.receiver.accept(body, 100)
        self.assertEqual(code, 201)
        decoded = json.loads(ack)
        self.assertEqual(set(decoded), {"status", "report_id", "schema_version", "payload_sha256"})
        self.assertEqual(decoded["payload_sha256"], hashlib.sha256(body).hexdigest())
        self.receiver.close()
        self.receiver = Receiver(self.path, frozenset({BUILD}))
        code, repeated = self.receiver.accept(body, 200)
        self.assertEqual((code, repeated), (200, ack))
        self.assertEqual(self.receiver.db.execute("SELECT body,accepted_at FROM reports").fetchall(), [(body, 100)])

    def test_conflicting_bytes_do_not_overwrite(self):
        body = encode(sample())
        self.receiver.accept(body, 100)
        changed = sample()
        changed["manual"]["summary"] = "A different reviewed report"
        self.assertEqual(self.receiver.accept(encode(changed), 101)[0], 409)
        self.assertEqual(self.receiver.db.execute("SELECT body FROM reports").fetchone()[0], body)

    def test_unknown_nested_fields_types_and_excluded_identity_rejected(self):
        for group, forbidden in [(None, {"user_id": "SECRET_MARKER"}),
                                 ("error", {"message": "SECRET_MARKER"}),
                                 ("error", {"frames": [{"resource": "SECRET_MARKER"}]}),
                                 ("context", {"room_id": "SECRET_MARKER"}),
                                 ("environment", {"device_name": "SECRET_MARKER"})]:
            value = sample()
            target = value if group is None else value.setdefault(group, {})
            target.update(forbidden)
            with self.subTest(group=group, forbidden=forbidden):
                code, ack = self.receiver.accept(encode(value), 100)
                self.assertEqual(code, 422)
                self.assertNotIn(b"SECRET_MARKER", ack)
        for key, bad in [("schema_version", True), ("report_id", "ABC"),
                         ("game_build", "unreviewed-build"), ("notice_version", "future")]:
            value = sample()
            value[key] = bad
            self.assertEqual(self.receiver.accept(encode(value), 100)[0], 422)
        self.assertEqual(self.receiver.db.execute("SELECT count(*) FROM reports").fetchone()[0], 0)

    def test_duplicate_keys_bad_utf8_bounds_and_nonfinite(self):
        for body in [b'{"schema_version":1,"schema_version":1}', b'\xff', b'x' * 65537,
                     b'{"x":NaN}', b'{"x":Infinity}', b'[]', b'null', b'[[[[[[[[[[1]]]]]]]]]]']:
            self.assertEqual(self.receiver.accept(body, 100)[0], 422)
        value = sample()
        value["manual"]["summary"] = "x" * 2001
        self.assertEqual(self.receiver.accept(encode(value), 100)[0], 422)

    def test_omission_pairing_and_measured_zero(self):
        value = sample()
        value["performance"] = {"fps_mean": 0, "frame_sample_count": 1, "process_memory_mib": 0}
        validate(encode(value), frozenset({BUILD}))
        value["performance"].pop("frame_sample_count")
        with self.assertRaises(InvalidReport):
            validate(encode(value), frozenset({BUILD}))
        value["performance"] = {}
        with self.assertRaises(InvalidReport):
            validate(encode(value), frozenset({BUILD}))

    def test_expiry_is_from_first_acceptance_not_retry(self):
        body = encode(sample())
        self.receiver.accept(body, 100)
        self.receiver.accept(body, 100 + 29 * 86400)
        self.assertEqual(self.receiver.expire(100 + 30 * 86400 - 1), 0)
        self.assertEqual(self.receiver.expire(100 + 30 * 86400), 1)

    def test_storage_failure_never_acknowledges(self):
        self.receiver.db.execute("PRAGMA query_only=ON")
        code, ack = self.receiver.accept(encode(sample()), 100)
        self.assertEqual(code, 503)
        self.assertNotIn(b"stored", ack)

    def test_shared_client_receiver_acceptance_corpus(self):
        for case in cases():
            with self.subTest(case=case["name"]):
                try:
                    validate(case["body"].encode("utf-8"), frozenset({BUILD}))
                    accepted = True
                except InvalidReport:
                    accepted = False
                self.assertEqual(accepted, case["accepted"])


if __name__ == "__main__":
    unittest.main()
