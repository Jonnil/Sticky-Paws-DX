/// Compatibility entry point. The serialized telemetry owner is stepped once.
/// Legacy pending_crash_logs are local review/export/delete only.
function scr_send_pending_crash_logs()
{
    return false;
}
