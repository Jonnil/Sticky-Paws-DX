function draw_menu_button(x_position, y_position, string_text, menu_index, menu_takes_you_to = "", highlight_color = c_lime, alpha = 1)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var actual_highlight_color, outline_color, fill_color;
	
	var point_in_button = point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position + 1, x_position + 370, y_position + 41);
	var using_mouse = (global.controls_used_for_navigation == "mouse");
	var not_open_dropdown = !open_dropdown;
	var is_same_menu = (menu == menu_index);
	
	if ((point_in_button && using_mouse && not_open_dropdown) || (is_same_menu && !using_mouse && not_open_dropdown))
	{
		if (menu_delay == 0 && menu_joystick_delay == 0) /* Only change menu when "menu delay" is 0, otherwise there could be weird menu bugs that happen when you hover over a button when game needs to load code */
		{
			menu = menu_index;
		}
		
		if (mouse_check_button_released(mb_left) && menu_takes_you_to != false && menu_takes_you_to != noone && menu_takes_you_to != "" && menu_takes_you_to != menu_index && menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = menu_takes_you_to;
		}
		
		actual_highlight_color = highlight_color;
		outline_color = c_black;
		fill_color = c_white;
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position - 24, y_position + 20, 1, 1, 0, c_white, alpha);
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 394, y_position + 20, 1, 1, 180, c_white, alpha);
	}
	else
	{
		actual_highlight_color = c_white;
		outline_color = c_white;
		fill_color = c_black;
	}
	
	var text_scale = (string_width(string_text) >= 360) ? 0.7 : 1;
	
	draw_sprite_ext(spr_menu_button, global.menu_button_subimg, x_position, y_position + 21, 1, 1, 0, actual_highlight_color, alpha);
	if (highlight_color != c_lime && actual_highlight_color == c_white)
	{
		draw_sprite_ext(spr_menu_button, global.menu_button_subimg, x_position, y_position + 21, 1, 1, 0, highlight_color, 0.1 * alpha);
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x_position + 185, y_position + 21, string(string_text), global.default_text_size * text_scale, outline_color, fill_color, alpha);
	
	if (point_in_button)
	&& (global.controls_used_for_navigation == "mouse")
	&& (mouse_check_button_released(mb_left))
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	|| (menu == menu_index)
	&& (key_a_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		return true;
	}
}