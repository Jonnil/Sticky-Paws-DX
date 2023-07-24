if (position_meeting(x, bbox_bottom + 1, other))
&& (speed == 0)
{
	stop_gravity = true;
}

#region /* Push out of the solid object */
while(place_meeting(x, y, other))
{
	y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
}
#endregion /* Push out of the solid object END */