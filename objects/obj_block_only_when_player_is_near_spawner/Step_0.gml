if (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).mask_index >= 0)
and (distance_to_object(instance_nearest(x, y, obj_player)) < sprite_get_width(instance_nearest(x, y, obj_player).mask_index))
and (distance_to_object(instance_nearest(x, y, obj_player)) < sprite_get_height(instance_nearest(x, y, obj_player).mask_index))
{
	if (!place_meeting(x, y, obj_block_only_when_player_is_near))
	{
		instance_create_depth(x, y, 0, obj_block_only_when_player_is_near);
	}
}
