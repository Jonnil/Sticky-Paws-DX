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
		var file_save_location = working_directory + "/custom_levels/" + string(response_json[? "name"]) + ".zip";
		buffer_save(buffer, file_save_location);
		
		/* Free the buffer memory */
		buffer_delete(buffer);
	}
}