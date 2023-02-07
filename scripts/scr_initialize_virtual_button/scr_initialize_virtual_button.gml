function scr_initialize_virtual_button(key_1, key_2, key_x, key_y, key_sprite, mobile_key_extra_deadzone = 50, angle = 0)
{
	sprite_get_width(key_sprite);
	
	#region /* Virtual key add jump */
	if (key_1 > noone)
	{
		virtual_key_add(
		key_x - (sprite_get_width(key_sprite) * 0.5) - mobile_key_extra_deadzone,
		key_y - (sprite_get_height(key_sprite) * 0.5) - mobile_key_extra_deadzone,
		sprite_get_width(key_sprite) + (mobile_key_extra_deadzone * 2),
		sprite_get_height(key_sprite) + (mobile_key_extra_deadzone * 2),
		key_1);
	}
	else
	if (key_2 > noone)
	{
		virtual_key_add(
		key_x - (sprite_get_width(key_sprite) * 0.5) - mobile_key_extra_deadzone,
		key_y - (sprite_get_height(key_sprite) * 0.5) - mobile_key_extra_deadzone,
		sprite_get_width(key_sprite) + (mobile_key_extra_deadzone * 2),
		sprite_get_height(key_sprite) + (mobile_key_extra_deadzone * 2),
		key_2);
	}
	#endregion /* Virtual key add jump END */
	
	if (key_sprite > noone)
	{
		if (keyboard_check(key_1))
		or (keyboard_check(key_2))
		{
			draw_sprite_ext(key_sprite, 0, key_x, key_y, 0.95, 0.95, angle, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(key_sprite, 0, key_x, key_y, 1, 1, angle, c_white, 0.5);
		}
	}
}