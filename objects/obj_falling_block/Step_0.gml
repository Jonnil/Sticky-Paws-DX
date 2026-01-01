var fall_max = 60;

if (image_index == 1)
|| (image_index == 3)
{
	fall_max = 30;
}

if (fall < fall_max)
{
	if (place_meeting(x, y - 1, obj_player))
	&& (instance_nearest(x, y - 1, obj_player).on_ground)
	|| (image_index == 1)
	&& (fall >= 1)
	|| (image_index == 3)
	&& (fall >= 1)
	{
		fall++;
		image_blend = c_red;
		
		var random_x = 1;
		var random_y = 1;
		
		if fall > 45
		{
			random_x = 2.5;
			random_y = 4;
		}
		else
		if fall > 30
		{
			random_x = 2;
			random_y = 3;
		}
		else
		if fall > 15
		{
			random_x = 1.5;
			random_y = 2;
		}
		
		xx = random_range(x - random_x, x + random_x);
		yy = random_range(y - random_y, y + random_y);

	}
	else
	{
		fall = false;
		image_blend = c_white;
		xx = x;
		yy = y;
	}
}
else
{
	vspeed = clamp(vspeed, -16, 16); /* Limit the vertical speed END */
	gravity_direction = 270;
	gravity = 0.5;
	image_blend = c_red;
	xx = random_range(x - 2.5, x + 2.5);
	yy = random_range(y - 2.5, y + 2.5);
}

#region /* Falling Block falling outside of view */
if (image_alpha < 1)
{
	instance_activate_object(self);
	gravity = 0;
	respawn_timer--;

	if (respawn_timer <= 0)
	{
		x = xstart;
		y = ystart;
		image_alpha = 1;
		effect_create_depth(depth - 1, ef_smoke, x, y, 2, c_white);
	}
}
#endregion /* Falling Block falling outside of view END */
