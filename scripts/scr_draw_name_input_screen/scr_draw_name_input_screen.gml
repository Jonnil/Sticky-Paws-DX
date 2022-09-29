function scr_draw_name_input_screen(what_string_to_edit, max_characters, box_color, black_rectangle_alpha, can_press_ok_when_input_empty, xx, yy, ok_menu_string, cancel_menu_string)
{
	
	#region /* Opaque transparent black rectangle over whole screen, but underneath name input screen */
	draw_set_alpha(0.5);
	draw_rectangle_color(- 32, - 32, window_get_width() + 32, window_get_height() + 32, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	#endregion /* Opaque transparent black rectangle over whole screen, but underneath name input screen END */
	
	#region /* Box where name is written on */
	draw_rectangle_color(xx - 150, yy - 16, xx + 150, yy + 16, box_color, box_color, box_color, box_color, false); /* Rectangle where text is written on */
	draw_set_alpha(black_rectangle_alpha);
	draw_rectangle_color(xx - 150, yy - 16, xx + 150, yy + 16, c_black, c_black, c_black, c_black, false); /* Black transparent rectangle where text is written on */
	draw_set_alpha(1);
	draw_rectangle_color(xx - 150, yy - 16, xx + 150, yy + 16, c_white, c_white, c_white, c_white, true); /* White outline */
	#endregion /* Box where name is written on END */
	
	#region /* Draw the inputed text */
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	var name_entering_blink = scr_wave(0, 1, 1, 0);
	if (name_entering_blink > 0.5)
	{
		scr_draw_text_outlined(xx + 6, yy, string(what_string_to_edit) + "|", global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(xx, yy, string(what_string_to_edit), global.default_text_size, c_black, c_white, 1);
	}
	#endregion /* Draw the inputed text END */
	
	#region /* A file name can't contain any of the following characters */
	if (ord(keyboard_lastchar) != ord("\\"))
	and (ord(keyboard_lastchar) != ord("/"))
	and (ord(keyboard_lastchar) != ord(":"))
	and (ord(keyboard_lastchar) != ord("*"))
	and (ord(keyboard_lastchar) != ord("?"))
	and (ord(keyboard_lastchar) != ord("\""))
	and (ord(keyboard_lastchar) != ord("<"))
	and (ord(keyboard_lastchar) != ord(">"))
	and (ord(keyboard_lastchar) != ord("|"))
	{
		what_string_to_edit = keyboard_string;
	}
	else
	{
		keyboard_string = string_copy(what_string_to_edit, 1, max_characters);
	}
	#endregion /* A file name can't contain any of the following characters END */
	
	#region /* When pressing backspace with nothing in keyboard_string, a DEL character gets typed. Do code like this to prevent that */
	if (keyboard_string = "\u007f") /* This is the unicode for DEL character */
	and (string_length(keyboard_string) <= 1)
	{
		keyboard_string = "";
		what_string_to_edit = "";
	}
	#endregion /* When pressing backspace with nothing in keyboard_string, a DEL character gets typed. Do code like this to prevent that END */
	
	#region /* Show how many characters a name has and what the max amount of characters is */
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	if (string_length(what_string_to_edit) >= max_characters)
	{
		scr_draw_text_outlined(xx + 150, yy + 32, string(max_characters) + "/" + string(max_characters), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(xx + 150, yy + 32, string(string_length(what_string_to_edit)) + "/" + string(max_characters), global.default_text_size, c_black, c_ltgray, 1);
	}
	#endregion /* Show how many characters a name has and what the max amount of characters is END */
	
	#region /* OK and Cancel buttons under name input */
	var buttons_x = -185;
	var buttons_ok_y = +54;
	var buttons_cancel_y = buttons_ok_y + 42;
	if (can_press_ok_when_input_empty = false)
	and (keyboard_string != "")
	or (can_press_ok_when_input_empty = true)
	{
		draw_menu_button(xx + buttons_x, yy + buttons_ok_y, l10n_text("OK"), ok_menu_string, ok_menu_string);
		if (global.controls_used_for_menu_navigation == "mouse")
		or (menu != ok_menu_string)
		and (menu != cancel_menu_string)
		or (menu == ok_menu_string)
		{
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_face1, xx + buttons_x + 20, yy + buttons_ok_y + 21, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				draw_sprite_ext(spr_keyboard_keys, vk_enter, xx + buttons_x + 20, yy + buttons_ok_y + 21, 0.5, 0.5, 0, c_white, 1);
			}
		}
	}
	draw_menu_button(xx + buttons_x, yy + buttons_cancel_y, l10n_text("Cancel"), cancel_menu_string, cancel_menu_string);
	draw_sprite_ext(spr_icons_back, 0, xx + buttons_x + 55, yy + buttons_cancel_y + 21, 1, 1, 0, c_white, 1);
	if (global.controls_used_for_menu_navigation == "mouse")
	or (menu != ok_menu_string)
	and (menu != cancel_menu_string)
	or (menu == ok_menu_string)
	{
		if (gamepad_is_connected(0))
		and (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_gamepad_buttons(gp_face2, xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_escape, xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	if (menu == cancel_menu_string)
	{
		if (gamepad_is_connected(0))
		and (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_gamepad_buttons(gp_face1, xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, c_white, 1);
		}
		else
		if (asset_get_type("spr_keyboard_keys") == asset_sprite)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_enter, xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, 0.5, 0, c_white, 1);
		}
	}
	#endregion /* OK and Cancel buttons under name input END */
	
	if (string_length(what_string_to_edit) > max_characters)
	{
		what_string_to_edit = string_copy(what_string_to_edit, 1, max_characters);
	}
	if (string_length(keyboard_string) > max_characters)
	{
		keyboard_string = string_copy(what_string_to_edit, 1, max_characters);
	}
	
	if (menu_delay == 0)
	{
		if (keyboard_check_pressed(vk_up))
		and (!keyboard_check_pressed(vk_down))
		or (gamepad_button_check_pressed(0, gp_padu))
		and (!gamepad_button_check_pressed(0, gp_padd))
		or (gamepad_axis_value(0, gp_axislv) < 0)
		or (mouse_wheel_up())
		{
			menu = ok_menu_string;
		}
		else
		if (keyboard_check_pressed(vk_down))
		and (!keyboard_check_pressed(vk_up))
		or (gamepad_button_check_pressed(0, gp_padd))
		and (!gamepad_button_check_pressed(0, gp_padu))
		or (gamepad_axis_value(0, gp_axislv) > 0)
		or (mouse_wheel_down())
		{
			menu = cancel_menu_string;
		}
	}
	
	return(what_string_to_edit);
}