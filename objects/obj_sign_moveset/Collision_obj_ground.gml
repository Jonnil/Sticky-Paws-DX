while (place_meeting(x, y, other))
{
	x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
	y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
}

if (place_meeting(x, y + 1, other))
{
	stop_gravity = true;
	gravity = 0;
	vspeed = 0;
}
