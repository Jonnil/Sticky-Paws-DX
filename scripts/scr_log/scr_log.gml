/// @function scr_log(level, module, message, details)
/// @desc Unified logging helper. Emits: "[MODULE] [LEVEL] message [details]"
/// - level: string like "INFO", "WARN", "ERROR", "DEBUG" (case-insensitive)
/// - module: short area tag, e.g., "HTTP", "HTTP.LANG", "THUMBNAILS"
/// - message: concise message in lower_snake_case
/// - details: optional string appended as-is (avoid secrets)
function scr_log(level, module, message, details = "")
{
    var _lvl = string_upper(string(level));
    var _mod = string_upper(string(module));
    var _msg = string(message);

    var out = "[" + _mod + "] [" + _lvl + "] " + _msg;

    if (is_string(details) && details != "")
    {
        out += " " + details;
    }

    show_debug_message(out);
}

