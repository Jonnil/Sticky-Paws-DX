/* Check if the current request ID matches the one we sent */
if (async_load[? "id"] == global.http_request_id)
{
	show_debug_message("[HTTP Request ID Callback] Request ID matched: received " + string(async_load[? "id"]) + " vs global.http_request_id (" + string(global.http_request_id) + ")");
	
	/* Get the status code and response body */
	var status_code = async_load[? "http_status"];
	var response_str = async_load[? "result"];
	show_debug_message("[HTTP Request ID Callback] Status code: " + string(status_code));
	show_debug_message("[HTTP Request ID Callback] Response string: " + string(response_str));
	
	/* Check if the response status is 200 (OK) */
	if (status_code == 200)
	{
		show_debug_message("[HTTP Request ID Callback] HTTP status 200 OK. Processing response...");
		
		/* Decode the JSON response */
		var response_json = json_decode(response_str);
		
		if (response_json != undefined)
		{
			show_debug_message("[HTTP Request ID Callback] JSON decoded successfully.");
		}
		else
		{
			show_debug_message("[HTTP Request ID Callback] ERROR: JSON decoding failed.");
		}
		
		var file_data_base64 = response_json[? "data"];
		show_debug_message("[HTTP Request ID Callback] Extracted base64 data from JSON.");
		
		/* Decode the base64 data into a buffer */
		var buffer = buffer_base64_decode(file_data_base64);
		show_debug_message("[HTTP Request ID Callback] Buffer created from base64 data.");
		
		var download_temp_path = temp_directory;
		show_debug_message("[HTTP Request ID Callback] Using temporary directory: " + download_temp_path);
		
		#region /* Handle file saving and menu updates based on content_type */
		var file_save_location = "";
		
		if (response_json != undefined
		&& !in_online_download_list_load_menu)
		{
			show_debug_message("[HTTP Request ID Callback] Processing single file download (not a list load).");
			
			/* Check if the response JSON has a valid name */
			if (response_json[? "name"] != undefined)
			{
				file_save_location = download_temp_path + "downloaded_" + string(content_type) + "/" + string(response_json[? "name"]) + ".zip";
				show_debug_message("[HTTP Request ID Callback] Determined file save location: " + file_save_location);
			}
			else
			{
				show_debug_message("[HTTP Request ID Callback] WARNING: 'name' field undefined in JSON response.");
				file_save_location = "";
				
				if (search_for_id_still)
				{
					menu = "searched_file_downloaded_failed";
					show_debug_message("[HTTP Request ID Callback] Menu set to 'searched_file_downloaded_failed' due to missing 'name'.");
				}
			}
		}
		else
		{
			show_debug_message("[HTTP Request ID Callback] Handling online download list data...");
			in_online_download_list_load_menu = false;
			file_save_location = "";
			global.online_download_list = response_str;
			show_debug_message("[HTTP Request ID Callback] global.online_download_list updated.");
		}
		#endregion /* End file saving and menu updates block */
		
		if (file_save_location != "")
		{
			show_debug_message("[HTTP Request ID Callback] Saving buffer to file at: " + file_save_location);
			buffer_save(buffer, file_save_location);
		}
		else
		{
			show_debug_message("[HTTP Request ID Callback] No valid file_save_location determined; skipping file save.");
		}
		
		/* Free the buffer memory */
		buffer_delete(buffer);
		show_debug_message("[HTTP Request ID Callback] Buffer memory freed.");
	}
	else
	{
		show_debug_message("[HTTP Request ID Callback] ERROR: HTTP status code is not 200. Actual status: " + string(status_code));
	}
}
else
{
	show_debug_message("[HTTP Request ID Callback] Request ID mismatch: received " + string(async_load[? "id"]) + ", expected " + string(global.http_request_id));
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