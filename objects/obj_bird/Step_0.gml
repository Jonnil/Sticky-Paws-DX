if (instance_exists(obj_player))
&& (distance_to_object(obj_player) < 128)
&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
&& (touch_player == false)
&& (speed == 0)
{
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
	image_blend = c_gray;
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
	
	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	#endregion /* Set the gravity END */
	
}