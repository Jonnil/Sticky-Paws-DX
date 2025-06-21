/// @function scr_send_pending_crash_logs()
function scr_send_pending_crash_logs()
{
	static sent_pending_crash_logs = false;
	
	if (!sent_pending_crash_logs)
	{
		
		#region /* Check for Pending Crash Logs */
		var pending_logs_folder = game_save_id + "pending_crash_logs/";
		
		if (directory_exists(pending_logs_folder) 
		&& global.online_enabled 
		&& global.send_crash_logs 
		&& os_is_network_connected(network_connect_passive))
		{
			show_debug_message("[scr_send_pending_crash_logs] Checking for pending crash logs in folder: " + pending_logs_folder);
			show_debug_message("[scr_send_pending_crash_logs] Conditions met for sending crash logs.");
			var filename = file_find_first(pending_logs_folder + "*.*", fa_none);
			
			while (filename != "")
			{
				show_debug_message("[scr_send_pending_crash_logs] Processing crash log file: " + filename);
				var full_path = pending_logs_folder + filename;
				
				#region /* Read Fields from INI File */
				show_debug_message("[scr_send_pending_crash_logs] Reading crash info from: " + full_path);
				
				ini_open(full_path);
				var ini_game = ini_read_string("Crash", "Game", "");
				var ini_version = ini_read_string("Crash", "Version", "");
				var ini_timestamp = ini_read_string("Crash", "Timestamp", "");
				ini_close();
				
				show_debug_message("[scr_send_pending_crash_logs] ini_game: " + ini_game);
				show_debug_message("[scr_send_pending_crash_logs] ini_version: " + ini_version);
				show_debug_message("[scr_send_pending_crash_logs] ini_timestamp: " + ini_timestamp);
				#endregion /* Read Fields from INI File END */
				
				#region /* Read Full Crash Log File Content Using Buffer */
				var ini_content = "";
				if (file_exists(full_path))
				{
					var buf = buffer_load(full_path);
					
					if (buf != -1)
					{
						var buf_size = buffer_get_size(buf);
						
						for (var i = 0; i < buf_size; i++)
						{
							ini_content += chr(buffer_peek(buf, i, buffer_u8));
						}
						
						buffer_delete(buf);
						show_debug_message("[scr_send_pending_crash_logs] Successfully loaded ini_content using buffer_load, length: " + string(string_length(ini_content)));
					}
					else
					{
						show_debug_message("[scr_send_pending_crash_logs] Failed to load buffer from file: " + full_path);
					}
				}
				else
				{
					show_debug_message("[scr_send_pending_crash_logs] File does not exist: " + full_path);
				}
				#endregion /* Read Full Crash Log File Content END */
				
				#region /* Create Payload and Send to Server */
				show_debug_message("[scr_send_pending_crash_logs] Creating payload for crash log: " + filename);
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
				//ds_map_add(header_map, "Host", string(global.base_url));
				
				var crash_endpoint = "https://" + string(global.base_url) + "/crashlog";
				show_debug_message("[scr_send_pending_crash_logs] Sending crash log to endpoint: " + crash_endpoint);
				
				/* Send the HTTP request asynchronously */
				var request_id = http_request(
					crash_endpoint,
					"POST",
					header_map,
					post_data
				);
				ds_map_destroy(header_map);
				show_debug_message("[scr_send_pending_crash_logs] HTTP request sent for file: " + filename + ", request id: " + string(request_id));
				
				/* Instead of deleting the file immediately, store the mapping of request_id to file path */
				ds_map_add(global.crash_requests, string(request_id), full_path);
				#endregion /* Create Payload and Send to Server END */
				
				/* Do NOT delete the file here; it will be deleted in the Async - HTTP event if sending succeeds */
				filename = file_find_next();
			}
			file_find_close();
			
			sent_pending_crash_logs = true;
		}
		#endregion /* Check for Pending Crash Logs END */
		
	}
}