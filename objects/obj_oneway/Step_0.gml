if (image_angle = 0)
or(image_angle = 360)
{
	if (asset_get_type("obj_player") == asset_object)
	and(place_meeting(x - 1, y, obj_player))
	and(asset_get_type("obj_wall") == asset_object)
	and(!place_meeting(x + 1, y, obj_wall))
	and(!place_meeting(x + 8, y, obj_wall))
	{
		with(instance_nearest(bbox_left, y, obj_player))
		{
			x += 64;
			smooth_teleport = 0;
		}
	}
}
else
if (image_angle = 90)
and(asset_get_type("obj_player") == asset_object)
and(place_meeting(x, y + 1, obj_player))
and(asset_get_type("obj_wall") == asset_object)
and(!place_meeting(x, y - 1, obj_wall))
and(!place_meeting(x, y - 8, obj_wall))
{
	with(instance_nearest(x, bbox_bottom, obj_player))
	{
		y -= sprite_height - 2;
		smooth_teleport = 0;
	}
}
else
if (image_angle = 180)
and(asset_get_type("obj_player") == asset_object)
and(place_meeting(x + 1, y, obj_player))
and(asset_get_type("obj_wall") == asset_object)
and(!place_meeting(x - 1, y, obj_wall))
and(!place_meeting(x - 8, y, obj_wall))
{
	with(instance_nearest(bbox_right, y, obj_player))
	{
		x -= 64;
		smooth_teleport = 0;
	}
}
else
if (image_angle = 270)
and(asset_get_type("obj_player") == asset_object)
and(place_meeting(x, y - 1, obj_player))
and(asset_get_type("obj_wall") == asset_object)
and(!place_meeting(x, y + 1, obj_wall))
and(!place_meeting(x, y + 8, obj_wall))
{
	with(instance_nearest(x, bbox_top, obj_player))
	{
		y += sprite_height + 2;
		smooth_teleport = 0;
	}
}