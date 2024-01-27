function scr_set_character_folder(what_player = player, what_selected_skin = selected_skin, what_character_name = ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]))
{
	if (file_exists("characters/" + string(what_character_name) + "/data/character_config.ini"))
	{
		character_folder = "characters/" + string(what_character_name);
		can_save_to_character_config = false; /* You can't save values to included files */
	}
	else
	{
		character_folder = working_directory + "custom_characters/" + string(what_character_name);
		can_save_to_character_config = true; /* You can save values to local appdata */
	}
	
	if (file_exists(string(character_folder) + "/sprites/skin" + string(what_selected_skin) + "/mask.png"))
	{
		skin_folder = "/skin" + string(what_selected_skin) + "/";
	}
	else
	{
		skin_folder = "/";
	}
}