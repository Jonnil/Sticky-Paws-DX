function scr_player_move_go_left()
{
	
	#region /* Go Left */
	if (key_left_hold)
	&& (!key_right_hold)
	&& (can_move)
	{
		if (wall_jump == 0)
		&& (!stick_to_wall)
		&& (!climb)
		&& (!horizontal_rope_climb)
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (!dive)
			{
				if (image_xscale == +1)
				{
					image_xscale = -1;
				
					#region /* Turnaround Effect */
					if (!on_ground)
					{
						effect_turnaround_subimg = 0;
					}
					#endregion /* Turnaround Effect END */
				
				}
			}
			if (x > camera_get_view_x(view_camera[view_current]) + 8)
			{
				if (!place_meeting(x - 1, y, obj_wall)) /* If there is no wall to the left */
				{
					if (place_meeting(x, y + 1, obj_ice_block)) /* If you are walking on ice block, then use "acceleration on ice" variable to determine the hspeed */
					{
						hspeed -= acceleration_on_ice;
					}
					else
					{
						if (on_ground) /* If you are walking on normal ground, then use "acceleration on ground" variable to determine the hspeed */
						{
							hspeed -= acceleration_on_ground;
						}
						else /* If you are in the air, then use "acceleration in air" variable to determine the hspeed */
						{
							hspeed -= acceleration_in_air;
						}
					}
				}
			}
		}
	}
	#endregion /* Go Left END */
	
}