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
		
		// Ensure the global.valid_languages array exists and is properly defined.
		if (variable_global_exists("valid_languages") && is_array(global.valid_languages))
		{
			var validCount = array_length(global.valid_languages);
			for (var i = 0; i < validCount; i++)
			{
				if (is_undefined(global.valid_languages[i]))
				{
					global.valid_languages[i] = 0;
				}
			}
		}
		else
		{
			// If valid_languages doesn't exist, initialize it as an empty array.
			global.valid_languages = [];
		}
		
		// Ensure the global.language_completion array exists.
		if (variable_global_exists("language_completion")
		&& is_undefined(global.language_completion))
		{
			global.language_completion = [];
			// Initialize each language's completion to 0.
			for (var j = 0; j < array_length(global.valid_languages); j++)
			{
				global.language_completion[j] = 0;
			}
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		var match_system_language_x = 400;
		var match_system_language_y = 32;
		draw_menu_button(match_system_language_x, match_system_language_y, l10n_text("Match the System Language"), "match_system_language", "match_system_language");
		
		#region /* Order all of the language options in alphabetical order */
		/* Get the sorted list of languages */
		var temp_languages = scr_get_sorted_language_list();
		
		/* Draw the sorted languages */
		for (var i = 0; i < array_length(temp_languages); i++)
		{
			var language_info = temp_languages[i];
			var unsorted_language_index = language_info.index;
			var language_name = language_info.name;
			
			draw_language_checkmark(400, 52 * i + 84, language_name, "Language" + string(i + 1), unsorted_language_index);
			
			#region /* Ensure language_completion is defined for this index; if not, default to 0. Draw above checkmarks */
			if (variable_global_exists("language_completion"))
			{
				if (is_undefined(global.language_completion[unsorted_language_index]))
				{
					global.language_completion[unsorted_language_index] = 0;
				}
				
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
						make_color_hsv(global.language_completion[unsorted_language_index] * 0.75, 255, 255),
						1
					);
				}
			}
			#endregion /* Ensure language_completion is defined for this index; if not, default to 0. Draw above checkmarks END */
			
		}
		#endregion /* Order all of the language options in alphabetical order END */
		
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(get_window_width - 32, 64, l10n_text("Translator") + ":", global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(get_window_width - 32, 114, l10n_text("Translator name"), global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
		
		/* Ensure language_completion is defined for the selected language */
		if (variable_global_exists("language_completion"))
		{
			if (is_undefined(global.language_completion[global.selected_language_id]))
			{
				global.language_completion[global.selected_language_id] = 0;
			}
			
			if (global.language_completion[global.selected_language_id] < 100)
			{
				var translation_completion_outline_color = c_menu_outline;
				var translation_completion_fill_color = make_color_hsv(global.language_completion[global.selected_language_id] * 0.75, 255, 255);
			}
			else
			{
				var translation_completion_outline_color = c_menu_outline;
				var translation_completion_fill_color = c_gray;
			}
			
			#region /* Clicking on language completion text enables and disables the translation debug mode */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 32 - string_width(l10n_text("Translation completion") + ": " + string(global.language_completion[global.selected_language_id]) + "%") * 0.5, 164 - 32, get_window_width - 32, 164 + 32))
			&& (global.controls_used_for_navigation == "mouse")
			&& (global.enable_option_for_pc)
			{
				if (global.language_completion[global.selected_language_id] < 100)
				{
					var translation_completion_outline_color = c_menu_fill;
					var translation_completion_fill_color = make_color_hsv(global.language_completion[global.selected_language_id] * 0.75, 255, 255);
				}
				else
				{
					var translation_completion_outline_color = c_menu_fill;
					var translation_completion_fill_color = c_gray;
				}
				
				if (mouse_check_button_released(mb_left)
				&& global.language_completion[global.selected_language_id] < 100)
				{
					global.translation_debug = !global.translation_debug;
				}
			}
			#endregion /* Clicking on language completion text enables and disables the translation debug mode END */
		}
		
		if (variable_global_exists("language_completion")
		&& os_type != os_switch) /* Switch version can only contain languages that have been 100% translated according to guidelines */
		{
			if (global.language_completion[global.selected_language_id] < 100)
			{
				scr_draw_text_outlined(get_window_width - 32, 164, l10n_text("Translation completion") + ": " + string(global.language_completion[global.selected_language_id]) + "%", global.default_text_size * 0.6, translation_completion_outline_color, translation_completion_fill_color, 1);
				scr_draw_text_outlined(get_window_width - 32, 164 + 32, l10n_text("Some strings may appear in English"), global.default_text_size * 0.5, c_menu_outline, translation_completion_fill_color, 1);
			}
		}
		
		if (global.translation_debug)
		{
			draw_set_valign(fa_top);
			scr_draw_text_outlined(get_window_width - 32, 164 + 64,
				"Translation debug: enabled" + "\n" +
				"When missing keywords are found, look in\n" + string_replace(game_save_id, environment_get_variable("USERNAME"), "*") + "translation_missing_keywords.txt" + "\n" +
				"selected_language_id: " + string(global.selected_language_id) + " current_language_menu_position: " + string(global.current_language_menu_position) + "\n" +
				"language_local_data: " + string(global.language_local_data),
				global.default_text_size * 0.5,
				c_menu_outline,
				c_menu_fill,
				1);
			draw_set_valign(fa_middle);
		}
		
		scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("Language translations may not be 100% accurate"), global.default_text_size * 0.75, c_menu_outline, c_gray, 1);
		
		#region /* Language Pack Update Options */
		/* Determine vertical position based on the end of the language list */
		var language_list_end_y = 84 + (array_length(temp_languages) * 52);
		draw_set_halign(fa_left);
		scr_draw_text_outlined(match_system_language_x, language_list_end_y + 20, l10n_text("Language Pack Updates"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		
		/* --- Manual update button --- */
		var check_updates_button_y = language_list_end_y + 40;
		draw_menu_button(match_system_language_x, check_updates_button_y, l10n_text("Check for language pack updates"), "language_check_updates", "language_check_updates");
		
		/* --- Automatic update dropdown using your existing function --- */
		var auto_update_dropdown_y = check_updates_button_y + 100;
		draw_menu_dropdown(
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
		scr_set_default_dropdown_description("language_auto_update", l10n_text("On Startup"));
		#endregion /* Language Pack Update Options END */
		
		#region /* Display language pack update status at the bottom-center of the screen */
		if (global.language_update_status_message != "")
		{
			scr_draw_text_outlined(
				get_window_width * 0.5,
				get_window_height - 64,
				global.language_update_status_message,
				global.default_text_size * 0.75,
				c_menu_outline,
				global.language_update_status_color,
				1
			);
		}
		#endregion /* Display language pack update status at the bottom-center of the screen END */
		
		#region /* Display last updated language pack timestamp, if any */
		if (global.language_last_update_string != "")
		{
			/* Get the relative time string from the UTC ISO-8601 timestamp */
			var relative_time = get_relative_timezone(global.language_last_update_string, timezone_local);
			
			/* Create two lines: one for the raw timestamp, one for the relative time */
			var raw_text = l10n_text("Last Updated") + ": " + global.language_last_update_string;
			var rel_text = "(" + relative_time + ")";
			
			/* Draw the raw timestamp on the first line */
			draw_set_halign(fa_left);
			scr_draw_text_outlined(
				match_system_language_x + 400,
				check_updates_button_y + 10,
				raw_text,
				global.default_text_size * 0.75,
				c_menu_outline,
				global.language_update_status_color,
				1
			);
			
			/* Draw the relative time on a second line just below */
			scr_draw_text_outlined(
				match_system_language_x + 400,
				check_updates_button_y + 10 + 20,  /* adjust vertical offset as needed */
				rel_text,
				global.default_text_size * 0.75,
				c_menu_outline,
				global.language_update_status_color,
				1
			);
			
			/* Reset horizontal alignment if needed */
			draw_set_halign(fa_center);
		}
		#endregion /* Display last updated language pack timestamp, if any END */
		
		#region /* Language Menu Navigation */
		if (menu_delay == 0 && menu_joystick_delay == 0
		&& (can_navigate)
		&& (global.settings_sidebar_menu = "language_settings"))
		{
			if (open_dropdown && (menu == "language_auto_update"))
			{
				if (key_up && !key_down && (global.language_auto_update_interval > 0))
				{
					menu_delay = 3;
					global.language_auto_update_interval --;
				}
				else if (key_down && !key_up && (global.language_auto_update_interval < 4))
				{
					menu_delay = 3;
					global.language_auto_update_interval ++;
				}
			}
			
			if (key_up && !key_down && (!open_dropdown))
			{
				menu_delay = 3;
				if (menu == "match_system_language")
				{
					menu = "language_auto_update";
				}
				else if (menu == "language_check_updates")
				{
					global.current_language_menu_position = max(global.current_language_menu_position - 1, 1);
					menu = "Language" + string(array_length(global.valid_languages) - 1);
					global.current_language_menu_position = array_length(global.valid_languages) - 1;
					menu_cursor_y_position = global.current_language_menu_position * 50;
				}
				else if (menu == "language_auto_update")
				{
					menu = "language_check_updates";
				}
				else if (global.current_language_menu_position <= 1)
				{
					menu = "match_system_language";
				}
				else if (global.current_language_menu_position < array_length(global.valid_languages))
				{
					global.current_language_menu_position = max(global.current_language_menu_position - 1, 1);
					menu = "Language" + string(global.current_language_menu_position);
					menu_cursor_y_position = global.current_language_menu_position * 50;
				}
			}
			else if (key_down && !key_up && (!open_dropdown))
			{
				menu_delay = 3;
				if (menu == "match_system_language")
				{
					menu = "Language1";
					global.current_language_menu_position = 1;
				}
				else if (menu == "language_check_updates")
				{
					menu = "language_auto_update";
				}
				else if (menu == "language_auto_update")
				{
					menu = "match_system_language";
				}
				else if (global.current_language_menu_position < array_length(global.valid_languages) - 1)
				{
					global.current_language_menu_position = min(global.current_language_menu_position + 1, array_length(global.valid_languages) - 1);
					menu = "Language" + string(global.current_language_menu_position);
					menu_cursor_y_position = global.current_language_menu_position * 50;
				}
				else if (global.current_language_menu_position >= array_length(global.valid_languages) - 1)
				{
					menu = "language_check_updates";
				}
			}
			else if (key_a_pressed
			|| mouse_check_button_released(mb_left)
			&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), match_system_language_x, match_system_language_y, match_system_language_x + 370, match_system_language_y + 42))
			&& (!open_dropdown)
			&& (menu == "match_system_language")
			{
				menu_delay = 3;
				scr_set_default_language(true);
				
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_real("language_updates", "selected_language_id", global.selected_language_id);
				ini_write_real("language_updates", "current_language_menu_position", global.current_language_menu_position);
				ini_close();
				
				scr_set_font();
			}
			else if (key_a_pressed
			|| mouse_check_button_released(mb_left)
			&& point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), match_system_language_x, check_updates_button_y, match_system_language_x + 370, check_updates_button_y + 42))
			&& (!open_dropdown)
			&& (menu == "language_check_updates")
			{
				menu_delay = 3;
				
				/* Force to update language pack when you click this button */
				scr_language_pack_update(true);
			}
			else if (key_a_pressed && menu == "language_auto_update")
			{
				open_dropdown = !open_dropdown;
			}
		}
		#endregion /* Language Menu Navigation */
		
	}
	#endregion /* Language Options END */
	
}