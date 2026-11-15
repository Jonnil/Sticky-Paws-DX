// SPDX-License-Identifier: Apache-2.0
// GameMaker Windows x64 adapter. Strings are UTF-8 bytes from the calling VM.
// Returned storage is valid until the next call to the same function.
// No files, logs, process identifiers or fallback PRNG are used.
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <bcrypt.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#define PSAPI_VERSION 1
#include <psapi.h>

#define TLM_EXPORT __declspec(dllexport)
#define TLM_HASH_MAX_BYTES 65536u

static void tlm_hex(const unsigned char *bytes, size_t length, char *out) {
    static const char digits[] = "0123456789abcdef";
    for (size_t i = 0; i < length; ++i) {
        out[2 * i] = digits[bytes[i] >> 4];
        out[2 * i + 1] = digits[bytes[i] & 15];
    }
    out[2 * length] = '\0';
}

TLM_EXPORT const char *tlm_native_secure_id(void) {
    static char result[33];
    unsigned char random_bytes[16];
    result[0] = '\0';
    if (BCryptGenRandom(NULL, random_bytes, sizeof(random_bytes),
                        BCRYPT_USE_SYSTEM_PREFERRED_RNG) < 0) {
        SecureZeroMemory(random_bytes, sizeof(random_bytes));
        return result;
    }
    tlm_hex(random_bytes, sizeof(random_bytes), result);
    SecureZeroMemory(random_bytes, sizeof(random_bytes));
    return result;
}

TLM_EXPORT const char *tlm_native_sha256(const char *utf8) {
    static char result[65];
    BCRYPT_ALG_HANDLE algorithm = NULL;
    BCRYPT_HASH_HANDLE hash = NULL;
    unsigned char digest[32];
    size_t length = 0;
    int success = 0;
    result[0] = '\0';
    if (utf8 == NULL) return result;
    while (length <= TLM_HASH_MAX_BYTES && utf8[length] != '\0') ++length;
    if (length > TLM_HASH_MAX_BYTES) return result;
    if (BCryptOpenAlgorithmProvider(&algorithm, BCRYPT_SHA256_ALGORITHM,
                                    NULL, 0) < 0) goto cleanup;
    // Windows 7+ allocates hash-object storage and frees it on DestroyHash.
    if (BCryptCreateHash(algorithm, &hash, NULL, 0, NULL, 0, 0) < 0)
        goto cleanup;
    if (BCryptHashData(hash, (PUCHAR)utf8, (ULONG)length, 0) < 0)
        goto cleanup;
    if (BCryptFinishHash(hash, digest, sizeof(digest), 0) < 0)
        goto cleanup;
    success = 1;
cleanup:
    if (hash != NULL) BCryptDestroyHash(hash);
    if (algorithm != NULL) BCryptCloseAlgorithmProvider(algorithm, 0);
    if (success) tlm_hex(digest, sizeof(digest), result);
    SecureZeroMemory(digest, sizeof(digest));
    return result;
}


// Only the coarse client family leaves this adapter. Unknown/server versions
// are omitted rather than guessed. This is not a feature-availability test.
TLM_EXPORT const char *tlm_native_os_release(void) {
    typedef LONG (WINAPI *tlm_rtl_get_version)(OSVERSIONINFOEXW *);
    HMODULE ntdll = GetModuleHandleW(L"ntdll.dll");
    if (ntdll == NULL) return "";
    FARPROC address = GetProcAddress(ntdll, "RtlGetVersion");
    tlm_rtl_get_version get_version = NULL;
    _Static_assert(sizeof(get_version) == sizeof(address), "Windows function pointer size" );
    memcpy(&get_version, &address, sizeof(get_version));
    if (get_version == NULL) return "";
    OSVERSIONINFOEXW version = {0};
    version.dwOSVersionInfoSize = sizeof(version);
    if (get_version(&version) < 0 || version.dwMajorVersion != 10 ||
        version.dwMinorVersion != 0 || version.wProductType != VER_NT_WORKSTATION)
        return "";
    return version.dwBuildNumber >= 22000 ? "windows_11" : "windows_10";
}

// Process-private committed memory, not installed RAM or the working set.
// Round to the nearest64MiB before returning; never expose process identity.
TLM_EXPORT double tlm_native_memory_mib(void) {
    PROCESS_MEMORY_COUNTERS_EX memory = {0};
    memory.cb = sizeof(memory);
    if (!GetProcessMemoryInfo(GetCurrentProcess(),
            (PROCESS_MEMORY_COUNTERS *)&memory, sizeof(memory))) return -1.0;
    const uint64_t bytes = (uint64_t)memory.PrivateUsage;
    const uint64_t quantum = 64ull * 1024ull * 1024ull;
    if (bytes > 1048576ull * 1024ull * 1024ull) return -1.0;
    return (double)(((bytes + quantum / 2) / quantum) * 64ull);
}


// UTC Unix seconds for local expiry/backoff bookkeeping only. It is never
// incorporated into a report ID and does not change GameMaker timezone state.
TLM_EXPORT double tlm_native_now(void) {
    FILETIME time;
    ULARGE_INTEGER ticks;
    GetSystemTimeAsFileTime(&time);
    ticks.LowPart = time.dwLowDateTime;
    ticks.HighPart = time.dwHighDateTime;
    const uint64_t unix_epoch = 116444736000000000ull;
    if (ticks.QuadPart < unix_epoch) return -1.0;
    return (double)((ticks.QuadPart - unix_epoch) / 10000000ull);
}

