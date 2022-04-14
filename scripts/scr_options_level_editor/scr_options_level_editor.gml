function scr_options_level_editor()
{
	var level_editor_options_x = 500;
	var options_level_editor_right_arrow_x = 600;
	var custom_background_1_x_offset_y = (40 * 3);
	var custom_background_1_y_offset_y = (40 * 4);
	var custom_background_2_x_offset_y = (40 * 5);
	var custom_background_2_y_offset_y = (40 * 6);
	var custom_background_3_x_offset_y = (40 * 7);
	var custom_background_3_y_offset_y = (40 * 8);
	var custom_background_4_x_offset_y = (40 * 9);
	var custom_background_4_y_offset_y = (40 * 10);
	var custom_foreground_1_x_offset_y = (40 * 11);
	var custom_foreground_1_y_offset_y = (40 * 12);
	var custom_foreground_above_static_objects_x_offset_y = (40 * 13);
	var custom_foreground_above_static_objects_y_offset_y = (40 * 14);
	var custom_foreground_2_x_offset_y = (40 * 15);
	var custom_foreground_2_y_offset_y = (40 * 16);
	var custom_foreground_secret_x_offset_y = (40 * 17);
	var custom_foreground_secret_y_offset_y = (40 * 18);
	
	var custom_background_1_x_parallax_y = (40 * 19);
	var custom_background_1_y_parallax_y = (40 * 20);
	var custom_background_2_x_parallax_y = (40 * 21);
	var custom_background_2_y_parallax_y = (40 * 22);
	var custom_background_3_x_parallax_y = (40 * 23);
	var custom_background_3_y_parallax_y = (40 * 24);
	var custom_background_4_x_parallax_y = (40 * 25);
	var custom_background_4_y_parallax_y = (40 * 26);
	
	#region /*Scroll menu on right side*/
	menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.5);
	if (menu_y_offset_real >= 0)
	{
		menu_y_offset_real = 0;
	}
	if (abs(menu_y_offset_real) + window_get_height() - 200 < menu_cursor_y_position)
	{
		menu_y_offset_real -= 10;
	}
	if (abs(menu_y_offset_real) + 200 > menu_cursor_y_position)
	{
		menu_y_offset_real += 10;
	}
	if (abs(menu_y_offset_real) + window_get_height() + 200 < menu_cursor_y_position)
	{
		menu_y_offset_real -= 100;
	}
	if (abs(menu_y_offset_real) - 200 > menu_cursor_y_position)
	{
		menu_y_offset_real += 100;
	}
	#endregion /*Scroll menu on right side END*/
	
	if (menu = "back_level_editor_options")
	or (menu = "background_offset_and_parallax")
	or (menu = "default_view_height")
	or (menu = "default_view_width")
	or (menu = "make_every_tileset_into_default_tileset")
	or (menu = "rain")
	or (menu = "enable_time_countdown")
	or (menu = "time_countdown")
	{
		
		#region /*Menu Navigation*/
		
		#region /*Back Navigation*/
		if (key_b_pressed)
		and (!keyboard_check(vk_control))
		and (menu_delay = 0)
		or (menu = "back_level_editor_options")
		and (key_a_pressed)
		and (menu_delay = 0)
		{
			menu = "level_editor_options";
			menu_delay = 10;
		}
		#endregion /*Back Navigation END*/
		
		if (menu = "back_level_editor_options")
		{
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "background_offset_and_parallax";
				menu_delay = 3;
			}
		}
		else
		if (menu = "background_offset_and_parallax")
		{
			if (key_a_pressed)
			and (menu_delay = 0)
			{
				menu = "back_background_offset_and_parallax";
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "back_level_editor_options";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "default_view_height";
				menu_delay = 3;
			}
		}
		if (menu = "default_view_height")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "background_offset_and_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "default_view_width";
				menu_delay = 3;
			}
		}
		if (menu = "default_view_width")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "default_view_height";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "make_every_tileset_into_default_tileset";
				menu_delay = 3;
			}
		}
		if (menu = "make_every_tileset_into_default_tileset")
		{
			if (key_a_pressed)
			and (menu_delay = 0)
			or (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				if (global.make_every_tileset_into_default_tileset = false)
				{
					global.make_every_tileset_into_default_tileset = true;
				}
				else
				{
					global.make_every_tileset_into_default_tileset = false;
				}
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "default_view_width";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "rain";
				menu_delay = 3;
			}
		}
		if (menu = "rain")
		{
			if (key_a_pressed)
			and (menu_delay = 0)
			or (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				if (global.rain = false)
				{
					global.rain = true;
				}
				else
				{
					global.rain = false;
				}
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "make_every_tileset_into_default_tileset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "enable_time_countdown";
				menu_delay = 3;
			}
		}
		if (menu = "enable_time_countdown")
		{
			if (key_a_pressed)
			and (menu_delay = 0)
			or (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			{
				if (global.enable_time_countdown = false)
				{
					global.enable_time_countdown = true;
				}
				else
				{
					global.enable_time_countdown = false;
				}
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "rain";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "time_countdown";
				menu_delay = 3;
			}
		}
		if (menu = "time_countdown")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "enable_time_countdown";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "time_countdown";
				menu_delay = 3;
			}
		}
		#endregion /*Menu Navigation END*/
		
		#region /*Save level_information.ini*/
		if (global.character_select_in_this_menu = "level_editor")
		and (global.select_level_index <= 0)
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
		or (global.character_select_in_this_menu = "level_editor")
		and (global.create_level_from_template >= 2)
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
		or (global.character_select_in_this_menu = "level_editor")
		and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.select_level_index <= 0)
			or(global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template >= 2)
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			}
			else
			if (global.character_select_in_this_menu = "level_editor")
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
			}
			
			ini_write_real("info", "default_view_height", global.default_view_height);
			ini_write_real("info", "default_view_width", global.default_view_width);
			ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
			ini_write_real("info", "rain", global.rain);
			ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
			ini_write_real("info", "time_countdown", global.time_countdown);
		}
		#endregion /*Save level_information.ini END*/
		
		if (global.controls_used_for_menu_navigation = "controller")
		{
			draw_sprite_ext(spr_xbox_buttons, 2, 40, 40, 0.75, 0.75, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 40, 0.75, 0.75, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(80, 40, Text("Hold down to change the value faster"), global.default_text_size, c_black, c_white, 1);
		
		if (global.time_countdown < 0)
		{
			global.time_countdown = 0;
		}
		
		draw_menu_button(level_editor_options_x, 47 * 2 + menu_y_offset, Text("Back"), "back_level_editor_options", "level_editor_options");
		draw_menu_button(level_editor_options_x, 47 * 3 + menu_y_offset, Text("BG Offset and Parallax"), "background_offset_and_parallax", "back_background_offset_and_parallax");
		global.default_view_height = draw_menu_left_right_buttons(level_editor_options_x, 47 * 4 + menu_y_offset, options_level_editor_right_arrow_x, "Default view height", global.default_view_height, "default_view_height", 1, false);
		global.default_view_width = draw_menu_left_right_buttons(level_editor_options_x, 47 * 5 + menu_y_offset, options_level_editor_right_arrow_x, "Default view width", global.default_view_width, "default_view_width", 1, false);
		draw_menu_checkmark(level_editor_options_x - 90, 47 * 6 + menu_y_offset, "Make every tileset into default tileset", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
		draw_menu_checkmark(level_editor_options_x - 90, 47 * 7 + menu_y_offset, "Rain", "rain", global.rain);
		draw_menu_checkmark(level_editor_options_x - 90, 47 * 8 + menu_y_offset, "Enable Time Countdown", "enable_time_countdown", global.enable_time_countdown);
		global.time_countdown = draw_menu_left_right_buttons(level_editor_options_x, 46 * 9 + menu_y_offset, options_level_editor_right_arrow_x, "Time Countdown", global.time_countdown, "time_countdown", 1, false);
	}
	else
	if (menu = "back_background_offset_and_parallax")
	or (menu = "custom_background_1_x_offset")
	or (menu = "custom_background_1_y_offset")
	or (menu = "custom_background_2_x_offset")
	or (menu = "custom_background_2_y_offset")
	or (menu = "custom_background_3_x_offset")
	or (menu = "custom_background_3_y_offset")
	or (menu = "custom_background_4_x_offset")
	or (menu = "custom_background_4_y_offset")
	or (menu = "custom_foreground_1_x_offset")
	or (menu = "custom_foreground_1_y_offset")
	or (menu = "custom_foreground_above_static_objects_x_offset")
	or (menu = "custom_foreground_above_static_objects_y_offset")
	or (menu = "custom_foreground_2_x_offset")
	or (menu = "custom_foreground_2_y_offset")
	or (menu = "custom_foreground_secret_x_offset")
	or (menu = "custom_foreground_secret_y_offset")
	or (menu = "custom_background_1_x_parallax")
	or (menu = "custom_background_1_y_parallax")
	or (menu = "custom_background_2_x_parallax")
	or (menu = "custom_background_2_y_parallax")
	or (menu = "custom_background_3_x_parallax")
	or (menu = "custom_background_3_y_parallax")
	or (menu = "custom_background_4_x_parallax")
	or (menu = "custom_background_4_y_parallax")
	{
		
		#region /*Menu Navigation*/
		
		#region /*Back Navigation*/
		if (key_b_pressed)
		and (!keyboard_check(vk_control))
		and (menu_delay = 0)
		or (menu = "back_background_offset_and_parallax")
		and (key_a_pressed)
		and (menu_delay = 0)
		{
			menu = "background_offset_and_parallax";
			menu_delay = 10;
		}
		#endregion /*Back Navigation END*/
		
		if (menu = "back_background_offset_and_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_y_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_x_offset";
				menu_delay = 3;
			}
		}
		else
		if (menu = "custom_background_1_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "back_background_offset_and_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_1_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_x_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_2_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_2_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_x_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_3_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_3_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_x_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_4_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_4_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_1_x_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_1_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_1_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_1_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_1_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_above_static_objects_x_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_above_static_objects_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_1_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_above_static_objects_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_above_static_objects_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_above_static_objects_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_2_x_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_2_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_above_static_objects_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_2_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_2_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_2_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_secret_x_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_secret_x_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_2_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_secret_y_offset";
				menu_delay = 3;
			}
		}
		if (menu = "custom_foreground_secret_y_offset")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_secret_x_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_x_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_1_x_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_foreground_secret_y_offset";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_y_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_1_y_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_x_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_x_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_2_x_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_1_y_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_y_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_2_y_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_x_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_x_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_3_x_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_2_y_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_y_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_3_y_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_x_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_x_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_4_x_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_3_y_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_y_parallax";
				menu_delay = 3;
			}
		}
		if (menu = "custom_background_4_y_parallax")
		{
			if (key_up)
			and (menu_delay = 0)
			{
				menu = "custom_background_4_x_parallax";
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			{
				menu = "back_background_offset_and_parallax";
				menu_delay = 3;
			}
		}
		#endregion /*Menu Navigation END*/
		
		#region /*Save level_information.ini*/
		if (global.character_select_in_this_menu = "level_editor")
		and (global.select_level_index <= 0)
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
		or (global.character_select_in_this_menu = "level_editor")
		and (global.create_level_from_template >= 2)
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
		or (global.character_select_in_this_menu = "level_editor")
		and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.select_level_index <= 0)
			or(global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template >= 2)
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			}
			else
			if (global.character_select_in_this_menu = "level_editor")
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
			}
			
			ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", custom_background_1_x_offset);
			ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", custom_background_1_y_offset);
			ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", custom_background_2_x_offset);
			ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", custom_background_2_y_offset);
			ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", custom_background_3_x_offset);
			ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", custom_background_3_y_offset);
			ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", custom_background_4_x_offset);
			ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", custom_background_4_y_offset);
			if (instance_exists(obj_foreground1))
			{
				ini_write_real("Custom Backgrounds", "custom_foreground_1_x_offset", obj_foreground1.x_offset);
				ini_write_real("Custom Backgrounds", "custom_foreground_1_y_offset", obj_foreground1.y_offset);
			}
			if (instance_exists(obj_foreground_above_static_objects))
			{
				ini_write_real("Custom Backgrounds", "custom_foreground_above_static_objects_x_offset", obj_foreground_above_static_objects.x_offset);
				ini_write_real("Custom Backgrounds", "custom_foreground_above_static_objects_y_offset", obj_foreground_above_static_objects.y_offset);
			}
			if (instance_exists(obj_foreground2))
			{
				ini_write_real("Custom Backgrounds", "custom_foreground_2_x_offset", obj_foreground2.x_offset);
				ini_write_real("Custom Backgrounds", "custom_foreground_2_y_offset", obj_foreground2.y_offset);
			}
			if (instance_exists(obj_foreground_secret))
			{
				ini_write_real("Custom Backgrounds", "custom_foreground_secret_x_offset", obj_foreground_secret.x);
				ini_write_real("Custom Backgrounds", "custom_foreground_secret_y_offset", obj_foreground_secret.y);
			}
			ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", custom_background_1_x_parallax);
			ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", custom_background_1_y_parallax);
			ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", custom_background_2_x_parallax);
			ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", custom_background_2_y_parallax);
			ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", custom_background_3_x_parallax);
			ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", custom_background_3_y_parallax);
			ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", custom_background_4_x_parallax);
			ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", custom_background_4_y_parallax);
		}
		#endregion /*Save level_information.ini END*/
		
		if (global.controls_used_for_menu_navigation = "controller")
		{
			draw_sprite_ext(spr_xbox_buttons, 2, 40, 40, 0.75, 0.75, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 40, 0.75, 0.75, 0, c_white, 1);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_outlined(80, 40, Text("Hold down to change the value faster"), global.default_text_size, c_black, c_white, 1);
		
		draw_menu_button(level_editor_options_x, 40 * 2 + menu_y_offset, Text("Back"), "back_background_offset_and_parallax", "background_offset_and_parallax");
		
		custom_background_1_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 x offset", custom_background_1_x_offset, "custom_background_1_x_offset", 1, true);
		custom_background_1_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 y offset", custom_background_1_y_offset, "custom_background_1_y_offset", 1, true);
		custom_background_2_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 x offset", custom_background_2_x_offset, "custom_background_2_x_offset", 1, true);
		custom_background_2_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 y offset", custom_background_2_y_offset, "custom_background_2_y_offset", 1, true);
		custom_background_3_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 x offset", custom_background_3_x_offset, "custom_background_3_x_offset", 1, true);
		custom_background_3_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 y offset", custom_background_3_y_offset, "custom_background_3_y_offset", 1, true);
		custom_background_4_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 x offset", custom_background_4_x_offset, "custom_background_4_x_offset", 1, true);
		custom_background_4_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 y offset", custom_background_4_y_offset, "custom_background_4_y_offset", 1, true);
		if (instance_exists(obj_foreground1))
		{
			obj_foreground1.x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_1_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom foreground 1 x offset", obj_foreground1.x_offset, "custom_foreground_1_x_offset", 1, true);
			obj_foreground1.y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_1_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom foreground 1 y offset", obj_foreground1.y_offset, "custom_foreground_1_y_offset", 1, true);
		}
		if (instance_exists(obj_foreground_above_static_objects))
		{
			obj_foreground_above_static_objects.x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_above_static_objects_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x + 250, "custom foreground above static objects x offset", obj_foreground_above_static_objects.x_offset, "custom_foreground_above_static_objects_x_offset", 1, true);
			obj_foreground_above_static_objects.y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_above_static_objects_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x + 250, "custom foreground above static objects y offset", obj_foreground_above_static_objects.y_offset, "custom_foreground_above_static_objects_y_offset", 1, true);
		}
		if (instance_exists(obj_foreground2))
		{
			obj_foreground2.x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_2_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom foreground 2 x offset", obj_foreground2.x_offset, "custom_foreground_2_x_offset", 1, true);
			obj_foreground2.y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_2_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "custom foreground 2 y offset", obj_foreground2.y_offset, "custom_foreground_2_y_offset", 1, true);
		}
		if (instance_exists(obj_foreground_secret))
		{
			obj_foreground_secret.x = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_secret_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x + 10, "custom foreground secret x offset", obj_foreground_secret.x, "custom_foreground_secret_x_offset", 1, true);
			obj_foreground_secret.y = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_secret_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x + 10, "custom foreground secret y offset", obj_foreground_secret.y, "custom_foreground_secret_y_offset", 1, true);
		}
		custom_background_1_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 x parallax", custom_background_1_x_parallax, "custom_background_1_x_parallax", 0.1, true);
		custom_background_1_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 y parallax", custom_background_1_y_parallax, "custom_background_1_y_parallax", 0.1, true);
		custom_background_2_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 x parallax", custom_background_2_x_parallax, "custom_background_2_x_parallax", 0.1, true);
		custom_background_2_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 y parallax", custom_background_2_y_parallax, "custom_background_2_y_parallax", 0.1, true);
		custom_background_3_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 x parallax", custom_background_3_x_parallax, "custom_background_3_x_parallax", 0.1, true);
		custom_background_3_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 y parallax", custom_background_3_y_parallax, "custom_background_3_y_parallax", 0.1, true);
		custom_background_4_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 x parallax", custom_background_4_x_parallax, "custom_background_4_x_parallax", 0.1, true);
		custom_background_4_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 y parallax", custom_background_4_y_parallax, "custom_background_4_y_parallax", 0.1, true);
	}
}