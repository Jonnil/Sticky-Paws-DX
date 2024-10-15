function scr_player_move_drowning()
{
	
	#region /* Drowning */
	if (allow_drowning)
	&& (can_move)
	&& (!goal)
	&& (global.assist_enable)
	&& (!global.assist_breathe_underwater)
	|| (allow_drowning)
	&& (can_move)
	&& (!goal)
	&& (!global.assist_enable)
	{
		drawn_frames_until_drowning = lerp(drawn_frames_until_drowning, frames_until_drowning, 0.1);
		if (in_water)
		&& (!in_breathable_water)
		{
			frames_until_drowning = clamp(frames_until_drowning- 1, -60, seconds_until_drowning* 60);
			if (frames_until_drowning <= -60)
			&& (!goal)
			if (taken_damage <= 0)
			&& (invincible_timer == 0)
			{
				if (have_heart_balloon)
				{
					have_heart_balloon = false;
				
					#region /* Save heart balloon to be false */
					ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
					ini_write_real("Player", "player" + string(player) + "_have_heart_balloon", false);
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					#endregion /* Save heart balloon to be false END */
				
				}
				else
				{
					hp --;
				}
				taken_damage = 200; /* Invincibility frames */
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