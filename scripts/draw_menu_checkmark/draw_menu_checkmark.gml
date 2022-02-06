/// @description draw_menu_checkmark(x, y,string, menu_index,variable_to_check,bottom_text);
/// @param x
/// @param y
/// @param string
/// @param menu_index
/// @param variable_to_check
/// @param bottom_text

function draw_menu_checkmark()
{
	#region /*Checkmark*/
	
	#region /*Initialize variables*/
	var x_position =argument0; /*The buttons x origin position*/
	var y_position =argument1; /*The buttons y origin position*/

	var string_text =argument2;
	var menu_index =argument3;
	var variable_to_check=argument4;
	var bottom_text =argument5;
	var clicked_on = false;
	var hover_over_button = false;
	var widen_button_offset = 7;
	var width_of_button = 670;
	#endregion /*Initialize variables END*/
	
	if (variable_to_check= false)
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position,y_position-widen_button_offset, x_position+ width_of_button,y_position+ 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (menu != "assist_enable")
		and (input_key = false)
		and (open_dropdown = false)
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position,y_position-widen_button_offset, x_position+ width_of_button,y_position+ 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.assist_enable = true)
		and (menu = "assist_enable")
		and (input_key = false)
		and (open_dropdown = false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(x_position, y_position-widen_button_offset, x_position+ width_of_button, y_position+ 32 + widen_button_offset, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			draw_sprite_ext(spr_menu_checkmark, 0, x_position+ 42,y_position, 1, 1, 0, c_lime, 1);
			{
				menu = menu_index;
				can_navigate_settings_sidebar = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark, 0, x_position+ 42,y_position, 1, 1, 0, c_white, 1);
		}
	}
	else
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position,y_position-widen_button_offset, x_position+ width_of_button,y_position+ 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (menu != "assist_enable")
		and (input_key = false)
		and (open_dropdown = false)
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position,y_position-widen_button_offset, x_position+ width_of_button,y_position+ 32 + widen_button_offset))
		and (global.controls_used_for_menu_navigation = "mouse")
		and (global.assist_enable = true)
		and (menu = "assist_enable")
		and (input_key = false)
		and (open_dropdown = false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(x_position, y_position-widen_button_offset, x_position+ width_of_button, y_position+ 32 + widen_button_offset, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			draw_sprite_ext(spr_menu_checkmark, 1, x_position+ 42,y_position, 1, 1, 0, c_lime, 1);
			if (input_key = false)
			and (open_dropdown = false)
			{
				menu = menu_index;
				can_navigate_settings_sidebar = false;
			}
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark, 1, x_position+ 42,y_position, 1, 1, 0, c_white, 1);
		}
	}
	
	#region /*Show a menu cursor when the option is highlighted*/
	if (menu = menu_index)
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position+ 16, y_position+ 16, 1, 1, 0, c_white, 1);
	}
	#endregion /*Show a menu cursor when the option is highlighted END*/
	
	#region /*Clicking the menu button*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position,y_position-widen_button_offset, x_position+ width_of_button,y_position+ 32 + widen_button_offset))
	and (mouse_check_button_pressed(mb_left))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (menu != "assist_enable")
	and (input_key = false)
	and (open_dropdown = false)
	or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x_position,y_position-widen_button_offset, x_position+ width_of_button,y_position+ 32 + widen_button_offset))
	and (mouse_check_button_pressed(mb_left))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (global.assist_enable = true)
	and (menu = "assist_enable")
	and (input_key = false)
	and (open_dropdown = false)
	{
		menu = menu_index;
		can_navigate_settings_sidebar = false;
	}
	#endregion /*Clicking the menu button END*/

	#region /*Text inside the menu button*/
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text_outlined(x_position+82,y_position+ 16,string(string_text), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	#endregion /*Text inside the menu button END*/
	
	#region /*Bottom Text*/
	if (menu=menu_index)
	and (bottom_text> noone)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_alpha(0.5);
		draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 128, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])/ 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 64,string(bottom_text), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /*Bottom Text END*/
	
	#endregion /*Checkmark END*/
}