/// @desc scr_initialize_custom_character_abilities(what_player, ability_variable, ability_string, default_value);
/// @description scr_initialize_custom_character_abilities(what_player, ability_variable, ability_string, default_value);
/// @arg what_player
/// @arg ability_variable
/// @arg ability_string
/// @arg default_value

function scr_initialize_custom_character_abilities(what_player, ability_value, ability_string, default_value = false)
{
	/* ability_value. Ability variable. The name of the ability */
	/* ability_string. Ability string. The name of the ability in string */
	/* default_value. Ability default value. The default value of the ability */
	
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/character_config.ini");
		can_save_to_character_config = false; /* You can't save values to included files */
	}
	else
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player])) + "/data/character_config.ini");
		can_save_to_character_config = true; /* You can save values to local appdata */
	}
	
	#region /* Allow Ability */
	if (ini_key_exists("allow abilities", string(ability_string)))
	{
		ability_value = ini_read_real("allow abilities", string(ability_string), default_value);
	}
	else
	{
		if (can_save_to_character_config = true)
		and (ds_list_find_value(global.all_loaded_characters, global.character_index[what_player]) != undefined)
		{
			ini_write_real("allow abilities", string(ability_string), default_value);
		}
		ability_value = default_value;
	}
	#endregion /* Allow Ability END */
	
	ini_close();
	
	return (ability_value);
}