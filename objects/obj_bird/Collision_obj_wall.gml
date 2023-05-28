if (touch_player == false)
{
	while (place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	
	#region /* Change direction when hitting a wall */
	if (speed > 0)
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
	#endregion /* Change direction when hitting a wall END */
	
	#region /* If it's inside the wall, destroy itself */
	if (position_meeting(x, y, obj_wall))
	{
		instance_destroy();
	}
	#endregion /* If it's inside the wall, destroy itself END */
	
}