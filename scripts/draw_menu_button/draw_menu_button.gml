/// @function draw_menu_button(x, y, string, menu_index, menu_takes_you_to)
/// @description draw_menu_button(x, y, string, menu_index, menu_takes_you_to)
/// @param x
/// @param y
/// @param string
/// @param menu_index
/// @param menu_takes_you_to

function draw_menu_button(x_position, y_position, string_text, menu_index, menu_takes_you_to)
{
	
	#region /* Button */
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position, y_position + 2, x_position + 370, y_position + 41))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (menu_delay == 0)
	or (menu == menu_index)
	and (global.controls_used_for_menu_navigation == "keyboard")
	or (menu == menu_index)
	and (global.controls_used_for_menu_navigation == "controller")
	{
		menu = menu_index;
		draw_sprite_ext(spr_menu_button, 0, x_position, y_position + 21, 1, 1, 0, c_lime, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (string_width(string_text) >= 360)
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size * 0.7, c_black, c_white, 1); /* White text inside the menu button */
		}
		else
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size, c_black, c_white, 1); /* White text inside the menu button */
		}
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position - 24, y_position + 20, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 394, y_position + 20, 1, 1, 180, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_menu_button, 0, x_position, y_position + 21, 1, 1, 0, c_white, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (string_width(string_text) >= 360)
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size * 0.7, c_white, c_black, 1); /* Black text inside the menu button */
		}
		else
		{
			scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size, c_white, c_black, 1); /* Black text inside the menu button */
		}
	}
	
	#region /* Clicking the menu button */
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position, y_position + 2, x_position + 370, y_position + 41))
	{
		if (menu_takes_you_to = false)
		or (menu_takes_you_to == noone)
		or (menu_takes_you_to = "")
		or (menu_takes_you_to = menu_index)
		{
			if (mouse_check_button(mb_left))
			{
				menu = menu_index;
			}
		}
		else
		{
			if (mouse_check_button_pressed(mb_left))
			and (menu_delay == 0)
			{
				menu = menu_takes_you_to;
			}
		}
	}
	#endregion /* Clicking the menu button END */
	
	#endregion /* Button END */
	
}