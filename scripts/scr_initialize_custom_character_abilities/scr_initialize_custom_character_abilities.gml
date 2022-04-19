/// @desc scr_initialize_custom_character_abilities(ability_variable, default_value);
/// @description scr_initialize_custom_character_abilities(ability_variable, default_value);
/// @arg ability_variable
/// @arg default_value

function scr_initialize_custom_character_abilities(argument0, argument1, argument2)
{
	/*argument0. Ability variable. The name of the ability*/
	/*argument2. Ability default value. The default value of the ability*/
	
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini");
		can_save_to_character_config = false; /*You can't save values to included files*/
	}
	else
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini");
		can_save_to_character_config = true; /*You can save values to local appdata*/
	}
	
	#region /*Allow Ability*/
	if (ini_key_exists("allow abilities", string(argument1)))
	{
		argument0 = ini_read_real("allow abilities", string(argument1), argument2);
	}
	else
	{
		if (can_save_to_character_config = true)
		{
			ini_write_real("allow abilities", string(argument1), argument2);
		}
		argument0 = argument2;
	}
	#endregion /*Allow Ability END*/
	
	ini_close();
	
	return (argument0);
}