"""Exercise the actual built Windows DLL without GameMaker or network access."""
import ctypes
from ctypes import wintypes
import hashlib
import json
import re
import sys
import time
import unittest
from pathlib import Path


class NativeCryptoTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.dll = ctypes.CDLL(str(Path(__file__).with_name("TelemetryCrypto_x64.dll")))
        cls.dll.tlm_native_secure_id.argtypes = []
        cls.dll.tlm_native_secure_id.restype = ctypes.c_char_p
        cls.dll.tlm_native_sha256.argtypes = [ctypes.c_char_p]
        cls.dll.tlm_native_sha256.restype = ctypes.c_char_p
        cls.dll.tlm_native_os_release.argtypes = []
        cls.dll.tlm_native_os_release.restype = ctypes.c_char_p
        cls.dll.tlm_native_memory_mib.argtypes = []
        cls.dll.tlm_native_memory_mib.restype = ctypes.c_double
        cls.dll.tlm_native_now.argtypes = []
        cls.dll.tlm_native_now.restype = ctypes.c_double

    def test_report_id_format_and_independence(self):
        values = [self.dll.tlm_native_secure_id() for _ in range(1024)]
        self.assertTrue(all(re.fullmatch(rb"[0-9a-f]{32}", item) for item in values))
        self.assertEqual(len(set(values)), len(values))

    def test_sha256_known_vectors_utf8_and_limit(self):
        inputs = [b"", b"abc", "\u00e5\u96ea\U0001f43e".encode("utf-8"),
                  b'{"schema":1,"report_id":"0123456789abcdef0123456789abcdef"}',
                  b"x" * 65536]
        for value in inputs:
            with self.subTest(length=len(value)):
                actual = self.dll.tlm_native_sha256(value)
                self.assertEqual(actual, hashlib.sha256(value).hexdigest().encode("ascii"))

    def test_coarse_os_family_and_rounded_private_memory(self):
        # The output surface contains a fixed family enum, never an exact build.
        family = self.dll.tlm_native_os_release()
        version = sys.getwindowsversion()
        self.assertEqual(family, b"windows_11" if version.build >= 22000 else b"windows_10")

        class Counters(ctypes.Structure):
            _fields_ = [("cb", wintypes.DWORD), ("faults", wintypes.DWORD)] + [
                (name, ctypes.c_size_t) for name in
                ("peak_ws", "ws", "peak_paged", "paged", "peak_nonpaged", "nonpaged",
                 "pagefile", "peak_pagefile", "private")]
        memory = self.dll.tlm_native_memory_mib()
        self.assertGreaterEqual(memory, 0)
        self.assertLessEqual(memory, 1048576)
        self.assertEqual(memory % 64, 0)
        query = ctypes.WinDLL("psapi.dll").GetProcessMemoryInfo
        query.argtypes = [wintypes.HANDLE, ctypes.POINTER(Counters), wintypes.DWORD]
        query.restype = wintypes.BOOL
        current = ctypes.WinDLL("kernel32.dll").GetCurrentProcess
        current.restype = wintypes.HANDLE
        reference = Counters()
        reference.cb = ctypes.sizeof(reference)
        self.assertTrue(query(current(), ctypes.byref(reference), reference.cb))
        rounded = ((reference.private + 32 * 1024 * 1024) // (64 * 1024 * 1024)) * 64
        # Python may allocate between samples; allow at most one rounding bucket.
        self.assertLessEqual(abs(memory - rounded), 64)

    def test_utc_unix_seconds(self):
        now = self.dll.tlm_native_now()
        self.assertGreater(now, 0)
        self.assertEqual(now, int(now))
        self.assertLessEqual(abs(now - time.time()), 2)

    def test_null_and_oversized_input_fail_closed(self):
        self.assertEqual(self.dll.tlm_native_sha256(None), b"")
        self.assertEqual(self.dll.tlm_native_sha256(b"x" * 65537), b"")
        # A prior successful result must not survive a later rejected call.
        self.assertEqual(len(self.dll.tlm_native_sha256(b"abc")), 64)
        self.assertEqual(self.dll.tlm_native_sha256(None), b"")


if __name__ == "__main__":
    unittest.main(testRunner=unittest.TextTestRunner(stream=sys.stdout, verbosity=2))



