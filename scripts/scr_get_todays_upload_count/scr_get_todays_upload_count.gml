function scr_get_todays_upload_count()
{
	
	
	if (global.switch_logged_in)
	&& (global.switch_account_network_service_available) /* Need to make sure that network service is available before going online */
	&& (global.online_enabled)
	&& (global.free_communication_available)
	&& (os_is_network_connected()) /* Need to check if OS is connected to network before getting online */
	{
		scr_switch_update_online_status(false);
		
		global.content_added_today = noone;
		
		/* Create DS Map to hold the HTTP Header info */
		map = ds_map_create();
		
		/* Add to the header DS Map */
		ds_map_add(map, "Host", global.base_url);
		ds_map_add(map, "Content-Type", "application/json");
		ds_map_add(map, "User-Agent", "gmdownloader");
		ds_map_add(map, "X-API-Key", global.api_key);
		
		/* Send the HTTP GET request to the /level endpoint */
		global.content_added_today = http_request("https://" + global.base_url + "/today" + "?date_get_timezone_local_offset=" + string(scr_date_get_timezone_local_offset()), "GET", map, "");
		ds_map_destroy(map);
	}
}