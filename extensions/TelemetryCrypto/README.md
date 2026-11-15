# TelemetryCrypto (Windows x64)

This small GameMaker extension provides these Windows-native operations:

| Function | Result | Failure |
| --- | --- | --- |
| `tlm_native_secure_id()` | Fresh 128-bit lowercase hexadecimal report ID from CNG's system-preferred cryptographic random generator. | Empty string. |
| `tlm_native_sha256(utf8)` | SHA-256 of exact non-NUL UTF-8 string bytes, maximum 65,536bytes. | Empty string. |
| `tlm_native_os_release()` | `windows_10` or `windows_11`, from RtlGetVersion and client/workstation product type. No exact build/version leaves the adapter. | Empty string for unavailable, unknown or server classification. |
| `tlm_native_now()` | UTC Unix seconds for local age/backoff bookkeeping, without changing GameMaker timezone state or adding a payload timestamp. | -1 for an invalid pre-epoch clock. |
| `tlm_native_memory_mib()` | Current process-private committed memory, rounded to the nearest 64MiB; valid range 0..1,048,576MiB. This is PrivateUsage, not installed RAM or working-set size. | -1. |

OS and memory functions run only when explicitly called. The diagnostics owner
must check the effective category/field choice before calling them. Loading the
DLL has no collection/sampling hook. No GPU vendor or renderer is guessed.
The adapter never substitutes a clock, device identifier, persistent seed or
ordinary GameMaker random generator. It has no network, file or logging behavior.

The diagnostics owner applies its smaller schema/payload limits first and
rejects embedded NUL before SHA-256. The ID and digest return values point to
static storage until the next call to the same function; GameMaker copies the
returned string. Use them on the serialized GameMaker main thread. Other
platforms must remain guarded and fail closed until a separately verified
adapter exists. Windows ARM64 is not covered by this x64 binary.

Build from this directory with separately verified portable Zig 0.15.2 and a
private cache root; neither needs a global installation or PATH:

```powershell
& ./build.ps1 -ZigPath $verifiedZigExecutable -CacheRoot $privateCompilerCache
```

The build uses `zig cc -target x86_64-windows-gnu -std=c11 -O2 -Wall -Wextra
-Werror -shared telemetry_crypto.c -lbcrypt -lpsapi -s`, and writes
`TelemetryCrypto_x64.dll` beside this source. The generated import library is
moved to the private cache. Run `test_native.py` with supported Windows x64
Python to check the actual DLL. Windows supplies the system crypto/process
services; no additional crypto SDK is bundled.

The compiler itself is a generated local dependency. Verify the official Zig
0.15.2 x86_64 Windows archive SHA-256 against the official index before execution:
`3a0ed1e8799a2f8ce2a6e6290a9ff22e6906f8227865911fb7ddedc3cc14cb0c`.
Toolchain receipts and complete build/test logs belong in private records.

On 2026-11-15 five actual ctypes tests passed: 1,024 unique formatted 128-bit IDs;
SHA-256 for empty/ASCII/non-ASCII UTF-8/JSON/size-limit vectors; null/oversize
failure with no stale result; and coarse OS/rounded private-memory comparison
with native references; and UTC Unix seconds within two seconds of Python time. Repeated native builds were byte-identical. These checks
establish the Windows DLL, not GameMaker integration, delivery or other targets.

Sources checked 2026-11-15:

- [Official Zig download index](https://ziglang.org/download/index.json)
- [Microsoft BCryptGenRandom](https://learn.microsoft.com/en-us/windows/win32/api/bcrypt/nf-bcrypt-bcryptgenrandom)
- [Microsoft BCryptCreateHash](https://learn.microsoft.com/en-us/windows/win32/api/bcrypt/nf-bcrypt-bcryptcreatehash)
- [Microsoft RtlGetVersion](https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/nf-wdm-rtlgetversion)
- [Microsoft Windows 11 release information](https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information)
- [Microsoft GetSystemTimeAsFileTime](https://learn.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimeasfiletime)
- [Microsoft GetProcessMemoryInfo](https://learn.microsoft.com/en-us/windows/win32/api/psapi/nf-psapi-getprocessmemoryinfo)
- [Microsoft PROCESS_MEMORY_COUNTERS_EX](https://learn.microsoft.com/en-us/windows/win32/api/psapi/ns-psapi-process_memory_counters_ex)
- [GameMaker Windows DLL extensions](https://gamemaker.io/en/help/articles/how-to-create-dll-extensions-for-windows-games)

Source code is Apache-2.0, as identified in `telemetry_crypto.c`. Windows system
services and the separately acquired Zig compiler keep their own licenses.


Redistributed toolchain notices are registered Included Files under
`datafiles/licenses/TelemetryCrypto-*.txt`: complete MinGW COPYING, its public
domain disclaimer, and the Zig MIT notice. Preserve these files in exported
builds. They retain their original terms; the adapter source's Apache-2.0
marker does not replace third-party terms. This conservative notice bundle is
not a per-object linker inventory. No compiler executable is shipped.
