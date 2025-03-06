#region /* Script: scr_download_language_packs */
/// @function scr_download_language_packs()
/// @description Downloads new or updated language packs from a server.
/// This script triggers an asynchronous HTTP request. The actual handling of
/// the response occurs in the Async - HTTP event of a designated controller object.
function scr_download_language_packs()
{
	
	#region /* Start Download Process */
	global.language_update_in_progress = true;
	show_debug_message("[LanguagePacks] Initiating language pack download process.");
	#endregion /* Start Download Process END */
	
	#region /* Check Network Connection */
	if (!os_is_network_connected())
	{
		show_debug_message("[LanguagePacks] Error: No network connection. Cannot download language packs.");
		global.language_update_in_progress = false;
		return;
	}
	#endregion /* Check Network Connection END */
	
	#region /* Define Endpoint URL */
	/* Define the URL for your language packs JSON manifest */
	var url = "http://" + global.base_url + "/sticky_paws_language_packs.json";
	show_debug_message("[LanguagePacks] Download URL set to: " + url);
	#endregion /* Define Endpoint URL END */
	
	#region /* Initiate Asynchronous HTTP Request */
	/* Start the HTTP GET request and store the returned request ID */
	global.language_http_request_id = http_get(url);
	if (global.language_http_request_id == -1)
	{
		show_debug_message("[LanguagePacks] Error: Failed to initiate HTTP request for language packs.");
		global.language_update_in_progress = false;
		return;
	}
	show_debug_message("[LanguagePacks] HTTP request initiated successfully. Request ID: " + string(global.language_http_request_id));
	#endregion /* Initiate Asynchronous HTTP Request END */
	
}
#endregion /* Script: scr_download_language_packs END */

/// @function scr_handle_language_pack_http(_async_map)
/// @description Handles the HTTP responses for language pack downloads.
/// This script distinguishes between the manifest download and individual language file downloads.
/// It should be called from the Async – HTTP event with async_load passed as _async_map.
function scr_handle_language_pack_http(_async_map)
{
	/* Retrieve common information from the _async_map */
	var req_id   = ds_map_find_value(_async_map, "id");
	var status   = ds_map_find_value(_async_map, "status");
	var result   = ds_map_find_value(_async_map, "result");
	
	/* ---------- Handle Manifest Download ---------- */
	if (req_id == global.language_http_request_id)
	{
		/* Check for HTTP errors on the manifest request */
		if (status < 200
		|| status >= 300)
		{
			show_debug_message("[LanguagePacks] Error: Manifest request returned status " + string(status));
			global.language_update_in_progress = false;
			return;
		}
		
		/* Parse the JSON manifest */
		var json_data = json_parse(result);
		if (is_undefined(json_data))
		{
			show_debug_message("[LanguagePacks] Error: Failed to parse JSON manifest.");
			global.language_update_in_progress = false;
			return;
		}
		
		/* Ensure the manifest contains a 'languages' array */
		if (!json_data.languages)
		{
			show_debug_message("[LanguagePacks] Error: JSON manifest does not contain a 'languages' array.");
			global.language_update_in_progress = false;
			return;
		}
		
		var languages_array = json_data.languages;
		if (array_length(languages_array) == 0)
		{
			show_debug_message("[LanguagePacks] Warning: No languages available in manifest.");
			global.language_update_in_progress = false;
			return;
		}
		
		/* Create a DS map to track individual language file requests if it doesn't already exist */
		if (!variable_global_exists("language_file_requests") || global.language_file_requests == undefined)
		{
			global.language_file_requests = ds_map_create();
		}
		
		/* Loop over each language entry in the manifest and request its file */
		for (var i = 0; i < array_length(languages_array); i++)
		{
			var lang_entry  = languages_array[i];
			var lang_name   = lang_entry.name; /* Adjust if necessary */
			var file_url	= lang_entry.file_url; /* URL to the language file (CSV, JSON, etc.) */
			
			/* Initiate an HTTP GET request for the language file */
			var file_req_id = http_get(file_url);
			ds_map_add(global.language_file_requests, string(file_req_id), lang_name);
			show_debug_message("[LanguagePacks] Initiated download for language '" + lang_name + 
							   "' with request ID: " + string(file_req_id));
		}
		
		/* Clear the manifest request ID now that it has been processed */
		global.language_http_request_id = -1;
	}
	/* ---------- Handle Individual Language File Downloads ---------- */
	else
	if (variable_global_exists("language_file_requests") 
	&& ds_map_exists(global.language_file_requests, string(req_id)))
	{
		var lang_name = ds_map_find_value(global.language_file_requests, string(req_id));
		
		/* Check for HTTP errors on the language file request */
		if (status < 200
		|| status >= 300)
		{
			show_debug_message("[LanguagePacks] Error: Download for language '" + lang_name + 
							   "' failed with status " + string(status));
			ds_map_delete(global.language_file_requests, string(req_id));
			return;
		}
		
		/* Process the downloaded file */
		/* Insert your own logic here. For example, if your language file is CSV: */
		/* scr_process_language_file(lang_name, result); */
		/* Or if it's JSON, you might simply parse it */
		show_debug_message("[LanguagePacks] Successfully downloaded language file for '" + lang_name + "'.");
		
		ds_map_delete(global.language_file_requests, string(req_id));
		
		/* If all language files have been processed, clean up */
		if (ds_map_size(global.language_file_requests) == 0)
		{
			ds_map_destroy(global.language_file_requests);
			global.language_file_requests = undefined;
			global.language_update_in_progress = false;
			show_debug_message("[LanguagePacks] All language files downloaded successfully!");
		}
	}
}