if (asset_get_type("obj_wall") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_wall))
{
	gravity = 0.5;
}
else
{
	move_snap(32, 32);
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}