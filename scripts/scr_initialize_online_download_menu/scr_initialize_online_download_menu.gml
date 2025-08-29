/// @function scr_initialize_online_download_menu()
/// @description Initializes the online download menu by setting HTTP headers, starting the request (only once), and drawing a loading screen.
function scr_initialize_online_download_menu()
{
	/* Always start with a clean state for this flag to avoid stale routing on callbacks */
	in_online_download_list_load_menu = false;
	
	/* If we've already loaded the list this session, just reopen the menu */
	if (is_array(global.online_content_data)
	&& array_length(global.online_content_data) > 0)
	{
		
		#region /* Cached list path (no network) */
		/* Restore menu state without network.
		   IMPORTANT FIX: Do NOT mark "loading list" when using cache. */
		in_online_download_list_load_menu = false; /* <-- fix */
		in_online_download_list_menu = true;
		
		var page_offset = global.download_current_page * global.download_items_per_page;
		info_queue_index = page_offset;
		
		/* Ensure we aren't waiting on any HTTP in this path */
		info_queue_http_request = true;
		
		menu = "download_online_" + string(global.selected_online_download_index);
		automatically_search_for_id = false;
		menu_delay = 3;
		
		show_debug_message("[scr_initialize_online_download_menu] Cached data found – skipping HTTP request. "
		+ "in_online_download_list_load_menu set to false\n");
		return;
		#endregion /* Cached list path (no network) END */
	}
	
	/* First-time load, or after a refresh, show loading overlay */
	draw_set_alpha(0.5);
	draw_rectangle_color(
		0, 0, display_get_gui_width(), display_get_gui_height(),
		c_black, c_black, c_black, c_black, false
	);
	draw_set_alpha(1);
	
	#region /* Server load path */
	/* Mark that we’re actively loading from server */
	in_online_download_list_load_menu = true;
	
	var page_offset = global.download_current_page * global.download_items_per_page;
	info_queue_index = page_offset;
	info_queue_http_request = true;
	show_debug_message("[scr_initialize_online_download_menu] 'info_queue_http_request' is set to true\n");
	
	/* Clear any previous detail-state (only needed on true refresh) */
	finished_level		= undefined;
	zero_defeats_level	= undefined;
	liked_content		= undefined;
	
	/* Build headers and send request */
	var online_download_request_headers = ds_map_create();
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
	
	/* Flag that content is now "loaded" once the JSON arrives and is parsed in your response handler, after parsing JSON:
		global.online_list_loaded = true; */
	
	/* Finalize menu state */
	menu = "download_online_" + string(global.selected_online_download_index);
	automatically_search_for_id = false;
	in_online_download_list_menu = true;
	show_debug_message("[scr_initialize_online_download_menu] 'In online download list menu' is set to true\n");
	menu_delay = 3;
	
	/* Draw the spinner/text and set up timeout */
	scr_draw_loading(1, , , "Loading from server 3");
	scr_server_timeout(15);
	#endregion /* Server load path END */
	
}