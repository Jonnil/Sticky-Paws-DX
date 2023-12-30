if (touch_player == 0)
{
	touch_player = true;
	if (instance_nearest(x, y, obj_player).x < x)
	{
		vspeed = -8;
		die_volting = -1;
	}
	else
	{
		vspeed = -8;
		die_volting = +1;
	}
	
	#region /* 1 Basic Collectible */
	with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
	{
		image_speed = 1;
		motion_set(90, 10);
		bounce_up = true;
	}
	#endregion /* 1 Basic Collectible END */
	
	if (vspeed > 8)
	{
		touch_player = 2;
		image_index = 1;
		hspeed = +6;
		vspeed = -6;
		image_angle = 0;
	}
}