/// @description draw_menu_checkmark(x, y, string, menu_index);
/// @param x
/// @param y
/// @param string
/// @param menu_index

function draw_language_checkmark(x_position, y_position, string_text, menu_index)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Checkmark */
	
	#region /* Initialize variables */
	var widen_button_offset = 7;
	var width_of_button = 670;
	#endregion /* Initialize variables END */
	
	if (global.language_localization != real(string_delete(menu_index, 1, 8))-1)
	{
		if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (menu != "assist_enable")
		and (input_key == false)
		and (open_dropdown == false)
		or (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.assist_enable == true)
		and (menu == "assist_enable")
		and (input_key == false)
		and (open_dropdown == false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			draw_sprite_ext(spr_menu_checkmark, 0, x_position + 42, y_position, 1, 1, 0, c_lime, 1);
			{
				menu = menu_index;
				language_index = real(string_delete(menu_index, 1, 8))
				can_navigate_settings_sidebar = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark, 0, x_position + 42, y_position, 1, 1, 0, c_white, 1);
		}
	}
	else
	{
		if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (menu != "assist_enable")
		and (input_key == false)
		and (open_dropdown == false)
		or (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (global.assist_enable == true)
		and (menu == "assist_enable")
		and (input_key == false)
		and (open_dropdown == false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			draw_sprite_ext(spr_menu_checkmark, 1, x_position + 42, y_position, 1, 1, 0, c_lime, 1);
			if (input_key = false)
			and (open_dropdown == false)
			{
				menu = menu_index;
				language_index = real(string_delete(menu_index, 1, 8))
				can_navigate_settings_sidebar = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark, 1, x_position + 42, y_position, 1, 1, 0, c_white, 1);
		}
	}
	
	#region /* Show a menu cursor when the option is highlighted */
	if (menu == menu_index)
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position + 16, y_position + 16, 1, 1, 0, c_white, 1);
	}
	#endregion /* Show a menu cursor when the option is highlighted END */
	
	#region /* Clicking the menu button */
	if (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
	and (mouse_check_button_released(mb_left))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (menu != "assist_enable")
	and (input_key == false)
	and (open_dropdown == false)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, x_position, y_position - widen_button_offset, x_position + width_of_button, y_position + 32 + widen_button_offset))
	and (mouse_check_button_released(mb_left))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (global.assist_enable == true)
	and (menu == "assist_enable")
	and (input_key == false)
	and (open_dropdown == false)
	{	
		global.language_localization = real(string_delete(menu_index, 1, 8)-1);
		calculate_translation_completion()
		language_index = real(string_delete(menu_index, 1, 8))
		menu = menu_index;
		can_navigate_settings_sidebar = false;
	}
	#endregion /* Clicking the menu button END */

	#region /* Text inside the menu button */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x_position + 82, y_position + 16, string(string_text), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	#endregion /* Text inside the menu button END */
	
	#endregion /* Checkmark END */
}