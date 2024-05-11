function draw_menu_checkmark(x_position, y_position, string_text, menu_index, variable_to_check, option_default = -1, option_description = "")
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Checkmark */
	
	#region /* Initialize variables */
	var widen_button_offset = 6;
	var width_of_button = string_width(string_text) + 100;
	#endregion /* Initialize variables END */
	
	if (menu == menu_index)
	&& (global.controls_used_for_navigation != "mouse")
	|| (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
	&& (!input_key)
	&& (!open_dropdown)
	{
		draw_set_alpha(scr_wave(0.1, 0.5, 1));
		draw_roundrect_color_ext(x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset, 50, 50, c_white, c_white, false);
		draw_set_alpha(1);
	}
	
	if (!variable_to_check)
	{
		if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!input_key)
		&& (!open_dropdown)
		{
			draw_sprite_ext(spr_menu_checkmark, 0, x_position + 42, y_position, 1, 1, 0, c_lime, 1);
			menu = menu_index;
			can_navigate_settings_sidebar = false;
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark, 0, x_position + 42, y_position, 1, 1, 0, c_white, 1);
		}
	}
	else
	{
		if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!input_key)
		&& (!open_dropdown)
		{
			draw_sprite_ext(spr_menu_checkmark, 1, x_position + 42, y_position, 1, 1, 0, c_lime, 1);
			if (!input_key)
			&& (!open_dropdown)
			{
				menu = menu_index;
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
		if (variable_instance_exists(self, "menu_cursor_y_position"))
		&& (variable_instance_exists(self, "menu_y_offset"))
		{
			menu_cursor_y_position = y_position - menu_y_offset;
		}
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 16, y_position + 16, 1, 1, 0, c_white, 1);
		global.option_default = option_default;
		if (option_description != "")
		{
			global.option_description = option_description;
		}
		else
		{
			global.option_description = string_text;
		}
	}
	#endregion /* Show a menu cursor when the option is highlighted END */
	
	#region /* Clicking the menu button */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
	&& (mouse_check_button_released(mb_left))
	&& (global.controls_used_for_navigation == "mouse")
	&& (!input_key)
	&& (!open_dropdown)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	|| (key_a_pressed)
	&& (menu == menu_index)
	&& (!input_key)
	&& (!open_dropdown)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (variable_to_check)
		{
			variable_to_check = false;
		}
		else
		{
			variable_to_check = true;
		}
		menu = menu_index;
		can_navigate_settings_sidebar = false;
	}
	#endregion /* Clicking the menu button END */

	#region /* Text inside the menu button */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x_position + 82, y_position + 16, string(string_text), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	#endregion /* Text inside the menu button END */
	
	#endregion /* Checkmark END */
	
	return(variable_to_check);
}