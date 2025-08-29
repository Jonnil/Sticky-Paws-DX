function scr_set_narrator(save = true)
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

	if (save)
	{
		/* Commit narrator and narrator selection to memory */
		ini_open(game_save_id + "save_file/config.ini");
		ini_write_real("config", "narrator", global.narrator);
		ini_write_real("config", "narrator_selection", global.narrator_selection);
		ini_close();
	}
}
