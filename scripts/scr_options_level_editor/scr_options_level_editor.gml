function scr_options_level_editor()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	if (pause)
	{
		var level_editor_options_x = 500;
		var options_level_editor_right_arrow_x = 650;
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
		
		var custom_background_1_x_parallax_y = (40 * 3);
		var custom_background_1_y_parallax_y = (40 * 4);
		var custom_background_2_x_parallax_y = (40 * 5);
		var custom_background_2_y_parallax_y = (40 * 6);
		var custom_background_3_x_parallax_y = (40 * 7);
		var custom_background_3_y_parallax_y = (40 * 8);
		var custom_background_4_x_parallax_y = (40 * 9);
		var custom_background_4_y_parallax_y = (40 * 10);
		
		var custom_background_1_x_scale_y = (40 * 3);
		var custom_background_1_y_scale_y = (40 * 4);
		var custom_background_2_x_scale_y = (40 * 5);
		var custom_background_2_y_scale_y = (40 * 6);
		var custom_background_3_x_scale_y = (40 * 7);
		var custom_background_3_y_scale_y = (40 * 8);
		var custom_background_4_x_scale_y = (40 * 9);
		var custom_background_4_y_scale_y = (40 * 10);
		
		var custom_background_1_htiled_y = (50 * 3);
		var custom_background_1_vtiled_y = (50 * 4);
		var custom_background_2_htiled_y = (50 * 5);
		var custom_background_2_vtiled_y = (50 * 6);
		var custom_background_3_htiled_y = (50 * 7);
		var custom_background_3_vtiled_y = (50 * 8);
		var custom_background_4_htiled_y = (50 * 9);
		var custom_background_4_vtiled_y = (50 * 10);
		
		scr_scroll_menu();
	
		if (menu == "back_level_editor_options")
		|| (menu == "background_offset")
		|| (menu == "background_parallax")
		|| (menu == "background_scale")
		|| (menu == "background_tiled")
		|| (menu == "default_view_height")
		|| (menu == "default_view_width")
		|| (menu == "make_every_tileset_into_default_tileset")
		|| (menu == "deactivate_objects_from_most_zoomed_out")
		|| (menu == "rain")
		|| (menu == "enable_time_countdown")
		|| (menu == "time_countdown")
		|| (menu == "show_new_items_notification_level_editor")
		|| (menu == "selected_level_editing_music")
		|| (menu == "delete_all_objects")
		{
			
			#region /* Menu Navigation */
			
			#region /* Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0)
			|| (menu == "back_level_editor_options")
			&& (key_a_pressed)
			&& (menu_delay == 0)
			{
				
				#region /* Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_real("info", "default_view_height", global.default_view_height);
					ini_write_real("info", "default_view_width", global.default_view_width);
					ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
					ini_write_real("info", "deactivate_objects_from_most_zoomed_out", global.deactivate_objects_from_most_zoomed_out);
					ini_write_real("info", "rain", global.rain);
					ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
					ini_write_real("info", "time_countdown", global.time_countdown);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Save level_information.ini END */
				
				#region /* Save config.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "config.ini"))
				{
					ini_open(working_directory + "config.ini");
					ini_write_real("config", "show_new_items_notification_level_editor", global.show_new_items_notification);
					ini_write_real("config", "selected_level_editing_music", global.selected_level_editing_music);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Save config.ini END */
				
				if (open_dropdown)
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
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "delete_all_objects";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_offset";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_offset")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_offset";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_level_editor_options";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_parallax";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_parallax")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_parallax";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_scale";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_scale")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_scale";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_tiled";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_tiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_tiled";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "default_view_height";
					menu_delay = 3;
				}
			}
			else
			if (menu == "default_view_height")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "background_tiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "default_view_width";
					menu_delay = 3;
				}
			}
			if (menu == "default_view_width")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "default_view_height";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "make_every_tileset_into_default_tileset";
					menu_delay = 3;
				}
			}
			if (menu == "make_every_tileset_into_default_tileset")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.make_every_tileset_into_default_tileset == false)
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
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "default_view_width";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "deactivate_objects_from_most_zoomed_out";
					menu_delay = 3;
				}
			}
			else
			if (menu == "deactivate_objects_from_most_zoomed_out")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.deactivate_objects_from_most_zoomed_out == false)
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
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "make_every_tileset_into_default_tileset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "rain";
					menu_delay = 3;
				}
			}
			if (menu == "rain")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.rain == false)
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
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "deactivate_objects_from_most_zoomed_out";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "enable_time_countdown";
					menu_delay = 3;
				}
			}
			if (menu == "enable_time_countdown")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.enable_time_countdown == false)
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
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "rain";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.enable_time_countdown)
					{
						menu = "time_countdown";
					}
					else
					{
						menu = "show_new_items_notification_level_editor";
					}
					menu_delay = 3;
				}
			}
			if (menu == "time_countdown")
			&& (global.enable_time_countdown)
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "enable_time_countdown";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "show_new_items_notification_level_editor";
					menu_delay = 3;
				}
			}
			if (menu == "show_new_items_notification_level_editor")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.show_new_items_notification == false)
					{
						global.show_new_items_notification = true;
					}
					else
					{
						global.show_new_items_notification = false;
					}
					menu_delay = 3;
				}
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					if (global.enable_time_countdown)
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
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "selected_level_editing_music";
					menu_delay = 3;
				}
			}
			if (menu == "selected_level_editing_music")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "show_new_items_notification_level_editor";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "delete_all_objects";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (global.selected_level_editing_music > 0)
				{
					global.selected_level_editing_music --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown)
				&& (global.selected_level_editing_music < 5)
				{
					global.selected_level_editing_music ++;
					menu_delay = 3;
				}
			}
			else
			if (menu == "delete_all_objects")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "delete_all_objects_no"
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "selected_level_editing_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_level_editor_options";
					menu_delay = 3;
				}
			}
			#endregion /* Menu Navigation END */
			
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
			
			var back_level_editor_options_y = 47 * 1 + menu_y_offset;
			var background_offset_y = 47 * 2 + menu_y_offset;
			var background_parallax_y = 47 * 3 + menu_y_offset;
			var background_scale_y = 47 * 4 + menu_y_offset;
			var background_tiled_y = 47 * 5 + menu_y_offset;
			var default_view_height_y = 47 * 6 + menu_y_offset;
			var default_view_width_y = 47 * 7 + menu_y_offset;
			var make_every_tileset_into_default_tileset_y = 47 * 8 + menu_y_offset;
			var deactivate_objects_from_most_zoomed_out_y = 47 * 9 + menu_y_offset;
			var rain_y = 47 * 10 + menu_y_offset;
			var enable_time_countdown_y = 47 * 11 + menu_y_offset;
			var time_countdown_y = 46 * 12 + menu_y_offset;
			var show_new_items_notification_y = 46 * 13 + menu_y_offset;
			var selected_level_editing_music_y = 46 * 15 + menu_y_offset - 16;
			var delete_all_objects_y = 46 * 16 + menu_y_offset + 20 - 16;
			
			draw_menu_button(level_editor_options_x, back_level_editor_options_y, l10n_text("Back"), "back_level_editor_options", "level_editor_options");
			draw_sprite_ext(spr_icons_back, 0, level_editor_options_x + 20, back_level_editor_options_y + 21, 1, 1, 0, c_white, 1);
			draw_menu_button(level_editor_options_x, background_offset_y, l10n_text("BG Offset"), "background_offset", "back_background_offset");
			draw_menu_button(level_editor_options_x, background_parallax_y, l10n_text("BG Parallax"), "background_parallax", "back_background_parallax");
			draw_menu_button(level_editor_options_x, background_scale_y, l10n_text("BG Scale"), "background_scale", "back_background_scale");
			draw_menu_button(level_editor_options_x, background_tiled_y, l10n_text("BG Tiled"), "background_tiled", "back_background_tiled");
			global.default_view_height = draw_menu_left_right_buttons(level_editor_options_x, default_view_height_y, options_level_editor_right_arrow_x, "Default view height", global.default_view_height, "default_view_height", 1, false);
			global.default_view_width = draw_menu_left_right_buttons(level_editor_options_x, default_view_width_y, options_level_editor_right_arrow_x, "Default view width", global.default_view_width, "default_view_width", 1, false);
			draw_menu_checkmark(level_editor_options_x - 90, make_every_tileset_into_default_tileset_y, l10n_text("Make every tileset into default tileset"), "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
			draw_menu_checkmark(level_editor_options_x - 90, deactivate_objects_from_most_zoomed_out_y, l10n_text("Deactivate objects from most zoomed out"), "deactivate_objects_from_most_zoomed_out", global.deactivate_objects_from_most_zoomed_out);
			draw_menu_checkmark(level_editor_options_x - 90, rain_y, l10n_text("Rain"), "rain", global.rain);
			draw_menu_checkmark(level_editor_options_x - 90, enable_time_countdown_y, l10n_text("Enable Time Countdown"), "enable_time_countdown", global.enable_time_countdown);
			if (global.enable_time_countdown)
			{
				global.time_countdown = draw_menu_left_right_buttons(level_editor_options_x, time_countdown_y, options_level_editor_right_arrow_x, l10n_text("Time Countdown"), global.time_countdown, "time_countdown", 1, false);
			}
			draw_menu_checkmark(level_editor_options_x - 90, show_new_items_notification_y, l10n_text("Show New Items Notification"), "show_new_items_notification_level_editor", global.show_new_items_notification);
			draw_menu_button(level_editor_options_x, delete_all_objects_y, l10n_text("Delete All Objects"), "delete_all_objects", "delete_all_objects_no");
			draw_sprite_ext(spr_icons_delete, 0, level_editor_options_x + 16, delete_all_objects_y + 21, 1, 1, 0, c_white, 1);
			draw_menu_dropdown(level_editor_options_x - 32, selected_level_editing_music_y, l10n_text("Level Editing Music"), "selected_level_editing_music", global.selected_level_editing_music, l10n_text("None"), l10n_text("Random"), l10n_text("Music 1"), l10n_text("Music 2"), l10n_text("Music 3"), l10n_text("Music 4"));
		}
		else
		if (menu == "delete_all_objects_yes")
		|| (menu == "delete_all_objects_no")
		{
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, get_window_width* 3, get_window_height* 3, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(0.1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 100, l10n_text("Are you sure you want to delete every object in the level?"), global.default_text_size, c_black, c_red, 1);
			draw_menu_button(get_window_width * 0.5 - 370 - 32, get_window_height * 0.5, l10n_text("Yes"), "delete_all_objects_yes", "delete_all_objects_deleting");
			draw_sprite_ext(spr_icons_delete, 0, get_window_width * 0.5 - 370 - 32 + 16, get_window_height * 0.5 + 21, 1, 1, 0, c_white, 1);
			draw_menu_button(get_window_width * 0.5 + 32, get_window_height * 0.5, l10n_text("No"), "delete_all_objects_no", "delete_all_objects");
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 + 32 + 16, get_window_height * 0.5 + 21, 1, 1, 0, c_white, 1);
			
			if (key_b_pressed)
			&& (menu_delay == 0)
			{
				menu = "delete_all_objects";
				menu_delay = 3;
			}
			else
			if (key_a_pressed)
			&& (menu_delay == 0)
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
			&& (menu_joystick_delay == 0)
			|| (key_right)
			&& (menu_joystick_delay == 0)
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
		
		#region /* Background Offset */
		if (menu == "back_background_offset")
		|| (menu == "custom_background_1_x_offset")
		|| (menu == "custom_background_1_y_offset")
		|| (menu == "custom_background_2_x_offset")
		|| (menu == "custom_background_2_y_offset")
		|| (menu == "custom_background_3_x_offset")
		|| (menu == "custom_background_3_y_offset")
		|| (menu == "custom_background_4_x_offset")
		|| (menu == "custom_background_4_y_offset")
		|| (menu == "custom_foreground_1_x_offset")
		|| (menu == "custom_foreground_1_y_offset")
		|| (menu == "custom_foreground_above_static_objects_x_offset")
		|| (menu == "custom_foreground_above_static_objects_y_offset")
		|| (menu == "custom_foreground_2_x_offset")
		|| (menu == "custom_foreground_2_y_offset")
		|| (menu == "custom_foreground_secret_x_offset")
		|| (menu == "custom_foreground_secret_y_offset")
		{
			
			#region /* Background Offset Menu Navigation */
			
			#region /* Background Offset Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			|| (menu == "back_background_offset")
			&& (key_a_pressed)
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			{
				
				#region /* Background Offset Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
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
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Background Offset Save level_information.ini END */
				
				menu = "background_offset";
				menu_delay = 10;
			}
			#endregion /* Background Offset Back Navigation END */
			
			if (menu == "back_background_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_secret_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_x_offset";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background_1_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_1_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_1_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_1_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_1_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_1_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_1_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_above_static_objects_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_1_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_above_static_objects_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_2_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_2_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_above_static_objects_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_2_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_2_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_2_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_secret_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_secret_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_2_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_secret_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_secret_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_foreground_secret_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_offset";
					menu_delay = 3;
				}
			}
			#endregion /* Background Offset Menu Navigation END */
			
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
			
			draw_menu_button(level_editor_options_x, 40 * 2 + menu_y_offset, l10n_text("Back"), "back_background_offset", "background_offset");
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
		}
		#endregion /* Background Offset END */
		
		else
		
		#region /* Background Parallax */
		if (menu == "back_background_parallax")
		|| (menu == "custom_background_1_x_parallax")
		|| (menu == "custom_background_1_y_parallax")
		|| (menu == "custom_background_2_x_parallax")
		|| (menu == "custom_background_2_y_parallax")
		|| (menu == "custom_background_3_x_parallax")
		|| (menu == "custom_background_3_y_parallax")
		|| (menu == "custom_background_4_x_parallax")
		|| (menu == "custom_background_4_y_parallax")
		{
			
			#region /* Background Parallax Menu Navigation */
			
			#region /* Background Parallax Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			|| (menu == "back_background_parallax")
			&& (key_a_pressed)
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			{
				
				#region /* Background Parallax Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", custom_background_1_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", custom_background_1_y_parallax);
					ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", custom_background_2_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", custom_background_2_y_parallax);
					ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", custom_background_3_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", custom_background_3_y_parallax);
					ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", custom_background_4_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", custom_background_4_y_parallax);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Background Parallax Save level_information.ini END */
				
				menu = "background_parallax";
				menu_delay = 10;
			}
			#endregion /* Background Parallax Back Navigation END */
		
			if (menu == "back_background_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_x_parallax";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background_1_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_1_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_parallax";
					menu_delay = 3;
				}
			}
			#endregion /* Background Parallax Menu Navigation END */
			
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
			
			draw_menu_button(level_editor_options_x, 40 * 2 + menu_y_offset, l10n_text("Back"), "back_background_parallax", "background_parallax");
			draw_sprite_ext(spr_icons_back, 0, level_editor_options_x + 20, 40 * 2 + menu_y_offset + 21, 1, 1, 0, c_white, 1);
			
			custom_background_1_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 x parallax", custom_background_1_x_parallax, "custom_background_1_x_parallax", 0.1, true);
			custom_background_1_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 y parallax", custom_background_1_y_parallax, "custom_background_1_y_parallax", 0.1, true);
			custom_background_2_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 x parallax", custom_background_2_x_parallax, "custom_background_2_x_parallax", 0.1, true);
			custom_background_2_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 y parallax", custom_background_2_y_parallax, "custom_background_2_y_parallax", 0.1, true);
			custom_background_3_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 x parallax", custom_background_3_x_parallax, "custom_background_3_x_parallax", 0.1, true);
			custom_background_3_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 y parallax", custom_background_3_y_parallax, "custom_background_3_y_parallax", 0.1, true);
			custom_background_4_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 x parallax", custom_background_4_x_parallax, "custom_background_4_x_parallax", 0.1, true);
			custom_background_4_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 y parallax", custom_background_4_y_parallax, "custom_background_4_y_parallax", 0.1, true);
		}
		#endregion /* Background Parallax END */
		
		else
		
		#region /* Background Scale */
		if (menu == "back_background_scale")
		|| (menu == "custom_background_1_x_scale")
		|| (menu == "custom_background_1_y_scale")
		|| (menu == "custom_background_2_x_scale")
		|| (menu == "custom_background_2_y_scale")
		|| (menu == "custom_background_3_x_scale")
		|| (menu == "custom_background_3_y_scale")
		|| (menu == "custom_background_4_x_scale")
		|| (menu == "custom_background_4_y_scale")
		{
			
			#region /* Background Scale Menu Navigation */
			
			#region /* Background Scale Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			|| (menu == "back_background_scale")
			&& (key_a_pressed)
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			{
				menu = "background_scale";
				menu_delay = 10;
			}
			#endregion /* Background Scale Back Navigation END */
		
			if (menu == "back_background_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_x_scale";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background_1_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_1_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_x_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_x_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_x_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_scale";
					menu_delay = 3;
				}
			}
			#endregion /* Background Scale Menu Navigation END */
			
			#region /* Background Scale Save level_information.ini */
			if (global.character_select_in_this_menu == "level_editor")
			&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
			{
				ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				ini_write_real("Custom Backgrounds", "custom_background_1_x_scale", custom_background_1_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background_1_y_scale", custom_background_1_y_scale);
				ini_write_real("Custom Backgrounds", "custom_background_2_x_scale", custom_background_2_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background_2_y_scale", custom_background_2_y_scale);
				ini_write_real("Custom Backgrounds", "custom_background_3_x_scale", custom_background_3_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background_3_y_scale", custom_background_3_y_scale);
				ini_write_real("Custom Backgrounds", "custom_background_4_x_scale", custom_background_4_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background_4_y_scale", custom_background_4_y_scale);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* Background Scale Save level_information.ini END */
			
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
			
			draw_menu_button(level_editor_options_x, 40 * 2 + menu_y_offset, l10n_text("Back"), "back_background_scale", "background_scale");
			draw_sprite_ext(spr_icons_back, 0, level_editor_options_x + 20, 40 * 2 + menu_y_offset + 21, 1, 1, 0, c_white, 1);
			
			custom_background_1_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 x scale", custom_background_1_x_scale, "custom_background_1_x_scale", 0.1, true);
			custom_background_1_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_1_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 1 y scale", custom_background_1_y_scale, "custom_background_1_y_scale", 0.1, true);
			custom_background_2_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 x scale", custom_background_2_x_scale, "custom_background_2_x_scale", 0.1, true);
			custom_background_2_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_2_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 2 y scale", custom_background_2_y_scale, "custom_background_2_y_scale", 0.1, true);
			custom_background_3_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 x scale", custom_background_3_x_scale, "custom_background_3_x_scale", 0.1, true);
			custom_background_3_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_3_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 3 y scale", custom_background_3_y_scale, "custom_background_3_y_scale", 0.1, true);
			custom_background_4_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 x scale", custom_background_4_x_scale, "custom_background_4_x_scale", 0.1, true);
			custom_background_4_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background_4_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "custom background 4 y scale", custom_background_4_y_scale, "custom_background_4_y_scale", 0.1, true);
			scr_scale_background();
		}
		#endregion /* Background Scale END */
		
		else
		
		#region /* Background Tiled */
		if (menu == "back_background_tiled")
		|| (menu == "custom_background_1_htiled")
		|| (menu == "custom_background_1_vtiled")
		|| (menu == "custom_background_2_htiled")
		|| (menu == "custom_background_2_vtiled")
		|| (menu == "custom_background_3_htiled")
		|| (menu == "custom_background_3_vtiled")
		|| (menu == "custom_background_4_htiled")
		|| (menu == "custom_background_4_vtiled")
		{
			
			#region /* Background Tiled Menu Navigation */
			
			#region /* Background Tiled Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			|| (menu == "back_background_tiled")
			&& (key_a_pressed)
			&& (menu_delay == 0)
			&& (open_dropdown == false)
			{
				
				#region /* Background Tiled Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_real("Custom Backgrounds", "custom_background_1_htiled", custom_background_1_htiled);
					ini_write_real("Custom Backgrounds", "custom_background_1_vtiled", custom_background_1_vtiled);
					ini_write_real("Custom Backgrounds", "custom_background_2_htiled", custom_background_2_htiled);
					ini_write_real("Custom Backgrounds", "custom_background_2_vtiled", custom_background_2_vtiled);
					ini_write_real("Custom Backgrounds", "custom_background_3_htiled", custom_background_3_htiled);
					ini_write_real("Custom Backgrounds", "custom_background_3_vtiled", custom_background_3_vtiled);
					ini_write_real("Custom Backgrounds", "custom_background_4_htiled", custom_background_4_htiled);
					ini_write_real("Custom Backgrounds", "custom_background_4_vtiled", custom_background_4_vtiled);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Background Tiled Save level_information.ini END */
				
				menu = "background_tiled";
				menu_delay = 10;
			}
			#endregion /* Background Tiled Back Navigation END */
		
			if (menu == "back_background_tiled")
			{
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_htiled";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background_1_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_1_htiled){custom_background_1_htiled = false;}else{custom_background_1_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background")), custom_background_1_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_tiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_1_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_1_vtiled){custom_background_1_vtiled = false;}else{custom_background_1_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background")), custom_background_1_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_htiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_2_htiled){custom_background_2_htiled = false;}else{custom_background_2_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background_2")), custom_background_2_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_1_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_2_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_2_vtiled){custom_background_2_vtiled = false;}else{custom_background_2_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background_2")), custom_background_2_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_htiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_3_htiled){custom_background_3_htiled = false;}else{custom_background_3_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background_3")), custom_background_3_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_2_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_3_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_3_vtiled){custom_background_3_vtiled = false;}else{custom_background_3_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background_3")), custom_background_3_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_htiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_4_htiled){custom_background_4_htiled = false;}else{custom_background_4_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background_4")), custom_background_4_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_3_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background_4_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0)
				{
					if (custom_background_4_vtiled){custom_background_4_vtiled = false;}else{custom_background_4_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background_4")), custom_background_4_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "custom_background_4_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0)
				&& (open_dropdown == false)
				{
					menu = "back_background_tiled";
					menu_delay = 3;
				}
			}
			#endregion /* Background Tiled Menu Navigation END */
			
			draw_menu_button(level_editor_options_x, 40 * 2 + menu_y_offset, l10n_text("Back"), "back_background_tiled", "background_tiled");
			draw_sprite_ext(spr_icons_back, 0, level_editor_options_x + 20, 40 * 2 + menu_y_offset + 21, 1, 1, 0, c_white, 1);
			
			draw_menu_checkmark(level_editor_options_x, custom_background_1_htiled_y + menu_y_offset, "custom background 1 horizontal tiled", "custom_background_1_htiled", custom_background_1_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background_1_vtiled_y + menu_y_offset, "custom background 1 vertical tiled", "custom_background_1_vtiled", custom_background_1_vtiled);
			draw_menu_checkmark(level_editor_options_x, custom_background_2_htiled_y + menu_y_offset, "custom background 2 horizontal tiled", "custom_background_2_htiled", custom_background_2_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background_2_vtiled_y + menu_y_offset, "custom background 2 vertical tiled", "custom_background_2_vtiled", custom_background_2_vtiled);
			draw_menu_checkmark(level_editor_options_x, custom_background_3_htiled_y + menu_y_offset, "custom background 3 horizontal tiled", "custom_background_3_htiled", custom_background_3_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background_3_vtiled_y + menu_y_offset, "custom background 3 vertical tiled", "custom_background_3_vtiled", custom_background_3_vtiled);
			draw_menu_checkmark(level_editor_options_x, custom_background_4_htiled_y + menu_y_offset, "custom background 4 horizontal tiled", "custom_background_4_htiled", custom_background_4_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background_4_vtiled_y + menu_y_offset, "custom background 4 vertical tiled", "custom_background_4_vtiled", custom_background_4_vtiled);
		}
		#endregion /* Background Tiled END */
		
	}
}