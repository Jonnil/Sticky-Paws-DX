/// @function scr_option_language_menu()
/// @description Let me explain how the language selection system works in a more casual way, like we're just chatting about it.
///	The game keeps track of the language the player has chosen using something called 'global.selected_language_id'.
///	This is basically a number or ID that represents a specific language.
///	Kind of like a label that never changes, no matter where it appears in the game.
///	The game pulls this ID from a list called 'global.valid_languages', which isn't sorted in any special way.
///	It just holds all the available language IDs.
///	The point of this ID is to make sure the game knows which translations to use when it displays text.
///	
///	Then there's 'global.current_language_menu_position', which is a bit different.
///	This variable isn't about IDs.
///	It's about the position of the selected language in the menu itself.
///	The menu shows the languages in alphabetical order, so the positions of the languages in this sorted list might not match their original IDs.
///	This position is used to figure out which language should be highlighted and selected when the menu pops up.
///	
///	When the player opens the language menu, the game looks at the 'global.selected_language_id' and finds its place in the sorted list.
///	It uses this to set 'global.current_language_menu_position' so the right language gets highlighted.
///	If the player picks a new language, the game updates both variables: 'global.current_language_menu_position' changes to the new menu position,
///	and 'global.selected_language_id' gets updated to the new language's ID from the unsorted list.
///	
///	Here's an example to make it clearer.
///	When the game starts, it loads 'global.selected_language_id' from the settings file so it knows which language the player used last time.
///	Then the language menu opens, showing the sorted list of available languages.
///	The game goes through that list, finds the language that matches the saved ID, and highlights it in the menu.
///	
///	If the player decides to switch to a different language, the position in the menu ('global.current_language_menu_position') updates to the new selection,
///	and 'global.selected_language_id' updates to the corresponding language ID from the unsorted list.
///	When the player confirms the choice, the game saves this new ID to the settings file, so the next time they play, the game will remember their new language.
///	
///	So, to sum up: 'global.selected_language_id' is the ID that tells the game which translations to use,
///	and 'global.current_language_menu_position' is the index of the language in the sorted menu list that makes sure the right language gets highlighted when the menu appears.
///	They work together to make the language selection feel seamless and intuitive.
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
		draw_menu_button(match_system_language_x, match_system_language_y, l10n_text("Match the System Language"), "match_system_language", "match_system_language");
		
		#region /* Order all of the language options in alphabetical order */
		/* Get the sorted list of languages */
		var temp_languages = scr_get_sorted_language_list();
		
		/* Draw the sorted languages */
		for (var i = 0; i < array_length(temp_languages); i ++)
		{
			var language_info = temp_languages[i];
			var unsorted_language_index = language_info.index;
			var language_name = language_info.name;
			
			if (global.language_completion[unsorted_language_index] < 100)
			{
				draw_set_halign(fa_right);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(
					448 * 2,
					52 * i + 84 + 16,
					string(global.language_completion[unsorted_language_index]) + "%",
					global.default_text_size * 0.75,
					c_menu_outline,
					make_color_hsv(global.language_completion[unsorted_language_index] * 0.5, 255, 255),
					1
				);
			}
			
			draw_language_checkmark(400, 52 * i + 84, language_name, "Language" + string(i + 1), unsorted_language_index);
		}
		#endregion /* Order all of the language options in alphabetical order END */
		
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(get_window_width - 32, 64, l10n_text("Translator") + ":", global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(get_window_width - 32, 114, l10n_text("Translator name"), global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
		if (global.language_completion[global.selected_language_id] < 100)
		{
			var translation_completion_outline_color = c_menu_outline;
			var translation_completion_fill_color = make_color_hsv(global.language_completion[global.selected_language_id] * 0.5, 255, 255);
		}
		else
		{
			var translation_completion_outline_color = c_menu_outline;
			var translation_completion_fill_color = c_gray;
		}
		
		#region /* Clicking on language completion text enables and disables the translation debug mode */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 32 - string_width(l10n_text("Translation completion") + ": " + string(global.language_completion[global.selected_language_id]) + "%"), 164 - 32, get_window_width - 32, 164 + 32))
		&& (global.controls_used_for_navigation == "mouse")
		&& (global.enable_option_for_pc)
		{
			if (global.language_completion[global.selected_language_id] < 100)
			{
				var translation_completion_outline_color = c_menu_fill;
				var translation_completion_fill_color = make_color_hsv(global.language_completion[global.selected_language_id] * 0.5, 255, 255);
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
			scr_draw_text_outlined(get_window_width - 32, 164, l10n_text("Translation completion") + ": " + string(global.language_completion[global.selected_language_id]) + "%", global.default_text_size, translation_completion_outline_color, translation_completion_fill_color, 1);
		}
		
		if (global.translation_debug)
		{
			scr_draw_text_outlined(get_window_width - 32, 164 + 32, "Translation debug: enabled", global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(get_window_width - 32, 164 + 32 + 64, "When missing keywords are found, look in\n" + string_replace(game_save_id, environment_get_variable("USERNAME"), "*") + "translation_missing_keywords.txt", global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(get_window_width - 32, 164 + 32 + (64 * 2), "selected_language_id: " + string(global.selected_language_id) + " current_language_menu_position: " + string(global.current_language_menu_position), global.default_text_size * 0.8, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Clicking on language completion text enables and disables the translation debug mode END */
		
		scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("Language translations may not be 100% accurate"), global.default_text_size * 0.75, c_menu_outline, c_gray, 1);
		
		#region /* Language Pack Update Options */
		/* Determine vertical position based on the end of the language list */
		var language_list_end_y = 84 + (array_length(temp_languages) * 52);
		
		/* --- Manual update button --- */
		var check_updates_button_y = language_list_end_y + 20;
		draw_menu_button(match_system_language_x, check_updates_button_y, l10n_text("Check for language pack updates"), "check_updates", "check_updates");
		
		/* --- Automatic update dropdown using your existing function --- */
		var auto_update_dropdown_y = check_updates_button_y + 50;
		global.language_auto_update_interval = draw_menu_dropdown(
			match_system_language_x,
			auto_update_dropdown_y,
			l10n_text("Check for language pack updates automatically"),
			"language_auto_update",
			global.language_auto_update_interval,
			l10n_text("Never"),
			l10n_text("On Startup"),
			l10n_text("Each Week"),
			l10n_text("Each Month"),
			l10n_text("Each Year")
		);
		#endregion /* Language Pack Update Options END */
		
		#region /* Language Menu Navigation */
		if (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate)
		&& (global.settings_sidebar_menu = "language_settings")
		{
			if (key_up && (!open_dropdown))
			{
				menu_delay = 3;
				if (global.current_language_menu_position <= 1)
				{
					menu = "match_system_language";
				}
				else
				{
					global.current_language_menu_position = max(global.current_language_menu_position - 1, 1)
					menu = "Language" + string(global.current_language_menu_position);
					menu_cursor_y_position = global.current_language_menu_position * 50;
				}
			}
			else if (key_down && (!open_dropdown))
			{
				menu_delay = 3;
				if (menu == "match_system_language")
				{
					menu = "Language1";
					global.current_language_menu_position = 1;
				}
				else
				{
					global.current_language_menu_position = min(global.current_language_menu_position + 1, array_length(global.valid_languages) - 1)
					menu = "Language" + string(global.current_language_menu_position);
					menu_cursor_y_position = global.current_language_menu_position * 50;
				}
			}
			else if (key_a_pressed
			|| mouse_check_button_released(mb_left)
			&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), match_system_language_x, match_system_language_y, match_system_language_x + 370, match_system_language_y + 42))
			&& (!open_dropdown)
			&& (menu == "match_system_language")
			{
				menu_delay = 3;
				scr_set_default_language();
				
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("config", "selected_language_id", global.selected_language_id);
				ini_write_real("config", "current_language_menu_position", global.current_language_menu_position);
				ini_close();
				
				scr_set_font();
			}
		}
		#endregion /* Language Menu Navigation */
		
	}
	#endregion /* Language Options END */
	
}
