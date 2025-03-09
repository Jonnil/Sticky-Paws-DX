/// @function scr_download_language_packs()
/// @description Downloads new or updated language packs from your published Google Sheet.
function scr_download_language_packs()
{
	
	/* Start Download Process */
	global.language_update_status_message = l10n_text("Fetching latest language pack data from server...");
	if (variable_instance_exists(self, "c_menu_fill"))
	{
		global.language_update_status_color = c_menu_fill;
	}
	else
	{
		global.language_update_status_color = c_white;
	}
	show_debug_message("[scr_download_language_packs] Initiating language pack download process from Google Sheet.");
	
	#region /* Check Network Connection */
	if (!global.online_token_validated
	|| !os_is_network_connected())
	{
		show_debug_message("[scr_download_language_packs] Error: No network connection.");
		global.language_update_status_message = l10n_text("Network error: Unable to connect to server for language updates.");
		global.language_update_status_color = c_red;
		return;
	}
	#endregion /* Check Network Connection END */

	/* Define Endpoint URL */
	var url = global.google_sheet_language_url;
	show_debug_message("[scr_download_language_packs] Download URL set to: " + url);
	
	#region /* Initiate Asynchronous HTTP Request */
	global.language_http_request_id = http_get(url);
	if (global.language_http_request_id == -1)
	{
		show_debug_message("[scr_download_language_packs] Error: HTTP request initiation failed.");
		global.language_update_status_message = l10n_text("HTTP error: Unable to start language pack update.");
		global.language_update_status_color = c_red;
		return;
	}
	show_debug_message("[scr_download_language_packs] HTTP request initiated successfully. Request ID: " + string(global.language_http_request_id));
	#endregion /* Initiate Asynchronous HTTP Request END */
	
}