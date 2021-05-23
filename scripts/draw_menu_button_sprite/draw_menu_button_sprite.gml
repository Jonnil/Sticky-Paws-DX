/// @function draw_menu_button_sprite(sprite_index, x, y, width, height, string, menu_index, menu_takes_you_to)
/// @description draw_menu_button_sprite(sprite_index,x,y,width,height,string,menu_index,menu_takes_you_to)
/// @param sprite_index
/// @param x
/// @param y
/// @param width
/// @param height
/// @param string
/// @param menu_index
/// @param menu_takes_you_to

function draw_menu_button_sprite()
{
	#region /*Button*/
	
	#region /*Initialize variables*/
	var spr_index=argument0;/*Sprite index of the button (argument0)*/
	var x_position=argument1;/*The buttons x origin position (argument1)*/
	var y_position=argument2;/*The buttons y origin position (argument2)*/
	var spr_width=argument3;/*The width of the button*/
	var spr_height=argument4;/*The height of the button*/

	var string_text=argument5;/*(argument3)*/
	var menu_index=argument6;/*(argument4)*/
	var menu_takes_you_to=argument7;/*(argument5)*/
	var clicked_on=false;
	#endregion /*Initialize variables END*/
	
	if (point_in_rectangle(mouse_x,mouse_y,x_position,y_position+1,x_position+spr_width,y_position+spr_height))
	and(global.controls_used_for_menu_navigation="mouse")
	{
		if (menu = menu_index)
		and (global.controls_used_for_menu_navigation = "keyboard")
		or (menu = menu_index)
		and (global.controls_used_for_menu_navigation = "controller")
		{
			draw_sprite_ext(spr_index,0,x_position,y_position,1,1,0,c_green,1);
		}
		else
		{
			draw_sprite_ext(spr_index,0,x_position,y_position,1,1,0,c_lime,1);
		}
	}
	else
	{
		if (menu = menu_index)
		and (global.controls_used_for_menu_navigation = "keyboard")
		or (menu = menu_index)
		and (global.controls_used_for_menu_navigation = "controller")
		{
			draw_sprite_ext(spr_index,0,x_position,y_position,1,1,0,c_gray,1);
		}
		else
		{
			draw_sprite_ext(spr_index,0,x_position,y_position,1,1,0,c_white,1);
		}
	}

	#region /*Clicking the menu button*/
	if (point_in_rectangle(mouse_x,mouse_y,x_position,y_position,x_position+spr_width,y_position+spr_height))
	{
		if (menu_takes_you_to=false)
		or(menu_takes_you_to=noone)
		or(menu_takes_you_to="")
		or(menu_takes_you_to=menu_index)
		{
			if (mouse_check_button(mb_left))
			and(menu_index>noone)
			{
				menu=menu_index;
			}
		}
		else
		{
			if (mouse_check_button_released(mb_left))
			{
				menu=menu_takes_you_to;
			}
		}
	}
	#endregion /*Clicking the menu button END*/

	#region /*Text inside the menu button*/
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if (string_text>noone)
	{
		draw_text_outlined(x_position+185,y_position+21,string(string_text),global.default_text_size,c_white,c_black,1);
	}
	#endregion /*Text inside the menu button END*/
	
	#endregion /*Button END*/
}