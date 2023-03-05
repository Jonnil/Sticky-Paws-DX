function scr_character_select_menu_step()
{
	/* Player 1 Key Accept Pressed */ player1_key_a_pressed = (gamepad_button_check_pressed(0, global.player1_gamepad_button_accept)) or (gamepad_button_check_pressed(0, global.player1_gamepad_button2_accept)) or (keyboard_check_pressed(global.player1_key_accept)) or (keyboard_check_pressed(global.player1_key2_accept)) or (keyboard_check_pressed(vk_space));
	/* Player 1 Key Back Pressed */ player1_key_b_pressed = (gamepad_button_check_pressed(0, global.player1_gamepad_button_back)) or (gamepad_button_check_pressed(0, global.player1_gamepad_button2_back)) or (keyboard_check_pressed(global.player1_key_back)) or (keyboard_check_pressed(global.player1_key2_back)) or (keyboard_check_pressed(vk_escape));
	/* Player 2 Key Accept Pressed */ player2_key_a_pressed = (gamepad_button_check_pressed(1, global.player2_gamepad_button_accept)) or (gamepad_button_check_pressed(1, global.player2_gamepad_button2_accept)) or (keyboard_check_pressed(global.player2_key_accept)) or (keyboard_check_pressed(global.player2_key2_accept));
	/* Player 2 Key Back Pressed */ player2_key_b_pressed = (gamepad_button_check_pressed(1, global.player2_gamepad_button_back)) or (gamepad_button_check_pressed(1, global.player2_gamepad_button2_back)) or (keyboard_check_pressed(global.player2_key_back)) or (keyboard_check_pressed(global.player2_key2_back));
	/* Player 3 Key Accept Pressed */ player3_key_a_pressed = (gamepad_button_check_pressed(2, global.player3_gamepad_button_accept)) or (gamepad_button_check_pressed(2, global.player3_gamepad_button2_accept)) or (keyboard_check_pressed(global.player3_key_accept)) or (keyboard_check_pressed(global.player3_key2_accept));
	/* Player 3 Key Back Pressed */ player3_key_b_pressed = (gamepad_button_check_pressed(2, global.player3_gamepad_button_back)) or (gamepad_button_check_pressed(2, global.player3_gamepad_button2_back)) or (keyboard_check_pressed(global.player3_key_back)) or (keyboard_check_pressed(global.player3_key2_back));
	/* Player 4 Key Accept Pressed */ player4_key_a_pressed = (gamepad_button_check_pressed(3, global.player4_gamepad_button_accept)) or (gamepad_button_check_pressed(3, global.player4_gamepad_button2_accept)) or (keyboard_check_pressed(global.player4_key_accept)) or (keyboard_check_pressed(global.player4_key2_accept));
	/* Player 4 Key Back Pressed */ player4_key_b_pressed = (gamepad_button_check_pressed(3, global.player4_gamepad_button_back)) or (gamepad_button_check_pressed(3, global.player4_gamepad_button2_back)) or (keyboard_check_pressed(global.player4_key_back)) or (keyboard_check_pressed(global.player4_key2_back));
	
	arrow_offset = 125;
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* "How many people are playing?" menu */
	if (menu == "how_many_people_back")
	or (menu == "how_many_people_1player")
	or (menu == "how_many_people_2player")
	or (menu == "how_many_people_3player")
	or (menu == "how_many_people_4player")
	{
		if (global.skip_how_many_people_are_playing_screen == true)
		{
			menu_delay = 3;
			menu = "load_characters";
		}
		
		if (global.skip_how_many_people_are_playing_screen == false)
		{
			
			#region /* Show Back key when you can go back to main menu */
			if (global.character_select_in_this_menu == "main_game")
			{
				if (player1_key_b_pressed)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "main_game";
				}
			}
			else
			{
				if (player1_key_b_pressed)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "leveleditor";
				}
			}
			if (menu == "how_many_people_back")
			{
				if (keyboard_check_pressed(global.player1_key_down))
				or (keyboard_check_pressed(global.player1_key2_down))
				or (gamepad_button_check_pressed(0, gp_padd))
				or (gamepad_axis_value(0, gp_axislv) > 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_1player";
					}
				}
			}
			else
			if (menu == "how_many_people_1player")
			or (menu == "how_many_people_2player")
			or (menu == "how_many_people_3player")
			or (menu == "how_many_people_4player")
			{
				if (keyboard_check_pressed(global.player1_key_up))
				or (keyboard_check_pressed(global.player1_key2_up))
				or (gamepad_button_check_pressed(0, gp_padu))
				or (gamepad_axis_value(0, gp_axislv) < 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_back";
					}
				}
			}
			#endregion /* Show Back key when you can go back to main menu END */
			
			#region /* How many players buttons */
			if (menu == "how_many_people_1player")
			{
				global.playergame = 0;
				if (player1_key_a_pressed)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "load_characters";
				}
				if (keyboard_check_pressed(global.player1_key_right))
				or (keyboard_check_pressed(global.player1_key2_right))
				or (gamepad_button_check_pressed(0, gp_padr))
				or (gamepad_axis_value(0, gp_axislh) > 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_2player";
					}
				}
			}
			else
			if (menu == "how_many_people_2player")
			{
				global.playergame = 1;
				if (player1_key_a_pressed)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "load_characters";
				}
				if (keyboard_check_pressed(global.player1_key_left))
				or (keyboard_check_pressed(global.player1_key2_left))
				or (gamepad_button_check_pressed(0, gp_padl))
				or (gamepad_axis_value(0, gp_axislh) < 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_1player";
					}
				}
				if (keyboard_check_pressed(global.player1_key_right))
				or (keyboard_check_pressed(global.player1_key2_right))
				or (gamepad_button_check_pressed(0, gp_padr))
				or (gamepad_axis_value(0, gp_axislh) > 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_3player";
					}
				}
			}
			else
			if (menu == "how_many_people_3player")
			{
				global.playergame = 2;
				if (player1_key_a_pressed)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "load_characters";
				}
				if (keyboard_check_pressed(global.player1_key_left))
				or (keyboard_check_pressed(global.player1_key2_left))
				or (gamepad_button_check_pressed(0, gp_padl))
				or (gamepad_axis_value(0, gp_axislh) < 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_2player";
					}
				}
				if (keyboard_check_pressed(global.player1_key_right))
				or (keyboard_check_pressed(global.player1_key2_right))
				or (gamepad_button_check_pressed(0, gp_padr))
				or (gamepad_axis_value(0, gp_axislh) > 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_4player";
					}
				}
			}
			else
			if (menu == "how_many_people_4player")
			{
				global.playergame = 3;
				if (player1_key_a_pressed)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					menu = "load_characters";
				}
				if (keyboard_check_pressed(global.player1_key_left))
				or (keyboard_check_pressed(global.player1_key2_left))
				or (gamepad_button_check_pressed(0, gp_padl))
				or (gamepad_axis_value(0, gp_axislh) < 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_3player";
					}
				}
			}
			#endregion /* How many players buttons END */
			
		}
	}
	#endregion /* "How many people are playing?" menu END */
	
	if (menu == "select_character")
	or (menu == "back_from_character_select")
	or (menu == "open_custom_characters_folder")
	or (menu == "copy_character")
	or (menu == "input_name_ok")
	or (menu == "input_name_cancel")
	{
		image_alpha = 0;
		xx1 = lerp(xx1, player1_display_x, 0.1);
		xx2 = lerp(xx2, player2_display_x, 0.1);
		xx3 = lerp(xx3, player3_display_x, 0.1);
		xx4 = lerp(xx4, player4_display_x, 0.1);
		play_the_game_text_y = 125;
		
		#region /* All code before menu navigation code */
		
		#region /* If a unavailable skin is selected, then go to the last selectable skin for each player */
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player_1)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player_1)))
		and (global.skin_for_player_1 > 0)
		{
			menu_delay = 3;
			global.skin_for_player_1 -= 1;
			
			#region /* Player 1 character select portrait sprite */
			global.sprite_select_player_1 = spr_noone;
			global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
			global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
			global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
			global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
			#endregion /* Player 1 character select portrait sprite END */
			
		}
		
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player_2)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player_2)))
		and (global.skin_for_player_2 > 0)
		{
			menu_delay = 3;
			global.skin_for_player_2 -= 1;
			
			#region /* Player 2 character select portrait sprite */
			global.sprite_select_player_2 = spr_noone;
			global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
			global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
			global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
			global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
			#endregion /* Player 2 character select portrait sprite END */
			
		}
		
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player_3)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player_3)))
		and (global.skin_for_player_3 > 0)
		{
			menu_delay = 3;
			global.skin_for_player_3 -= 1;
			
			#region /* Player 3 character select portrait sprite */
			global.sprite_select_player_3 = spr_noone;
			global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
			global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
			global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
			global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
			#endregion /* Player 3 character select portrait sprite END */
			
		}
		
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player_4)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player_4)))
		and (global.skin_for_player_4 > 0)
		{
			menu_delay = 3;
			global.skin_for_player_4 -= 1;
			
			#region /* Player 4 character select portrait sprite */
			global.sprite_select_player_4 = spr_noone;
			global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 3, global.skin_for_player_4);
			global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 3, global.skin_for_player_4);
			global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 3, global.skin_for_player_4);
			global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 3, global.skin_for_player_4);
			#endregion /* Player 4 character select portrait sprite END */
			
		}
		#endregion /* If a unavailable skin is selected, then go to the last selectable skin for each player END */
		
		#region /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player */
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1)))
		and (global.voicepack_for_player_1 > 0)
		{
			menu_delay = 3;
			global.voicepack_for_player_1 -= 1;
		}
		
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2)))
		and (global.voicepack_for_player_2 > 0)
		{
			menu_delay = 3;
			global.voicepack_for_player_2 -= 1;
		}
		
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3)))
		and (global.voicepack_for_player_3 > 0)
		{
			menu_delay = 3;
			global.voicepack_for_player_3 -= 1;
		}
		
		if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4)))
		and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4)))
		and (global.voicepack_for_player_4 > 0)
		{
			menu_delay = 3;
			global.voicepack_for_player_4 -= 1;
		}
		#endregion /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player END */
		
		#region /* Player positions and scale for each character display */
		player1_display_x = -465;
		player2_display_x = -155;
		player3_display_x = +155;
		player4_display_x = +465;
		player1_scale = 0.85;
		player2_scale = 0.85;
		player3_scale = 0.85;
		player4_scale = 0.85;
		#endregion /* Player positions and scale for each character display END */
		
		#region /* Name Input */
		
		var name_y = 292;
		
		#region /* Press enter when done typing */
		if (can_input_player1_name == true)
		or (can_input_player2_name == true)
		or (can_input_player3_name == true)
		or (can_input_player4_name == true)
		{
			if (keyboard_check_pressed(vk_enter))
			or (keyboard_check_pressed(vk_escape))
			
			or (can_input_player1_name == true)
			and(point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player1_display_x - 185,
			get_window_height * 0.5 + name_y + 52,
			get_window_width * 0.5 + player1_display_x - 185 + 370,
			get_window_height * 0.5 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (can_input_player2_name == true)
			and(point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player2_display_x - 185,
			get_window_height * 0.5 + name_y + 52,
			get_window_width * 0.5 + player2_display_x - 185 + 370,
			get_window_height * 0.5 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (can_input_player3_name == true)
			and(point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player3_display_x - 185,
			get_window_height * 0.5 + name_y + 52,
			get_window_width * 0.5 + player3_display_x - 185 + 370,
			get_window_height * 0.5 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (can_input_player4_name == true)
			and(point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player4_display_x - 185,
			get_window_height * 0.5 + name_y + 52,
			get_window_width * 0.5 + player4_display_x - 185 + 370,
			get_window_height * 0.5 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (gamepad_button_check_pressed(0, global.player1_gamepad_button_accept))
			or (gamepad_button_check_pressed(1, global.player2_gamepad_button_accept))
			or (gamepad_button_check_pressed(2, global.player3_gamepad_button_accept))
			or (gamepad_button_check_pressed(3, global.player4_gamepad_button_accept))
			or (gamepad_button_check_pressed(0, global.player1_gamepad_button2_accept))
			or (gamepad_button_check_pressed(1, global.player2_gamepad_button2_accept))
			or (gamepad_button_check_pressed(2, global.player3_gamepad_button2_accept))
			or (gamepad_button_check_pressed(3, global.player4_gamepad_button2_accept))
			or (gamepad_button_check_pressed(0, global.player1_gamepad_button_back))
			or (gamepad_button_check_pressed(1, global.player1_gamepad_button_back))
			or (gamepad_button_check_pressed(2, global.player1_gamepad_button_back))
			or (gamepad_button_check_pressed(3, global.player1_gamepad_button_back))
			or (gamepad_button_check_pressed(0, global.player1_gamepad_button2_back))
			or (gamepad_button_check_pressed(1, global.player1_gamepad_button2_back))
			or (gamepad_button_check_pressed(2, global.player1_gamepad_button2_back))
			or (gamepad_button_check_pressed(3, global.player1_gamepad_button2_back))
			{
				if (menu_delay == 0)
				{
					menu_delay = 3;
					can_input_player1_name = false;
					can_input_player2_name = false;
					can_input_player3_name = false;
					can_input_player4_name = false;
				}
			}
		}
		#endregion /* Press enter when done typing END */
		
		#endregion /* Name Input END */
		
		#endregion /* All code before menu navigation code END */
		
		#region /* Menu Navigation */
		if (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		{
			
			#region /* Player 1 Menu Navigation */
			if (player1_menu == "select_character")
			{
				/* Navigate Character Selection */
				
				#region /* Player 1 */
				if (menu_joystick1_delay <= 0)
				and (input_key == false)
				and (can_navigate == true)
				and (player1_accept_selection = false)
				{
			
					#region /* Player 1 change portrait when clicking left or right */
			
					#region /* Player 1 Key Left (change portrait sprites) */
					if (keyboard_check_pressed(global.player1_key_left))
					or (keyboard_check_pressed(global.player1_key2_left))
					or (gamepad_button_check_pressed(0, gp_padl))
					or (gamepad_axis_value(0, gp_axislh) < 0)
					and (menu_joystick1_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player1_display_x - arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player1_display_x - arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						and (global.character_index[0] > 0)
						{
							menu_delay = 3;
							menu_joystick1_delay = 30;
							if (global.character_index[0] > 0)
							{
								global.character_index[0] -= 1;
								global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
								xx1 = player1_display_x - 32;
							}
							else
							{
								global.character_index[0] = 0;
								global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
							}
				
							#region /* Player 1 character select portrait sprite */
							global.sprite_select_player_1 = spr_noone;
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
							#endregion /* Player 1 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 1 Key Left (change portrait sprites) END */
	
					#region /* Player 1 Key Right (change portrait sprites) */
					if (keyboard_check_pressed(global.player1_key_right))
					or (keyboard_check_pressed(global.player1_key2_right))
					or (gamepad_button_check_pressed(0, gp_padr))
					or (gamepad_axis_value(0, gp_axislh) > 0)
					and (menu_joystick1_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player1_display_x + arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player1_display_x + arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						{
							menu_delay = 3;
							menu_joystick1_delay = 30;
							
							if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
							{
								global.character_index[0] = clamp(global.character_index[0] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
								global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
								xx1 = player1_display_x + 32;
							}
							
							#region /* Player 1 character select portrait sprite */
							global.sprite_select_player_1 = spr_noone;
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
							#endregion /* Player 1 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 1 Key Right (change portrait sprites) END */
			
					#endregion /* Player 1 change portrait when clicking left or right END */
			
				}
				#endregion /* Player 1 END */
				
				#region /* Player 1 key up */
				if (keyboard_check_pressed(global.player1_key_up))
				or (keyboard_check_pressed(global.player1_key2_up))
				or (gamepad_button_check_pressed(0, gp_padu))
				or (gamepad_axis_value(0, gp_axislv) < 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu_joystick1_delay = 30;
						if (global.enable_copy_characters == true)
						{
							player1_menu = "copy_character";
							menu = "copy_character";
						}
						else
						if (global.enable_open_custom_folder == true)
						{
							player1_menu = "open_custom_characters_folder";
							menu = "open_custom_characters_folder";
						}
						else
						{
							player1_menu = "back_from_character_select";
							menu = "back_from_character_select";
						}
					}
				}
				#endregion /* Player 1 key up END */
				
				#region /* Player 1 key down */
				if (keyboard_check_pressed(global.player1_key_down))
				or (keyboard_check_pressed(global.player1_key2_down))
				or (gamepad_button_check_pressed(0, gp_padd))
				or (gamepad_axis_value(0, gp_axislv) > 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					and (player1_accept_selection == 0)
					{
						menu_delay = 3;
						menu_joystick1_delay = 30;
						player1_accept_selection = 0;
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
						{
							player1_menu = "select_skin";
						}
						else
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack1"))
						{
							player1_menu = "select_voicepack";
						}
						else
						{
							player1_menu = "select_name";
						}
					}
				}
				#endregion /* Player 1 key down END */
				
			}
			if (player1_menu == "select_name")
			{
				
				#region /* Player 1 key up */
				if (keyboard_check_pressed(global.player1_key_up))
				or (keyboard_check_pressed(global.player1_key2_up))
				or (gamepad_button_check_pressed(0, gp_padu))
				or (gamepad_axis_value(0, gp_axislv) < 0)
				and (menu_joystick1_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu_joystick1_delay = 30;
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack1"))
						{
							player1_menu = "select_voicepack";
						}
						else
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
						{
							player1_menu = "select_skin";
						}
						else
						{
							player1_menu = "select_character";
						}
					}
				}
				#endregion /* Player 1 key up END */
				
				if (can_input_player1_name == false)
				and (can_input_player2_name == false)
				and (can_input_player3_name == false)
				and (can_input_player4_name == false)
				{
					if (player1_key_a_pressed)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							keyboard_string = global.player1_name;
							can_input_player1_name = true;
							can_input_player2_name = false;
							can_input_player3_name = false;
							can_input_player4_name = false;
						}
					}
				}
			}
			#endregion /* Player 1 Menu Navigation END */
			
			#region /* Player 2 Menu Navigation */
			if (player2_menu == "select_character")
			{
				/* Navigate Character Selection */
				
				#region /* Player 2 */
				if (menu_joystick2_delay <= 0)
				and (input_key == false)
				and (can_navigate == true)
				and (player2_accept_selection = false)
				{
			
					#region /* Player 2 change portrait when clicking left or right */
			
					#region /* Player 2 Key Left (change portrait sprites) */
					if (keyboard_check_pressed(global.player2_key_left))
					or (keyboard_check_pressed(global.player2_key2_left))
					or (gamepad_button_check_pressed(1, gp_padl))
					or (gamepad_axis_value(1, gp_axislh) < 0)
					and (menu_joystick2_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player2_display_x - arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player2_display_x - arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						and (global.character_index[1] > 0)
						{
							menu_delay = 10;
							menu_joystick2_delay = 30;
							if (global.character_index[1] > 0)
							{
								global.character_index[1]-= 1;
								global.character_for_player_2 = ds_list_find_value(global.all_loaded_characters, global.character_index[1])
								xx2 = player2_display_x - 32;
							}
							else
							{
								global.character_index[1] = 0;
								global.character_for_player_2 = ds_list_find_value(global.all_loaded_characters, global.character_index[1])
							}
					
							#region /* Player 2 character select portrait sprite */
							global.sprite_select_player_2 = spr_noone;
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
							#endregion /* Player 2 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 2 Key Left (change portrait sprites) END */
	
					#region /* Player 2 Key Right (change portrait sprites) */
					if (keyboard_check_pressed(global.player2_key_right))
					or (keyboard_check_pressed(global.player2_key2_right))
					or (gamepad_button_check_pressed(1, gp_padr))
					or (gamepad_axis_value(1, gp_axislh) > 0)
					and (menu_joystick2_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player2_display_x + arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player2_display_x + arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						{
							menu_delay = 10;
							menu_joystick2_delay = 30;
							
							if (global.character_index[1] < ds_list_size(global.all_loaded_characters) - 1)
							{
								global.character_index[1] = clamp(global.character_index[1] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
								global.character_for_player_2 = ds_list_find_value(global.all_loaded_characters, global.character_index[1])
								xx2 = player2_display_x + 32;
							}
							
							#region /* Player 2 character select portrait sprite */
							global.sprite_select_player_2 = spr_noone;
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
							global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
							#endregion /* Player 2 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 2 Key Right (change portrait sprites) END */
			
					#endregion /* Player 2 change portrait when clicking left or right END */
			
			}
				#endregion /* Player 2 END */
				
				#region /* Player 2 key down */
				if (keyboard_check_pressed(global.player2_key_down))
				or (keyboard_check_pressed(global.player2_key2_down))
				or (gamepad_button_check_pressed(1, gp_padd))
				or (gamepad_axis_value(1, gp_axislv) > 0)
				and (menu_joystick2_delay <= 0)
				{
					if (menu_delay == 0)
					and (player2_accept_selection >= 0)
					{
						menu_delay = 3;
						menu_joystick2_delay = 30;
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
						{
							player2_menu = "select_skin";
						}
						else
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack1"))
						{
							player2_menu = "select_voicepack";
						}
						else
						{
							player2_menu = "select_name";
						}
					}
				}
				#endregion /* Player 2 key down END */
				
			}
			if (player2_menu == "select_name")
			{
				
				#region /* Player 2 key up */
				if (keyboard_check_pressed(global.player2_key_up))
				or (keyboard_check_pressed(global.player2_key2_up))
				or (gamepad_button_check_pressed(1, gp_padu))
				or (gamepad_axis_value(1, gp_axislv) < 0)
				and (menu_joystick2_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu_joystick2_delay = 30;
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack1"))
						{
							player2_menu = "select_voicepack";
						}
						else
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
						{
							player2_menu = "select_skin";
						}
						else
						{
							player2_menu = "select_character";
						}
					}
				}
				#endregion /* Player 2 key up END */
				
				if (can_input_player1_name == false)
				and (can_input_player2_name == false)
				and (can_input_player3_name == false)
				and (can_input_player4_name == false)
				{
					if (player2_key_a_pressed)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							keyboard_string = global.player2_name;
							can_input_player1_name = false;
							can_input_player2_name = true;
							can_input_player3_name = false;
							can_input_player4_name = false;
						}
					}
				}
			}
			#endregion /* Player 2 Menu Navigation END */
			
			#region /* Player 3 Menu Navigation */
			if (player3_menu == "select_character")
			{
				/* Navigate Character Selection */
				
				#region /* Player 3 */
				if (menu_joystick3_delay <= 0)
				and (input_key == false)
				and (can_navigate == true)
				and (player3_accept_selection = false)
				{
			
					#region /* Player 3 change portrait when clicking left or right */
			
					#region /* Player 3 Key Left (change portrait sprites) */
					if (keyboard_check_pressed(global.player3_key_left))
					or (keyboard_check_pressed(global.player3_key2_left))
					or (gamepad_button_check_pressed(2, gp_padl))
					or (gamepad_axis_value(2, gp_axislh) < 0)
					and (menu_joystick3_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player3_display_x - arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player3_display_x - arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						and (global.character_index[2] > 0)
						{
							menu_delay = 10;
							menu_joystick3_delay = 30;
							if (global.character_index[2] > 0)
							{
								global.character_index[2] -= 1;
								global.character_for_player_3 = ds_list_find_value(global.all_loaded_characters, global.character_index[2])
								xx3 = player3_display_x - 32;
							}
							else
							{
								global.character_index[2] = 0;
								global.character_for_player_3 = ds_list_find_value(global.all_loaded_characters, global.character_index[2])
							}
					
							#region /* Player 3 character select portrait sprite */
							global.sprite_select_player_3 = spr_noone;
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
							#endregion /* Player 3 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 3 Key Left (change portrait sprites) END */
	
					#region /* Player 3 Key Right (change portrait sprites) */
					if (keyboard_check_pressed(global.player3_key_right))
					or (keyboard_check_pressed(global.player3_key2_right))
					or (gamepad_button_check_pressed(2, gp_padr))
					or (gamepad_axis_value(2, gp_axislh) > 0)
					and (menu_joystick3_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player3_display_x + arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player3_display_x + arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						{
							menu_delay = 10;
							menu_joystick3_delay = 30;
							
							if (global.character_index[2] < ds_list_size(global.all_loaded_characters) - 1)
							{
								global.character_index[2] = clamp(global.character_index[2] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
								global.character_for_player_3 = ds_list_find_value(global.all_loaded_characters, global.character_index[2])
								xx3 = player3_display_x + 32;
							}
							
							#region /* Player 3 character select portrait sprite */
							global.sprite_select_player_3 = spr_noone;
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
							global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
							#endregion /* Player 3 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 3 Key Right (change portrait sprites) END */
			
					#endregion /* Player 3 change portrait when clicking left or right END */
	
			}
				#endregion /* Player 3 END */
				
				#region /* Player 3 key down */
				if (keyboard_check_pressed(global.player3_key_down))
				or (keyboard_check_pressed(global.player3_key2_down))
				or (gamepad_button_check_pressed(2, gp_padd))
				or (gamepad_axis_value(2, gp_axislv) > 0)
				and (menu_joystick3_delay <= 0)
				{
					if (menu_delay == 0)
					and (player3_accept_selection >= 0)
					{
						menu_delay = 3;
						menu_joystick3_delay = 30;
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
						{
							player3_menu = "select_skin";
						}
						else
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack1"))
						{
							player3_menu = "select_voicepack";
						}
						else
						{
							player3_menu = "select_name";
						}
					}
				}
				#endregion /* Player 3 key down END */
				
			}
			if (player3_menu == "select_name")
			{
				
				#region /* Player 3 key up */
				if (keyboard_check_pressed(global.player3_key_up))
				or (keyboard_check_pressed(global.player3_key2_up))
				or (gamepad_button_check_pressed(2, gp_padu))
				or (gamepad_axis_value(2, gp_axislv) < 0)
				and (menu_joystick3_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu_joystick3_delay = 30;
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack1"))
						{
							player3_menu = "select_voicepack";
						}
						else
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
						{
							player3_menu = "select_skin";
						}
						else
						{
							player3_menu = "select_character";
						}
					}
				}
				#endregion /* Player 3 key up END */
				
				if (can_input_player1_name == false)
				and (can_input_player2_name == false)
				and (can_input_player3_name == false)
				and (can_input_player4_name == false)
				{
					if (player3_key_a_pressed)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							keyboard_string = global.player3_name;
							can_input_player1_name = false;
							can_input_player3_name = false;
							can_input_player3_name = true;
							can_input_player4_name = false;
						}
					}
				}
			}
			#endregion /* Player 3 Menu Navigation END */
			
			#region /* Player 4 Menu Navigation */
			if (player4_menu == "select_character")
			{
				/* Navigate Character Selection */
				
				#region /* Player 4 */
				if (menu_joystick4_delay <= 0)
				and (input_key == false)
				and (can_navigate == true)
				and (player4_accept_selection = false)
				{
			
					#region /* Player 4 change portrait when clicking left or right */
			
					#region /* Player 4 Key Left (change portrait sprites) */
					if (keyboard_check_pressed(global.player4_key_left))
					or (keyboard_check_pressed(global.player4_key2_left))
					or (gamepad_button_check_pressed(3, gp_padl))
					or (gamepad_axis_value(3, gp_axislh) < 0)
					and (menu_joystick4_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player4_display_x - arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player4_display_x - arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						and (global.character_index[3]> 0)
						{
							menu_delay = 10;
							menu_joystick4_delay = 30;
							if (global.character_index[3]> 0)
							{
								global.character_index[3]-= 1;
								global.character_for_player_4 = ds_list_find_value(global.all_loaded_characters, global.character_index[3])
								xx4 = player4_display_x - 32;
							}
							else
							{
								global.character_index[3] = 0;
								global.character_for_player_4 = ds_list_find_value(global.all_loaded_characters, global.character_index[3])
							}
					
							#region /* Player 4 character select portrait sprite */
							global.sprite_select_player_4 = spr_noone;
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 3, global.skin_for_player_4);
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 3, global.skin_for_player_4);
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 3, global.skin_for_player_4);
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 3, global.skin_for_player_4);
							#endregion /* Player 4 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 4 Key Left (change portrait sprites) END */
	
					#region /* Player 4 Key Right (change portrait sprites) */
					if (keyboard_check_pressed(global.player4_key_right))
					or (keyboard_check_pressed(global.player4_key2_right))
					or (gamepad_button_check_pressed(3, gp_padr))
					or (gamepad_axis_value(3, gp_axislh) > 0)
					and (menu_joystick4_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y,
					get_window_width * 0.5 + player4_display_x + arrow_offset - 16,
					get_window_height * 0.5 - 16,
					get_window_width * 0.5 + player4_display_x + arrow_offset + 16,
					get_window_height * 0.5 + 16))
					and (mouse_check_button_pressed(mb_left))
					{
				
						if (menu_delay == 0)
						{
							menu_delay = 10;
							menu_joystick4_delay = 30;
							
							if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
							{
								global.character_index[3] = clamp(global.character_index[3] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
								global.character_for_player_4 = ds_list_find_value(global.all_loaded_characters, global.character_index[3])
								xx4 = player4_display_x + 32;
							}
							
							#region /* Player 4 character select portrait sprite */
							global.sprite_select_player_4 = spr_noone;
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 3, global.skin_for_player_4);
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 3, global.skin_for_player_4);
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 3, global.skin_for_player_4);
							global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 3, global.skin_for_player_4);
							#endregion /* Player 4 character select portrait sprite END */
					
						}
					}
					#endregion /* Player 4 Key Right (change portrait sprites) END */
			
					#endregion /* Player 4 change portrait when clicking left or right END */
			
			}
			#endregion /* Player 4 END */
				
				#region /* Player 4 key down */
			if (keyboard_check_pressed(global.player4_key_down))
			or (keyboard_check_pressed(global.player4_key2_down))
			or (gamepad_button_check_pressed(3, gp_padd))
			or (gamepad_axis_value(3, gp_axislv) > 0)
			and (menu_joystick4_delay <= 0)
			{
				if (menu_delay == 0)
				and (player4_accept_selection >= 0)
				{
					menu_delay = 3;
					menu_joystick4_delay = 30;
					if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
					and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
					or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
					and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
					{
						player4_menu = "select_skin";
					}
					else
					if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack0"))
					and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack1"))
					or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack0"))
					and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack1"))
					{
						player4_menu = "select_voicepack";
					}
					else
					{
						player4_menu = "select_name";
					}
				}
			}
			#endregion /* Player 4 key down END */
				
			}
			if (player4_menu == "select_name")
			{
				
				#region /* Player 4 key up */
				if (keyboard_check_pressed(global.player4_key_up))
				or (keyboard_check_pressed(global.player4_key2_up))
				or (gamepad_button_check_pressed(3, gp_padu))
				or (gamepad_axis_value(3, gp_axislv) < 0)
				and (menu_joystick4_delay <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu_joystick4_delay = 30;
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack1"))
						{
							player4_menu = "select_voicepack";
						}
						else
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
						{
							player4_menu = "select_skin";
						}
						else
						{
							player4_menu = "select_character";
						}
					}
				}
				#endregion /* Player 4 key up END */
				
				if (can_input_player1_name == false)
				and (can_input_player2_name == false)
				and (can_input_player3_name == false)
				and (can_input_player4_name == false)
				{
					if (player4_key_a_pressed)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							keyboard_string = global.player4_name;
							can_input_player1_name = false;
							can_input_player2_name = false;
							can_input_player3_name = false;
							can_input_player4_name = true;
						}
					}
				}
			}
			#endregion /* Player 4 Menu Navigation END */
			
			#region /* The 3 buttons in the top left corner of character select screen */
			
			#region /* Click Open Custom Levels Folder */
			if (global.enable_open_custom_folder == true)
			and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 42 + 2, 371, 42 + 41))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (global.enable_open_custom_folder == true)
			and (menu == "open_custom_characters_folder")
			and (player1_key_a_pressed)
			and (menu_delay == 0)
			or (global.enable_open_custom_folder == true)
			and (player1_menu == "open_custom_characters_folder")
			and (player1_key_a_pressed)
			and (menu_delay == 0)
			{
				scr_open_folder(game_save_id + "\custom_characters")
			}
			#endregion /* Click Open Custom Levels Folder END */
			
			else
			
			#region /* Click Copy Characters */
			if (global.enable_copy_characters == true)
			and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 42 + 2 + 42, 371, 42 + 41 + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_pressed(mb_left))
			and (menu_delay == 0)
			or (global.enable_copy_characters == true)
			and (menu == "copy_character")
			and (player1_key_a_pressed)
			and (menu_delay == 0)
			or (global.enable_copy_characters == true)
			and (player1_menu == "copy_character")
			and (player1_key_a_pressed)
			and (menu_delay == 0)
			{
				file_load_timer = 0;
				load_ok = 0;
				menu = "click_copy_character";
				menu_delay = 3;
			}
			#endregion /* Click Copy Characters END */
			
			#region /* Key Up */
			if (keyboard_check_pressed(global.player1_key_up))
			or (keyboard_check_pressed(global.player1_key2_up))
			or (gamepad_button_check_pressed(0, gp_padu))
			or (gamepad_axis_value(0, gp_axislv) < 0)
			and (menu_joystick1_delay <= 0)
			{
				if (menu_delay == 0)
				and (menu_joystick_delay <= 0)
				{
					
					if (global.enable_open_custom_folder == true)
					and (menu == "open_custom_characters_folder") /* Open Custom Characters Folder */
					{
						menu_delay = 3;
						can_navigate = true;
						player1_menu = "back_from_character_select";
						menu = "back_from_character_select";
					}
					
					else
					
					if (global.enable_copy_characters == true)
					and (menu == "copy_character") /* Copy Character */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.enable_open_custom_folder == true)
						{
							player1_menu = "open_custom_characters_folder";
							menu = "open_custom_characters_folder";
						}
						else
						{
							player1_menu = "back_from_character_select";
							menu = "back_from_character_select";
						}
					}
				}
			}
			#endregion /* Key Up END */
			
			else
			
			#region /* Key Down */
			if (keyboard_check_pressed(global.player1_key_down))
			or (keyboard_check_pressed(global.player1_key2_down))
			or (gamepad_button_check_pressed(0, gp_padd))
			or (gamepad_axis_value(0, gp_axislv) > 0)
			and (menu_joystick1_delay <= 0)
			{
				if (menu_delay == 0)
				and (menu_joystick_delay <= 0)
				{
					if (menu == "back_from_character_select")
					{
						menu_delay = 3;
						if (global.enable_open_custom_folder == true)
						{
							player1_menu = "open_custom_characters_folder"
							menu = "open_custom_characters_folder"
						}
						else
						if (global.enable_copy_characters == true)
						{
							player1_menu = "copy_character";
							menu = "copy_character";
						}
						else
						{
							player1_menu = "select_character";
							menu = "select_character";
						}
					}
					
					else
					
					if (global.enable_open_custom_folder == true)
					and (menu == "open_custom_characters_folder") /* Open Custom Characters Folder */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.enable_copy_characters == true)
						{
							player1_menu = "copy_character";
							menu = "copy_character";
						}
						else
						{
							player1_menu = "select_character";
							menu = "select_character";
						}
					}
					
					else
					
					if (global.enable_copy_characters == true)
					and (menu == "copy_character") /* Copy Character */
					{
						menu_delay = 3;
						can_navigate = true;
						player1_menu = "select_character";
						menu = "select_character";
					}
				}
			}
			#endregion /* Key Down END */
			
			#endregion /* The 3 buttons in the top left corner of character select screen END */
			
		}
		#endregion /* Menu Navigation END */
		
		#region /* Click on name to input name */
		if (variable_instance_exists(self, "name_y"))
		and (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player1_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player1_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (player1_accept_selection >= 0)
		{
			menu_delay = 3;
			keyboard_string = global.player1_name;
			can_input_player1_name = true;
			can_input_player2_name = false;
			can_input_player3_name = false;
			can_input_player4_name = false;
		}
		if (variable_instance_exists(self, "name_y"))
		and (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player2_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player2_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (player2_accept_selection >= 0)
		{
			menu_delay = 3;
			keyboard_string = global.player2_name;
			can_input_player1_name = false;
			can_input_player2_name = true;
			can_input_player3_name = false;
			can_input_player4_name = false;
		}
		if (variable_instance_exists(self, "name_y"))
		and (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player3_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player3_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (player3_accept_selection >= 0)
		{
			menu_delay = 3;
			keyboard_string = global.player3_name;
			can_input_player1_name = false;
			can_input_player2_name = false;
			can_input_player3_name = true;
			can_input_player4_name = false;
		}
		if (variable_instance_exists(self, "name_y"))
		and (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player4_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player4_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (player4_accept_selection >= 0)
		{
			menu_delay = 3;
			keyboard_string = global.player4_name;
			can_input_player1_name = false;
			can_input_player2_name = false;
			can_input_player3_name = false;
			can_input_player4_name = true;
		}
		#endregion /* Click on name to input name END */
		
		#region /* Accept and Back */
		if (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		{
			
			#region /* Accept */
			
			#region /* Select the character */
			if (player1_key_a_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player1_display_x - 100,
			get_window_height * 0.5 + 150 - 20,
			get_window_width * 0.5 + player1_display_x + 100,
			get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player1_menu == "select_character")
				or (player1_menu = "select_skin")
				or (player1_menu = "select_voicepack")
				{
					if (player1_accept_selection == false)
					and (menu_delay == 0)
					{
						menu_delay = 3;
						player1_accept_selection = true;
						global.player1_can_play = true;
					
						#region /* When selecting character, make the character say their own name */
						audio_stop_sound(voice_select_character);
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_3.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_2.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_1.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_3.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_2.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name_1.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1) + "/name.ogg");
						}
						else
						{
							voice_select_character = noone;
						}
						scr_audio_play(voice_select_character, volume_source.voice);
						#endregion /* When selecting character, make the character say their own name END */
					
					}
				}
			}
			if (player2_key_a_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player2_display_x - 100,
			get_window_height * 0.5 + 150 - 20,
			get_window_width * 0.5 + player2_display_x + 100,
			get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player2_menu == "select_character")
				or (player2_menu = "select_skin")
				or (player2_menu = "select_voicepack")
				{
					if (player2_accept_selection = false)
					and (menu_delay == 0)
					{
						menu_delay = 3;
						player2_accept_selection = true;
						global.player2_can_play = true;
					
						#region /* When selecting character, make the character say their own name */
						audio_stop_sound(voice_select_character);
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_3.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_2.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_1.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_3.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_2.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name_1.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2) + "/name.ogg");
						}
						else
						{
							voice_select_character = noone;
						}
						scr_audio_play(voice_select_character, volume_source.voice);
						#endregion /* When selecting character, make the character say their own name END */
					
					}
				}
			}
			if (player3_key_a_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player3_display_x - 100,
			get_window_height * 0.5 + 150 - 20,
			get_window_width * 0.5 + player3_display_x + 100,
			get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player3_menu == "select_character")
				or (player3_menu = "select_skin")
				or (player3_menu = "select_voicepack")
				{
					if (player3_accept_selection = false)
					and (menu_delay == 0)
					{
						menu_delay = 3;
						player3_accept_selection = true;
						global.player3_can_play = true;
					
						#region /* When selecting character, make the character say their own name */
						audio_stop_sound(voice_select_character);
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_3.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_2.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_1.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_3.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_2.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name_1.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3) + "/name.ogg");
						}
						else
						{
							voice_select_character = noone;
						}
						scr_audio_play(voice_select_character, volume_source.voice);
						#endregion /* When selecting character, make the character say their own name END */
					
					}
				}
			}
			if (player4_key_a_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 + player4_display_x - 100,
			get_window_height * 0.5 + 150 - 20,
			get_window_width * 0.5 + player4_display_x + 100,
			get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player4_menu == "select_character")
				or (player4_menu = "select_skin")
				or (player4_menu = "select_voicepack")
				{
					if (player4_accept_selection = false)
					and (menu_delay == 0)
					{
						menu_delay = 3;
						player4_accept_selection = true;
						global.player4_can_play = true;
					
						#region /* When selecting character, make the character say their own name */
						audio_stop_sound(voice_select_character);
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_3.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_2.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_1.ogg");
						}
						else
						if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_3.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_3.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_2.ogg"))
						and (floor(random(3 - 1)) == 0)
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_2.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_1.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name_1.ogg");
						}
						else
						if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name.ogg"))
						{
							voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4) + "/name.ogg");
						}
						else
						{
							voice_select_character = noone;
						}
						scr_audio_play(voice_select_character, volume_source.voice);
						#endregion /* When selecting character, make the character say their own name END */
					
					}
				}
			}
			#endregion /* Select the character END */
			
			#region /* Start Game */
			
			#region /* If all players have selected a character, be able to start game */
			if (player1_accept_selection == true)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection == true)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection == true)
			and (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection == true)
			{
				player_start_game = true;
			}
			else
			{
				player_start_game = false;
			}
			#endregion /* If all players have selected a character, be able to start game END */
	
			#endregion /* Start Game END */
			
			if (player1_accept_selection == true)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (player1_key_a_pressed)
			and (player1_menu != "back_from_character_select")
			and (player1_menu != "open_custom_characters_folder")
			and (player1_menu != "copy_character")
			
			or (player1_accept_selection = -1)
			and (player2_accept_selection == true)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (player2_key_a_pressed)
			and (player2_menu != "back_from_character_select")
			
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection == true)
			and (player4_accept_selection != 0)
			and (player3_key_a_pressed)
			and (player3_menu != "back_from_character_select")
			
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection = -1)
			and (player4_accept_selection == true)
			and (player4_key_a_pressed)
			and (player3_menu != "back_from_character_select")
			
			or (player_start_game == true)
			and (variable_instance_exists(self, "play_the_game_text_y"))
			and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y - 32, get_window_width, play_the_game_text_y + 32))
			and (mouse_check_button_pressed(mb_left))
			{
				if (can_input_player1_name == false)
				and (can_input_player2_name == false)
				and (can_input_player3_name == false)
				and (can_input_player4_name == false)
				and (menu_delay == 0)
				{
					ini_open("config.ini"); /* Must save character_for_player in config.ini manually here, because scr_config_save doesn't run every frame in step event, only when you exit the options menu, to prevent config.ini to get deleted and replaced every frame */
					ini_write_real("config", "character_index_player_1", global.character_index[0]);
					ini_write_real("config", "character_index_player_2", global.character_index[1]);
					ini_write_real("config", "character_index_player_3", global.character_index[2]);
					ini_write_real("config", "character_index_player_4", global.character_index[3]);
					ini_write_real("config", "skin_for_player_1", global.skin_for_player_1);
					ini_write_real("config", "skin_for_player_2", global.skin_for_player_2);
					ini_write_real("config", "skin_for_player_3", global.skin_for_player_3);
					ini_write_real("config", "skin_for_player_4", global.skin_for_player_4);
					ini_write_string("config", "player1_name", global.player1_name);
					ini_write_string("config", "player2_name", global.player2_name);
					ini_write_string("config", "player3_name", global.player3_name);
					ini_write_string("config", "player4_name", global.player4_name);
					ini_close();
					if (global.character_select_in_this_menu == "main_game")
					{
						can_navigate = false;
						menu_delay = 9999;
					}
					else
					{
						global.select_level_index = 0;
						scr_load_custom_level_initializing();
						can_input_player1_name = false;
						can_input_player2_name = false;
						can_input_player3_name = false;
						can_input_player4_name = false;
						can_navigate = true;
						menu_delay = 3;
						open_sub_menu = false;
						player1_accept_selection = false;
						player2_accept_selection = false;
						player3_accept_selection = false;
						player4_accept_selection = false;
						menu = "load_custom_level";
					}
				}
			}
			#endregion /* Accept END */
			
			#region /* Back / Cancel Selection */
			
			#region /* Player 1 Back / Cancel Selection */
			if (player1_key_b_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player1_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player1_accept_selection == true)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player1_accept_selection = false;
					global.player1_can_play = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 1 Back / Cancel Selection END */
			
			#region /* Player 2 Back / Cancel Selection */
			if (player2_key_b_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player2_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player2_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player2_accept_selection == true)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player2_accept_selection = false;
					global.player2_can_play = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 2 Back / Cancel Selection END */
			
			#region /* Player 3 Back / Cancel Selection */
			if (player3_key_b_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player3_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player3_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player3_accept_selection == true)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player3_accept_selection = false;
					global.player3_can_play = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 3 Back / Cancel Selection END */
			
			#region /* Player 4 Back / Cancel Selection */
			if (player4_key_b_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player4_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player4_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player4_accept_selection == true)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player4_accept_selection = false;
					global.player4_can_play = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 4 Back / Cancel Selection END */
			
			#region /* If player 1 has selected a character, be able to start game */
			if (player1_accept_selection == true)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player_2 = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player_3 = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player_4 = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection == true)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player_2 = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player_3 = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player_4 = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection == true)
			and (player4_accept_selection != 0)
			{
				global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player_2 = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player_3 = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player_4 = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection == true)
			{
				global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player_2 = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player_3 = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player_4 = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			{
				player_start_game = false;
			}
			#endregion /* If player 1 has selected a character, be able to start game END */
			
			if (player1_key_b_pressed)
			and (player1_accept_selection <= -1)
			or (player1_key_a_pressed)
			and (menu == "back_from_character_select")
			or (player1_key_a_pressed)
			and (player1_menu == "back_from_character_select")
			or (player1_key_a_pressed)
			and (player2_menu == "back_from_character_select")
			or (player1_key_a_pressed)
			and (player3_menu == "back_from_character_select")
			or (player1_key_a_pressed)
			and (player4_menu == "back_from_character_select")
			{
				if (menu_delay == 0)
				{
					menu_delay = 3;
					image_alpha = 1;
					player_start_game = false;
					can_input_player1_name = false;
					can_input_player2_name = false;
					can_input_player3_name = false;
					can_input_player4_name = false;
					player1_accept_selection = -1;
					player2_accept_selection = -1;
					player3_accept_selection = -1;
					player4_accept_selection = -1;
					global.player1_can_play = false;
					global.player2_can_play = false;
					global.player3_can_play = false;
					global.player4_can_play = false;
					player1_menu = "select_character";
					player2_menu = "select_character";
					player3_menu = "select_character";
					player4_menu = "select_character";
					xx1 = player1_display_x;
					xx2 = player2_display_x;
					xx3 = player3_display_x;
					xx4 = player4_display_x;
					if (global.character_select_in_this_menu == "main_game")
					{
						menu = "main_game";
					}
					else
					{
						menu = "leveleditor";
					}
					can_navigate = true;
					global.level_editor_level = 1;
				}
			}
			#endregion /* Back / Cancel Selection END */
			
		}
		#endregion /* Accept and Back END */
		
		if (menu_delay > 0)
		{
			menu_delay -= 1;
		}
		if (menu_delay < 0)
		{
			menu_delay = 0;
		}
		
		#region /* Menu navigation with joystick */
		if (gamepad_axis_value(0, gp_axislv) < 0)
		or (gamepad_axis_value(0, gp_axislv) > 0)
		or (gamepad_axis_value(0, gp_axislh) < 0)
		or (gamepad_axis_value(0, gp_axislh) > 0)
		{
			if (menu_joystick1_delay == 0)
			{
				menu_joystick1_delay = 30;
			}
		}
		if (gamepad_axis_value(1, gp_axislv) < 0)
		or (gamepad_axis_value(1, gp_axislv) > 0)
		or (gamepad_axis_value(1, gp_axislh) < 0)
		or (gamepad_axis_value(1, gp_axislh) > 0)
		{
			if (menu_joystick2_delay == 0)
			{
				menu_joystick2_delay = 30;
			}
		}
		if (gamepad_axis_value(2, gp_axislv) < 0)
		or (gamepad_axis_value(2, gp_axislv) > 0)
		or (gamepad_axis_value(2, gp_axislh) < 0)
		or (gamepad_axis_value(2, gp_axislh) > 0)
		{
			if (menu_joystick3_delay == 0)
			{
				menu_joystick3_delay = 30;
			}
		}
		if (gamepad_axis_value(3, gp_axislv) < 0)
		or (gamepad_axis_value(3, gp_axislv) > 0)
		or (gamepad_axis_value(3, gp_axislh) < 0)
		or (gamepad_axis_value(3, gp_axislh) > 0)
		{
			if (menu_joystick4_delay == 0)
			{
				menu_joystick4_delay = 30;
			}
		}
		if (gamepad_axis_value(0, gp_axislv)= 0)
		and (gamepad_axis_value(0, gp_axislh)= 0)
		{
			menu_joystick1_delay = 0;
		}
		if (gamepad_axis_value(1, gp_axislv)= 0)
		and (gamepad_axis_value(1, gp_axislh)= 0)
		{
			menu_joystick2_delay = 0;
		}
		if (gamepad_axis_value(2, gp_axislv)= 0)
		and (gamepad_axis_value(2, gp_axislh)= 0)
		{
			menu_joystick3_delay = 0;
		}
		if (gamepad_axis_value(3, gp_axislv)= 0)
		and (gamepad_axis_value(3, gp_axislh)= 0)
		{
			menu_joystick4_delay = 0;
		}
		if (menu_joystick1_delay > 0)
		{
			menu_joystick1_delay -= 1;
		}
		if (menu_joystick2_delay > 0)
		{
			menu_joystick2_delay -= 1;
		}
		if (menu_joystick3_delay > 0)
		{
			menu_joystick3_delay -= 1;
		}
		if (menu_joystick4_delay > 0)
		{
			menu_joystick4_delay -= 1;
		}
		#endregion /* Menu navigation with joystick END */
		
		#region /* If players haven't joined the game */
		if (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		{
			
			#region /* Player 1 Join Text */
			if (player1_accept_selection <= -1)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player1_display_x + 150, get_window_height * 0.5 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
				}
				if (player1_key_a_pressed)
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player1_display_x + 150, get_window_height * 0.5 + 32))
				{
					if (menu_delay == 0)
					and (menu != "back_from_character_select")
					and (player1_menu != "back_from_character_select")
					and (menu != "open_custom_characters_folder")
					and (player1_menu != "open_custom_characters_folder")
					and (menu != "copy_character")
					and (player1_menu != "copy_character")
					{
						menu = "select_character";
						player1_menu = "select_character";
						menu_delay = 3;
						player1_accept_selection = 0;
						global.character_index[0] = clamp(global.character_index[0], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[1] = clamp(global.character_index[1], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[2] = clamp(global.character_index[2], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[3] = clamp(global.character_index[3], 0, ds_list_size(global.all_loaded_characters) - 1);
					}
				}
			}
			#endregion /* Player 1 Join Text END */
			
			#region /* Player 2 Join Text */
			if (player2_accept_selection <= -1)
			and (global.playergame >= 1)
			or (player2_accept_selection <= -1)
			and (global.skip_how_many_people_are_playing_screen == true)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player2_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player2_display_x + 150, get_window_height * 0.5 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
				}
				if (player2_key_a_pressed)
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player2_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player2_display_x + 150, get_window_height * 0.5 + 32 + 32))
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						player2_accept_selection = 0;
						global.character_index[0] = clamp(global.character_index[0], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[1] = clamp(global.character_index[1], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[2] = clamp(global.character_index[2], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[3] = clamp(global.character_index[3], 0, ds_list_size(global.all_loaded_characters) - 1);
					}
				}
			}
			#endregion /* Player 2 Join Text END */
			
			#region /* Player 3 Join Text */
			if (player3_accept_selection <= -1)
			and (global.playergame >= 2)
			or (player3_accept_selection <= -1)
			and (global.skip_how_many_people_are_playing_screen == true)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player3_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player3_display_x + 150, get_window_height * 0.5 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
				}
				if (player3_key_a_pressed)
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player3_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player3_display_x + 150, get_window_height * 0.5 + 32))
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						player3_accept_selection = 0;
						global.character_index[0] = clamp(global.character_index[0], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[1] = clamp(global.character_index[1], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[2] = clamp(global.character_index[2], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[3] = clamp(global.character_index[3], 0, ds_list_size(global.all_loaded_characters) - 1);
					}
				}
			}
			#endregion /* Player 3 Join Text END */
			
			#region /* Player 4 Join Text */
			if (player4_accept_selection <= -1)
			and (global.playergame >= 3)
			or (player4_accept_selection <= -1)
			and (global.skip_how_many_people_are_playing_screen == true)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player4_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player4_display_x + 150, get_window_height * 0.5 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
				}
				if (player4_key_a_pressed)
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player4_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player4_display_x + 150, get_window_height * 0.5 + 32 + 32))
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						player4_accept_selection = 0;
						global.character_index[0] = clamp(global.character_index[0], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[1] = clamp(global.character_index[1], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[2] = clamp(global.character_index[2], 0, ds_list_size(global.all_loaded_characters) - 1);
						global.character_index[3] = clamp(global.character_index[3], 0, ds_list_size(global.all_loaded_characters) - 1);
					}
				}
			}
			#endregion /* Player 4 Join Text END */
			
		}
		#endregion /* If players haven't joined the game END */
		
	}
	else
	if (menu == "click_copy_character")
	or (menu == "open_folder_copy_character")
	or (menu == "back_from_copy_character")
	{
		player1_display_x = 0;
		xx1 = 0;
		
		#region /* Player 1 */
		
		#region /* Player 1 change portrait when clicking left or right */
		
		#region /* Player 1 Key Left (change portrait sprites) */
		if (keyboard_check_pressed(global.player1_key_left))
		or (keyboard_check_pressed(global.player1_key2_left))
		or (gamepad_button_check_pressed(0, gp_padl))
		or (gamepad_axis_value(0, gp_axislh) < 0)
		and (menu_joystick1_delay <= 0)
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player1_display_x - arrow_offset - 16,
		get_window_height * 0.5 - 16,
		get_window_width * 0.5 + player1_display_x - arrow_offset + 16,
		get_window_height * 0.5 + 16))
		and (mouse_check_button_pressed(mb_left))
		{
			
			if (menu_delay == 0)
			and (can_navigate == true)
			and (global.character_index[0] > 0)
			{
				menu_delay = 3;
				menu_joystick1_delay = 30;
				if (global.character_index[0] > 0)
				{
					global.character_index[0] -= 1;
					global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx1 = player1_display_x - 32;
				}
				else
				{
					global.character_index[0] = 0;
					global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
				}
				
				#region /* Player 1 character select portrait sprite */
				global.sprite_select_player_1 = spr_noone;
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
				#endregion /* Player 1 character select portrait sprite END */
				
			}
		}
		#endregion /* Player 1 Key Left (change portrait sprites) END */
		
		#region /* Player 1 Key Right (change portrait sprites) */
		if (keyboard_check_pressed(global.player1_key_right))
		or (keyboard_check_pressed(global.player1_key2_right))
		or (gamepad_button_check_pressed(0, gp_padr))
		or (gamepad_axis_value(0, gp_axislh) > 0)
		and (menu_joystick1_delay <= 0)
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player1_display_x + arrow_offset - 16,
		get_window_height * 0.5 - 16,
		get_window_width * 0.5 + player1_display_x + arrow_offset + 16,
		get_window_height * 0.5 + 16))
		and (mouse_check_button_pressed(mb_left))
		{
			
			if (menu_delay == 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				menu_joystick1_delay = 30;
				
				if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
				{
					global.character_index[0] = clamp(global.character_index[0] + 1, 0, ds_list_size(global.all_loaded_characters) - 1);
					global.character_for_player_1 = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx1 = player1_display_x + 32;
				}
				
				#region /* Player 1 character select portrait sprite */
				global.sprite_select_player_1 = spr_noone;
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
				global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
				#endregion /* Player 1 character select portrait sprite END */
				
			}
		}
		#endregion /* Player 1 Key Right (change portrait sprites) END */
		
		#endregion /* Player 1 change portrait when clicking left or right END */
		
		#region /* Key Left */
		if (global.character_index[0] > 0)
		and (can_navigate == true)
		{		
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player1_display_x - arrow_offset + 16, get_window_height * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				player1_menu = "select_character";
			}
		}
		#endregion /* Key Left END */
		
		#region /* Key Right */
		if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
		and (can_navigate == true)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player1_display_x + arrow_offset + 16, get_window_height * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				player1_menu = "select_character";
			}
		}
		#endregion /* Key Right END */
		
		#endregion /* Player 1 END */
		
		#region /* Copy Characters */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height - 42 - 42 - 42 + 2, get_window_width * 0.5 - 185 + 371, get_window_height - 42 - 43 + 42 - 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "click_copy_character")
		and (player1_key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "click_copy_character")
		and (player1_key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			can_navigate = false;
			load_ok = 0;
			load_specific_folder = 0;
			first_copy_file = "";
			menu = "click_copy_character";
			player1_menu = "click_copy_character";
			
			#region /* Copy character files to new character folder */
			
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy")
			}
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data")
			}
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound")
			}
			if (!file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites"))
			{
				directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites")
			}
			
			#region /* Copy files from selected character to custom character copy */
			if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
			{
				file_copy(
				"characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/character_config.ini");
			}
			if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
			{
				file_copy(
				"characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/sprite_origin_point.ini");
			}
			if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
			{
				file_copy(
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/character_config.ini");
			}
			if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
			{
				file_copy(
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini",
				working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/data/sprite_origin_point.ini");
			}
			#endregion /* Copy files from selected character to custom character copy END */
			
			#endregion /* Copy character files to new character folder END */
			
			menu_delay = 3;
		}
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(0, gp_padu))
		or (gamepad_axis_value(0, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "click_copy_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				player1_menu = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		if (menu == "click_copy_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			if (global.enable_open_custom_folder == true)
			{
				player1_menu = "open_folder_copy_character";
				menu = "open_folder_copy_character";
			}
			else
			{
				player1_menu = "back_from_copy_character";
				menu = "back_from_copy_character";
			}
		}
		#endregion /* Copy Characters END */
		
		#region /* Copy Actual Characters Code */
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			load_from_where = "characters";
		}
		else
		if (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			load_from_where = working_directory + "/custom_characters";
		}
		
		if (can_navigate = false)
		{
			file_load_timer += 1;
			
			if (file_load_timer > 1)
			and (load_ok == 0)
			{
				if (initialized_copy = false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/*.ogg", 0)
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/" + string(first_copy_file),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok += 1;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 1)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 2)
			{
				if (initialized_copy = false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/*.png", 0)
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/" + string(first_copy_file),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok += 1;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 3)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 4)
			{
				if (initialized_copy = false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/*", fa_directory)
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok += 1;
				}
				else
				{
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 5)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 6)
			{
				if (initialized_copy = false)
				{
					first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/*", fa_directory)
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(first_copy_file))
					initialized_copy = true;
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_ok += 1;
				}
				else
				{
					directory_create(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 7)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok == 8)
			{
				if (initialized_copy = false)
				{
					if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder)))
					{
						first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder) + "/*.ogg", 0)
						file_copy(
						string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder) + "/" + string(first_copy_file),
						working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/voicepack" + string(load_specific_folder) + "/" + string(first_copy_file))
						initialized_copy = true;
					}
					else
					{
						load_specific_folder = 0; /* Set this variable to 0 before going to the next loading code */
						file_load_timer = 0;
						load_ok += 1;
					}
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					file_load_timer = 0;
					initialized_copy = false;
					load_specific_folder += 1;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(load_specific_folder) + "/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sound/voicepack" + string(load_specific_folder) + "/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 9)
			{
				file_load_timer = 0;
				load_ok += 1;
				load_specific_folder = 0;
			}
			else
			if (file_load_timer > 1)
			and (load_ok = 10)
			{
				if (initialized_copy = false)
				{
					if (directory_exists(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder)))
					{
						first_copy_file = file_find_first(string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder) + "/*.png", 0)
						file_copy(
						string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder) + "/" + string(first_copy_file),
						working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/skin" + string(load_specific_folder) + "/" + string(first_copy_file))
						initialized_copy = true;
					}
					else
					{
						load_specific_folder = 0; /* Set this variable to 0 before going to the next loading code */
						can_navigate = true;
						file_load_timer = 0;
						load_ok = 0;
						with(instance_create_depth(get_window_width * 0.5, get_window_height - 42 - 42 - 42, 0, obj_score_up))
						{
							score_up = "Copied";
						}
					}
				}
				file_found = file_find_next()
				if (file_found == "")
				{
					file_find_close();
					load_specific_folder += 1;
					initialized_copy = false;
					file_load_timer = 0;
				}
				else
				{
					file_copy(
					string(load_from_where) + "/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(load_specific_folder) + "/" + string(file_found),
					working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + " - Copy/sprites/skin" + string(load_specific_folder) + "/" + string(file_found))
					
					file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
				}
			}
		}
		#endregion /* Copy Actual Characters Code END */
		
		#region /* Open Character Folder */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height - 42 - 42 + 2, get_window_width * 0.5 - 185 + 371, get_window_height - 42 - 41 + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "open_folder_copy_character")
		and (player1_key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "open_folder_copy_character")
		and (player1_key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			menu = "open_folder_copy_character";
			player1_menu = "open_folder_copy_character";
			
			if (directory_exists("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
			{
				scr_open_folder("characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])))
			}
			else
			if (directory_exists(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
			{
				scr_open_folder(game_save_id + "\custom_characters\\" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])))
			}
			
			menu_delay = 3;
		}
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(0, gp_padu))
		or (gamepad_axis_value(0, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "open_folder_copy_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				player1_menu = "click_copy_character";
				menu = "click_copy_character";
			}
		}
		if (menu == "open_folder_copy_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "back_from_copy_character";
			menu = "back_from_copy_character";
		}
		#endregion /* Open Character Folder END */
		
		#region /* Back from Copy Characters */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height - 42 + 2, get_window_width * 0.5 - 185 + 371, get_window_height - 42 - 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "back_from_copy_character")
		and (player1_key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "back_from_copy_character")
		and (player1_key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_key_b_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			scr_load_character_initializing();
			menu = "load_characters";
			player1_menu = "load_characters";
			menu_delay = 3;
		}
		if (keyboard_check_pressed(global.player1_key_up))
		or (keyboard_check_pressed(global.player1_key2_up))
		or (gamepad_button_check_pressed(0, gp_padu))
		or (gamepad_axis_value(0, gp_axislv) < 0)
		and (menu_joystick1_delay <= 0)
		{
			if (menu == "back_from_copy_character")
			and (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			and (can_navigate == true)
			{
				menu_delay = 3;
				can_navigate = true;
				if (global.enable_open_custom_folder == true)
				{
					player1_menu = "open_folder_copy_character";
					menu = "open_folder_copy_character";
				}
				else
				{
					player1_menu = "click_copy_character";
					menu = "click_copy_character";
				}
			}
		}
		if (menu == "back_from_copy_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "click_copy_character";
			menu = "click_copy_character";
		}
		#endregion /* Back from Copy Characters END */
		
		if (can_navigate = false) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
		{
			loading_spinning_angle -= 10;
		}
	}
}