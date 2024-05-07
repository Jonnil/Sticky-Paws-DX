depth = +9;

if (stomped_delay > 0)
{
	stomped_delay --;
}

if (die_volting = -1)
|| (die_volting = +1)
{
	depth = -900;
	if (die_volting = -1)
	{
		image_angle -= 20;
		hspeed = +4;
	}
	else
	{
		image_angle += 20;
		hspeed = -4;
	}
	
	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	gravity = 0.5; /* The gravity */
	#endregion /* Set the gravity END */
	
	sprite_used = "stand";
	sprite_index = global.resource_pack_sprite_big_stationary_enemy;
}
else
{

	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	if (!on_ground)
	{
		gravity = 0.5; /* The gravity */
	}
	else
	{
		gravity = 0;
	}
	#endregion /* Set the gravity END */
	
	if (flat)
	{
		speed = 0;
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
		sprite_used = "flattened";
		sprite_index = global.resource_pack_sprite_big_stationary_enemy_flattened;
		if (image_index > image_number - 1)
		{
			effect_create_above(ef_smoke, x, y, 2, c_white);
			instance_destroy();
		}
	}
	else
	{
		sprite_used = "stand";
		sprite_index = global.resource_pack_sprite_big_stationary_enemy;
	}
}

if (instance_number(obj_player) > 0)
{
	if (!die)
	{
		if (instance_nearest(x, y, obj_player).x < x)
		{
			image_xscale = -1;
		}
		else
		{
			image_xscale = +1;
		}
	}
}