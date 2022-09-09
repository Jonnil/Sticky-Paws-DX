function scr_draw_remap_key(menu_string, remapping_player_key, menu_y_remap_key)
{
	
	#region /*Remap Key*/
	if (menu = menu_string)
	and (menu_remap_key_number = 0)
	{
		if(remapping_player_key = mb_left)
		{
			draw_sprite_ext(spr_mouse_buttons, 1, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		if(remapping_player_key = mb_middle)
		{
			draw_sprite_ext(spr_mouse_buttons, 2, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		if(remapping_player_key = mb_right)
		{
			draw_sprite_ext(spr_mouse_buttons, 3, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		if(remapping_player_key = mb_side1)
		{
			draw_sprite_ext(spr_mouse_buttons, 4, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		if(remapping_player_key = mb_side2)
		{
			draw_sprite_ext(spr_mouse_buttons, 5, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		if(remapping_player_key = 13234) /*Mouse Wheel Down*/
		{
			draw_sprite_ext(spr_mouse_buttons, 6, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		if(remapping_player_key = 132321) /*Mouse Wheel Up*/
		{
			draw_sprite_ext(spr_mouse_buttons, 7, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		if(remapping_player_key != 0)
		{
			draw_sprite_ext(spr_keyboard_keys, remapping_player_key, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, 0, key1_x, menu_y_remap_key + menu_y_offset, 1, 1, 0, c_white, 1);
		}
	}
	else
	{
		if(remapping_player_key = mb_left)
		{
			draw_sprite_ext(spr_mouse_buttons, 1, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		if(remapping_player_key = mb_middle)
		{
			draw_sprite_ext(spr_mouse_buttons, 2, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		if(remapping_player_key = mb_right)
		{
			draw_sprite_ext(spr_mouse_buttons, 3, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		if(remapping_player_key = mb_side1)
		{
			draw_sprite_ext(spr_mouse_buttons, 4, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		if(remapping_player_key = mb_side2)
		{
			draw_sprite_ext(spr_mouse_buttons, 5, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		if(remapping_player_key = 13234) /*Mouse Wheel Down*/
		{
			draw_sprite_ext(spr_mouse_buttons, 6, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		if(remapping_player_key = 132321) /*Mouse Wheel Up*/
		{
			draw_sprite_ext(spr_mouse_buttons, 7, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		if(remapping_player_key != 0)
		{
			draw_sprite_ext(spr_keyboard_keys, remapping_player_key, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, 0, key1_x, menu_y_remap_key + menu_y_offset, 0.9, 0.9, 0, c_gray, 0.9);
		}
	}
	#endregion /*Remap Key END*/
	
}