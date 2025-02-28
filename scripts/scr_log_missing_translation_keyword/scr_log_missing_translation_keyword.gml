#region /* Script: scr_log_missing_translation_keyword */
/* Handles logging of missing translation keywords both locally and to the server */

function scr_log_missing_translation_keyword(log_translation_key = "")
{
	
	#region /* Check Cache */
	/* Check if the key already exists in the cache to avoid duplicate logging */
	/* The cache is initialized during game startup in preload_translation_missing_keywords(): */
	/* global.translation_missing_keywords_cache = ds_map_create(); */
	if (log_translation_key != "")
	&& (!ds_map_exists(global.translation_missing_keywords_cache, log_translation_key))
	{
		
		#region /* Validate Input */
		/* Ensure the provided key is valid (non-empty and defined) */
		if (log_translation_key == "" || log_translation_key == undefined)
		{
			show_debug_message("[TranslationSync] Error: Invalid log_translation_key provided for translation logging. log_translation_key is currently holding: " + string(log_translation_key));
			return; /* Exit early since no valid key was provided */
		}
		#endregion /* Validate Input END */
		
		#region /* Log Missing Keyword Locally for CSV */
		/* Define the file path where missing keywords are logged locally */
		var file_path = game_save_id + "translation_missing_keywords.txt";
		var file = file_text_open_append(file_path); // Open the file in append mode */
		if (file != -1)
		{
			/* Build the timestamp string "YYYY-MM-DD hh:mm:ss" using built-in date variables */
			var year   = string(current_year);
			
			var month  = string(current_month);
			if (current_month < 10) month = "0" + month;
			
			var day	= string(current_day);
			if (current_day < 10) day = "0" + day;
			
			var hour   = string(current_hour);
			if (current_hour < 10) hour = "0" + hour;
			
			var minute = string(current_minute);
			if (current_minute < 10) minute = "0" + minute;
			
			var second = string(current_second);
			if (current_second < 10) second = "0" + second;
			
			var formatted_time = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
			
			/* Ensure the keyword is safe for CSV by wrapping it in quotes and escaping any inner quotes */
			var safe_keyword   = "\"" + string_replace_all(log_translation_key, "\"", "\"\"") + "\"";
			/* Wrap the timestamp in quotes as well */
			var safe_timestamp = "\"" + formatted_time + "\"";
			
			/* Build the CSV entry in the format: keyword,timestamp */
			var log_entry = safe_keyword + "," + safe_timestamp;
			
			/* Write the CSV entry to the file and close it */
			file_text_write_string(file, log_entry);
			file_text_writeln(file); /* New line for the next entry */
			file_text_close(file);
		}
		else
		{
			/* Debug message if the file couldn't be opened */
			show_debug_message("[TranslationSync] Error: Unable to open file for logging: " + file_path);
		}
		#endregion /* Log Missing Keyword Locally for CSV END */
		
		#region /* Spawn Object to Handle Server Request */
		/* Check if the player is connected to the network */
		if (os_is_network_connected()
		&& log_translation_key != "")
		{
			/* Create an instance of obj_sync_missing_translation to handle the server request */
			var sync_obj = instance_create_depth(x, y, 0, obj_sync_missing_translation);
			if (instance_exists(sync_obj))
			{
				sync_obj.object_translation_key = log_translation_key;
				show_debug_message("[Debug] Created sync object successfully! Assigned object_translation_key: " + log_translation_key);
			}
			else
			{
				show_debug_message("[Error] Failed to create sync object.");
			}
		}
		#endregion /* Spawn Object to Handle Server Request END */
		
		/* Add the key to the cache to prevent duplicate logging */
		ds_map_add(global.translation_missing_keywords_cache, log_translation_key, true);
	}
	#endregion /* Check Cache END */
	
}
#endregion /* Script: scr_log_missing_translation_keyword END */

