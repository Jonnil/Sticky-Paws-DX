/// @function scr_process_online_download_list_data()
/// @description Parses the server JSON into arrays and initializes thumbnails (only on first load or forced refresh).
function scr_process_online_download_list_data()
{
	/* Show loading overlay & start timeout */
	scr_draw_loading(1, , , "Loading from server");
	scr_server_timeout(15);

	/* Only parse & init once per true load (or when forced) */
	if (global.online_list_loaded
	&& !global.force_online_list_refresh)
	{
		show_debug_message("[scr_process_online_download_list_data] Cache active – skipping re-init\n");
		return;
	}

	/* Interpret the online download list as JSON */
	if (global.online_download_list != ""
	&& global.online_download_list != "HTTP request exception"
	&& global.online_download_list != "Unauthorized")
	{
		show_debug_message("[scr_process_online_download_list_data] Valid list received. Parsing JSON...");

		try
		{
			/* Parse and compute pages */
			global.online_content_data = json_parse(global.online_download_list);
			var total = array_length(global.online_content_data);
			global.download_total_pages = ceil(total / global.download_items_per_page);
			show_debug_message("[scr_process_online_download_list_data] JSON parsed. Items: " + string(total));

			/* Loop over every item index */
			for (var i = 0; i < total; i++)
			{
				/* Clear any previous display name */
				global.draw_download_name[i] = "";

				/* --- Thumbnail setup --- */
				/* If we're forcing a full refresh, delete & reset */
				if (global.force_online_list_refresh)
				{
					if (is_array(global.spr_download_list_thumbnail)
					&& i < array_length(global.spr_download_list_thumbnail))
					{
						scr_delete_sprite_properly(global.spr_download_list_thumbnail[i]);
						show_debug_message("[scr_process_online_download_list_data] Deleted sprite at " + string(i));
					}

					global.spr_download_list_thumbnail[i] = spr_thumbnail_missing;
					show_debug_message("[scr_process_online_download_list_data] Reset thumbnail " + string(i));
				}
				else
				{
					/* First-time load: only set placeholder for slots we haven't yet touched */
					if (!is_array(global.spr_download_list_thumbnail)
					|| i >= array_length(global.spr_download_list_thumbnail))
					{
						global.spr_download_list_thumbnail[i] = spr_thumbnail_missing;
						show_debug_message("[scr_process_online_download_list_data] Init placeholder for " + string(i));
					}

					/* else: leave any existing sprite in place (cache hit) */
				}

				/* Reset ID lookup */
				all_download_id[i] = "";
			}

			/* Finished a true load – clear the refresh flag & mark loaded */
			global.force_online_list_refresh    = false;
			global.online_list_loaded            = true;
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
}
