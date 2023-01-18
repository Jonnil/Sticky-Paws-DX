function scr_draw_level_editor_thumbnail(load_what_levels, show_first_thumbnail_name)
{
	
	#region /* Red rectangle behind the level thumbnail to indicate what level you are selecting */
	var top_left_of_thumbnail_x = 394 * (global.select_level_index - column * row) + 100 - 3 + thumbnail_x_offset;
	var top_left_of_thumbnail_y = 226 * (column - scroll) + 250 - 3;
	var bottom_right_of_thumbnail_x = 394 * (global.select_level_index - column * row) + 100 + 384 + 3 + thumbnail_x_offset;
	var bottom_right_of_thumbnail_y = 226 * (column - scroll) + 250 + 216 + 3;
	
	if (menu!= "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
	and (menu_delay <= 0)
	or (menu!= "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
	and (open_sub_menu == true)
	{
		var custom_level_select_blinking = scr_wave(1, 0, 2, 0);
		rectangle_top_left_of_thumbnail_x = lerp(rectangle_top_left_of_thumbnail_x, top_left_of_thumbnail_x, 0.3);
		rectangle_top_left_of_thumbnail_y = lerp(rectangle_top_left_of_thumbnail_y, top_left_of_thumbnail_y, 0.3);
		rectangle_bottom_right_of_thumbnail_x = lerp(rectangle_bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_x, 0.3);
		rectangle_bottom_right_of_thumbnail_y = lerp(rectangle_bottom_right_of_thumbnail_y, bottom_right_of_thumbnail_y, 0.3);
		
		draw_set_alpha(0.5);
		draw_rectangle_color(rectangle_top_left_of_thumbnail_x, rectangle_top_left_of_thumbnail_y, rectangle_bottom_right_of_thumbnail_x, rectangle_bottom_right_of_thumbnail_y, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(custom_level_select_blinking * 0.5);
		draw_rectangle_color(rectangle_top_left_of_thumbnail_x, rectangle_top_left_of_thumbnail_y, rectangle_bottom_right_of_thumbnail_x, rectangle_bottom_right_of_thumbnail_y, c_yellow, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
		
		draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(custom_level_select_blinking);
		draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_yellow, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
	}
	#endregion /* Red rectangle behind the level thumbnail to indicate what level you are selecting END */
	
	#region /* Draw Thumbnail */
	for(i = 0; i < ds_list_size(global.thumbnail_sprite); i += 1)
	{
		column = floor(i/ row)
		draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, i), 0, 394 * (i - column * row) + 100 + thumbnail_x_offset, 226 * (column - scroll) + 250, 384/sprite_get_width(ds_list_find_value(global.thumbnail_sprite, i)), 216/sprite_get_height(ds_list_find_value(global.thumbnail_sprite, i)), 0, c_white, 1);
		if (show_first_thumbnail_name = false)
		and (i >= 1)
		and (menu != "load_custom_level")
		and (menu != "load_characters")
		and (menu != "load_official_level_template")
		or (show_first_thumbnail_name == true)
		and (menu != "load_custom_level")
		and (menu != "load_characters")
		and (menu != "load_official_level_template")
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			/* Draw level name on top of level thumbnail */ scr_draw_text_outlined(394 * (i - column * row) + 100 + 192 + thumbnail_x_offset, 226 * (column - scroll) + 250 + 184, string(ds_list_find_value(load_what_levels, i)), global.default_text_size * 1.2, c_white, c_black, 1);
			
			#region /* Draw if level have been Clear Checked on top of level thumbnail */
			if (i >= 1)
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, i)) + "/data/level_information.ini");
				
				var clear_check = ini_read_string("info", "clear_check", false);
				
				if (clear_check == true)
				and (ini_key_exists("info", "clear_check"))
				{
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					if (global.select_level_index == i)
					{
						scr_draw_text_outlined(394 * (i - column * row) + 140 + thumbnail_x_offset, 226 * (column - scroll) + 274, string(l10n_text("Clear Checked")), global.default_text_size * scr_wave(1, 1.1, 1, 0), c_white, c_black, 1);
					}
					draw_sprite_ext(spr_checkpoint, 1, 394 * (i - column * row) + 120 + thumbnail_x_offset, 226 * (column - scroll) + 274, scr_wave(0.4, 0.5, 1, 0), scr_wave(0.4, 0.5, 1, 0), 0, c_white, 1);
				}
				ini_close();
			}
			#endregion /* Draw if level have been Clear Checked on top of level thumbnail END */
			
		}
	}
	#endregion /* Draw Thumbnail END */
	
	#region /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting */
	if (menu!= "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
	and (menu_delay <= 0)
	or (menu!= "back_from_level_editor")
	and (menu != "open_custom_levels_folder")
	and (open_sub_menu == true)
	{
		var custom_level_select_arrows_moving = scr_wave(10, 0, 1, 0);
		
		#region /* Red Triangles */
		
		#region /* Top Left Red Triangle */
		draw_triangle_color(
		/* x1 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y1 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x2 */ top_left_of_thumbnail_x + 32 - (custom_level_select_arrows_moving),
		/* y2 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x3 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y3 */ top_left_of_thumbnail_y + 32 - (custom_level_select_arrows_moving), c_red, c_red, c_red, false);
		#endregion /* Top Left Red Triangle END */
		
		#region /* Bottom Right Red Triangle */
		draw_triangle_color(
		/* x1 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y1 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x2 */ bottom_right_of_thumbnail_x - 32 + (custom_level_select_arrows_moving),
		/* y2 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x3 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y3 */ bottom_right_of_thumbnail_y - 32 + (custom_level_select_arrows_moving), c_red, c_red, c_red, false);
		#endregion /* Bottom Right Red Triangle END */
		
		#region /* Top Right Red Triangle */
		draw_triangle_color(
		/* x1 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y1 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x2 */ bottom_right_of_thumbnail_x - 32 + (custom_level_select_arrows_moving),
		/* y2 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x3 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y3 */ top_left_of_thumbnail_y + 32 - (custom_level_select_arrows_moving), c_red, c_red, c_red, false);
		#endregion /* Top Right Red Triangle END */
		
		#region /* Bottom Left Red Triangle */
		draw_triangle_color(
		/* x1 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y1 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x2 */ top_left_of_thumbnail_x + 32 - (custom_level_select_arrows_moving),
		/* y2 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x3 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y3 */ bottom_right_of_thumbnail_y - 32 + (custom_level_select_arrows_moving), c_red, c_red, c_red, false);
		#endregion /* Bottom Left Red Triangle END */
		
		#endregion /* Red Triangles END */
		
		draw_set_alpha(custom_level_select_blinking);
		
		#region /* Yellow Triangles */
		
		#region /* Top Left Yellow Triangle */
		draw_triangle_color(
		/* x1 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y1 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x2 */ top_left_of_thumbnail_x + 32 - (custom_level_select_arrows_moving),
		/* y2 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x3 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y3 */ top_left_of_thumbnail_y + 32 - (custom_level_select_arrows_moving), c_yellow, c_yellow, c_yellow, false);
		#endregion /* Top Left Yellow Triangle END */
		
		#region /* Bottom Right Yellow Triangle */
		draw_triangle_color(
		/* x1 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y1 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x2 */ bottom_right_of_thumbnail_x - 32 + (custom_level_select_arrows_moving),
		/* y2 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x3 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y3 */ bottom_right_of_thumbnail_y - 32 + (custom_level_select_arrows_moving), c_yellow, c_yellow, c_yellow, false);
		#endregion /* Bottom Right Yellow Triangle END */
		
		#region /* Top Right Yellow Triangle */
		draw_triangle_color(
		/* x1 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y1 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x2 */ bottom_right_of_thumbnail_x - 32 + (custom_level_select_arrows_moving),
		/* y2 */ top_left_of_thumbnail_y - (custom_level_select_arrows_moving),
		/* x3 */ bottom_right_of_thumbnail_x + (custom_level_select_arrows_moving),
		/* y3 */ top_left_of_thumbnail_y + 32 - (custom_level_select_arrows_moving), c_yellow, c_yellow, c_yellow, false);
		#endregion /* Top Right Yellow Triangle END */
		
		#region /* Bottom Left Yellow Triangle */
		draw_triangle_color(
		/* x1 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y1 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x2 */ top_left_of_thumbnail_x + 32 - (custom_level_select_arrows_moving),
		/* y2 */ bottom_right_of_thumbnail_y + (custom_level_select_arrows_moving),
		/* x3 */ top_left_of_thumbnail_x - (custom_level_select_arrows_moving),
		/* y3 */ bottom_right_of_thumbnail_y - 32 + (custom_level_select_arrows_moving), c_yellow, c_yellow, c_yellow, false);
		#endregion /* Bottom Left Yellow Triangle END */
		
		#endregion /* Yellow Triangles END */
		
		draw_set_alpha(1);
	}
	#endregion /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting END */
	
}