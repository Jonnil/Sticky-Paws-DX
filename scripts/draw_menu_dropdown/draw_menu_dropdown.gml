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
/// @param ...

function draw_menu_dropdown()
{
	
	#region /*Button*/
	
	#region /*Initialize variables*/
	var x_position=argument0;/*The buttons x origin position*/
	var y_position=argument1;/*The buttons y origin position*/

	var string_text = argument2;
	var menu_index = argument3;
	var variable_to_change = argument4;
	var string_text_item1 = argument5;
	var string_text_item2 = argument6;
	var string_text_item3 = argument7;
	var string_text_item4 = argument8;
	var string_text_item5 = argument9;
	var string_text_item6 = argument10;
	var string_text_item7 = argument11;
	var string_text_item8 = argument12;
	var string_text_item9 = argument13;
	var string_text_item10 = argument14;
	var string_text_item11 = argument15;
	var clicked_on = false;
	#endregion /*Initialize variables END*/
	
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+32,y_position+2,x_position+555+32,y_position+41))
	and (global.controls_used_for_menu_navigation="mouse")
	and (menu_delay = 0)
	and (open_dropdown = false)
	{
		if (open_dropdown = false)
		{
			menu = menu_index;
		}
		can_navigate_settings_sidebar = false;
		draw_sprite_ext(spr_menu_dropdown,0,x_position+32,y_position+21,1,1,0,c_lime,1);
	}
	else
	{
		if (menu=menu_index)
		and(global.controls_used_for_menu_navigation="keyboard")
		//and (open_dropdown = false)
		or (menu=menu_index)
		and(global.controls_used_for_menu_navigation="controller")
		//and (open_dropdown = false)
		{
			draw_sprite_ext(spr_menu_dropdown,0,x_position+32,y_position+21,1,1,0,c_gray,1);
		}
		else
		//if (open_dropdown = false)
		{
			draw_sprite_ext(spr_menu_dropdown,0,x_position+32,y_position+21,1,1,0,c_white,1);
		}
	}
	
	#region /*Show a menu cursor when the option is highlighted*/
	if (menu = menu_index)
	and (global.controls_used_for_menu_navigation = "keyboard")
	or (menu = menu_index)
	and (global.controls_used_for_menu_navigation = "controller")
	{
		draw_sprite_ext(spr_menu_cursor, menu_cursor_index, x_position+16, y_position+24, 1, 1, 0, c_white, 1);
	}
	#endregion /*Show a menu cursor when the option is highlighted END*/
	
	#region /*Clicking the menu button*/
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+32,y_position+2,x_position+555+32,y_position+41))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay = 0)
	and (open_dropdown = false)
	{
		menu = menu_index;
		can_navigate_settings_sidebar = false;
		open_dropdown = true;
		menu_delay = 3;
	}
	#endregion /*Clicking the menu button END*/
	
	#region /*Text above the menu button*/
	//if (open_dropdown = false)
	//or (open_dropdown = true)
	//and (menu = menu_index)
	//{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_outlined(x_position+277+32,y_position+21-32,string(string_text),global.default_text_size,c_white,c_black,1);
	//}
	#endregion /*Text above the menu button END*/
	
	#region /*Text inside the menu button*/
	//if (open_dropdown = false)
	//{
		if (variable_to_change = 0)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item1),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 1)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item2),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 2)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item3),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 3)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item4),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 4)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item5),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 5)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item6),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 6)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item7),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 7)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item8),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 8)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item9),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 9)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item10),global.default_text_size,c_white,c_black,1);
		}
		else
		if (variable_to_change = 10)
		{
			draw_text_outlined(x_position+277+32,y_position+21,string(string_text_item11),global.default_text_size,c_white,c_black,1);
		}
	//}
	#endregion /*Text inside the menu button END*/
	
	#region /*Open dropdown menu*/
	if (open_dropdown = true)
	and (menu = menu_index)
	{
		draw_menu_dropdown_item(string_text_item1, x_position+32, y_position, variable_to_change, 0);
		draw_menu_dropdown_item(string_text_item2, x_position+32, y_position, variable_to_change, 1);
		draw_menu_dropdown_item(string_text_item3, x_position+32, y_position, variable_to_change, 2);
		draw_menu_dropdown_item(string_text_item4, x_position+32, y_position, variable_to_change, 3);
		draw_menu_dropdown_item(string_text_item5, x_position+32, y_position, variable_to_change, 4);
		draw_menu_dropdown_item(string_text_item6, x_position+32, y_position, variable_to_change, 5);
		draw_menu_dropdown_item(string_text_item7, x_position+32, y_position, variable_to_change, 6);
		draw_menu_dropdown_item(string_text_item8, x_position+32, y_position, variable_to_change, 7);
		draw_menu_dropdown_item(string_text_item9, x_position+32, y_position, variable_to_change, 8);
		draw_menu_dropdown_item(string_text_item10, x_position+32, y_position, variable_to_change, 9);
		draw_menu_dropdown_item(string_text_item11, x_position+32, y_position, variable_to_change, 10);
	}
	#endregion /*Open dropdown menu END*/
	
	#endregion /*Button END*/
	
	#region /*Clicking outside the menu button*/
	if (!point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position+32,y_position+2,x_position+555+32,y_position+41))
	and (open_dropdown = true)
	and (menu = menu_index)
	and (menu_delay = 0)
	{
		if (mouse_check_button_pressed(mb_left))
		{
			open_dropdown = false;
			menu_delay = 3;
		}
	}
	#endregion /*Clicking outside the menu button END*/
}