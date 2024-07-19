function scr_character_select_menu_step()
{
	no_players_are_inputting_names = true;
	name_y = 292; /* Where name input box for players are placed on screen */
	
	if (menu == "select_character")
	|| (menu == "back_from_character_select")
	|| (menu == "manage_character")
	|| (menu == "online_character_list")
	|| (menu == "input_name_ok")
	|| (menu == "input_name_cancel")
	{
		var fixed_player = 1;
		
		for(var i = 1; i <= global.max_players; i += 1)
		{
			no_players_are_inputting_names = no_players_are_inputting_names && !can_input_player_name[i];
		}
		
		if (variable_instance_exists(self, "have_downloaded_from_server"))
		&& (have_downloaded_from_server)
		{
			/* If you are downloading a new character, the game needs to reload all custom characters when going back to back to character select, so you can select the new downloaded character */
			search_for_id_still = false;
			search_id = ""; /* Always set this to empty string when going back to previous menu */
			player_menu[fixed_player] = "load_downloaded_character";
			select_custom_level_menu_open = false;
			scr_load_character_initializing();
			player_automatically_join[fixed_player] = true;
			menu = "load_characters";
			menu_delay = 3;
			menu_specific_joystick_delay[fixed_player] = 30;
			have_downloaded_from_server = false;
		}
		
		var get_window_height = display_get_gui_height();
		var get_window_width = display_get_gui_width();
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		
		for(var i = 1; i <= global.max_players; i += 1)
		{
			/* Player Key Accept Pressed */ player_key_a_pressed[i] = (gamepad_button_check_pressed(global.player_slot[i], global.player_[inp.gp][i][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[i], global.player_[inp.gp][i][2][action.accept]))
			|| (keyboard_check_pressed(global.player_[inp.key][i][1][action.accept]))
			|| (keyboard_check_pressed(global.player_[inp.key][i][2][action.accept]));
			/* Player Key Back Pressed */ player_key_b_pressed[i] = (gamepad_button_check_pressed(global.player_slot[i], global.player_[inp.gp][i][1][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[i], global.player_[inp.gp][i][2][action.back]))
			|| (keyboard_check_pressed(global.player_[inp.key][i][1][action.back]))
			|| (keyboard_check_pressed(global.player_[inp.key][i][2][action.back]))
			|| (keyboard_check_pressed(vk_escape));
			
			if (can_input_player_name[i] == 2)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				can_input_player_name[i] = false;
			}
			
			#region /* If any "character index" is set to -1, reset it to 0 */
			if (global.character_index[i - 1] <= -1)
			{
				global.character_index[i - 1] = 0;
				scr_delete_sprite_properly(global.sprite_select_player[i]);
				global.sprite_select_player[i] = spr_noone;
				scr_set_character_folder(i, global.skin_for_player[i]);
				ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
				global.sprite_select_player[i] = scr_initialize_character_sprite("idle", global.sprite_select_player[i]);
				global.sprite_select_player[i] = scr_initialize_character_sprite("stand", global.sprite_select_player[i]);
				global.sprite_select_player[i] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[i]);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* If any "character index" is set to -1, reset it to 0 END */
			
		}
		
		#region /* When you are ready to start game, and you're using mouse, and you aren't hovering mouse over the other buttons, then take you to "select character" menu */
		if (player_start_game)
		&& (global.controls_used_for_navigation == "mouse")
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 42 * 3))
		&& (menu_delay == 0)
		{
			player_menu[fixed_player] = "select_character";
			menu = "select_character";
		}
		#endregion /* When you are ready to start game, and you're using mouse, and you aren't hovering mouse over the other buttons, then take you to "select character" menu END */
		
		#region /* Lerp Play the game text */
		if (player_start_game)
		&& (no_players_are_inputting_names)
		{
			var play_the_game_text_y = display_get_gui_height() - 125; /* Text should appear at bottom of screen, for easier access with mouse */
		}
		else
		{
			if (play_the_game_text_y_lerp < -70)
			{
				play_the_game_text_y_lerp = display_get_gui_height() + 100;
			}
			var play_the_game_text_y = display_get_gui_height() + 100;
		}
		play_the_game_text_y_lerp = lerp(play_the_game_text_y_lerp, play_the_game_text_y, 0.2);
		#endregion /* Lerp Play the game text END */
		
		arrow_offset = 125;
		
		#region /* Start Game (run this code further up so that it takes priority) */
		if (player_accept_selection[1] == 1)
		&& (player_accept_selection[2] != 0)
		&& (player_accept_selection[3] != 0)
		&& (player_accept_selection[4] != 0)
		&& (player_key_a_pressed[1] || keyboard_check_pressed(vk_space))
		&& (player_menu[1] != "back_from_character_select")
		&& (player_menu[1] != "manage_character")
		&& (player_menu[1] != "online_character_list")
		
		|| (player_accept_selection[1] == -1)
		&& (player_accept_selection[2] == 1)
		&& (player_accept_selection[3] != 0)
		&& (player_accept_selection[4] != 0)
		&& (player_key_a_pressed[2])
		&& (player_menu[2] != "back_from_character_select")
		&& (player_menu[2] != "manage_character")
		&& (player_menu[2] != "online_character_list")
		
		|| (player_accept_selection[1] == -1)
		&& (player_accept_selection[2] == -1)
		&& (player_accept_selection[3] == 1)
		&& (player_accept_selection[4] != 0)
		&& (player_key_a_pressed[3])
		&& (player_menu[3] != "back_from_character_select")
		&& (player_menu[3] != "manage_character")
		&& (player_menu[3] != "online_character_list")
		
		|| (player_accept_selection[1] == -1)
		&& (player_accept_selection[2] == -1)
		&& (player_accept_selection[3] == -1)
		&& (player_accept_selection[4] == 1)
		&& (player_key_a_pressed[4])
		&& (player_menu[4] != "back_from_character_select")
		&& (player_menu[4] != "manage_character")
		&& (player_menu[4] != "online_character_list")
		
		|| (player_start_game)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32))
		&& (mouse_check_button_released(mb_left))
		{
			if (menu == "select_character")
			{
				if (no_players_are_inputting_names)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					ini_open("save_file/config.ini"); /* Must save character_for_player in config.ini manually here, because scr_config_save doesn't run every frame in step event, only when you exit the options menu, to prevent config.ini to get deleted and replaced every frame */
					for(var i = 1; i <= global.max_players; i += 1)
					{
						if (player_accept_selection[i] != 1)
						{
							global.player_can_play[i] = false; /* If players haven't joined, force the "player can play" variable to be false */
						}
						ini_write_real("config", "character_index_player" + string(i), global.character_index[i - 1]);
						ini_write_real("config", "skin_for_player" + string(i), global.skin_for_player[i]);
						ini_write_string("config", "player" + string(i) + "_name", global.player_name[i]);
					}
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					if (room == rm_title)
					{
						if (global.character_select_in_this_menu == "main_game")
						{
							can_navigate = false;
							menu_delay = 9999;
						}
						else
						if (global.character_select_in_this_menu == "level_editor")
						{
							global.select_level_index = 0;
							scr_load_custom_level_initializing();
							for(var i = 1; i <= global.max_players; i += 1)
							{
								can_input_player_name[i] = 2;
							}
							can_navigate = true;
							menu_delay = 3;
							open_sub_menu = false;
							menu = "load_custom_level";
						}
						else
						if (global.character_select_in_this_menu == "online_level_list_title")
						{
							if (global.online_enabled)
							&& (os_is_network_connected())
							{
								scr_switch_update_online_status();
								
								if (global.switch_logged_in)
								{
									if (global.switch_account_network_service_available) /* Need to make sure that network service is available before going online */
									{
										if (global.online_token_validated) /* Need to make sure that online token is validated before going online */
										{
											menu_delay = 3;
											/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
											select_custom_level_menu_open = false;
											content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
											global.selected_online_download_index = 1;
											menu = "online_download_list_load";
										}
										else
										{
											menu_delay = 3;
											caution_online_takes_you_to = "online_download_list_load";
											caution_online_takes_you_back_to = "online_level_list_title";
											menu = "caution_online_token_invalidated";
										}
									}
									else
									{
										menu_delay = 3;
										caution_online_takes_you_to = "online_download_list_load";
										caution_online_takes_you_back_to = "online_level_list_title";
										menu = "caution_online_network_service_unavailable";
									}
								}
								else
								{
									menu_delay = 3;
									menu = "online_level_list_title";
								}
							}
							else
							{
								content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
								caution_online_takes_you_to = "online_download_list_load";
								caution_online_takes_you_back_to = "online_level_list_title";
								if (os_is_network_connected())
								{
									menu = "caution_online_proceed";
								}
								else
								{
									caution_online_takes_you_back_to = "online_level_list_title";
									menu = "no_internet_level";
								}
								menu_delay = 3;
							}
						}
					}
					else
					{
						can_navigate = true;
						menu_delay = 3;
						var no_players_can_play = true;
						for(var i = 1; i <= global.max_players; i += 1)
						{
						    if (global.player_can_play[i])
							{
						        no_players_can_play = false;
						        break; /* exit the loop if any player can play */
						    }
						}
						if (no_players_can_play)
						|| (global.playergame <= 0) /* At least one player needs to be playing the game */
						{
							global.player_can_play[fixed_player] = true;
						}
						for(var i = 1; i <= global.max_players; i += 1)
						{
							if (player_accept_selection[i] == 1)
							{
								player_accept_selection[i] = 0;
							}
						}
						
						#region /* Return to game */
						audio_resume_all();
						if (global.music != noone)
						{
							audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
						}
						if (global.music_underwater != noone)
						{
							audio_sound_gain(global.music_underwater, 0, 0);
						}
						if (global.ambience != noone)
						{
							audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
						}
						if (global.ambience_underwater != noone)
						{
							audio_sound_gain(global.ambience_underwater, 0, 0);
						}
						global.pause = false;
						#endregion /* Return to game END */
						
					}
				}
			}
		}
		#endregion /* Start Game (run this code further up so that it takes priority) END */
		
		#region /* This is running step functions of character portrait for player */
		for(var i = 1; i <= global.max_players; i += 1)
		{
			scr_character_portrait_for_player_step(i);
		}
		#endregion /* This is running step functions of character portrait for player END */
		
		image_alpha = 0;
		
		#region /* All code before menu navigation code */
		for(var i = 1; i <= global.max_players; i += 1)
		{
			/* Player positions for each character display */
			var normalized_position = (i - 0.5) / (global.max_players); /* Normalized position between 0 and 1 */
			player_display_x[i] = normalized_position * display_get_gui_width() - (display_get_gui_width() * 0.5); /* Now player_display_x array contains evenly distributed positions based on the screen width */
			
			xx[i] = lerp(xx[i], player_display_x[i], 0.1);
			player_scale[i] = 0.85; /* Player scale for each character display */
		}
		
		#region /* Press enter when done typing on name input screen */
		for(var i = 1; i <= global.max_players; i += 1)
		{
			if (global.clicking_ok_input_screen || global.clicking_cancel_input_screen)
			&& (can_input_player_name[i] == 1 && menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				for(var j = 1; j <= global.max_players; j += 1)
				{
					can_input_player_name[j] = 2;
				}
			}
		}
		#endregion /* Press enter when done typing on name input screen END */
		
		#endregion /* All code before menu navigation code END */
		
		#region /* Menu Navigation */
		if (no_players_are_inputting_names)
		{
			
			for(var i = 1; i <= global.max_players; i += 1)
			{
				scr_character_select_player_navigation(i);
			}
			
			#region /* The buttons in the top left corner of character select screen */
			
			#region /* Key Up */
			if (key_up)
			&& (menu_specific_joystick_delay[fixed_player] <= 0)
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (menu == "manage_character") /* Manage Character */
					{
						menu_delay = 3;
						can_navigate = true;
						player_menu[fixed_player] = "back_from_character_select";
						menu = "back_from_character_select";
					}
					else
					if (menu == "online_character_list") /* Online Character List */
					{
						menu_delay = 3;
						player_menu[fixed_player] = "manage_character";
						menu = "manage_character";
					}
				}
			}
			#endregion /* Key Up END */
			
			else
			
			#region /* Key Down */
			if (key_down)
			&& (menu_specific_joystick_delay[fixed_player] <= 0)
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (menu == "back_from_character_select")
					{
						menu_delay = 3;
						player_menu[fixed_player] = "manage_character";
						menu = "manage_character";
					}
					else
					if (menu == "manage_character") /* Manage Characters */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.free_communication_available)
						&& (room == rm_title) /* Can only access online in title screen */
						{
							player_menu[fixed_player] = "online_character_list";
							menu = "online_character_list";
						}
						else
						{
							player_menu[fixed_player] = "select_character";
							menu = "select_character";
						}
					}
					else
					if (menu == "online_character_list") /* Online Character List */
					{
						menu_delay = 3;
						can_navigate = true;
						player_menu[fixed_player] = "select_character";
						menu = "select_character";
					}
				}
			}
			#endregion /* Key Down END */
			
			#endregion /* The buttons in the top left corner of character select screen END */
			
		}
		#endregion /* Menu Navigation END */
		
		#region /* Accept and Back */
		if (no_players_are_inputting_names)
		{
			
			#region /* Accept */
			
			#region /* Select the character */
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (player_key_a_pressed[i] || i == 1 && keyboard_check_pressed(vk_space))
				&& (player_menu[i] == "select_character")
				|| (player_key_a_pressed[i] || i == 1 && keyboard_check_pressed(vk_space))
				&& (player_menu[i] == "select_skin")
				|| (player_key_a_pressed[i] || i == 1 && keyboard_check_pressed(vk_space))
				&& (player_menu[i] == "select_voicepack")
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[i] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[i] + 100, get_window_height * 0.5 + 150 + 20))
				&& (mouse_check_button_released(mb_left))
				{
					if (player_accept_selection[i] == 0)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						player_menu[i] = "select_character";
						menu = "select_character";
						menu_delay = 3;
						player_accept_selection[i] = 1;
						player_automatically_join[i] = false;
						global.player_can_play[i] = true;
						
						#region /* When selecting character, make the character say their own name */
						audio_stop_sound(voice_select_character);
						if (global.narrator >= 0) /* Only play voice if narrator is turned on */
						{
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_3.ogg"))
							&& (floor(random(3 - 1)) == 0)
							{
								voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_3.ogg");
							}
							else
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_2.ogg"))
							&& (floor(random(3 - 1)) == 0)
							{
								voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_2.ogg");
							}
							else
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_1.ogg"))
							{
								voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_1.ogg");
							}
							else
							if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name.ogg"))
							{
								voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name.ogg");
							}
							else
							if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_3.ogg"))
							&& (floor(random(3 - 1)) == 0)
							{
								voice_select_character = audio_create_stream(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_3.ogg");
							}
							else
							if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_2.ogg"))
							&& (floor(random(3 - 1)) == 0)
							{
								voice_select_character = audio_create_stream(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_2.ogg");
							}
							else
							if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_1.ogg"))
							{
								voice_select_character = audio_create_stream(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name_1.ogg");
							}
							else
							if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name.ogg"))
							{
								voice_select_character = audio_create_stream(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[i - 1])) + "/sound/voicepack" + string(global.voicepack_for_player[i]) + "/name.ogg");
							}
							else
							{
								voice_select_character = noone;
							}
							scr_audio_play(voice_select_character, volume_source.voice);
						}
						#endregion /* When selecting character, make the character say their own name END */
					
					}
				}
			}
			#endregion /* Select the character END */
			
			#region /* If all players has selected a character, be able to start game */
			var all_players_selected = true;
			
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (player_accept_selection[i] == 0)
				{
					all_players_selected = false;
					break;  /* Exit the loop early if any player is selected */
				}
			}
			
			player_start_game = false;
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (all_players_selected && player_accept_selection[i] == 1)
				{
					for(var j = 1; j <= global.max_players; j += 1)
					{
						global.character_for_player[j] = ds_list_find_value(global.all_loaded_characters, global.character_index[j - 1]);
					}
					player_start_game = true;
					break;  /* Exit the loop early since a player is selected */
				}
			}
			#endregion /* If all players has selected a character, be able to start game END */
			
			#endregion /* Accept END */
			
			#region /* Back / Cancel Selection */
			
			#region /* Player Back / Cancel Selection */
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (player_key_b_pressed[i])
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[i] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[i] + 100, get_window_height * 0.5 + 150 + 20))
				&& (mouse_check_button_released(mb_left))
				{
					if (player_accept_selection[i] == 1)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						player_accept_selection[i] = 0;
						global.player_can_play[i] = false;
						can_navigate = true;
					}
				}
			}
			#endregion /* Player Back / Cancel Selection END */
			
			for(var i = 1; i <= global.max_players; i += 1)
			{
				var player_key_a_pressed_back_from_character_select = player_key_a_pressed[i] && player_menu[i] == "back_from_character_select";
			}
			
			if (player_key_b_pressed[fixed_player])
			&& (player_accept_selection[fixed_player] <= -1)
			|| (player_key_a_pressed[fixed_player])
			&& (menu == "back_from_character_select")
			|| (player_key_a_pressed_back_from_character_select)
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					image_alpha = 1;
					player_start_game = false;
					for(var i = 1; i <= global.max_players; i += 1)
					{
						can_input_player_name[i] = 2;
						player_accept_selection[i] = -1;
						global.player_can_play[i] = false;
						player_menu[i] = "select_character";
						xx[i] = player_display_x[i];
					}
					if (room == rm_title)
					{
						if (global.character_select_in_this_menu == "main_game")
						{
							menu = "main_game";
						}
						else
						if (global.character_select_in_this_menu == "level_editor")
						{
							menu = "level_editor";
						}
						else
						if (global.character_select_in_this_menu == "online_level_list_title")
						{
							menu = "online_level_list_title";
						}
					}
					else
					{
						var no_players_can_play = true;
						for(var i = 1; i <= global.max_players; i += 1)
						{
						    if (global.player_can_play[i])
							{
						        no_players_can_play = false;
						        break; /* exit the loop if any player can play */
						    }
						}
						if (no_players_can_play)
						|| (global.playergame <= 0) /* At least one player needs to be playing the game */
						{
							global.player_can_play[fixed_player] = true;
						}
						for(var i = 1; i <= global.max_players; i += 1)
						{
							if (player_accept_selection[i] == 1)
							{
								player_accept_selection[i] = 0;
							}
						}
						menu = "change_character";
					}
					can_navigate = true;
					global.level_editor_level = 1;
				}
			}
			#endregion /* Back / Cancel Selection END */
			
		}
		#endregion /* Accept and Back END */
		
		menu_delay = clamp(menu_delay - 1, 0, +infinity);
		
		#region /* Menu navigation with joystick */
		for(var i = 1; i <= global.max_players; i += 1)
		{
			if (gamepad_axis_value(global.player_slot[i], gp_axislv) < -0.3)
			|| (gamepad_axis_value(global.player_slot[i], gp_axislv) > +0.3)
			|| (gamepad_axis_value(global.player_slot[i], gp_axislh) < -0.3)
			|| (gamepad_axis_value(global.player_slot[i], gp_axislh) > +0.3)
			{
				if (menu_specific_joystick_delay[i] == 0)
				{
					menu_specific_joystick_delay[i] = 30;
				}
			}
			if (gamepad_axis_value(global.player_slot[i], gp_axislv) == 0)
			&& (gamepad_axis_value(global.player_slot[i], gp_axislh) == 0)
			{
				menu_specific_joystick_delay[i] = 0;
			}
			if (menu_specific_joystick_delay[i] > 0)
			{
				menu_specific_joystick_delay[i] --;
			}
		}
		#endregion /* Menu navigation with joystick END */
		
		#region /* If players haven't joined the game */
		if (no_players_are_inputting_names)
		{
			
			#region /* Player Join */
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (player_accept_selection[i] <= -1)
				{
					if (player_key_a_pressed[i] || i == 1 && keyboard_check_pressed(vk_space))
					|| (player_automatically_join[i])
					{
						if (i == fixed_player)
						&& (menu_delay == 0 && menu_joystick_delay == 0)
						&& (menu != "back_from_character_select")
						&& (player_menu[fixed_player] != "back_from_character_select")
						&& (menu != "manage_character")
						&& (player_menu[fixed_player] != "manage_character")
						&& (menu != "online_character_list")
						&& (player_menu[fixed_player] != "online_character_list")
						|| (menu_delay == 0 && menu_joystick_delay == 0)
						{
							player_automatically_join[i] = false;
							player_menu[i] = "select_character";
							if (i == 1)
							{
								menu = "select_character";
							}
							menu_delay = 3;
							player_accept_selection[i] = 0;
							global.character_index[i - 1] = clamp(global.character_index[i - 1], 0, ds_list_size(global.all_loaded_characters) - 1);
							scr_change_character_portrait();
						}
					}
				}
			}
			#endregion /* Player Join END */
			
		}
		#endregion /* If players haven't joined the game END */
		
	}
	else
	
	#region /* Step Manage Characters Menu */
	{
		play_the_game_text_y_lerp = display_get_gui_height() + 100;
		scr_character_manage_menu_step();
	}
	#endregion /* Step Manage Characters Menu END */
	
}