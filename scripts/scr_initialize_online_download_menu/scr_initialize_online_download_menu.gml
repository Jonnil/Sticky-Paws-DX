/// @function scr_initialize_online_download_menu()
/// @description Initializes the online download menu by setting HTTP headers, starting the request (only once), and drawing a loading screen.
function scr_initialize_online_download_menu()
{
	/* Always start with a clean state for this flag to avoid stale routing on callbacks */
	in_online_download_list_load_menu = false;
	var _cached_type = variable_global_exists("online_download_cached_type") ? global.online_download_cached_type : "";
	var _content_type_changed = (_cached_type != "") && (_cached_type != content_type);

	/* If switching list types before data exists, clear any stale payload so we don't parse the wrong list */
	if (_content_type_changed)
	{
		global.online_download_list = "";
		global.online_download_list_info = "";
		global.info_data = undefined;
		global.online_list_loaded = false;
		global.http_request_info = -1;
		info_queue_http_request = true;
		info_queue_index = 0;
		variable_global_set("online_content_data_" + string(content_type), undefined);
	}

	/* If we've already loaded the list this session, just reopen the menu */
	if (is_array(variable_global_get("online_content_data_" + string(content_type)))
	&& array_length(variable_global_get("online_content_data_" + string(content_type))) > 0)
	{

		/* Clear any stale server timeout since we are using cached data */
		global.server_timeout_end = undefined;

		#region /* Cached list path (no network) */
		/* Restore menu state without network.
		   IMPORTANT FIX: Do NOT mark "loading list" when using cache. */
		in_online_download_list_load_menu = false; /* <-- fix */
		in_online_download_list_menu = true;

		var page_offset = global.download_current_page * global.download_items_per_page;
		info_queue_index = page_offset;

		/* Ensure we aren't waiting on any HTTP in this path */
		info_queue_http_request = true;

		/* Best-practice: ensure core arrays exist when reopening from cache */
		if (is_array(variable_global_get("online_content_data_" + string(content_type))))
		{
			var _total = array_length(variable_global_get("online_content_data_" + string(content_type)));
			var _force_reset = global.force_online_list_refresh || _content_type_changed;

			/* If switching list types (or explicitly refreshing), clear stale thumbnail/name/ID data */
			if (_force_reset)
			{
				/* Always reset paging so we start at the top of the new list */
				global.download_current_page = 0;
				info_queue_index = 0;
				page_offset = 0;

				/* Throw away any previous list data to avoid parsing stale JSON from the last content type */
				global.online_download_list = "";
				global.online_download_list_info = "";
				global.online_list_loaded = false;
				variable_global_set("online_content_data_" + string(content_type), undefined);

				if (is_array(global.spr_download_list_thumbnail))
				{
					for (var t = 0; t < array_length(global.spr_download_list_thumbnail); t++)
					{
						scr_delete_sprite_properly(global.spr_download_list_thumbnail[t]);
					}
				}

				global.spr_download_list_thumbnail = array_create(_total, spr_thumbnail_missing);
				global.draw_download_name = array_create(_total, "");
				all_download_id = array_create(_total, "");

				for (var p = 0; p < _total; p++)
				{
					var _item_reset = variable_global_get("online_content_data_" + string(content_type))[p];
					var _id_reset = _item_reset.name;
					_id_reset = string_replace(_id_reset, string(content_type) + "s/", "");
					_id_reset = string_replace(_id_reset, ".zip", "");
					all_download_id[p] = _id_reset;
				}

				/* Reset per-item status arrays so level metadata isn't mixed across lists */
				finished_level     = array_create(_total, undefined);
				zero_defeats_level = array_create(_total, undefined);
				liked_content      = array_create(_total, undefined);

				global.force_online_list_refresh = false;

				/* Reset async state so the first item re-requests fresh metadata */
				global.info_data = undefined;
				global.http_request_info = -1;
				info_queue_http_request = true;
				info_queue_index = page_offset; /* page_offset is 0 after reset above */
			}

			/* 1) Ensure all_download_id is an array (used to kick off per-item requests) */
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

			/* 5) Ensure per-item status arrays exist for cached path */
			if (!variable_instance_exists(self, "finished_level") || !is_array(finished_level) || array_length(finished_level) < _total || _force_reset)
			{
				finished_level = array_create(_total, undefined);
			}

			if (!variable_instance_exists(self, "zero_defeats_level") || !is_array(zero_defeats_level) || array_length(zero_defeats_level) < _total || _force_reset)
			{
				zero_defeats_level = array_create(_total, undefined);
			}

			if (!variable_instance_exists(self, "liked_content") || !is_array(liked_content) || array_length(liked_content) < _total || _force_reset)
			{
				liked_content = array_create(_total, undefined);
			}

			/* 4) Prepopulate all_download_id from list data so downloads can start immediately */
			if (!is_array(all_download_id) || array_length(all_download_id) < _total)
			{
				all_download_id = array_create(_total, "");
			}

			for (var a = 0; a < _total; a++)
			{
				var _item = variable_global_get("online_content_data_" + string(content_type))[a];
				var _id = _item.name;
				_id = string_replace(_id, string(content_type) + "s/", "");
				_id = string_replace(_id, ".zip", "");

				/* Always overwrite ID to avoid stale/mismatched requests */
				all_download_id[a] = _id;

				/* If the thumbnail is missing (or reset), clear the name so the loader spins and fetches again */
				var _thumb_missing = (!is_array(global.spr_download_list_thumbnail))
					|| (a >= array_length(global.spr_download_list_thumbnail))
					|| (global.spr_download_list_thumbnail[a] == spr_thumbnail_missing)
					|| (!sprite_exists(global.spr_download_list_thumbnail[a]));

				if (_force_reset || _thumb_missing)
				{
					global.draw_download_name[a] = "";
					if (is_array(global.spr_download_list_thumbnail)
					&& a < array_length(global.spr_download_list_thumbnail))
					{
						global.spr_download_list_thumbnail[a] = spr_thumbnail_missing;
					}
				}
			}

			global.online_download_cached_type = content_type;
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
	/* Mark that we’re actively loading from the server */
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
	
	if (global.http_request_id != -1)
	{
		/* Track the request context so late responses do not look like mismatches */
		if (!variable_global_exists("http_request_contexts")
		|| global.http_request_contexts == noone)
		{
			global.http_request_contexts = ds_map_create();
		}

		var _req_key = string(global.http_request_id);
		if (ds_map_exists(global.http_request_contexts, _req_key))
		{
			ds_map_replace(global.http_request_contexts, _req_key, "online_content_primary");
		}
		else
		{
			ds_map_add(global.http_request_contexts, _req_key, "online_content_primary");
		}

		global.online_primary_request_active = global.http_request_id;
		global.language_update_blocked = true;
		global.language_update_pending = true;
	}

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
