if (!open_door)
&& (door_xscale >= 0.9)
{
	if (need_to_press_up_to_enter)
	&& (other.key_up_pressed)
	|| (!need_to_press_up_to_enter)
	{
		if (player_need_to_be_on_ground_to_enter)
		&& (other.on_ground)
		|| (!player_need_to_be_on_ground_to_enter)
		{
			if (!door_need_to_be_on_ground_to_enter) /* The door can be in the air and player can still enter */

			|| (door_need_to_be_on_ground_to_enter) /* The door must sit on ground too before a player can enter */
			&& (position_meeting(x, bbox_bottom + 1, obj_wall)
			|| position_meeting(bbox_left - 1, bbox_bottom + 1, obj_wall)
			|| position_meeting(bbox_right + 1, bbox_bottom + 1, obj_wall)
			|| position_meeting(x, bbox_bottom + 1, obj_semisolid_platform)
			|| position_meeting(bbox_left - 1, bbox_bottom + 1, obj_semisolid_platform)
			|| position_meeting(bbox_right + 1, bbox_bottom + 1, obj_semisolid_platform))
			{
				if (locked_door)
				&& (instance_exists(obj_key_follow))
				&& (instance_nearest(x, y, obj_key_follow).follow_player != noone)
				{
					with(obj_key_follow)
					{
						what_key--;
						if (what_key <= 1)
						{
							nearest_key = noone;
						}
					}

					if (sprite_index == spr_door_locked)
					{
						sprite_index = spr_door;
					}
					else
					if (sprite_index == spr_warp_box_locked)
					{
						sprite_index = spr_warp_box;
					}
					else
					if (sprite_index == spr_warp_box_one_use_locked)
					{
						sprite_index = spr_warp_box_one_use;
					}
					other.keys--;
					locked_door = false;
					open_door = true;

					/* Lastly, destroy the key being used */
					with (instance_nearest(x, y, obj_key_follow))
					{
						instance_destroy();
					}
				}
				else
				if (!locked_door)
				{
					open_door = true;
				}
			}
		}
	}
}
