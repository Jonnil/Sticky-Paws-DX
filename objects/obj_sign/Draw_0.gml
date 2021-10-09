if (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).hspeed = 0)
and (!instance_nearest(x, y, obj_player).key_left)
and (!instance_nearest(x, y, obj_player).key_right)
and (!instance_nearest(x, y, obj_player).key_down)
and (!instance_nearest(x, y, obj_player).key_up)
and (distance_to_object(obj_player) < 64)
and (show_text = false)
and (instance_nearest(x, y, obj_player).can_move = true)
{
	if (button_prompt_blink = true)
	{
		button_prompt_alpha = lerp(button_prompt_alpha, 1, 0.1);
	}
	else
	if (button_prompt_blink = false)
	{
		button_prompt_alpha = lerp(button_prompt_alpha, 0, 0.1);
	}
	if (button_prompt_alpha <= 0.1)
	{
		button_prompt_blink = true;
	}
	else
	if (button_prompt_alpha >= 0.9)
	{
		button_prompt_blink = false;
	}
	if (instance_nearest(x, y, obj_player).key_jump)
	{
		if (instance_exists(obj_player))
		{
			instance_nearest(x, y, obj_player).draw_xscale = 1;
			instance_nearest(x, y, obj_player).draw_yscale = 1;
			instance_nearest(x, y, obj_player).hspeed = 0;
			if (instance_nearest(x, y, obj_player).vspeed <= 0)
			{
				instance_nearest(x, y, obj_player).vspeed = 0;
			}
			instance_nearest(x, y, obj_player).can_move = false;
		}
		show_text = true;
	}
}
else
{
	button_prompt_alpha = lerp(button_prompt_alpha, 0, 0.5);
	if (instance_exists(obj_player))
	and (instance_nearest(x, y, obj_player).key_jump)
	and (show_text = true)
	{
		instance_nearest(x, y, obj_player).can_move = true;
		show_text = false;
	}
}
if (show_text = true)
{
	if (instance_exists(obj_player))
	{
		instance_nearest(x, y, obj_player).draw_xscale = 1;
		instance_nearest(x, y, obj_player).draw_yscale = 1;
		instance_nearest(x, y, obj_player).hspeed = 0;
		if (instance_nearest(x, y, obj_player).vspeed <= 0)
		{
			instance_nearest(x, y, obj_player).vspeed = 0;
		}
		instance_nearest(x, y, obj_player).can_move = false;
	}
}

/*Draw button prompt*/
draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, x, y - 32, 0.5, 0.5, 0, c_white, button_prompt_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);