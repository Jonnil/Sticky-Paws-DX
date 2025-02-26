/// @function scr_send_pending_crash_logs()
function scr_send_pending_crash_logs()
{
	if (global.online_enabled)
	&& (global.send_crash_logs)
	&& (os_is_network_connected())
	{
		
		#region /* Check for Pending Crash Logs */
		var pending_logs_folder = game_save_id + "pending_crash_logs/";
		if (!directory_exists(pending_logs_folder))
		{
			return; /* Nothing to send */
		}
		
		var filename = file_find_first(pending_logs_folder + "*.*", fa_none);
		#endregion /* Check for Pending Crash Logs END */
		
		while (filename != "")
		{
			var full_path = pending_logs_folder + filename;
			
			#region /* Read Fields from INI File */
			/* Open the INI file to read the crash info from the [Crash] section */
			ini_open(full_path);
			var ini_game = ini_read_string("Crash", "Game", "");
			var ini_version = ini_read_string("Crash", "Version", "");
			var ini_timestamp  = ini_read_string("Crash", "Timestamp", "");
			ini_close();
			#endregion /* Read Fields from INI File END */
			
			#region /* Read Full Crash Log File Content */
			var ini_content = "";
			var ini_file = file_text_open_read(full_path);
			while (!file_text_eof(ini_file))
			{
				ini_content += file_text_read_string(ini_file) + "\n";
			}
			file_text_close(ini_file);
			#endregion /* Read Full Crash Log File Content END */
			
			#region /* Create Payload and Send to Server */
			var payload_map = ds_map_create();
			ds_map_add(payload_map, "game_name", ini_game);
			ds_map_add(payload_map, "game_version", ini_version);
			ds_map_add(payload_map, "timestamp", ini_timestamp);
			ds_map_add(payload_map, "ini_content", ini_content);
			ds_map_add(payload_map, "crash_log_filename", filename);
			var post_data = json_encode(payload_map);
			ds_map_destroy(payload_map);
			
			var header_map = ds_map_create();
			ds_map_add(header_map, "Content-Type", "application/json");
			ds_map_add(header_map, "User-Agent", "gm_crash_logger");
			ds_map_add(header_map, "X-API-Key", global.api_key);
			ds_map_add(header_map, "Host", string(global.base_url));
			
			var crash_endpoint = "https://" + string(global.base_url) + "/crashlog";
			var request_id = http_request(crash_endpoint, "POST", header_map, post_data);
			ds_map_destroy(header_map);
			#endregion /* Create Payload and Send to Server END */
			
			/* Delete Sent Crash Log File */
			file_delete(full_path);
			
			filename = file_find_next();
		}
		file_find_close();
		
		#region /* Delete Pending Folder If Empty */
		/* Check for any remaining files */
		var test_file = file_find_first(pending_logs_folder + "*.*", fa_none);
		if (test_file == "")
		{
			/* Folder is empty, so delete it */
			directory_destroy(pending_logs_folder);
		}
		else
		{
			file_find_close();
		}
		#endregion /* Delete Pending Folder If Empty END */
		
	}
}