for (var i = 1; i <= global.max_players; i += 1)
{
	var what_player = i;
	if (character_portrait_for_player_update_directory[i])
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/data/character_config.ini"))
		{
			character_folder[what_player] = "characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		else
		{
			character_folder[what_player] = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		if (file_exists(string(character_folder[what_player]) + "/sprites/skin" + string(global.skin_for_player[what_player]) + "/mask.png"))
		{
			skin_folder = "/skin" + string(global.skin_for_player[what_player]) + "/";
		}
		else
		{
			skin_folder = "/";
		}
		if (file_exists(character_folder[what_player] + "/sprites/skin1/mask.png"))
		{
			character_portrait_for_player_dir_exists_1[what_player] = true;
		}
		else
		{
			character_portrait_for_player_dir_exists_1[what_player] = false;
		}
		if (file_exists(character_folder[what_player] + "/sprites/skin" + string(global.skin_for_player[what_player] + 1) + "/mask.png"))
		{
			character_portrait_for_player_dir_exists_2[what_player] = true;
		}
		else
		{
			character_portrait_for_player_dir_exists_2[what_player] = false;
		}
		if (file_exists(character_folder[what_player] + "/sound/voicepack1/jump.ogg"))
		{
			character_portrait_for_player_dir_exists_3[what_player] = true;
		}
		else
		{
			character_portrait_for_player_dir_exists_3[what_player] = false;
		}
		if (file_exists(character_folder[what_player] + "/sound/voicepack" + string(global.voicepack_for_player[what_player] + 1) + "/jump.ogg"))
		{
			character_portrait_for_player_dir_exists_4[what_player] = true;
		}
		else
		{
			character_portrait_for_player_dir_exists_4[what_player] = false;
		}
		
		#region /* Player character select portrait sprite */
		global.sprite_select_player[what_player] = spr_noone;
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("stand", global.sprite_select_player[what_player], character_folder[what_player]);
		global.sprite_player_stand[what_player] = global.sprite_select_player[what_player];
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("character_select_portrait", global.sprite_select_player[what_player], character_folder[what_player]);
		#endregion /* Player character select portrait sprite END */
		
		if (xx_delay[what_player] == -1)
		{
			xx[what_player] = player_display_x[what_player] - 32;
		}
		else
		if (xx_delay[what_player] == +1)
		{
			xx[what_player] = player_display_x[what_player] + 32;
		}
		xx_delay[what_player] = 0;
		character_portrait_for_player_update_directory[what_player] = false;
	}
}