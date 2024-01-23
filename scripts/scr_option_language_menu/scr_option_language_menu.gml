function scr_option_language_menu()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	for(var i = 1; i < ds_grid_width(global.language_local_data); i ++;)
	{
		draw_language_checkmark(400, 52 * (i - 1) + 42, global.language_local_data[# i, 0], "Language" + string(i));
	}
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width - 32, 64, l10n_text("Translator") + ":", global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
	scr_draw_text_outlined(get_window_width - 32, 114, l10n_text("Translator name"), global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
	if (global.language_completion < 100)
	{
		var translation_completion_outline_color = c_menu_outline;
		var translation_completion_fill_color = make_color_hsv(global.language_completion * 0.5, 255, 255);
	}
	else
	{
		var translation_completion_outline_color = c_menu_outline;
		var translation_completion_fill_color = c_gray;
	}
	
	#region /* Clicking on language completion text enables and disables the translation debug mode */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 32 - string_width(l10n_text("Translation completion") + ": " + string(global.language_completion) + "%"), 164 - 32, get_window_width - 32, 164 + 32))
	&& (global.controls_used_for_navigation == "mouse")
	&& (global.enable_option_for_pc)
	{
		if (global.language_completion < 100)
		{
			var translation_completion_outline_color = c_menu_fill;
			var translation_completion_fill_color = make_color_hsv(global.language_completion * 0.5, 255, 255);
		}
		else
		{
			var translation_completion_outline_color = c_menu_fill;
			var translation_completion_fill_color = c_gray;
		}
		if (mouse_check_button_released(mb_left))
		{
		    global.translation_debug = not global.translation_debug;
		}
	}
	
	scr_draw_text_outlined(get_window_width - 32, 164, l10n_text("Translation completion") + ": " + string(global.language_completion) + "%", global.default_text_size, translation_completion_outline_color, translation_completion_fill_color, 1);
	
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
		if (global.controls_used_for_navigation != "mouse")
		{
			if (key_up)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				language_index = max(language_index - 1, 1)
				menu = "Language" + string(language_index);
				menu_cursor_y_position = language_index * 50;
			}
			else
			if (key_down)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				language_index = min(language_index + 1, ds_grid_width(global.language_local_data) - 1)
				menu = "Language" + string(language_index);
				menu_cursor_y_position = language_index * 50;
			}
			else
			if (key_a_pressed)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				global.language_localization = language_index - 1;
				calculate_translation_completion();
				if (global.language_localization == 2) /* If you have selected Japanese language, you can't use Open Dyslexic, as it isn't supported */
				&& (global.selected_font == 2) /* Open Dyslexic font didn't work with Japanese language */
				{
					global.selected_font = 1; /* The next best font if you can't use open dyslexic is "Normal font", as it could be more readable than the "Game font" */
					scr_set_font();
				}
				if (global.language_localization == 2) /* If you have selected Japanese language, and Game font isn't finished */
				&& (global.selected_font == 0) /* Game font isn't finsihed with Japanese language */
				{
					global.selected_font = 1; /* The next best font if you can't use open dyslexic is "Normal font", as it could be more readable than the "Game font" */
					scr_set_font();
				}
			}
		}
		else
		{
			if (key_up)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				language_mouse_scroll = max(language_mouse_scroll - 10, 1)
				menu_cursor_y_position = language_mouse_scroll * 50;
			}
			else
			if (key_down)
			&& (!open_dropdown)
			{
				menu_delay = 3;
				language_mouse_scroll = min(language_mouse_scroll + 10, ds_grid_width(global.language_local_data) - 1)
				menu_cursor_y_position = language_mouse_scroll * 50;
			}
		}
	}
	#endregion /* Language Menu Navigation */
	
}