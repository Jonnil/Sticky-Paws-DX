function scr_draw_level_length_recommendation()
{

	#region /* Show level length recommendation */
	if (menu == "level_length_recommendation_ok")
	|| (menu == "level_length_recommendation_back")
	{
		if (global.timeattack_realmillisecond == 0)
		{
			ini_open(game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini");
			global.timeattack_minute = ini_read_real("rank", "rank_timeattack_minute", 0);
			global.timeattack_second = ini_read_real("rank", "rank_timeattack_second", 0);
			global.timeattack_realmillisecond = ini_read_real("rank", "rank_timeattack_realmillisecond", 0);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}

		draw_set_alpha(0.75);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);

		var show_back_button = true;
		var box_height = display_get_gui_height() * 0.5 + 64 + 64;

		if (room == rm_title)
		|| (variable_instance_exists(self, "pause")
		&& pause)
		{
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = false;
			}
			
			box_height = display_get_gui_height() * 0.5 + 64 + 64 + 42;
			show_back_button = true;
		}
		else
		{
			show_back_button = false;
		}

		/* Determine message color based on timeattack minutes relative to minimum and maximum target */
		var message_color = c_lime;
		
		if (global.timeattack_minute < global.target_length_minutes_min)
		{
			message_color = c_orange;
		}
		else
		if (global.timeattack_minute > global.target_length_minutes_max)
		{
			message_color = c_red;
		}
		
		draw_roundrect_color_ext(display_get_gui_width() * 0.5 - 440 - 4, display_get_gui_height() * 0.5 - 64 - 4, display_get_gui_width() * 0.5 + 440 + 4, box_height + 4, 50, 50, message_color, message_color, false);
		draw_roundrect_color_ext(display_get_gui_width() * 0.5 - 440, display_get_gui_height() * 0.5 - 64, display_get_gui_width() * 0.5 + 440, box_height, 50, 50, c_black, c_black, false);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

		/* Display messages based on level length */
		if (global.timeattack_minute < global.target_length_minutes_min)
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("Level is shorter than your desired minimum length"), global.default_text_size, c_black, message_color, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Your time") + ": " + string(global.timeattack_minute) + ":" + string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, message_color, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 32, l10n_text("Minimum required") + ": " + string(global.target_length_minutes_min) + " " + l10n_text("minutes"), global.default_text_size, c_black, message_color, 1);
		}
		else
		if (global.timeattack_minute > global.target_length_minutes_max)
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("Level is longer than your desired maximum length"), global.default_text_size, c_black, message_color, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Your time") + ": " + string(global.timeattack_minute) + ":" + string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, message_color, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 32, l10n_text("Maximum allowed") + ": " + string(global.target_length_minutes_max) + " " + l10n_text("minutes"), global.default_text_size, c_black, message_color, 1);
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("Your level is within the desired range!"), global.default_text_size, c_black, message_color, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Your time") + ": " + string(global.timeattack_minute) + ":" + string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, message_color, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 32, l10n_text("Target range") + ": " + string(global.target_length_minutes_min) + " - " + string(global.target_length_minutes_max) + " " + l10n_text("minutes"), global.default_text_size, c_black, message_color, 1);
		}

		var button_x = display_get_gui_width() * 0.5 - 185;
		var ok_y = display_get_gui_height() * 0.5 + 64;
		var back_y = display_get_gui_height() * 0.5 + 64 + 42;

		if (show_back_button)
		{
			draw_menu_button(button_x, ok_y, l10n_text("Upload Anyway"), "level_length_recommendation_ok", "level_length_recommendation_ok", c_red);
			draw_menu_button(button_x, back_y, l10n_text("Back"), "level_length_recommendation_back");
		}
		else
		{
			draw_menu_button(button_x, ok_y, l10n_text("OK"), "level_length_recommendation_ok");
		}

		if (menu == "level_length_recommendation_ok")
		&& (key_a_pressed
		|| mouse_check_button_released(mb_left)
		&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), button_x, ok_y, button_x + 370, ok_y + 41))
		&& (menu_delay == 0)
		{
			target_length_confirmed = true;

			menu_delay = 10;
			global.timeattack_millisecond = 0;
			global.timeattack_minute = 0;
			global.timeattack_second = 0;

			if (room == rm_title)
			{
				if (variable_instance_exists(self, "open_sub_menu"))
				{
					open_sub_menu = false; /* Close the sub menu when uploading level, so it doesn't interfere */
				}

				open_upload_menu = true;
				menu = "upload_edit_name";
			}
			else
			if (variable_instance_exists(self, "pause")
			&& pause)
			{
				pressing_play_timer = 0;

				if (if_clear_checked)
				{
					menu = "";
					quit_level_editor++;
					global.go_to_menu_when_going_back_to_title = "upload_edit_name";
				}
				else
				{
					menu = "level_editor_upload_pressed";
				}
			}

			if (variable_instance_exists(self, "pause")
			&& !pause)
			{
				pressing_play_timer = 0;
				menu = "";
			}
		}

		if (menu == "level_length_recommendation_back")
		&& (key_a_pressed
		|| mouse_check_button_released(mb_left)
		&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), button_x, back_y, button_x + 370, back_y + 41))
		&& (menu_delay == 0)
		{
			target_length_confirmed = true;

			menu_delay = 10;
			global.timeattack_millisecond = 0;
			global.timeattack_minute = 0;
			global.timeattack_second = 0;

			if (room == rm_title)
			{
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "level_editor_make";
			}
			else
			{
				if (variable_instance_exists(self, "pause")
				&& pause)
				{
					menu = "level_editor_upload";
				}
				else
				{
					menu = "";
				}
			}
		}

		if (key_up)
		&& (menu_delay == 0)
		{
			menu = "level_length_recommendation_ok";
		}
		else
		if (show_back_button)
		&& (key_down)
		&& (menu_delay == 0)
		{
			menu = "level_length_recommendation_back";
		}
	}
	#endregion /* Show level length recommendation END */

}
