function scr_load_rest_of_characters()
{
	var fixed_player = 1;
	
	#region /* Player Automatically Join */
	/* When going to the character select menu, game should remember what player entered the menu, and therefore should automatically join the game, as the game should already know for certain that player is already joining the game */
	for(var p = 1; p <= global.max_players; p += 1)
	{
		/* Player Key Accept Hold */ player_key_a_hold[p] = (gamepad_button_check(global.player_slot[p], global.player_[inp.gp][p][1][action.accept])) || (gamepad_button_check(global.player_slot[p], global.player_[inp.gp][p][2][action.accept])) || (keyboard_check(global.player_[inp.key][p][1][action.accept])) || (keyboard_check(global.player_[inp.key][p][2][action.accept]));
		if (player_key_a_hold[p] || p == 1 && keyboard_check(vk_space))
		{
			if (player_accept_selection[p] == -1)
			|| (global.player_can_play[p])
			{
				player_automatically_join[p] = true;
			}
		}
	}
	#endregion /* Player Automatically Join END */
	
	/* Load custom character data */
	file_load_timer ++;
	
	if (file_load_timer > 1)
	{
		file_found = file_find_next();
		
		if (file_found == "")
		{
			file_find_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			
			if (player_menu[fixed_player] == "click_copy_character")
			{
				
				#region /* After copying character, show the copied character */
				global.character_index[fixed_player - 1] = ds_list_find_index(global.all_loaded_characters, copied_character_name);
				global.character_for_player[fixed_player] = ds_list_find_index(global.all_loaded_characters, global.character_index[fixed_player - 1]);
				#endregion /* After copying character, show the copied character END */
				
				#region /* Player 1 character select portrait sprite */
				global.skin_for_player[fixed_player] = global.actual_skin_for_player[fixed_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				global.sprite_select_player[fixed_player] = spr_noone;
				scr_set_character_folder(fixed_player, global.skin_for_player[fixed_player], copied_character_name);
				global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[fixed_player]);
				global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[fixed_player]);
				#endregion /* Player 1 character select portrait sprite END */
				
				menu = "click_copy_character";
				player_menu[fixed_player] = "click_copy_character";
			}
			else
			if (player_menu[fixed_player] == "click_delete_character")
			{
				menu = "click_delete_character";
			}
			else
			{
				if (player_menu[fixed_player] == "load_downloaded_character")
				{
					/* When you have downloaded a custom character, player 1 should be set to the downloaded custom character so that the player can play with them immediately */
					if (downloaded_character_name != "")
					{
						global.character_index[fixed_player - 1] = ds_list_find_index(global.all_loaded_characters, string(downloaded_character_name));
					}
					global.character_for_player[fixed_player] = ds_list_find_index(global.all_loaded_characters, global.character_index[0]);
					
					#region /* Player 1 character select portrait sprite */
					global.skin_for_player[fixed_player] = global.actual_skin_for_player[fixed_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
					global.sprite_select_player[fixed_player] = spr_noone;
					scr_set_character_folder(fixed_player, global.skin_for_player[fixed_player]);
					global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[fixed_player]);
					global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[fixed_player]);
					#endregion /* Player 1 character select portrait sprite END */
					
				}
				
				player_menu[fixed_player] = "select_character"; /* Set this to be "select character" so it's not on wrong menu unintentionally */
				menu = "select_character"; /* Default menu to go to after loading all characters */
			}
		}
		else
		{
			if (file_exists(working_directory + "custom_characters/" + file_found + "/data/character_config.ini"))
			{
				ds_list_add(global.all_loaded_characters, file_found);
			}
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
		}
	}
}