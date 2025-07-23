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
		if (online_content_data == undefined
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
	if (online_content_data != undefined
	&& (menu != "search_id_ok"))
	{
		if (is_array(online_content_data))
		{
			var num_items = array_length(online_content_data);
			/* Figure out our slice */
			var perPage		= global.download_items_per_page;
			var page		= clamp(global.download_current_page, 0, global.download_total_pages - 1);
			var start_idx	= page * perPage;
			var end_idx		= min(start_idx + perPage - 1, array_length(online_content_data) - 1);
			var page_count	= end_idx - start_idx + 1;
			
			/* Draw each thumbnail, optimized loop through downloads. Draw only that page's thumbnails */
			for (var slot = 0; slot < page_count; slot++)
			{
				var actual = start_idx + slot;
				scr_draw_online_download_list_thumbnail(actual, page_count);
			}
			
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
				&& key_a_pressed
				&& menu_delay == 0
				&& global.download_current_page > 0)
				{
					global.download_current_page = max(0, global.download_current_page - 1);
					
					global.selected_online_download_index -= global.download_items_per_page;
					
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
				&& key_a_pressed
				&& menu_delay == 0
				&& global.download_current_page < global.download_total_pages)
				{
					global.download_current_page = min(global.download_total_pages - 1,
														global.download_current_page + 1);
					
					global.selected_online_download_index += global.download_items_per_page;
					
					show_debug_message("[Pagination] Moved NEXT from page "
			            + string(global.download_current_page - 1) + " to " + string(global.download_current_page)
			            + "; selected_index now " + string(global.selected_online_download_index));
					
					menu_delay = 3;
				}
			}
			
			/* Show Page X of Y */
			draw_set_halign(fa_left);
			draw_text(x_label, y_label,
				string(global.download_current_page + 1)
				+ " / " + string(global.download_total_pages));
		}
		
		if (is_array(online_content_data)
		&& array_length(online_content_data) <= 0)
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(guiWidth * 0.5, display_get_gui_height() * 0.5, 
				l10n_text("There is nothing uploaded yet!"), global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		}
	}
	#endregion /* Show online downloads if data is available END */
	
	#region /* Draw Back and Search ID buttons */
	draw_menu_button(0, 0, l10n_text("Back"), "download_online_back", "");
	draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
	
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
	#endregion /* Draw Back and Search ID buttons END */
	
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