#region /* Collision Event with player */
if (bounce_up == false)
and (asset_get_type("obj_player") == asset_object)
and (asset_get_type("obj_wall") == asset_object)
{
	
	if (place_meeting(x, y - 4, obj_player)) /* If player is ground pounding this block */
	and (!place_meeting(x, y - 1, obj_wall))
	and (variable_instance_exists(obj_player, "ground_pound"))
	and (instance_nearest(x, y, obj_player).ground_pound == true)
	and (can_be_ground_pounded == true)
	
	or (position_meeting(x, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
	and (!position_meeting(x, bbox_bottom + 1, obj_wall))
	and (can_be_hit_from_below == true)
	
	or (position_meeting(bbox_left + 9, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
	and (!position_meeting(x, bbox_bottom + 1, obj_wall))
	and (can_be_hit_from_below == true)
	
	or (position_meeting(bbox_right - 9, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
	and (!position_meeting(x, bbox_bottom + 1, obj_wall))
	and (can_be_hit_from_below == true)
	
	or (place_meeting(bbox_left - 4, y, obj_player))
	and (!place_meeting(x - 4, y, obj_wall))
	and (variable_instance_exists(obj_player, "dive"))
	and (instance_nearest(x, y, obj_player).dive == true)
	
	or (place_meeting(bbox_right + 4, y, obj_player))
	and (!place_meeting(x + 4, y, obj_wall))
	and (variable_instance_exists(obj_player, "dive"))
	and (instance_nearest(x, y, obj_player).dive == true)
	{
		if (empty == false)
		{
			if (instance_exists(obj_player))
			and (asset_get_type("scr_gamepad_vibration") == asset_script)
			{
				scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
			}
			bounce_up = true;
			if (asset_get_type("obj_block_break") == asset_object)
			{
				with(instance_create_depth(x, y - 32, 0, obj_block_break))
				{
					image_yscale = 0.1;
				}
			}
			scr_different_items_inside();
		}
	}
}
#endregion /* Collision Event with player END */