function scr_set_character_folder(what_player = player, what_selected_skin = selected_skin, what_character_name = ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]))
{
	
	/* Character folder */
	if (file_exists("characters\\" + string(what_character_name) + "\\data\\character_config.ini"))
	{
		character_folder = "characters\\" + string(what_character_name);
		can_save_to_character_config = false; /* You can't save values to included files */
	}
	else
	{
		character_folder = game_save_id + "custom_characters\\" + string(what_character_name);
		can_save_to_character_config = true; /* You can save values to local appdata */
	}
	
	/* Skin folder */
	if (file_exists(string(character_folder) + "\\sprites\\skin" + string(what_selected_skin) + "\\mask.png"))
	{
		skin_folder = "\\skin" + string(what_selected_skin) + "\\";
	}
	else
	{
		skin_folder = "\\";
	}
	
	#region /* Set Sound folder */
	if (!variable_instance_exists(self, "selected_voicepack"))
	{
		selected_voicepack = global.voicepack_for_player[what_player];
	}
	var check_sound_folder_exist_1 = string(character_folder) + "\\sound\\voicepack" + string(selected_voicepack); /* This directory is "sound" without a S */
	var check_sound_folder_exist_2 = string(character_folder) + "\\sounds\\voicepack" + string(selected_voicepack); /* This directory is "sounds" with a S */
	var check_sound_folder_exist_3 = string(character_folder) + "\\sound"; /* This directory is "sound" without a S */
	var check_sound_folder_exist_4 = string(character_folder) + "\\sounds"; /* This directory is "sounds" with a S */
	if (directory_exists(check_sound_folder_exist_1))
	{
		voicepack_folder = "\\sound\\voicepack" + string(selected_voicepack) + "\\";
	}
	else
	if (directory_exists(check_sound_folder_exist_2))
	{
		voicepack_folder = "\\sounds\\voicepack" + string(selected_voicepack) + "\\";
	}
	else
	if (directory_exists(check_sound_folder_exist_3))
	{
		voicepack_folder = "\\sound\\";
	}
	else
	if (directory_exists(check_sound_folder_exist_4))
	{
		voicepack_folder = "\\sounds\\";
	}
	else
	{
		voicepack_folder = "\\";
	}
	#endregion /* Set Sound folder END */
}