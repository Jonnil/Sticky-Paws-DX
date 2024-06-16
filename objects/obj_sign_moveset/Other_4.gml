if (show_button_graphic)
{
	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (global.player_can_play[i])
		{
			what_player = i;
			break; /* Exit the loop once a player is found */
		}
	}
}