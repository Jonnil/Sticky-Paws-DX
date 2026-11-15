/// Preserve callback correlation in the versioned telemetry owner.
function scr_send_pending_crash_logs_async_http(immediately = true)
{
    tlm_http(async_load);
}
