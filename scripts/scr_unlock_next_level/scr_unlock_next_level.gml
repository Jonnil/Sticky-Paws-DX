function scr_unlock_next_level() /*Make next level enterable/unlock if you have cleared this level*/
{
	if (clear_rate = "closed")
	{
		if (level = string(ini_read_real("Player","number_of_levels_cleared",0)))
		{
			clear_rate = "enter";
		}
	}
}