function scr_generate_id(what_kind_of_id = "level")
{
	/* Define the character set for the ID. Omitted letters that look too similar to numbers. O looks like 0, I looks like 1, Z looks like 2 */
	var char_set = "ABCDEFGHJKLMNPQRSTUVWXY0123456789";
	var id_length = 9;
	
	/* Generate the ID using a loop */
	var generate_id = "";
	for (var i = 0; i < id_length; i++)
	{
		var random_index = irandom_range(0, string_length(char_set) - 1);
		generate_id += string_char_at(char_set, random_index);
	}
	
	/* Save the ID and username in the .ini file */
	if (what_kind_of_id == "level")
	{
		ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		ini_write_string("info", "level_id", string(generate_id)); /* Save the level ID in the level_information.ini file, so that it can be referenced later */
		level_id = generate_id;
	}
	else
	if (what_kind_of_id == "character")
	{
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
		ini_write_string("info", "character_id", string(generate_id)); /* Save the character ID in the character_config.ini file, so that it can be referenced later */
		character_id = generate_id;
	}
	ini_write_string("info", "username", string(global.username)); /* Save the username in the .ini file, so that it can be referenced later */
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}