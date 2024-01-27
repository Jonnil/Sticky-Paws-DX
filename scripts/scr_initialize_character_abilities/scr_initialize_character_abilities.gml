function scr_initialize_character_abilities(what_player = player - 1, ability_string = "", default_value = false, section_string = "allow abilities")
{
	/* ability_string. Ability string. The name of the ability in string */
	/* default_value. Ability default value. The default value of the ability */
	
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
	
}