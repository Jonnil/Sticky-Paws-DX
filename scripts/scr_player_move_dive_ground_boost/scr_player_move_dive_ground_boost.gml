function scr_player_move_dive_ground_boost()
{

	#region /* Dive ground boost */
	if (allow_dive_ground_boost)
	&& (dive_on_ground > 0)
	&& (on_ground)
	{
		dive_on_ground--;
		if (key_jump)
		{
			dive_on_ground = false;
			effect_create_depth(depth - 1, ef_smoke, x, bbox_bottom, 1, c_white);
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
						&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
						&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
						&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
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
						&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
						&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
						&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
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