#region /* Script: scr_initialize_sync_translation */
/* Initializes the HTTP request to send the missing translation keyword to the server as JSON.
	Arguments:
		- sync_translation_key (string): The translation key to be synced with the server

	This code is used in the obj_sync_missing_translation Create Event.
	For example:
		object_translation_key = "";
		request_id = -1;
		request_id = scr_initialize_sync_translation(object_translation_key);
		if (request_id == false)
		{
			instance_destroy();
		}
*/
function scr_initialize_sync_translation(sync_translation_key = "")
{
	
	#region /* Validate Input */
	/* Ensure the provided key is valid (non-empty and defined) */
	if (sync_translation_key == undefined || sync_translation_key == "")
	{
		show_debug_message("[TranslationSync] Error: scr_initialize_sync_translation missing required sync_translation_key argument. sync_translation_key is currently holding: " + string(sync_translation_key));
		return false; /* Exit early since no valid key was provided */
	}
	#endregion /* Validate Input END */
	
	#region /* Prepare HTTP Request */
	/* Create a DS Map to hold HTTP header information.
		We now use a JSON payload instead of multipart/form-data.
		Setting the 'Content-Type' header to "application/json" ensures the server parses the payload as JSON.
	*/
	var header_map = ds_map_create();
	ds_map_add(header_map, "Content-Type", "application/json");
	ds_map_add(header_map, "User-Agent", "gm_translation_logger"); /* Include a user agent */
	ds_map_add(header_map, "X-API-Key", global.api_key); /* Add an API key for authentication */
	ds_map_add(header_map, "Host", string(global.base_url)); /* Optional, if needed by your server */
	
	/* Construct POST data for the HTTP request as JSON.
		Create a DS Map for the payload, add the necessary keys, and encode it to JSON.
	*/
	var payload_map = ds_map_create();
	ds_map_add(payload_map, "key", sync_translation_key);
	ds_map_add(payload_map, "game_name", global.game_name);
	var post_data = json_encode(payload_map);
	ds_map_destroy(payload_map); /* Clean up the payload DS Map */
	
	/* Construct the full endpoint URL */
	var sync_translation_endpoint = "https://" + string(global.base_url) + "/sync_translation";
	#endregion /* Prepare HTTP Request END */
	
	#region /* Send HTTP Request */
	/* Send the HTTP POST request using the header_map and JSON payload.
		The http_request function returns a request_id.
	*/
	var request_id = http_request(sync_translation_endpoint, "POST", header_map, post_data);
	ds_map_destroy(header_map); /* Clean up the header DS Map */
	
	/* Debug output for the request status */
	if (request_id == -1)
	{
		show_debug_message("[TranslationSync] Error: Failed to send HTTP POST request.");
		return false; /* Indicate failure */
	}
	else
	{
		show_debug_message("[TranslationSync] HTTP request sent successfully. Request ID: " + string(request_id));
		return request_id; /* Return the request ID */
	}
	#endregion /* Send HTTP Request END */
}
#endregion /* Script: scr_initialize_sync_translation END */

#region /* Script: scr_handle_sync_translation_response */
/* Handles the server response for syncing a missing translation keyword */
/* Arguments:
	- request_id (real): The request ID of the HTTP request
	- response_translation_key (string): The translation key that was synced
	
	async_load is a built-in ds_map variable that doesn't need to be manually initialized, therefore ds_map_exists isn't needed!
	- async_load (ds_map): The async load map containing the HTTP response.
*/

/* This code is in obj_sync_missing_translation Async - HTTP Event:
	scr_handle_sync_translation_response(request_id, object_translation_key);
	instance_destroy();
*/

function scr_handle_sync_translation_response(request_id = false, response_translation_key = "")
{
	
	#region /* Validate Input */
	/* Ensure the provided key is valid */
	if (response_translation_key == undefined || response_translation_key == "")
	{
		show_debug_message("[TranslationSync] Error: scr_handle_sync_translation_response missing required response_translation_key argument. request_id is currently holding: " + string(request_id) + " response_translation_key is currently holding: " + string(response_translation_key));
		return false; /* Exit early */
	}
	#endregion /* Validate Input END */
	
	#region /* Validate Input */
	/* Ensure the response corresponds to the correct request */
	if (async_load[? "id"] == request_id)
	{
		if (async_load[? "status"] == 0) /* Check if the request completed successfully */
		{
			show_debug_message("[TranslationSync] Successfully synced missing translation keyword: " + string(response_translation_key));
		}
		else
		{
			show_debug_message("[TranslationSync] Error syncing missing translation keyword: " + string(response_translation_key));
		}
	}
	#endregion /* Validate Input END */
	
}
#endregion /* Script: scr_handle_sync_translation_response END */