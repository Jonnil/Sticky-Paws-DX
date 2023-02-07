/// @function draw_menu_button_sprite(sprite_index, x, y, x_origin_offset, y_origin_offset, xscale, yscale, width, height, string, menu_index, menu_takes_you_to, show_arrows)
/// @description draw_menu_button_sprite(sprite_index, x, y, x_origin_offset, y_origin_offset, xscale, yscale, width, height, string, menu_index, menu_takes_you_to, show_arrows)
/// @param sprite_index
/// @param x
/// @param y
/// @param x_origin_offset
/// @param y_origin_offset
/// @param xscale
/// @param yscale
/// @param width
/// @param height
/// @param string
/// @param menu_index
/// @param menu_takes_you_to
/// @param show_arrows

function draw_menu_button_sprite(spr_index, x_position, y_position, x_origin_offset, y_origin_offset, xscale, yscale, spr_width, spr_height, string_text, menu_index, menu_takes_you_to, show_arrows = true)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Button */
	
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 2, x_position + spr_width - 1, y_position + spr_height))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (menu_delay == 0)
	or (menu == menu_index)
	and (global.controls_used_for_menu_navigation == "keyboard")
	or (menu == menu_index)
	and (global.controls_used_for_menu_navigation == "controller")
	{
		menu = menu_index;
		if (spr_index >= 0)
		{
			draw_sprite_ext(spr_index, 0, x_position + x_origin_offset, y_position + 21 + y_origin_offset, xscale, yscale, 0, c_lime, 1);
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x_position + (spr_width * 0.5), y_position + (spr_height * 0.5), string(string_text), global.default_text_size, c_black, c_white, 1); /* White text inside the menu button */
		if (show_arrows == true)
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position - 24, y_position + (spr_height * 0.5), 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + spr_width + 24, y_position + (spr_height * 0.5), 1, 1, 180, c_white, 1);
		}
	}
	else
	{
		if (spr_index >= 0)
		{
			draw_sprite_ext(spr_index, 0, x_position + x_origin_offset, y_position + 21 + y_origin_offset, xscale, yscale, 0, c_white, 1);
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x_position + (spr_width * 0.5), y_position + (spr_height * 0.5), string(string_text), global.default_text_size, c_white, c_black, 1); /* Black text inside the menu button */
	}

	#region /* Clicking the menu button */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 2, x_position + spr_width - 1, y_position + spr_height))
	{
		if (menu_takes_you_to == false)
		or (menu_takes_you_to == noone)
		or (menu_takes_you_to == "")
		or (menu_takes_you_to == menu_index)
		{
			if (mouse_check_button(mb_left))
			{
				menu = menu_index;
			}
		}
		else
		{
			if (mouse_check_button_released(mb_left))
			{
				menu = menu_takes_you_to;
			}
		}
	}
	#endregion /* Clicking the menu button END */
	
	#endregion /* Button END */
	
}