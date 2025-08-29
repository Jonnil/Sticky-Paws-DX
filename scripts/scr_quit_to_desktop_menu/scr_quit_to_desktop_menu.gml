function scr_quit_to_desktop_menu(return_to_this_menu)
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);

	#region /* Quit to Desktop menu */
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (menu == "quit_game_no")
	|| (menu == "quit_game_yes")
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 128, l10n_text("ARE YOU SURE YOU WANT TO QUIT?"), global.default_text_size * 1.9, c_black, c_white, 1);

		#region /* Quit No */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, get_window_height * 0.5 - 42, get_window_width * 0.5 + 370, get_window_height * 0.5 + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "quit_game_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, get_window_height * 0.5, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, get_window_height * 0.5, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, get_window_height * 0.5, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, get_window_height * 0.5, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "quit_game_no")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "quit_game_no")
			&& (global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, get_window_height * 0.5, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, get_window_height * 0.5, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, get_window_height * 0.5, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, get_window_height * 0.5, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, get_window_height * 0.5, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, get_window_height * 0.5, 1, 1, 0, c_white, 1);
			}
		}

		if (menu == "quit_game_no")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, get_window_height * 0.5 - 42, get_window_width * 0.5 + 370, get_window_height * 0.5 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = return_to_this_menu; /* Return to overall quit menu */
			}
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_game_yes";
			}
		}
		#endregion /* Quit No END */

		#region /* Quit Yes */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, get_window_height * 0.5 + 84 - 42, get_window_width * 0.5 + 370, get_window_height * 0.5 + 84 + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "quit_game_yes";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, get_window_height * 0.5 + 84, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, get_window_height * 0.5 + 84, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, get_window_height * 0.5 + 84, 2, 2, 0, c_red, 1);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
		}
		else
		{
			if (menu == "quit_game_yes")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "quit_game_yes")
			&& (global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, get_window_height * 0.5 + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, get_window_height * 0.5 + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, get_window_height * 0.5 + 84, 2, 2, 0, c_red, 1);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, get_window_height * 0.5 + 84, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
			}
		}

		if (menu == "quit_game_yes")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, get_window_height * 0.5 + 84 - 42, get_window_width * 0.5 + 370, get_window_height * 0.5 + 84 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				game_end();
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 1;
				menu = "quit_game_no";
			}
		}
		#endregion /* Quit Yes END */

		#region /* Return to game */
		if (menu == "quit_game_no")
		|| (menu == "quit_game_yes")
		{
			if (key_b_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (global.enable_option_for_pc)
			|| (!global.enable_option_for_pc)
			{
				menu_delay = 3;
				menu = return_to_this_menu; /* Return to overall quit menu */
			}
		}
		#endregion /* Return to game END */

	}
	#endregion /* Quit to Desktop menu END */

}
