function draw_menu_left_right_buttons(left_right_buttons_x, left_right_buttons_y, left_right_buttons_right_arrow_x, left_right_buttons_text, left_right_buttons_variable_to_change, left_right_buttons_menu, scale_increment, left_right_buttons_can_go_below_0)
{
	var size_of_button_offset = 299;
	var mouse_get_x = window_mouse_get_x();
	var mouse_get_y = window_mouse_get_y();
	
	#region /* Left Right Buttons */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(left_right_buttons_x, 20 + (left_right_buttons_y), l10n_text(string(left_right_buttons_text)) + ": " + string(left_right_buttons_variable_to_change), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
	
	draw_sprite_ext(spr_keyboard_keys, vk_left, left_right_buttons_x - 32, 20 + (left_right_buttons_y), 0.5, 0.5, 0, c_white, 1);
	if (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x - 32 + 16 + size_of_button_offset, 20 + (left_right_buttons_y) + 16))
	and (global.controls_used_for_menu_navigation == "mouse")
	{
		if (left_right_buttons_can_go_below_0 == true)
		or (left_right_buttons_can_go_below_0 = false)
		and (left_right_buttons_variable_to_change > 0)
		{
			menu = string(left_right_buttons_menu);
			menu_cursor_y_position = left_right_buttons_y;
			can_navigate_settings_sidebar = false;
			draw_set_alpha(0.5);
			draw_rectangle_color(left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x - 32 + 16, 20 + (left_right_buttons_y) + 16, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
	}
	
	draw_sprite_ext(spr_keyboard_keys, vk_right, left_right_buttons_x + left_right_buttons_right_arrow_x, 20 + (left_right_buttons_y), 0.5, 0.5, 0, c_white, 1);
	if (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x + left_right_buttons_right_arrow_x - 16 - size_of_button_offset, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16))
	and (global.controls_used_for_menu_navigation == "mouse")
	{
		menu = string(left_right_buttons_menu);
		menu_cursor_y_position = left_right_buttons_y;
		can_navigate_settings_sidebar = false;
		draw_set_alpha(0.5);
		draw_rectangle_color(left_right_buttons_x + left_right_buttons_right_arrow_x - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	if (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16))
	and (global.controls_used_for_menu_navigation == "mouse")
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
	and (menu == string(left_right_buttons_menu))
	or (mouse_check_button_pressed(mb_left))
	and (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x - 32 - 16, 20 + (left_right_buttons_y) - 16, left_right_buttons_x - 32 + 16 + size_of_button_offset, 20 + (left_right_buttons_y) + 16))
	{
		if (left_right_buttons_can_go_below_0 == true)
		or (left_right_buttons_can_go_below_0 = false)
		and (left_right_buttons_variable_to_change > 0)
		{
			menu = string(left_right_buttons_menu);
			
			if (keyboard_check(vk_control))
			and (menu_delay == 0)
			and (can_navigate_settings_sidebar = false)
			or (gamepad_button_check(0, gp_face3))
			and (menu_delay == 0)
			and (can_navigate_settings_sidebar = false)
			{
				left_right_buttons_variable_to_change -= (scale_increment * 10);
				menu_delay = 3;
			}
			else
			if (menu_delay == 0)
			and (can_navigate_settings_sidebar = false)
			{
				left_right_buttons_variable_to_change -= scale_increment;
				menu_delay = 3;
			}
		}
	}
	if (key_right)
	and (menu == string(left_right_buttons_menu))
	or (mouse_check_button_pressed(mb_left))
	and (point_in_rectangle(mouse_get_x, mouse_get_y, left_right_buttons_x + left_right_buttons_right_arrow_x - 16 - size_of_button_offset, 20 + (left_right_buttons_y) - 16, left_right_buttons_x + left_right_buttons_right_arrow_x + 16, 20 + (left_right_buttons_y) + 16))
	{
		menu = string(left_right_buttons_menu);
			
		if (keyboard_check(vk_control))
		and (menu_delay == 0)
		and (can_navigate_settings_sidebar = false)
		or (gamepad_button_check(0, gp_face3))
		and (menu_delay == 0)
		and (can_navigate_settings_sidebar = false)
		{
			left_right_buttons_variable_to_change += (scale_increment * 10);
			menu_delay = 3;
		}
		else
		if (menu_delay == 0)
		and (can_navigate_settings_sidebar = false)
		{
			left_right_buttons_variable_to_change += scale_increment;
			menu_delay = 3;
		}
	}
	#endregion /* Left Right Buttons END */
	
	return(left_right_buttons_variable_to_change);
}