function draw_language_checkmark(x_position, y_position, string_text, menu_index, valid_language_index = real(string_delete(menu_index, 1, 8)))
{
	/*
	Let me explain how the language selection system works in a more casual way, like we're just chatting about it.

	The game keeps track of the language the player has chosen using something called 'global.selected_language_id'.
	This is basically a number or ID that represents a specific language.
	Kind of like a label that never changes, no matter where it appears in the game.
	The game pulls this ID from a list called 'global.valid_languages', which isn't sorted in any special way.
	It just holds all the available language IDs.
	The point of this ID is to make sure the game knows which translations to use when it displays text.

	Then there's 'global.current_language_menu_position', which is a bit different.
	This variable isn't about IDs.
	It's about the position of the selected language in the menu itself.
	The menu shows the languages in alphabetical order, so the positions of the languages in this sorted list might not match their original IDs.
	This position is used to figure out which language should be highlighted and selected when the menu pops up.

	When the player opens the language menu, the game looks at the 'global.selected_language_id' and finds its place in the sorted list.
	It uses this to set 'global.current_language_menu_position' so the right language gets highlighted.
	If the player picks a new language, the game updates both variables: 'global.current_language_menu_position' changes to the new menu position,
	and 'global.selected_language_id' gets updated to the new language's ID from the unsorted list.

	Here's an example to make it clearer.
	When the game starts, it loads 'global.selected_language_id' from the settings file so it knows which language the player used last time.
	Then the language menu opens, showing the sorted list of available languages.
	The game goes through that list, finds the language that matches the saved ID, and highlights it in the menu.

	If the player decides to switch to a different language, the position in the menu ('global.current_language_menu_position') updates to the new selection,
	and 'global.selected_language_id' updates to the corresponding language ID from the unsorted list.
	When the player confirms the choice, the game saves this new ID to the settings file, so the next time they play, the game will remember their new language.

	So, to sum up: 'global.selected_language_id' is the ID that tells the game which translations to use,
	and 'global.current_language_menu_position' is the index of the language in the sorted menu list that makes sure the right language gets highlighted when the menu appears.
	They work together to make the language selection feel seamless and intuitive.
	*/

	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);

	#region /* Checkmark */

	#region /* Initialize variables */
	var widen_button_offset = 7;
	var width_of_button = 670;
	#endregion /* Initialize variables END */

	if (global.selected_language_id != valid_language_index)
	{
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		&& (!input_key)
		&& (!open_dropdown)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			draw_sprite_ext(spr_menu_checkmark, 0, x_position + 42, y_position, 1, 1, 0, c_lime, 1);
			{
				menu = menu_index;
				global.current_language_menu_position = real(string_delete(menu_index, 1, 8));
				can_navigate_settings_sidebar = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark, 0, x_position + 42, y_position, 1, 1, 0, c_white, 1);
		}
	}
	else
	{
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		&& (!input_key)
		&& (!open_dropdown)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			draw_sprite_ext(spr_menu_checkmark, 1, x_position + 42, y_position, 1, 1, 0, c_lime, 1);
			if (!input_key)
			&& (!open_dropdown)
			{
				menu = menu_index;
				global.current_language_menu_position = real(string_delete(menu_index, 1, 8));
				can_navigate_settings_sidebar = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark, 1, x_position + 42, y_position, 1, 1, 0, c_white, 1);
		}
	}

	#region /* Show a menu cursor when the option is highlighted */
	if (menu == menu_index)
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 16, y_position + 16, 1, 1, 0, c_white, 1);
	}
	#endregion /* Show a menu cursor when the option is highlighted END */

	#region /* Clicking the menu button */
	if (global.controls_used_for_navigation == "mouse")
	&& (mouse_check_button_released(mb_left))
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
	&& (!input_key)
	&& (!open_dropdown)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	|| (key_a_pressed)
	&& (menu == menu_index)
	&& (!input_key)
	&& (!open_dropdown)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu_delay = 3;
		global.selected_language_id = max(valid_language_index, 2);
		global.current_language_menu_position = real(string_delete(menu_index, 1, 8));

		ini_open(game_save_id + "save_file/config.ini");
		ini_write_real("language_updates", "selected_language_id", global.selected_language_id);
		ini_write_real("language_updates", "current_language_menu_position", global.current_language_menu_position);
		ini_close();

		menu = menu_index;
		can_navigate_settings_sidebar = false;
		scr_set_font();
	}
	#endregion /* Clicking the menu button END */

	#region /* Text inside the menu button */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	if (global.translation_debug)
	{
		scr_draw_text_outlined(x_position + 82, y_position + 16, string(string_text) + " " + string(menu_index) + " ID: " + string(valid_language_index), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	else
	{
		scr_draw_text_outlined(x_position + 82, y_position + 16, string(string_text), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /* Text inside the menu button END */

	#endregion /* Checkmark END */
}
