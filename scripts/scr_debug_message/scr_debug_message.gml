/// @function scr_debug_message(msg)
/// @desc Backwards-compatible bridge for legacy show_debug_message calls.
/// Routes messages through scr_log with best-effort parsing of module/level.
function scr_debug_message(msg)
{
    var _raw = string(msg);

    // Remove a trailing newline if present
    if (string_length(_raw) > 0)
    {
        var _last = string_copy(_raw, string_length(_raw), 1);
        if (_last == "\n")
        {
            _raw = string_copy(_raw, 1, string_length(_raw) - 1);
        }
    }

    var _module = "APP";
    var _details = _raw;
    var _upper = string_upper(_raw);
    var _level = "INFO";

    // Heuristic: if message starts with [MODULE]
    if (string_pos("[", _raw) == 1)
    {
        var _rb = string_pos("]", _raw);
        if (_rb > 1)
        {
            _module = string_upper(string_copy(_raw, 2, _rb - 2));
            _details = string_copy(_raw, _rb + 1, string_length(_raw));
        }
    }

    // Heuristic level detection
    if (string_pos("ERROR", _upper) > 0)
    {
        _level = "ERROR";
    }
    else if (string_pos("WARNING", _upper) > 0 || string_pos("WARN", _upper) > 0 || string_pos("IMPORTANT", _upper) > 0)
    {
        _level = "WARN";
    }
    else if (string_pos("DEBUG", _upper) > 0 || string_pos("TRACE", _upper) > 0)
    {
        _level = "DEBUG";
    }

    // Route through unified logger
    scr_log(_level, _module, "legacy", string(_details));
}

