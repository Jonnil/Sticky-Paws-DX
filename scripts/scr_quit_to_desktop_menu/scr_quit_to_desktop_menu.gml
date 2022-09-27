/// @desc scr_quit_to_desktop_menu(return_to_this_menu)
/// @arg return_to_this_menu
function scr_quit_to_desktop_menu(argument0)
{
	
	#region /*Quit to Desktop menu*/
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (menu = "quit_game_no")
	or(menu = "quit_game_yes")
	{
		draw_text_outlined(window_get_width() / 2, window_get_height() / 2 - 128, l10n_text("ARE YOU SURE YOU WANT TO QUIT?"), global.default_text_size * 1.9, c_white, c_black, 1);
	
		#region /*Quit No*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 42))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			if (mouse_check_button(mb_left))
			and (menu_delay = 0)
			{
				menu = "quit_game_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_lime, 1);
			draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu = "quit_game_no")
			and (global.controls_used_for_menu_navigation = "keyboard")
			or(menu = "quit_game_no")
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_lime, 1);
				draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2, 2, 2, 0, c_white, 1);
				draw_text_outlined(window_get_width() / 2, window_get_height() / 2, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 370 + 32, window_get_height() / 2, 1, 1, 0, c_white, 1);
			}
		}
	
		if (menu = "quit_game_no")
		{		
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			or(key_a_pressed)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = argument0; /*Return to overall quit menu*/
			}
			if (key_up)
			and (!key_down)
			and (menu_delay <= 0)
			and (menu_joystick_delay <= 0)
			or(key_down)
			and (!key_up)
			and (menu_delay <= 0)
			and (menu_joystick_delay <= 0)
			{
				menu_delay = 3;
				menu = "quit_game_yes";
			}
		}
		#endregion /*Quit No END*/
	
		#region /*Quit Yes*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 + 84 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 84 + 42))
		and (global.controls_used_for_menu_navigation = "mouse")
		{
			if (mouse_check_button(mb_left))
			and (menu_delay = 0)
			{
				menu = "quit_game_yes";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2 + 84, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2 + 84, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_lime, 1);
			draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
		}
		else
		{
			if (menu = "quit_game_yes")
			and (global.controls_used_for_menu_navigation = "keyboard")
			or(menu = "quit_game_yes")
			and (global.controls_used_for_menu_navigation = "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 - 370 - 32, window_get_height() / 2 + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, window_get_width() / 2 + 370 + 32, window_get_height() / 2 + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_lime, 1);
				draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, window_get_width() / 2 - 370, window_get_height() / 2 + 84, 2, 2, 0, c_white, 1);
				draw_text_outlined(window_get_width() / 2, window_get_height() / 2 + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
			}
		}

		if (menu = "quit_game_yes")
		{
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 370, window_get_height() / 2 + 84 - 42, window_get_width() / 2 + 370, window_get_height() / 2 + 84 + 42))
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay = 0)
			or(key_a_pressed)
			and (menu_delay = 0)
			{
				game_end();
			}
			if (key_up)
			and (!key_down)
			and (menu_delay <= 0)
			and (menu_joystick_delay <= 0)
			or(key_down)
			and (!key_up)
			and (menu_delay <= 0)
			and (menu_joystick_delay <= 0)
			{
				menu_delay = 1;
				menu = "quit_game_no";
			}
		}
		#endregion /*Quit Yes END*/
	
		#region /*Return to game*/
		if (menu = "quit_game_no")
		or(menu = "quit_game_yes")
		{
			if (key_b_pressed)
			and (menu_delay = 0)
			{
				menu_delay = 3;
				menu = argument0; /*Return to overall quit menu*/
			}
		}
		#endregion /*Return to game END*/
	
	}
	#endregion /*Quit to Desktop menu END*/
	
}