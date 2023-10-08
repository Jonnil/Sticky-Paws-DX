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
			if (door_need_to_be_on_ground_to_enter)
			{
				/* The door must sit on ground too before a player can enter */
				if (position_meeting(x, bbox_bottom + 1, obj_wall))
				|| (position_meeting(bbox_left - 1, bbox_bottom + 1, obj_wall))
				|| (position_meeting(bbox_right + 1, bbox_bottom + 1, obj_wall))
				|| (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
				|| (position_meeting(bbox_left - 1, bbox_bottom + 1, obj_semisolid_platform))
				|| (position_meeting(bbox_right + 1, bbox_bottom + 1, obj_semisolid_platform))
				{
					open_door = true;
				}
			}
			else
			if (!door_need_to_be_on_ground_to_enter)
			{
				/* The door can be in the air and player can still enter */
				open_door = true;
			}
		}
	}
}