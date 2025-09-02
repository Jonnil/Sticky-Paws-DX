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

		/* Best‑practice: ensure core arrays exist when reopening from cache */
		if (is_array(global.online_content_data))
		{
			var _total = array_length(global.online_content_data);

			/* 1) Ensure all_download_id is an array (used to kick off per‑item requests) */
			if (!is_array(all_download_id) || array_length(all_download_id) < _total)
			{
				var _new_ids = array_create(_total, "");
				if (is_array(all_download_id))
				{
					var _old_n = array_length(all_download_id);
					for (var i = 0; i < min(_old_n, _total); i++)
					{
						_new_ids[i] = all_download_id[i];
					}
				}
				all_download_id = _new_ids;
			}

			/* 2) Ensure draw_download_name exists so the pipeline can advance */
			if (!is_array(global.draw_download_name) || array_length(global.draw_download_name) < _total)
			{
				var _new_names = array_create(_total, "");
				if (is_array(global.draw_download_name))
				{
					var _old_m = array_length(global.draw_download_name);
					for (var j = 0; j < min(_old_m, _total); j++)
					{
						_new_names[j] = global.draw_download_name[j];
					}
				}
				global.draw_download_name = _new_names;
			}

			/* 3) Ensure thumbnail sprite array exists without clobbering cache */
			if (!is_array(global.spr_download_list_thumbnail) || array_length(global.spr_download_list_thumbnail) < _total)
			{
				var _new_thumbs = array_create(_total, spr_thumbnail_missing);
				if (is_array(global.spr_download_list_thumbnail))
				{
					var _old_t = array_length(global.spr_download_list_thumbnail);
					for (var k = 0; k < min(_old_t, _total); k++)
					{
						_new_thumbs[k] = global.spr_download_list_thumbnail[k];
					}
				}
				global.spr_download_list_thumbnail = _new_thumbs;
			}

			/* 4) Prepopulate all_download_id from list data so downloads can start immediately */
			for (var a = 0; a < _total; a++)
			{
				if (all_download_id[a] == "")
				{
					var _item = global.online_content_data[a];
					var _id = _item.name;
					_id = string_replace(_id, string(content_type) + "s/", "");
					_id = string_replace(_id, ".zip", "");
					all_download_id[a] = _id;
				}
			}
		}

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
	finished_level        = undefined;
	zero_defeats_level    = undefined;
	liked_content        = undefined;

	/* Build headers (persist for reuse by per-item info requests) */
	if (!variable_global_exists("online_download_request_headers"))
	{
		global.online_download_request_headers = ds_map_create();
	}
	else
	{
		if (global.online_download_request_headers == noone)
		{
			global.online_download_request_headers = ds_map_create();
		}
		else
		{
			/* Clear any old values to avoid stale keys */
			ds_map_clear(global.online_download_request_headers);
		}
	}

	ds_map_add(global.online_download_request_headers, "Content-Type", "application/json");
	ds_map_add(global.online_download_request_headers, "User-Agent", "gmdownloader");
	ds_map_add(global.online_download_request_headers, "X-API-Key", global.api_key);

	global.http_request_id = http_request(
		"https://" + global.base_url + "/" + string(content_type) + "s",
		"GET",
		global.online_download_request_headers,
		""
	);

	/* Flag that content is now "loaded" once the JSON arrives and is parsed in your response handler, after parsing JSON:
		global.online_list_loaded = true; */

	/* Finalize menu state */
	menu = "download_online_" + string(global.selected_online_download_index);
	automatically_search_for_id = false;
	in_online_download_list_menu = true;
	show_debug_message("[scr_initialize_online_download_menu] 'In online download list menu' is set to true\n");
	menu_delay = 3;

	/* Draw the spinner/text and set up timeout */
	scr_draw_loading(1, , , "Loading from server");
	scr_server_timeout(15);
	#endregion /* Server load path END */

}
