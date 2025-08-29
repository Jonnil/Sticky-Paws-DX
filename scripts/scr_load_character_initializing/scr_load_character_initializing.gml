function scr_load_character_initializing()
{
	ds_list_clear(global.all_loaded_characters);
	ds_list_add(global.all_loaded_characters, "sticky", "catlyn");

	first_character = string(file_find_first(game_save_id + "custom_characters/*", fa_directory))
	if (file_exists(game_save_id + "custom_characters/" + first_character + "/data/character_config.ini"))
	{
		ds_list_add(global.all_loaded_characters, first_character);
		file_found = ""; /* Reset "file found" so it's empty */
	}
}
