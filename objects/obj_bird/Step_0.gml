if (instance_exists(obj_player))
&& (distance_to_object(obj_player) < 128)
&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
&& (touch_player == 0)
&& (!startled)
{
	startled = true;
	gravity = 0;
	image_speed = 0.3;
	
	if (instance_nearest(x, y, obj_player).x > x)
	{
		image_xscale = -1;
		hspeed = -4;
	}
	else
	{
		image_xscale = +1;
		hspeed = +4;
	}
	
	vspeed = -4;
}

if (die_volting = -1)
|| (die_volting = +1)
{
	image_blend = c_ltgray;
	image_speed = 0;
	image_index = 1;
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
	gravity_direction = 270;
	gravity = 0;
}

/* Make the bird randomly hop and turn around when not startled */
if (!startled)
{
	gravity_direction = 270;
	if (place_meeting(x, y + 1, obj_wall))
	|| (place_meeting(x, y + 1, obj_semisolid_platform))
	{
		gravity = 0;
		hspeed = 0;
		vspeed = 0;
	}
	else
	{
		gravity = 0.5;
	}
	
	if (place_meeting(x, y + 1, obj_wall))
	|| (place_meeting(x, y + 1, obj_semisolid_platform))
	{
		if (floor(random(100)) == 0)
		{
			image_xscale = -1; /* Randomly turn left */
		}
		else
		if (floor(random(100)) == 0)
		{
			image_xscale = +1; /* Randomly turn right */
		}
		else
		if (floor(random(100)) == 0)
		{
			hspeed = random_range(-5, +5); /* Can jump either left or right */
			vspeed = -random(5);
			
			/* Turn towards where bird is jumping towards */
			if (hspeed < 0)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = +1;
			}
		}
	}
	
	/* Hop left or right, but never jump off ledges */
	if (!place_meeting(x - 5, bbox_bottom + 20, obj_wall))
	&& (!place_meeting(x - 5, bbox_bottom + 20, obj_semisolid_platform))
	{
		hspeed = +1;
		image_xscale = +1;
	}
	else
	if (!place_meeting(x + 5, bbox_bottom + 20, obj_wall))
	&& (!place_meeting(x + 5, bbox_bottom + 20, obj_semisolid_platform))
	{
		hspeed = -1;
		image_xscale = -1;
	}
	
}