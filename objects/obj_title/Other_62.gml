/* Check if the current request ID matches the one we sent */
if (async_load[? "id"] == global.http_request_id)
{
	
	/* Get the status code and response body */
	var status_code = async_load[? "status"];
	var response_str = async_load[? "result"];
	
	/* Check if the response status is 200 (OK) or 0 */
	if (status_code == 200 || status_code == 0)
	{
		/* Get the response as a string and decode it from JSON */
		var response_json = json_decode(response_str);
		var file_data_base64 = response_json[? "data"];
		
		/* Save the decoded data to a local file (with the .zip extension) */
		var buffer = buffer_base64_decode(file_data_base64);
		var download_temp_path = temp_directory;
		
		switch (content_type)
		{
			case "level":
			if (response_json != undefined)
			&& (!in_online_download_list_load_menu)
			{
				var file_save_location = download_temp_path + "downloaded_level/" + string(response_json[? "name"]) + ".zip";
				if (response_json[? "name"] == undefined)
				&& (search_for_id_still)
				{
					menu = "searched_file_downloaded_failed";
				}
			}
			else
			{
				/* Handle the list data here */
				in_online_download_list_load_menu = false;
				var file_save_location = "";
				global.online_download_list = response_str;
			}
			break;
			
			case "character":
			if (response_json != undefined)
			&& (!in_online_download_list_load_menu)
			{
				var file_save_location = download_temp_path + "downloaded_character/" + string(response_json[? "name"]) + ".zip";
				if (response_json[? "name"] == undefined)
				&& (search_for_id_still)
				{
					menu = "searched_file_downloaded_failed";
				}
			}
			else
			{
				/* Handle the list data here */
				in_online_download_list_load_menu = false;
				var file_save_location = "";
				global.online_download_list = response_str;
			}
			break;
			
			default:
			/* Handle the list data here */
			in_online_download_list_load_menu = false;
			var file_save_location = "";
			global.online_download_list = response_str;
			break;
		}
		if (file_save_location != "")
		{
			show_debug_message("file_save_location: " + string(file_save_location));
			buffer_save(buffer, file_save_location);
		}
		
		/* Free the buffer memory */
		buffer_delete(buffer);
	}
}

/* Check if the current request ID matches the one we sent */
if (async_load[? "id"] == global.http_request_info)
{
	/* Get the status code and response body */
	var status_code = async_load[? "status"];
	var response_str = async_load[? "result"];
	
	/* Check if the response status is 200 (OK) or 0 */
	if (status_code == 200 || status_code == 0)
	{
		/* Get the response as a string and decode it from JSON */
		var response_json = json_decode(response_str);
		var file_data_base64 = response_json[? "data"];
		
		/* Save the decoded data to a local file (with the .zip extension) */
		var buffer = buffer_base64_decode(file_data_base64);
		global.online_download_list_info = response_str;
		
		/* Free the buffer memory */
		buffer_delete(buffer);
	}
}

/* Check if the current request "content added today" matches the one we sent */
if (async_load[? "id"] == global.content_added_today)
{
	/* Get the status code and response body */
	var status_code = async_load[? "status"];
	var response_str = async_load[? "result"];
	
	/* Check if the response status is 200 (OK) or 0 */
	if (status_code == 200 || status_code == 0)
	{
		/* Get the response as a string and decode it from JSON */
		var response_json = json_decode(response_str);
		var file_data_base64 = response_json[? "data"];
		
		/* Save the decoded data to a local file (with the .zip extension) */
		var buffer = buffer_base64_decode(file_data_base64);
		global.content_added_today = response_str;
		
		/* Decode the JSON string into a DS map */
		var data_map = json_decode(global.content_added_today);
		
		/* Access the value */
		var var_levels_added = ds_map_find_value(data_map, "levels_uploaded_today");
		var var_characters_added = ds_map_find_value(data_map, "characters_uploaded_today");
		
		/* Clean up the DS map */
		ds_map_destroy(data_map);
		
		#region /* Set the text for how much content have been uploaded to the server */
		if (var_levels_added > 0)
		{
			levels_added_today_text = "+" + string(var_levels_added) + " " + l10n_text("levels added today!")
		}
		else
		{
			levels_added_today_text = "";
		}
		
		if (var_characters_added > 0)
		{
			characters_added_today_text = "+" + string(var_characters_added) + " " + l10n_text("characters added today!")
		}
		else
		{
			characters_added_today_text = "";
		}
		#endregion /* Set the text for how much content have been uploaded to the server END */
		
		/* Free the buffer memory */
		buffer_delete(buffer);
	}
	global.content_added_today = noone;
}