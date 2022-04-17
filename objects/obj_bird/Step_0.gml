depth = + 5;
image_speed = 0;
if (speed > 0)
{
	image_index = 1;
}
else
{
	image_index = 0;
}
if (asset_get_type("obj_player") == asset_object)
and (asset_get_type("obj_wall") == asset_object)
and (instance_exists(obj_player))
and (distance_to_object(obj_player) < 128)
and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
and (touch_player = false)
{
	image_index = 1;

	if (image_xscale < 0)
	{
		hspeed = -4;
	}
	else
	if (image_xscale > 0)
	{
		hspeed = +4;
	}

	vspeed = -4;
}

if (die_volting = -1)
or(die_volting = +1)
{
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
	
	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	#endregion /*Set the gravity END*/
	
}

if (asset_get_type("obj_player") == asset_object)
and (touch_player = false)
and (instance_exists(obj_player))
and (place_meeting(x, y, obj_player))
{
	touch_player = true;
	if (instance_nearest(x, y, obj_player).x < x)
	{
		vspeed = - 8;
		die_volting = -1;
	}
	else
	{
		vspeed = - 8;
		die_volting = +1;
	}
	
	#region /* 1 Basic Collectible*/
	if (asset_get_type("obj_basic_collectible") == asset_object)
	{
		var obj;
		obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
		with(obj)
		{
			image_speed = 1;
			motion_set(90, 10);
			bounceup = true;
		}
	}
	#endregion /* 1 Basic Collectible END*/
	
	if (vspeed > 8)
	{
		touch_player = 2;
		image_index = 1;
		hspeed = + 6;
		vspeed = -6;
		image_angle = 0;
	}
}

#region /*Change direction when hitting a wall*/
if (asset_get_type("obj_wall") == asset_object)
and (speed > 0)
and (touch_player = false)
{
	if (place_meeting(x - 1, y, obj_wall))
	{
		image_xscale = +1;
		hspeed = +4;
	}
	if (place_meeting(x + 1, y, obj_wall))
	{
		image_xscale = -1;
		hspeed = -4;
	}
	if (position_meeting(x, bbox_top - 1, obj_wall))
	{
		vspeed = +4;
	}
	if (place_meeting(x, y + 1, obj_wall))
	{
		vspeed = -4;
	}
}
#endregion /*Change direction when hitting a wall END*/

#region /*If it's inside the wall, destroy itself*/
if (position_meeting(x, y, obj_wall))
and (touch_player = false)
{
	instance_destroy();
}
#endregion /*If it's inside the wall, destroy itself END*/