function scr_character_select_menu_step()
{
	/* Player 1 Key Accept Pressed */ player1_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.accept])) || (keyboard_check_pressed(vk_space));
	/* Player 1 Key Back Pressed */ player1_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.back])) || (keyboard_check_pressed(vk_escape));
	/* Player 2 Key Accept Pressed */ player2_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.accept]));
	/* Player 2 Key Back Pressed */ player2_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.back]));
	/* Player 3 Key Accept Pressed */ player3_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.accept]));
	/* Player 3 Key Back Pressed */ player3_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.back]));
	/* Player 4 Key Accept Pressed */ player4_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.accept]));
	/* Player 4 Key Back Pressed */ player4_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.back]));
	
	if (can_input_player1_name == 2)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		can_input_player1_name = false;
	}
	if (can_input_player2_name == 2)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		can_input_player2_name = false;
	}
	if (can_input_player3_name == 2)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		can_input_player3_name = false;
	}
	if (can_input_player4_name == 2)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		can_input_player4_name = false;
	}
	
	#region /* If any "character index" is set to -1, reset it to 0 */
	if (global.character_index[0] <= -1)
	{
		global.character_index[0] = 0;
		global.sprite_select_player[1] = spr_noone;
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
	}
	if (global.character_index[1] <= -1)
	{
		global.character_index[1] = 0;
		global.sprite_select_player[2] = spr_noone;
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[2], 0, global.skin_for_player[2]);
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[2], 0, global.skin_for_player[2]);
	}
	if (global.character_index[2] <= -1)
	{
		global.character_index[2] = 0;
		global.sprite_select_player[3] = spr_noone;
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[3], 0, global.skin_for_player[3]);
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[3], 0, global.skin_for_player[3]);
	}
	if (global.character_index[3] <= -1)
	{
		global.character_index[3] = 0;
		global.sprite_select_player[4] = spr_noone;
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[4], 0, global.skin_for_player[4]);
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[4], 0, global.skin_for_player[4]);
	}
	#endregion /* If any "character index" is set to -1, reset it to 0 END */
	
	#region /* Lerp Play the game text */
	if (player_start_game)
	&& (can_input_player1_name == false)
	&& (can_input_player2_name == false)
	&& (can_input_player3_name == false)
	&& (can_input_player4_name == false)
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
	
	if (menu == "select_character")
	|| (menu == "back_from_character_select")
	|| (menu == "manage_character")
	|| (menu == "online_character_list")
	|| (menu == "search_character_id")
	|| (menu == "input_name_ok")
	|| (menu == "input_name_cancel")
	{
		
		#region /* Start Game (run this code further up so that it takes priority) */
		if (player1_accept_selection)
		&& (player2_accept_selection != 0)
		&& (player3_accept_selection != 0)
		&& (player4_accept_selection != 0)
		&& (player1_key_a_pressed)
		&& (player_menu[1] != "back_from_character_select")
		&& (player_menu[1] != "manage_character")
		&& (player_menu[1] != "online_character_list")
		&& (player_menu[1] != "search_character_id")
		
		|| (player1_accept_selection == -1)
		&& (player2_accept_selection)
		&& (player3_accept_selection != 0)
		&& (player4_accept_selection != 0)
		&& (player2_key_a_pressed)
		&& (player_menu[2] != "back_from_character_select")
		
		|| (player1_accept_selection == -1)
		&& (player2_accept_selection == -1)
		&& (player3_accept_selection)
		&& (player4_accept_selection != 0)
		&& (player3_key_a_pressed)
		&& (player_menu[3] != "back_from_character_select")
		
		|| (player1_accept_selection == -1)
		&& (player2_accept_selection == -1)
		&& (player3_accept_selection == -1)
		&& (player4_accept_selection)
		&& (player4_key_a_pressed)
		&& (player_menu[3] != "back_from_character_select")
		
		|| (player_start_game)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32))
		&& (mouse_check_button_released(mb_left))
		{
			if (can_input_player1_name == false)
			&& (can_input_player2_name == false)
			&& (can_input_player3_name == false)
			&& (can_input_player4_name == false)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
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
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				if (global.character_select_in_this_menu == "main_game")
				{
					can_navigate = false;
					menu_delay = 9999;
				}
				else
				{
					global.select_level_index = 0;
					scr_load_custom_level_initializing();
					can_input_player1_name = 2;
					can_input_player2_name = 2;
					can_input_player3_name = 2;
					can_input_player4_name = 2;
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
		#endregion /* Start Game (run this code further up so that it takes priority) END */
		
		#region /* This is running step functions of character portrait for player */
		if (global.playergame >= 0)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(1);
		}
		if (global.playergame >= 1)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(2);
		}
		if (global.playergame >= 2)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(3);
		}
		if (global.playergame >= 3)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_step(4);
		}
		#endregion /* This is running step functions of character portrait for player END */
		
		image_alpha = 0;
		xx[1] = lerp(xx[1], player_display_x[1], 0.1);
		xx[2] = lerp(xx[2], player_display_x[2], 0.1);
		xx[3] = lerp(xx[3], player_display_x[3], 0.1);
		xx[4] = lerp(xx[4], player_display_x[4], 0.1);
		
		#region /* All code before menu navigation code */
		
		#region /* Player positions and scale for each character display */
		player_display_x[1] = -465;
		player_display_x[2] = -155;
		player_display_x[3] = +155;
		player_display_x[4] = +465;
		player1_scale = 0.85;
		player2_scale = 0.85;
		player3_scale = 0.85;
		player4_scale = 0.85;
		#endregion /* Player positions and scale for each character display END */
		
		#region /* Name Input */
		
		var name_y = 292;
		
		#region /* Press enter when done typing */
		if (can_input_player1_name)
		|| (can_input_player2_name)
		|| (can_input_player3_name)
		|| (can_input_player4_name)
		{
			if (keyboard_check_pressed(vk_enter))
			|| (keyboard_check_pressed(vk_escape))
			
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][1][1][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][1][1][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][1][1][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][1][2][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][1][2][action.back]))
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][1][2][action.back]))
			|| (global.clicking_ok_input_screen)
			|| (global.clicking_cancel_input_screen)
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					can_input_player1_name = 2;
					can_input_player2_name = 2;
					can_input_player3_name = 2;
					can_input_player4_name = 2;
					global.clicking_ok_input_screen = false;
					global.clicking_cancel_input_screen = false;
				}
			}
		}
		#endregion /* Press enter when done typing END */
		
		#endregion /* Name Input END */
		
		#endregion /* All code before menu navigation code END */
		
		#region /* Menu Navigation */
		if (can_input_player1_name == false)
		&& (can_input_player2_name == false)
		&& (can_input_player3_name == false)
		&& (can_input_player4_name == false)
		{
			
			scr_character_select_player_navigation(1);
			scr_character_select_player_navigation(2);
			scr_character_select_player_navigation(3);
			scr_character_select_player_navigation(4);
			
			#region /* The buttons in the top left corner of character select screen */
			
			#region /* Key Up */
			if (keyboard_check_pressed(global.player_[inp.key][1][1][action.up]))
			|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.up]))
			|| (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
			|| (gamepad_axis_value(global.player_slot[1], gp_axislv) < -0.3)
			&& (menu_specific_joystick_delay[1] <= 0)
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (global.enable_manage_characters)
					&& (menu == "manage_character") /* Manage Character */
					{
						menu_delay = 3;
						can_navigate = true;
						player_menu[1] = "back_from_character_select";
						menu = "back_from_character_select";
					}
					else
					if (menu == "online_character_list") /* Online Character List */
					{
						if (global.enable_manage_characters)
						{
							player_menu[1] = "manage_character";
							menu = "manage_character";
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
						player_menu[1] = "online_character_list";
						menu = "online_character_list";
					}
				}
			}
			#endregion /* Key Up END */
			
			else
			
			#region /* Key Down */
			if (keyboard_check_pressed(global.player_[inp.key][1][1][action.down]))
			|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.down]))
			|| (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
			|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > +0.3)
			&& (menu_specific_joystick_delay[1] <= 0)
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (menu == "back_from_character_select")
					{
						menu_delay = 3;
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
					if (global.enable_manage_characters)
					&& (menu == "manage_character") /* Manage Characters */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.free_communication_available)
						{
							player_menu[1] = "online_character_list";
							menu = "online_character_list";
						}
						else
						{
							player_menu[1] = "select_character";
							menu = "select_character";
						}
					}
					else
					if (menu == "online_character_list") /* Online Character List */
					{
						menu_delay = 3;
						can_navigate = true;
						if (global.free_communication_available)
						{
							player_menu[1] = "search_character_id";
							menu = "search_character_id";
						}
						else
						{
							player_menu[1] = "select_character";
							menu = "select_character";
						}
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
		if (player_start_game) /* Make sure that the "start game" button isn't overlapping the "name input" buttons */
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32))
		&& (global.controls_used_for_menu_navigation == "mouse")
		|| (player_start_game == false)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[1] - 150, get_window_height * 0.5 + name_y - 16, get_window_width * 0.5 + player_display_x[1] + 150, get_window_height * 0.5 + name_y + 16))
			&& (mouse_check_button_released(mb_left))
			&& (player1_accept_selection >= 0)
			&& (can_input_player1_name == false)
			|| (player_menu[1] == "select_name")
			&& (player1_key_a_pressed)
			&& (player1_accept_selection >= 0)
			&& (can_input_player1_name == false)
			{
				menu_delay = 3;
				keyboard_string = global.player_name[1];
				can_input_player1_name = true;
				can_input_player2_name = 2;
				can_input_player3_name = 2;
				can_input_player4_name = 2;
				menu = "input_name_ok";
			}
			else
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[2] - 150, get_window_height * 0.5 + name_y - 16, get_window_width * 0.5 + player_display_x[2] + 150, get_window_height * 0.5 + name_y + 16))
			&& (mouse_check_button_released(mb_left))
			&& (player2_accept_selection >= 0)
			&& (can_input_player2_name == false)
			|| (player_menu[2] == "select_name")
			&& (player2_key_a_pressed)
			&& (player2_accept_selection >= 0)
			&& (can_input_player2_name == false)
			{
				menu_delay = 3;
				keyboard_string = global.player_name[2];
				can_input_player1_name = 2;
				can_input_player2_name = true;
				can_input_player3_name = 2;
				can_input_player4_name = 2;
				menu = "input_name_ok";
			}
			else
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[3] - 150, get_window_height * 0.5 + name_y - 16, get_window_width * 0.5 + player_display_x[3] + 150, get_window_height * 0.5 + name_y + 16))
			&& (mouse_check_button_released(mb_left))
			&& (player3_accept_selection >= 0)
			&& (can_input_player3_name == false)
			|| (player_menu[3] == "select_name")
			&& (player3_key_a_pressed)
			&& (player3_accept_selection >= 0)
			&& (can_input_player3_name == false)
			{
				menu_delay = 3;
				keyboard_string = global.player_name[3];
				can_input_player1_name = 2;
				can_input_player2_name = 2;
				can_input_player3_name = true;
				can_input_player4_name = 2;
				menu = "input_name_ok";
			}
			else
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[4] - 150, get_window_height * 0.5 + name_y - 16, get_window_width * 0.5 + player_display_x[4] + 150, get_window_height * 0.5 + name_y + 16))
			&& (mouse_check_button_released(mb_left))
			&& (player4_accept_selection >= 0)
			&& (can_input_player4_name == false)
			|| (player_menu[4] == "select_name")
			&& (player4_key_a_pressed)
			&& (player4_accept_selection >= 0)
			&& (can_input_player4_name == false)
			{
				menu_delay = 3;
				keyboard_string = global.player_name[4];
				can_input_player1_name = 2;
				can_input_player2_name = 2;
				can_input_player3_name = 2;
				can_input_player4_name = true;
				menu = "input_name_ok";
			}
		}
		#endregion /* Click on name to input name END */
		
		#region /* Accept and Back */
		if (can_input_player1_name == false)
		&& (can_input_player2_name == false)
		&& (can_input_player3_name == false)
		&& (can_input_player4_name == false)
		{
			
			#region /* Accept */
			
			#region /* Select the character */
			if (player1_key_a_pressed)
			&& (player_menu[1] == "select_character")
			|| (player1_key_a_pressed)
			&& (player_menu[1] == "select_skin")
			|| (player1_key_a_pressed)
			&& (player_menu[1] == "select_voicepack")
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[1] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[1] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player1_accept_selection == false)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					player_menu[1] = "select_character";
					menu = "select_character";
					menu_delay = 3;
					player1_accept_selection = true;
					player1_automatically_join = false;
					global.player_can_play[1] = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
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
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/name.ogg");
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
			&& (player_menu[2] == "select_character")
			|| (player2_key_a_pressed)
			&& (player_menu[2] == "select_skin")
			|| (player2_key_a_pressed)
			&& (player_menu[2] == "select_voicepack")
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[2] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[2] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player2_accept_selection == false)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					player_menu[2] = "select_character";
					menu = "select_character";
					menu_delay = 3;
					player2_accept_selection = true;
					player2_automatically_join = false;
					global.player_can_play[2] = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
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
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player[2]) + "/name.ogg");
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
			&& (player_menu[3] == "select_character")
			|| (player3_key_a_pressed)
			&& (player_menu[3] == "select_skin")
			|| (player3_key_a_pressed)
			&& (player_menu[3] == "select_voicepack")
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[3] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[3] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player3_accept_selection == false)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					player_menu[3] = "select_character";
					menu = "select_character";
					menu_delay = 3;
					player3_accept_selection = true;
					player3_automatically_join = false;
					global.player_can_play[3] = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
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
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player[3]) + "/name.ogg");
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
			&& (player_menu[4] == "select_character")
			|| (player4_key_a_pressed)
			&& (player_menu[4] == "select_skin")
			|| (player4_key_a_pressed)
			&& (player_menu[4] == "select_voicepack")
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[4] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[4] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player4_accept_selection == false)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					player_menu[4] = "select_character";
					menu = "select_character";
					menu_delay = 3;
					player4_accept_selection = true;
					player4_automatically_join = false;
					global.player_can_play[4] = true;
					
					#region /* When selecting character, make the character say their own name */
					audio_stop_sound(voice_select_character);
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg");
					}
					else
					if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
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
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_3.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_2.ogg"))
					&& (floor(random(3 - 1)) == 0)
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_2.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_1.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name_1.ogg");
					}
					else
					if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name.ogg"))
					{
						voice_select_character = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player[4]) + "/name.ogg");
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
			
			#region /* If all players have selected a character, be able to start game */
			if (player1_accept_selection)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection)
			&& (player4_accept_selection != 0)
			{
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection)
			{
				player_start_game = true;
			}
			else
			{
				player_start_game = false;
			}
			#endregion /* If all players have selected a character, be able to start game END */
			
			#endregion /* Accept END */
			
			#region /* Back / Cancel Selection */
			
			#region /* Player 1 Back / Cancel Selection */
			if (player1_key_b_pressed)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[1] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[1] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player1_accept_selection)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					player1_accept_selection = false;
					global.player_can_play[1] = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 1 Back / Cancel Selection END */
			
			#region /* Player 2 Back / Cancel Selection */
			if (player2_key_b_pressed)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[2] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[2] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player2_accept_selection)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					player2_accept_selection = false;
					global.player_can_play[2] = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 2 Back / Cancel Selection END */
			
			#region /* Player 3 Back / Cancel Selection */
			if (player3_key_b_pressed)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[3] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[3] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player3_accept_selection)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					player3_accept_selection = false;
					global.player_can_play[3] = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 3 Back / Cancel Selection END */
			
			#region /* Player 4 Back / Cancel Selection */
			if (player4_key_b_pressed)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[4] - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x[4] + 100, get_window_height * 0.5 + 150 + 20))
			&& (mouse_check_button_released(mb_left))
			{
				if (player4_accept_selection)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					player4_accept_selection = false;
					global.player_can_play[4] = false;
					can_navigate = true;
				}
			}
			#endregion /* Player 4 Back / Cancel Selection END */
			
			#region /* If player 1 has selected a character, be able to start game */
			if (player1_accept_selection)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player[2] = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player[3] = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player[4] = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player[2] = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player[3] = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player[4] = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection)
			&& (player4_accept_selection != 0)
			{
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				global.character_for_player[2] = ds_list_find_value(global.all_loaded_characters, global.character_index[1]);
				global.character_for_player[3] = ds_list_find_value(global.all_loaded_characters, global.character_index[2]);
				global.character_for_player[4] = ds_list_find_value(global.all_loaded_characters, global.character_index[3]);
				player_start_game = true;
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection)
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
			&& (player1_accept_selection <= -1)
			|| (player1_key_a_pressed)
			&& (menu == "back_from_character_select")
			|| (player1_key_a_pressed)
			&& (player_menu[1] == "back_from_character_select")
			|| (player1_key_a_pressed)
			&& (player_menu[2] == "back_from_character_select")
			|| (player1_key_a_pressed)
			&& (player_menu[3] == "back_from_character_select")
			|| (player1_key_a_pressed)
			&& (player_menu[4] == "back_from_character_select")
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 6;
					image_alpha = 1;
					player_start_game = false;
					can_input_player1_name = 2;
					can_input_player2_name = 2;
					can_input_player3_name = 2;
					can_input_player4_name = 2;
					player1_accept_selection = -1;
					player2_accept_selection = -1;
					player3_accept_selection = -1;
					player4_accept_selection = -1;
					global.player_can_play[1] = false;
					global.player_can_play[2] = false;
					global.player_can_play[3] = false;
					global.player_can_play[4] = false;
					player_menu[1] = "select_character";
					player_menu[2] = "select_character";
					player_menu[3] = "select_character";
					player_menu[4] = "select_character";
					xx[1] = player_display_x[1];
					xx[2] = player_display_x[2];
					xx[3] = player_display_x[3];
					xx[4] = player_display_x[4];
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
		
		menu_delay = clamp(menu_delay - 1, 0, +infinity);
		
		#region /* Menu navigation with joystick */
		if (gamepad_axis_value(global.player_slot[1], gp_axislv) < -0.3)
		|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > +0.3)
		|| (gamepad_axis_value(global.player_slot[1], gp_axislh) < -0.3)
		|| (gamepad_axis_value(global.player_slot[1], gp_axislh) > +0.3)
		{
			if (menu_specific_joystick_delay[1] == 0)
			{
				menu_specific_joystick_delay[1] = 30;
			}
		}
		if (gamepad_axis_value(global.player_slot[2], gp_axislv) < -0.3)
		|| (gamepad_axis_value(global.player_slot[2], gp_axislv) > +0.3)
		|| (gamepad_axis_value(global.player_slot[2], gp_axislh) < -0.3)
		|| (gamepad_axis_value(global.player_slot[2], gp_axislh) > +0.3)
		{
			if (menu_specific_joystick_delay[2] == 0)
			{
				menu_specific_joystick_delay[2] = 30;
			}
		}
		if (gamepad_axis_value(global.player_slot[3], gp_axislv) < -0.3)
		|| (gamepad_axis_value(global.player_slot[3], gp_axislv) > +0.3)
		|| (gamepad_axis_value(global.player_slot[3], gp_axislh) < -0.3)
		|| (gamepad_axis_value(global.player_slot[3], gp_axislh) > +0.3)
		{
			if (menu_specific_joystick_delay[3] == 0)
			{
				menu_specific_joystick_delay[3] = 30;
			}
		}
		if (gamepad_axis_value(global.player_slot[4], gp_axislv) < -0.3)
		|| (gamepad_axis_value(global.player_slot[4], gp_axislv) > +0.3)
		|| (gamepad_axis_value(global.player_slot[4], gp_axislh) < -0.3)
		|| (gamepad_axis_value(global.player_slot[4], gp_axislh) > +0.3)
		{
			if (menu_specific_joystick_delay[4] == 0)
			{
				menu_specific_joystick_delay[4] = 30;
			}
		}
		if (gamepad_axis_value(global.player_slot[1], gp_axislv) == 0)
		&& (gamepad_axis_value(global.player_slot[1], gp_axislh)= 0)
		{
			menu_specific_joystick_delay[1] = 0;
		}
		if (gamepad_axis_value(global.player_slot[2], gp_axislv) == 0)
		&& (gamepad_axis_value(global.player_slot[2], gp_axislh)= 0)
		{
			menu_specific_joystick_delay[2] = 0;
		}
		if (gamepad_axis_value(global.player_slot[3], gp_axislv) == 0)
		&& (gamepad_axis_value(global.player_slot[3], gp_axislh)= 0)
		{
			menu_specific_joystick_delay[3] = 0;
		}
		if (gamepad_axis_value(global.player_slot[4], gp_axislv) == 0)
		&& (gamepad_axis_value(global.player_slot[4], gp_axislh)= 0)
		{
			menu_specific_joystick_delay[4] = 0;
		}
		var joystick_delays = [
		    menu_specific_joystick_delay[1],
		    menu_specific_joystick_delay[2],
		    menu_specific_joystick_delay[3],
		    menu_specific_joystick_delay[4]
		];
		
		for (var i = 0; i < 4; i++) {
		    if (joystick_delays[i] > 0) {
		        joystick_delays[i] --;
		    }
		}
		
		menu_specific_joystick_delay[1] = joystick_delays[0];
		menu_specific_joystick_delay[2] = joystick_delays[1];
		menu_specific_joystick_delay[3] = joystick_delays[2];
		menu_specific_joystick_delay[4] = joystick_delays[3];
		#endregion /* Menu navigation with joystick END */
		
		#region /* If players haven't joined the game */
		if (can_input_player1_name == false)
		&& (can_input_player2_name == false)
		&& (can_input_player3_name == false)
		&& (can_input_player4_name == false)
		{
			
			#region /* Player 1 Join Text */
			if (player1_accept_selection <= -1)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[1] - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player_display_x[1] + 150, get_window_height * 0.5 + 32))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[1] = "select_character";
					menu = "select_character";
				}
				if (player1_key_a_pressed)
				|| (player1_automatically_join)
				|| (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[1] - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player_display_x[1] + 150, get_window_height * 0.5 + 32))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					&& (menu != "back_from_character_select")
					&& (player_menu[1] != "back_from_character_select")
					&& (menu != "manage_character")
					&& (player_menu[1] != "manage_character")
					&& (menu != "online_character_list")
					&& (player_menu[1] != "online_character_list")
					&& (menu != "search_character_id")
					&& (player_menu[1] != "search_character_id")
					{
						character_portrait_for_player_update_directory[1] = true;
						alarm[0] = 1;
						player1_automatically_join = false;
						menu = "select_character";
						player_menu[1] = "select_character";
						menu_delay = 3;
						player1_accept_selection = 0;
						global.character_index[0] = clamp(global.character_index[0], 0, ds_list_size(global.all_loaded_characters) - 1);
					}
				}
			}
			#endregion /* Player 1 Join Text END */
			
			#region /* Player 2 Join Text */
			if (player2_accept_selection <= -1)
			&& (global.playergame >= 1)
			|| (player2_accept_selection <= -1)
			&& (global.skip_how_many_people_are_playing_screen)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[2] - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player_display_x[2] + 150, get_window_height * 0.5 + 32 + 32))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[2] = "select_character";
					menu = "select_character";
				}
				if (player2_key_a_pressed)
				|| (player2_automatically_join)
				|| (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[2] - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player_display_x[2] + 150, get_window_height * 0.5 + 32 + 32))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						character_portrait_for_player_update_directory[2] = true;
						alarm[0] = 1;
						player2_automatically_join = false;
						menu_delay = 3;
						player2_accept_selection = 0;
						global.character_index[1] = clamp(global.character_index[1], 0, ds_list_size(global.all_loaded_characters) - 1);
					}
				}
			}
			#endregion /* Player 2 Join Text END */
			
			#region /* Player 3 Join Text */
			if (player3_accept_selection <= -1)
			&& (global.playergame >= 2)
			|| (player3_accept_selection <= -1)
			&& (global.skip_how_many_people_are_playing_screen)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[3] - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player_display_x[3] + 150, get_window_height * 0.5 + 32))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[3] = "select_character";
					menu = "select_character";
				}
				if (player3_key_a_pressed)
				|| (player3_automatically_join)
				|| (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[3] - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player_display_x[3] + 150, get_window_height * 0.5 + 32))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						character_portrait_for_player_update_directory[3] = true;
						alarm[0] = 1;
						player3_automatically_join = false;
						menu_delay = 3;
						player3_accept_selection = 0;
						global.character_index[2] = clamp(global.character_index[2], 0, ds_list_size(global.all_loaded_characters) - 1);
					}
				}
			}
			#endregion /* Player 3 Join Text END */
			
			#region /* Player 4 Join Text */
			if (player4_accept_selection <= -1)
			&& (global.playergame >= 3)
			|| (player4_accept_selection <= -1)
			&& (global.skip_how_many_people_are_playing_screen)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[4] - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player_display_x[4] + 150, get_window_height * 0.5 + 32 + 32))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					player_menu[4] = "select_character";
					menu = "select_character";
				}
				if (player4_key_a_pressed)
				|| (player4_automatically_join)
				|| (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[4] - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player_display_x[4] + 150, get_window_height * 0.5 + 32 + 32))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						character_portrait_for_player_update_directory[4] = true;
						alarm[0] = 1;
						player4_automatically_join = false;
						menu_delay = 3;
						player4_accept_selection = 0;
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