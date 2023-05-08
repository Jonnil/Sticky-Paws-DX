function scr_draw_name_input_screen(what_string_to_edit, max_characters, box_color, black_rectangle_alpha, can_press_ok_when_input_empty, xx, yy, ok_menu_string, cancel_menu_string, max_characters_needed = false, use_script_navigation_code = true)
{
	
	#region /* Never draw x too far off screen */
	if (xx < 200)
	{
		xx = 200;
	}
	else
	if (xx > display_get_gui_width() + 200)
	{
		xx = display_get_gui_width() + 200;
	}
	#endregion /* Never draw x too far off screen END */
	
	#region /* Never draw y too low on screen so it shows up underneath the screen */
	if (keyboard_virtual_status())
	and (keyboard_virtual_height() != 0)
	{
		/* Set name input screen to always be above the virtual keyboard */
		yy = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	if (yy > display_get_gui_height() - 160)
	{
		yy = display_get_gui_height() - 160;
	}
	#endregion /* Never draw y too low on screen so it shows up underneath the screen END */
	
	if (string_width(what_string_to_edit) < 300)
	{
		var width = 150;
	}
	else
	{
		var width = string_width(what_string_to_edit) * 0.5;
	}
	
	if (global.keyboard_virtual_timer < 2)
	{
		global.keyboard_virtual_timer += 1;
	}
	if (global.keyboard_virtual_timer == 1)
	{
		keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);
	}
	
	#region /* Opaque transparent black rectangle over whole screen, but underneath name input screen */
	draw_set_alpha(0.9);
	draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	#endregion /* Opaque transparent black rectangle over whole screen, but underneath name input screen END */
	
	#region /* Box where name is written on */
	draw_rectangle_color(xx - width, yy - 16, xx + width, yy + 16, box_color, box_color, box_color, box_color, false); /* Rectangle where text is written on */
	draw_set_alpha(black_rectangle_alpha);
	draw_rectangle_color(xx - width, yy - 16, xx + width, yy + 16, c_black, c_black, c_black, c_black, false); /* Black transparent rectangle where text is written on */
	draw_set_alpha(1);
	draw_rectangle_color(xx - width, yy - 16, xx + width, yy + 16, c_white, c_white, c_white, c_white, true); /* White outline */
	#endregion /* Box where name is written on END */
	
	#region /* Draw the inputed text */
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	var name_entering_blink = scr_wave(0, 1, 1, 0);
	if (name_entering_blink > 0.5)
	{
		scr_draw_text_outlined(xx + 6, yy, string(keyboard_string) + "|", global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(xx, yy, string(keyboard_string), global.default_text_size, c_black, c_white, 1);
	}
	#endregion /* Draw the inputed text END */
	
	#region /* A file name can't contain any of these characters */
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
	#endregion /* A file name can't contain any of these characters END */
	
	#region /* When pressing backspace with nothing in keyboard_string, a DEL character gets typed. Do code like this to prevent that */
	if (keyboard_string = "\u007f") /* This is the unicode for DEL character */
	and (string_length(keyboard_string) <= 1)
	{
		keyboard_string = "";
		what_string_to_edit = "";
	}
	#endregion /* When pressing backspace with nothing in keyboard_string, a DEL character gets typed. Do code like this to prevent that END */
	
	#region /* Can paste text from clipboard */
	if (keyboard_check(vk_control))
	and (keyboard_check_pressed(ord("V")))
	and (clipboard_has_text())
	{
		keyboard_string = clipboard_get_text();
	    what_string_to_edit = clipboard_get_text();
	}
	#endregion /* Can paste text from clipboard END */
	
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
	if (can_press_ok_when_input_empty == false)
	and (keyboard_string != "")
	or (can_press_ok_when_input_empty == true)
	{
		if (max_characters_needed == true) /* On some code input screens, you want to fill all the characters to the max before you can continue */
		and (string_length(what_string_to_edit) == max_characters)
		or (max_characters_needed == false)
		{
			draw_menu_button(xx + buttons_x, yy + buttons_ok_y, l10n_text("OK"), ok_menu_string, ok_menu_string);
			if (menu == ok_menu_string)
			{
				if (gamepad_is_connected(global.player1_slot))
				and (global.controls_used_for_menu_navigation == "controller")
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], xx + buttons_x + 20, yy + buttons_ok_y + 21, 0.5, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, vk_enter, xx + buttons_x + 20, yy + buttons_ok_y + 21, 0.5, 0.5, 0, c_white, 1);
				}
			}
			
			#region /* Clicking the OK button */
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx + buttons_x, yy + buttons_ok_y, xx + buttons_x + 370, yy + buttons_ok_y + 41))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				can_input_player1_name = false;
				can_input_player2_name = false;
				can_input_player3_name = false;
				can_input_player4_name = false;
				global.keyboard_virtual_timer = 0;
				keyboard_virtual_hide(); /* Hide the virtual keyboard when clicking OK */
			}
			#endregion /* Clicking the OK button END */
			
		}
	}
	draw_menu_button(xx + buttons_x, yy + buttons_cancel_y, l10n_text("Cancel"), cancel_menu_string, cancel_menu_string);
	
	#region /* Clicking the Cancel button */
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx + buttons_x, yy + buttons_cancel_y, xx + buttons_x + 370, yy + buttons_cancel_y + 41))
	and (mouse_check_button_released(mb_left))
	and (menu_delay == 0)
	or (keyboard_check_pressed(vk_escape))
	and (menu_delay == 0)
	{
		menu_delay = 3;
		can_input_player1_name = false;
		can_input_player2_name = false;
		can_input_player3_name = false;
		can_input_player4_name = false;
		global.keyboard_virtual_timer = 0;
		keyboard_virtual_hide(); /* Hide the virtual keyboard when clicking Cancel */
	}
	#endregion /* Clicking the Cancel button END */
	
	draw_sprite_ext(spr_icons_back, 0, xx + buttons_x + 55, yy + buttons_cancel_y + 21, 1, 1, 0, c_white, 1);
	if (menu != cancel_menu_string)
	{
		if (gamepad_is_connected(global.player1_slot))
		and (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.back], xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_escape, xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	if (menu == cancel_menu_string)
	{
		if (gamepad_is_connected(global.player1_slot))
		and (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, c_white, 1);
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
	and (menu_joystick_delay == 0)
	and (use_script_navigation_code == true)
	{
		if (keyboard_check_pressed(vk_up))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		{
			menu = ok_menu_string;
		}
		else
		if (keyboard_check_pressed(vk_down))
		or (gamepad_button_check_pressed(global.player1_slot, gp_padd))
		or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
		{
			menu = cancel_menu_string;
		}
	}
	
	return(what_string_to_edit);
}