function scr_draw_name_input_screen(what_string /* What string to edit */, max_char = 500 /* 500 is max characters on Nintendo Switch */, box_color, black_rec_alpha /* Black Rectangle Alpha */, can_ok_when_empty /* Can press ok when input is empty */, xx, yy, ok_menu_string, cancel_menu_string, max_char_needed = false, use_script_navigation_code = true, only_big_letter = false)
{
	var buttons_x = -185;
	var buttons_ok_y = +54;
	var buttons_cancel_y = buttons_ok_y + 42;
	
	#region /* Opaque transparent black rectangle over whole screen, but underneath name input screen */
	draw_set_alpha(0.5);
	draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	#endregion /* Opaque transparent black rectangle over whole screen, but underneath name input screen END */
	
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
	&& (keyboard_virtual_height() != 0)
	{
		/* Set name input screen to always be above the virtual keyboard */
		yy = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	if (steam_utils_is_steam_running_on_steam_deck())
	{
		yy = (display_get_gui_height() * 0.5) - 160;
	}
	else
	if (yy > display_get_gui_height() - 160)
	{
		yy = display_get_gui_height() - 160;
	}
	#endregion /* Never draw y too low on screen so it shows up underneath the screen END */
	
	if (string_width_ext(keyboard_string, 40, 1000) < 300)
	{
		var width = 150;
	}
	else
	{
		var width = string_width_ext(keyboard_string, 40, 1000) * 0.5;
	}
	
	if (global.keyboard_virtual_timer < 6)
	{
		global.keyboard_virtual_timer ++;
	}
	if (global.keyboard_virtual_timer == 3)
	{
		steam_utils_enable_callbacks();
		if (variable_instance_exists(self, "remember_keyboard_string"))
		{
			remember_keyboard_string = string(what_string); /* In case you want to click "Cancel", revert back to whatever was already written before entering name input screen */
		}
	}
	if (global.keyboard_virtual_timer == 4)
	|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx - width, yy - 16, xx + width, yy + 16))
	&& (mouse_check_button_released(mb_left))
	&& (global.keyboard_virtual_timer >= 5)
	|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
	&& (global.keyboard_virtual_timer >= 5)
	{
		menu_delay = 3;
		if (os_type == os_switch)
		{
			what_string_async = get_string_async("", "");
		}
		keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_characters, false);
		
		steam_show_floating_gamepad_text_input(steam_floating_gamepad_text_input_mode_single_line, window_get_x(), window_get_y() * 0.5, window_get_width(), window_get_height() * 0.5);
	}
	
	#region /* Box where name is written on */
	if (string_height_ext(keyboard_string, 40, 1000) > 0)
	{
		var extra_height = string_height_ext(keyboard_string, 40, 1000) - 25;
	}
	else
	{
		var extra_height = 16;
	}
	draw_rectangle_color(xx - width, yy - extra_height, xx + width, yy + 16, box_color, box_color, box_color, box_color, false); /* Rectangle where text is written on */
	draw_set_alpha(black_rec_alpha);
	draw_rectangle_color(xx - width, yy - extra_height, xx + width, yy + 16, c_black, c_black, c_black, c_black, false); /* Black transparent rectangle where text is written on */
	draw_set_alpha(1);
	draw_rectangle_color(xx - width, yy - extra_height, xx + width, yy + 16, c_white, c_white, c_white, c_white, true); /* White outline */
	#endregion /* Box where name is written on END */
	
	#region /* Draw the inputed text */
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	var name_entering_blink = scr_wave(0, 1, 1, 0);
	if (name_entering_blink > 0.5)
	{
		if (only_big_letter)
		{
			var string_text = string_upper(keyboard_string) + "|";
		}
		else
		{
			var string_text = string(keyboard_string) + "|";
		}
	}
	else
	{
		if (only_big_letter)
		{
			var string_text = string_upper(keyboard_string);
		}
		else
		{
			var string_text = string(keyboard_string);
		}
	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_ext_transformed_color(xx, yy + 15, string_text, 40, 1000, global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
	
	#endregion /* Draw the inputed text END */
	
	#region /* When pressing backspace with nothing in keyboard_string, a DEL character gets typed. Do code like this to prevent that */
	if (keyboard_string = "\u007f") /* This is the unicode for DEL character */
	&& (string_length(keyboard_string) <= 1)
	{
		keyboard_string = "";
		what_string = "";
	}
	#endregion /* When pressing backspace with nothing in keyboard_string, a DEL character gets typed. Do code like this to prevent that END */
	
	#region /* Can paste text from clipboard */
	if (keyboard_check(vk_control))
	&& (keyboard_check_pressed(ord("V")))
	&& (clipboard_has_text())
	{
		keyboard_string = clipboard_get_text();
	    what_string = clipboard_get_text();
	}
	#endregion /* Can paste text from clipboard END */
	
	#region /* Show how many characters a name has and what the max amount of characters is */
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	if (string_length(what_string) >= max_char)
	{
		scr_draw_text_outlined(xx + 150, yy + 32, string(max_char) + "/" + string(max_char), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(xx + 150, yy + 32, string(string_length(what_string)) + "/" + string(max_char), global.default_text_size, c_black, c_ltgray, 1);
	}
	#endregion /* Show how many characters a name has and what the max amount of characters is END */
	
	if (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	|| (os_type == os_switch)
	|| (steam_utils_is_steam_running_on_steam_deck())
	{
		scr_draw_gamepad_buttons(gp_face4, xx + 200, yy + 32, 0.5, c_white, 1, 1, 1, 1);
		scr_draw_text_outlined(xx + 280, yy + 32, l10n_text("Edit"), global.default_text_size, c_black, c_ltgray, 1);
	}
	
	#region /* Clicking the Cancel button */
	if (menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx + buttons_x, yy + buttons_cancel_y, xx + buttons_x + 370, yy + buttons_cancel_y + 41))
		&& (menu == cancel_menu_string)
		|| (keyboard_check_pressed(vk_escape))
		|| (keyboard_check_pressed(vk_enter) && menu == cancel_menu_string)
		
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]) && menu == cancel_menu_string)
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]) && menu == cancel_menu_string)
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]) && menu == cancel_menu_string)
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept]) && menu == cancel_menu_string)
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]) && menu == cancel_menu_string)
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept]) && menu == cancel_menu_string)
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]) && menu == cancel_menu_string)
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept]) && menu == cancel_menu_string)
		
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.back]))
		{
			menu_delay = 3;
			if (variable_instance_exists(self, "remember_keyboard_string"))
			{
				what_string = remember_keyboard_string;
				keyboard_string = remember_keyboard_string; /* Revert back to whatever was already written before entering name input screen */
			}
			
			what_string_async = "";
			keyboard_virtual_hide(); /* Hide the virtual keyboard when clicking Cancel */
			global.clicking_cancel_input_screen = true;
			
			var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function(){
				global.clicking_cancel_input_screen = false; /* Reset clicking cancel */
			}, [], 1);
			time_source_start(time_source);
			
			var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function(){
				global.keyboard_virtual_timer = 0; /* Reset the virtual keyboard timer */
			}, [], 1);
			time_source_start(time_source);
		}
	}
	#endregion /* Clicking the Cancel button END */
	
	#region /* OK and Cancel buttons under name input */
	if (!can_ok_when_empty)
	&& (keyboard_string != "")
	|| (can_ok_when_empty)
	{
		if (max_char_needed) /* On some code input screens, you want to fill all the characters to the max before you can continue */
		&& (string_length(keyboard_string) == max_char)
		|| (!max_char_needed)
		{
			draw_menu_button(xx + buttons_x, yy + buttons_ok_y, l10n_text("OK"), ok_menu_string, ok_menu_string);
			if (menu != cancel_menu_string)
			{
				if (gamepad_is_connected(global.player_slot[1]))
				&& (global.controls_used_for_navigation == "gamepad")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], xx + buttons_x + 20, yy + buttons_ok_y + 21, 0.5, c_white, 1, 1, 1, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, vk_enter, xx + buttons_x + 20, yy + buttons_ok_y + 21, 0.5, 0.5, 0, c_white, 1);
				}
			}
			
			#region /* Clicking the OK button */
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (menu == ok_menu_string)
			{
				if (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx + buttons_x, yy + buttons_ok_y, xx + buttons_x + 370, yy + buttons_ok_y + 41))
				|| (keyboard_check_pressed(vk_enter))
				|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
				|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
				|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
				|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept]))
				|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
				|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept]))
				|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
				|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept]))
				{
					menu_delay = 3;
					
					what_string_async = "";
					keyboard_virtual_hide(); /* Hide the virtual keyboard when clicking OK */
					global.clicking_ok_input_screen = true;
					
					var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function(){
						global.clicking_ok_input_screen = false; /* Reset clicking ok */
					}, [], 1);
					time_source_start(time_source);
					
					var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function(){
						global.keyboard_virtual_timer = 0; /* Reset the virtual keyboard timer */
					}, [], 1);
					time_source_start(time_source);
				}
			}
			#endregion /* Clicking the OK button END */
			
		}
	}
	draw_menu_button(xx + buttons_x, yy + buttons_cancel_y, l10n_text("Cancel"), cancel_menu_string, cancel_menu_string);
	
	draw_sprite_ext(spr_icon_back, 0, xx + buttons_x + 55, yy + buttons_cancel_y + 21, 1, 1, 0, c_white, 1);
	if (menu != cancel_menu_string)
	{
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.back], xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, c_white, 1, 1, 1, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_escape, xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	if (menu == cancel_menu_string)
	{
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, c_white, 1, 1, 1, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_enter, xx + buttons_x + 20, yy + buttons_cancel_y + 21, 0.5, 0.5, 0, c_white, 1);
		}
	}
	#endregion /* OK and Cancel buttons under name input END */
	
	var string_previous = keyboard_string;
	if (string_length(keyboard_string) > max_char)
	{
		keyboard_string = string_copy(string_previous, 1, max_char);
	}
	
	if (menu_delay == 0 && menu_joystick_delay == 0)
	&& (use_script_navigation_code)
	{
		if (keyboard_check_pressed(vk_up))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
		|| (gamepad_axis_value(global.player_slot[1], gp_axislv) < -0.3)
		{
			menu_delay = 3;
			menu = ok_menu_string;
		}
		else
		if (keyboard_check_pressed(vk_down))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
		|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > +0.3)
		{
			menu_delay = 3;
			menu = cancel_menu_string;
		}
	}
	
	if (switch_check_profanity(keyboard_string))
	{
		keyboard_string = switch_mask_profanity(keyboard_string);
	}
	
	what_string = keyboard_string; /* Set this variable to keyboard string */
	
	return(keyboard_string);
}