function scr_character_select_menu_step()
{
	/* Player 1 Key Accept Pressed */ player1_key_a_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.accept])) || (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.accept])) || (keyboard_check_pressed(vk_space));
	/* Player 1 Key Back Pressed */ player1_key_b_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.back])) || (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.back])) || (keyboard_check_pressed(vk_escape));
	/* Player 2 Key Accept Pressed */ player2_key_a_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.accept])) || (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.accept]));
	/* Player 2 Key Back Pressed */ player2_key_b_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.back])) || (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.back]));
	/* Player 3 Key Accept Pressed */ player3_key_a_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.accept])) || (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.accept]));
	/* Player 3 Key Back Pressed */ player3_key_b_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.back])) || (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.back]));
	/* Player 4 Key Accept Pressed */ player4_key_a_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.accept])) || (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.accept]));
	/* Player 4 Key Back Pressed */ player4_key_b_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.back])) || (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.back]));
	
	#region /* If any "character index" is set to -1, reset it to 0 */
	if (global.character_index[0] <= -1)
	{
		global.character_index[0] = 0;
		global.sprite_select_player[1] = spr_noone;
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
	}
	if (global.character_index[1] <= -1)
	{
		global.character_index[1] = 0;
		global.sprite_select_player[2] = spr_noone;
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[2], 0, global.skin_for_player[2]);
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[2], 0, global.skin_for_player[2]);
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[2], 0, global.skin_for_player[2]);
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[2], 0, global.skin_for_player[2]);
	}
	if (global.character_index[2] <= -1)
	{
		global.character_index[2] = 0;
		global.sprite_select_player[3] = spr_noone;
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[3], 0, global.skin_for_player[3]);
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[3], 0, global.skin_for_player[3]);
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[3], 0, global.skin_for_player[3]);
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[3], 0, global.skin_for_player[3]);
	}
	if (global.character_index[3] <= -1)
	{
		global.character_index[3] = 0;
		global.sprite_select_player[4] = spr_noone;
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[4], 0, global.skin_for_player[4]);
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[4], 0, global.skin_for_player[4]);
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[4], 0, global.skin_for_player[4]);
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[4], 0, global.skin_for_player[4]);
	}
	#endregion /* If any "character index" is set to -1, reset it to 0 END */
	
	#region /* Lerp Play the game text */
	if (player_start_game)
	and (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		if (global.controls_used_for_menu_navigation == "mouse")
		{
			var play_the_game_text_y = display_get_gui_height() - 125; /* If navigating using mouse, text should appear at bottom of screen, for easier access */
		}
		else
		{
			var play_the_game_text_y = 125; /* Otherwise appear at top of screen */
		}
	}
	else
	{
		if (global.controls_used_for_menu_navigation == "mouse")
		{
			if (play_the_game_text_y_lerp < -70)
			{
				play_the_game_text_y_lerp = display_get_gui_height() + 100;
			}
			var play_the_game_text_y = display_get_gui_height() + 100;
		}
		else
		{
			if (play_the_game_text_y_lerp > display_get_gui_height() + 70)
			{
				play_the_game_text_y_lerp = - 100;
			}
			var play_the_game_text_y = -100;
		}
	}
	play_the_game_text_y_lerp = lerp(play_the_game_text_y_lerp, play_the_game_text_y, 0.2);
	#endregion /* Lerp Play the game text END */
	
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
		if (global.skip_how_many_people_are_playing_screen)
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
					menu = "level_editor";
				}
			}
			if (menu == "how_many_people_back")
			{
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.down]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.down]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padd))
				or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
				and (menu_specific_joystick_delay[1] <= 0)
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
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
				or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
				and (menu_specific_joystick_delay[1] <= 0)
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
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.right]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.right]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padr))
				or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
				and (menu_specific_joystick_delay[1] <= 0)
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
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.left]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.left]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padl))
				or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
				and (menu_specific_joystick_delay[1] <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_1player";
					}
				}
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.right]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.right]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padr))
				or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
				and (menu_specific_joystick_delay[1] <= 0)
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
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.left]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.left]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padl))
				or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
				and (menu_specific_joystick_delay[1] <= 0)
				{
					if (menu_delay == 0)
					{
						menu_delay = 3;
						menu = "how_many_people_2player";
					}
				}
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.right]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.right]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padr))
				or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
				and (menu_specific_joystick_delay[1] <= 0)
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
				if (keyboard_check_pressed(global.player_[inp.key][1][1][action.left]))
				or (keyboard_check_pressed(global.player_[inp.key][1][2][action.left]))
				or (gamepad_button_check_pressed(global.player1_slot, gp_padl))
				or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
				and (menu_specific_joystick_delay[1] <= 0)
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
	or (menu == "manage_character")
	or (menu == "search_character_id")
	or (menu == "input_name_ok")
	or (menu == "input_name_cancel")
	{
		
		#region /* This is running step functions of character portrait for player */
		if (global.playergame >= 0)
		or (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(1);
		}
		if (global.playergame >= 1)
		or (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(2);
		}
		if (global.playergame >= 2)
		or (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(3);
		}
		if (global.playergame >= 3)
		or (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(4);
		}
		#endregion /* This is running step functions of character portrait for player END */
		
		image_alpha = 0;
		xx[1] = lerp(xx[1], player1_display_x, 0.1);
		xx[2] = lerp(xx[2], player2_display_x, 0.1);
		xx[3] = lerp(xx[3], player3_display_x, 0.1);
		xx[4] = lerp(xx[4], player4_display_x, 0.1);
		
		#region /* All code before menu navigation code */
		
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
		if (can_input_player1_name)
		or (can_input_player2_name)
		or (can_input_player3_name)
		or (can_input_player4_name)
		{
			if (keyboard_check_pressed(vk_enter))
			or (keyboard_check_pressed(vk_escape))
			
			or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.accept]))
			or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.accept]))
			or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.accept]))
			or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.accept]))
			or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.accept]))
			or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.accept]))
			or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.accept]))
			or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.accept]))
			or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.back]))
			or (gamepad_button_check_pressed(1, global.player_[inp.gp][1][1][action.back]))
			or (gamepad_button_check_pressed(2, global.player_[inp.gp][1][1][action.back]))
			or (gamepad_button_check_pressed(3, global.player_[inp.gp][1][1][action.back]))
			or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.back]))
			or (gamepad_button_check_pressed(1, global.player_[inp.gp][1][2][action.back]))
			or (gamepad_button_check_pressed(2, global.player_[inp.gp][1][2][action.back]))
			or (gamepad_button_check_pressed(3, global.player_[inp.gp][1][2][action.back]))
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
			
			scr_character_select_player_navigation(1);
			scr_character_select_player_navigation(2);
			scr_character_select_player_navigation(3);
			scr_character_select_player_navigation(4);
			
			#region /* The buttons in the top left corner of character select screen */
			
			#region /* Click Open Custom Levels Folder */
			if (global.enable_open_custom_folder)
			and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 42 + 2, 371, 42 + 41))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (global.enable_open_custom_folder)
			and (menu == "open_custom_characters_folder")
			and (player1_key_a_pressed)
			and (menu_delay == 0)
			{
				scr_open_folder(game_save_id + "\custom_characters")
			}
			#endregion /* Click Open Custom Levels Folder END */
			
			else
			
			#region /* Click Manage Characters */
			if (global.enable_manage_characters)
			and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 42 + 2 + 42, 371, 42 + 41 + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (global.enable_manage_characters)
			and (menu == "manage_character")
			and (player1_key_a_pressed)
			and (menu_delay == 0)
			{
				menu_delay = 6;
				file_load_timer = 0;
				load_ok = 0;
				menu = "click_copy_character";
			}
			#endregion /* Click Manage Characters END */
			
			#region /* Key Up */
			if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
			or (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
			or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
			or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
			and (menu_specific_joystick_delay[1] <= 0)
			{
				if (menu_delay == 0)
				and (menu_joystick_delay <= 0)
				{
					if (global.enable_open_custom_folder)
					and (menu == "open_custom_characters_folder") /* Open Custom Characters Folder */
					{
						menu_delay = 3;
						can_navigate = true;
						player_menu[1] = "back_from_character_select";
						menu = "back_from_character_select";
					}
					else
					if (global.enable_manage_characters)
					and (menu == "manage_character") /* Copy Character */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.enable_open_custom_folder)
						{
							player_menu[1] = "open_custom_characters_folder";
							menu = "open_custom_characters_folder";
						}
						else
						{
							player_menu[1] = "back_from_character_select";
							menu = "back_from_character_select";
						}
					}
					else
					if (menu == "search_character_id") /* Search Character ID */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.enable_manage_characters)
						{
							player_menu[1] = "manage_character";
							menu = "manage_character";
						}
						else
						if (global.enable_open_custom_folder)
						{
							player_menu[1] = "open_custom_characters_folder";
							menu = "open_custom_characters_folder";
						}
						else
						{
							player_menu[1] = "back_from_character_select";
							menu = "back_from_character_select";
						}
					}
				}
			}
			#endregion /* Key Up END */
			
			else
			
			#region /* Key Down */
			if (keyboard_check_pressed(global.player_[inp.key][1][1][action.down]))
			or (keyboard_check_pressed(global.player_[inp.key][1][2][action.down]))
			or (gamepad_button_check_pressed(global.player1_slot, gp_padd))
			or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
			and (menu_specific_joystick_delay[1] <= 0)
			{
				if (menu_delay == 0)
				and (menu_joystick_delay <= 0)
				{
					if (menu == "back_from_character_select")
					{
						menu_delay = 3;
						if (global.enable_open_custom_folder)
						{
							player_menu[1] = "open_custom_characters_folder"
							menu = "open_custom_characters_folder"
						}
						else
						if (global.enable_manage_characters)
						{
							player_menu[1] = "manage_character";
							menu = "manage_character";
						}
						else
						{
							player_menu[1] = "search_character_id";
							menu = "search_character_id";
						}
					}
					else
					if (global.enable_open_custom_folder)
					and (menu == "open_custom_characters_folder") /* Open Custom Characters Folder */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.enable_manage_characters)
						{
							player_menu[1] = "manage_character";
							menu = "manage_character";
						}
						else
						{
							player_menu[1] = "select_character";
							menu = "select_character";
						}
					}
					else
					if (global.enable_manage_characters)
					and (menu == "manage_character") /* Manage Characters */
					{
						menu_delay = 3;
						can_navigate = true;
						player_menu[1] = "search_character_id";
						menu = "search_character_id";
					}
					else
					if (menu == "search_character_id") /* Search Character ID */
					{
						menu_delay = 3;
						can_navigate = true;
						player_menu[1] = "select_character";
						menu = "select_character";
					}
				}
			}
			#endregion /* Key Down END */
			
			#endregion /* The buttons in the top left corner of character select screen END */
			
		}
		#endregion /* Menu Navigation END */
		
		#region /* Click on name to input name */
		if (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player1_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player1_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (player1_accept_selection >= 0)
		and (can_input_player1_name == false)
		{
			menu_delay = 3;
			keyboard_string = global.player_name[1];
			can_input_player1_name = true;
			can_input_player2_name = false;
			can_input_player3_name = false;
			can_input_player4_name = false;
		}
		if (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player2_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player2_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (player2_accept_selection >= 0)
		and (can_input_player2_name == false)
		{
			menu_delay = 3;
			keyboard_string = global.player_name[2];
			can_input_player1_name = false;
			can_input_player2_name = true;
			can_input_player3_name = false;
			can_input_player4_name = false;
		}
		if (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player3_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player3_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (player3_accept_selection >= 0)
		and (can_input_player3_name == false)
		{
			menu_delay = 3;
			keyboard_string = global.player_name[3];
			can_input_player1_name = false;
			can_input_player2_name = false;
			can_input_player3_name = true;
			can_input_player4_name = false;
		}
		if (point_in_rectangle(mouse_get_x, mouse_get_y,
		get_window_width * 0.5 + player4_display_x - 150,
		get_window_height * 0.5 + name_y - 16,
		get_window_width * 0.5 + player4_display_x + 150,
		get_window_height * 0.5 + name_y + 16))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		and (player4_accept_selection >= 0)
		and (can_input_player4_name == false)
		{
			menu_delay = 3;
			keyboard_string = global.player_name[4];
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
			and (player_menu[1] == "select_character")
			or (player1_key_a_pressed)
			and (player_menu[1] == "select_skin")
			or (player1_key_a_pressed)
			and (player_menu[1] == "select_voicepack")
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player1_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_released(mb_left))
			{
				if (player1_accept_selection == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player1_accept_selection = true;
					player1_automatically_join = false;
					global.player1_can_play = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_2.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_1.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name.ogg");
					}
					else
					{
						voice_select_character = noone;
					}
					scr_audio_play(voice_select_character, volume_source.voice);
					#endregion /* When selecting character, make the character say their own name END */
					
				}
			}
			if (player2_key_a_pressed)
			and (player_menu[2] == "select_character")
			or (player2_key_a_pressed)
			and (player_menu[2] == "select_skin")
			or (player2_key_a_pressed)
			and (player_menu[2] == "select_voicepack")
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player2_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player2_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_released(mb_left))
			{
				if (player2_accept_selection == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player2_accept_selection = true;
					player2_automatically_join = false;
					global.player2_can_play = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_2.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_1.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name.ogg");
					}
					else
					{
						voice_select_character = noone;
					}
					scr_audio_play(voice_select_character, volume_source.voice);
					#endregion /* When selecting character, make the character say their own name END */
					
				}
			}
			if (player3_key_a_pressed)
			and (player_menu[3] == "select_character")
			or (player3_key_a_pressed)
			and (player_menu[3] == "select_skin")
			or (player3_key_a_pressed)
			and (player_menu[3] == "select_voicepack")
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player3_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player3_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_released(mb_left))
			{
				if (player3_accept_selection == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player3_accept_selection = true;
					player3_automatically_join = false;
					global.player3_can_play = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_2.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_1.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name.ogg");
					}
					else
					{
						voice_select_character = noone;
					}
					scr_audio_play(voice_select_character, volume_source.voice);
					#endregion /* When selecting character, make the character say their own name END */
					
				}
			}
			if (player4_key_a_pressed)
			and (player_menu[4] == "select_character")
			or (player4_key_a_pressed)
			and (player_menu[4] == "select_skin")
			or (player4_key_a_pressed)
			and (player_menu[4] == "select_voicepack")
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player4_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player4_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (mouse_check_button_released(mb_left))
			{
			if (player4_accept_selection == false)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					player4_accept_selection = true;
					player4_automatically_join = false;
					global.player4_can_play = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_2.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_1.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_2.ogg"))
					and (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name.ogg");
					}
					else
					{
						voice_select_character = noone;
					}
					scr_audio_play(voice_select_character, volume_source.voice);
					#endregion /* When selecting character, make the character say their own name END */
					
				}
			}
			#endregion /* Select the character END */
			
			#region /* Start Game */
			
			#region /* If all players have selected a character, be able to start game */
			if (player1_accept_selection)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection)
			and (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection)
			{
				player_start_game = true;
			}
			else
			{
				player_start_game = false;
			}
			#endregion /* If all players have selected a character, be able to start game END */
	
			#endregion /* Start Game END */
			
			if (player1_accept_selection)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (player1_key_a_pressed)
			and (player_menu[1] != "back_from_character_select")
			and (player_menu[1] != "open_custom_characters_folder")
			and (player_menu[1] != "manage_character")
			and (player_menu[1] != "search_character_id")
			
			or (player1_accept_selection == -1)
			and (player2_accept_selection)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (player2_key_a_pressed)
			and (player_menu[2] != "back_from_character_select")
			
			or (player1_accept_selection == -1)
			and (player2_accept_selection == -1)
			and (player3_accept_selection)
			and (player4_accept_selection != 0)
			and (player3_key_a_pressed)
			and (player_menu[3] != "back_from_character_select")
			
			or (player1_accept_selection == -1)
			and (player2_accept_selection == -1)
			and (player3_accept_selection == -1)
			and (player4_accept_selection)
			and (player4_key_a_pressed)
			and (player_menu[3] != "back_from_character_select")
			
			or (player_start_game)
			and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32))
			and (mouse_check_button_released(mb_left))
			{
				if (can_input_player1_name == false)
				and (can_input_player2_name == false)
				and (can_input_player3_name == false)
				and (can_input_player4_name == false)
				and (menu_delay == 0)
				{
					ini_open("config.ini"); /* Must save character_for_player in config.ini manually here, because scr_config_save doesn't run every frame in step event, only when you exit the options menu, to prevent config.ini to get deleted and replaced every frame */
					ini_write_real("config", "character_index_player1", global.character_index[0]);
					ini_write_real("config", "character_index_player2", global.character_index[1]);
					ini_write_real("config", "character_index_player3", global.character_index[2]);
					ini_write_real("config", "character_index_player4", global.character_index[3]);
					ini_write_real("config", "skin_for_player1", global.skin_for_player[1]);
					ini_write_real("config", "skin_for_player2", global.skin_for_player[2]);
					ini_write_real("config", "skin_for_player3", global.skin_for_player[3]);
					ini_write_real("config", "skin_for_player4", global.skin_for_player[4]);
					ini_write_string("config", "player1_name", global.player_name[1]);
					ini_write_string("config", "player2_name", global.player_name[2]);
					ini_write_string("config", "player3_name", global.player_name[3]);
					ini_write_string("config", "player4_name", global.player_name[4]);
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
			and (mouse_check_button_released(mb_left))
			{
				if (player1_accept_selection)
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
			and (mouse_check_button_released(mb_left))
			{
				if (player2_accept_selection)
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
			and (mouse_check_button_released(mb_left))
			{
				if (player3_accept_selection)
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
			and (mouse_check_button_released(mb_left))
			{
				if (player4_accept_selection)
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
			if (player1_accept_selection)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player[2] = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player[3] = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player[4] = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			{
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player[2] = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player[3] = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player[4] = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection)
			and (player4_accept_selection != 0)
			{
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player[2] = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player[3] = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player[4] = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection)
			{
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player[2] = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player[3] = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player[4] = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
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
			and (player_menu[1] == "back_from_character_select")
			or (player1_key_a_pressed)
			and (player_menu[2] == "back_from_character_select")
			or (player1_key_a_pressed)
			and (player_menu[3] == "back_from_character_select")
			or (player1_key_a_pressed)
			and (player_menu[4] == "back_from_character_select")
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
					player_menu[1] = "select_character";
					player_menu[2] = "select_character";
					player_menu[3] = "select_character";
					player_menu[4] = "select_character";
					xx[1] = player1_display_x;
					xx[2] = player2_display_x;
					xx[3] = player3_display_x;
					xx[4] = player4_display_x;
					if (global.character_select_in_this_menu == "main_game")
					{
						menu = "main_game";
					}
					else
					{
						menu = "level_editor";
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
		if (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
		or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
		or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
		or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
		{
			if (menu_specific_joystick_delay[1] == 0)
			{
				menu_specific_joystick_delay[1] = 30;
			}
		}
		if (gamepad_axis_value(global.player2_slot, gp_axislv) < 0)
		or (gamepad_axis_value(global.player2_slot, gp_axislv) > 0)
		or (gamepad_axis_value(global.player2_slot, gp_axislh) < 0)
		or (gamepad_axis_value(global.player2_slot, gp_axislh) > 0)
		{
			if (menu_specific_joystick_delay[2] == 0)
			{
				menu_specific_joystick_delay[2] = 30;
			}
		}
		if (gamepad_axis_value(global.player3_slot, gp_axislv) < 0)
		or (gamepad_axis_value(global.player3_slot, gp_axislv) > 0)
		or (gamepad_axis_value(global.player3_slot, gp_axislh) < 0)
		or (gamepad_axis_value(global.player3_slot, gp_axislh) > 0)
		{
			if (menu_specific_joystick_delay[3] == 0)
			{
				menu_specific_joystick_delay[3] = 30;
			}
		}
		if (gamepad_axis_value(global.player4_slot, gp_axislv) < 0)
		or (gamepad_axis_value(global.player4_slot, gp_axislv) > 0)
		or (gamepad_axis_value(global.player4_slot, gp_axislh) < 0)
		or (gamepad_axis_value(global.player4_slot, gp_axislh) > 0)
		{
			if (menu_specific_joystick_delay[4] == 0)
			{
				menu_specific_joystick_delay[4] = 30;
			}
		}
		if (gamepad_axis_value(global.player1_slot, gp_axislv)= 0)
		and (gamepad_axis_value(global.player1_slot, gp_axislh)= 0)
		{
			menu_specific_joystick_delay[1] = 0;
		}
		if (gamepad_axis_value(global.player2_slot, gp_axislv)= 0)
		and (gamepad_axis_value(global.player2_slot, gp_axislh)= 0)
		{
			menu_specific_joystick_delay[2] = 0;
		}
		if (gamepad_axis_value(global.player3_slot, gp_axislv)= 0)
		and (gamepad_axis_value(global.player3_slot, gp_axislh)= 0)
		{
			menu_specific_joystick_delay[3] = 0;
		}
		if (gamepad_axis_value(global.player4_slot, gp_axislv)= 0)
		and (gamepad_axis_value(global.player4_slot, gp_axislh)= 0)
		{
			menu_specific_joystick_delay[4] = 0;
		}
		var joystickDelays = [
		    menu_specific_joystick_delay[1],
		    menu_specific_joystick_delay[2],
		    menu_specific_joystick_delay[3],
		    menu_specific_joystick_delay[4]
		];
		
		for (var i = 0; i < 4; i++) {
		    if (joystickDelays[i] > 0) {
		        joystickDelays[i] -= 1;
		    }
		}
		
		menu_specific_joystick_delay[1] = joystickDelays[0];
		menu_specific_joystick_delay[2] = joystickDelays[1];
		menu_specific_joystick_delay[3] = joystickDelays[2];
		menu_specific_joystick_delay[4] = joystickDelays[3];
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
				or (player1_automatically_join)
				or (mouse_check_button_released(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player1_display_x + 150, get_window_height * 0.5 + 32))
				{
					if (menu_delay == 0)
					and (menu != "back_from_character_select")
					and (player_menu[1] != "back_from_character_select")
					and (menu != "open_custom_characters_folder")
					and (player_menu[1] != "open_custom_characters_folder")
					and (menu != "manage_character")
					and (player_menu[1] != "manage_character")
					and (menu != "search_character_id")
					and (player_menu[1] != "search_character_id")
					{
						player1_automatically_join = false;
						menu = "select_character";
						player_menu[1] = "select_character";
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
			and (global.skip_how_many_people_are_playing_screen)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player2_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player2_display_x + 150, get_window_height * 0.5 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
				}
				if (player2_key_a_pressed)
				or (player2_automatically_join)
				or (mouse_check_button_released(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player2_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player2_display_x + 150, get_window_height * 0.5 + 32 + 32))
				{
					if (menu_delay == 0)
					{
						player2_automatically_join = false;
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
			and (global.skip_how_many_people_are_playing_screen)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player3_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player3_display_x + 150, get_window_height * 0.5 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
				}
				if (player3_key_a_pressed)
				or (player3_automatically_join)
				or (mouse_check_button_released(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player3_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player3_display_x + 150, get_window_height * 0.5 + 32))
				{
					if (menu_delay == 0)
					{
						player3_automatically_join = false;
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
			and (global.skip_how_many_people_are_playing_screen)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player4_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player4_display_x + 150, get_window_height * 0.5 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
				}
				if (player4_key_a_pressed)
				or (player4_automatically_join)
				or (mouse_check_button_released(mb_left))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player4_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player4_display_x + 150, get_window_height * 0.5 + 32 + 32))
				{
					if (menu_delay == 0)
					{
						player4_automatically_join = false;
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
	
	#region /* Step Manage Characters Menu */
	{
		scr_character_manage_menu_step();
	}
	#endregion /* Step Manage Characters Menu END */
}