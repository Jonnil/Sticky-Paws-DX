/// @desc scr_initialize_custom_character_abilities(what_player, ability_variable, ability_string, default_value);
/// @description scr_initialize_custom_character_abilities(what_player, ability_variable, ability_string, default_value);
/// @arg what_player
/// @arg ability_variable
/// @arg ability_string
/// @arg default_value

function scr_initialize_custom_character_abilities(argument0, argument1, argument2, argument3)
{
	/*argument1. Ability variable. The name of the ability*/
	/*argument2. Ability string. The name of the ability in string*/
	/*argument3. Ability default value. The default value of the ability*/
	
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument0])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument0])) + "/data/character_config.ini");
		can_save_to_character_config = false; /*You can't save values to included files*/
	}
	else
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[argument0])) + "/data/character_config.ini");
		can_save_to_character_config = true; /*You can save values to local appdata*/
	}
	
	#region /*Allow Ability*/
	if (ini_key_exists("allow abilities", string(argument2)))
	{
		argument1 = ini_read_real("allow abilities", string(argument2), argument3);
	}
	else
	{
		if (can_save_to_character_config = true)
		and (ds_list_find_value(global.all_loaded_characters, global.character_index[argument0]) != undefined)
		{
			ini_write_real("allow abilities", string(argument2), argument3);
		}
		argument1 = argument3;
	}
	#endregion /*Allow Ability END*/
	
	ini_close();
	
	return (argument1);
}