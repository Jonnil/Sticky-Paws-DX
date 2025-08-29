function scr_send_pending_crash_logs_async_http(immediately = true)
{
	if (immediately)
	{

		#region /* Send Crash Log to Server Immediately */
		var req_id = async_load[?"id"];  /* HTTP request id from the response */

		if (ds_map_exists(global.crash_requests, string(req_id)))
		{
			var file_path = ds_map_find_value(global.crash_requests, string(req_id));
			var status = async_load[?"status"];

			if (status == 0
			|| status == 200)
			{
				show_debug_message("[scr_crash_error_handling] Crash log sent successfully, request id: " + string(req_id) + ", status: " + string(status));
				/* The crash log should not be deleted when sending immediately when it's in the normal crash log */
			}
			else
			{
				show_debug_message("[scr_crash_error_handling] Crash log failed to send, request id: " + string(req_id) + ", status: " + string(status));
			}

			ds_map_delete(global.crash_requests, string(req_id));
		}
		#endregion /* Send Crash Log to Server Immediately END */

	}
	else
	if (!immediately)
	{

		#region /* Send Pending Crash Logs to Server */
		var req_id = async_load[?"id"];  /* HTTP request id from the response */

		/* Check if this request id exists in our crash_requests map */
		if (ds_map_exists(global.crash_requests, string(req_id)))
		{
			var file_path = ds_map_find_value(global.crash_requests, string(req_id));
			var status = async_load[?"status"];

			if (status == 0
			|| status == 200)
			{
				show_debug_message("[scr_send_pending_crash_logs] Crash log sent successfully, request id: " + string(req_id) + ", status: " + string(status));
				/* Delete the crash log file since it was sent successfully */
				file_delete(file_path);
				show_debug_message("[scr_send_pending_crash_logs] Deleted crash log file: " + file_path);
			}
			else
			{
				show_debug_message("[scr_send_pending_crash_logs] Crash log failed to send, request id: " + string(req_id) + ", status: " + string(status));
				/* Keep the file for later retry */
			}

			/* Remove the mapping for this request id */
			ds_map_delete(global.crash_requests, string(req_id));

			/* Check if the pending folder is now empty, and if so, delete it */
			var pending_logs_folder = game_save_id + "pending_crash_logs/";
			var test_file = file_find_first(pending_logs_folder + "*.*", fa_none);

			if (test_file == "")
			{
				show_debug_message("[scr_send_pending_crash_logs] No remaining files found. Deleting pending folder: " + pending_logs_folder);
				directory_destroy(pending_logs_folder);
			}
			else
			{
				file_find_close();
			}
		}
		#endregion /* Send Pending Crash Logs to Server END */

	}
}
