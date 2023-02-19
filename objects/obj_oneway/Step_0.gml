if (distance_to_object(obj_player) < 32)
{
	if (image_angle == 0)
	or (image_angle = 360)
	{
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (place_meeting(x - 1, y, obj_player))
		and (asset_get_type("obj_wall") == asset_object)
		and (!position_meeting(bbox_right + 1, instance_nearest(bbox_left, y, obj_player).y, obj_wall))
		and (!position_meeting(bbox_right + 8, instance_nearest(bbox_left, y, obj_player).y, obj_wall))
		{
			with(instance_nearest(bbox_left, y, obj_player))
			{
				x += 64;
				y = instance_nearest(x, y, obj_oneway).y;
				smooth_teleport = 0;
			}
		}
	}
	else
	if (image_angle = 90)
	and (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (place_meeting(x, y + 1, obj_player))
	and (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y - 1, obj_wall))
	and (!place_meeting(x, y - 8, obj_wall))
	{
		with(instance_nearest(x, bbox_bottom, obj_player))
		{
			y -= sprite_height - 2;
			smooth_teleport = 0;
		}
	}
	else
	if (image_angle = 180)
	and (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (place_meeting(x + 1, y, obj_player))
	and (asset_get_type("obj_wall") == asset_object)
	and (!position_meeting(bbox_left - 1, instance_nearest(bbox_left, y, obj_player).y, obj_wall))
	and (!position_meeting(bbox_left - 8, instance_nearest(bbox_left, y, obj_player).y, obj_wall))
	{
		with(instance_nearest(bbox_right, y, obj_player))
		{
			x -= 64;
			y = instance_nearest(x, y, obj_oneway).y;
			smooth_teleport = 0;
		}
	}
	else
	if (image_angle = 270)
	and (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (place_meeting(x, y - 1, obj_player))
	and (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (!place_meeting(x, y + 8, obj_wall))
	{
		with(instance_nearest(x, bbox_top, obj_player))
		{
			y += sprite_height + 2;
			smooth_teleport = 0;
		}
	}
}