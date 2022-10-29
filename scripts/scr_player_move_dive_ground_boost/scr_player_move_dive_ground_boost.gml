function scr_player_move_dive_ground_boost()
{
	
	#region /* Dive ground boost */
	if (allow_dive_ground_boost == true)
	and (dive_on_ground > 0)
	and (on_ground == true)
	{
		dive_on_ground -= 1;
		if (key_jump)
		{
			dive_on_ground = false;
			effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
			if (speed_max < 10)
			{
				speed_max = 10;
			}
			if (image_xscale < 0)
			{
				if (hspeed <-7)
				{
					if (hspeed >- 10)
					{
						if (!place_meeting(x - 1, y, obj_wall))
						and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
						and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
						and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
						{
							hspeed = - 10;
						}
					}
					angle = - 320;
				}
			}
			else
			if (image_xscale > 0)
			{
				if (hspeed >+7)
				{
					if (hspeed <+ 10)
					{
						if (!place_meeting(x + 1, y, obj_wall))
						and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
						and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
						and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
						{
							hspeed = +10;
						}
					}
					angle = +320;
				}
			}
		}
	}
	#endregion /* Dive ground boost END */
	
}