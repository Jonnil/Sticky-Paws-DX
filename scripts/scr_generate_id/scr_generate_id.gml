function scr_generate_id(what_kind_of_id = "level")
{
	/* Indicate the start of the ID generation process */
	global.creating_zip_file_description = "Starting ID generation for " + what_kind_of_id;
	show_debug_message("[scr_generate_id] Called with what_kind_of_id: " + what_kind_of_id);

	/* Define the character set for ID generation */
	var char_set = "ABCDEFGHJKLMNPQRSTUVWXY0123456789";
	var id_length = 9;
	show_debug_message("[scr_generate_id] Using char_set: " + char_set + " with id_length: " + string(id_length));
	global.creating_zip_file_description = "Generating ID using a character set of length " + string(string_length(char_set));

	/* Generate the ID using a loop */
	var generate_id = "";

	for (var i = 0; i < id_length; i++)
	{
		var random_index = irandom_range(0, string_length(char_set) - 1);
		show_debug_message("[scr_generate_id] Iteration " + string(i) + ": random_index = " + string(random_index));
		generate_id += string_char_at(char_set, random_index);
		show_debug_message("[scr_generate_id] Partial ID so far: " + generate_id);
	}

	show_debug_message("[scr_generate_id] Final generated ID: " + generate_id);
	global.creating_zip_file_description = "Generated ID: " + generate_id;

	/* Save the generated ID along with the username into the appropriate .ini file */
	if (what_kind_of_id == "level")
	{
		global.creating_zip_file_description = "Saving level ID for level: " + global.level_name;
		var ini_path = game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini";
		show_debug_message("[scr_generate_id] Saving level ID to ini file: " + ini_path);
		ini_open(ini_path);
		ini_write_string("info", "level_id", generate_id);
		level_id = generate_id;
		show_debug_message("[scr_generate_id] level_id set to: " + level_id);
	}
	else
	if (what_kind_of_id == "character")
	{
		global.creating_zip_file_description = "Saving character ID for selected character";
		var char_ini_path = game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini";
		show_debug_message("[scr_generate_id] Saving character ID to ini file: " + char_ini_path);
		ini_open(char_ini_path);
		ini_write_string("info", "character_id", generate_id);
		character_id = generate_id;
		show_debug_message("[scr_generate_id] character_id set to: " + character_id);
	}
	else
	{
		show_debug_message("[scr_generate_id] WARNING: Unknown what_kind_of_id value: " + what_kind_of_id);
	}

	global.creating_zip_file_description = "Saving username to config file";
	show_debug_message("[scr_generate_id] Saving username: " + string(global.username));
	ini_write_string("info", "username", string(global.username));
	ini_close();

	global.creating_zip_file_description = "ID generation and saving complete";
	show_debug_message("[scr_generate_id] INI file closed. scr_generate_id complete");
}
