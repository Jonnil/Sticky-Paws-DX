function scr_player_move_double_tap_direction_to_dive()
{
	
	#region /* Double-tap direction to dive*/
	if (double_tap_to_dive)
	{
	
		#region /* Double tap left direction to dive */
		if (key_left_pressed)
		{
			if (double_tap_left_dive == false)
			{
				double_tap_left_dive = true;
				double_tap_right_dive = false;
				double_tap_dive_timer = 15;
			}
			else
			if (double_tap_left_dive == 2)
			{
				double_tap_dive = true; /* Make player dive when double tapping direction */
				double_tap_left_dive = 3;
				double_tap_dive_timer = 15;
			}
		}
		#endregion /* Double tap left direction to dive END */
		
		else
		
		#region /* Double tap right direction to dive */
		if (key_right_pressed)
		{
			if (double_tap_right_dive == false)
			{
				double_tap_right_dive = true;
				double_tap_left_dive = false;
				double_tap_dive_timer = 15;
			}
			else
			if (double_tap_right_dive = 2)
			{
				double_tap_dive = true; /* Make player dive when double tapping direction */
				double_tap_right_dive = 3;
				double_tap_dive_timer = 15;
			}
		}
		#endregion /* Double tap right direction to dive END */
	
		else
		if (!key_left_hold)
		and (!key_right_hold)
		{
			if (double_tap_left_dive)
			and (double_tap_dive_timer <= 28)
			{
				double_tap_dive = false;
				double_tap_left_dive = 2;
			}
			else
			if (double_tap_right_dive)
			and (double_tap_dive_timer <= 28)
			{
				double_tap_dive = false;
				double_tap_right_dive = 2;
			}
			else
			if (double_tap_left_dive >= 3)
			or (double_tap_right_dive >= 3)
			{
				double_tap_dive = false;
				double_tap_dive_timer = 0;
				double_tap_left_dive = false;
				double_tap_right_dive = false;
			}
			double_tap_dive = false;
		}
	}
	if (double_tap_dive_timer > 0)
	{
		double_tap_dive_timer -= 1;
	}
	if (double_tap_dive_timer <= 0)
	{
		double_tap_dive = false;
		double_tap_dive_timer = 0;
		double_tap_left_dive = false;
		double_tap_right_dive = false;
	}
	#endregion /* Double-tap direction to dive END */
	
}