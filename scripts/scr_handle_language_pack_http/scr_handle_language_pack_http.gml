/// @function scr_handle_language_pack_http(_async_map)
/// @description Handles the HTTP responses for language pack downloads.
function scr_handle_language_pack_http(_async_map)
{
	var req_id   = ds_map_find_value(_async_map, "id");
	var status   = ds_map_find_value(_async_map, "status");
	var result   = ds_map_find_value(_async_map, "result");
	
	/* If status is 1 (pending), update the in-progress message and exit */
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
	
	show_debug_message("[scr_handle_language_pack_http] HTTP status: " + string(status));
	if (global.translation_debug)
	{
		show_debug_message("[scr_handle_language_pack_http] result: " + string(result));
	}
	
	/* ---------- Handle Manifest Download ---------- */
	if (req_id == global.language_http_request_id)
	{
		if (!(status == 0
		|| status == 200))
		{
			show_debug_message("[scr_handle_language_pack_http] Error: Manifest request returned status " + string(status));
			global.language_update_status_message = "Manifest error: Server responded with status " + string(status) + ". Please try again.";
			global.language_update_status_color = c_red;
			return;
		}
		
		/* Check if the manifest is CSV by looking at its header */
		if (string_copy(result, 1, 5) == "Code,")
		{
			/* Set the timestamp for "last updated" */
			global.language_last_update_string = scr_format_timestamp(date_current_datetime());
			
			/* Also store in config file */
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("language_updates", "language_last_update_real", date_current_datetime());
			ini_write_string("language_updates", "language_last_update_string", global.language_last_update_string);
			ini_close();
			
			show_debug_message("[scr_handle_language_pack_http] Detected CSV manifest. language_last_update_string = " + string(global.language_last_update_string) + " language_last_update_real = " + string(date_current_datetime()));
			scr_process_language_file("all", result);
			
			global.language_update_status_message = "Language pack update complete: CSV manifest applied.";
			global.language_update_status_color = c_lime;
			return;
		}
		else
		{
			var json_data = json_parse(result);
			
			if (is_undefined(json_data))
			{
				show_debug_message("[scr_handle_language_pack_http] Error: Failed to parse JSON manifest.");
				global.language_update_status_message = "Manifest error: Could not parse JSON data.";
				global.language_update_status_color = c_red;
				return;
			}
			
			if (!json_data.languages)
			{
				show_debug_message("[scr_handle_language_pack_http] Error: JSON manifest missing 'languages' array.");
				global.language_update_status_message = "Manifest error: No languages found in update manifest.";
				global.language_update_status_color = c_red;
				return;
			}
			
			var languages_array = json_data.languages;
			
			if (array_length(languages_array) == 0)
			{
				show_debug_message("[scr_handle_language_pack_http] Warning: No languages in JSON manifest.");
				global.language_update_status_message = "Manifest warning: No languages available in update.";
				global.language_update_status_color = c_red;
				return;
			}
			
			if (!variable_global_exists("language_file_requests") || global.language_file_requests == undefined)
			{
				global.language_file_requests = ds_map_create();
			}
			
			for (var i = 0; i < array_length(languages_array); i++)
			{
				var lang_entry  = languages_array[i];
				var lang_name   = lang_entry.name;
				var file_url	= lang_entry.file_url;
				var file_req_id = http_get(file_url);
				ds_map_add(global.language_file_requests, string(file_req_id), lang_name);
				show_debug_message("[scr_handle_language_pack_http] Initiated download for language '" + lang_name + "' (Request ID: " + string(file_req_id) + ").");
			}
			global.language_http_request_id = -1;
		}
	}
	
	else
	
	/* ---------- Handle Individual Language File Downloads ---------- */
	if (variable_global_exists("language_file_requests")
	&& ds_map_exists(global.language_file_requests, string(req_id)))
	{
		var lang_name = ds_map_find_value(global.language_file_requests, string(req_id));
		
		/* If status is 1 (pending) for a file download, update message and exit */
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
			ds_map_delete(global.language_file_requests, string(req_id));
			global.language_update_status_message = "Error: Failed to download language file for " + lang_name + ".";
			global.language_update_status_color = c_red;
			return;
		}
		
		scr_process_language_file(lang_name, result);
		show_debug_message("[scr_handle_language_pack_http] Successfully processed language file for '" + lang_name + "'.");
		ds_map_delete(global.language_file_requests, string(req_id));
		
		if (ds_map_size(global.language_file_requests) == 0)
		{
			ds_map_destroy(global.language_file_requests);
			global.language_file_requests = undefined;
			
			/* Set the timestamp for "last updated" once all files are done */
			global.language_last_update_string = scr_format_timestamp(date_current_datetime());
			
			/* Also store in config file */
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("language_updates", "language_last_update_real", date_current_datetime());
			ini_write_string("language_updates", "language_last_update_string", global.language_last_update_string);
			ini_close();
			
			global.language_update_status_message = "Language pack update complete: All files updated.";
			global.language_update_status_color = c_green;
			show_debug_message("[scr_handle_language_pack_http] All language files downloaded successfully! language_last_update_string = " + string(global.language_last_update_string) + " language_last_update_real = " + string(date_current_datetime()));
		}
	}
}