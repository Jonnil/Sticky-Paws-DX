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
			global.sprite_select_player[i] = scr_initialize_custom_character_sprite("stand", global.sprite_select_player[i], character_folder[i]);
			global.sprite_player_stand[i] = global.sprite_select_player[i];
			global.sprite_select_player[i] = scr_initialize_custom_character_sprite("character_select_portrait", global.sprite_select_player[i], character_folder[i]);
		}
		else
		{
			alarm[1] = 1;
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