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
		switch (content_type)
		{
			case "level":
			if (response_json != undefined)
			&& (in_online_download_list_load_menu == false)
			{
				var file_save_location = string_replace_all(working_directory, "/", "") + "downloaded_level/" + string(response_json[? "name"]) + ".zip";
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
			&& (in_online_download_list_load_menu == false)
			{
				var file_save_location = string_replace_all(working_directory, "/", "") + "downloaded_character/" + string(response_json[? "name"]) + ".zip";
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