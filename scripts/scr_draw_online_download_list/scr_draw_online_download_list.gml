/// @function scr_draw_online_download_list()
/// @description This script draws the online download list and all its visual elements.
function scr_draw_online_download_list()
{

	#region /* Draw Background Overlay */
	if (in_online_download_list_menu)
	{
		var guiWidth = display_get_gui_width(); /* Cache display width */
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, guiWidth, display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);

		#region /* Process Data */
		if (variable_global_get("online_content_data_" + string(content_type)) == undefined
		&& in_online_download_list_menu)
		{
			scr_draw_online_download_list_data();
		}
		else
		{
			scr_draw_online_download_menu_data();
		}
		#endregion /* Process Data END */

	}
	#endregion /* Draw Background Overlay END */

}


/// @function scr_draw_online_download_list_data()
/// @description Draw the online download list data
function scr_draw_online_download_list_data()
{
	scr_draw_loading(1, , , "Loading from server");
	
	var page_offset = global.download_current_page * global.download_items_per_page;
	info_queue_index = page_offset;
	
	/* Draw error messages when online download list returns errors */
	var centerX = display_get_gui_width() * 0.5;
	var centerY = display_get_gui_height() * 0.5 + 84;
	
	if (global.online_download_list == "HTTP request exception")
	{
		scr_draw_text_outlined(centerX, centerY, l10n_text("HTTP request exception"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(centerX, centerY, l10n_text("HTTP request exception"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
	}
	else
	if (global.online_download_list == "Unauthorized")
	{
		scr_draw_text_outlined(centerX, centerY, l10n_text("Unauthorized"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(centerX, centerY, l10n_text("Unauthorized"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
	}
}


/// @function scr_draw_online_download_menu_data()
/// @description Draws the online download menu with thumbnails, buttons, and handles navigation when data is available.
function scr_draw_online_download_menu_data()
{
	var guiWidth = display_get_gui_width();

	#region /* Show online downloads if data is available */
	if (variable_global_get("online_content_data_" + string(content_type)) != undefined
	&& (menu != "search_id_ok"))
	{
		/* Draw the back button always, even if there is no content uploaded yet */
		draw_menu_button(0, 0, l10n_text("Back"), "download_online_back", "");
		draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
		
		if (is_array(variable_global_get("online_content_data_" + string(content_type))))
		{
			/* I fixed so that the crashes don't happen anymore. BUT... you end up on a infinite loop of loading, that fixes itself whenever back out and go back to the Online Character List. At least it doesn't crash anymore, but it's still annoying that this happens at all, even if it's no longer game breaking
			TODO: If the loading screen is on-screen for too long, just make it tell the player to go back and enter the menu again. This usually fixes things like this. Implement this first, because this is the backup fix, in case I'm unable to fix the actual problem
			TODO 2: Fix the actual problem so that the "online content data" global variables don't randomly become non-arrays
			Should put the "global.online_content_data_level" and "global.online_content_data_character" on the debug screen */
			
			var num_items = array_length(variable_global_get("online_content_data_" + string(content_type)));
			
			/* If we haven't finished loading/parsing yet, keep showing the spinner instead of "nothing uploaded" */
			if (!global.online_list_loaded)
			{
				scr_draw_loading(1, , , "Loading from server");
				return;
			}
			
			/* If no items, skip pagination math that assumes a positive count */
			if (num_items <= 0)
			{
				/* Fall through to the "nothing uploaded" message below */
				draw_set_halign(fa_center);
				scr_draw_text_outlined(guiWidth * 0.5, display_get_gui_height() * 0.5,
					l10n_text("There is nothing uploaded yet!"), global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
				return;
			}
			
			/* Figure out our slice */
			var perPage        = global.download_items_per_page;
			var page        = clamp(global.download_current_page, 0, max(0, global.download_total_pages - 1));
			var start_idx    = page * perPage;
			var end_idx        = min(start_idx + perPage - 1, num_items - 1);
			var page_count    = end_idx - start_idx + 1;

			/* Draw each thumbnail, optimized loop through downloads. Draw only that page's thumbnails */
			for (var slot = 0; slot < page_count; slot++)
			{
				var actual = start_idx + slot;
				scr_draw_online_download_list_thumbnail(actual, page_count);
			}
			if (content_type == "level") scr_draw_online_collectible_progress(start_idx, end_idx);

			var x_prev = 0;
			var y_prev = 240;
			var x_label = 10;
			var y_label = 200;
			var x_next = 0;
			var y_next = 240 + 42;

			/* Draw Prev button if not on first page */
			if (global.download_current_page > 0)
			{
				draw_menu_button_sprite(spr_menu_button, x_prev, y_prev,,, 0.5, 1, 185, 42, l10n_text("Previous"), "download_online_page_prev", "download_online_page_prev");

				if (menu == "download_online_page_prev"
				&& (key_accept_pressed
				|| mouse_check_button_released(mb_left)
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x_prev, y_prev, x_prev + 185, y_prev + 42)))
				&& menu_delay == 0
				&& global.download_current_page > 0)
				{
					global.download_current_page = max(0, global.download_current_page - 1);

					global.selected_online_download_index -= global.download_items_per_page;

					var page_offset = global.download_current_page * global.download_items_per_page;
					info_queue_index = page_offset;
					info_queue_http_request = true; /* re-enable downloader for the new page */

					show_debug_message("[Pagination] Moved PREV from page "
						+ string(global.download_current_page + 1) + " to " + string(global.download_current_page)
						+ "; selected_index now " + string(global.selected_online_download_index));

					menu_delay = 3;
				}
			}

			/* Draw Next button if not on last page */
			if (global.download_current_page < global.download_total_pages - 1)
			{
				draw_menu_button_sprite(spr_menu_button, x_next, y_next,,, 0.5, 1, 185, 42, l10n_text("Next"), "download_online_page_next", "download_online_page_next");

				if (menu == "download_online_page_next"
				&& (key_accept_pressed
				|| mouse_check_button_released(mb_left)
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x_next, y_next, x_next + 185, y_next + 42)))
				&& menu_delay == 0
				&& global.download_current_page < global.download_total_pages)
				{
					global.download_current_page = min(global.download_total_pages - 1,
														global.download_current_page + 1);

					global.selected_online_download_index += global.download_items_per_page;

					var page_offset = global.download_current_page * global.download_items_per_page;
					info_queue_index = page_offset;
					info_queue_http_request = true; /* re-enable downloader for the new page */

					show_debug_message("[Pagination] Moved NEXT from page "
						+ string(global.download_current_page - 1) + " to " + string(global.download_current_page)
						+ "; selected_index now " + string(global.selected_online_download_index));

					menu_delay = 3;
				}
			}

			/* Show Page X of Y */
			draw_set_halign(fa_left);
			scr_draw_text_outlined(x_label, y_label,
				string(global.download_current_page + 1)
				+ " / " + string(global.download_total_pages), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}

		if (is_array(variable_global_get("online_content_data_" + string(content_type)))
		&& array_length(variable_global_get("online_content_data_" + string(content_type))) <= 0)
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(guiWidth * 0.5, display_get_gui_height() * 0.5,
				l10n_text("There is nothing uploaded yet!"), global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		}
	}
	#endregion /* Show online downloads if data is available END */
	
	#region /* Draw Search ID button */
	var draw_search_id_y = 42;

	if (global.free_communication_available)
	{
		if (content_type == "character")
		{
			draw_menu_button(0, draw_search_id_y, l10n_text("Search Character ID"), "download_online_search_id", "");
		}
		else
		if (content_type == "level")
		{
			draw_menu_button(0, draw_search_id_y, l10n_text("Search Level ID"), "download_online_search_id", "");
		}

		#region /* Draw Gamepad Search Key */
		if (gamepad_is_connected(global.player_slot[1])
		&& (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons))
		{
			scr_draw_gamepad_buttons(gp_face4, 16, draw_search_id_y + 21, 0.5, c_white, 1, 1, 1, 1);
		}
		#endregion /* Draw Gamepad Search Key END */

	}
	#endregion /* Draw Search ID button END */

	#region /* Draw Force Refresh button */
	var draw_force_refresh_y = 42 + 42;

	if (global.free_communication_available)
	{
		draw_menu_button(0, draw_force_refresh_y, l10n_text("Refresh"), "download_online_force_refresh", "");
	}
	#endregion /* Draw Force Refresh button END */

	#region /* Draw Load Custom Level Assets Option */
	if (content_type == "level")
	{
		var can_load_custom_level_assets_x = guiWidth - string_width(l10n_text("Load Custom Level Assets")) - 16;
		var can_load_custom_level_assets_y = 16;
		global.can_load_custom_level_assets = draw_menu_checkmark(can_load_custom_level_assets_x, can_load_custom_level_assets_y, l10n_text("Load Custom Level Assets"), "download_online_custom_level_assets", global.can_load_custom_level_assets, true, , false);
		scr_draw_option_description();
	}
	#endregion /* Draw Load Custom Level Assets Option END */

}

/* Raw catalogue rows show saved facts only. Inspecting one never downloads a level. */
function scr_draw_online_collectible_progress(start_index, end_index)
{
	var selected_index = -1;
	for (var index = start_index; index <= end_index; index++)
	{
		if (menu == "download_online_" + string(index)) { selected_index = index; break; }
	}
	if (selected_index < 0 || !in_online_download_list_menu) return;
	var data = global.online_content_data_level;
	if (!is_array(data) || selected_index >= array_length(data)) return;
	var level_id = string_upper(string_replace(string_replace(data[selected_index].name, "levels/", ""), ".zip", ""));
	var cache_key = level_id + "|" + game_save_id + "|" + string(global.difficulty);
	if (!variable_instance_exists(self, "big_collectible_online_list_cache"))
	{
		big_collectible_online_list_cache = {key:"", refreshed_at:0, model:undefined,
			state:scr_big_collectible_selector_create()};
	}
	var cache = big_collectible_online_list_cache;
	if (cache.key != cache_key || current_time - cache.refreshed_at >= 1000)
	{
		cache.model = scr_big_collectible_online_progress_load(level_id);
		cache.key = cache_key;
		cache.refreshed_at = current_time;
	}
	var bounds = scr_big_collectible_online_list_bounds(cache, selected_index, start_index);
	if (!bounds.visible) return;
	if (cache.model.ready && cache.model.counts[0] + cache.model.counts[1] + cache.model.counts[2] > 0)
	{
		scr_big_collectible_selector_step(cache.state, cache.model, bounds.left, bounds.top, bounds.width, bounds.height, 1, false);
		scr_big_collectible_entry_draw(cache, bounds.left, bounds.top, bounds.width, bounds.height, 1);
	}

}

/* Drawing and parent input ownership share fresh fitted bounds after a resize. */
function scr_big_collectible_online_list_bounds(cache, selected_index, start_index, offset = menu_y_offset)
{
	var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();
	var thumbnail_top = 80 + 300 * (selected_index - start_index) + offset;
	var bounds = {visible:thumbnail_top <= gui_height && thumbnail_top + 300 >= 0,
		left:gui_width - 16, top:clamp(thumbnail_top + 100, 96, max(96, gui_height - 144)),
		width:max(32, min(560, gui_width * 0.5 - 240)), height:0, layout:undefined};
	bounds.height = max(32, gui_height - bounds.top - 24);
	if (is_struct(cache.model) && cache.model.ready)
	{
		bounds.layout = scr_big_collectible_selector_layout(cache.model, 0, bounds.top, bounds.width, bounds.height, cache.state.scroll);
		bounds.left = gui_width - 16 - bounds.layout.width;
	}
	return bounds;
}

function scr_big_collectible_online_list_owns_mouse_wheel()
{
	if (content_type != "level" || !in_online_download_list_menu
	|| !variable_instance_exists(self, "big_collectible_online_list_cache")) return false;
	var cache = big_collectible_online_list_cache;
	if (!is_struct(cache.model) || !cache.model.ready) return false;
	var data = global.online_content_data_level;
	if (!is_array(data)) return false;
	var start_index = global.download_current_page * global.download_items_per_page;
	var end_index = min(start_index + global.download_items_per_page - 1, array_length(data) - 1);
	for (var index = start_index; index <= end_index; index++)
	{
		if (menu != "download_online_" + string(index)) continue;
		var level_id = string_upper(string_replace(string_replace(data[index].name, "levels/", ""), ".zip", ""));
		if (cache.key != level_id + "|" + game_save_id + "|" + string(global.difficulty)) return false;
		/* scr_scroll_menu keeps its existing lerp before processing wheel input. */
		var bounds = scr_big_collectible_online_list_bounds(cache, index, start_index, lerp(menu_y_offset, menu_y_offset_real, 0.25));
		if (!bounds.visible || bounds.layout.max_scroll <= 0) return false;
		return point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
			bounds.left, bounds.top, bounds.left + bounds.layout.width, bounds.layout.footer_bottom);
	}
	return false;
}
