function scr_set_narrator()
{
	/* Narrator set to Nobody */
	if (global.narrator_selection <= -2)
	{
		global.narrator = -1;
	}
	else
	
	/* Narrator set to Match Player 1 */
	if (global.narrator_selection == -1)
	{
		global.narrator = global.character_index[0];
	}
	else
	
	/* Narrator set to specific character */
	if (global.narrator_selection >= 0)
	{
		global.narrator = global.narrator_selection;
	}
}