if (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	gravity = 0.5;
}
else
{
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}