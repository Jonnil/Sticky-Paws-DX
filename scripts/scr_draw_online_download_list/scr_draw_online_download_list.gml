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
		if (data == undefined && in_online_download_list_menu)
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
	if (data != undefined && (menu != "search_id_ok"))
	{
		if (is_array(data))
		{
			var num_items = array_length(data);
			
			/* Draw each thumbnail (optimized loop through downloads) */
			for (var i = 0; i < num_items; i++)
			{
				scr_draw_online_download_list_thumbnail(i, num_items);
			}
		}
		
		if (is_array(data) && array_length(data) <= 0)
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
		if (gamepad_is_connected(global.player_slot[1]) &&
			(global.controls_used_for_navigation == "gamepad") || (global.always_show_gamepad_buttons))
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


/// @function scr_draw_online_download_list_thumbnail()
/// @description Draws a single download thumbnail along with its overlay information.
function scr_draw_online_download_list_thumbnail(thumbnail_index, number_of_thumbnails)
{
	/* Pre-calculate common GUI and offset values */
	var guiWidth = display_get_gui_width();
	var halfWidth = guiWidth * 0.5;
	var download_online_x = halfWidth - 300;
	var download_online_y = 80 + (300 * thumbnail_index);
	var offsetY = menu_y_offset; /* Cache menu_y_offset */
	var baseY = offsetY + download_online_y;
	
	/* Determine if this thumbnail is currently selected */
	var thumbID = "download_online_" + string(thumbnail_index);
	var isSelected = (menu == thumbID);
	
	#region /* Draw Bottom Line for Last Thumbnail */
	if (thumbnail_index == number_of_thumbnails - 1)
	{
		draw_line_width_color(30, baseY + 300, guiWidth - 30, baseY + 300, 7, c_black, c_black);
		draw_line_width_color(32, baseY + 300, guiWidth - 32, baseY + 300, 3, c_white, c_white);
	}
	#endregion /* Draw Bottom Line for Last Thumbnail END */
	
	#region /* Draw Selection Overlay if Selected */
	if (isSelected)
	{
		/* Cache wave values to reduce function calls */
		var waveArrow = scr_wave(10, 0, 1, 0);
		var waveBlink = scr_wave(1, 0, 2, 0);
		
		/* Calculate thumbnail boundaries */
		var topLeftX = download_online_x + 96;  /* (download_online_x + 100 - 4) */
		var topLeftY = download_online_y - 4;
		var bottomRightX = download_online_x + 488; /* (download_online_x + 484 + 4) */
		var bottomRightY = download_online_y + offsetY + 220; /* (download_online_y + menu_y_offset + 216 + 4) */
		
		/* Pre-calculate offsets for triangles */
		var topLeftXOffset = topLeftX - waveArrow;
		var topLeftYOffset = topLeftY + offsetY - waveArrow;
		var bottomRightXOffset = bottomRightX + waveArrow;
		var bottomRightYOffset = bottomRightY + waveArrow;
		var triangleSize = 32 - waveArrow;
		
		/* Draw a translucent rounded rectangle outline */
		var alphaWave = scr_wave(0.1, 0.2, 3, 0);
		draw_set_alpha(alphaWave);
		draw_roundrect_color_ext(topLeftX - 16, topLeftY + offsetY - 16, bottomRightX + 16, bottomRightY + 64, 50, 50, c_white, c_white, false);
		
		/* Reset alpha and draw selection rectangles */
		draw_set_alpha(1);
		draw_rectangle_color(topLeftX, topLeftY + offsetY, bottomRightX, bottomRightY, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(waveBlink);
		draw_rectangle_color(topLeftX, topLeftY + offsetY, bottomRightX, bottomRightY, c_yellow, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
	}
	#endregion /* Draw Selection Overlay if Selected END */
	
	#region /* Draw Thumbnail Sprite */
	var draw_thumbnail = spr_download_list_thumbnail[thumbnail_index];
	if (sprite_exists(draw_thumbnail))
	{
		var scaleX = 384 / sprite_get_width(draw_thumbnail);
		var scaleY = 216 / sprite_get_height(draw_thumbnail);
		draw_sprite_ext(draw_thumbnail, 0, download_online_x + 100, download_online_y + offsetY, scaleX, scaleY, 0, c_white, 1);
	}
	#endregion /* Draw Thumbnail Sprite END */
	
	#region /* Draw Download Name */
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var nameWidth = string_width(draw_download_name[thumbnail_index]);
	var draw_level_name_scale;
	if (nameWidth > 640)
	{
		draw_level_name_scale = global.default_text_size * 0.6;
	}
	else
	if (nameWidth > 320)
	{
		draw_level_name_scale = global.default_text_size * 0.8;
	}
	else
	{
		draw_level_name_scale = global.default_text_size;
	}
	scr_draw_text_outlined(download_online_x + 300, download_online_y + offsetY + 240, string(draw_download_name[thumbnail_index]), draw_level_name_scale, c_menu_outline, c_menu_fill, 1);
	#endregion /* Draw Download Name END */
	
	/* Loading Indicator for Missing Thumbnail */
	if (draw_thumbnail == spr_thumbnail_missing && draw_download_name[thumbnail_index] == "")
	{
		scr_draw_loading(1, download_online_x + 300, download_online_y + offsetY + 100);
	}
	
	#region /* Draw Selection Triangles */
	if (isSelected)
	{
		draw_triangle_color(topLeftXOffset, topLeftYOffset, topLeftXOffset + triangleSize, topLeftYOffset, 
			topLeftXOffset, topLeftYOffset + triangleSize, c_red, c_red, c_red, false);
		draw_triangle_color(bottomRightXOffset, bottomRightYOffset, bottomRightXOffset - triangleSize, bottomRightYOffset, 
			bottomRightXOffset, bottomRightYOffset - triangleSize, c_red, c_red, c_red, false);
		draw_triangle_color(bottomRightXOffset, topLeftYOffset, bottomRightXOffset - triangleSize, topLeftYOffset, 
			bottomRightXOffset, topLeftYOffset + triangleSize, c_red, c_red, c_red, false);
		draw_triangle_color(topLeftXOffset, bottomRightYOffset, topLeftXOffset + triangleSize, bottomRightYOffset, 
			topLeftXOffset, bottomRightYOffset - triangleSize, c_red, c_red, c_red, false);
		
		draw_set_alpha(waveBlink);
		draw_triangle_color(topLeftXOffset, topLeftYOffset, topLeftXOffset + triangleSize, topLeftYOffset, 
			topLeftXOffset, topLeftYOffset + triangleSize, c_yellow, c_yellow, c_yellow, false);
		draw_triangle_color(bottomRightXOffset, bottomRightYOffset, bottomRightXOffset - triangleSize, bottomRightYOffset, 
			bottomRightXOffset, bottomRightYOffset - triangleSize, c_yellow, c_yellow, c_yellow, false);
		draw_triangle_color(bottomRightXOffset, topLeftYOffset, bottomRightXOffset - triangleSize, topLeftYOffset, 
			bottomRightXOffset, topLeftYOffset + triangleSize, c_yellow, c_yellow, c_yellow, false);
		draw_triangle_color(topLeftXOffset, bottomRightYOffset, topLeftXOffset + triangleSize, bottomRightYOffset, 
			topLeftXOffset, bottomRightYOffset - triangleSize, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
	}
	#endregion /* Draw Selection Triangles END */
	
	#region /* Mouse Navigation */
	if (global.controls_used_for_navigation == "mouse" &&
		point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
			download_online_x + 100 - 16, download_online_y + offsetY - 16,
			download_online_x + 484 + 16, download_online_y + offsetY + 216 + 62) &&
		is_array(data) && (array_length(data) > 0))
	{
		if (!isSelected)
		{
			menu = thumbID;
		}
	}
	#endregion /* Mouse Navigation END */
	
	#region /* Process Download ID and Time */
	var item = data[thumbnail_index];
	var draw_download_id = item.name;
	draw_download_id = string_replace(draw_download_id, string(content_type) + "s/", "");
	draw_download_id = string_replace(draw_download_id, ".zip", "");
	var draw_download_time = string_replace(item.time_created, "T", " ");
	draw_download_time = string_replace(draw_download_time, "Z", "");
	
	if (all_download_id[thumbnail_index] == "")
	{
		all_download_id[thumbnail_index] = draw_download_id;
		show_debug_message("all_download_id[" + string(thumbnail_index) + "] = " + string(draw_download_id) + ";");
	}
	#endregion /* Process Download ID and Time END */
	
	#region /* Handle Thumbnail Hover and Download on Selection */
	if (isSelected)
	{
		currently_selected_id = draw_download_id;
		
		if (global.controls_used_for_navigation != "mouse")
		{
			menu_cursor_y_position = 64 + download_online_y;
		}
		var selected_download_c_menu_fill = c_lime;
		global.selected_online_download_index = thumbnail_index;
		
		if (key_a_pressed || (mouse_check_button_released(mb_left) &&
			point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
				download_online_x + 100, download_online_y + offsetY,
				download_online_x + 484, download_online_y + offsetY + 216)))
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				global.automatically_play_downloaded_level = false;
				global.use_temp_or_working = game_save_id;
				global.search_id = string_upper(draw_download_id);
				keyboard_string = string_upper(draw_download_id);
				search_id = string_upper(draw_download_id);
				automatically_search_for_id = true;
				in_online_download_list_menu = false;
				
				#region /* Set Thumbnail for Download Menu */
				scr_delete_sprite_properly(downloaded_thumbnail_sprite);
				if (sprite_exists(spr_download_list_thumbnail[global.selected_online_download_index]) &&
					(spr_download_list_thumbnail[global.selected_online_download_index] != spr_thumbnail_missing))
				{
					downloaded_thumbnail_sprite = spr_download_list_thumbnail[global.selected_online_download_index];
				}
				else
				{
					downloaded_thumbnail_sprite = noone;
				}
				#endregion /* Set Thumbnail for Download Menu END */
				
				menu = "search_id_ok";
			}
		}
	}
	else
	{
		var selected_download_c_menu_fill = c_gray;
	}
	#endregion /* Handle Thumbnail Hover and Download on Selection END */
	
	#region /* Display Index and Download ID */
	draw_set_halign(fa_right);
	scr_draw_text_outlined(download_online_x + 70, 110 + download_online_y + offsetY, string(thumbnail_index + 1), global.default_text_size * 0.75, c_menu_outline, selected_download_c_menu_fill, 0.5);
	
	draw_set_halign(fa_left);
	scr_draw_text_outlined(download_online_x + 108, 20 + download_online_y + offsetY, string(draw_download_id), global.default_text_size * 0.75, c_menu_outline, selected_download_c_menu_fill, 1);
	#endregion /* Display Index and Download ID END */
	
	#region /* Display Finished Level Status */
	if (content_type == "level")
	{
		if (is_array(finished_level))
		{
			if (finished_level[thumbnail_index] == undefined)
			{
				if (file_exists(game_save_id + "save_file/custom_level_save.ini"))
				{
					ini_open(game_save_id + "save_file/custom_level_save.ini");
					finished_level[thumbnail_index] = (ini_key_exists("finished_downloaded_level", draw_download_id)) ?
						ini_read_real("finished_downloaded_level", draw_download_id, 0) : 0;
					zero_defeats_level[thumbnail_index] = (ini_key_exists("zero_defeats_downloaded_level", draw_download_id)) ?
						ini_read_real("zero_defeats_downloaded_level", draw_download_id, 0) : 0;
					ini_close();
				}
				else
				{
					finished_level[thumbnail_index] = 0;
					zero_defeats_level[thumbnail_index] = 0;
				}
			}
		}
		
		#region /* Display Finished Icon */
		if (is_array(finished_level))
		{
			var played_level_text, played_level_icon, played_level_color;
			if (finished_level[thumbnail_index] == 1)
			{
				played_level_text = "Played";
				played_level_icon = spr_icon_played;
				played_level_color = c_yellow;
			}
			else
			if (finished_level[thumbnail_index] == 2)
			{
				played_level_text = "Finished";
				played_level_icon = spr_icon_finished;
				played_level_color = c_lime;
			}
			else
			if (finished_level[thumbnail_index] == 3)
			{
				played_level_text = "Completed";
				played_level_icon = spr_icon_finished;
				played_level_color = c_lime;
			}
			else
			{
				played_level_text = "Unplayed";
				played_level_icon = spr_icon_unplayed;
				played_level_color = c_red;
			}
			if (sprite_exists(played_level_icon))
			{
				draw_sprite_ext(played_level_icon, 0, download_online_x + 524, 32 + download_online_y + offsetY, 1, 1, 0, c_white, 1);
			}
			scr_draw_text_outlined(download_online_x + 548, 32 + download_online_y + offsetY, l10n_text(played_level_text), global.default_text_size, c_menu_outline, played_level_color, 1);
		}
		#endregion /* Display Finished Icon END */
		
		#region /* Display Zero Defeats Icon */
		if (is_array(zero_defeats_level))
		{
			var zero_defeats_level_text, zero_defeats_level_icon, zero_defeats_level_color;
			if (zero_defeats_level[thumbnail_index] == 1)
			{
				zero_defeats_level_text = "Zero Defeats";
				zero_defeats_level_icon = spr_icon_zero_defeats;
				zero_defeats_level_color = c_red;
			}
			else
			if (zero_defeats_level[thumbnail_index] == 2)
			{
				zero_defeats_level_text = "Zero Hits";
				zero_defeats_level_icon = spr_icon_zero_hits;
				zero_defeats_level_color = c_lime;
			}
			else
			{
				zero_defeats_level_text = "";
				zero_defeats_level_icon = spr_noone;
				zero_defeats_level_color = c_red;
			}
			if (zero_defeats_level_text != "")
			{
				if (sprite_exists(zero_defeats_level_icon))
				{
					draw_sprite_ext(zero_defeats_level_icon, 0, download_online_x + 524, 64 + download_online_y + offsetY, 1, 1, 0, c_white, 1);
				}
				scr_draw_text_outlined(download_online_x + 548, 64 + download_online_y + offsetY, l10n_text(zero_defeats_level_text), global.default_text_size, c_menu_outline, zero_defeats_level_color, 1);
			}
		}
		#endregion /* Display Zero Defeats Icon END */
		
	}
	#endregion /* Display Finished Level Status END */
	
	#region /* Display Like/Dislike Status */
	if (is_array(liked_content))
	{
		if (liked_content[thumbnail_index] == undefined)
		{
			if (file_exists(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini"))
			{
				ini_open(game_save_id + "save_file/custom_" + string(content_type) + "_save.ini");
				liked_content[thumbnail_index] = (ini_key_exists("liked_downloaded_" + string(content_type), draw_download_id)) ?
					ini_read_real("liked_downloaded_" + string(content_type), draw_download_id, 0) : 0;
				ini_close();
			}
			else
			{
				liked_content[thumbnail_index] = 0;
			}
		}
	}
	if (is_array(liked_content))
	{
		var liked_content_text, liked_content_icon, liked_content_color;
		if (liked_content[thumbnail_index] == +1)
		{
			liked_content_text = "Liked";
			liked_content_icon = spr_icon_liked;
			liked_content_color = c_aqua;
		}
		else
		if (liked_content[thumbnail_index] == -1)
		{
			liked_content_text = "Disliked";
			liked_content_icon = spr_icon_disliked;
			liked_content_color = c_red;
		}
		else
		{
			liked_content_text = "";
			liked_content_icon = spr_noone;
			liked_content_color = c_white;
		}
		if (liked_content_text != "")
		{
			if (sprite_exists(liked_content_icon))
			{
				draw_sprite_ext(liked_content_icon, 0, download_online_x + 524, 32 + download_online_y + offsetY, 1, 1, 0, c_white, 1);
			}
			scr_draw_text_outlined(download_online_x + 548, 32 + download_online_y + offsetY, l10n_text(liked_content_text), global.default_text_size, c_menu_outline, liked_content_color, 1);
		}
	}
	#endregion /* Display Like/Dislike Status END */
	
	scr_draw_text_outlined(download_online_x + 100, 270 + download_online_y + offsetY, string(get_relative_timezone(draw_download_time)), global.default_text_size * 0.75, c_menu_outline, selected_download_c_menu_fill, 1);
	draw_set_halign(fa_right);
	scr_draw_text_outlined(download_online_x + 490, 270 + download_online_y + offsetY, string(draw_download_time), global.default_text_size * 0.6, c_menu_outline, selected_download_c_menu_fill, 0.9);
}