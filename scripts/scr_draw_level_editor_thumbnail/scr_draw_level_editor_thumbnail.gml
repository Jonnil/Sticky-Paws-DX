function scr_draw_level_editor_thumbnail(load_what_levels = global.all_loaded_custom_levels, show_first_thumbnail_name = false)
{
	var custom_level_select_blinking = 0;
	
	#region /* Red rectangle behind the level thumbnail to indicate what level you are selecting */
	var top_left_of_thumbnail_x = 394 * (global.select_level_index - column * row) + 100 - 3 + thumbnail_x_offset;
	var top_left_of_thumbnail_y = 226 * (column - scroll) + 250 - 3;
	var bottom_right_of_thumbnail_x = 394 * (global.select_level_index - column * row) + 100 + 384 + 3 + thumbnail_x_offset;
	var bottom_right_of_thumbnail_y = 226 * (column - scroll) + 466 + 3;
	
	if (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "caution_online_network_service_unavailable")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
	&& (!open_sub_menu && menu_delay <= 2 || open_sub_menu)
	{
		var custom_level_select_blinking = scr_wave(1, 0, 2, 0);
		draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_red, c_red, c_red, c_red, false);
		draw_set_alpha(custom_level_select_blinking);
		draw_rectangle_color(top_left_of_thumbnail_x, top_left_of_thumbnail_y, bottom_right_of_thumbnail_x, bottom_right_of_thumbnail_y, c_yellow, c_yellow, c_yellow, c_yellow, false);
		draw_set_alpha(1);
	}
	#endregion /* Red rectangle behind the level thumbnail to indicate what level you are selecting END */
	
	#region /* Draw Thumbnail */
	for(var i = 0; i < ds_list_size(global.thumbnail_sprite); i += 1)
	{
		column = floor(i / row);
		if (ds_list_find_value(global.thumbnail_sprite, i) > 0)
		{
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, i), 0, 394 * (i - column * row) + 100 + thumbnail_x_offset, 226 * (column - scroll) + 250, 384/sprite_get_width(ds_list_find_value(global.thumbnail_sprite, i)), 216/sprite_get_height(ds_list_find_value(global.thumbnail_sprite, i)), 0, c_white, 1);
		}
		
		if (i == ds_list_size(global.thumbnail_sprite) - 1)
		{
			draw_line_width_color(30, 226 * (column - scroll) + 500, display_get_gui_width() - 30, 226 * (column - scroll) + 500, 7, c_black, c_black);
			draw_line_width_color(32, 226 * (column - scroll) + 500, display_get_gui_width() - 32, 226 * (column - scroll) + 500, 3, c_white, c_white);
		}
		
		if (!show_first_thumbnail_name)
		&& (i >= 1)
		&& (menu != "load_custom_level")
		&& (menu != "load_characters")
		&& (menu != "load_official_level_template")
		|| (show_first_thumbnail_name)
		&& (menu != "load_custom_level")
		&& (menu != "load_characters")
		&& (menu != "load_official_level_template")
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			/* Draw level name on top of level thumbnail */
			if (load_what_levels == global.all_loaded_custom_levels)
			&& (is_array(thumbnail_level_name))
			&& (array_length(thumbnail_level_name) > 0)
			&& (i >= 0)
			&& (i < array_length(thumbnail_level_name))
			{
				if (string_width(thumbnail_level_name[i]) > 640)
				{
					var draw_level_name_scale = global.default_text_size * 0.6;
				}
				else
				if (string_width(thumbnail_level_name[i]) > 320)
				{
					var draw_level_name_scale = global.default_text_size * 0.8;
				}
				else
				{
					var draw_level_name_scale = global.default_text_size;
				}
				scr_draw_text_outlined(394 * (i - column * row) + 100 + 192 + thumbnail_x_offset, 226 * (column - scroll) + 450, string(thumbnail_level_name[i]), draw_level_name_scale, c_black, c_white, 1);
			}
			else
			if (load_what_levels == global.all_loaded_main_levels)
			{
				if (string_width(ds_list_find_value(load_what_levels, i)) > 640)
				{
					var draw_level_name_scale = global.default_text_size * 0.6;
				}
				else
				if (string_width(ds_list_find_value(load_what_levels, i)) > 320)
				{
					var draw_level_name_scale = global.default_text_size * 0.8;
				}
				else
				{
					var draw_level_name_scale = global.default_text_size;
				}
				scr_draw_text_outlined(394 * (i - column * row) + 100 + 192 + thumbnail_x_offset, 226 * (column - scroll) + 450, string(ds_list_find_value(load_what_levels, i)), global.default_text_size * 0.8, c_black, c_white, 1);
			}
			
			#region /* Draw if level have been Clear Checked on top of level thumbnail */
			clear_check = false;
			if (room == rm_title)
			{
				if (variable_instance_exists(self, "thumbnail_clear_check"))
				&& (variable_instance_exists(self, "thumbnail_level_id"))
				&& (variable_instance_exists(self, "thumbnail_level_unlisted"))
				&& (is_array(thumbnail_clear_check))
				&& (array_length(thumbnail_clear_check) > 0)
				&& (is_array(thumbnail_level_id))
				&& (array_length(thumbnail_level_id) > 0)
				&& (is_array(thumbnail_level_unlisted))
				&& (array_length(thumbnail_level_unlisted) > 0)
				&& (!level_editor_template_select && i >= 1)
				&& (i < array_length(thumbnail_clear_check))
				&& (i < array_length(thumbnail_level_id))
				&& (i < array_length(thumbnail_level_unlisted))
				{
					var clear_check = thumbnail_clear_check[i];
					var var_level_id = thumbnail_level_id[i];
					var var_level_unlisted = thumbnail_level_unlisted[i];
					var level_id_text = "";
					var level_unlisted_text = "";
					var clear_check_text = "";
					
					/* Get the Level ID */
					if (var_level_id != "")
					{
						if (global.select_level_index == i)
						{
							var level_id_text = string(var_level_id);
							var level_unlisted_text = l10n_text("Unlisted");
							if (room == rm_title)
							{
								global.search_id = string(var_level_id); /* Set the global search id for future use within the level editor */
							}
						}
						var icon_scale = scr_wave(0.9, 1, 1, 0);
					}
					else
					if (room == rm_title)
					{
						global.search_id = ""; /* Reset the global search id so it's blank */
					}
					
					/* Get the Clear Check status */
					if (clear_check)
					{
						if (global.select_level_index == i)
						{
							var clear_check_text = l10n_text("Clear Checked");
							if (room == rm_title)
							{
								global.search_id = string(var_level_id); /* Set the global search id for future use within the level editor */
							}
						}
						var icon_scale = scr_wave(0.9, 1, 1, 0);
					}
					
					var draw_x = 394 * (i - column * row) + 140 + thumbnail_x_offset;
					var level_id_draw_y = 226 * (column - scroll) + 274;
					var unlisted_draw_y = 226 * (column - scroll) + 274;
					var clear_check_draw_y = 226 * (column - scroll) + 274;
					var text_size = global.default_text_size * scr_wave(1, 1.1, 1, 0);
						
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					
					/* Draw Level ID furthest up */
					if (var_level_id != "")
					{
						scr_draw_text_outlined(draw_x, level_id_draw_y, level_id_text, text_size, c_white, c_black, 1);
						draw_sprite_ext(spr_icon_upload, 1, draw_x - 20, level_id_draw_y, icon_scale, icon_scale, 0, c_white, 1);
						var unlisted_draw_y = level_id_draw_y + 32;
						var clear_check_draw_y = level_id_draw_y + 32;
					}
					
					/* Draw if level is unlisted below Level ID */
					if (var_level_unlisted)
					{
						scr_draw_text_outlined(draw_x, unlisted_draw_y, level_unlisted_text, text_size, c_white, c_black, 1);
						draw_sprite_ext(spr_icon_unlisted, 1, draw_x - 20, unlisted_draw_y, icon_scale, icon_scale, 0, c_white, 1);
						var clear_check_draw_y = unlisted_draw_y + 32;
					}
					
					/* Draw Clear Check status below if level is unlisted */
					if (clear_check)
					{
						scr_draw_text_outlined(draw_x, clear_check_draw_y, clear_check_text, text_size, c_white, c_black, 1);
						draw_sprite_ext(spr_icon_finished, 1, draw_x - 20, clear_check_draw_y, icon_scale, icon_scale, 0, c_white, 1);
					}
				}
			}
			#endregion /* Draw if level have been Clear Checked on top of level thumbnail END */
			
			#region /* Draw if level have been created in Daily Build mode on top of level thumbnail */
			if (room == rm_title)
			{
				if (variable_instance_exists(self, "thumbnail_daily_build"))
				&& (is_array(thumbnail_daily_build))
				&& (array_length(thumbnail_daily_build) > 0)
				&& (!level_editor_template_select && i >= 1)
				&& (i < array_length(thumbnail_daily_build))
				{
					if (thumbnail_daily_build[i])
					{
						var icon_scale = scr_wave(0.9, 1, 1, 0);
						var draw_x = 394 * (i - column * row) + 140 + thumbnail_x_offset;
						if (clear_check)
						{
							var daily_build_draw_y = clear_check_draw_y + 32;
						}
						else
						if (var_level_id != "")
						{
							var daily_build_draw_y = level_id_draw_y + 32;
						}
						else
						{
							var daily_build_draw_y = 226 * (column - scroll) + 274;
						}
						if (global.select_level_index == i)
						{
							draw_set_halign(fa_left);
							draw_set_valign(fa_middle);
							scr_draw_text_outlined(draw_x, daily_build_draw_y, l10n_text("Daily Build"), global.default_text_size * scr_wave(1, 1.1, 1, 0), c_white, c_black, 1);
						}
						draw_sprite_ext(spr_icon_daily_build, 1, draw_x - 20, daily_build_draw_y, icon_scale, icon_scale, 0, c_white, 1);
					}
				}
			}
			#endregion /* Draw if level have been created in Daily Build mode on top of level thumbnail END */
			
		}
		
		if (i == 0)
		&& (ds_list_size(global.all_loaded_custom_levels) - 1 >= global.max_custom_levels)
		{
			var draw_x = 394 * (i - column * row) + 292 + thumbnail_x_offset;
			var draw_y = 226 * (column - scroll) + 358;
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, i), 0, 394 * (i - column * row) + 100 + thumbnail_x_offset, 226 * (column - scroll) + 250, 384/sprite_get_width(ds_list_find_value(global.thumbnail_sprite, i)), 216/sprite_get_height(ds_list_find_value(global.thumbnail_sprite, i)), 0, c_dkgray, 1);
			draw_sprite_ext(spr_lock_icon, 0, draw_x, draw_y, 1, 1, 0, c_white, 1);
		}
	}
	#endregion /* Draw Thumbnail END */
	
	#region /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting */
	if (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "caution_online_network_service_unavailable")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
	&& (!open_sub_menu && menu_delay <= 2 || open_sub_menu)
	{
		var custom_level_select_arrows_moving = scr_wave(10, 0, 1, 0);
		var top_left_x_offset = top_left_of_thumbnail_x - custom_level_select_arrows_moving;
		var top_left_y_offset = top_left_of_thumbnail_y - custom_level_select_arrows_moving;
		var bottom_right_x_offset = bottom_right_of_thumbnail_x + custom_level_select_arrows_moving;
		var bottom_right_y_offset = bottom_right_of_thumbnail_y + custom_level_select_arrows_moving;
		var triangle_size = 32 - custom_level_select_arrows_moving;
		
		/* Draw red triangles */
		draw_triangle_color(top_left_x_offset, top_left_y_offset, top_left_x_offset + triangle_size, top_left_y_offset,
			top_left_x_offset, top_left_y_offset + triangle_size, c_red, c_red, c_red, false);
		
		draw_triangle_color(bottom_right_x_offset, bottom_right_y_offset, bottom_right_x_offset - triangle_size, bottom_right_y_offset,
			bottom_right_x_offset, bottom_right_y_offset - triangle_size, c_red, c_red, c_red, false);
		
		draw_triangle_color(bottom_right_x_offset, top_left_y_offset, bottom_right_x_offset - triangle_size, top_left_y_offset,
			bottom_right_x_offset, top_left_y_offset + triangle_size, c_red, c_red, c_red, false);
		
		draw_triangle_color(top_left_x_offset, bottom_right_y_offset, top_left_x_offset + triangle_size, bottom_right_y_offset,
			top_left_x_offset, bottom_right_y_offset - triangle_size, c_red, c_red, c_red, false);
			
		draw_set_alpha(custom_level_select_blinking);
		
		/* Draw yellow triangles */
		draw_triangle_color(top_left_x_offset, top_left_y_offset, top_left_x_offset + triangle_size, top_left_y_offset,
			top_left_x_offset, top_left_y_offset + triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_triangle_color(bottom_right_x_offset, bottom_right_y_offset, bottom_right_x_offset - triangle_size, bottom_right_y_offset,
			bottom_right_x_offset, bottom_right_y_offset - triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_triangle_color(bottom_right_x_offset, top_left_y_offset, bottom_right_x_offset - triangle_size, top_left_y_offset,
			bottom_right_x_offset, top_left_y_offset + triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_triangle_color(top_left_x_offset, bottom_right_y_offset, top_left_x_offset + triangle_size, bottom_right_y_offset,
			top_left_x_offset, bottom_right_y_offset - triangle_size, c_yellow, c_yellow, c_yellow, false);
			
		draw_set_alpha(1);
	}
	#endregion /* Draw 4 red small triangles above the level thumbnail to be even more certain what level you are selecting END */
	
}