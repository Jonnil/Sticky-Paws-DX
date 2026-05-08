/// @function scr_server_timeout(timeout_seconds)
/// @param timeout_seconds The number of seconds to wait before timing out.
function scr_server_timeout(timeout_seconds = 15)
{
	/* If no timeout is set, record the future time when the timeout should occur */
	/* current_time returns milliseconds, so multiply timeout_seconds by 1000 */
	if (global.server_timeout_end == undefined)
	{
		global.server_timeout_end = current_time + (timeout_seconds * 1000);
		show_debug_message("[scr_server_timeout] Server timeout end set to: " + string(global.server_timeout_end));
	}
	/* Otherwise, if the current time has passed the recorded timeout end... */
	else
	if (current_time >= global.server_timeout_end)
	{
		/* Timeout Handler */
		show_debug_message("[scr_server_timeout] Server request timed out");
		scr_log("WARN", "LANG.UPDATE", "release_block_on_server_timeout", "request_id=" + string(global.online_primary_request_active));

		scr_invalidate_online_session("server_timeout", "scr_server_timeout");

		if (variable_instance_exists(self, "menu"))
		{
			scr_route_network_async_failure_to_menu(true);
		}
	}
}
