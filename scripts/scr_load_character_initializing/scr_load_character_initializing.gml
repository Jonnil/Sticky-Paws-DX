function scr_load_character_initializing()
{
	ds_list_clear(global.all_loaded_characters);
	ds_list_add(global.all_loaded_characters, "Sticky", "Catlyn");
	
	first_character = string(file_find_first(working_directory + "custom_characters/*", fa_directory))
	if (file_exists(working_directory + "custom_characters/" + first_character+ "/data/character_config.ini"))
	{
		ds_list_add(global.all_loaded_characters, first_character);
	}
}