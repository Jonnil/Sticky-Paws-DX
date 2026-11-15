/// Authored build mapping. No runtime/user names become registry entries.
function tlm_frame_registry()
{
    static _loaded = false;
    static _registry = undefined;
    if (!_loaded)
    {
        _loaded = true;
        if (os_type != os_windows) return undefined;
        var _bytes = tlm_native_read("telemetry_frames.json", 262144);
        if (string_byte_length(_bytes) != 153320) return undefined;
        var _digests = ["d0ec5aeac3fbe96dabf65130a06c1e3f228cd52c3da56c0cd5b273d748b0c309","f8a4b7933e5fa0c2c9879de194b230b576df324f5fa0c2a98cf2c9601b41a34c","89be1267b06419655c5a13d2e7c8efa6ac2e60362ae3ac6fea0d9468cc8f6dee"];
        var _parsed = undefined;
        try
        {
            // Only this exact authored ASCII artifact uses direct native hashing
            // and parsing. Length plus every SHA-256 pin authenticate its bytes.
            // A NUL/truncation or changed UTF-8 chunk cannot match those pins.
            for (var _part = 0; _part < array_length(_digests); _part++)
                if (tlm_native_sha256(string_copy(_bytes, _part * 60000 + 1, 60000)) != _digests[_part]) return undefined;
            _parsed = json_parse(_bytes, undefined, true);
        }
        catch (_invalid_authored_artifact) { return undefined; }
        if (!is_struct(_parsed) || tlm_get(_parsed,"schema",0) != 1
            || tlm_get(_parsed,"game_build","") != "sp-telemetry-v1-dev") return undefined;
        _registry = _parsed;
    }
    return _registry;
}

function tlm_authored_frames_ready(_build)
{
    var _registry = tlm_frame_registry();
    return is_struct(_registry) && _build == _registry.game_build;
}

function tlm_authored_frame(_resource, _ev = undefined, _line = undefined)
{
    var _registry = tlm_frame_registry();
    if (!is_struct(_registry) || !is_string(_resource)
        || !variable_struct_exists(_registry.resources, _resource)) return false;
    if (!is_undefined(_ev) && (!is_string(_ev)
        || !tlm_member(_ev, variable_struct_get(_registry.resources, _resource)))) return false;
    if (!is_undefined(_line) && !tlm_int(_line, 1, 1000000)) return false;
    return true;
}

/// Parse only an allowed crash's optional frames. Exact authored symbol lookup;
/// raw messages, arguments, stack arrays and source text are never serialized.
function scr_telemetry_safe_frames(_stack)
{
    if (!tlm_is_ready() || !tlm_capture_allowed() || !tlm_field_allowed("error.frames")) return undefined;
    var _registry = tlm_frame_registry();
    if (!is_struct(_registry) || !is_array(_stack)) return undefined;
    var _frames = [];
    for (var _i = 0; _i < min(array_length(_stack), 16); _i++)
    {
        var _raw = _stack[_i];
        if (!is_string(_raw) || string_length(_raw) > 1024) continue;
        var _marker = string_pos(" (line ", _raw);
        var _symbol = _marker > 0 ? string_copy(_raw, 1, _marker - 1) : _raw;
        if (!variable_struct_exists(_registry.symbols, _symbol)) continue;
        var _known = variable_struct_get(_registry.symbols, _symbol);
        var _frame = {resource:_known.resource};
        if (tlm_has(_known, "event")) _frame.event = _known.event;
        if (_marker > 0)
        {
            var _rest = string_copy(_raw, _marker + 7, 8);
            var _end = string_pos(")", _rest);
            if (_end > 1 && _end <= 8)
            {
                var _number = string_copy(_rest, 1, _end - 1);
                var _digits = true;
                for (var _n = 1; _n <= string_length(_number); _n++)
                    if (string_pos(string_char_at(_number, _n), "0123456789") == 0) _digits = false;
                if (_digits)
                {
                    var _line = real(_number);
                    if (tlm_int(_line, 1, 1000000)) _frame.line = _line;
                }
            }
        }
        if (tlm_authored_frame(_frame.resource, tlm_get(_frame,"event"), tlm_get(_frame,"line"))) array_push(_frames, _frame);
    }
    return array_length(_frames) > 0 ? _frames : undefined;
}
