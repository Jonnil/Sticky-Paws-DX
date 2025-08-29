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

		/* Change to a fallback menu or display an error message */
		menu = "server_timeout_retry"; /* Make sure your menu system handles this state */

		/* Clear any data that was supposed to be loaded */
		in_online_download_list_menu = false; show_debug_message("[scr_server_timeout] 'In online download list menu' is set to false");
		//online_content_data = undefined; show_debug_message("[scr_server_timeout] 'online content data' is set to undefined");
		//info_data = undefined;

		/* Reset the timeout variable so subsequent requests can start a new timer */
		global.server_timeout_end = undefined;
	}
}
