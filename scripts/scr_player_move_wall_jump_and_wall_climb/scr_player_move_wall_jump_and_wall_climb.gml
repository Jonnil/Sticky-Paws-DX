function scr_player_move_wall_jump_and_wall_climb()
{
	var wall_collision_left = place_meeting(x - 1, y, obj_wall) && !place_meeting(x - 1, y, obj_black_wall); /* Can't climb on black walls. Stop climbing if you are climbing on black wall */
	var wall_collision_right = place_meeting(x + 1, y, obj_wall) && !place_meeting(x + 1, y, obj_black_wall);

	#region /* Wall Jump and Wall Climb */
	if (can_move
	&& taken_damage <= taken_damage_freezetime
	&& hold_item_in_hands == "")
	&& ((allow_wall_jump
	&& can_wall_jump
	&& wall_jump_setting >= 1)
	|| (place_meeting(x, y, obj_wall_jump_panel))
	|| (place_meeting(x, y, obj_wall_climb_panel)))
	{
		if (!on_ground
		&& !climb
		&& !horizontal_rope_climb
		&& vspeed >= 0
		&& !place_meeting(x, y + 32, obj_wall))
		{
			if ((key_left_hold && !key_right_hold && wall_jump_setting >= 1 && wall_collision_left) ||
			(!key_right_hold && !dive && wall_jump_setting == 1 && image_xscale < 0 && wall_collision_left) ||
			(dive && wall_jump_setting == 1 && image_xscale < 0 && wall_collision_left) ||
			(key_left_hold && !key_right_hold && wall_jump_setting <= 0 && wall_collision_left &&
			(place_meeting(x, y, obj_wall_climb_panel) || place_meeting(x, y, obj_wall_jump_panel))))
			{
				if (!crouch && !ground_pound && !ledge_grab && !burnt)
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
			if ((key_right_hold && !key_left_hold && wall_jump_setting >= 1 && wall_collision_right) ||
			(!key_left_hold && !dive && wall_jump_setting == 1 && image_xscale > 0 && wall_collision_right) ||
			(dive && wall_jump_setting == 1 && image_xscale > 0 && wall_collision_right) ||
			(key_right_hold && !key_left_hold && wall_jump_setting <= 0 && wall_collision_right &&
			(place_meeting(x, y, obj_wall_climb_panel) || place_meeting(x, y, obj_wall_jump_panel))))
			{
				if (!crouch && !ground_pound && !ledge_grab && !burnt)
				{
					angle = 0;
					image_xscale = 1;
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
		if (stick_to_wall)
		{
			/* Pressing opposite direction to drop off from wall */
			if ((key_left_hold && !key_right_hold && image_xscale == +1) ||
			(key_right_hold && !key_left_hold && image_xscale == -1))
			{
				dive = false;
				pressing_opposite_direction_to_drop_off_from_wall++;
			}
			else
			if (pressing_opposite_direction_to_drop_off_from_wall > 0)
			{
				pressing_opposite_direction_to_drop_off_from_wall--;
			}

			/* If there is ground under you when trying to go down, then stop wall climbing */
			if (on_ground)
			{
				stick_to_wall = false;
				wall_climb_slippy = 0;
				audio_stop_sound(snd_skiddingvertical);
			}

			if (!crouch && !ground_pound && !ledge_grab)
			{
				if (vspeed > 0 && position_meeting(x + 18 * image_xscale, bbox_top, obj_wall))
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

				vspeed = clamp(vspeed, -4, 4); /* Limit the vspeed between -4 and 4 */

				/* If there is no wall beside when climbing, then stop climbing */
				if (image_xscale < 0
				&& (!place_meeting(x - 1, y, obj_wall)
				|| place_meeting(x - 1, y, obj_black_wall))) /* Stop climbing if you are climbing on black wall */
				|| (image_xscale > 0
				&& (!place_meeting(x + 1, y, obj_wall)
				|| place_meeting(x + 1, y, obj_black_wall)))
				{
					stick_to_wall = false;
					wall_climb_slippy = 0;
					audio_stop_sound(snd_skiddingvertical);
				}
			}

			#region /* Wall Climb */
			if (allow_wall_climb || place_meeting(x, y, obj_wall_climb_panel))
			{
				dive = false;
				last_standing_y = y;

				if (vspeed >= 0)
				{
					can_ground_pound = true;
					can_dive = true;
					ledge_grab_jump = false;
					vspeed = 0;
					gravity = 0;
				}

				#region /* Climbing Wall Down */
				if (key_down
				&& !key_up
				&& taken_damage <= taken_damage_freezetime)
				{
					if (!audio_is_playing(snd_move_ivy))
					{
						scr_audio_play(snd_move_ivy, volume_source.sound);
					}
					can_ground_pound = false;
					ledge_grab_jump = false;
					vspeed = +4;
				}
				#endregion /* Climbing Wall Down END */

				else

				#region /* Climbing Wall Up */
				if ((key_up
				&& !key_down)
				|| (image_xscale < 0 && key_left_hold && !key_right_hold)
				|| (image_xscale > 0 && key_right_hold && !key_left_hold))
				&& (bbox_bottom > 0 && taken_damage <= taken_damage_freezetime)
				{
					if (!place_meeting(x, y - 16, obj_wall))
					{
						if (!audio_is_playing(snd_move_ivy))
						{
							scr_audio_play(snd_move_ivy, volume_source.sound);
						}
						can_ground_pound = true;
						can_dive = true;
						ledge_grab_jump = true;
						vspeed = -4;
					}
					else
					{
						if (!audio_is_playing(snd_bump))
						{
							scr_audio_play(snd_bump, volume_source.sound);
						}
					}
				}
				#endregion /* Climbing Wall Up END */

				#region /* Climbing Ice Blocks makes you slip off */
				if (image_xscale < 0 && place_meeting(x - 1, y, obj_ice_block))
				|| (image_xscale > 0 && place_meeting(x + 1, y, obj_ice_block))
				{
					if (wall_climb_slippy < 16)
					{
						wall_climb_slippy += 0.1;
					}
					vspeed += wall_climb_slippy;
				}
				#endregion /* Climbing Ice Blocks makes you slip off END */

			}
			#endregion /* Wall Climb END */

			/* When pressing the jump button and besides the wall, do the wall jump */
			if ((key_jump && !on_ground && (wall_collision_right)) ||
			(key_jump && !on_ground && (wall_collision_left)) ||
			(allow_dive && key_dive_pressed && key_left_hold && !key_right_hold && (wall_collision_right)) ||
			(allow_dive && key_dive_pressed && key_right_hold && !key_left_hold && (wall_collision_left)))
			{
				if (!crouch && !ground_pound && !ledge_grab && !horizontal_rope_climb)
				{
					if (wall_collision_right)
					{
						image_xscale = -1;
						hspeed = -6;
					}
					else
					if (wall_collision_left)
					{
						image_xscale = +1;
						hspeed = +6;
					}

					angle = 0;
					crouch = false;
					dive = false;
					jump = 1;
					last_standing_y = y;
					ledge_grab_jump = false;
					midair_jumps_left = number_of_jumps - 1;
					speed_max = 8;
					spring = false;
					stick_to_wall = false;
					triplejumpdelay = 50;
					wall_climb_slippy = 0;
					wall_jump = wall_jump_time;

					audio_stop_sound(snd_skiddingvertical);
					effect_create_above(ef_smoke, x, bbox_bottom - 8, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_top + 8, 0, c_white);
					scr_audio_play(snd_wallkick, volume_source.sound);
					scr_audio_play(voice_wallkick, volume_source.voice);

					image_index = 0;
					vspeed = -normal_jump_height;

				}
			}
		}
		else
		{
			pressing_opposite_direction_to_drop_off_from_wall = 0;
		}
		if (wall_jump > 0)
		{
			wall_jump--;
			if (vspeed >= 0)
			{
				stick_to_wall = false;
				wall_climb_slippy = 0;
				audio_stop_sound(snd_skiddingvertical);
			}
			else
			if (vspeed < 0)
			{
				if (key_dive_pressed && allow_dive && key_left_hold && !key_right_hold)
				{
					image_xscale = -1;
				}
				else
				if (key_dive_pressed && allow_dive && key_right_hold && !key_left_hold)
				{
					image_xscale = +1;
				}
				crouch = false;
			}
		}

		#region /* When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall cling state */
		if ((key_down && !key_left_hold && !key_right_hold && key_run_pressed && stick_to_wall)
		|| (key_down && !key_left_hold && !key_right_hold && key_dive_pressed && stick_to_wall)
		|| (pressing_opposite_direction_to_drop_off_from_wall >= 10))
		{
			if (wall_collision_left)
			{
				x++;
			}
			if (wall_collision_right)
			{
				x--;
			}
			pressing_opposite_direction_to_drop_off_from_wall = 0;
			climb = false;
			horizontal_rope_climb = false;
			dive = false;
			drop_off_wall_climb = 10;
			hspeed = 0;
			vspeed = 1;
			midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
			stick_to_wall = false;
			wall_climb_slippy = 0;
			audio_stop_sound(snd_skiddingvertical);
			crouch = false;
		}
		else
		if (key_jump && !on_ground)
		{
			var wallJumpSetting = wall_jump_setting;
			var wallCollision = false;
			var semisolidPlatformCollision = false;
			semisolidPlatformCollision = position_meeting(x, bbox_bottom + 1, obj_semisolid_platform) || position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform) || position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform);
			if (key_right_hold && !key_left_hold && wallJumpSetting >= 1)
			{
				wallCollision = wall_collision_right;
			}
			else
			if (key_left_hold && !key_right_hold && wallJumpSetting >= 1)
			{
				wallCollision = wall_collision_left;
			}
			else
			if ((wallJumpSetting == 1) && (wall_collision_right || wall_collision_left))
			{
				wallCollision = !place_meeting(x, y + 16, obj_wall);
			}
			else
			if ((key_right_hold && !key_left_hold && wallJumpSetting <= 0) || (key_left_hold && !key_right_hold && wallJumpSetting <= 0))
			{
				wallCollision = place_meeting(x, y, obj_wall_climb_panel) && wall_collision_right;
			}
			else
			if ((key_right_hold && !key_left_hold && wallJumpSetting <= 0) || (key_left_hold && !key_right_hold && wallJumpSetting <= 0))
			{
				wallCollision = place_meeting(x, y, obj_wall_climb_panel) && wall_collision_left;
			}
			else
			if ((key_right_hold && !key_left_hold && wallJumpSetting <= 0) || (key_left_hold && !key_right_hold && wallJumpSetting <= 0))
			{
				wallCollision = place_meeting(x, y, obj_wall_jump_panel) && wall_collision_right;
			}
			else
			if ((key_right_hold && !key_left_hold && wallJumpSetting <= 0) || (key_left_hold && !key_right_hold && wallJumpSetting <= 0))
			{
				wallCollision = place_meeting(x, y, obj_wall_jump_panel) && wall_collision_left;
			}
			if (!crouch && ground_pound == 0 && !ledge_grab && !horizontal_rope_climb)
			{
				if (wallCollision && !semisolidPlatformCollision)
				{
					spring = false;
					scr_audio_play(choose(voice_wallkick, voice_jump), volume_source.voice);
					scr_audio_play(snd_wallkick, volume_source.sound);
					angle = 0;
					last_standing_y = y;
					image_index = 0;
					if (wall_collision_right)
					{
						image_xscale = -1;
						if (!place_meeting(x - 6, y, obj_wall))
						{
							hspeed = -6;
						}
					}
					else
					if (wall_collision_left)
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
					wall_climb_slippy = 0;
					audio_stop_sound(snd_skiddingvertical);
					ledge_grab_jump = false;
					speed_max = 8;
					glide = false;
					can_glide = 3;
					vspeed = -normal_jump_height;
					image_index = 0;
					effect_create_above(ef_smoke, x, bbox_bottom - 8, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_top + 8, 0, c_white);
				}
			}
		}
		#endregion /* When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall cling state */

	}
	else
	{
		stick_to_wall = false;
		wall_climb_slippy = 0;
	}
	if (drop_off_wall_climb > 0)
	{
		drop_off_wall_climb--;
	}
	#endregion /* Wall Jump and Wall Climb END */

}
