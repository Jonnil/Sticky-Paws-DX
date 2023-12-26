function draw_menu_button_sprite(spr_index, x_position, y_position, x_origin_offset, y_origin_offset, xscale, yscale, spr_width, spr_height, string_text, menu_index, menu_takes_you_to, show_arrows = true, highlight_color = c_lime, alpha = 1)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Button */
	
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 2, x_position + spr_width - 1, y_position + spr_height))
	&& (global.controls_used_for_navigation == "mouse")
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (!open_dropdown)
	|| (menu == menu_index)
	&& (global.controls_used_for_navigation != "mouse")
	&& (!open_dropdown)
	{
		if (menu_delay == 0 && menu_joystick_delay == 0) /* Only change menu when "menu delay" is 0, otherwise there could be weird menu bugs that happen when you hover over a button when game needs to load code */
		{
			menu = menu_index;
		}
		if (menu == menu_index)
		{
			if (sprite_exists(spr_index))
			{
				draw_sprite_ext(spr_index, global.menu_button_subimg, x_position + x_origin_offset, y_position + 21 + y_origin_offset, xscale, yscale, 0, highlight_color, alpha);
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(x_position + (spr_width * 0.5), y_position + (spr_height * 0.5), string(string_text), global.default_text_size, c_black, c_white, 1); /* White text inside the menu button */
			if (show_arrows)
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position - 24, y_position + (spr_height * 0.5), 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + spr_width + 24, y_position + (spr_height * 0.5), 1, 1, 180, c_white, 1);
			}
		}
	}
	else
	{
		if (sprite_exists(spr_index))
		{
			draw_sprite_ext(spr_index, global.menu_button_subimg, x_position + x_origin_offset, y_position + 21 + y_origin_offset, xscale, yscale, 0, c_white, alpha);
			if (highlight_color != c_lime)
			{
				draw_sprite_ext(spr_index, global.menu_button_subimg, x_position + x_origin_offset, y_position + 21 + y_origin_offset, xscale, yscale, 0, highlight_color, 0.1);
			}
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x_position + (spr_width * 0.5), y_position + (spr_height * 0.5), string(string_text), global.default_text_size, c_white, c_black, 1); /* Black text inside the menu button */
	}

	#region /* Clicking the menu button */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 2, x_position + spr_width - 1, y_position + spr_height) && menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (menu_takes_you_to != false)
		|| (menu_takes_you_to != noone)
		|| (menu_takes_you_to != "")
		|| (menu_takes_you_to != menu_index)
		{
			if (mouse_check_button_released(mb_left))
			&& (!open_dropdown)
			{
				menu = menu_takes_you_to;
			}
		}
	}
	#endregion /* Clicking the menu button END */
	
	#endregion /* Button END */
	
}