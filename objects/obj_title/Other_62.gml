/* Check if the current request ID matches the one we sent */
if (async_load[? "id"] == global.http_request_id)
{
	
	/* Get the status code and response body */
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	/* Check if the response status is 200 (OK) */
	if (status_code == 200)
	{
		/* Get the response as a string and decode it from JSON */
		var response_json = json_decode(response_str);
		var file_data_base64 = response_json[? "data"];
		
		/* Save the decoded data to a local file (with the .zip extension) */
		var buffer = buffer_base64_decode(file_data_base64);
		var download_temp_path = temp_directory;
		
		#region /* Handle file saving and menu updates based on content_type */
		if (response_json != undefined && !in_online_download_list_load_menu)
		{
			/* Check if the response JSON has a valid name */
			if (response_json[? "name"] != undefined)
			{
				var file_save_location = download_temp_path + "downloaded_" + string(content_type) + "/" + string(response_json[? "name"]) + ".zip";
			}
			else
			{
				/* Set file save location to an empty string if name is undefined */
				var file_save_location = "";
				if (search_for_id_still)
				{
					menu = "searched_file_downloaded_failed";
				}
			}
		}
		else
		{
			/* Handle the list data here */
			in_online_download_list_load_menu = false;
			var file_save_location = "";
			global.online_download_list = response_str;
		}
		#endregion /* Handle file saving and menu updates based on content_type END */
		
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
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	/* Check if the response status is 200 (OK) */
	if (status_code == 200)
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

/* Initialize the "content added today" global variable if not already set */
if (global.content_added_today == undefined)
{
    global.content_added_today = noone;
}

/* Check if the current request "content added today" matches the one we sent */
if (global.content_added_today != noone
&& async_load[? "id"] == global.content_added_today)
{
	/* Get the status code and response body */
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	/* Check if the response status is 200 (OK) */
	if (status_code == 200)
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

/* Check if the current request "online_token_validated" matches the one we sent */
if (async_load[? "id"] == global.online_token_validated)
{
	/* Get the status code and response body */
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	
	/* Check if the response status is 200 (OK) */
	if (status_code == 200)
	{
		/* Get the response as a string and decode it from JSON */
		var response_json = json_decode(response_str);
		var file_data_base64 = response_json[? "data"];
		
		/* Save the decoded data to a local file (with the .zip extension) */
		var buffer = buffer_base64_decode(file_data_base64);
		global.online_token_validated = true;
		
		/* Free the buffer memory */
		buffer_delete(buffer);
		
		show_debug_message("status code == 200   global.online_token_validated: " + string(global.online_token_validated));
	}
	else
	{
		global.online_token_validated = false; /* Set it to false, can only be a boolean value */
		global.online_token_error_message = response_str; /* Return the error code in string value only */
		show_debug_message("status code failed   global.online_token_validated: " + string(global.online_token_validated));
	}
}