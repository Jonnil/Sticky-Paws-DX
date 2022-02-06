/// @function draw_menu_dropdown_item(string_text_item, x_position, y_position, variable_to_change, item_number)
/// @description draw_menu_dropdown_item(string_text_item, x_position, y_position, variable_to_change, item_number)
/// @param string_text_item
/// @param x_position
/// @param y_position
/// @param variable_to_change
/// @param item_number

function draw_menu_dropdown_item()
{
	var string_text_item = argument0;
	var x_position = argument1;
	var y_position = argument2;
	var variable_to_change = argument3;
	var item_number = argument4;
	
	#region /*Show Item*/
	if (string_text_item > "")
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position,y_position+ (28 * item_number), x_position+555,y_position+ 27+ (28 * item_number)))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (menu_delay = 0)
		{
			if (variable_to_change = item_number)
			{
				draw_sprite_ext(spr_menu_dropdown_item, 1, x_position, y_position+ 13+ (28 * item_number), 1, 1, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_dropdown_item, 0, x_position, y_position+ 13+ (28 * item_number), 1, 1, 0, c_lime, 1);
			}
			if (mouse_check_button_pressed(mb_left))
			{
				menu_dropdown_variable_to_change(variable_to_change, item_number);
				open_dropdown = false;
				menu_delay = 3;
			}
		}
		else
		{
			if (variable_to_change = item_number)
			{
				draw_sprite_ext(spr_menu_dropdown_item, 1, x_position, y_position+ 13+ (28 * item_number), 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_dropdown_item, 0, x_position, y_position+ 13+ (28 * item_number), 1, 1, 0, c_white, 1);
			}
		}
		#region /*Text inside the menu button*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_outlined(x_position+ 277, y_position+ 13+ (28 * item_number), string(string_text_item), global.default_text_size *0.75, c_white, c_black, 1);
		#endregion /*Text inside the menu button END*/
		
	}
	#endregion /*Show Item END*/
	
}