function scr_draw_name_box(what_string, box_color, white_rectangle_alpha, xx, yy, box_menu = "not_box_menu")
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);

	#region /* Box where name is written on */
	draw_rectangle_color(xx - 150, yy - 16, xx + 150, yy + 16, box_color, box_color, box_color, box_color, false); /* Rectangle where text is written on */
	draw_set_alpha(white_rectangle_alpha);
	draw_rectangle_color(xx - 150, yy - 16, xx + 150, yy + 16, c_white, c_white, c_white, c_white, false); /* White transparent rectangle where text is written on */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, xx - 150, yy - 16, xx + 150, yy + 16) && global.controls_used_for_navigation == "mouse"
	|| menu == box_menu)
	{
		draw_set_alpha(0.5);
		draw_rectangle_color(xx - 150, yy - 16, xx + 150, yy + 16, c_white, c_white, c_white, c_white, false); /* White transparent rectangle highlight when hovering mouse over box */
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, xx - 150 - 16, yy, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, xx + 150 + 16, yy, 1, 1, 180, c_white, 1);
		if (box_menu != "not_box_menu")
		{
			menu = box_menu;
		}
	}
	draw_set_alpha(1);
	draw_rectangle_color(xx - 150, yy - 16, xx + 150, yy + 16, c_black, c_black, c_black, c_black, true); /* Black outline */
	#endregion /* Box where name is written on END */

	#region /* Draw the inputed text */
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(xx, yy, string(what_string), global.default_text_size, c_white, c_black, 1);
	#endregion /* Draw the inputed text END */

}
