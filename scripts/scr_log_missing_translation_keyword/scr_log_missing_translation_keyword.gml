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
		show_debug_message("log_translation_key is currently holding: " + string(log_translation_key));
		
		#region /* Validate Input */
		/* Ensure the provided key is valid (non-empty and defined) */
		if (log_translation_key == "" || log_translation_key == undefined)
		{
			show_debug_message("[TranslationSync] Error: Invalid log_translation_key provided for translation logging.");
			return; /* Exit early since no valid key was provided */
		}
		#endregion /* Validate Input END */
		
		#region /* Log Missing Keyword Locally */
		/* Define the file path where missing keywords are logged locally */
		var file_path = game_save_id + "translation_missing_keywords.txt";
		var file = file_text_open_append(file_path); /* Open the file in append mode */
		if (file != -1) /* Ensure the file was successfully opened */
		{
			file_text_write_string(file, log_translation_key); /* Write the missing keyword */
			file_text_writeln(file); /* Move to a new line */
			file_text_close(file); /* Save changes and close the file */
		}
		else
		{
			/* Output a debug message if the file couldn't be opened */
			show_debug_message("[TranslationSync] Error: Unable to open file for logging: " + file_path);
		}
		#endregion /* Log Missing Keyword Locally END */
		
		#region /* Spawn Object to Handle Server Request */
		/* Check if the player is connected to the network */
		if (os_is_network_connected()
		&& log_translation_key != "")
		{
			/* Create an instance of obj_sync_missing_translation to handle the server request */
			var sync_obj = instance_create_depth(x, y, 0, obj_sync_missing_translation);
			if (instance_exists(sync_obj))
			{
				show_debug_message("[Debug] Created sync object successfully.");
				sync_obj.object_translation_key = log_translation_key;
				show_debug_message("[Debug] Assigned object_translation_key: " + log_translation_key);
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
	show_debug_message("sync_translation_key is currently holding: " + string(sync_translation_key));
	
	#region /* Validate Input */
	/* Ensure the provided key is valid (non-empty and defined) */
	if (sync_translation_key == undefined || sync_translation_key == "")
	{
		show_debug_message("[TranslationSync] Error: scr_initialize_sync_translation missing required sync_translation_key argument.");
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
	show_debug_message("request_id is currently holding: " + string(request_id));
	show_debug_message("response_translation_key is currently holding: " + string(response_translation_key));
	
	#region /* Validate Input */
	/* Ensure the provided key is valid */
	if (response_translation_key == undefined || response_translation_key == "")
	{
		show_debug_message("[TranslationSync] Error: scr_handle_sync_translation_response missing required response_translation_key argument.");
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