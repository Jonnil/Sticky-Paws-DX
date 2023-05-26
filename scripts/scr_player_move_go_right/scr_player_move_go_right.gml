function scr_player_move_go_right()
{
	
	#region /* Go Right */
	if (key_right_hold)
	and (!key_left_hold)
	and (can_move)
	and (global.pause == false)
	{
		if (wall_jump == 0)
		and (stick_to_wall == false)
		and (climb == false)
		and (horizontal_rope_climb == false)
		and (takendamage <= takendamage_freezetime)
		{
			if (dive == false)
			{
				if (image_xscale == -1)
				{
					image_xscale = +1;
				
					#region /* Turnaround Effect */
					if (on_ground == false)
					{
						effect_turnaround_subimg = 0;
					}
					#endregion /* Turnaround Effect END */
				
				}
			}
			if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 8)
			{
				if (!place_meeting(x + 1, y, obj_wall))
				{
					if (asset_get_type("obj_ice_block") == asset_object)
					and (place_meeting(x, y + 1, obj_ice_block))
					{
						hspeed += acceleration_on_ice;
					}
					else
					{
						if (on_ground)
						{
							hspeed += acceleration_on_ground;
						}
						else
						{
							hspeed += acceleration_in_air;
						}
					}
				}
				else
				{
					if (!place_meeting(x + 2, y, obj_wall))
					and (!place_meeting(x, y - 2, obj_wall))
					{
						if (on_ground)
						{
							hspeed += acceleration_on_ground;
						}
						else
						{
							hspeed += acceleration_in_air;
						}
						vspeed -= 1;
						x += 1;
						y -= 1;
					}
				}
			}
		}
	}
	#endregion /* Go Right END */
	
}