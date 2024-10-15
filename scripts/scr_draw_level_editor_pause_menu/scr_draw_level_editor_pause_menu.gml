function scr_draw_level_editor_pause_menu()
{
	
	#region /* Draw Level Editor Pause Menu */
	if (pause)
	&& (quit_level_editor <= 0)
	&& (pressing_play_timer == 0)
	{
		welcome_to_level_editor = 0; /* Close the help menu when pausing the game */
		
		#region /* Make Background Darker */
		if (changing_level_theme_menu)
		{
			draw_set_alpha(0.5);
		}
		else
		{
			draw_set_alpha(0.9);
		}
		draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Make Background Darker END */
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		#region /* Make the menu invisible when entering the options menu */
		if (menu == "continue")
		|| (menu == "options")
		|| (menu == "level_editor_options")
		|| (menu == "generate_level_map")
		|| (menu == "open_custom_levels_folder")
		|| (menu == "level_editor_upload")
		|| (menu == "quit")
		{
			
			#region /* Only quit the pause menu when you're in the first pause menu */
			if (keyboard_check_pressed(vk_escape))
			|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
			|| (gamepad_button_check_pressed(global.player_slot[2], gp_start))
			|| (gamepad_button_check_pressed(global.player_slot[3], gp_start))
			|| (gamepad_button_check_pressed(global.player_slot[4], gp_start))
			|| (gamepad_button_check_pressed(4, gp_start))
			|| (key_b_pressed)
			{
				if (!input_key)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /* Only quit the pause menu when you're in the first pause menu END */
			
			#region /* Show what version of the game the level was first created in */
			/* This should make it easier to port old levels to new game versions */
			/* Showing the original version number makes it easier to pinpoint what changes happened from one version to another */
			if (global.level_name != "")
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				if (made_in_what_version_text != "")
				{
					scr_draw_text_outlined(get_window_width * 0.5 - 100, get_window_height - 32 - 32, string(made_in_what_version_text), global.default_text_size * 0.75, c_black, c_white, 1);
				}
				if (first_created_on_version != "")
				{
					scr_draw_text_outlined(get_window_width * 0.5 - 100, get_window_height - 32, l10n_text("First created on version") + ": " + string(first_created_on_version), global.default_text_size, c_black, c_white, 1);
				}
			}
			#endregion /* Show what version of the game the level was first created in END */
			
			#region /* Draw if level have a Level ID on top of screen */
			if (level_id != "")
			{
				var level_id_y = 32;
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(64, level_id_y, string(level_id), global.default_text_size * scr_wave(1, 1.1, 1, 0), c_black, c_white, 1);
				draw_sprite_ext(spr_icon_upload, 1, 32, level_id_y, scr_wave(0.9, 1, 1, 0), scr_wave(0.9, 1, 1, 0), 0, c_white, 1);
			}
			else
			{
				level_id_y = 0;
			}
			#endregion /* Draw if level have A Level ID on top of screen END */
			
			#region /* Draw if level have been Clear Checked on top of screen */
			if (if_clear_checked)
			{
				var clear_check_y = level_id_y + 32;
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(64, clear_check_y, l10n_text("Clear Checked"), global.default_text_size * scr_wave(1, 1.1, 1, 0), c_black, c_white, 1);
				draw_sprite_ext(spr_icon_finished, 1, 32, clear_check_y, scr_wave(0.9, 1, 1, 0), scr_wave(0.9, 1, 1, 0), 0, c_white, 1);
			}
			else
			{
				var clear_check_y = level_id_y;
			}
			#endregion /* Draw if level have been Clear Checked on top of screen END */
			
			#region /* Draw if level is created in Daily Build on top of screen */
			var daily_build_y = clear_check_y + 32;
			if (if_daily_build)
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(64, daily_build_y, l10n_text("Daily Build"), global.default_text_size * scr_wave(1, 1.1, 1, 0), c_black, c_white, 1);
				draw_sprite_ext(spr_icon_daily_build, 1, 32, daily_build_y, scr_wave(0.9, 1, 1, 0), scr_wave(0.9, 1, 1, 0), 0, c_white, 1);
			}
			else
			{
				var daily_build_y = clear_check_y;
			}
			#endregion /* Draw if level is created in Daily Build on top of screen END */
			
			#region /* Draw if level uses Custom Backgrounds on top of screen */
			var level_has_custom_background_y = daily_build_y + 32;
			
			if (variable_instance_exists(self, "level_has_custom_background"))
			&& (level_has_custom_background)
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(64, level_has_custom_background_y, l10n_text("Uses Custom Background"), global.default_text_size * scr_wave(1, 1.1, 1, 0), c_black, c_white, 1);
				draw_sprite_ext(spr_icon_pen, 1, 32, level_has_custom_background_y, scr_wave(0.9, 1, 1, 0), scr_wave(0.9, 1, 1, 0), 0, c_white, 1);
			}
			#endregion /* Draw if level uses Custom Backgrounds on top of screen END */
			
			#region /* Show text in bottom right of screen what the current custom level name is. This will make it less confusing what level you are editing */
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() - 16, display_get_gui_height() - 16, string(level_name_masked), global.default_text_size, c_black, c_white, 1);
			#endregion /* Show text in bottom right of screen what the current custom level name is. This will make it less confusing what level you are editing END */
			
			in_settings = false;
			
			#region /* If menu is on continue */
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 - 126, l10n_text("Continue"), "continue", noone);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 - 126 + 21, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 - 126, get_window_width * 0.5 + 185, get_window_height * 0.5 -84))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				quit_level_editor = 0;
				can_input_level_name = false;
				pause = false;
			}
			if (menu == "continue")
			&& (!can_input_level_name)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "quit";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "options";
				}
				if (key_a_pressed)
				|| (keyboard_check_pressed(vk_enter))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = 0;
						can_input_level_name = false;
						pause = false;
					}
				}
			}
			#endregion /* If menu is on continue END */
			
			#region /* If menu is on options */
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 -84, l10n_text("Options"), "options", noone);
			draw_sprite_ext(spr_icon_cogwheel, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 -84 + 21, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 -84, get_window_width * 0.5 + 185, get_window_height * 0.5 - 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_cursor_y_position = 0; /* Reset so the scrolling menus are back to 0 */
				quit_level_editor = 0;
				can_input_level_name = false;
				pause = true;
				can_navigate = true;
				in_settings = true;
				can_navigate_settings_sidebar = true;
				menu = noone;
				menu_delay = 3;
				scr_load_storage_variables();
			}
			
			if (menu == "options")
			&& (!can_input_level_name)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "continue";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_editor_options";
				}
				if (key_a_pressed)
				|| (keyboard_check_pressed(vk_enter))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_cursor_y_position = 0; /* Reset so the scrolling menus are back to 0 */
						quit_level_editor = 0;
						can_input_level_name = false;
						pause = true;
						can_navigate = true;
						in_settings = true;
						can_navigate_settings_sidebar = true;
						menu = noone;
						menu_delay = 3;
						scr_load_storage_variables();
					}
				}
				if (key_b_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /* If menu is on options END */
			
			#region /* If menu is on level editor options */
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 -42, l10n_text("Level Options"), "level_editor_options", "level_editor_options");
			
			if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 -42, get_window_width * 0.5 + 185, get_window_height * 0.5))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (menu == "level_editor_options")
			&& (!can_input_level_name)
			&& (key_a_pressed)
			|| (menu == "level_editor_options")
			&& (!can_input_level_name)
			&& (keyboard_check_pressed(vk_enter))
			{
				if (if_clear_checked)
				{
					ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_real("info", "clear_check", false); /* Set clear check to false when trying to upload within the level editor */
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					if_clear_checked = false;
				}
				
				level_editor_option_back_to_menu = ""; /* Reset this variable to nothing */
				quit_level_editor = 0;
				can_input_level_name = false;
				pause = true;
				can_navigate = true;
				in_settings = false;
				can_navigate_settings_sidebar = false;
				menu = "level_theme";
				menu_delay = 3;
			}
			
			if (menu == "level_editor_options")
			&& (!can_input_level_name)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "options";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_option_for_pc)
					{
						menu = "generate_level_map";
					}
					else
					{
						menu = "level_editor_upload";
					}
				}
				if (key_b_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /* If menu is on level editor options END */
			
			#region /* If menu is on generate level map */
			if (global.enable_option_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Generate Level Map"), "generate_level_map", "generate_level_map_yes");
				
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42))
				&& (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = true;
					menu = "generate_level_map_yes";
				}
				if (menu == "generate_level_map")
				&& (!can_input_level_name)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "level_editor_options";
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					&& (show_level_editor_corner_menu)
					{
						menu_delay = 3;
						menu = "open_custom_levels_folder";
					}
					if (key_a_pressed)
					|| (keyboard_check_pressed(vk_enter))
					{
						if (menu_delay == 0 && menu_joystick_delay == 0)
						{
							menu_delay = 3;
							quit_level_editor = 0;
							can_input_level_name = false;
							pause = true;
							menu = "generate_level_map_yes";
						}
					}
					if (key_b_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = 0;
						can_input_level_name = false;
						pause = false;
						can_navigate = false;
					}
				}
			}
			#endregion /* If menu is on generate level map END */
			
			#region /* Open Custom Levels Folder */
			if (global.enable_option_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Open Custom Levels Folder"), "open_custom_levels_folder", "open_custom_levels_folder");
				draw_sprite_ext(spr_icon_folder, 0, get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1);
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, get_window_width * 0.5 - 185 + 371, get_window_height * 0.5 + 42 + 41))
				&& (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "open_custom_levels_folder")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.level_name != "")
					{
						scr_open_folder(game_save_id + "\custom_levels\\" + global.level_name)
					}
				}
				if (menu == "open_custom_levels_folder")
				&& (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					can_navigate = true;
					menu = "generate_level_map";
				}
				if (menu == "open_custom_levels_folder")
				&& (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					can_navigate = true;
					menu = "level_editor_upload";
				}
			}
			#endregion /* Open Custom Levels Folder END */
			
			#region /* If menu is on upload */
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Upload"), "level_editor_upload", "level_editor_upload");
			draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
			if (menu == "level_editor_upload")
			&& (!can_input_level_name)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (show_level_editor_corner_menu)
				{
					menu_delay = 3;
					if (global.enable_option_for_pc)
					{
						menu = "open_custom_levels_folder";
					}
					else
					{
						menu = "level_editor_options";
					}
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "quit";
				}
				if (key_b_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /* If menu is on upload END */
			
			#region /* If menu is on quit */
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42 + 42, l10n_text("Save and Quit"), "quit", noone);
			if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42 + 42 + 42 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu == "quit")
			&& (!can_input_level_name)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (keyboard_check_pressed(vk_enter))
			&& (menu == "quit")
			&& (!can_input_level_name)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				quit_level_editor = 1;
				can_input_level_name = false;
				pause = false;
			}
			if (menu == "quit")
			&& (!can_input_level_name)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "level_editor_upload";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "continue";
				}
				if (key_b_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = false;
					can_navigate = false;
				}
			}
			#endregion /* If menu is on quit END */
			
		}
		else
		if (menu == "generate_level_map_yes")
		|| (menu == "generate_level_map_no")
		{
			var generate_level_map_y_1 = get_window_height * 0.5 - 256;
			var generate_level_map_y_2 = get_window_height * 0.5 - 256 + 32;
			var generate_level_map_y_3 = get_window_height * 0.5 - 256 + 64;
			var generate_level_map_y_4 = get_window_height * 0.5 - 256 + 96;
			var generate_level_map_y_5 = get_window_height * 0.5 - 256 + 160;
			var generate_level_map_y_6 = get_window_height * 0.5 - 256 + 192;
			var generate_level_map_y_7 = get_window_height * 0.5 - 256 + 224;
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			#region /* Draw the path for saving full level map */
			if (global.enable_option_for_pc)
			{
				scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_1, l10n_text("A map of the whole level will be generated and saved in"), global.default_text_size, c_black, c_white, 1);
				var full_level_map_size = (get_window_width <= 1350) ? 0.75 : 1;
				var file_path_text = string_replace_all(string_replace_all(game_save_id, environment_get_variable("USERNAME"), "*") + "\custom_levels\\full_level_map_" + string(global.level_name) + ".png", "\\", "/");
				scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_2, string(file_path_text), global.default_text_size * full_level_map_size, c_black, c_white, 1);
			}
			else
			{
				scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_1, l10n_text("A map of the whole level will be generated and saved"), global.default_text_size, c_black, c_white, 1);
			}
			#endregion /* Draw the path for saving full level map END */
			
			scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_3, l10n_text("With this map, you can then use it in a drawing program,"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_4, l10n_text("as the base to make the background and foreground layers."), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_5, l10n_text("Do you want to generate a level map?"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_6, l10n_text("The level will start for a split second, so a level map can be properly generated"), global.default_text_size, c_black, c_white, 1);
			
			#region /* Warn the player if the level is bigger than 8192 in any direction */
			var level_width = obj_level_width.x; /* Get level dimensions */
			var level_height = obj_level_height.y;
			
			if (level_width > 8192 || level_height > 8192) /* Check if level dimensions exceed 8192 pixels in any direction */
			{
				var warning_text = "";
				
				if (level_width > 8192 && level_height > 8192) /* Create warning text based on exceeded dimensions */
					warning_text = "width and height";
				else if (level_width > 8192)
					warning_text = "width";
				else if (level_height > 8192)
					warning_text = "height";
				
				/* Display the warning message */
				scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_7, l10n_text("Warning! Level " + string(warning_text) + " is more than 8192 pixels, it might not screenshot the entire level"), global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, generate_level_map_y_7, l10n_text("Warning! Level " + string(warning_text) + " is more than 8192 pixels, it might not screenshot the entire level"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 2));
			}
			#endregion /* Warn the player if the level is bigger than 8192 in any direction END */
			
			#region /* If menu is on generate level map yes */
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Yes"), "generate_level_map_yes", "generate_level_map_yes");
			
			if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				quit_level_editor = 0;
				can_input_level_name = false;
				pause = false;
				global.full_level_map_screenshot = true;
			}
			if (menu == "generate_level_map_yes")
			&& (!can_input_level_name)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "generate_level_map_no";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "generate_level_map_no";
				}
				if (key_a_pressed)
				|| (keyboard_check_pressed(vk_enter))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = 0;
						can_input_level_name = false;
						pause = false;
						global.full_level_map_screenshot = true;
					}
				}
				if (key_b_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = true;
					menu = "generate_level_map";
				}
			}
			#endregion /* If menu is on generate level map yes END */
			
			#region /* If menu is on generate level map no */
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("No"), "generate_level_map_no", "generate_level_map");
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				quit_level_editor = 0;
				can_input_level_name = false;
				pause = true;
				menu = "generate_level_map";
			}
			if (menu == "generate_level_map_no")
			&& (!can_input_level_name)
			{
				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "generate_level_map_yes";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "generate_level_map_yes";
				}
				if (key_a_pressed)
				|| (keyboard_check_pressed(vk_enter))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = 0;
						can_input_level_name = false;
						pause = true;
						menu = "generate_level_map";
					}
				}
				if (key_b_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = 0;
					can_input_level_name = false;
					pause = true;
					menu = "generate_level_map";
				}
			}
			#endregion /* If menu is on generate level map no END */
			
		}
		#endregion /* Make the menu invisible when entering the options menu END */
		
		scr_draw_upload_level_menu();
		
		#region /* PLAYER 1 INPUT LEVEL NAME NOW */
		if (menu == "input_level_name")
		&& (can_input_level_name)
		{
			
			#region /* Press enter when done typing */
			if (keyboard_check_pressed(vk_enter))
			|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					can_input_level_name = false;
					quit_level_editor = 0;
					pause = true;
					menu = "enter_level_name";
				}
			}
			#endregion /* Press enter when done typing END */
			
			#region /* Make Background Darker */
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			#endregion /* Make Background Darker END */
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			
			#region /* Inputed Name Text */
			if (name_enter_blink < 1)
			{
				scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 -400 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5, l10n_text("Type a name on the keyboard for level name") + "\n" + l10n_text("Level Name") + ": " + string(level_name) + "|", global.default_text_size, c_black, c_white, 1);
			}
			else
			{
				scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 -400 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5, l10n_text("Type a name on the keyboard for level name") + "\n" + l10n_text("Level Name") + ": " + string(level_name), global.default_text_size, c_black, c_white, 1);
			}
			#endregion /* Inputed Name Text END */
			
			#region /* Limit Name Input Length for Level Name */
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5 + 100, "Limit: " + string_length(level_name) + "/32", global.default_text_size, c_black, c_white, 1);
			level_name = keyboard_string;
			if (string_length(level_name) > 32)
			{
				keyboard_string = string_copy(level_name, 1, 32);
			}
			#endregion /* Limit Name Input Length for Level Name END */
			
			name_enter_blink += 0.05;
			if (name_enter_blink > 1.5)
			{
				name_enter_blink = 0;
			}
		}
		#endregion /* PLAYER 1 INPUT LEVEL NAME NOW END */
		
		scr_option_menu(); /* Options */
		scr_option_level_editor(); /* Level Editor Options */
	}
	#endregion /* Draw Level Editor Pause Menu END */
	
}