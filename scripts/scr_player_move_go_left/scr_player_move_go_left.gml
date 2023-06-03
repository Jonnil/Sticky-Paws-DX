function scr_player_move_go_left()
{
	
	#region /* Go Left */
	if (key_left_hold)
	&& (!key_right_hold)
	&& (can_move)
	&& (global.pause == false)
	{
		if (wall_jump == 0)
		&& (stick_to_wall == false)
		&& (climb == false)
		&& (horizontal_rope_climb == false)
		&& (takendamage <= takendamage_freezetime)
		{
			if (dive == false)
			{
				if (image_xscale == +1)
				{
					image_xscale = -1;
				
					#region /* Turnaround Effect */
					if (on_ground == false)
					{
						effect_turnaround_subimg = 0;
					}
					#endregion /* Turnaround Effect END */
				
				}
			}
			if (x > camera_get_view_x(view_camera[view_current]) + 8)
			{
				if (!place_meeting(x - 1, y, obj_wall))
				{
					if (asset_get_type("obj_ice_block") == asset_object)
					&& (place_meeting(x, y + 1, obj_ice_block))
					{
						hspeed -= acceleration_on_ice;
					}
					else
					{
						if (on_ground)
						{
							hspeed -= acceleration_on_ground;
						}
						else
						{
							hspeed -= acceleration_in_air;
						}
					}
				}
				else
				{
					if (!place_meeting(x - 2, y, obj_wall))
					&& (!place_meeting(x, y - 2, obj_wall))
					{
						if (on_ground)
						{
							hspeed -= acceleration_on_ground;
						}
						else
						{
							hspeed -= acceleration_in_air;
						}
						vspeed --;
						x --;
						y --;
					}
				}
			}
		}
	}
	#endregion /* Go Left END */
	
}