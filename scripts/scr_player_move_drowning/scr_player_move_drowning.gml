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
			{
				scr_player_move_take_damage();
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
