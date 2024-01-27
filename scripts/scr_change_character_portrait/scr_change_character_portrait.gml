function scr_change_character_portrait()
{
	
	#region /* Change Character Skin */
	for(var i = 1; i <= global.max_players; i += 1)
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
			global.sprite_select_player[what_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[what_player], character_folder[what_player]);
			global.sprite_player_stand[what_player] = global.sprite_select_player[what_player];
			global.sprite_select_player[what_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[what_player], character_folder[what_player]);
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
	#endregion /* Change Character Portrait END */
	
	scr_change_character_skin();
}

function scr_change_character_skin()
{
	
	#region /* Change Character Skin */
	for(var i = 1; i <= global.max_players; i += 1)
	{
		
		#region /* If a unavailable skin is selected, then go to the last selectable skin for each player */
		if (!file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sprites/skin" + string(global.skin_for_player[i]) + "/mask.png"))
		&& (!file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sprites/skin" + string(global.skin_for_player[i]) + "/mask.png"))
		&& (global.skin_for_player[i] > 0)
		{
			menu_delay = 3;
			global.skin_for_player[i] --;
			
			#region /* Player character select portrait sprite */
			if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sprites/skin" + string(global.skin_for_player[i]) + "/mask.png"))
			|| (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sprites/skin" + string(global.skin_for_player[i]) + "/mask.png"))
			{
				if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/data/character_config.ini"))
				{
					character_folder[i] = "characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1]));
				}
				else
				{
					character_folder[i] = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1]));
				}
				
				if (file_exists(string(character_folder[i]) + "/sprites/skin" + string(global.skin_for_player[i]) + "/mask.png"))
				{
					skin_folder = "/skin" + string(global.skin_for_player[i]) + "/";
				}
				else
				{
					skin_folder = "/";
				}
				/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
				global.sprite_select_player[i] = spr_noone;
				global.sprite_select_player[i] = scr_initialize_character_sprite("stand", global.sprite_select_player[i], character_folder[i]);
				global.sprite_player_stand[i] = global.sprite_select_player[i];
				global.sprite_select_player[i] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[i], character_folder[i]);
			}
			else
			{
				scr_change_character_skin(); /* Do this code again */
			}
			#endregion /* Player character select portrait sprite END */
			
		}
		#endregion /* If a unavailable skin is selected, then go to the last selectable skin for each player END */
		
		#region /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player */
		if (!file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/jump.ogg")
		&& !file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/jump.ogg")
		&& global.voicepack_for_player[i] > 0)
		{
			menu_delay = 3;
			global.voicepack_for_player[i] --;
		}
		#endregion /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player END */
		
	}
	#endregion /* Change Character Skin END */
	
}