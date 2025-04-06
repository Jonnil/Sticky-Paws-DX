/// @function scr_download_language_packs()
/// @description Downloads new or updated language packs from your published Google Sheet.
function scr_download_language_packs()
{
	/* Start Download Process */
	global.language_update_status_message = "Fetching latest language pack data from server...";
	
	if (variable_instance_exists(self, "c_menu_fill"))
	{
		global.language_update_status_color = c_menu_fill;
	}
	else
	{
		global.language_update_status_color = c_white;
	}
	
	/* Before anything else, we need to check that the certification file exists */
	scr_check_cert();
	
	show_debug_message("[scr_download_language_packs] Initiating language pack download process from Google Sheet.");
	
	#region /* Check Network Connection */
	if (check_network_connection(network_connect_passive))
	{
		show_debug_message("[scr_download_language_packs] Network connection detected.");
	}
	else
	{
		show_debug_message("[scr_download_language_packs] Error: No network connection.");
		global.language_update_status_message = "Network error: Unable to connect to server for language updates.";
		global.language_update_status_color = c_red;
		return;
	}
	#endregion /* Check Network Connection END */
	
	/* Define Endpoint URL */
	var url = global.google_sheet_language_url;
	show_debug_message("[scr_download_language_packs] Download URL set to: global.google_sheet_language_url = " + string(url));
	
	/* Debug checks for malformed URL */
	if (string_pos("*", url) > 0)
	{
		show_debug_message("[scr_download_language_packs] WARNING: The URL contains a wildcard '*' character, which may indicate a malformed URL.");
	}
	
	if (string_pos("http://", url) != 1
	&& string_pos("https://", url) != 1)
	{
		show_debug_message("[scr_download_language_packs] WARNING: The URL does not start with 'http://' or 'https://'. It may be missing the correct scheme.");
	}
	
	#region /* Initiate Asynchronous HTTP Request using http_request */
	/* Create an empty header map; add default headers if needed */
	var header_map = ds_map_create();
	ds_map_add(header_map, "User-Agent", "gmdownloader");
	ds_map_add(header_map, "Content-Type", "application/json");
	ds_map_add(header_map, "X-API-Key", global.api_key);
	
	/* Build a string with all header key-value pairs */
	var header_str = "";
	var key = ds_map_find_first(header_map);
	while (!is_undefined(key))
	{
		header_str += key + ": " + ds_map_find_value(header_map, key) + ", ";
		key = ds_map_find_next(header_map, key);
	}
	show_debug_message("[scr_download_language_packs] Initiating HTTP GET request using http_request with headers: " + header_str);
	
	global.language_http_request_id = http_request(url, "GET", header_map, "");
	
	ds_map_destroy(header_map);
	
	if (global.language_http_request_id == -1)
	{
		show_debug_message("[scr_download_language_packs] Error: HTTP request initiation failed.");
		global.language_update_status_message = "HTTP error: Unable to start language pack update.";
		global.language_update_status_color = c_red;
		return;
	}
	show_debug_message("[scr_download_language_packs] HTTP request initiated successfully. Request ID: " + string(global.language_http_request_id) + "\n");
	#endregion /* Initiate Asynchronous HTTP Request END */
	
}