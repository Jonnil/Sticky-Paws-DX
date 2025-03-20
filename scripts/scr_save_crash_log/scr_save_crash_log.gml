function scr_save_crash_log(crash_logs_folder = "", crash_log_filename = "", game_name = "", save_date = "")
{
	
	//#region /* Send Crash Log to Server */
	//if (global.online_enabled 
	//&& global.send_crash_logs 
	//&& file_exists(crash_logs_folder + crash_log_filename)
	//&& os_is_network_connected())
	//{
	//	var full_path = crash_logs_folder + crash_log_filename;
		
	//	/* Read the entire file using buffer_load (avoiding file_text_* functions) */
	//	var ini_content = "";
		
	//	if (file_exists(full_path))
	//	{
	//		var buf = buffer_load(full_path);
			
	//		if (buf != -1)
	//		{
	//			var buf_size = buffer_get_size(buf);
				
	//			for (var i = 0; i < buf_size; i++)
	//			{
	//				ini_content += chr(buffer_peek(buf, i, buffer_u8));
	//			}
	//			buffer_delete(buf);
	//			show_debug_message("[scr_crash_error_handling] Successfully loaded ini_content from " + full_path + ", length: " + string(string_length(ini_content)));
	//		}
	//		else
	//		{
	//			show_debug_message("[scr_crash_error_handling] Failed to load buffer from file: " + full_path);
	//		}
	//	}
	//	else
	//	{
	//		show_debug_message("[scr_crash_error_handling] File does not exist: " + full_path);
	//	}
		
	//	/* Create payload using the file content and other crash info */
	//	var payload_map = ds_map_create();
	//	ds_map_add(payload_map, "game_name", game_name);
	//	ds_map_add(payload_map, "game_version", "v" + scr_get_build_date());
	//	ds_map_add(payload_map, "timestamp", save_date);
	//	ds_map_add(payload_map, "ini_content", ini_content);
	//	ds_map_add(payload_map, "crash_log_filename", crash_log_filename);
	//	var post_data = json_encode(payload_map);
	//	ds_map_destroy(payload_map);
		
	//	/* Prepare HTTP headers */
	//	var header_map = ds_map_create();
	//	ds_map_add(header_map, "Content-Type", "application/json");
	//	ds_map_add(header_map, "User-Agent", "gm_crash_logger");
	//	ds_map_add(header_map, "X-API-Key", global.api_key);
	//	ds_map_add(header_map, "Host", string(global.base_url));
		
	//	/* Build the crash endpoint URL and send the HTTP POST request */
	//	var crash_endpoint = "https://" + string(global.base_url) + "/crashlog";
	//	show_debug_message("[scr_crash_error_handling] Sending crash log to endpoint: " + crash_endpoint);
	//	var request_id = http_request(crash_endpoint, "POST", header_map, post_data);
	//	ds_map_destroy(header_map);
	//	show_debug_message("[scr_crash_error_handling] HTTP request sent for crash log: " + crash_log_filename + ", request id: " + string(request_id));
		
	//	/* Store the mapping from request id to file path so the file can be deleted upon a successful response */
	//	ds_map_add(global.crash_requests, string(request_id), full_path);
	//}
	//else
	//if (!global.online_token_validated
	//|| !os_is_network_connected())
	//{
		/* If the network or token validation is not available, move the crash log file to the pending folder */
		if (file_exists(crash_logs_folder + crash_log_filename))
		{
			var pending_folder = game_save_id + "pending_crash_logs/";
			if (!directory_exists(pending_folder))
			{
				directory_create(pending_folder);
			}
			file_copy(crash_logs_folder + crash_log_filename, pending_folder + crash_log_filename);
			switch_save_data_commit();
			show_debug_message("[scr_crash_error_handling] Copied file from " + string(crash_logs_folder) + crash_log_filename + " to " + pending_folder + crash_log_filename);
		}
	//}
	//#endregion /* Send Crash Log to Server END */
	
}