/// @function scr_process_online_download_list_data()
/// @description Parses the server JSON into arrays and initializes thumbnails (only on first load or forced refresh).
function scr_process_online_download_list_data()
{
	/* Only parse & init once per true load (or when forced) */
	if (global.online_list_loaded
	&& !global.force_online_list_refresh)
	{
		show_debug_message("[scr_process_online_download_list_data] Cache active - skipping re-init\n");
		global.server_timeout_end = undefined; /* Clear stale timeout when using cache */
		return;
	}

	/* Show loading overlay & start timeout only when doing a real load */
	scr_draw_loading(1, , , "Loading from server 4");
	scr_server_timeout(15);
	
	/* Interpret the online download list as JSON */
	if (global.online_download_list != ""
	&& global.online_download_list != "HTTP request exception"
	&& global.online_download_list != "Unauthorized")
	{
		show_debug_message("[scr_process_online_download_list_data] Valid list received. Parsing JSON...");
		
		try
		{
			/* Parse and compute pages */
			variable_global_set("online_content_data_" + string(content_type), json_parse(global.online_download_list));
			var total = array_length(variable_global_get("online_content_data_" + string(content_type)));
			global.download_total_pages = ceil(total / global.download_items_per_page);
			show_debug_message("[scr_process_online_download_list_data] JSON parsed. Items: " + string(total));

			/* Ensure per-item arrays exist and are sized to the parsed total */
			if (!is_array(global.draw_download_name) || array_length(global.draw_download_name) != total)
			{
				global.draw_download_name = array_create(total, "");
			}

			if (!is_array(all_download_id) || array_length(all_download_id) != total)
			{
				all_download_id = array_create(total, "");
			}

			/* Rebuild thumbnail array on forced refresh, otherwise resize safely */
			if (global.force_online_list_refresh)
			{
				if (is_array(global.spr_download_list_thumbnail))
				{
					for (var d = 0; d < array_length(global.spr_download_list_thumbnail); d++)
					{
						scr_delete_sprite_properly(global.spr_download_list_thumbnail[d]);
					}
				}
				global.spr_download_list_thumbnail = array_create(total, spr_thumbnail_missing);
			}
			else
			{
				var _old_len = is_array(global.spr_download_list_thumbnail) ? array_length(global.spr_download_list_thumbnail) : 0;
				var _new_thumbs = array_create(total, spr_thumbnail_missing);

				for (var c = 0; c < min(_old_len, total); c++)
				{
					_new_thumbs[c] = global.spr_download_list_thumbnail[c];
				}

				/* Clean up any sprites that won't be kept when shrinking */
				if (_old_len > total && is_array(global.spr_download_list_thumbnail))
				{
					for (var r = total; r < _old_len; r++)
					{
						scr_delete_sprite_properly(global.spr_download_list_thumbnail[r]);
					}
				}

				global.spr_download_list_thumbnail = _new_thumbs;
			}
			
			/* Loop over every item index */
			for (var i = 0; i < total; i++)
			{
				/* Extract ID immediately so thumbnail/info requests have valid IDs */
				var _item = variable_global_get("online_content_data_" + string(content_type))[i];
				var _id_str = _item.name;
				_id_str = string_replace(_id_str, string(content_type) + "s/", "");
				_id_str = string_replace(_id_str, ".zip", "");
				all_download_id[i] = _id_str;

				/* Clear any previous display name (will be set by metadata later) */
				global.draw_download_name[i] = "";

				/* --- Thumbnail setup --- */
				global.spr_download_list_thumbnail[i] = spr_thumbnail_missing;
				show_debug_message("[scr_process_online_download_list_data] Thumbnail placeholder set at " + string(i));
			}
			
			/* Finished a true load - clear the refresh flag & mark loaded */
			global.force_online_list_refresh    = false;
			global.online_list_loaded            = true;
			global.server_timeout_end           = undefined; /* Clear timeout after successful load */
		}
		catch (e)
		{
			show_debug_message("[scr_process_online_download_list_data] ERROR parsing JSON: " + string(e));
		}
	}
	else
	if (global.online_download_list == "HTTP request exception")
	{
		show_debug_message("[scr_process_online_download_list_data] ERROR: HTTP request exception");
		scr_draw_text_outlined(
			display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84,
			l10n_text("HTTP request exception"),
			global.default_text_size,
			c_white, c_black, 1
		);
		scr_draw_text_outlined(
			display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84,
			l10n_text("HTTP request exception"),
			global.default_text_size,
			c_white, c_red, scr_wave(0, 1, 1, 0)
		);
	}
	else
	if (global.online_download_list == "Unauthorized")
	{
		show_debug_message("[scr_process_online_download_list_data] ERROR: Unauthorized response");
		scr_draw_text_outlined(
			display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84,
			l10n_text("Unauthorized"),
			global.default_text_size,
			c_white, c_black, 1
		);
		scr_draw_text_outlined(
			display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84,
			l10n_text("Unauthorized"),
			global.default_text_size,
			c_white, c_red, scr_wave(0, 1, 1, 0)
		);
	}
	else
	if (global.online_download_list == "")
	{
		show_debug_message("[scr_process_online_download_list_data] ERROR: No response, empty string");
	}
}
