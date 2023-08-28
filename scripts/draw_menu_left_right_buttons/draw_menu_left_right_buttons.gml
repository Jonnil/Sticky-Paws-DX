function draw_menu_left_right_buttons(left_right_buttons_x, left_right_buttons_y, left_right_buttons_right_arrow_x, left_right_buttons_text, left_right_buttons_variable_to_change, left_right_buttons_menu, scale_increment, left_right_buttons_can_go_below_0)
{
	var size_of_button_offset = 299;
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Left Right Buttons */
	
	#region /* Draw Left Key */
	draw_sprite_ext(spr_keyboard_keys, vk_left, left_right_buttons_x - 32, 20 + (left_right_buttons_y), 0.5, 0.5, 0, c_white, 1);
	if (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x - 32 + 16 + size_of_button_offset, 20 + (left_right_buttons_y) + 16))
	&& (global.controls_used_for_menu_navigation == "mouse")
	{
		if (left_right_buttons_can_go_below_0)
		&& (open_dropdown == false)
		|| (left_right_buttons_can_go_below_0 == false)
		&& (left_right_buttons_variable_to_change > 0)
		&& (open_dropdown == false)
		{
			menu = string(left_right_buttons_menu);
			menu_cursor_y_position = left_right_buttons_y;
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x - 32 + 16, 20 + (left_right_buttons_y) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
	}
	#endregion /* Draw Left Key END */
	
	#region /* Draw Right Key */
	draw_sprite_ext(spr_keyboard_keys, vk_right, left_right_buttons_x + left_right_buttons_right_arrow_x, 20 + (left_right_buttons_y), 0.5, 0.5, 0, c_white, 1);
	if (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x + left_right_buttons_right_arrow_x - 16 - size_of_button_offset, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16))
	&& (global.controls_used_for_menu_navigation == "mouse")
	&& (open_dropdown == false)
	{
		menu = string(left_right_buttons_menu);
		menu_cursor_y_position = left_right_buttons_y;
		can_navigate_settings_sidebar = false;
		draw_set_alpha(0.5);
		draw_rectangle_color(left_right_buttons_x + left_right_buttons_right_arrow_x - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /* Draw Right Key END */
	
	#region /* Draw Text */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(left_right_buttons_x, 20 + (left_right_buttons_y), l10n_text(string(left_right_buttons_text)) + ": " + string(left_right_buttons_variable_to_change), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
	#endregion /* Draw Text END */
	
	if (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16))
	&& (global.controls_used_for_menu_navigation == "mouse")
	&& (open_dropdown == false)
	{
		menu = string(left_right_buttons_menu);
		menu_cursor_y_position = left_right_buttons_y;
	}
	if (menu == string(left_right_buttons_menu))
	{
		menu_cursor_y_position = left_right_buttons_y;
		draw_sprite(spr_menu_cursor, menu_cursor_index, left_right_buttons_x - 32 - 32, 20 + (left_right_buttons_y));
	}
	if (key_left)
	&& (menu == string(left_right_buttons_menu))
	|| (mouse_check_button_released(mb_left))
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x - 32 + 16 + size_of_button_offset, 20 + (left_right_buttons_y) + 16))
	{
		if (left_right_buttons_can_go_below_0)
		&& (open_dropdown == false)
		|| (left_right_buttons_can_go_below_0 == false)
		&& (left_right_buttons_variable_to_change > 0)
		&& (open_dropdown == false)
		{
			menu = string(left_right_buttons_menu);
			
			if (keyboard_check(vk_control))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			|| (gamepad_button_check(global.player_slot[1], gp_face3))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			{
				left_right_buttons_variable_to_change -= (scale_increment * 10);
				menu_delay = 3;
			}
			else
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (can_navigate_settings_sidebar == false)
			{
				left_right_buttons_variable_to_change -= scale_increment;
				menu_delay = 3;
			}
		}
	}
	if (key_right)
	&& (menu == string(left_right_buttons_menu))
	&& (open_dropdown == false)
	|| (mouse_check_button_released(mb_left))
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x + left_right_buttons_right_arrow_x - 16 - size_of_button_offset, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16))
	&& (open_dropdown == false)
	{
		menu = string(left_right_buttons_menu);
			
		if (keyboard_check(vk_control))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate_settings_sidebar == false)
		|| (gamepad_button_check(global.player_slot[1], gp_face3))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate_settings_sidebar == false)
		{
			left_right_buttons_variable_to_change += (scale_increment * 10);
			menu_delay = 3;
		}
		else
		if (menu_delay == 0 && menu_joystick_delay == 0)
		&& (can_navigate_settings_sidebar == false)
		{
			left_right_buttons_variable_to_change += scale_increment;
			menu_delay = 3;
		}
	}
	#endregion /* Left Right Buttons END */
	
	return(left_right_buttons_variable_to_change);
}