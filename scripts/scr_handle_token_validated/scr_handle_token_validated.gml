function scr_handle_token_validated()
{
	/* Check if the current request "online_token_validated" matches the one we sent */
	if (async_load[? "id"] == global.online_token_request)
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
			
			scr_get_todays_upload_count(); /* Update the todays upload count whenever you first go online */
		}
		else
		{
			global.online_token_validated = false; /* Set it to false, can only be a boolean value */
			global.online_token_error_message = response_str; /* Return the error code in string value only */
			show_debug_message("status code failed   global.online_token_validated: " + string(global.online_token_validated));
		}
	}
}