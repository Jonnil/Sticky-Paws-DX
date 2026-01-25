/// @function scr_download_language_pack_from_server()
/// @description Downloads the latest language pack from your own game server (which caches or proxies data from Google Sheets).
/// Assumes the server returns a CSV file.
function scr_download_language_pack_from_server()
{
	/* Check for a network connection */
	if (!global.online_enabled
	|| !global.online_token_validated
	|| !scr_check_network_connection(network_connect_passive))
	{
			scr_log("ERROR", "HTTP.LANG", "network_unavailable", "action=abort_download");
		global.language_update_status_message = "Network error: Unable to connect to server for language update.";
		global.language_update_status_color = c_red;
		return;
	}

	/* Build the endpoint URL */
	var endpoint = "https://" + string(global.base_url) + "/download_language_file";
		scr_log("DEBUG", "HTTP.LANG", "download_url", endpoint);

	/* Create a header map for the HTTP GET request */
	var header_map = ds_map_create();
	ds_map_add(header_map, "User-Agent", "gm_language_downloader_server");
	ds_map_add(header_map, "Accept", "text/csv");
	ds_map_add(header_map, "X-API-Key", global.api_key);

	/* Debug: Output the headers being used */
	var header_str = "";
	var key = ds_map_find_first(header_map);

	while (!is_undefined(key))
	{
		header_str += key + ": " + ds_map_find_value(header_map, key) + ", ";
		key = ds_map_find_next(header_map, key);
	}
		scr_log("DEBUG", "HTTP.LANG", "http_request_headers", header_str);

	/* Initiate the asynchronous HTTP GET request */
	global.language_http_request_id = http_request(endpoint, "GET", header_map, "");
	ds_map_destroy(header_map);

	if (global.language_http_request_id == -1)
	{
			scr_log("ERROR", "HTTP.LANG", "http_request_failed");
		global.language_update_status_message = "HTTP error: Unable to initiate language pack download.";
		global.language_update_status_color = c_red;
		return;
	}

		scr_log("INFO", "HTTP.LANG", "http_request_started", "request_id=" + string(global.language_http_request_id));
}
