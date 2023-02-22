function scr_options_level_editor()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	if (pause == true)
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
	
		#region /* Accept drop down menu */
		if (key_a_pressed)
		or (mouse_check_button_released(mb_left))
		{
		
			#region /* Drop down menu */
			if (menu == "selected_level_editing_music")
			{
				if (menu_delay == 0)
				and (open_dropdown == false)
				{
					open_dropdown = true;
					menu_delay = 3;
				}
				else
				if (menu_delay == 0)
				and (open_dropdown == true)
				{
					open_dropdown = false;
					menu_delay = 3;
				}
			}
			#endregion /* Drop down menu END */
		}
		#endregion /* Accept drop down menu END */
	
		#region /* Scroll menu on right side */
		menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.5);
		if (menu_y_offset_real >= 0)
		{
			menu_y_offset_real = 0;
		}
		if (abs(menu_y_offset_real) + get_window_height - 200 < menu_cursor_y_position)
		{
			menu_y_offset_real -= 10;
		}
		if (abs(menu_y_offset_real) + 200 > menu_cursor_y_position)
		{
			menu_y_offset_real += 10;
		}
		if (abs(menu_y_offset_real) + get_window_height + 200 < menu_cursor_y_position)
		{
			menu_y_offset_real -= 100;
		}
		if (abs(menu_y_offset_real) - 200 > menu_cursor_y_position)
		{
			menu_y_offset_real += 100;
		}
		#endregion /* Scroll menu on right side END */
	
		if (menu == "back_level_editor_options")
		or (menu == "background_offset_and_parallax")
		or (menu == "default_view_height")
		or (menu == "default_view_width")
		or (menu == "make_every_tileset_into_default_tileset")
		or (menu == "deactivate_objects_from_most_zoomed_out")
		or (menu == "rain")
		or (menu == "enable_time_countdown")
		or (menu == "time_countdown")
		or (menu == "selected_level_editing_music")
		or (menu == "delete_all_objects")
		{
			
			#region /* Menu Navigation */
			
			#region /* Back Navigation */
			if (key_b_pressed)
			and (!keyboard_check(vk_control))
			and (menu_delay == 0)
			or (menu == "back_level_editor_options")
			and (key_a_pressed)
			and (menu_delay == 0)
			{
				if (open_dropdown == true)
				{
					open_dropdown = false;
				}
				else
				{
					menu = "level_editor_options";
					menu_delay = 10;
				}
			}
			#endregion /* Back Navigation END */
		
			if (menu == "back_level_editor_options")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "delete_all_objects";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "background_offset_and_parallax";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_offset_and_parallax")
			{
				if (key_a_pressed)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "back_background_offset_and_parallax";
					menu_delay = 3;
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "back_level_editor_options";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "default_view_height";
					menu_delay = 3;
				}
			}
			if (menu == "default_view_height")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "background_offset_and_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "default_view_width";
					menu_delay = 3;
				}
			}
			if (menu == "default_view_width")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "default_view_height";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "make_every_tileset_into_default_tileset";
					menu_delay = 3;
				}
			}
			if (menu == "make_every_tileset_into_default_tileset")
			{
				if (key_a_pressed)
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (mouse_check_button_pressed(mb_left))
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "default_view_width";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "deactivate_objects_from_most_zoomed_out";
					menu_delay = 3;
				}
			}
			else
			if (menu == "deactivate_objects_from_most_zoomed_out")
			{
				if (key_a_pressed)
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (mouse_check_button_pressed(mb_left))
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.deactivate_objects_from_most_zoomed_out = false)
					{
						global.deactivate_objects_from_most_zoomed_out = true;
					}
					else
					{
						global.deactivate_objects_from_most_zoomed_out = false;
					}
					menu_delay = 3;
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "make_every_tileset_into_default_tileset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "rain";
					menu_delay = 3;
				}
			}
			if (menu == "rain")
			{
				if (key_a_pressed)
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (mouse_check_button_pressed(mb_left))
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "deactivate_objects_from_most_zoomed_out";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "enable_time_countdown";
					menu_delay = 3;
				}
			}
			if (menu == "enable_time_countdown")
			{
				if (key_a_pressed)
				and (menu_delay == 0)
				and (open_dropdown == false)
				or (mouse_check_button_pressed(mb_left))
				and (menu_delay == 0)
				and (open_dropdown == false)
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
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "rain";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.enable_time_countdown == true)
					{
						menu = "time_countdown";
					}
					else
					{
						menu = "selected_level_editing_music";
					}
					menu_delay = 3;
				}
			}
			if (menu == "time_countdown")
			and (global.enable_time_countdown == true)
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "enable_time_countdown";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "selected_level_editing_music";
					menu_delay = 3;
				}
			}
			if (menu == "selected_level_editing_music")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					if (global.enable_time_countdown == true)
					{
						menu = "time_countdown";
					}
					else
					{
						menu = "enable_time_countdown";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "delete_all_objects";
					menu_delay = 3;
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.selected_level_editing_music > 0)
				{
					global.selected_level_editing_music -= 1;
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == true)
				and (global.selected_level_editing_music < 3)
				{
					global.selected_level_editing_music += 1;
					menu_delay = 3;
				}
			}
			else
			if (menu == "delete_all_objects")
			{
				if (key_a_pressed)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "delete_all_objects_no"
					menu_delay = 3;
				}
				else
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "selected_level_editing_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "back_level_editor_options";
					menu_delay = 3;
				}
			}
			#endregion /* Menu Navigation END */
		
			#region /* Save level_information.ini */
			if (global.character_select_in_this_menu == "level_editor")
			and (global.select_level_index <= 0)
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
			or (global.character_select_in_this_menu == "level_editor")
			and (global.create_level_from_template >= 2)
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
			or (global.character_select_in_this_menu == "level_editor")
			and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
			{
				if (global.character_select_in_this_menu == "level_editor")
				and (global.select_level_index <= 0)
				or (global.character_select_in_this_menu == "level_editor")
				and (global.create_level_from_template >= 2)
				{
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				}
				else
				if (global.character_select_in_this_menu == "level_editor")
				{
					ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
				}
			
				ini_write_real("info", "default_view_height", global.default_view_height);
				ini_write_real("info", "default_view_width", global.default_view_width);
				ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
				ini_write_real("info", "deactivate_objects_from_most_zoomed_out", global.deactivate_objects_from_most_zoomed_out);
				ini_write_real("info", "rain", global.rain);
				ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
				ini_write_real("info", "time_countdown", global.time_countdown);
			}
			#endregion /* Save level_information.ini END */
		
			if (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_face3, 40, 40, 0.75, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 40, 0.75, 0.75, 0, c_white, 1);
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(80, 40, l10n_text("Hold down to change the value faster"), global.default_text_size, c_black, c_white, 1);
		
			if (global.time_countdown < 0)
			{
				global.time_countdown = 0;
			}
		
			draw_menu_button(level_editor_options_x, 47 * 2 + menu_y_offset, l10n_text("Back"), "back_level_editor_options", "level_editor_options");
			draw_sprite_ext(spr_icons_back, 0, level_editor_options_x + 20, 47 * 2 + menu_y_offset + 21, 1, 1, 0, c_white, 1);
			draw_menu_button(level_editor_options_x, 47 * 3 + menu_y_offset, l10n_text("BG Offset and Parallax"), "background_offset_and_parallax", "back_background_offset_and_parallax");
			global.default_view_height = draw_menu_left_right_buttons(level_editor_options_x, 47 * 4 + menu_y_offset, options_level_editor_right_arrow_x, "Default view height", global.default_view_height, "default_view_height", 1, false);
			global.default_view_width = draw_menu_left_right_buttons(level_editor_options_x, 47 * 5 + menu_y_offset, options_level_editor_right_arrow_x, "Default view width", global.default_view_width, "default_view_width", 1, false);
			draw_menu_checkmark(level_editor_options_x - 90, 47 * 6 + menu_y_offset, "Make every tileset into default tileset", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
			draw_menu_checkmark(level_editor_options_x - 90, 47 * 7 + menu_y_offset, "Deactivate objects from most zoomed out", "deactivate_objects_from_most_zoomed_out", global.deactivate_objects_from_most_zoomed_out);
			draw_menu_checkmark(level_editor_options_x - 90, 47 * 8 + menu_y_offset, "Rain", "rain", global.rain);
			draw_menu_checkmark(level_editor_options_x - 90, 47 * 9 + menu_y_offset, "Enable Time Countdown", "enable_time_countdown", global.enable_time_countdown);
			if (global.enable_time_countdown == true)
			{
				global.time_countdown = draw_menu_left_right_buttons(level_editor_options_x, 46 * 10 + menu_y_offset, options_level_editor_right_arrow_x, "Time Countdown", global.time_countdown, "time_countdown", 1, false);
			}
			draw_menu_button(level_editor_options_x, 46 * 13 + menu_y_offset, "Delete All Objects", "delete_all_objects", "delete_all_objects_no");
			draw_menu_dropdown(level_editor_options_x - 32, 46 * 11 + menu_y_offset + 20, "Level Editing Music", "selected_level_editing_music", global.selected_level_editing_music, "None", "Music 1", "Music 2", "Music 3");
		}
		else
		if (menu == "delete_all_objects_yes")
		or (menu == "delete_all_objects_no")
		{
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, get_window_width* 3, get_window_height* 3, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(0.1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 100, l10n_text("Are you sure you want to delete every object in the level?"), global.default_text_size, c_black, c_red, 1);
			draw_menu_button(get_window_width * 0.5 - 370 - 32, get_window_height * 0.5, l10n_text("Yes"), "delete_all_objects_yes", "delete_all_objects_deleting");
			draw_menu_button(get_window_width * 0.5 + 32, get_window_height * 0.5, l10n_text("No"), "delete_all_objects_no", "delete_all_objects");
		
			if (key_a_pressed)
			and (menu_delay == 0)
			and (open_dropdown == false)
			{
				if (menu == "delete_all_objects_no")
				{
					menu = "delete_all_objects";
					menu_delay = 3;
				}
				else
				{
					if (menu == "delete_all_objects_yes")
					{
						menu = "delete_all_objects_deleting";
						menu_delay = 3;
					}
				}
			}
		
			if (key_left)
			and (menu_joystick_delay == 0)
			or (key_right)
			and (menu_joystick_delay == 0)
			{
				menu_joystick_delay = 30;
				if (menu == "delete_all_objects_no")
				{
					menu = "delete_all_objects_yes";
				}
				else
				if (menu == "delete_all_objects_yes")
				{
					menu = "delete_all_objects_no";
				}
			}
		}
		else
		if (menu == "delete_all_objects_deleting")
		{
			instance_activate_all();
			if (instance_exists(obj_leveleditor_fill))
			{
				with (obj_leveleditor_fill)
				{
					instance_destroy()
				}
			}
			if (instance_exists(obj_leveleditor_placed_object))
			{
				with (obj_leveleditor_placed_object)
				{
					instance_destroy()
				}
			}
			menu = "delete_all_objects";
		}
		else
		if (menu == "back_background_offset_and_parallax")
		or (menu == "custom_background_1_x_offset")
		or (menu == "custom_background_1_y_offset")
		or (menu == "custom_background_2_x_offset")
		or (menu == "custom_background_2_y_offset")
		or (menu == "custom_background_3_x_offset")
		or (menu == "custom_background_3_y_offset")
		or (menu == "custom_background_4_x_offset")
		or (menu == "custom_background_4_y_offset")
		or (menu == "custom_foreground_1_x_offset")
		or (menu == "custom_foreground_1_y_offset")
		or (menu == "custom_foreground_above_static_objects_x_offset")
		or (menu == "custom_foreground_above_static_objects_y_offset")
		or (menu == "custom_foreground_2_x_offset")
		or (menu == "custom_foreground_2_y_offset")
		or (menu == "custom_foreground_secret_x_offset")
		or (menu == "custom_foreground_secret_y_offset")
		or (menu == "custom_background_1_x_parallax")
		or (menu == "custom_background_1_y_parallax")
		or (menu == "custom_background_2_x_parallax")
		or (menu == "custom_background_2_y_parallax")
		or (menu == "custom_background_3_x_parallax")
		or (menu == "custom_background_3_y_parallax")
		or (menu == "custom_background_4_x_parallax")
		or (menu == "custom_background_4_y_parallax")
		{
		
			#region /* Menu Navigation */
		
			#region /* Back Navigation */
			if (key_b_pressed)
			and (!keyboard_check(vk_control))
			and (menu_delay == 0)
			and (open_dropdown == false)
			or (menu == "back_background_offset_and_parallax")
			and (key_a_pressed)
			and (menu_delay == 0)
			and (open_dropdown == false)
			{
				menu = "background_offset_and_parallax";
				menu_delay = 10;
			}
			#endregion /* Back Navigation END */
		
			if (menu == "back_background_offset_and_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_x_offset";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background_1_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "back_background_offset_and_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_1_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_1_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_1_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_1_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_1_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_1_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_above_static_objects_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_1_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_above_static_objects_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_2_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_2_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_2_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_2_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_2_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_secret_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_secret_x_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_2_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_secret_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_secret_y_offset")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_secret_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_1_x_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_foreground_secret_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_1_y_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_x_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_1_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_y_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_x_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_2_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_y_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_x_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_3_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_y_parallax")
			{
				if (key_up)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "custom_background_4_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				and (menu_delay == 0)
				and (open_dropdown == false)
				{
					menu = "back_background_offset_and_parallax";
					menu_delay = 3;
				}
			}
			#endregion /* Menu Navigation END */
		
			#region /* Save level_information.ini */
			if (global.character_select_in_this_menu == "level_editor")
			and (global.select_level_index <= 0)
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
			or (global.character_select_in_this_menu == "level_editor")
			and (global.create_level_from_template >= 2)
			and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
			or (global.character_select_in_this_menu == "level_editor")
			and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
			{
				if (global.character_select_in_this_menu == "level_editor")
				and (global.select_level_index <= 0)
				or (global.character_select_in_this_menu == "level_editor")
				and (global.create_level_from_template >= 2)
				{
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				}
				else
				if (global.character_select_in_this_menu == "level_editor")
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
			#endregion /* Save level_information.ini END */
		
			if (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_face3, 40, 40, 0.75, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 40, 0.75, 0.75, 0, c_white, 1);
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(80, 40, l10n_text("Hold down to change the value faster"), global.default_text_size, c_black, c_white, 1);
		
			draw_menu_button(level_editor_options_x, 40 * 2 + menu_y_offset, l10n_text("Back"), "back_background_offset_and_parallax", "background_offset_and_parallax");
			draw_sprite_ext(spr_icons_back, 0, level_editor_options_x + 20, 40 * 2 + menu_y_offset + 21, 1, 1, 0, c_white, 1);
		
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
}