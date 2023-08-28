if (position_meeting(x, bbox_bottom + 1, obj_wall))
{
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
	y -= 1;
}