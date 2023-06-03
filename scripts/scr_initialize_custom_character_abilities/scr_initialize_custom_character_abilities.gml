function scr_initialize_custom_character_abilities(what_player, ability_string, default_value = false, section_string = "allow abilities")
{
	/* ability_string. Ability string. The name of the ability in string */
	/* default_value. Ability default value. The default value of the ability */
	
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/character_config.ini");
		var can_save_to_character_config = false; /* You can't save values to included files */
	}
	else
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/character_config.ini");
		var can_save_to_character_config = true; /* You can save values to local appdata */
	}
	
	#region /* Allow Ability */
	if (ini_key_exists(string(section_string), string(ability_string)))
	{
		return (ini_read_real(string(section_string), string(ability_string), default_value))
	}
	else
	{
		if (can_save_to_character_config)
		&& (ds_list_find_value(global.all_loaded_characters, global.character_index[what_player]) != undefined)
		{
			ini_write_real(string(section_string), string(ability_string), default_value);
		}
		return (default_value);
	}
	#endregion /* Allow Ability END */
	
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	
}