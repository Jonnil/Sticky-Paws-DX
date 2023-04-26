/// @function draw_menu_dropdown(x, y, string, menu_index, variable_to_change, string_item1, string_item2, string_item3, ...)
/// @description draw_menu_dropdown(x, y, string, menu_index, variable_to_change, string_item1, string_item2, string_item3, ...)
/// @param x
/// @param y
/// @param string
/// @param menu_index
/// @param variable_to_cahange
/// @param string_item1
/// @param string_item2
/// @param string_item3
/// ...

/* If you put "= default value" after an argument, then that becomes a optional argument, so no warning will show up when using this script */
function draw_menu_dropdown(x_position, y_position, string_text, menu_index, variable_to_change, string_text_item1 = "", string_text_item2 = "", string_text_item3 = "", string_text_item4 = "", string_text_item5 = "", string_text_item6 = "", string_text_item7 = "", string_text_item8 = "", string_text_item9 = "", string_text_item10 = "", string_text_item11 = "")
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (variable_instance_exists(self, "menu")) /* Check if the object even have these variables before running this code */
	and (variable_instance_exists(self, "menu_delay"))
	and (variable_instance_exists(self, "open_dropdown"))
	{
		
		#region /* Button */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position + 32, y_position + 2, x_position + 555 + 32, y_position + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (menu_delay == 0)
		and (open_dropdown == false)
		{
			if (open_dropdown == false)
			{
				menu = menu_index;
			}
			if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
			{
				can_navigate_settings_sidebar = false;
			}
			draw_sprite_ext(spr_menu_dropdown, 0, x_position + 32, y_position + 21, 1, 1, 0, c_lime, 1);
		}
		else
		{
			if (menu == menu_index)
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == menu_index)
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_dropdown, 0, x_position + 32, y_position + 21, 1, 1, 0, c_gray, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_dropdown, 0, x_position + 32, y_position + 21, 1, 1, 0, c_white, 1);
			}
		}
		
		#region /* Show a menu cursor when the option is highlighted */
		if (menu == menu_index)
		and (open_dropdown == false)
		{
			if (variable_instance_exists(self, "menu_cursor_y_position"))
			{
				menu_cursor_y_position = y_position;
			}
			if (variable_instance_exists(self, "menu_cursor_index"))
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 16, y_position + 24, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_cursor, 0, x_position + 16, y_position + 24, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Show a menu cursor when the option is highlighted END */
		
		#region /* Clicking the menu button */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position + 32, y_position + 2, x_position + 555 + 32, y_position + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (open_dropdown == false)
		or (key_a_pressed)
		and (menu == menu_index)
		and (input_key == false)
		and (open_dropdown == false)
		and (menu_delay == 0)
		{
			menu = menu_index;
			open_dropdown = true;
			menu_delay = 3;
			if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
			{
				can_navigate_settings_sidebar = false;
			}
		}
		else
		if (key_b_pressed)
		and (menu == menu_index)
		and (input_key == false)
		and (open_dropdown == true)
		and (menu_delay == 0)
		{
			menu = menu_index;
			open_dropdown = false;
			menu_delay = 3;
		}
		#endregion /* Clicking the menu button END */
		
		#region /* Text above the menu button */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x_position + 277+ 32, y_position + 21 - 32, string(string_text), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		#endregion /* Text above the menu button END */
		
		#region /* Text inside the menu button */
		if (variable_to_change == 0)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item1), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change == 1)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item2), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change = 2)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item3), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change = 3)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item4), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change = 4)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item5), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change == 5)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item6), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change == 6)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item7), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change == 7)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item8), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change == 8)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item9), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change = 9)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item10), global.default_text_size, c_white, c_black, 1);
		}
		else
		if (variable_to_change = 10)
		{
			scr_draw_text_outlined(x_position + 277+ 32, y_position + 21, string(string_text_item11), global.default_text_size, c_white, c_black, 1);
		}
		#endregion /* Text inside the menu button END */
		
		#region /* Open dropdown menu */
		if (open_dropdown == true)
		and (menu == menu_index)
		{
			if (variable_instance_exists(self, "menu_cursor_y_position"))
			{
				menu_cursor_y_position = y_position + 100;
			}
			draw_menu_dropdown_item(string_text_item1, x_position + 32, y_position, variable_to_change, 0);
			draw_menu_dropdown_item(string_text_item2, x_position + 32, y_position, variable_to_change, 1);
			draw_menu_dropdown_item(string_text_item3, x_position + 32, y_position, variable_to_change, 2);
			draw_menu_dropdown_item(string_text_item4, x_position + 32, y_position, variable_to_change, 3);
			draw_menu_dropdown_item(string_text_item5, x_position + 32, y_position, variable_to_change, 4);
			draw_menu_dropdown_item(string_text_item6, x_position + 32, y_position, variable_to_change, 5);
			draw_menu_dropdown_item(string_text_item7, x_position + 32, y_position, variable_to_change, 6);
			draw_menu_dropdown_item(string_text_item8, x_position + 32, y_position, variable_to_change, 7);
			draw_menu_dropdown_item(string_text_item9, x_position + 32, y_position, variable_to_change, 8);
			draw_menu_dropdown_item(string_text_item10, x_position + 32, y_position, variable_to_change, 9);
			draw_menu_dropdown_item(string_text_item11, x_position + 32, y_position, variable_to_change, 10);
		}
		#endregion /* Open dropdown menu END */
		
		#endregion /* Button END */
		
		#region /* Clicking outside the menu button */
		if (!point_in_rectangle(mouse_get_x, mouse_get_y, x_position + 32, y_position + 2, x_position + 555 + 32, y_position + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (open_dropdown == true)
		and (menu == menu_index)
		and (menu_delay == 0)
		{
			if (mouse_check_button_released(mb_left))
			{
				open_dropdown = false;
				menu_delay = 3;
			}
		}
		#endregion /* Clicking outside the menu button END */
		
	}
	return(variable_to_change);
}