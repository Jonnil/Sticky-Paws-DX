function scr_player_move_jumping()
{

	#region /* Jumping */
	if (buffer_jump > 0)
	{
		buffer_jump--;
	}

	if (key_jump)
	&& (number_of_jumps >= 1 || number_of_jumps <= -1)
	{
		buffer_jump = 20; /* Set the buffer jump to be 20 frames, so player have enough time to buffer jump when landing again */
	}

	if (coyote_jump > 0)
	{
		coyote_jump--;
	}

	if (on_ground)
	{
		coyote_jump = 10; /* Set the coyote jump to be 10 frames. The player still has the ability to jump after walking off a ledge for a few frames */
	}

	if (buffer_jump > 0)
	&& (can_move)
	&& (key_jump_hold)
	{

		#region /* Drop down below semisolid platform */
		if (key_crouch_hold || key_down)
		&& (ground_pound == 0)
		&& (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		&& (!place_meeting(x, y + 1, obj_wall))
		{
			on_ground = false;
			coyote_jump = 0; /* Reset coyote jump timer back to 0 when dropping from semisolid platform */
			can_ground_pound = false;
			can_mid_air_jump = 10;
			vspeed = 0.01;
			y += 8;
		}
		#endregion /* Drop down below semisolid platform END */

		else
		if (ground_pound == 0)
		{
			if (coyote_jump > 0)
			{
				if (abs(hspeed) > (speed_max_run -1))
				&& (jump == 2)
				{
					jump = 3; /* If running, and doing 2nd jump, do triple jump */
				}
				else
				if (jump <= 1)
				{
					jump = clamp(jump + 1, 0, 3); /* Increase jump if doing 1st jump */
				}
				else
				{
					jump = 1; /* If done triple jump and jump again, or done 2nd jump with not enough speed, go back to 1st jump */
				}
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				buffer_jump = 0; /* Reset jump buffer timer back to 0 when jumping */
				coyote_jump = 0; /* Reset coyote jump timer back to 0 when jumping */
				dive = false;
				glide = false;
				triplejumpdelay = 12;
				if (abs(hspeed) > (speed_max_walk - 1))
				|| (key_up)
				{
					if (abs(hspeed) > (speed_max_run - 1))
					&& (jump >= 3)
					{
						if (!place_meeting(x, y - 8, obj_wall))
						{
							vspeed = -triple_jump_height;
						}
						else
						{
							vspeed = -1;
						}
						if (image_xscale > 0)
						{
							angle = +720;
						}
						else
						{
							angle = -720;
						}
					}
					else
					{
						if (!place_meeting(x, y - 8, obj_wall))
						{
							vspeed = -higher_jump_height;
						}
						else
						{
							vspeed = -1;
						}
					}
				}
				else
				{
					if (!place_meeting(x, y - 8, obj_wall))
					{
						vspeed = -normal_jump_height;
					}
					else
					{
						vspeed = -1;
					}
				}

				#region /* Smoke effect under player when jumping */
				if (coyote_jump > 0)
				{
					effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
					effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
				}
				#endregion /* Smoke effect under player when jumping END */

				image_index = 0;

				#region /* Jump sound sfx */
				if (jump >= 3)
				&& (hold_item_in_hands == "")
				&& (abs(hspeed) > (speed_max_run -1))
				{
					scr_audio_play(snd_3rdjump, volume_source.sound);
				}
				else
				{
					scr_audio_play(snd_jump, volume_source.sound);
				}
				if (jump >= 3)
				&& (abs(hspeed) > (speed_max_run - 1))
				{
					scr_audio_play(voice_jump3rd, volume_source.voice);
				}
				else
				if (jump == 2)
				{
					scr_audio_play(voice_jump2nd, volume_source.voice);
				}
				else
				{
					scr_audio_play(voice_jump, volume_source.voice);
				}
				#endregion /* Jump sound effect END */
				draw_xscale = 0.75;
				draw_yscale = 1.25;
			}
		}
	}
	#endregion /* Jumping END */

}
