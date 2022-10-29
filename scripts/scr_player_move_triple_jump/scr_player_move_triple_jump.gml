function scr_player_move_triple_jump()
{
	
	#region /* Triple Jump */
	if (on_ground == true)
	{
		if (triplejumpdelay > 0)
		{
			triplejumpdelay -= 1;
		}
		if (triplejumpdelay < 1)
		and (vspeed >= 0)
		{
			jump = 0;
		}
	
		#region /* Stop horizontal speed if you land after triple jump without holding direction */
		if (jump >= 3)
		and (vspeed >= 0)
		and (allow_stop_after_landing_triple_jump)
		{
			jump = 0;
			if (!key_left_hold)
			and (!key_right_hold)
			{
				hspeed = 0;
			}
		}
		#endregion /* Stop horizontal speed if you land after triple jump without holding direction END */
	
	}
	#endregion /* Triple Jump END */
	
}