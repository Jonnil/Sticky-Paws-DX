image_xscale = 0.5;
image_yscale = 0.5;

#region /*Path Turning*/

/*
right down = 0
up right = 1
up left = 2
left down = 3
*/

#region /*Touch Map Turn Right Down*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 0) /*Right Down = 0*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = +16;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = +16;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /*Touch Map Turn Right Down END*/

else

#region /*Touch Map Turn Up Right*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 1) /*Up Right = 1*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = - 16;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = +16;
		vspeed = 0;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
}
#endregion /*Touch Map Turn Up Right END*/

else

#region /*Touch Map Turn Up Left*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 2) /*Up Left = 2*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = - 16;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = - 16;
		vspeed = 0;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
}
#endregion /*Touch Map Turn Up Left END*/

else

#region /*Touch Map Turn Left Down*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 3) /*Left Down = 3*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = +16;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = - 16;
		vspeed = 0;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
}
#endregion /*Touch Map Turn Left Down END*/

#endregion /*Path Turning END*/
