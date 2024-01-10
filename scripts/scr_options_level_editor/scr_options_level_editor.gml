function scr_options_level_editor()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	if (pause)
	{
		var level_editor_options_x = 500;
		var options_level_editor_right_arrow_x = 550;
		var custom_background1_x_offset_y = (40 * 3);
		var custom_background1_y_offset_y = (40 * 4);
		var custom_background2_x_offset_y = (40 * 5);
		var custom_background2_y_offset_y = (40 * 6);
		var custom_background3_x_offset_y = (40 * 7);
		var custom_background3_y_offset_y = (40 * 8);
		var custom_background4_x_offset_y = (40 * 9);
		var custom_background4_y_offset_y = (40 * 10);
		var custom_foreground1_x_offset_y = (40 * 11);
		var custom_foreground1_y_offset_y = (40 * 12);
		var custom_foreground1_5_x_offset_y = (40 * 13);
		var custom_foreground1_5_y_offset_y = (40 * 14);
		var custom_foreground2_x_offset_y = (40 * 15);
		var custom_foreground2_y_offset_y = (40 * 16);
		var custom_foreground_secret_x_offset_y = (40 * 17);
		var custom_foreground_secret_y_offset_y = (40 * 18);
		
		var custom_background1_x_parallax_y = (40 * 3);
		var custom_background1_y_parallax_y = (40 * 4);
		var custom_background2_x_parallax_y = (40 * 5);
		var custom_background2_y_parallax_y = (40 * 6);
		var custom_background3_x_parallax_y = (40 * 7);
		var custom_background3_y_parallax_y = (40 * 8);
		var custom_background4_x_parallax_y = (40 * 9);
		var custom_background4_y_parallax_y = (40 * 10);
		
		var custom_background1_x_scale_y = (40 * 3);
		var custom_background1_y_scale_y = (40 * 4);
		var custom_background2_x_scale_y = (40 * 5);
		var custom_background2_y_scale_y = (40 * 6);
		var custom_background3_x_scale_y = (40 * 7);
		var custom_background3_y_scale_y = (40 * 8);
		var custom_background4_x_scale_y = (40 * 9);
		var custom_background4_y_scale_y = (40 * 10);
		
		var custom_background1_htiled_y = (50 * 3);
		var custom_background1_vtiled_y = (50 * 4);
		var custom_background2_htiled_y = (50 * 5);
		var custom_background2_vtiled_y = (50 * 6);
		var custom_background3_htiled_y = (50 * 7);
		var custom_background3_vtiled_y = (50 * 8);
		var custom_background4_htiled_y = (50 * 9);
		var custom_background4_vtiled_y = (50 * 10);
		
		scr_scroll_menu();
	
		if (menu == "back_level_editor_options")
		|| (menu == "level_theme")
		|| (menu == "make_every_tileset_into_default_tileset")
		|| (menu == "rain")
		|| (menu == "snow")
		|| (menu == "wind")
		|| (menu == "enable_time_countdown")
		|| (menu == "time_countdown")
		|| (menu == "show_new_items_notification_level_editor")
		|| (menu == "select_level_editing_music")
		|| (menu == "delete_all_objects")
		{
			if (level_editor_options_back_to_menu == "delete_all_objects_button")
			{
				pause = false;
			}
			changing_level_theme_menu = false;
			
			#region /* Menu Navigation */
			
			#region /* Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (menu == "back_level_editor_options")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				
				#region /* Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
					ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
					ini_write_real("info", "rain", global.effect_rain);
					ini_write_real("info", "snow", global.effect_snow);
					ini_write_real("info", "wind", global.effect_wind);
					ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
					ini_write_real("info", "time_countdown", global.time_countdown);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Save level_information.ini END */
				
				#region /* Save config.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "save_file/config.ini"))
				{
					ini_open(working_directory + "save_file/config.ini");
					ini_write_real("config", "show_new_items_notification_level_editor", global.show_new_items_notification);
					ini_write_real("config", "select_level_editing_music", global.selected_level_editing_music);
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
					menu_delay = 3;
				}
			}
			#endregion /* Back Navigation END */
			
			if (menu == "back_level_editor_options")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "delete_all_objects";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "level_theme";
					menu_delay = 3;
				}
			}
			else
			if (menu == "level_theme")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_entire_theme";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_level_editor_options";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "make_every_tileset_into_default_tileset";
					menu_delay = 3;
				}
			}
			else
			if (menu == "make_every_tileset_into_default_tileset")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
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
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "level_theme";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "rain";
					menu_delay = 3;
				}
			}
			else
			if (menu == "rain")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					global.effect_rain = !global.effect_rain;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "make_every_tileset_into_default_tileset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "snow";
					menu_delay = 3;
				}
			}
			if (menu == "snow")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					global.effect_snow = !global.effect_snow;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "rain";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "wind";
					menu_delay = 3;
				}
			}
			if (menu == "wind")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					global.effect_wind = !global.effect_wind;
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "snow";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "enable_time_countdown";
					menu_delay = 3;
				}
			}
			if (menu == "enable_time_countdown")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
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
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "wind";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
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
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "enable_time_countdown";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "show_new_items_notification_level_editor";
					menu_delay = 3;
				}
			}
			if (menu == "show_new_items_notification_level_editor")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
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
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
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
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "select_level_editing_music";
					menu_delay = 3;
				}
			}
			if (menu == "select_level_editing_music")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "show_new_items_notification_level_editor";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "delete_all_objects";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (open_dropdown)
				&& (global.selected_level_editing_music > 0)
				{
					global.selected_level_editing_music --;
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
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
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "delete_all_objects_no"
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "select_level_editing_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_level_editor_options";
					menu_delay = 3;
				}
			}
			#endregion /* Menu Navigation END */
			
			if (global.controls_used_for_navigation == "gamepad")
			{
				scr_draw_gamepad_buttons(gp_face3, 40, 80, 0.75, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 80, 0.75, 0.75, 0, c_white, 1);
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(80, 80, l10n_text("Hold down to change the value faster"), global.default_text_size * 0.6, c_black, c_white, 1);
			
			if (global.time_countdown < 0)
			{
				global.time_countdown = 0;
			}
			
			var level_theme_y = 47 * 1;
			var make_every_tileset_into_default_tileset_y = 47 * 2;
			var rain_y = 47 * 3;
			var snow_y = 47 * 4;
			var wind_y = 47 * 5;
			var enable_time_countdown_y = 47 * 6;
			var time_countdown_y = 46 * 7;
			var show_new_items_notification_y = 46 * 8;
			var selected_level_editing_music_y = 46 * 10 - 16;
			var delete_all_objects_y = 46 * 11 + 20 - 16;
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_level_editor_options", "level_editor_options");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			draw_menu_button(level_editor_options_x, level_theme_y, l10n_text("Level Theme"), "level_theme", "change_entire_theme");
			draw_menu_checkmark(level_editor_options_x - 90, make_every_tileset_into_default_tileset_y, l10n_text("Make every tileset into default tileset"), "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
			draw_menu_checkmark(level_editor_options_x - 90, rain_y, l10n_text("Rain"), "rain", global.effect_rain);
			draw_menu_checkmark(level_editor_options_x - 90, snow_y, l10n_text("Snow"), "snow", global.effect_snow);
			draw_menu_checkmark(level_editor_options_x - 90, wind_y, l10n_text("Wind"), "wind", global.effect_wind);
			draw_menu_checkmark(level_editor_options_x - 90, enable_time_countdown_y, l10n_text("Enable Time Countdown"), "enable_time_countdown", global.enable_time_countdown);
			if (global.enable_time_countdown)
			{
				global.time_countdown = draw_menu_left_right_buttons(level_editor_options_x, time_countdown_y, options_level_editor_right_arrow_x, l10n_text("Time Countdown"), global.time_countdown, "time_countdown", 1, false);
			}
			draw_menu_checkmark(level_editor_options_x - 90, show_new_items_notification_y, l10n_text("Show New Items Notification"), "show_new_items_notification_level_editor", global.show_new_items_notification);
			draw_menu_button(level_editor_options_x, delete_all_objects_y, l10n_text("Delete All Objects"), "delete_all_objects", "delete_all_objects_no", c_red);
			draw_sprite_ext(spr_icon_delete, 0, level_editor_options_x + 16, delete_all_objects_y + 21, 1, 1, 0, c_white, 1);
			draw_menu_dropdown(level_editor_options_x - 32, selected_level_editing_music_y, l10n_text("Level Editing Music"), "select_level_editing_music", global.selected_level_editing_music, l10n_text("None"), l10n_text("Random"), l10n_text("Music 1"), l10n_text("Music 2"), l10n_text("Music 3"), l10n_text("Music 4"));
		}
		else
		if (menu == "delete_all_objects_yes")
		|| (menu == "delete_all_objects_no")
		{
			draw_set_alpha(0.1);
			draw_rectangle_color(0, 0, get_window_width * 3, get_window_height * 3, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(0.1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 100, l10n_text("Are you sure you want to delete every object in the level?"), global.default_text_size, c_black, c_red, 1);
			draw_menu_button(get_window_width * 0.5 - 370 - 32, get_window_height * 0.5, l10n_text("Yes"), "delete_all_objects_yes", "delete_all_objects_deleting", c_red);
			draw_sprite_ext(spr_icon_delete, 0, get_window_width * 0.5 - 370 - 32 + 16, get_window_height * 0.5 + 21, 1, 1, 0, c_white, 1);
			draw_menu_button(get_window_width * 0.5 + 32, get_window_height * 0.5, l10n_text("No"), "delete_all_objects_no", "delete_all_objects");
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 + 32 + 16, get_window_height * 0.5 + 21, 1, 1, 0, c_white, 1);
			
			if (key_b_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "delete_all_objects";
				menu_delay = 3;
			}
			else
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (menu == "delete_all_objects_no")
				{
					if (level_editor_options_back_to_menu == "delete_all_objects_button")
					{
						pause = false;
					}
					else
					{
						menu = "delete_all_objects";
					}
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
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_right)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
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
			if (level_editor_options_back_to_menu == "delete_all_objects_button")
			{
				pause = false;
			}
			else
			{
				menu = "delete_all_objects";
			}
		}
		else
		
		#region /* Level Theme Menu */
		if (menu == "back_level_theme")
		|| (menu == "change_entire_theme")
		|| (menu == "remove_entire_theme")
		|| (menu == "change_background")
		|| (menu == "change_music")
		|| (menu == "background_offset")
		|| (menu == "background_parallax")
		|| (menu == "background_scale")
		|| (menu == "background_tiled")
		{
			changing_level_theme_menu = true;
			level_editor_options_back_to_menu = menu; /* Save what menu you came from, to use later */
			level_editor_options_select_level_index = global.select_level_index;
			
			var change_entire_theme_y = 47 * 3;
			var change_background_y = 47 * 4;
			var change_music_y = 47 * 5;
			var background_offset_y = 47 * 6;
			var background_parallax_y = 47 * 7;
			var background_scale_y = 47 * 8;
			var background_tiled_y = 47 * 9;
			
			draw_set_halign(fa_center);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 47 * 2, "Changing the theme from this menu will set the default theme, taken from official levels", global.default_text_size, c_black, c_white, 1);
			
			if (!global.can_load_custom_level_assets)
			{
				draw_set_halign(fa_left);
				draw_roundrect_color_ext(0, display_get_gui_height() - 32 - 16, 800, display_get_gui_height(), 50, 50, c_black, c_black, false);
				scr_draw_text_outlined(24, display_get_gui_height() - 24, l10n_text("Load Custom Level Assets is turned off!"), global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(24, display_get_gui_height() - 24, l10n_text("Load Custom Level Assets is turned off!"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 2));
			}
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_level_theme", "level_theme");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			draw_menu_button(level_editor_options_x, change_entire_theme_y, l10n_text("Change Entire Theme"), "change_entire_theme", "load_official_level_to_take_from");
			if (have_custom_asset_background1)
			|| (have_custom_asset_background2)
			|| (have_custom_asset_background3)
			|| (have_custom_asset_background4)
			|| (have_custom_asset_foreground1)
			|| (have_custom_asset_foreground1_5)
			|| (have_custom_asset_foreground2)
			|| (have_custom_asset_foreground_secret)
			|| (have_custom_asset_music)
			|| (have_custom_asset_music_underwater)
			|| (have_custom_asset_ambience)
			|| (have_custom_asset_ambience_underwater)
			|| (have_custom_asset_clear_melody)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_entire_theme_y + 24, l10n_text("Custom Assets Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_entire_theme_y, 16, 0, 1, 1, 32, 32, "", "remove_entire_theme", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_background_y, l10n_text("Change Background"), "change_background", "change_all_background");
			if (have_custom_asset_background1)
			|| (have_custom_asset_background2)
			|| (have_custom_asset_background3)
			|| (have_custom_asset_background4)
			|| (have_custom_asset_foreground1)
			|| (have_custom_asset_foreground1_5)
			|| (have_custom_asset_foreground2)
			|| (have_custom_asset_foreground_secret)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background_y + 24, l10n_text("Custom Backgrounds Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button(level_editor_options_x, change_music_y, l10n_text("Change Music"), "change_music", "change_all_music");
			if (have_custom_asset_music)
			|| (have_custom_asset_music_underwater)
			|| (have_custom_asset_ambience)
			|| (have_custom_asset_ambience_underwater)
			|| (have_custom_asset_clear_melody)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_music_y + 24, l10n_text("Custom Sounds Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button(level_editor_options_x, background_offset_y, l10n_text("BG Offset"), "background_offset", "back_background_offset");
			draw_menu_button(level_editor_options_x, background_parallax_y, l10n_text("BG Parallax"), "background_parallax", "back_background_parallax");
			draw_menu_button(level_editor_options_x, background_scale_y, l10n_text("BG Scale"), "background_scale", "back_background_scale");
			draw_menu_button(level_editor_options_x, background_tiled_y, l10n_text("BG Tiled"), "background_tiled", "back_background_tiled");
			
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			|| (menu == "back_level_theme")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "level_theme";
				menu_delay = 3;
			}
			if (menu == "back_level_theme")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_tiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_entire_theme";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_entire_theme")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_level_theme";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_entire_theme";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_entire_theme")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_level_theme";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_entire_theme";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_background")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_background";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_entire_theme";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_music")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_music";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_offset";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_offset")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_offset";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_parallax";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_parallax")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_parallax";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_scale";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_scale")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_scale";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_tiled";
					menu_delay = 3;
				}
			}
			else
			if (menu == "background_tiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_tiled";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "background_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_level_theme";
					menu_delay = 3;
				}
			}
		}
		#endregion /* Level Theme Menu END */
		
		else
		
		#region /* Change Background Menu */
		if (menu == "back_change_background")
		|| (menu == "change_all_background")
		|| (menu == "change_background1")
		|| (menu == "change_background2")
		|| (menu == "change_background3")
		|| (menu == "change_background4")
		|| (menu == "change_all_foreground")
		|| (menu == "change_foreground1")
		|| (menu == "change_foreground1_5")
		|| (menu == "change_foreground2")
		|| (menu == "change_foreground_secret")
		|| (menu == "remove_all_background")
		|| (menu == "remove_background1")
		|| (menu == "remove_background2")
		|| (menu == "remove_background3")
		|| (menu == "remove_background4")
		|| (menu == "remove_all_foreground")
		|| (menu == "remove_foreground1")
		|| (menu == "remove_foreground1_5")
		|| (menu == "remove_foreground2")
		|| (menu == "remove_foreground_secret")
		{
			level_editor_options_back_to_menu = menu; /* Save what menu you came from, to use later */
			level_editor_options_select_level_index = global.select_level_index;
			
			var change_all_background_y = 47 * 1;
			var change_background1_y = 47 * 2;
			var change_background2_y = 47 * 3;
			var change_background3_y = 47 * 4;
			var change_background4_y = 47 * 5;
			var change_all_foreground_y = 47 * 6;
			var change_foreground1_y = 47 * 7;
			var change_foreground1_5_y = 47 * 8;
			var change_foreground2_y = 47 * 9;
			var change_foreground_secret_y = 47 * 10;
			
			if (!global.can_load_custom_level_assets)
			{
				draw_set_halign(fa_left);
				draw_roundrect_color_ext(0, display_get_gui_height() - 32 - 16, 800, display_get_gui_height(), 50, 50, c_black, c_black, false);
				scr_draw_text_outlined(24, display_get_gui_height() - 24, l10n_text("Load Custom Level Assets is turned off!"), global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(24, display_get_gui_height() - 24, l10n_text("Load Custom Level Assets is turned off!"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 2));
			}
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_change_background", "change_background");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			draw_menu_button(level_editor_options_x, change_all_background_y, l10n_text("Change All Backgrounds"), "change_all_background", "load_official_level_to_take_from");
			if (have_custom_asset_background1)
			|| (have_custom_asset_background2)
			|| (have_custom_asset_background3)
			|| (have_custom_asset_background4)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_all_background_y + 24, l10n_text("Custom Backgrounds Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_all_background_y, 16, 0, 1, 1, 32, 32, "", "remove_all_background", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_background1_y, l10n_text("Change Background 1"), "change_background1", "load_official_level_to_take_from");
			if (have_custom_asset_background1)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background1_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background1_y + 24, string(global.default_background1), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_background1_y, 16, 0, 1, 1, 32, 32, "", "remove_background1", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_background2_y, l10n_text("Change Background 2"), "change_background2", "load_official_level_to_take_from");
			if (have_custom_asset_background2)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background2_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background2_y + 24, string(global.default_background2), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_background2_y, 16, 0, 1, 1, 32, 32, "", "remove_background2", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_background3_y, l10n_text("Change Background 3"), "change_background3", "load_official_level_to_take_from");
			if (have_custom_asset_background3)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background3_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background3_y + 24, string(global.default_background3), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_background3_y, 16, 0, 1, 1, 32, 32, "", "remove_background3", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_background4_y, l10n_text("Change Background 4"), "change_background4", "load_official_level_to_take_from");
			if (have_custom_asset_background4)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background4_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_background4_y + 24, string(global.default_background4), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_background4_y, 16, 0, 1, 1, 32, 32, "", "remove_background4", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_all_foreground_y, l10n_text("Change All Foregrounds"), "change_all_foreground", "load_official_level_to_take_from");
			if (have_custom_asset_foreground1)
			|| (have_custom_asset_foreground1_5)
			|| (have_custom_asset_foreground2)
			|| (have_custom_asset_foreground_secret)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_all_foreground_y + 24, l10n_text("Custom Foregrounds Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_all_foreground_y, 16, 0, 1, 1, 32, 32, "", "remove_all_foreground", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_foreground1_y, l10n_text("Change Foreground 1"), "change_foreground1", "load_official_level_to_take_from");
			if (have_custom_asset_foreground1)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground1_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground1_y + 24, string(global.default_foreground1), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_foreground1_y, 16, 0, 1, 1, 32, 32, "", "remove_foreground1", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_foreground1_5_y, l10n_text("Change Foreground 1.5"), "change_foreground1_5", "load_official_level_to_take_from");
			if (have_custom_asset_foreground1_5)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground1_5_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground1_5_y + 24, string(global.default_foreground1_5), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_foreground1_5_y, 16, 0, 1, 1, 32, 32, "", "remove_foreground1_5", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_foreground2_y, l10n_text("Change Foreground 2"), "change_foreground2", "load_official_level_to_take_from");
			if (have_custom_asset_foreground2)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground2_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground2_y + 24, string(global.default_foreground2), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_foreground2_y, 16, 0, 1, 1, 32, 32, "", "remove_foreground2", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_foreground_secret_y, l10n_text("Change Foreground Secret"), "change_foreground_secret", "load_official_level_to_take_from");
			if (have_custom_asset_foreground_secret)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground_secret_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_foreground_secret_y + 24, string(global.default_foreground_secret), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_foreground_secret_y, 16, 0, 1, 1, 32, 32, "", "remove_foreground_secret", "remove_theme_are_you_sure_no");
			
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			|| (menu == "back_change_background")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "change_background";
				menu_delay = 3;
			}
			if (menu == "back_change_background")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground_secret";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_background";
					menu_delay = 3;
				}
			}
			else
			
			#region /* Navigate change backgrounds */
			if (menu == "change_all_background")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_background";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background1";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_all_background";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_background1")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_background";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background2";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background1";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_background2")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background1";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background3";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background2";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_background3")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background2";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background4";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background3";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_background4")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background3";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_foreground";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background4";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_all_foreground")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background4";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground1";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_all_foreground";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_foreground1")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_foreground";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground1_5";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground1";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_foreground1_5")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground1";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground2";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground1_5";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_foreground2")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground1_5";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground_secret";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground2";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_foreground_secret")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground2";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_background";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground_secret";
					menu_delay = 3;
				}
			}
			#endregion /* Navigate change backgrounds END */
			
			else
			
			#region /* Navigate remove backgrounds */
			if (menu == "remove_all_background")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_background";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background1";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_background";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_background1")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_all_background";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background2";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background1";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_background2")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background1";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background3";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background2";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_background3")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background2";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background4";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background3";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_background4")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background3";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_foreground";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_background4";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_all_foreground")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_background4";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground1";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_foreground";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_foreground1")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_foreground";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground1_5";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground1";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_foreground1_5")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground1";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground2";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground1_5";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_foreground2")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground1_5";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground_secret";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground2";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_foreground_secret")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_foreground2";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_background";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_foreground_secret";
					menu_delay = 3;
				}
			}
			#endregion /* Navigate remove backgrounds END */
			
		}
		#endregion /* Change Background Menu END */
		
		else
		
		#region /* Change Music Menu */
		if (menu == "back_change_music")
		|| (menu == "change_all_music")
		|| (menu == "change_music_overworld")
		|| (menu == "change_music_underwater")
		|| (menu == "change_ambience_overworld")
		|| (menu == "change_ambience_underwater")
		|| (menu == "change_clear_melody")
		|| (menu == "remove_all_music")
		|| (menu == "remove_music_overworld")
		|| (menu == "remove_music_underwater")
		|| (menu == "remove_ambience_overworld")
		|| (menu == "remove_ambience_underwater")
		|| (menu == "remove_clear_melody")
		{
			level_editor_options_back_to_menu = menu; /* Save what menu you came from, to use later */
			level_editor_options_select_level_index = global.select_level_index;
			
			var change_all_music_y = 47 * 1;
			var change_music_overworld_y = 47 * 2;
			var change_music_underwater_y = 47 * 3;
			var change_ambience_overworld_y = 47 * 4;
			var change_ambience_underwater_y = 47 * 5;
			var change_clear_melody_y = 47 * 6;
			
			if (!global.can_load_custom_level_assets)
			{
				draw_set_halign(fa_left);
				draw_roundrect_color_ext(0, display_get_gui_height() - 32 - 16, 800, display_get_gui_height(), 50, 50, c_black, c_black, false);
				scr_draw_text_outlined(24, display_get_gui_height() - 24, l10n_text("Load Custom Level Assets is turned off!"), global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(24, display_get_gui_height() - 24, l10n_text("Load Custom Level Assets is turned off!"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 2));
			}
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_change_music", "change_music");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			draw_menu_button(level_editor_options_x, change_all_music_y, l10n_text("Change All Music"), "change_all_music", "load_official_level_to_take_from");
			if (have_custom_asset_music)
			|| (have_custom_asset_music_underwater)
			|| (have_custom_asset_ambience)
			|| (have_custom_asset_ambience_underwater)
			|| (have_custom_asset_clear_melody)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_all_music_y + 24, l10n_text("Custom Sounds Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_all_music_y, 16, 0, 1, 1, 32, 32, "", "remove_all_music", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_music_overworld_y, l10n_text("Change Overworld Music"), "change_music_overworld", "load_official_level_to_take_from");
			if (have_custom_asset_music)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_music_overworld_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_music_overworld_y + 24, string(global.default_music_overworld), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_music_overworld_y, 16, 0, 1, 1, 32, 32, "", "remove_music_overworld", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_music_underwater_y, l10n_text("Change Underwater Music"), "change_music_underwater", "load_official_level_to_take_from");
			if (have_custom_asset_music_underwater)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_music_underwater_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_music_underwater_y + 24, string(global.default_music_underwater), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_music_underwater_y, 16, 0, 1, 1, 32, 32, "", "remove_music_underwater", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_ambience_overworld_y, l10n_text("Change Overworld Ambience"), "change_ambience_overworld", "load_official_level_to_take_from");
			if (have_custom_asset_ambience)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_ambience_overworld_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_ambience_overworld_y + 24, string(global.default_ambience_overworld), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_ambience_overworld_y, 16, 0, 1, 1, 32, 32, "", "remove_ambience_overworld", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_ambience_underwater_y, l10n_text("Change Underwater Ambience"), "change_ambience_underwater", "load_official_level_to_take_from");
			if (have_custom_asset_ambience_underwater)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_ambience_underwater_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_ambience_underwater_y + 24, string(global.default_ambience_underwater), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_ambience_underwater_y, 16, 0, 1, 1, 32, 32, "", "remove_ambience_underwater", "remove_theme_are_you_sure_no");
			draw_menu_button(level_editor_options_x, change_clear_melody_y, l10n_text("Change Clear Melody"), "change_clear_melody", "load_official_level_to_take_from");
			if (have_custom_asset_clear_melody)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_clear_melody_y + 24, l10n_text("Custom Asset Loaded"), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(level_editor_options_x + 620, change_clear_melody_y + 24, string(global.default_clear_melody), global.default_text_size * 0.75, c_black, c_white, 1);
			}
			draw_menu_button_sprite(spr_icon_delete, level_editor_options_x + 432, change_clear_melody_y, 16, 0, 1, 1, 32, 32, "", "remove_clear_melody", "remove_theme_are_you_sure_no");
			
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			|| (menu == "back_change_music")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "change_music";
				menu_delay = 3;
			}
			if (menu == "back_change_music")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_clear_melody";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_music";
					menu_delay = 3;
				}
			}
			else
			
			#region /* Navigate change music */
			if (menu == "change_all_music")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music_overworld";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_all_music";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_music_overworld")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music_underwater";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_music_overworld";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_music_underwater")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music_overworld";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_ambience_overworld";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_music_underwater";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_ambience_overworld")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music_underwater";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_ambience_underwater";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_ambience_overworld";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_ambience_underwater")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_ambience_overworld";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_clear_melody";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_ambience_underwater";
					menu_delay = 3;
				}
			}
			else
			if (menu == "change_clear_melody")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "load_official_level_to_take_from";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_ambience_underwater";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_music";
					menu_delay = 3;
				}
				else
				if (key_right)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_clear_melody";
					menu_delay = 3;
				}
			}
			#endregion /* Navigate change music END */
			
			else
			
			#region /* Navigate remove music */
			if (menu == "remove_all_music")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_music_overworld";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_all_music";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_music_overworld")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_all_music";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_music_underwater";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music_overworld";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_music_underwater")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_music_overworld";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_ambience_overworld";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_music_underwater";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_ambience_overworld")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_music_underwater";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_ambience_underwater";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_ambience_overworld";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_ambience_underwater")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_ambience_overworld";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_clear_melody";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_ambience_underwater";
					menu_delay = 3;
				}
			}
			else
			if (menu == "remove_clear_melody")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_theme_are_you_sure_no";
					menu_delay = 3;
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "remove_ambience_underwater";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_change_music";
					menu_delay = 3;
				}
				else
				if (key_left)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "change_clear_melody";
					menu_delay = 3;
				}
			}
			#endregion /* Navigate remove music END */
		}
		#endregion /* Change Music Menu END */
		
		else
		
		#region /* Background Offset, Parallax, Scale, and Tiled */
		
		#region /* Background Offset */
		if (menu == "back_background_offset")
		|| (menu == "custom_background1_x_offset")
		|| (menu == "custom_background1_y_offset")
		|| (menu == "custom_background2_x_offset")
		|| (menu == "custom_background2_y_offset")
		|| (menu == "custom_background3_x_offset")
		|| (menu == "custom_background3_y_offset")
		|| (menu == "custom_background4_x_offset")
		|| (menu == "custom_background4_y_offset")
		|| (menu == "custom_foreground1_x_offset")
		|| (menu == "custom_foreground1_y_offset")
		|| (menu == "custom_foreground1_5_x_offset")
		|| (menu == "custom_foreground1_5_y_offset")
		|| (menu == "custom_foreground2_x_offset")
		|| (menu == "custom_foreground2_y_offset")
		|| (menu == "custom_foreground_secret_x_offset")
		|| (menu == "custom_foreground_secret_y_offset")
		{
			
			#region /* Background Offset Menu Navigation */
			
			#region /* Background Offset Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			|| (menu == "back_background_offset")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				
				#region /* Background Offset Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
					ini_write_real("Custom Backgrounds", "custom_background1_x_offset", custom_background1_x_offset);
					ini_write_real("Custom Backgrounds", "custom_background1_y_offset", custom_background1_y_offset);
					ini_write_real("Custom Backgrounds", "custom_background2_x_offset", custom_background2_x_offset);
					ini_write_real("Custom Backgrounds", "custom_background2_y_offset", custom_background2_y_offset);
					ini_write_real("Custom Backgrounds", "custom_background3_x_offset", custom_background3_x_offset);
					ini_write_real("Custom Backgrounds", "custom_background3_y_offset", custom_background3_y_offset);
					ini_write_real("Custom Backgrounds", "custom_background4_x_offset", custom_background4_x_offset);
					ini_write_real("Custom Backgrounds", "custom_background4_y_offset", custom_background4_y_offset);
					if (instance_exists(obj_foreground1))
					{
						ini_write_real("Custom Backgrounds", "custom_foreground1_x_offset", obj_foreground1.x_offset);
						ini_write_real("Custom Backgrounds", "custom_foreground1_y_offset", obj_foreground1.y_offset);
					}
					if (instance_exists(obj_foreground1_5))
					{
						ini_write_real("Custom Backgrounds", "custom_foreground1_5_x_offset", obj_foreground1_5.x_offset);
						ini_write_real("Custom Backgrounds", "custom_foreground1_5_y_offset", obj_foreground1_5.y_offset);
					}
					if (instance_exists(obj_foreground2))
					{
						ini_write_real("Custom Backgrounds", "custom_foreground2_x_offset", obj_foreground2.x_offset);
						ini_write_real("Custom Backgrounds", "custom_foreground2_y_offset", obj_foreground2.y_offset);
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
				menu_delay = 3;
			}
			#endregion /* Background Offset Back Navigation END */
			
			if (menu == "back_background_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground_secret_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_x_offset";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background1_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background1_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground1_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground1_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_5_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground1_5_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_5_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground1_5_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_5_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground2_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground2_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground1_5_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground2_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground2_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground2_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground_secret_x_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_secret_x_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground2_y_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground_secret_y_offset";
					menu_delay = 3;
				}
			}
			if (menu == "custom_foreground_secret_y_offset")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_foreground_secret_x_offset";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_offset";
					menu_delay = 3;
				}
			}
			#endregion /* Background Offset Menu Navigation END */
			
			if (global.controls_used_for_navigation == "gamepad")
			{
				scr_draw_gamepad_buttons(gp_face3, 40, 80, 0.75, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 80, 0.75, 0.75, 0, c_white, 1);
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(80, 80, l10n_text("Hold down to change the value faster"), global.default_text_size * 0.6, c_black, c_white, 1);
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_background_offset", "background_offset");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			
			custom_background1_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background1_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 1 x offset", custom_background1_x_offset, "custom_background1_x_offset", 1, true);
			custom_background1_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background1_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 1 y offset", custom_background1_y_offset, "custom_background1_y_offset", 1, true);
			custom_background2_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background2_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 2 x offset", custom_background2_x_offset, "custom_background2_x_offset", 1, true);
			custom_background2_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background2_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 2 y offset", custom_background2_y_offset, "custom_background2_y_offset", 1, true);
			custom_background3_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background3_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 3 x offset", custom_background3_x_offset, "custom_background3_x_offset", 1, true);
			custom_background3_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background3_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 3 y offset", custom_background3_y_offset, "custom_background3_y_offset", 1, true);
			custom_background4_x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background4_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 4 x offset", custom_background4_x_offset, "custom_background4_x_offset", 1, true);
			custom_background4_y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_background4_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 4 y offset", custom_background4_y_offset, "custom_background4_y_offset", 1, true);
			if (instance_exists(obj_foreground1))
			{
				obj_foreground1.x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground1_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground 1 x offset", obj_foreground1.x_offset, "custom_foreground1_x_offset", 1, true);
				obj_foreground1.y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground1_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground 1 y offset", obj_foreground1.y_offset, "custom_foreground1_y_offset", 1, true);
			}
			if (instance_exists(obj_foreground1_5))
			{
				obj_foreground1_5.x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground1_5_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground 1.5 x offset", obj_foreground1_5.x_offset, "custom_foreground1_5_x_offset", 1, true);
				obj_foreground1_5.y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground1_5_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground 1.5 y offset", obj_foreground1_5.y_offset, "custom_foreground1_5_y_offset", 1, true);
			}
			if (instance_exists(obj_foreground2))
			{
				obj_foreground2.x_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground2_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground 2 x offset", obj_foreground2.x_offset, "custom_foreground2_x_offset", 1, true);
				obj_foreground2.y_offset = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground2_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground 2 y offset", obj_foreground2.y_offset, "custom_foreground2_y_offset", 1, true);
			}
			if (instance_exists(obj_foreground_secret))
			{
				obj_foreground_secret.x = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_secret_x_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground secret x offset", obj_foreground_secret.x, "custom_foreground_secret_x_offset", 1, true);
				obj_foreground_secret.y = draw_menu_left_right_buttons(level_editor_options_x, custom_foreground_secret_y_offset_y + menu_y_offset, options_level_editor_right_arrow_x, "Foreground secret y offset", obj_foreground_secret.y, "custom_foreground_secret_y_offset", 1, true);
			}
		}
		#endregion /* Background Offset END */
		
		else
		
		#region /* Background Parallax */
		if (menu == "back_background_parallax")
		|| (menu == "custom_background1_x_parallax")
		|| (menu == "custom_background1_y_parallax")
		|| (menu == "custom_background2_x_parallax")
		|| (menu == "custom_background2_y_parallax")
		|| (menu == "custom_background3_x_parallax")
		|| (menu == "custom_background3_y_parallax")
		|| (menu == "custom_background4_x_parallax")
		|| (menu == "custom_background4_y_parallax")
		{
			
			#region /* Background Parallax Menu Navigation */
			
			#region /* Background Parallax Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			|| (menu == "back_background_parallax")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				
				#region /* Background Parallax Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
					ini_write_real("Custom Backgrounds", "custom_background1_x_parallax", custom_background1_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background1_y_parallax", custom_background1_y_parallax);
					ini_write_real("Custom Backgrounds", "custom_background2_x_parallax", custom_background2_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background2_y_parallax", custom_background2_y_parallax);
					ini_write_real("Custom Backgrounds", "custom_background3_x_parallax", custom_background3_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background3_y_parallax", custom_background3_y_parallax);
					ini_write_real("Custom Backgrounds", "custom_background4_x_parallax", custom_background4_x_parallax);
					ini_write_real("Custom Backgrounds", "custom_background4_y_parallax", custom_background4_y_parallax);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Background Parallax Save level_information.ini END */
				
				menu = "background_parallax";
				menu_delay = 3;
			}
			#endregion /* Background Parallax Back Navigation END */
		
			if (menu == "back_background_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_x_parallax";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background1_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background1_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_x_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_x_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_y_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_y_parallax";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_y_parallax")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_x_parallax";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_parallax";
					menu_delay = 3;
				}
			}
			#endregion /* Background Parallax Menu Navigation END */
			
			if (global.controls_used_for_navigation == "gamepad")
			{
				scr_draw_gamepad_buttons(gp_face3, 40, 80, 0.75, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 80, 0.75, 0.75, 0, c_white, 1);
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(80, 80, l10n_text("Hold down to change the value faster"), global.default_text_size * 0.6, c_black, c_white, 1);
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_background_parallax", "background_parallax");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			
			custom_background1_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background1_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 1 x parallax", custom_background1_x_parallax, "custom_background1_x_parallax", 0.1, true);
			custom_background1_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background1_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 1 y parallax", custom_background1_y_parallax, "custom_background1_y_parallax", 0.1, true);
			custom_background2_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background2_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 2 x parallax", custom_background2_x_parallax, "custom_background2_x_parallax", 0.1, true);
			custom_background2_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background2_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 2 y parallax", custom_background2_y_parallax, "custom_background2_y_parallax", 0.1, true);
			custom_background3_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background3_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 3 x parallax", custom_background3_x_parallax, "custom_background3_x_parallax", 0.1, true);
			custom_background3_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background3_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 3 y parallax", custom_background3_y_parallax, "custom_background3_y_parallax", 0.1, true);
			custom_background4_x_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background4_x_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 4 x parallax", custom_background4_x_parallax, "custom_background4_x_parallax", 0.1, true);
			custom_background4_y_parallax = draw_menu_left_right_buttons(level_editor_options_x, custom_background4_y_parallax_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 4 y parallax", custom_background4_y_parallax, "custom_background4_y_parallax", 0.1, true);
		}
		#endregion /* Background Parallax END */
		
		else
		
		#region /* Background Scale */
		if (menu == "back_background_scale")
		|| (menu == "custom_background1_x_scale")
		|| (menu == "custom_background1_y_scale")
		|| (menu == "custom_background2_x_scale")
		|| (menu == "custom_background2_y_scale")
		|| (menu == "custom_background3_x_scale")
		|| (menu == "custom_background3_y_scale")
		|| (menu == "custom_background4_x_scale")
		|| (menu == "custom_background4_y_scale")
		{
			
			#region /* Background Scale Menu Navigation */
			
			#region /* Background Scale Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			|| (menu == "back_background_scale")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				menu = "background_scale";
				menu_delay = 3;
			}
			#endregion /* Background Scale Back Navigation END */
		
			if (menu == "back_background_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_x_scale";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background1_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background1_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_x_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_x_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_x_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_x_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_y_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_y_scale";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_y_scale")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_x_scale";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_scale";
					menu_delay = 3;
				}
			}
			#endregion /* Background Scale Menu Navigation END */
			
			#region /* Background Scale Save level_information.ini */
			if (global.character_select_in_this_menu == "level_editor")
			&& (file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
			{
				ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
				ini_write_real("Custom Backgrounds", "custom_background1_x_scale", custom_background1_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background1_y_scale", custom_background1_y_scale);
				ini_write_real("Custom Backgrounds", "custom_background2_x_scale", custom_background2_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background2_y_scale", custom_background2_y_scale);
				ini_write_real("Custom Backgrounds", "custom_background3_x_scale", custom_background3_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background3_y_scale", custom_background3_y_scale);
				ini_write_real("Custom Backgrounds", "custom_background4_x_scale", custom_background4_x_scale);
				ini_write_real("Custom Backgrounds", "custom_background4_y_scale", custom_background4_y_scale);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* Background Scale Save level_information.ini END */
			
			if (global.controls_used_for_navigation == "gamepad")
			{
				scr_draw_gamepad_buttons(gp_face3, 40, 80, 0.75, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_lcontrol, 40, 80, 0.75, 0.75, 0, c_white, 1);
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(80, 80, l10n_text("Hold down to change the value faster"), global.default_text_size * 0.6, c_black, c_white, 1);
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_background_scale", "background_scale");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			
			custom_background1_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background1_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 1 x scale", custom_background1_x_scale, "custom_background1_x_scale", 0.1, true);
			custom_background1_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background1_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 1 y scale", custom_background1_y_scale, "custom_background1_y_scale", 0.1, true);
			custom_background2_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background2_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 2 x scale", custom_background2_x_scale, "custom_background2_x_scale", 0.1, true);
			custom_background2_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background2_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 2 y scale", custom_background2_y_scale, "custom_background2_y_scale", 0.1, true);
			custom_background3_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background3_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 3 x scale", custom_background3_x_scale, "custom_background3_x_scale", 0.1, true);
			custom_background3_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background3_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 3 y scale", custom_background3_y_scale, "custom_background3_y_scale", 0.1, true);
			custom_background4_x_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background4_x_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 4 x scale", custom_background4_x_scale, "custom_background4_x_scale", 0.1, true);
			custom_background4_y_scale = draw_menu_left_right_buttons(level_editor_options_x, custom_background4_y_scale_y + menu_y_offset, options_level_editor_right_arrow_x, "Background 4 y scale", custom_background4_y_scale, "custom_background4_y_scale", 0.1, true);
			scr_scale_background();
		}
		#endregion /* Background Scale END */
		
		else
		
		#region /* Background Tiled */
		if (menu == "back_background_tiled")
		|| (menu == "custom_background1_htiled")
		|| (menu == "custom_background1_vtiled")
		|| (menu == "custom_background2_htiled")
		|| (menu == "custom_background2_vtiled")
		|| (menu == "custom_background3_htiled")
		|| (menu == "custom_background3_vtiled")
		|| (menu == "custom_background4_htiled")
		|| (menu == "custom_background4_vtiled")
		{
			
			#region /* Background Tiled Menu Navigation */
			
			#region /* Background Tiled Back Navigation */
			if (key_b_pressed)
			&& (!keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			|| (menu == "back_background_tiled")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				
				#region /* Background Tiled Save level_information.ini */
				if (global.character_select_in_this_menu == "level_editor")
				&& (file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
				{
					ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
					ini_write_real("Custom Backgrounds", "custom_background1_htiled", custom_background1_htiled);
					ini_write_real("Custom Backgrounds", "custom_background1_vtiled", custom_background1_vtiled);
					ini_write_real("Custom Backgrounds", "custom_background2_htiled", custom_background2_htiled);
					ini_write_real("Custom Backgrounds", "custom_background2_vtiled", custom_background2_vtiled);
					ini_write_real("Custom Backgrounds", "custom_background3_htiled", custom_background3_htiled);
					ini_write_real("Custom Backgrounds", "custom_background3_vtiled", custom_background3_vtiled);
					ini_write_real("Custom Backgrounds", "custom_background4_htiled", custom_background4_htiled);
					ini_write_real("Custom Backgrounds", "custom_background4_vtiled", custom_background4_vtiled);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Background Tiled Save level_information.ini END */
				
				menu = "background_tiled";
				menu_delay = 3;
			}
			#endregion /* Background Tiled Back Navigation END */
		
			if (menu == "back_background_tiled")
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_htiled";
					menu_delay = 3;
				}
			}
			else
			if (menu == "custom_background1_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background1_htiled){custom_background1_htiled = false;}else{custom_background1_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background")), custom_background1_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_tiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background1_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background1_vtiled){custom_background1_vtiled = false;}else{custom_background1_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background")), custom_background1_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_htiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background2_htiled){custom_background2_htiled = false;}else{custom_background2_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background_2")), custom_background2_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background1_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background2_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background2_vtiled){custom_background2_vtiled = false;}else{custom_background2_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background_2")), custom_background2_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_htiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background3_htiled){custom_background3_htiled = false;}else{custom_background3_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background_3")), custom_background3_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background2_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background3_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background3_vtiled){custom_background3_vtiled = false;}else{custom_background3_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background_3")), custom_background3_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_htiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_htiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background4_htiled){custom_background4_htiled = false;}else{custom_background4_htiled = true;}menu_delay = 3;
					layer_background_htiled(layer_background_get_id(layer_get_id("Background_4")), custom_background4_htiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background3_vtiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_vtiled";
					menu_delay = 3;
				}
			}
			if (menu == "custom_background4_vtiled")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (custom_background4_vtiled){custom_background4_vtiled = false;}else{custom_background4_vtiled = true;}menu_delay = 3;
					layer_background_vtiled(layer_background_get_id(layer_get_id("Background_4")), custom_background4_vtiled);
				}
				else
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "custom_background4_htiled";
					menu_delay = 3;
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					menu = "back_background_tiled";
					menu_delay = 3;
				}
			}
			#endregion /* Background Tiled Menu Navigation END */
			
			draw_menu_button(0, 0, l10n_text("Back"), "back_background_tiled", "background_tiled");
			draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
			
			draw_menu_checkmark(level_editor_options_x, custom_background1_htiled_y + menu_y_offset, "Background 1 horizontal tiled", "custom_background1_htiled", custom_background1_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background1_vtiled_y + menu_y_offset, "Background 1 vertical tiled", "custom_background1_vtiled", custom_background1_vtiled);
			draw_menu_checkmark(level_editor_options_x, custom_background2_htiled_y + menu_y_offset, "Background 2 horizontal tiled", "custom_background2_htiled", custom_background2_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background2_vtiled_y + menu_y_offset, "Background 2 vertical tiled", "custom_background2_vtiled", custom_background2_vtiled);
			draw_menu_checkmark(level_editor_options_x, custom_background3_htiled_y + menu_y_offset, "Background 3 horizontal tiled", "custom_background3_htiled", custom_background3_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background3_vtiled_y + menu_y_offset, "Background 3 vertical tiled", "custom_background3_vtiled", custom_background3_vtiled);
			draw_menu_checkmark(level_editor_options_x, custom_background4_htiled_y + menu_y_offset, "Background 4 horizontal tiled", "custom_background4_htiled", custom_background4_htiled);
			draw_menu_checkmark(level_editor_options_x, custom_background4_vtiled_y + menu_y_offset, "Background 4 vertical tiled", "custom_background4_vtiled", custom_background4_vtiled);
		}
		#endregion /* Background Tiled END */
		
		#endregion /* Background Offset, Parallax, Scale, and Tiled END */
		
		else
		
		#region /* Choose official level to take from */
		if (menu == "load_official_level_to_take_from")
		{
			file_found = "";
			file_load_timer = 0;
			level_find_pos = 0;
			ds_list_clear(global.thumbnail_sprite);
			menu_delay = 3;
			menu = "load2_official_level_to_take_from";
		}
		
		else
		
		if (menu == "load2_official_level_to_take_from")
		{
			scr_draw_loading(1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64 + 32, string(file_found), global.default_text_size, c_white, c_black, 1);
			
			/* Load official level data */
			
			file_load_timer ++;
			
			if (file_load_timer > 1)
			{
				file_found = ds_list_find_value(global.all_loaded_main_levels, level_find_pos)
				level_find_pos ++;
				
				if (file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1))
				{
					file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1)
					
					#region /* Update Thumbnail */
					
					/* PNG Official Thumbnail */
					if (file_exists("levels/" + file_found + "/thumbnail.png"))
					{
						ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/thumbnail.png", 0, false, false, 0, 0));
					}
					else
					/* PNG Automatic Thumbnail */
					if (file_exists("levels/" + file_found + "/automatic_thumbnail.png"))
					{
						ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/automatic_thumbnail.png", 0, false, false, 0, 0));
					}
					else
					{
						ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
					}
					#endregion /* Update Thumbnail END */
					
					select_custom_level_menu_open = false;
					level_editor_template_select = true;
					global.select_level_index = 1; /* Cursor should start at level 1, as level 1 is the default level to choose from */
					file_load_timer = 0; /* Important that you reset this value back to 0, otherwise the menu will not work properly as it still thinks game is loading levels */
					open_sub_menu = false; /* Return this variable to false */
					menu = "choose_official_level_to_take_from";
				}
				else
				{
					
					#region /* Update Thumbnail */
					/* PNG Official Thumbnail */
					if (file_exists("levels/" + file_found + "/thumbnail.png"))
					{
						ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/thumbnail.png", 0, false, false, 0, 0));
					}
					else
					/* PNG Automatic Thumbnail */
					if (file_exists("levels/" + file_found + "/automatic_thumbnail.png"))
					{
						ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/automatic_thumbnail.png", 0, false, false, 0, 0));
					}
					else
					{
						ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
					}
					#endregion /* Update Thumbnail END */
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
				}
			}
		}
		
		else
		
		if (menu == "back_from_level_editor")
		|| (menu == "choose_official_level_to_take_from")
		{
			scr_select_official_level_menu();
			scr_custom_level_select_with_the_mouse(global.all_loaded_main_levels);
		}
		#endregion /* Choose official level to take from END */
		
		else
		
		#region /* Remove level theme data */
		if (menu == "remove_theme_are_you_sure_no")
		|| (menu == "remove_theme_are_you_sure_yes")
		{
			var remove_text_question = "";
			if (level_editor_options_back_to_menu == "remove_entire_theme")
			{
				var remove_text_question = "Remove entire theme?";
			}
			if (level_editor_options_back_to_menu == "remove_all_background")
			{
				var remove_text_question = "Remove all backgrounds?";
			}
			if (level_editor_options_back_to_menu == "remove_background1")
			{
				var remove_text_question = "Remove background 1?";
			}
			if (level_editor_options_back_to_menu == "remove_background2")
			{
				var remove_text_question = "Remove background 2?";
			}
			if (level_editor_options_back_to_menu == "remove_background3")
			{
				var remove_text_question = "Remove background 3?";
			}
			if (level_editor_options_back_to_menu == "remove_background4")
			{
				var remove_text_question = "Remove background 4?";
			}
			if (level_editor_options_back_to_menu == "remove_all_foreground")
			{
				var remove_text_question = "Remove all foregrounds?";
			}
			if (level_editor_options_back_to_menu == "remove_foreground1")
			{
				var remove_text_question = "Remove foreground 1?";
			}
			if (level_editor_options_back_to_menu == "remove_foreground1_5")
			{
				var remove_text_question = "Remove foreground 1.5?";
			}
			if (level_editor_options_back_to_menu == "remove_foreground2")
			{
				var remove_text_question = "Remove foreground 2?";
			}
			if (level_editor_options_back_to_menu == "remove_foreground_secret")
			{
				var remove_text_question = "Remove foreground secret?";
			}
			if (level_editor_options_back_to_menu == "remove_all_music")
			{
				var remove_text_question = "Remove all music?";
			}
			if (level_editor_options_back_to_menu == "remove_music_overworld")
			{
				var remove_text_question = "Remove overworld music?";
			}
			if (level_editor_options_back_to_menu == "remove_music_underwater")
			{
				var remove_text_question = "Remove underwater music?";
			}
			if (level_editor_options_back_to_menu == "remove_ambience_overworld")
			{
				var remove_text_question = "Remove overworld ambience?";
			}
			if (level_editor_options_back_to_menu == "remove_ambience_underwater")
			{
				var remove_text_question = "Remove underwater ambience?";
			}
			if (level_editor_options_back_to_menu == "remove_clear_melody")
			{
				var remove_text_question = "Remove clear melody?";
			}
			draw_set_halign(fa_center);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 47, l10n_text(remove_text_question), global.default_text_size, c_black, c_white, 1);
			draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5, l10n_text("No"), "remove_theme_are_you_sure_no", level_editor_options_back_to_menu);
			draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 47, l10n_text("Yes"), "remove_theme_are_you_sure_yes", "remove_theme_are_you_sure_yes", c_red, 1);
			draw_sprite_ext(spr_icon_delete, 0, display_get_gui_width() * 0.5 - 185 + 20, display_get_gui_height() * 0.5 + 47 + 21, 1, 1, 0, c_white, 1);
			
			if (menu == "remove_theme_are_you_sure_no")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					
					menu = level_editor_options_back_to_menu; /* Go back to the previous menu */
					menu_delay = 3;
				}
				else
				if (key_up)
				|| (key_down)
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (!open_dropdown)
					{
						menu = "remove_theme_are_you_sure_yes";
						menu_delay = 3;
					}
				}
			}
			else
			if (menu == "remove_theme_are_you_sure_yes")
			{
				if (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!open_dropdown)
				{
					
					#region /* Set default theme values to empty string */
					if (level_editor_options_back_to_menu == "remove_entire_theme")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_background1", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_noone);
						ini_write_string("info", "default_background2", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), spr_noone);
						ini_write_string("info", "default_background3", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), spr_noone);
						ini_write_string("info", "default_background4", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), spr_noone);
						ini_write_string("info", "default_foreground1", "");
						ini_write_string("info", "default_foreground1_5", "");
						ini_write_string("info", "default_foreground2", "");
						ini_write_string("info", "default_foreground_secret", "");
						ini_write_string("info", "default_music_overworld", "");
						ini_write_string("info", "default_music_underwater", "");
						ini_write_string("info", "default_ambience_overworld", "");
						ini_write_string("info", "default_ambience_underwater", "");
						ini_write_string("info", "default_clear_melody", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_all_background")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_background1", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_noone);
						ini_write_string("info", "default_background2", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), spr_noone);
						ini_write_string("info", "default_background3", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), spr_noone);
						ini_write_string("info", "default_background4", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), spr_noone);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_all_foreground")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_foreground1", "");
						ini_write_string("info", "default_foreground1_5", "");
						ini_write_string("info", "default_foreground2", "");
						ini_write_string("info", "default_foreground_secret", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_background1")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_background1", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background")), spr_noone);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_background2")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_background2", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), spr_noone);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_background3")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_background3", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), spr_noone);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_background4")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_background4", "");
						layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), spr_noone);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_foreground1")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_foreground1", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_foreground1_5")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_foreground1_5", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_foreground2")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_foreground2", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_foreground_secret")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_foreground_secret", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_all_music")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_music_overworld", "");
						ini_write_string("info", "default_music_underwater", "");
						ini_write_string("info", "default_ambience_overworld", "");
						ini_write_string("info", "default_ambience_underwater", "");
						ini_write_string("info", "default_clear_melody", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_music_overworld")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_music_overworld", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_music_underwater")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_music_underwater", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_ambience_overworld")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_ambience_music", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_ambience_underwater")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_ambience_music", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					else
					if (level_editor_options_back_to_menu == "remove_clear_melody")
					{
						ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
						ini_write_string("info", "default_clear_melody", "");
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					#endregion /* Set default theme values to empty string END */
					
					scr_update_all_backgrounds();
					scr_update_all_music()
					
					menu = level_editor_options_back_to_menu; /* Lastly, go back to the previous menu */
					menu_delay = 3;
				}
				else
				if (key_up)
				|| (key_down)
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (!open_dropdown)
					{
						menu = "remove_theme_are_you_sure_no";
						menu_delay = 3;
					}
				}
			}
		}
		#endregion /* Remove level theme data END */
		
	}
}