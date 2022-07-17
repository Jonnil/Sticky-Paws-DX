function scr_language_menu()
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
		if (file_exists("localization.csv"))
	{
		var i;
		for(i = 1;
		i < ds_grid_width(global.language_local_data);
		i ++;)
		{
			draw_language_checkmark(400, 52 * (i - 1) + 42 + menu_y_offset, global.language_local_data[# i, 0], "Language" + string(i));
		}
	}
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width() - 32, 64, Text("Translator") + ":", global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
	draw_text_outlined(window_get_width() - 32, 112, Text("Translator name"), global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
	draw_text_outlined(window_get_width() - 32, 192, "(" + Text("Language translations may not be 100% accurate") + ")", global.default_text_size, c_menu_outline, c_menu_fill, 1);
	draw_text_outlined(window_get_width() - 32, 272, "(" + Text("Translation completion") + ": " + string(global.language_completion) + "%" + ")", global.default_text_size, c_menu_outline, c_menu_fill, 1);
	
	#region /*Language Menu Navigation*/
	if (menu_joystick_delay <= 0)
	and (can_navigate = true)
	and global.settings_sidebar_menu = "language_settings"
	{
		if (global.controls_used_for_menu_navigation != "mouse")
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				language_index = max(language_index - 1, 1)
				menu = "Language" + string(language_index);
				menu_cursor_y_position = language_index * 50;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (file_exists("localization.csv"))
				{
					language_index = min(language_index + 1, ds_grid_width(global.language_local_data) - 1)
				}
				menu = "Language" + string(language_index);
				menu_cursor_y_position = language_index * 50;
				menu_delay = 3;
			}
			else
			if (key_a_pressed)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				global.language_localization = language_index - 1;
				calculate_language_completion()
				menu_delay = 3;
			}
		}
		else
		{
			if (key_up)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				language_mouse_scroll = max(language_mouse_scroll - 10, 1)
				menu_cursor_y_position = language_mouse_scroll * 50;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay = 0)
			and (open_dropdown = false)
			{
				if (file_exists("localization.csv"))
				{
					language_mouse_scroll = min(language_mouse_scroll + 10, ds_grid_width(global.language_local_data) - 1)
				}
				menu_cursor_y_position = language_mouse_scroll * 50;
				menu_delay = 3;
			}
		}
	}
	#endregion /*Language Menu Navigation*/
	
}