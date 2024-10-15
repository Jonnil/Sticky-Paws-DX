function scr_unlock_placable_objects(variable_to_check /* var_struct.O */)
{
	/* Doing this code inside the "scr load object placement" takes a lot of processing power, but I have saved the code here for future use */
	/* This code was originally after this code in "scr load object placement": */
	/* if (string_char_at(str, str_pos) == "|") */
	/* { */
	
	/* Check if the object is unlocked before trying to write to the INI file */
	if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini")) /* Check if the file even exists before opening, otherwise game doesn't function properly */
	{
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		if (!ini_key_exists("Unlock Placable Objects", variable_to_check))
		{
			/* Only write to the INI file if it exists and the object is not already unlocked */
			ini_write_real("Unlock Placable Objects", variable_to_check, true);
		}
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
}