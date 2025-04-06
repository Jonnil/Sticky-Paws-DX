function scr_get_todays_upload_count()
{
	scr_switch_update_online_status(false);
	
	if (global.switch_logged_in)
	&& (global.switch_account_network_service_available) /* Need to make sure that network service is available before going online */
	&& (global.online_enabled)
	&& (global.free_communication_available)
	&& (scr_check_network_connection(network_connect_passive)) /* Need to check if OS is connected to network before getting online */
	{
		global.content_added_today = noone;
		
		/* Create DS Map to hold the HTTP Header info */
		var todays_upload_count_headers = ds_map_create();
		
		/* Add to the header DS Map */
		ds_map_add(todays_upload_count_headers, "Host", global.base_url);
		ds_map_add(todays_upload_count_headers, "Content-Type", "application/json");
		ds_map_add(todays_upload_count_headers, "User-Agent", "gmdownloader");
		ds_map_add(todays_upload_count_headers, "X-API-Key", global.api_key);
		
		/* Send the HTTP GET request to the /today endpoint */
		global.content_added_today = http_request(
			"https://" + global.base_url + "/today" + "?date_get_timezone_local_offset=" + string(scr_date_get_timezone_local_offset()),
			"GET",
			todays_upload_count_headers,
			""
		);
		
		ds_map_destroy(todays_upload_count_headers);
	}
}