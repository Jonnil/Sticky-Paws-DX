function scr_player_move_drowning()
{
	
	#region /* Drowning */
	if (allow_drowning)
	and (can_move)
	and (goal == false)
	and (global.assist_enable)
	and (global.assist_breathe_underwater == false)
	or (allow_drowning)
	and (can_move)
	and (goal == false)
	and (global.assist_enable == false)
	{
		drawn_frames_until_drowning = lerp(drawn_frames_until_drowning, frames_until_drowning, 0.1);
		if (in_water)
		and (in_breathable_water == false)
		{
			frames_until_drowning = clamp(frames_until_drowning- 1, -60, seconds_until_drowning* 60);
			if (frames_until_drowning <= -60)
			and (goal == false)
			if (takendamage <= 0)
			and (assist_invincible == false)
			{
				if (have_heart_balloon)
				{
					have_heart_balloon = false;
				
					#region /* Save heart balloon to be false */
					if (player == 1)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player1_have_heart_balloon", false);
						ini_close();
					}
					if (player == 2)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player2_have_heart_balloon", false);
						ini_close();
					}
					if (player == 3)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player3_have_heart_balloon", false);
						ini_close();
					}
					if (player == 4)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player4_have_heart_balloon", false);
						ini_close();
					}
					#endregion /* Save heart balloon to be false END */
				
				}
				else
				{
					hp -= 1;
				}
				takendamage = 100;
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