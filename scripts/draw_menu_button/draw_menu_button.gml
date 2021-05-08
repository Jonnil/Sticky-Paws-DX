/// @function draw_menu_button(x, y, string, menu_index, menu_takes_you_to)
/// @description draw_menu_button(x,y,string,menu_index,menu_takes_you_to)
/// @param x
/// @param y
/// @param string
/// @param menu_index
/// @param menu_takes_you_to

function draw_menu_button()
{
	#region /*Button*/
	
	#region /*Initialize variables*/
	var x_position=argument0;/*The buttons x origin position*/
	var y_position=argument1;/*The buttons y origin position*/

	var string_text=argument2;
	var menu_index=argument3;
	var menu_takes_you_to=argument4;
	var clicked_on=false;
	#endregion /*Initialize variables END*/
	
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position,y_position+2,x_position+370,y_position+41))
	and(global.controls_used_for_menu_navigation="mouse")
	and(menu_delay = 0)
	{
		//if (keyboard_check(vk_anykey))
		//{
			menu=menu_index;
		//}
		draw_sprite_ext(spr_menu_button,0,x_position,y_position+21,1,1,0,c_lime,1);
	}
	else
	{
		if (menu=menu_index)
		and(global.controls_used_for_menu_navigation="keyboard")
		or (menu=menu_index)
		and(global.controls_used_for_menu_navigation="controller")
		{
			draw_sprite_ext(spr_menu_button,0,x_position,y_position+21,1,1,0,c_gray,1);
		}
		else
		{
			draw_sprite_ext(spr_menu_button,0,x_position,y_position+21,1,1,0,c_white,1);
		}
	}

	#region /*Clicking the menu button*/
	//draw_text_outlined(x_position+400,y_position,"x: "+string(x_position)+" y: "+string(y_position+2)+" x2: "+string(x_position+370)+" y2: "+string(y_position+41),global.default_text_size,c_white,c_black,1);
	
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),x_position,y_position+2,x_position+370,y_position+41))
	{
		if (menu_takes_you_to=false)
		or(menu_takes_you_to=noone)
		or(menu_takes_you_to="")
		or(menu_takes_you_to=menu_index)
		{
			if (mouse_check_button(mb_left))
			{
				menu=menu_index;
			}
		}
		else
		{
			if (mouse_check_button_pressed(mb_left))
			and(menu_delay = 0)
			{
				menu=menu_takes_you_to;
			}
		}
	}
	#endregion /*Clicking the menu button END*/

	#region /*Text inside the menu button*/
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(x_position+185,y_position+21,string(string_text),global.default_text_size,c_white,c_black,1);
	#endregion /*Text inside the menu button END*/
	
	#endregion /*Button END*/
}