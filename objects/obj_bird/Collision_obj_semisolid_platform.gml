if (touch_player == 0)
{
	if (!startled)
	{
		while (place_meeting(x, y, other))
		{
			x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
			y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
		}
	}
	
	#region /* Change direction when hitting a wall */
	if (speed > 0)
	{
		if (place_meeting(x, y + 1, other) && !startled)
		{
			vspeed = -4;
		}
	}
	#endregion /* Change direction when hitting a wall END */
	
}