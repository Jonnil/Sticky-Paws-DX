function scr_draw_online_level_list()
{
	if (menu = "online_level_list_load")
	{
		scr_draw_text_outlined(display_get_width() * 0.5, 64, "Online Level List Load");
		
		#region /* Get Online Level List */
		content_type = ""; /* Need to clear the content_type, so Async - HTTP Event is running correctly */
		
		/* Create DS Map to hold the HTTP Header info */
		map = ds_map_create();
		
		/* Add to the header DS Map */
		ds_map_add(map, "Host", global.base_url);
		ds_map_add(map, "Content-Type", "application/json");
		ds_map_add(map, "User-Agent", "gmdownloader");
		
		/* Send the HTTP GET request to the /download endpoint */
		global.http_request_id = http_request("http://" + global.base_url + "/levels", "GET", map, "");
		ds_map_destroy(map);
		#endregion /* Get Online Level List END */
		
		if (global.online_level_list != "")
		{
			menu = "online_level_list_menu";
		}
	}
	else
	if (menu = "online_level_list_menu")
	{
		
		show_message(string(global.online_level_list));
		var result_map = json_decode(global.online_level_list);
		var list = ds_map_find_value(result_map, "name");
		show_message(list);
		var size = ds_map_size(list);
		for (var n = 0; n < size; n++;)
		{
		    var online_level_list_map = ds_map_find_value(list, n);
		    var curr = ds_map_find_first(online_level_list_map);
		    while (is_string(curr))
		    {
				scr_draw_text_outlined(display_get_width() * 0.5, 50 * n, string(ds_map_find_value(online_level_list_map, "name")));
		        curr = ds_map_find_next(online_level_list_map, curr);
		    }
		}
		ds_map_destroy(result_map);
		
		//scr_draw_text_outlined(display_get_width() * 0.5, display_get_height() * 0.5, string(online_level_list));
	}
}