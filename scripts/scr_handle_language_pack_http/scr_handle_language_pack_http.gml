/// @function scr_handle_language_pack_http(_async_map, var_handle_redirects)
/// @description Handles the HTTP responses for language pack downloads.
function scr_handle_language_pack_http(_async_map, var_handle_redirects = true)
{
	var allow_without_online_enabled = global.language_update_allow_without_online_enabled;

	if ((global.online_enabled
	|| allow_without_online_enabled)
	&& global.online_token_validated)
	{
		var req_id = ds_map_find_value(_async_map, "id");
		var is_manifest = (req_id == global.language_http_request_id);
		var is_lang_file = (variable_global_exists("language_file_requests")
			&& ds_exists(global.language_file_requests, ds_type_map)
			&& ds_map_exists(global.language_file_requests, string(req_id)));

		if (!(is_manifest
		|| is_lang_file))
		{
			return;
		}

		var transfer_status = ds_map_find_value(_async_map, "status");
		var http_status = ds_map_find_value(_async_map, "http_status");
		var result = ds_map_find_value(_async_map, "result");

		if (transfer_status == 1)
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

		scr_log("INFO", "HTTP.LANG", "http_status", "http_status=" + string(http_status));

		#region /* ---------- Handle Manifest Download ---------- */
		if (req_id == global.language_http_request_id)
		{
			/* Handle redirects */
			if (((http_status == 0)
			&& (string_pos("<HTML", result) > 0))
			|| (http_status >= 300
			&& http_status < 400))
			{
				scr_log("DEBUG", "HTTP.LANG", "handle_redirects", "enabled=" + string(var_handle_redirects));

				if (var_handle_redirects)
				{
					var new_request_id = scr_handle_redirect(result, _async_map);
						scr_log("DEBUG", "HTTP.LANG", "redirect_attempt",
							"http_status=" + string(http_status) +
							", html_marker_pos=" + string(string_pos("<HTML", result)) +
							", new_request_id=" + string(new_request_id));

					if (new_request_id != -1)
					{
						global.language_http_request_id = new_request_id;
						scr_log("INFO", "HTTP.LANG", "follow_redirect", "request_id=" + string(new_request_id));
						return;
					}
					else
					{
						/* FALLBACK */
						scr_log("WARN", "HTTP.LANG", "redirect_invalid_fallback", "action=scr_download_language_pack_from_server");
						scr_download_language_pack_from_server();
						return;
					}
				}
			}

			if (http_status == 0)
			&& (string_length(result) == 0)
			&& (allow_without_online_enabled)
			{
				scr_log("ERROR", "HTTP.LANG", "manifest_network_failed", "http_status=0");
				scr_invalidate_online_session("language_manifest_http_status_0", "scr_handle_language_pack_http");

				if (variable_instance_exists(self, "menu"))
				{
					scr_route_network_async_failure_to_menu(true);
				}

				return;
			}

			if (!(http_status == 0
			|| http_status == 200))
			{
				scr_log("ERROR", "HTTP.LANG", "manifest_bad_status", "http_status=" + string(http_status));
				scr_log("DEBUG", "HTTP.LANG", "hint", "4xx_may_indicate_malformed_url_or_headers");
				global.language_update_status_message = "Manifest error: Server responded with incorrect status. Please try again";
				global.language_update_status_color = c_red;
				global.language_http_request_id = -1;
				global.language_update_allow_without_online_enabled = false;
				return;
			}
			
			/* Process CSV manifest */
			global.language_last_update_string = scr_format_timestamp(date_current_datetime());
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("language_updates", "language_last_update_real", date_current_datetime());
			ini_write_string("language_updates", "language_last_update_string", global.language_last_update_string);
			ini_close();
			
			scr_log("INFO", "HTTP.LANG", "manifest_processed",
				"http_status=" + string(http_status) +
				", last_update_string=" + string(global.language_last_update_string) +
				", last_update_real=" + string(date_current_datetime()));
			
			scr_process_language_file("all", result);
			
			global.language_update_status_message = "Your translations are now up to date!";
			global.language_update_status_color = c_lime;
			global.language_http_request_id = -1;
			global.language_update_allow_without_online_enabled = false;
			return;
		}
		#endregion /* ---------- Handle Manifest Download ---------- END */
		
		else
		
		#region /* ---------- Handle Individual Language File Downloads ---------- */
		if (variable_global_exists("language_file_requests")
		&& ds_map_exists(global.language_file_requests, string(req_id)))
		{
			var lang_name = ds_map_find_value(global.language_file_requests, string(req_id));
			
			if (transfer_status == 1)
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
			
			if (!(http_status == 0
			|| http_status == 200))
			{
				scr_log("ERROR", "HTTP.LANG", "language_file_bad_status", "lang=" + lang_name + ", http_status=" + string(http_status));
				scr_log("DEBUG", "HTTP.LANG", "hint", "non_200_might_indicate_malformed_url_or_headers");
				ds_map_delete(global.language_file_requests, string(req_id));
				global.language_update_status_message = "Error: Failed to download language file";
				global.language_update_status_color = c_red;
				global.language_update_allow_without_online_enabled = false;
				return;
			}

			if (http_status == 0)
			&& (string_length(result) == 0)
			&& (allow_without_online_enabled)
			{
				scr_log("ERROR", "HTTP.LANG", "language_file_network_failed", "lang=" + lang_name + ", http_status=0");
				scr_invalidate_online_session("language_file_http_status_0", "scr_handle_language_pack_http");

				if (variable_instance_exists(self, "menu"))
				{
					scr_route_network_async_failure_to_menu(true);
				}

				return;
			}
			
			scr_process_language_file(lang_name, result);
			scr_log("INFO", "HTTP.LANG", "language_file_processed", "lang=" + lang_name + ", http_status=" + string(http_status));
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
				global.language_update_allow_without_online_enabled = false;
				scr_log("INFO", "HTTP.LANG", "all_language_files_downloaded",
					"last_update_string=" + string(global.language_last_update_string) +
					", last_update_real=" + string(date_current_datetime()));
			}
		}
		#endregion /* ---------- Handle Individual Language File Downloads ---------- END */
		
	}
}
