if (instance_number(obj_player) > 0)
{
	if (attatch_player = true)
	{
		x = instance_nearest(x, y, obj_player).x;
		y = instance_nearest(x, y, obj_player).bbox_top - 32;
	}
}
if (room = room_world_map)
{
	if (global.win = true)
	{
		visible = true;
	}
	else
	{
		visible = false;
	}
}

if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 16)
and (attatch_player = false)
{
	instance_destroy();
}