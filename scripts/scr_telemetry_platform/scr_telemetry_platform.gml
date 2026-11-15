/// Windows x64 native adapter. Other targets fail closed without fallback IDs.
function tlm_platform_secure_id()
{
    if (os_type != os_windows) return "";
    try { return tlm_native_secure_id(); }
    catch (_crypto_failure) { return ""; }
}

function tlm_platform_sha256(_utf8)
{
    if (os_type != os_windows || !is_string(_utf8)) return "";
    var _size = string_byte_length(_utf8);
    if (_size > 65536) return "";
    for (var _at = 1; _at <= _size; _at++)
        if (string_byte_at(_utf8, _at) == 0) return "";
    try { return tlm_native_sha256(_utf8); }
    catch (_crypto_failure) { return ""; }
}

/// Local bookkeeping only. Not a client measurement in outgoing JSON.
function tlm_platform_now()
{
    if (os_type != os_windows) return -1;
    try { return tlm_native_now(); }
    catch (_clock_failure) { return -1; }
}

/// Call only after the serialized owner grants the individual field.
function tlm_platform_os_release()
{
    if (os_type != os_windows) return "";
    try { return tlm_native_os_release(); }
    catch (_measurement_failure) { return ""; }
}

function tlm_platform_memory_mib()
{
    if (os_type != os_windows) return -1;
    try { return tlm_native_memory_mib(); }
    catch (_measurement_failure) { return -1; }
}
