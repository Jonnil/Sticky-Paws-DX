function scr_player_move_drowning()
{
	
	#region /* Drowning */
	if (allow_drowning)
	&& (can_move)
	&& (goal == false)
	&& (global.assist_enable)
	&& (global.assist_breathe_underwater == false)
	|| (allow_drowning)
	&& (can_move)
	&& (goal == false)
	&& (global.assist_enable == false)
	{
		drawn_frames_until_drowning = lerp(drawn_frames_until_drowning, frames_until_drowning, 0.1);
		if (in_water)
		&& (in_breathable_water == false)
		{
			frames_until_drowning = clamp(frames_until_drowning- 1, -60, seconds_until_drowning* 60);
			if (frames_until_drowning <= -60)
			&& (goal == false)
			if (taken_damage <= 0)
			&& (assist_invincible == false)
			{
				if (have_heart_balloon)
				{
					have_heart_balloon = false;
				
					#region /* Save heart balloon to be false */
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player" + string(player) + "_have_heart_balloon", false);
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					#endregion /* Save heart balloon to be false END */
				
				}
				else
				{
					hp --;
				}
				taken_damage = 100;
				scr_gamepad_vibration(player, 1, 10);
			}
		}
		else
		{
			frames_until_drowning = seconds_until_drowning* 60 + 1; /* Reset air meter to full */
		}
	}
	else
	{
		frames_until_drowning = seconds_until_drowning* 60 + 1; /* Reset air meter to full */
		drawn_frames_until_drowning = frames_until_drowning;
	}
	#endregion /* Drowning END */
	
}