function scr_player_move_wall_jump_and_wall_climb()
{
	
	#region /* Wall Jump and Wall Climb */
	if (allow_wall_jump == true)
	and (can_wall_jump == true)
	and (can_move == true)
	and (global.pause == false)
	and (takendamage <= takendamage_freezetime)
	and (wall_jump_setting >= 1)
	and (hold_item_in_hands == "")
	
	or (can_move == true)
	and (global.pause == false)
	and (takendamage <= takendamage_freezetime)
	and (place_meeting(x, y, obj_wall_jump_panel))
	and (hold_item_in_hands == "")
	
	or (can_move == true)
	and (global.pause == false)
	and (takendamage <= takendamage_freezetime)
	and (place_meeting(x, y, obj_wall_climb_panel))
	and (hold_item_in_hands == "")
	{
		if (asset_get_type("obj_wall") == asset_object)
		and (!place_meeting(x, y + 1, obj_wall))
		and (!place_meeting(x, y + 32, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		{
			if (climb == false)
			and (horizontal_rope_climb == false)
			and (vspeed >= 0)
			{
				if (key_left_hold)
				and (!key_right_hold)
				and (wall_jump_setting == 2)
				and (place_meeting(x - 1, y, obj_wall))
				or (!key_right_hold)
				and (dive == false)
				and (wall_jump_setting == 1)
				and (place_meeting(x - 1, y, obj_wall))
				and (image_xscale < 0)
				or (dive == true)
				and (wall_jump_setting == 1)
				and (place_meeting(x - 1, y, obj_wall))
				and (image_xscale < 0)
				or (key_left_hold)
				and (!key_right_hold)
				and (wall_jump_setting <= 0)
				and (place_meeting(x - 1, y, obj_wall))
				and (place_meeting(x, y, obj_wall_climb_panel))
				or (key_left_hold)
				and (!key_right_hold)
				and (wall_jump_setting <= 0)
				and (place_meeting(x - 1, y, obj_wall))
				and (place_meeting(x, y, obj_wall_jump_panel))
				{
					if (crouch == false)
					and (ground_pound == false)
					and (ledge_grab == false)
					and (burnt == false)
					{
						angle = 0;
						image_xscale = -1;
						jump = 0;
						dive = false;
						dive_on_ground = false;
						stomp_spin = false;
						stick_to_wall = true;
						midair_jumps_left = number_of_jumps;
						chain_reaction = 0;
						wall_jump = 0;
						ground_pound = false;
						spring = false;
						triplejumpdelay = 0;
					}
				}
				else
				if (key_right_hold)
				and (!key_left_hold)
				and (wall_jump_setting == 2)
				and (place_meeting(x + 1, y, obj_wall))
				or (!key_left_hold)
				and (dive == false)
				and (wall_jump_setting == 1)
				and (place_meeting(x + 1, y, obj_wall))
				and (image_xscale > 0)
				or (dive == true)
				and (wall_jump_setting == 1)
				and (place_meeting(x + 1, y, obj_wall))
				and (image_xscale > 0)
				or (key_right_hold)
				and (!key_left_hold)
				and (wall_jump_setting <= 0)
				and (place_meeting(x + 1, y, obj_wall))
				and (place_meeting(x, y, obj_wall_climb_panel))
				or (key_right_hold)
				and (!key_left_hold)
				and (wall_jump_setting <= 0)
				and (place_meeting(x + 1, y, obj_wall))
				and (place_meeting(x, y, obj_wall_jump_panel))
				{
					if (crouch == false)
					and (ground_pound == false)
					and (ledge_grab == false)
					and (burnt == false)
					{
						angle = 0;
						image_xscale = +1;
						jump = 0;
						dive = false;
						dive_on_ground = false;
						stomp_spin = false;
						stick_to_wall = true;
						midair_jumps_left = number_of_jumps;
						chain_reaction = 0;
						wall_jump = 0;
						ground_pound = false;
						spring = false;
						triplejumpdelay = 0;
					}
				}
			}
		}
		if (stick_to_wall == true)
		{
		
			#region /* Pressing opposite direction to drop off from wall */
			if (key_left_hold)
			and (!key_right_hold)
			and (image_xscale = +1)
			or (key_right_hold)
			and (!key_left_hold)
			and (image_xscale = -1)
			{
				dive = false;
				pressing_opposite_direction_to_drop_off_from_wall += 1;
			}
			else
			if (pressing_opposite_direction_to_drop_off_from_wall > 0)
			{
				pressing_opposite_direction_to_drop_off_from_wall -= 1;
			}
			#endregion /* Pressing opposite direction to drop off from wall END */
		
			#region /* If there is ground under you while trying to go down, then stop wall climbing */
			if (on_ground == true)
			{
				stick_to_wall = false;
			}
			#endregion /* If there is ground under you while trying to go down, then stop wall climbing END */
		
			if (crouch == false)
			and (ground_pound == false)
			and (ledge_grab == false)
			{
				if (vspeed > 0)
				and (position_meeting(x + 18 * image_xscale, bbox_top, obj_wall))
				{
					effect_create_above(ef_smoke, x + 17 * image_xscale, bbox_top, 0, c_white);
					if (!audio_is_playing(snd_skiddingvertical))
					{
						scr_audio_play(snd_skiddingvertical, volume_source.sound);
					}
					angle = 0;
				}
				else
				{
					if (audio_is_playing(snd_skiddingvertical))
					{
						audio_stop_sound(snd_skiddingvertical);
					}
				}
				if (vspeed >= 4)
				{
					vspeed = 4;
				}
			
				#region /* If there is no wall beside when climbing, then stop climbing */
				if (!place_meeting(x - 1, y, obj_wall))
				and (image_xscale < 0)
				or (!place_meeting(x + 1, y, obj_wall))
				and (image_xscale > 0)
				{
					stick_to_wall = false;
					if (asset_get_type("snd_skiddingvertical") == asset_sound)
					and (audio_is_playing(snd_skiddingvertical))
					{
						audio_stop_sound(snd_skiddingvertical);
					}
				}
				#endregion /* If there is no wall beside when climbing, then stop climbing END */
			
			}
		
			#region /* Wall Climb */
			if (allow_wall_climb == true)
			or (place_meeting(x, y, obj_wall_climb_panel))
			{
				dive = false;
				last_standing_y = y;
				if (key_down)
				and (!key_up)
				and (takendamage <= takendamage_freezetime)
				{
					if (!audio_is_playing(snd_move_ivy))
					{
						scr_audio_play(snd_move_ivy, volume_source.sound);
					}
					can_ground_pound = false;
					ledge_grab_jump = false;
					vspeed = +4;
				}
				else
				if (key_up)
				and (!key_down)
			
				or (image_xscale < 0)
				and (key_left_hold)
				and (!key_right_hold)
			
				or (image_xscale > 0)
				and (key_right_hold)
				and (!key_left_hold)
				{
					if (bbox_bottom> 0)
					and (takendamage <= takendamage_freezetime)
					{
						if (!place_meeting(x, y - 16, obj_wall))
						{
							if (!audio_is_playing(snd_move_ivy))
							{
								scr_audio_play(snd_move_ivy, volume_source.sound);
							}
							can_ground_pound = true;
							can_dive = true;
							ledge_grab_jump = true; /* Make the player move forward when climbing up over edge of wall */
							vspeed = -4;
						}
						else
						{
						
							#region /* Stop climbing up if there is a wall above you */
							if (!audio_is_playing(snd_bump))
							{
								scr_audio_play(snd_bump, volume_source.sound);
							}
							#endregion /* Stop climbing up if there is a wall above you END */
					
						}
					}
					else
					{
					
						#region /* Stop climbing up if you're above the level and there is nothing above you */
						if (!audio_is_playing(snd_bump))
						{
							scr_audio_play(snd_bump, volume_source.sound);
						}
						#endregion /* Stop climbing up if you're above the level and there is nothing above you END */
					
					}
				}
				else
				if (vspeed >= 0)
				{
					can_ground_pound = true;
					can_dive = true;
					ledge_grab_jump = false;
					vspeed = 0;
					gravity = 0;
				}
			}
			#endregion /* Wall Climb END */

			#region /* When pressing the jump button and besides the wall, do the wall jump */
			if (key_jump)
			and (place_meeting(x + 1, y, obj_wall))
			and (!place_meeting(x, y + 1, obj_wall))
			and (asset_get_type("obj_semisolid_platform") == asset_object)
			and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		
			or (key_jump)
			and (place_meeting(x - 1, y, obj_wall))
			and (!place_meeting(x, y + 1, obj_wall))
			and (asset_get_type("obj_semisolid_platform") == asset_object)
			and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		
			or (allow_dive == true)
			and (key_dive_pressed) /* Press dive to jump from wall using a dive */
			and (key_left_hold)
			and (!key_right_hold)
			and (place_meeting(x + 1, y, obj_wall))
		
			or (allow_dive == true)
			and (key_dive_pressed) /* Press dive to jump from wall using a dive */
			and (key_right_hold)
			and (!key_left_hold)
			and (place_meeting(x - 1, y, obj_wall))
			{
				if (crouch == false)
				and (ground_pound == false)
				and (ledge_grab == false)
				and (horizontal_rope_climb == false)
				{
					spring = false;
					scr_audio_play(voice_wallkick, volume_source.voice);
					scr_audio_play(snd_wallkick, volume_source.sound);
					angle = 0;
					last_standing_y = y;
					image_index = 0;
					if (place_meeting(x + 1, y, obj_wall))
					{
						image_xscale = -1;
						hspeed = -6;
					}
					else
					if (place_meeting(x - 1, y, obj_wall))
					{
						image_xscale = +1;
						hspeed = +6;
					}
					jump = 1;
					triplejumpdelay = 50;
					wall_jump = wall_jump_time;
					crouch = false;
					stick_to_wall = false;
					ledge_grab_jump = false;
					speed_max = 8;
					vspeed = -normal_jump_height;
					midair_jumps_left = number_of_jumps - 1;
					image_index = 0;
					effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_top + 8, 0, c_white);
					if (asset_get_type("obj_wall_jumpspark") == asset_object)
					{
						instance_create_depth(x, y, 0, obj_wall_jumpspark);
					}
				}
			}
			#endregion /* When pressing the jump button and besides the wall, do the wall jump END */

		}
		else
		{
			pressing_opposite_direction_to_drop_off_from_wall = 0;
		}
		if (wall_jump > 0)
		{
			wall_jump -= 1;
			if (vspeed >= 0)
			{
				stick_to_wall = false;
			}
			if (vspeed < 0)
			{
		
				#region /* Change direction when diving */
				if (key_dive_pressed)
				and (allow_dive == true)
				and (key_left_hold)
				and (!key_right_hold)
				{
					image_xscale = -1;
				}
				else
				if (key_dive_pressed)
				and (allow_dive == true)
				and (key_right_hold)
				and (!key_left_hold)
				{
					image_xscale = +1;
				}
				#endregion /* Change direction when diving END */
		
				crouch = false;
			}
		}

		#region /* When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall jump liding down state */
		if (key_down)
		and (!key_left_hold)
		and (!key_right_hold)
		and (key_sprint_pressed)
		and (stick_to_wall == true)
		or (key_down)
		and (!key_left_hold)
		and (!key_right_hold)
		and (key_dive_pressed)
		and (stick_to_wall == true)
		or (pressing_opposite_direction_to_drop_off_from_wall >= 10)
		{
			if (place_meeting(x - 1, y, obj_wall))
			{
				x += 1;
			}
			if (place_meeting(x + 1, y, obj_wall))
			{
				x -= 1;
			}
			pressing_opposite_direction_to_drop_off_from_wall = 0;
			climb = false;
			horizontal_rope_climb = false;
			dive = false;
			drop_off_wall_climb = 10; /* Drop down from wall climbing */
			hspeed = 0;
			vspeed = +1;
			midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
			stick_to_wall = false;
			crouch = false;
		}
		else
		if (key_jump)
		and (key_right_hold)
		and (!key_left_hold)
		and (wall_jump_setting >= 1)
		and (place_meeting(x + 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
		or (key_jump)
		and (key_left_hold)
		and (!key_right_hold)
		and (wall_jump_setting >= 1)
		and (place_meeting(x - 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
		or (key_jump)
		and (wall_jump_setting == 1)
		and (place_meeting(x + 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
		or (key_jump)
		and (wall_jump_setting == 1)
		and (place_meeting(x - 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
		or (key_jump)
		and (key_right_hold)
		and (!key_left_hold)
		and (wall_jump_setting <= 0)
		and (place_meeting(x, y, obj_wall_climb_panel))
		and (place_meeting(x + 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
		or (key_jump)
		and (key_left_hold)
		and (!key_right_hold)
		and (wall_jump_setting <= 0)
		and (place_meeting(x, y, obj_wall_climb_panel))
		and (place_meeting(x - 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
		or (key_jump)
		and (key_right_hold)
		and (!key_left_hold)
		and (wall_jump_setting <= 0)
		and (place_meeting(x, y, obj_wall_jump_panel))
		and (place_meeting(x + 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	
		or (key_jump)
		and (key_left_hold)
		and (!key_right_hold)
		and (wall_jump_setting <= 0)
		and (place_meeting(x, y, obj_wall_jump_panel))
		and (place_meeting(x - 1, y, obj_wall))
		and (!place_meeting(x, y + 16, obj_wall))
		and (asset_get_type("obj_semisolid_platform") == asset_object)
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
		and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
		{
			if (crouch == false)
			and (ground_pound == false)
			and (ledge_grab == false)
			and (horizontal_rope_climb == false)
			{
				spring = false;
				scr_audio_play(choose(voice_wallkick, voice_jump), volume_source.voice);
				scr_audio_play(snd_wallkick, volume_source.sound);
				angle = 0;
				last_standing_y = y;
				image_index = 0;
				if (place_meeting(x + 1, y, obj_wall))
				{
					image_xscale = -1;
					if (!place_meeting(x - 6, y, obj_wall))
					{
						hspeed = -6;
					}
				}
				else
				if (place_meeting(x - 1, y, obj_wall))
				{
					image_xscale = +1;
					if (!place_meeting(x + 6, y, obj_wall))
					{
						hspeed = +6;
					}
				}
				jump = 1;
				triplejumpdelay = 50;
				wall_jump = wall_jump_time;
				crouch = false;
				stick_to_wall = false;
				ledge_grab_jump = false;
				speed_max = 8;
				glide = false;
				can_glide = 3;
				vspeed = -normal_jump_height;
				image_index = 0;
				effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
				effect_create_above(ef_smoke, x, bbox_top + 8, 0, c_white);
				if (asset_get_type("obj_wall_jumpspark") == asset_object)
				{
					instance_create_depth(x, y, 0, obj_wall_jumpspark);
				}
			}
		}
		#endregion /* When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall jump liding down state */
	
	}
	else
	{
		stick_to_wall = false;
	}
	if (stick_to_wall == false)
	{
		if (asset_get_type("snd_skiddingvertical") == asset_sound)
		and (audio_is_playing(snd_skiddingvertical))
		{
			audio_stop_sound(snd_skiddingvertical);
		}
	}
	if (drop_off_wall_climb > 0)
	{
		drop_off_wall_climb -= 1;
	}
	#endregion /* Wall Jump and Wall Climb END */
	
}