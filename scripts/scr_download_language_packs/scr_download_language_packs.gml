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

	scr_log("INFO", "HTTP.LANG", "download_start", "source=google_sheet");

	#region /* Check Network Connection */
	if (global.online_enabled
	&& global.online_token_validated
	&& scr_check_network_connection(network_connect_passive))
	{
		scr_log("INFO", "HTTP.LANG", "network_ok");
	}
	else
	{
		scr_log("ERROR", "HTTP.LANG", "network_unavailable");
		global.language_update_status_message = "Network error: Unable to connect to server for language updates.";
		global.language_update_status_color = c_red;
		return;
	}
	#endregion /* Check Network Connection END */

	/* Define Endpoint URL */
	var url = global.google_sheet_language_url;
	scr_log("DEBUG", "HTTP.LANG", "download_url", string(url));

	/* Debug checks for malformed URL */
	if (string_pos("*", url) > 0)
	{
		scr_log("WARN", "HTTP.LANG", "url_contains_wildcard");
	}

	if (string_pos("http://", url) != 1
	&& string_pos("https://", url) != 1)
	{
		scr_log("WARN", "HTTP.LANG", "url_missing_scheme");
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
	scr_log("DEBUG", "HTTP.LANG", "http_request_init", header_str);

	global.language_http_request_id = http_request(url, "GET", header_map, "");

	ds_map_destroy(header_map);

	if (global.language_http_request_id == -1)
	{
		scr_log("ERROR", "HTTP.LANG", "http_request_failed");
		global.language_update_status_message = "HTTP error: Unable to start language pack update.";
		global.language_update_status_color = c_red;
		return;
	}
	scr_log("INFO", "HTTP.LANG", "http_request_started", "request_id=" + string(global.language_http_request_id));
	#endregion /* Initiate Asynchronous HTTP Request END */

}
