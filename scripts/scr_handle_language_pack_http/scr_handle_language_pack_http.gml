/// @function scr_handle_language_pack_http(_async_map, var_handle_redirects)
/// @description Handles the HTTP responses for language pack downloads.
function scr_handle_language_pack_http(_async_map, var_handle_redirects = true)
{
	if (global.online_enabled
	&& global.online_token_validated)
	{
		var req_id = ds_map_find_value(_async_map, "id");
		var status = ds_map_find_value(_async_map, "status");
		var result = ds_map_find_value(_async_map, "result");
		
		/* If status is 1 (pending), update message and exit */
		if (status == 1)
		{
			global.language_update_status_message = "Fetching latest language pack data from server...";
			
			if (variable_instance_exists(self, "c_menu_fill"))
			{
				global.language_update_status_color = c_menu_fill;
			}
			else
			{
				global.language_update_status_color = c_white;
			}
			
			return;
		}
		
		var message_result = "";
		var result_truncate_number = 4000;
		
		if (string_length(result) > result_truncate_number)
		{
			message_result = string_copy(result, 1, result_truncate_number) + "...(truncated)";
		}
		else
		{
			message_result = result;
		}
		
		show_debug_message("[scr_handle_language_pack_http] HTTP status: " + string(status) + "\n");
		
		#region /* ---------- Handle Manifest Download ---------- */
		if (req_id == global.language_http_request_id)
		{
			/* Handle redirects (if the result appears to be HTML) */
			if (((status == 0)
			&& (string_pos("<HTML", result) > 0))
			|| (status >= 300
			&& status < 400))
			{
				show_debug_message("[scr_handle_language_pack_http] var_handle_redirects = " + string(var_handle_redirects));
				
				if (var_handle_redirects)
				{
					/* Attempt the redirect */
					var new_request_id = scr_handle_redirect(result, _async_map);
					show_debug_message("[scr_handle_language_pack_http] status = " + string(status) + 
									   ", string_pos(\"<HTML\", result) = " + string(string_pos("<HTML", result)) + 
									   ", new_request_id = " + string(new_request_id));
					
					if (new_request_id != -1)
					{
						/* If redirect was valid, store the new ID and wait for next async */
						global.language_http_request_id = new_request_id;
						show_debug_message("[scr_handle_language_pack_http] global.language_http_request_id = new_request_id (" 
											+ string(new_request_id) + ")");
						return;
					}
					else
					{
						/* FALLBACK: If redirect was invalid, call scr_download_language_pack_from_server() */
						show_debug_message("[scr_handle_language_pack_http] ERROR: Redirect invalid. Falling back to scr_download_language_pack_from_server().");
						scr_download_language_pack_from_server();
						return;
					}
				}
			}
			
			if (!(status == 0
			|| status == 200))
			{
				show_debug_message("[scr_handle_language_pack_http] Error: Manifest request returned status " + string(status));
				show_debug_message("[scr_handle_language_pack_http] NOTE: A 400-level error may indicate a malformed URL or missing/incorrect request headers.\n");
				global.language_update_status_message = "Manifest error: Server responded with incorrect status. Please try again";
				global.language_update_status_color = c_red;
				return;
			}
			
			/* Process CSV manifest */
			global.language_last_update_string = scr_format_timestamp(date_current_datetime());
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("language_updates", "language_last_update_real", date_current_datetime());
			ini_write_string("language_updates", "language_last_update_string", global.language_last_update_string);
			ini_close();
			
			show_debug_message("[scr_handle_language_pack_http] HTTP status: " + string(status) + ", Processing CSV manifest. language_last_update_string = " 
				+ string(global.language_last_update_string) + " language_last_update_real = " + string(date_current_datetime()) + "\n");
			
			scr_process_language_file("all", result);
			
			global.language_update_status_message = "Your translations are now up to date!";
			global.language_update_status_color = c_lime;
			return;
		}
		#endregion /* ---------- Handle Manifest Download ---------- END */
		
		else
		
		#region /* ---------- Handle Individual Language File Downloads ---------- */
		if (variable_global_exists("language_file_requests")
		&& ds_map_exists(global.language_file_requests, string(req_id)))
		{
			var lang_name = ds_map_find_value(global.language_file_requests, string(req_id));
			
			if (status == 1)
			{
				global.language_update_status_message = "Fetching latest language pack data from server...";
				
				if (variable_instance_exists(self, "c_menu_fill"))
				{
					global.language_update_status_color = c_menu_fill;
				}
				else
				{
					global.language_update_status_color = c_white;
				}
				
				return;
			}
			
			if (!(status == 0
			|| status == 200))
			{
				show_debug_message("[scr_handle_language_pack_http] Error: Download for language '" + lang_name + "' failed with status " + string(status));
				show_debug_message("[scr_handle_language_pack_http] NOTE: A non-200 status might result from a malformed URL or missing/incorrect request headers.\n");
				ds_map_delete(global.language_file_requests, string(req_id));
				global.language_update_status_message = "Error: Failed to download language file";
				global.language_update_status_color = c_red;
				return;
			}
			
			scr_process_language_file(lang_name, result);
			show_debug_message("[scr_handle_language_pack_http] HTTP status: " + string(status) + ", Successfully processed language file for '" + lang_name + "'.");
			ds_map_delete(global.language_file_requests, string(req_id));
			
			if (ds_map_size(global.language_file_requests) == 0)
			{
				ds_map_destroy(global.language_file_requests);
				global.language_file_requests = undefined;
				
				global.language_last_update_string = scr_format_timestamp(date_current_datetime());
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("language_updates", "language_last_update_real", date_current_datetime());
				ini_write_string("language_updates", "language_last_update_string", global.language_last_update_string);
				ini_close();
				
				global.language_update_status_message = "Your translations are now up to date!";
				global.language_update_status_color = c_green;
				show_debug_message("[scr_handle_language_pack_http] All language files downloaded successfully! language_last_update_string = " 
					+ string(global.language_last_update_string) + " language_last_update_real = " + string(date_current_datetime()) + "\n");
			}
		}
		#endregion /* ---------- Handle Individual Language File Downloads ---------- END */
		
	}
}