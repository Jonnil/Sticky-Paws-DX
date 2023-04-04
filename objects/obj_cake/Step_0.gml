if (instance_exists(obj_player))
and (obj_player.intro_animation != "ending_chair")
{
	if (attatch_player == true)
	{
		x = instance_nearest(x, y, obj_player).x;
		y = instance_nearest(x, y, obj_player).bbox_top - 32;
	}
}
if (room == room_world_map)
{
	if (global.win == true)
	{
		visible = true;
	}
	else
	{
		visible = false;
	}
}