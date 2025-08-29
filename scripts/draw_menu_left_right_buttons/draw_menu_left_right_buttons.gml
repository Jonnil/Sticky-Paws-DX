function draw_menu_left_right_buttons(lrb_x, lrb_y, lrb_right_arrow_x, lrb_text, lrb_variable, lrb_menu, scale_increment = 1, lrb_can_go_below_0 = false, variable_offset = 0, max_value = 65535 /* 16-bit: maximum representable value = 65,535 */)
{
	/* LRB is short for "Left Right Buttons" */
	var size_of_button_offset = 29;
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);

	#region /* Left Right Buttons */

	#region /* Draw Left Key */
	if (lrb_variable > -max_value)
	{
		if (lrb_can_go_below_0)
		&& (!open_dropdown)
		|| (!lrb_can_go_below_0)
		&& (lrb_variable > 0)
		&& (!open_dropdown)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, lrb_x - 32, 20 + (lrb_y), 0.5, 0.5, 0, c_white, 1);

			if (point_in_rectangle(mouse_get_x, mouse_get_y, lrb_x - 32 - 16, 20 + (lrb_y) - 16, lrb_x - 32 + 16 + size_of_button_offset, 20 + (lrb_y) + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				menu = string(lrb_menu);
				menu_cursor_y_position = lrb_y;
				can_navigate_settings_sidebar = false;
				draw_set_alpha(0.5);
				draw_rectangle_color(lrb_x - 32 - 16, 20 + (lrb_y) - 16, lrb_x - 32 + 16, 20 + (lrb_y) + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
	}
	#endregion /* Draw Left Key END */

	#region /* Draw Right Key */
	if (lrb_variable < max_value)
	{
		draw_sprite_ext(spr_keyboard_keys, vk_right, lrb_x + lrb_right_arrow_x, 20 + (lrb_y), 0.5, 0.5, 0, c_white, 1);

		if (point_in_rectangle(mouse_get_x, mouse_get_y, lrb_x + lrb_right_arrow_x - 16 - size_of_button_offset, 20 + (lrb_y) - 16, lrb_x + lrb_right_arrow_x + 16, 20 + (lrb_y) + 16))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!open_dropdown)
		{
			menu = string(lrb_menu);
			menu_cursor_y_position = lrb_y;
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(lrb_x + lrb_right_arrow_x - 16, 20 + (lrb_y) - 16, lrb_x + lrb_right_arrow_x + 16, 20 + (lrb_y) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
	}
	#endregion /* Draw Right Key END */

	#region /* Draw Text */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(lrb_x, 20 + (lrb_y), string(lrb_text) + ": " + string(lrb_variable + variable_offset), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
	#endregion /* Draw Text END */

	if (point_in_rectangle(mouse_get_x, mouse_get_y, lrb_x - 32 - 16, 20 + (lrb_y) - 16, lrb_x + lrb_right_arrow_x + 16, 20 + (lrb_y) + 16))
	&& (global.controls_used_for_navigation == "mouse")
	&& (!open_dropdown)
	{
		menu = string(lrb_menu);
		menu_cursor_y_position = lrb_y;
	}
	if (menu == string(lrb_menu))
	{
		menu_cursor_y_position = lrb_y;
		draw_sprite(spr_menu_cursor, menu_cursor_index, lrb_x - 32 - 32, 20 + (lrb_y));
	}
	if (menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (key_left)
		&& (menu == string(lrb_menu))
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, lrb_x - 32 - 16, 20 + (lrb_y) - 16, lrb_x - 32 + 16 + size_of_button_offset, 20 + (lrb_y) + 16))
		{
			menu = string(lrb_menu);

			if (lrb_variable > -max_value)
			{
				if (lrb_can_go_below_0)
				&& (!open_dropdown)
				|| (!lrb_can_go_below_0)
				&& (lrb_variable > 0)
				&& (!open_dropdown)
				{
					if (keyboard_check(vk_control))
					&& (!can_navigate_settings_sidebar)
					|| (gamepad_button_check(global.player_slot[1], gp_face3))
					&& (!can_navigate_settings_sidebar)
					{
						menu_delay = 3;
						lrb_variable -= (scale_increment * 10);
					}
					else
					if (!can_navigate_settings_sidebar)
					{
						menu_delay = 3;
						lrb_variable -= scale_increment;
					}
				}
			}
		}
		else
		if (key_right)
		&& (menu == string(lrb_menu))
		&& (!open_dropdown)
		|| (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, lrb_x + lrb_right_arrow_x - 16 - size_of_button_offset, 20 + (lrb_y) - 16, lrb_x + lrb_right_arrow_x + 16, 20 + (lrb_y) + 16))
		&& (!open_dropdown)
		{
			menu = string(lrb_menu);

			if (lrb_variable < max_value)
			{
				if (keyboard_check(vk_control))
				&& (!can_navigate_settings_sidebar)
				|| (gamepad_button_check(global.player_slot[1], gp_face3))
				&& (!can_navigate_settings_sidebar)
				{
					menu_delay = 3;
					lrb_variable += (scale_increment * 10);
				}
				else
				if (!can_navigate_settings_sidebar)
				{
					menu_delay = 3;
					lrb_variable += scale_increment;
				}
			}
		}
	}
	#endregion /* Left Right Buttons END */

	return(lrb_variable);
}
