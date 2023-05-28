if (character_portrait_for_player_update_directory[1])
{
	var what_player = 1;
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	{
		character_portrait_for_player_directory_exists_1[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_1[what_player] = false;
	}
	
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	{
		character_portrait_for_player_directory_exists_2[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_2[what_player] = false;
	}
	
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_3[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_3[what_player] = false;
	}
	
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_4[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_4[what_player] = false;
	}
	character_portrait_for_player_update_directory[what_player] = false;
}
if (character_portrait_for_player_update_directory[2])
{
	var what_player = 2;
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	{
		character_portrait_for_player_directory_exists_1[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_1[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	{
		character_portrait_for_player_directory_exists_2[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_2[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_3[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_3[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_4[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_4[what_player] = false;
	}
	character_portrait_for_player_update_directory[what_player] = false;
}
if (character_portrait_for_player_update_directory[3])
{
	var what_player = 3;
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	{
		character_portrait_for_player_directory_exists_1[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_1[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	{
		character_portrait_for_player_directory_exists_2[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_2[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_3[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_3[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_4[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_4[what_player] = false;
	}
	character_portrait_for_player_update_directory[what_player] = false;
}
if (character_portrait_for_player_update_directory[4])
{
	var what_player = 4;
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1/mask.png"))
	{
		character_portrait_for_player_directory_exists_1[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_1[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
	{
		character_portrait_for_player_directory_exists_2[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_2[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_3[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_3[what_player] = false;
	}
		
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_4[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_4[what_player] = false;
	}
	character_portrait_for_player_update_directory[what_player] = false;
}