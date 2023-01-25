/// @description scr_draw_remap_key(menu_string, name_string, remapping_player_key, remapping_player_key2, key_x, menu_y_remap_key);
/// @param menu_string
/// @param name_string
/// @param remapping_player_key
/// @param remapping_player_key2
/// @param key_x
/// @param menu_y_remap_key
function scr_draw_remap_key(menu_string, name_string, remapping_player_key, remapping_player_key2, key_x, menu_y_remap_key)
{
	var mouse_get_x = display_mouse_get_x();
	var mouse_get_y = display_mouse_get_y();
	
	if (global.settings_sidebar_menu == "controller_settings")
	{
		
		#region /* Remap Gamepad Button */
		if (menu == menu_string)
		and (menu_remap_key_number == 0)
		{
			if (remapping_player_key > noone)
			{
				scr_draw_gamepad_buttons(remapping_player_key, key_x, menu_y_remap_key + menu_y_offset, 1, c_white, 1);
			}
			else
			{
				scr_draw_gamepad_buttons(noone, key_x, menu_y_remap_key + menu_y_offset, 1, c_gray, 0.5);
			}
		}
		else
		{
			if (remapping_player_key > noone)
			{
				scr_draw_gamepad_buttons(remapping_player_key, key_x, menu_y_remap_key + menu_y_offset, 0.9, c_white, 0.9);
			}
			else
			{
				scr_draw_gamepad_buttons(noone, key_x, menu_y_remap_key + menu_y_offset, 0.9, c_gray, 0.45);
			}
		}
		#endregion /* Remap Gamepad Button END */
		
		#region /* Remap Gamepad Button 2 */
		if (menu == menu_string)
		and (menu_remap_key_number = 2)
		{
			if (remapping_player_key2 > noone)
			{
				scr_draw_gamepad_buttons(remapping_player_key2, key_x + 200, menu_y_remap_key + menu_y_offset, 1, c_white, 1);
			}
			else
			{
				scr_draw_gamepad_buttons(noone, key_x + 200, menu_y_remap_key + menu_y_offset, 1, c_gray, 0.5);
			}
		}
		else
		{
			if (remapping_player_key2 > noone)
			{
				scr_draw_gamepad_buttons(remapping_player_key2, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, c_white, 0.9);
			}
			else
			{
				scr_draw_gamepad_buttons(noone, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, c_gray, 0.45);
			}
		}
		#endregion /* Remap Gamepad Button 2 END */
		
	}
	
	else
	
	if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
	{
		
		#region /* Remap Keyboard Key 1 */
		if (menu == menu_string)
		and (menu_remap_key_number == 0)
		{
			if (remapping_player_key == 0)
			or (remapping_player_key == noone)
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 0.5);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_left)
			{
				draw_sprite_ext(spr_mouse_buttons, 1, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_middle)
			{
				draw_sprite_ext(spr_mouse_buttons, 2, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_right)
			{
				draw_sprite_ext(spr_mouse_buttons, 3, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_side1)
			{
				draw_sprite_ext(spr_mouse_buttons, 4, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_side2)
			{
				draw_sprite_ext(spr_mouse_buttons, 5, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key = mouse_button_value.mwheel_down) /* Mouse Wheel Down */
			{
				draw_sprite_ext(spr_mouse_buttons, 6, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key = mouse_button_value.mwheel_up) /* Mouse Wheel Up */
			{
				draw_sprite_ext(spr_mouse_buttons, 7, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key != 0)
			{
				draw_sprite_ext(spr_keyboard_keys, remapping_player_key, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 0.5);
			}
		}
		else
		{
			if (remapping_player_key == 0)
			or (remapping_player_key == noone)
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.45);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_left)
			{
				draw_sprite_ext(spr_mouse_buttons, 1, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_middle)
			{
				draw_sprite_ext(spr_mouse_buttons, 2, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_right)
			{
				draw_sprite_ext(spr_mouse_buttons, 3, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_side1)
			{
				draw_sprite_ext(spr_mouse_buttons, 4, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key = mouse_button_value.mb_side2)
			{
				draw_sprite_ext(spr_mouse_buttons, 5, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key = mouse_button_value.mwheel_down) /* Mouse Wheel Down */
			{
				draw_sprite_ext(spr_mouse_buttons, 6, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key = mouse_button_value.mwheel_up) /* Mouse Wheel Up */
			{
				draw_sprite_ext(spr_mouse_buttons, 7, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key != 0)
			{
				draw_sprite_ext(spr_keyboard_keys, remapping_player_key, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.45);
			}
		}
		#endregion /* Remap Keyboard Key 1 END */
		
		#region /* Remap Keyboard Key 2 */
		if (menu == menu_string)
		and (menu_remap_key_number = 2)
		{
			if (remapping_player_key2 == 0)
			or (remapping_player_key2 == noone)
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 0.5);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_left)
			{
				draw_sprite_ext(spr_mouse_buttons, 1, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_middle)
			{
				draw_sprite_ext(spr_mouse_buttons, 2, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_right)
			{
				draw_sprite_ext(spr_mouse_buttons, 3, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_side1)
			{
				draw_sprite_ext(spr_mouse_buttons, 4, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_side2)
			{
				draw_sprite_ext(spr_mouse_buttons, 5, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mwheel_down) /* Mouse Wheel Down */
			{
				draw_sprite_ext(spr_mouse_buttons, 6, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mwheel_up) /* Mouse Wheel Up */
			{
				draw_sprite_ext(spr_mouse_buttons, 7, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			if (remapping_player_key2 != 0)
			{
				draw_sprite_ext(spr_keyboard_keys, remapping_player_key2, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x + 200, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 0.5);
			}
		}
		else
		{
			if (remapping_player_key2 == 0)
			or (remapping_player_key2 == noone)
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.45);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_left)
			{
				draw_sprite_ext(spr_mouse_buttons, 1, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_middle)
			{
				draw_sprite_ext(spr_mouse_buttons, 2, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_right)
			{
				draw_sprite_ext(spr_mouse_buttons, 3, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_side1)
			{
				draw_sprite_ext(spr_mouse_buttons, 4, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mb_side2)
			{
				draw_sprite_ext(spr_mouse_buttons, 5, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mwheel_down) /* Mouse Wheel Down */
			{
				draw_sprite_ext(spr_mouse_buttons, 6, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key2 = mouse_button_value.mwheel_up) /* Mouse Wheel Up */
			{
				draw_sprite_ext(spr_mouse_buttons, 7, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			if (remapping_player_key2 != 0)
			{
				draw_sprite_ext(spr_keyboard_keys, remapping_player_key2, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, key_x + 200, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.45);
			}
		}
		#endregion /* Remap Keyboard Key 2 END */
		
	}
	
	#region /* OR text */
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(key_x + 100, menu_y_remap_key + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	#endregion /* OR text END */
	
	#region /* Mouse Navigation */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, key_x - 34, menu_y_remap_key + menu_y_offset - 32, key_x + 32, menu_y_remap_key + menu_y_offset + 32))
	and (input_key == false)
	and (open_dropdown == false)
	and (global.controls_used_for_menu_navigation == "mouse")
	{
		menu = menu_string;
		menu_remap_key_number = 0;
		can_navigate_settings_sidebar = false;
	}
	if (point_in_rectangle(mouse_get_x, mouse_get_y, key_x + 200 - 34, menu_y_remap_key + menu_y_offset - 32, key_x + 200 + 32, menu_y_remap_key + menu_y_offset + 32))
	and (input_key == false)
	and (open_dropdown == false)
	and (global.controls_used_for_menu_navigation == "mouse")
	{
		menu = menu_string;
		menu_remap_key_number = 2;
		can_navigate_settings_sidebar = false;
	}
	if (point_in_rectangle(mouse_get_x, mouse_get_y, key_x - 34, menu_y_remap_key + menu_y_offset - 32, key_x + 32, menu_y_remap_key + menu_y_offset + 32))
	or (point_in_rectangle(mouse_get_x, mouse_get_y, key_x + 200 - 34, menu_y_remap_key + menu_y_offset - 32, key_x + 200 + 32, menu_y_remap_key + menu_y_offset + 32))
	{
		if (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (menu_delay == 0)
		and (input_key == false)
		and (open_dropdown == false)
		{
			can_navigate_settings_sidebar = false;
			menu_delay = 3;
			input_key = true;
		}
	}
	#endregion /* Mouse Navigation END */
	
	#region /* Other Remap Code */
	if (menu == menu_string)
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		menu_cursor_y_position = menu_y_remap_key;
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(410, menu_y_remap_key + menu_y_offset, l10n_text(name_string), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key == true)
		and (can_remap_key == false)
		and (menu_delay == 0)
		{
			if (global.settings_sidebar_menu == "controller_settings")
			{
				scr_remapping_gamepad();
			}
			else
			if (global.settings_sidebar_menu == "keyboard_and_mouse_settings")
			{
				scr_remapping_keyboard();
			}
			menu_delay = 3; /* Set menu delay after the keyboard remapping script */
		}
		else
		if (key_a_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			input_key = true;
		}
	}
	else
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(410, menu_y_remap_key + menu_y_offset, l10n_text(name_string), global.default_text_size, c_menu_outline, c_menu_fill, 0.9);
	}
	#endregion /* Other Remap Code END */
	
}