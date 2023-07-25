if (!position_meeting(x, bbox_bottom + 1, obj_wall))
{
	gravity = 0.5;
}
else
{
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
	y = instance_nearest(x, bbox_bottom, obj_wall).bbox_top - 50;
}