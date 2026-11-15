/// Register once after bootstrap. Raw exception contents are never persisted,
/// printed, attached, used in filenames or sent to documentation websites.
function scr_crash_error_handling()
{
    if (os_type == os_switch) return;
    exception_unhandled_handler(function(_exception)
    {
        try
        {
            var _frames = undefined;
            if (tlm_is_ready() && tlm_capture_allowed() && tlm_field_allowed("error.frames")
                && is_struct(_exception) && variable_struct_exists(_exception, "stacktrace"))
                _frames = scr_telemetry_safe_frames(_exception.stacktrace);
            tlm_capture_crash("unclassified", scr_telemetry_game_context(), _frames);
            tlm_shutdown();
        }
        catch (_reporter_failure)
        {
            // No recursive report or raw diagnostic fallback.
        }
        show_message("Sticky Paws encountered an error. Error code: unclassified. "
            + "No unrestricted crash dump was created. Diagnostic choices apply. "
            + "After restarting, open Options > Telemetry Data to inspect retained data "
            + "or Information > About > Privacy Policy for the offline explanation.");
        return 1; // Explicit terminal handler exit code; no later producer runs.
    });
}

/// Explicit authored mapping, queried only for a permitted crash capture.
/// Room names, arbitrary globals and custom-content labels are never serialized.
function scr_telemetry_game_context()
{
    if (!tlm_is_ready() || !tlm_capture_allowed()) return undefined;
    var _context = {};
    if (tlm_field_allowed("context.mode"))
    {
        if (room == rm_leveleditor) _context.mode = "editor";
        else if (room == rm_world) _context.mode = "play";
        else if (room == rm_title || room == rm_pause || room == rm_splash_screen)
            _context.mode = "menu";
    }
    if (tlm_field_allowed("context.content_origin")
        && (room == rm_title || room == rm_splash_screen))
        _context.content_origin = "none";
    return _context;
}

function scr_crash_dialog_message(_crash_log_display_path, _crash_details)
{
    // Old arguments may contain private information; they are deliberately unused.
    return "Sticky Paws encountered an error. Error code: unclassified. "
        + "Open Options > Telemetry Data after restarting.";
}

function scr_debug_preview_crash_message()
{
    show_message("PREVIEW ONLY. No crash occurred and no diagnostic file or request was created. "
        + "Error code: unclassified. Open Options > Telemetry Data for diagnostic choices.");
}
