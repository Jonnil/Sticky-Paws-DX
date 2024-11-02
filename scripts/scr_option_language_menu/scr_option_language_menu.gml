function scr_option_language_menu()
{
	
	#region /* Language Options */
	if (global.settings_sidebar_menu == "language_settings")
	{
		var get_window_height = display_get_gui_height();
		var get_window_width = display_get_gui_width();
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		var match_system_language_x = 400;
		var match_system_language_y = 32;
		draw_menu_button(match_system_language_x, match_system_language_y, "Match System Language", "match_system_language", "match_system_language");
		
		for(var i = 1; i < array_length(valid_languages); i ++;)
		{
			draw_language_checkmark(400, 52 * (i - 1) + 84, global.language_local_data[# valid_languages[i], 0], "Language" + string(i));
		}
		
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(get_window_width - 32, 64, l10n_text("Translator") + ":", global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(get_window_width - 32, 114, l10n_text("Translator name"), global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
		if (global.language_completion[global.language_localization + 1] < 100)
		{
			var translation_completion_outline_color = c_menu_outline;
			var translation_completion_fill_color = make_color_hsv(global.language_completion[global.language_localization + 1] * 0.5, 255, 255);
		}
		else
		{
			var translation_completion_outline_color = c_menu_outline;
			var translation_completion_fill_color = c_gray;
		}
		
		#region /* Clicking on language completion text enables and disables the translation debug mode */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 32 - string_width(l10n_text("Translation completion") + ": " + string(global.language_completion[global.language_localization + 1]) + "%"), 164 - 32, get_window_width - 32, 164 + 32))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.enable_option_for_pc)
		{
			if (global.language_completion[global.language_localization + 1] < 100)
			{
				var translation_completion_outline_color = c_menu_fill;
				var translation_completion_fill_color = make_color_hsv(global.language_completion[global.language_localization + 1] * 0.5, 255, 255);
			}
			else
			{
				var translation_completion_outline_color = c_menu_fill;
				var translation_completion_fill_color = c_gray;
			}
			if (mouse_check_button_released(mb_left))
			{
			    global.translation_debug = !global.translation_debug;
			}
		}
		
		if (os_type != os_switch) /* Switch version can only contain languages that have been 100% translated according to guidelines */
		{
			scr_draw_text_outlined(get_window_width - 32, 164, l10n_text("Translation completion") + ": " + string(global.language_completion[global.language_localization + 1]) + "%", global.default_text_size, translation_completion_outline_color, translation_completion_fill_color, 1);
		}
		
		if (global.translation_debug)
		{
			scr_draw_text_outlined(get_window_width - 32, 164 + 32, "Translation debug: enabled", global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(get_window_width - 32, 164 + 32 + 64, "When missing keywords are found, look in\n" + string_replace(game_save_id, environment_get_variable("USERNAME"), "*") + "translation_missing_keywords.ini", global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Clicking on language completion text enables and disables the translation debug mode END */
		
		scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("Language translations may not be 100% accurate"), global.default_text_size * 0.75, c_menu_outline, c_gray, 1);
		
		#region /* Language Menu Navigation */
		if (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		&& (global.settings_sidebar_menu = "language_settings")
		{
			if (key_up)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				if (language_index <= 1)
				{
					menu = "match_system_language";
				}
				else
				{
					language_index = max(language_index - 1, 1)
					menu = "Language" + string(language_index);
					menu_cursor_y_position = language_index * 50;
				}
			}
			else
			if (key_down)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				if (menu == "match_system_language")
				{
					menu = "Language1";
				}
				else
				{
					language_index = min(language_index + 1, array_length(valid_languages) - 1)
					menu = "Language" + string(language_index);
					menu_cursor_y_position = language_index * 50;
				}
			}
			else
			if (key_a_pressed)
			&& (!open_dropdown)
			&& (menu != "match_system_language")
			{
				menu_delay = 3;
				global.language_localization = language_index - 1;
					
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "language_localization", global.language_localization);
				ini_close();
				scr_set_font();
			}
			else
			if (key_a_pressed
			|| mouse_check_button_released(mb_left)
			&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), match_system_language_x, match_system_language_y, match_system_language_x + 370, match_system_language_y + 42))
			&& (!open_dropdown)
			&& (menu == "match_system_language")
			{
				menu_delay = 3;
				scr_set_default_language();
					
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "language_localization", global.language_localization);
				ini_close();
					
				scr_set_font();
			}
		}
		#endregion /* Language Menu Navigation */
		
	}
	#endregion /* Language Options END */
	
}