function scr_draw_welcome_to_level_editor_menu()
{
	
	#region /* Welcome to Level Editor screen */
	if (welcome_to_level_editor == 1)
	{
		if (menu != "welcome_screen_shortcuts")
		&& (menu != "welcome_screen_close")
		{
			menu = "welcome_screen_close";
		}
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(display_get_gui_width() * 0.5 - 350, display_get_gui_height() * 0.5 - 200, display_get_gui_width() * 0.5 + 350, display_get_gui_height() * 0.5 + 200, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 42 - 126, l10n_text("Welcome to the level editor!"), global.default_text_size, c_black, c_white, 1);
		draw_set_halign(fa_left);
		if (global.controls_used_for_navigation == "gamepad")
		{
			/* Left */ scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.left], display_get_gui_width() * 0.5 - 42 - 42 - 42 - 42, display_get_gui_height() * 0.5 - 126, 0.5, c_white, 1);
			/* Up */ scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.up], display_get_gui_width() * 0.5 - 42 - 42 - 42, display_get_gui_height() * 0.5 - 126, 0.5, c_white, 1);
			/* Right */ scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.right], display_get_gui_width() * 0.5 - 42 - 42, display_get_gui_height() * 0.5 - 126, 0.5, c_white, 1);
			/* Down */ scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.down], display_get_gui_width() * 0.5 - 42, display_get_gui_height() * 0.5 - 126, 0.5, c_white, 1);
			/* Scroll Toolbar Up */ scr_draw_gamepad_buttons(button_scroll_object_left, display_get_gui_width() * 0.5 - 42 - 42 - 84, display_get_gui_height() * 0.5 + 42 - 126, 0.5, c_white, 1);
			/* Scroll Toolbar Down */ scr_draw_gamepad_buttons(button_scroll_object_right, display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 + 42 - 126, 0.5, c_white, 1);
			/* Place Objects */ scr_draw_gamepad_buttons(button_draw, display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 + 42 + 42 - 126, 0.5, c_white, 1);
			/* Delete Objects */ scr_draw_gamepad_buttons(button_erase, display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 + 42 + 42 + 42 - 126, 0.5, c_white, 1);
			/* Click on Object to Change Object Property */ scr_draw_gamepad_buttons(button_draw, display_get_gui_width() * 0.5 - 42 - 42 - 42 - 42 - 42 + 16 - 84, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 - 126, 0.5, c_white, 1);
		}
		else
		{
			/* Middle Mouse Button */ draw_sprite_ext(spr_mouse_buttons, 2, display_get_gui_width() * 0.5 - 42 - 42 - 42 - 42 - 42, display_get_gui_height() * 0.5 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Left */ draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.left], display_get_gui_width() * 0.5 - 42 - 42 - 42 - 42, display_get_gui_height() * 0.5 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Up */ draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.up], display_get_gui_width() * 0.5 - 42 - 42 - 42, display_get_gui_height() * 0.5 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Right */ draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.right], display_get_gui_width() * 0.5 - 42 - 42, display_get_gui_height() * 0.5 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Down */ draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.down], display_get_gui_width() * 0.5 - 42, display_get_gui_height() * 0.5 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Scroll Toolbar Up */ draw_sprite_ext(spr_mouse_buttons, 7, display_get_gui_width() * 0.5 - 42 - 42 - 84, display_get_gui_height() * 0.5 + 42 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Scroll Toolbar Down */ draw_sprite_ext(spr_mouse_buttons, 6, display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 + 42 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Place Objects */ draw_sprite_ext(spr_mouse_buttons, 1, display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 + 42 + 42 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Delete Objects */ draw_sprite_ext(spr_mouse_buttons, 3, display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 + 42 + 42 + 42 - 126, 0.5, 0.5, 0, c_white, 1);
			/* Click on Object to Change Object Property */ draw_sprite_ext(spr_mouse_buttons, 1, display_get_gui_width() * 0.5 - 42 - 42 - 42 - 42 - 42 + 16 - 84, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 - 126, 0.5, 0.5, 0, c_white, 1);
		}
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 126, ": " + l10n_text("Move Around"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 + 42 - 126, ": " + l10n_text("Scroll Toolbar"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 + 42 + 42 - 126, ": " + l10n_text("Place Objects"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 + 42 + 42 + 42 - 126, ": " + l10n_text("Delete Objects"), global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 42 - 42 - 42 - 42 - 42 - 42, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 - 126, l10n_text("on objects") + " : " + l10n_text("Change object property"), global.default_text_size, c_black, c_white, 1);
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 - 126, l10n_text("Select objects from toolbar and start making!"), global.default_text_size, c_black, c_white, 1);
		if (global.controls_used_for_navigation != "gamepad")
		{
			draw_menu_button_sprite(spr_menu_button, display_get_gui_width() * 0.5 - 290, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, 0, 0, 0.5, 1, 185, 42, l10n_text("Shortcuts"), "welcome_screen_shortcuts", "welcome_screen_shortcuts");
		}
		draw_menu_button_sprite(spr_menu_button, display_get_gui_width() * 0.5 + 90, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, 0, 0, 0.5, 1, 185, 42, l10n_text("Close"), "welcome_screen_close", "welcome_screen_close");
		if (menu == "welcome_screen_shortcuts")
		&& (global.controls_used_for_navigation != "gamepad")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() * 0.5 - 290, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, display_get_gui_width() * 0.5 - 290 + 185, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_pressed(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				place_object_delay_timer = -10;
				welcome_to_level_editor = 2;
			}
			if (key_right)
			{
				menu = "welcome_screen_close";
			}
		}
		else
		if (menu == "welcome_screen_close")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() * 0.5 + 90, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, display_get_gui_width() * 0.5 + 90 + 185, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_pressed(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (level_editor_menu == "help_open")
				{
					level_editor_menu = "help";
				}
				menu_delay = 3;
				place_object_delay_timer = -10;
				welcome_to_level_editor = false;
			}
			if (key_left)
			{
				menu = "welcome_screen_shortcuts";
			}
		}
	}
	else
	if (welcome_to_level_editor == 2)
	{
		if (menu != "welcome_screen_shortcuts")
		&& (menu != "welcome_screen_close")
		{
			menu = "welcome_screen_close";
		}
		var line_y = 0;
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(display_get_gui_width() * 0.5 - 350, display_get_gui_height() * 0.5 - 200, display_get_gui_width() * 0.5 + 350, display_get_gui_height() * 0.5 + 200, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 42 - 126, l10n_text("Editor Shortcuts"), global.default_text_size, c_black, c_white, 1);
		draw_set_halign(fa_left);
		
		//draw_sprite_ext(spr_keyboard_keys, ord("L"), display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 - 126 + line_y, 0.5, 0.5, 0, c_white, 1);
		//scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 - 126 + line_y, ": " + l10n_text("Switch Layers"), global.default_text_size, c_black, c_white, 1);
		//line_y += 42;
		
		draw_sprite_ext(spr_keyboard_keys, ord("G"), display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 - 126 + line_y, 0.5, 0.5, 0, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 - 126 + line_y, ": " + l10n_text("Toggle Grid"), global.default_text_size, c_black, c_white, 1);
		line_y += 42;
		
		draw_sprite_ext(spr_keyboard_keys, ord("T"), display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 - 126 + line_y, 0.5, 0.5, 0, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 - 126 + line_y, ": " + l10n_text("Hide/Show Toolbar"), global.default_text_size, c_black, c_white, 1);
		line_y += 42;
		
		draw_sprite_ext(spr_keyboard_keys, vk_shift, display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 - 126 + line_y, 0.5, 0.5, 0, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 - 126 + line_y, ": " + l10n_text("Slow Scroll"), global.default_text_size, c_black, c_white, 1);
		line_y += 42;
		
		draw_sprite_ext(spr_keyboard_keys, ord("B"), display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 - 126 + line_y, 0.5, 0.5, 0, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 - 126 + line_y, ": " + l10n_text("Hide/Show Backgrounds"), global.default_text_size, c_black, c_white, 1);
		line_y += 42;
		
		draw_sprite_ext(spr_keyboard_keys, ord("E"), display_get_gui_width() * 0.5 - 42 - 84, display_get_gui_height() * 0.5 - 126 + line_y, 0.5, 0.5, 0, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 - 84, display_get_gui_height() * 0.5 - 126 + line_y, ": " + l10n_text("Change to erase tool"), global.default_text_size, c_black, c_white, 1);
		
		/* Back and Close buttons */
		draw_menu_button_sprite(spr_menu_button, display_get_gui_width() * 0.5 - 290, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, 0, 0, 0.5, 1, 185, 42, l10n_text("Back"), "welcome_screen_shortcuts", "welcome_screen_shortcuts");
		draw_menu_button_sprite(spr_menu_button, display_get_gui_width() * 0.5 + 90, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, 0, 0, 0.5, 1, 185, 42, l10n_text("Close"), "welcome_screen_close", "welcome_screen_close");
		if (menu == "welcome_screen_shortcuts")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() * 0.5 - 290, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, display_get_gui_width() * 0.5 - 290 + 185, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_pressed(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				place_object_delay_timer = -10;
				welcome_to_level_editor = 1;
			}
			if (key_right)
			{
				menu = "welcome_screen_close";
			}
		}
		else
		if (menu == "welcome_screen_close")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() * 0.5 + 90, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126, display_get_gui_width() * 0.5 + 90 + 185, display_get_gui_height() * 0.5 + 42 + 42 + 42 + 42 + 42 + 42 - 126 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_pressed(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (level_editor_menu == "help_open")
				{
					level_editor_menu = "help";
				}
				menu_delay = 3;
				place_object_delay_timer = -10;
				welcome_to_level_editor = false;
			}
			if (key_left)
			{
				menu = "welcome_screen_shortcuts";
			}
		}
	}
	#endregion /* Welcome to Level Editor screen END */
	
}