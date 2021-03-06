/// @description draw_menu_checkmark(x,y,string,menu_index,variable_to_check,bottom_text);
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
	var x_position=argument0;/*The buttons x origin position*/
	var y_position=argument1;/*The buttons y origin position*/

	var string_text=argument2;
	var menu_index=argument3;
	var variable_to_check=argument4;
	var bottom_text=argument5;
	var clicked_on=false;
	#endregion /*Initialize variables END*/
	
	if (menu=menu_index)
	{
		draw_sprite_ext(spr_menu_cursor,menu_cursor_index,x_position+16,y_position+16,1,1,0,c_white,1);
	}
	
	if (variable_to_check=false)
	{
		if (point_in_rectangle(mouse_x,mouse_y,x_position,y_position,x_position+370,y_position+32))
		{
			draw_sprite_ext(spr_menu_checkmark,0,x_position+42,y_position,1,1,0,c_lime,1);
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark,0,x_position+42,y_position,1,1,0,c_white,1);
		}
	}
	else
	{
		if (point_in_rectangle(mouse_x,mouse_y,x_position,y_position,x_position+370,y_position+32))
		{
			draw_sprite_ext(spr_menu_checkmark,1,x_position+42,y_position,1,1,0,c_lime,1);
		}
		else
		{
			draw_sprite_ext(spr_menu_checkmark,1,x_position+42,y_position,1,1,0,c_white,1);
		}
	}

	#region /*Clicking the menu button*/
	if (point_in_rectangle(mouse_x,mouse_y,x_position,y_position,x_position+370,y_position+32))and(mouse_check_button_pressed(mb_left))
	{
		menu=menu_index;
		can_navigate_settings_sidebar=false;
	}#endregion /*Clicking the menu button END*/

	#region /*Text inside the menu button*/
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text_outlined(x_position+82,y_position+16,string(string_text),global.default_text_size,c_white,c_black,1);
	#endregion /*Text inside the menu button END*/
	
	#region /*Bottom Text*/
	if (menu=menu_index)
	and(bottom_text>noone)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_alpha(0.5);
		draw_rectangle_color(0,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-128,camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]),camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]),c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-64,string(bottom_text),global.default_text_size,c_white,c_black,1);
	}#endregion /*Bottom Text END*/
	
	#endregion /*Checkmark END*/
}