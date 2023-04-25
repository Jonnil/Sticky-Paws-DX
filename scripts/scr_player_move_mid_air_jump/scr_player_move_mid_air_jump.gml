function scr_player_move_mid_air_jump()
{
	
	#region /* Mid-Air / Double Jumping */
	if (can_mid_air_jump > 0)
	{
		can_mid_air_jump -= 1;
	}

	if (key_jump)
	and (can_move == true)
	and (global.pause == false)
	and (global.equipped_upgrade_double_jump == true)
	and (ground_pound == false)
	and (climb == false)
	and (horizontal_rope_climb == false)
	and (stick_to_wall == false)
	and (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (in_water == false)
	and (can_mid_air_jump == 0)
	{
		if (spring == true)
		and (vspeed > - 20)
		or (spring == false)
		{
			if (number_of_jumps >= 2)
			and (midair_jumps_left > 0)
			or (number_of_jumps <= -1)
			{
				buffer_jump = 0;
				dive = false;
				if (!place_meeting(x, y -double_jump_height, obj_wall))
				{
					vspeed = -double_jump_height;
				}
				else
				if (!place_meeting(x, y - 4, obj_wall))
				{
					vspeed = -4;
				}
				else
				{
					vspeed = 0;
				}
				scr_audio_play(voice_jump, volume_source.voice);
				effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
				effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
				effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
				image_index = 0;
		
				if (number_of_jumps > - 1)
				and (midair_jumps_left != number_of_jumps)
				{
					midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
					if (number_of_jumps >= 3)
					and (midair_jumps_left < number_of_jumps)
					{
						with(instance_create_depth(x, bbox_bottom, 0, obj_score_up))
						{
							score_up = instance_nearest(x, y, obj_player).midair_jumps_left; /* If the player can do 3 jumps, show that */
							not_score = true;
							show_remaining_jumps = true;
						}
					}
				}
				else
				{
					midair_jumps_left = clamp(midair_jumps_left - 2, 0, number_of_jumps);
					if (number_of_jumps >= 3)
					and (midair_jumps_left < number_of_jumps)
					{
						with(instance_create_depth(x, bbox_bottom, 0, obj_score_up))
						{
							score_up = instance_nearest(x, y, obj_player).midair_jumps_left; /* If the player can do 3 jumps, show that */
							not_score = true;
							show_remaining_jumps = true;
						}
					}
				}
		
				#region /* Mid-air flip animation */
				if (midair_jumps_left >= midair_jump_flip_animation)
				or (number_of_jumps = 2)
				and (midair_jump_flip_animation >= 2)
				{
					if (image_xscale > 0)
					{
						angle = +360;
					}
					else
					{
						angle = -360;
					}
				}
				#endregion /* Mid-air flip animation END */
		
			}
		}
	}
	#endregion /* Mid-Air / Double Jumping END */
	
	#region /* Recharge mid-air / double jump when landing on ground */
	if (on_ground == true)
	{
		if (vspeed >= 0)
		{
			midair_jumps_left = number_of_jumps;
		}
	}
	#endregion /* Recharge mid-air / double jump when landing on ground END */
	
}