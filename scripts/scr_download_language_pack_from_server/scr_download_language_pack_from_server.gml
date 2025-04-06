/// @function scr_download_language_pack_from_server()
/// @description Downloads the latest language pack from your own game server (which caches or proxies data from Google Sheets).
/// Assumes the server returns a CSV file.
/// Place this in your "Server Scripts" folder to differentiate from direct Google Sheets download scripts.
function scr_download_language_pack_from_server()
{
	/* 1) Check for a network connection */
	if (!check_network_connection(network_connect_passive))
	{
		show_debug_message("[scr_download_language_pack_from_server] ERROR: No network connection. Aborting language pack download.");
		global.language_update_status_message = "Network error: Unable to connect to server for language update.";
		global.language_update_status_color = c_red;
		return;
	}
	
	/* 2) Build the endpoint URL. Adjust the path if needed */
	var endpoint = "https://" + string(global.base_url) + "/download_language_file";
	show_debug_message("[scr_download_language_pack_from_server] Download URL set to: " + endpoint);
	
	/* 3) Create a header map for the HTTP GET request */
	var header_map = ds_map_create();
	ds_map_add(header_map, "User-Agent", "gm_language_downloader_server");
	ds_map_add(header_map, "Accept", "text/csv");
	ds_map_add(header_map, "X-API-Key", global.api_key);
	
	/* 4) Debug: Output the headers being used */
	var header_str = "";
	var key = ds_map_find_first(header_map);
	
	while (!is_undefined(key))
	{
		header_str += key + ": " + ds_map_find_value(header_map, key) + ", ";
		key = ds_map_find_next(header_map, key);
	}
	show_debug_message("[scr_download_language_pack_from_server] Using headers: " + header_str);
	
	/* 5) Initiate the asynchronous HTTP GET request */
	global.language_http_request_id = http_request(endpoint, "GET", header_map, "");
	ds_map_destroy(header_map);
	
	if (global.language_http_request_id == -1)
	{
		show_debug_message("[scr_download_language_pack_from_server] ERROR: HTTP request initiation failed.");
		global.language_update_status_message = "HTTP error: Unable to initiate language pack download.";
		global.language_update_status_color = c_red;
		return;
	}
	
	show_debug_message("[scr_download_language_pack_from_server] HTTP request initiated successfully. Request ID: " + string(global.language_http_request_id) + "\n");
}