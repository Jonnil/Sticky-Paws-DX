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
		if (response_json != undefined
		&& !in_online_download_list_load_menu)
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
	
	show_debug_message("[obj_title Async - HTTP] menu: " + string(menu) + ", status_code = " + string(status_code));
	
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

scr_handle_content_added_today_http();

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

scr_handle_language_pack_http(async_load);