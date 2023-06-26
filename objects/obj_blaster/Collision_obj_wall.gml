if (!position_meeting(x, bbox_bottom + 1, other))
{
	gravity = 0.5;
}
else
{
	move_snap(16, 16);
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}