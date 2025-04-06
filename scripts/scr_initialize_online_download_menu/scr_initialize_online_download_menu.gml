/// @function scr_initialize_online_download_menu()
/// @description Initializes the online download menu by setting HTTP headers, starting the request, and drawing a loading screen.
function scr_initialize_online_download_menu()
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	#region /* Get Online Download List */
	in_online_download_list_load_menu = true;
	info_queue_index = 0;
	info_queue_http_request = true; show_debug_message("[scr_initialize_online_download_menu] 'info_queue_http_request' is set to true\n");
	
	finished_level = undefined;
	zero_defeats_level = undefined;
	liked_content = undefined;
	
	var online_download_request_headers = ds_map_create();
	ds_map_add(online_download_request_headers, "Host", global.base_url);
	ds_map_add(online_download_request_headers, "Content-Type", "application/json");
	ds_map_add(online_download_request_headers, "User-Agent", "gmdownloader");
	ds_map_add(online_download_request_headers, "X-API-Key", global.api_key);
	
	global.http_request_id = http_request(
		"https://" + global.base_url + "/" + string(content_type) + "s",
		"GET",
		online_download_request_headers,
		""
	);
	global.online_download_request_headers = online_download_request_headers;
	ds_map_destroy(online_download_request_headers);
	#endregion /* Get Online Download List END */
	
	menu = "download_online_" + string(global.selected_online_download_index);
	automatically_search_for_id = false;
	in_online_download_list_menu = true; show_debug_message("[scr_initialize_online_download_menu] 'In online download list menu' is set to true\n");
	menu_delay = 3;
	
	scr_draw_loading(1, , , "Loading from server");
	scr_server_timeout(15);
}