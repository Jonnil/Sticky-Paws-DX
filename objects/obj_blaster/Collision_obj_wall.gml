if (!position_meeting(x, bbox_bottom + 1, other))
{
	gravity = 0.5;
}
else
{
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}

#region /* Push out of the solid object */
while(place_meeting(x, y, other))
{
	y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
}
#endregion /* Push out of the solid object END */