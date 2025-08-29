function scr_player_move_run()
{

	#region /* Run */
	if (goal)
	&& (global.time_countdown_bonus <= 0)
	{
		speed_max = lerp(speed_max, speed_max_run, 0.1);
	}
	else
	{
		if (crouch)
		&& (on_ground)
		{
			if (allow_crawl)
			{
				speed_max = lerp(speed_max, speed_max_walk * 0.5, 0.05);
			}
			else
			{
				speed_max = lerp(speed_max, 0, 0.05);
				hspeed = 0;
			}
		}
		else
		if (key_run)
		&& (allow_run)
		|| (double_tap_left == 3)
		&& (allow_run)
		|| (double_tap_right == 3)
		&& (allow_run)
		{
			if (key_left_hold)
			&& (ground_pound == 0)
			|| (key_right_hold)
			&& (ground_pound == 0)
			{
				if (invincible_timer >= 2)
				{
					speed_max = lerp(speed_max, 10, 0.1);
				}
				else
				{
					if (speed_max < speed_max_run)
					{
						speed_max = lerp(speed_max, speed_max_run, 0.1);
					}
				}
			}
		}
		else
		{
			if (on_ground)
			{
				if (invincible_timer >= 2)
				{
					speed_max = lerp(speed_max, 6, 0.05);
				}
				else
				{
					speed_max = lerp(speed_max, speed_max_walk, 0.05);
				}
			}
		}
	}
	#endregion /* Run END */

}
