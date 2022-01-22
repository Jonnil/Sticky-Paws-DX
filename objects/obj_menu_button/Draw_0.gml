#region /*Button*/
if (kind_of_button = 0)
{
	for (i= 0;i<image_xscale;i++)
	{
		draw_sprite_ext(spr_menu_button_center, 0,x +(i*32),y, 1, 1, 0,highlight_color, 1);
	}

	draw_sprite_ext(spr_menu_button_edge, 0,x, y, 1, 1, 0,highlight_color, 1);
	draw_sprite_ext(spr_menu_button_edge, 0,x + sprite_width,y,-1, 1, 0,highlight_color, 1);

	#region /*Clicking the menu button*/
	if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width,y+ sprite_height)) and (mouse_check_button_pressed(mb_left))
	{
		with(obj_menu_button)
		{
			clicked_on = false;
		}
		clicked_on = true;
	}#endregion /*Clicking the menu button END*/

	if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width,y+ sprite_height))
	{
		if (clicked_on = false)
		{
			highlight_color=c_lime;
		}
		else
		{
			highlight_color=c_green;
		}
	}
	else
	{
		if (clicked_on = false)
		{
			highlight_color=c_white;
		}
		else
		{
			highlight_color=c_gray;
		}
	}

	#region /*Text inside the menu button*/
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(x + sprite_width / 2,y+ sprite_height/ 2,string(menu_text), global.default_text_size,c_white,c_black);
	#endregion /*Text inside the menu button END*/
}#endregion /*Button END*/

#region /*Checkmark*/
if (kind_of_button =1)
{
	if (checkmark=false)
	{
		draw_sprite_ext(spr_checkbox, 0,x + 16,y + 16, 0.5, 0.5, 0,highlight_color, 1);
	}
	else
	{
		draw_sprite_ext(spr_checkbox, 1,x + 16,y + 16, 0.5, 0.5, 0,highlight_color, 1);
	}
	
	#region /*Clicking the menu button*/
	if (point_in_rectangle(mouse_x, mouse_y, x, y, x + 32,y + 32)) and (mouse_check_button_pressed(mb_left))
	{
		with(obj_menu_button)
		{
			clicked_on = false;
		}
		clicked_on = true;
		if (checkmark=false)
		{
			checkmark= true;
		}
		else
		{
			checkmark=false;
		}
	}#endregion /*Clicking the menu button END*/

	if (point_in_rectangle(mouse_x, mouse_y, x, y, x + 32,y + 32))
	{
		highlight_color=c_lime;
	}
	else
	{
		highlight_color=c_white;
	}

	#region /*Text to the right of the checkmark*/
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text_outlined(x + 42,y + 16,string(menu_text), global.default_text_size,c_white,c_black);
	#endregion /*Text to the right of the checkmark END*/
}
#endregion /*Checkmark END*/