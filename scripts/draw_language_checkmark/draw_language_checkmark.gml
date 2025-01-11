function draw_language_checkmark(x_position, y_position, string_text, menu_index, valid_language_index = real(string_delete(menu_index, 1, 8)))
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Checkmark */
	
	#region /* Initialize variables */
	var widen_button_offset = 7;
	var width_of_button = 670;
	#endregion /* Initialize variables END */
	
	if (global.language_localization != valid_language_index)
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
				language_index = real(string_delete(menu_index, 1, 8));
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
				language_index = real(string_delete(menu_index, 1, 8));
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
		global.language_localization = valid_language_index;
		
		ini_open(game_save_id + "save_file/config.ini");
		ini_write_real("config", "language_localization", global.language_localization);
		ini_close();
		
		language_index = real(string_delete(menu_index, 1, 8));
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
		scr_draw_text_outlined(x_position + 82, y_position + 16, string(string_text) + " " + string(menu_index) + " " + string(valid_language_index), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	else
	{
		scr_draw_text_outlined(x_position + 82, y_position + 16, string(string_text), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /* Text inside the menu button END */
	
	#endregion /* Checkmark END */
}