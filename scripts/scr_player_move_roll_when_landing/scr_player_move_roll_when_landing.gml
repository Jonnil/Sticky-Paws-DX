function scr_player_move_roll_when_landing()
{

	#region /* Roll when landing */
	if (allow_roll)
	&& (on_ground)
	{
		if (y > last_standing_y + 4)
		{
			if (hspeed > 0)
			{
				angle = +360;
				roll = true;
			}
			else
			if (hspeed < 0)
			{
				angle = -360;
				roll = true;
			}
		}
	}
	#endregion /* Roll when landing END */

}
