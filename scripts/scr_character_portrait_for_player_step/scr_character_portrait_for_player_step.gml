function scr_character_portrait_for_player_step(what_player = 1)
{
	var skin_y = 192;
	var voicepack_y = 234;
	var name_y = 292;
	if (keyboard_virtual_status())
	and (keyboard_virtual_height() != 0)
	{
		var name_input_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var name_input_y = display_get_gui_height() * 0.5 + name_y;
	}
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Make character portraits smaller if screen size is too small to fit them */
	if (get_window_width >= 1670)
	{
		var scale_offset = 1;
	}
	else
	if (get_window_width >= 1276)
	{
		var scale_offset = 0.9;
	}
	else
	if (get_window_width >= 882)
	{
		var scale_offset = 0.8;
	}
	else
	if (get_window_width >= 488)
	{
		var scale_offset = 0.7;
	}
	else
	{
		var scale_offset = 0.6;
	}
	#endregion /* Make character portraits smaller if screen size is too small to fit them END */
	
	#region /* Set correct variables for players */
	
	#region /* If player is player 1, set all the variables to Player variables */
	if (what_player == 1)
	{
		var player_gamepad_slot = global.player1_slot;
		var sprite_select_player = global.sprite_select_player_1;
		var player_accept_selection = player1_accept_selection;
		var player_xx = xx1;
		var hex_color_for_player = global.hex_color_for_player_1;
		var player_display_x = player1_display_x;
		var skin_for_player = global.skin_for_player_1;
		var voicepack_for_player = global.voicepack_for_player_1;
		var player_menu = player1_menu;
		var player_key_left = global.player_[inp.key][1][1][action.left];
		var player_key_right = global.player_[inp.key][1][1][action.right];
		var player_key2_left = global.player_[inp.key][1][2][action.left];
		var player_key2_right = global.player_[inp.key][1][2][action.right];
		var player_key_up = global.player_[inp.key][1][1][action.up];
		var player_key_down = global.player_[inp.key][1][1][action.down];
		var player_key2_up = global.player_[inp.key][1][2][action.up];
		var player_key2_down = global.player_[inp.key][1][2][action.down];
		var player_key_back = global.player_[inp.key][1][1][action.back];
		var player_key2_back = global.player_[inp.key][1][2][action.back];
		var player_key_accept = global.player_[inp.key][1][1][action.accept];
		var player_key2_accept = global.player_[inp.key][1][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][1][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][1][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][1][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][1][2][action.accept];
		var menu_joystick_delay = menu_joystick1_delay;
		var can_input_player_name = can_input_player1_name;
		var player_name = global.player1_name;
		var player_color = global.player1_color;
	}
	#endregion /* If player is player 1, set all the variables to Player variables END */
	
	else
	
	#region /* If player is player 2, set all the variables to player 2 variables */
	if (what_player == 2)
	{
		var player_gamepad_slot = global.player2_slot;
		var sprite_select_player = global.sprite_select_player_2;
		var player_accept_selection = player2_accept_selection;
		var player_xx = xx2;
		var hex_color_for_player = global.hex_color_for_player_2;
		var player_display_x = player2_display_x;
		var skin_for_player = global.skin_for_player_2;
		var voicepack_for_player = global.voicepack_for_player_2;
		var player_menu = player2_menu;
		var player_key_left = global.player_[inp.key][2][1][action.left];
		var player_key_right = global.player_[inp.key][2][1][action.right];
		var player_key2_left = global.player_[inp.key][2][2][action.left];
		var player_key2_right = global.player_[inp.key][2][2][action.right];
		var player_key_up = global.player_[inp.key][2][1][action.up];
		var player_key_down = global.player_[inp.key][2][1][action.down];
		var player_key2_up = global.player_[inp.key][2][2][action.up];
		var player_key2_down = global.player_[inp.key][2][2][action.down];
		var player_key_back = global.player_[inp.key][2][1][action.back];
		var player_key2_back = global.player_[inp.key][2][2][action.back];
		var player_key_accept = global.player_[inp.key][2][1][action.accept];
		var player_key2_accept = global.player_[inp.key][2][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][2][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][2][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][2][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][2][2][action.accept];
		var menu_joystick_delay = menu_joystick2_delay;
		var can_input_player_name = can_input_player2_name;
		var player_name = global.player2_name;
		var player_color = global.player2_color;
	}
	#endregion /* If player is player 2, set all the variables to player 2 variables END */
	
	else
	
	#region /* If player is player 3, set all the variables to player 3 variables */
	if (what_player == 3)
	{
		var player_gamepad_slot = global.player3_slot;
		var sprite_select_player = global.sprite_select_player_3;
		var player_accept_selection = player3_accept_selection;
		var player_xx = xx3;
		var hex_color_for_player = global.hex_color_for_player_3;
		var player_display_x = player3_display_x;
		var skin_for_player = global.skin_for_player_3;
		var voicepack_for_player = global.voicepack_for_player_3;
		var player_menu = player3_menu;
		var player_key_left = global.player_[inp.key][3][1][action.left];
		var player_key_right = global.player_[inp.key][3][1][action.right];
		var player_key2_left = global.player_[inp.key][3][2][action.left];
		var player_key2_right = global.player_[inp.key][3][2][action.right];
		var player_key_up = global.player_[inp.key][3][1][action.up];
		var player_key_down = global.player_[inp.key][3][1][action.down];
		var player_key2_up = global.player_[inp.key][3][2][action.up];
		var player_key2_down = global.player_[inp.key][3][2][action.down];
		var player_key_back = global.player_[inp.key][3][1][action.back];
		var player_key2_back = global.player_[inp.key][3][2][action.back];
		var player_key_accept = global.player_[inp.key][3][1][action.accept];
		var player_key2_accept = global.player_[inp.key][3][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][3][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][3][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][3][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][3][2][action.accept];
		var menu_joystick_delay = menu_joystick3_delay;
		var can_input_player_name = can_input_player3_name;
		var player_name = global.player3_name;
		var player_color = global.player3_color;
	}
	#endregion /* If player is player 3, set all the variables to player 3 variables END */
	
	else
	
	#region /* If player is player 4, set all the variables to player 4 variables */
	if (what_player == 4)
	{
		var player_gamepad_slot = global.player4_slot;
		var sprite_select_player = global.sprite_select_player_4;
		var player_accept_selection = player4_accept_selection;
		var player_xx = xx4;
		var hex_color_for_player = global.hex_color_for_player_4;
		var player_display_x = player4_display_x;
		var skin_for_player = global.skin_for_player_4;
		var voicepack_for_player = global.voicepack_for_player_4;
		var player_menu = player4_menu;
		var player_key_left = global.player_[inp.key][4][1][action.left];
		var player_key_right = global.player_[inp.key][4][1][action.right];
		var player_key2_left = global.player_[inp.key][4][2][action.left];
		var player_key2_right = global.player_[inp.key][4][2][action.right];
		var player_key_up = global.player_[inp.key][4][1][action.up];
		var player_key_down = global.player_[inp.key][4][1][action.down];
		var player_key2_up = global.player_[inp.key][4][2][action.up];
		var player_key2_down = global.player_[inp.key][4][2][action.down];
		var player_key_back = global.player_[inp.key][4][1][action.back];
		var player_key2_back = global.player_[inp.key][4][2][action.back];
		var player_key_accept = global.player_[inp.key][4][1][action.accept];
		var player_key2_accept = global.player_[inp.key][4][2][action.accept];
		var player_gamepad_button_back = global.player_[inp.gp][4][1][action.back];
		var player_gamepad_button2_back = global.player_[inp.gp][4][2][action.back];
		var player_gamepad_button_accept = global.player_[inp.gp][4][1][action.accept];
		var player_gamepad_button2_accept = global.player_[inp.gp][4][2][action.accept];
		var menu_joystick_delay = menu_joystick4_delay;
		var can_input_player_name = can_input_player4_name;
		var player_name = global.player4_name;
		var player_color = global.player4_color;
	}
	#endregion /* If player is player 4, set all the variables to player 4 variables END */
	
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
	
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1) + "/mask.png"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1) + "/mask.png"))
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
	
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1)))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1)))
	or (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1) + "/jump.ogg"))
	or (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1) + "/jump.ogg"))
	{
		character_portrait_for_player_directory_exists_4[what_player] = true;
	}
	else
	{
		character_portrait_for_player_directory_exists_4[what_player] = false;
	}
	
	#endregion /* Set correct variables for players END */
	
	#region /* Display Selected Skin if skins are available */
	if (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		
		#region /* Player Select Skin */
		if (character_portrait_for_player_directory_exists_1[what_player])
		{
			if (player_menu == "select_skin")
			or (global.controls_used_for_menu_navigation == "mouse")
			{
				if (player_accept_selection == false)
				{
					
					#region /* Player key left Skin */
					if (keyboard_check_pressed(player_key_left))
					or (keyboard_check_pressed(player_key2_left))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padl))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislh) < 0)
					and (menu_joystick_delay == 29)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
					and (mouse_check_button_released(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						and (skin_for_player > 0)
						{
							menu_delay = 3;
							
							#region /* Player character select portrait sprite */
							if (what_player == 1)
							{
								global.skin_for_player_1 -= 1;
								global.actual_skin_for_player_1 = global.skin_for_player_1; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
								menu_joystick1_delay = 60;
								global.sprite_select_player_1 = spr_noone;
								global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
								global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
								global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
								global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
								xx1 = player_display_x - 32;
							}
							else
							if (what_player == 2)
							{
								global.skin_for_player_2 -= 1;
								global.actual_skin_for_player_2 = global.skin_for_player_2; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
								menu_joystick2_delay = 60;
								global.sprite_select_player_2 = spr_noone;
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
								xx2 = player_display_x - 32;
							}
							else
							if (what_player == 3)
							{
								global.skin_for_player_3 -= 1;
								global.actual_skin_for_player_3 = global.skin_for_player_3; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
								menu_joystick3_delay = 60;
								global.sprite_select_player_3 = spr_noone;
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
								xx3 = player_display_x - 32;
							}
							else
							if (what_player == 4)
							{
								global.skin_for_player_4 -= 1;
								global.actual_skin_for_player_4 = global.skin_for_player_4; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
								menu_joystick4_delay = 60;
								global.sprite_select_player_4 = spr_noone;
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 3, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 3, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 3, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 3, global.skin_for_player_4);
								xx4 = player_display_x - 32;
							}
							#endregion /* Player character select portrait sprite END */
							
						}
					}
					#endregion /* Player key left Skin END */
					
					#region /* Player key right Skin */
					if (keyboard_check_pressed(player_key_right))
					or (keyboard_check_pressed(player_key2_right))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padr))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislh) > 0)
					and (menu_joystick_delay == 29)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
					and (mouse_check_button_released(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						{
							if (character_portrait_for_player_directory_exists_2[what_player])
							{
								menu_delay = 3;
							
								#region /* Player character select portrait sprite */
								if (what_player == 1)
								{
									global.skin_for_player_1 += 1;
									global.actual_skin_for_player_1 = global.skin_for_player_1; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
									menu_joystick1_delay = 60;
									global.sprite_select_player_1 = spr_noone;
									global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
									global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
									global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
									global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
									xx1 = player_display_x + 32;
								}
								else
								if (what_player == 2)
								{
									global.skin_for_player_2 += 1;
									global.actual_skin_for_player_2 = global.skin_for_player_2; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
									menu_joystick2_delay = 60;
									global.sprite_select_player_2 = spr_noone;
									global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
									global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
									global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
									global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
									xx2 = player_display_x + 32;
								}
								else
								if (what_player == 3)
								{
									global.skin_for_player_3 += 1;
									global.actual_skin_for_player_3 = global.skin_for_player_3; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
									menu_joystick3_delay = 60;
									global.sprite_select_player_3 = spr_noone;
									global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
									global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
									global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
									global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
									xx3 = player_display_x + 32;
								}
								else
								if (what_player == 4)
								{
									global.skin_for_player_4 += 1;
									global.actual_skin_for_player_4 = global.skin_for_player_4; /* When changing skins, update "actual skin for player" to match "skin for player". Update "skin for player" first */
									menu_joystick4_delay = 60;
									global.sprite_select_player_4 = spr_noone;
									global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 3, global.skin_for_player_4);
									global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 3, global.skin_for_player_4);
									global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 3, global.skin_for_player_4);
									global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 3, global.skin_for_player_4);
									xx4 = player_display_x + 32;
								}
								#endregion /* Player character select portrait sprite END */
								
							}
						}
					}
					#endregion /* Player key right Skin END */
					
					#region /* Player key up Skin */
					if (keyboard_check_pressed(player_key_up))
					or (keyboard_check_pressed(player_key2_up))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padu))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislv) < 0)
					and (menu_joystick_delay == 29)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							if (what_player == 1)
							{
								menu_joystick1_delay = 60;
								player1_menu = "select_character";
							}
							else
							if (what_player == 2)
							{
								menu_joystick2_delay = 60;
								player2_menu = "select_character";
							}
							else
							if (what_player == 3)
							{
								menu_joystick3_delay = 60;
								player3_menu = "select_character";
							}
							else
							if (what_player == 4)
							{
								menu_joystick4_delay = 60;
								player4_menu = "select_character";
							}
						}
					}
					#endregion /* Player key up Skin END */
					
					#region /* Player key down Skin */
					if (keyboard_check_pressed(player_key_down))
					or (keyboard_check_pressed(player_key2_down))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padd))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislv) > 0)
					and (menu_joystick_delay == 29)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							if (character_portrait_for_player_directory_exists_3[what_player])
							{
								if (what_player == 1)
								{
									menu_joystick1_delay = 60;
									player1_menu = "select_voicepack";
								}
								else
								if (what_player == 2)
								{
									menu_joystick2_delay = 60;
									player2_menu = "select_voicepack";
								}
								else
								if (what_player == 3)
								{
									menu_joystick3_delay = 60;
									player3_menu = "select_voicepack";
								}
								else
								if (what_player == 4)
								{
									menu_joystick4_delay = 60;
									player4_menu = "select_voicepack";
								}
							}
							else
							{
								if (what_player == 1)
								{
									player1_menu = "select_name";
								}
								else
								if (what_player == 2)
								{
									player2_menu = "select_name";
								}
								else
								if (what_player == 3)
								{
									player3_menu = "select_name";
								}
								else
								if (what_player == 4)
								{
									player4_menu = "select_name";
								}
							}
						}
					}
					#endregion /* Player key down Skin END */
					
					#region /* Show left key for character skin select */
					if (skin_for_player > 0)
					{
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (what_player == 1)
							{
								player1_menu = "select_skin";
							}
							else
							if (what_player == 2)
							{
								player2_menu = "select_skin";
							}
							else
							if (what_player == 3)
							{
								player3_menu = "select_skin";
							}
							else
							if (what_player == 4)
							{
								player4_menu = "select_skin";
							}
						}
					}
					#endregion /* Show left key for character skin select END */
					
					#region /* Show right key for character skin select */
					if (character_portrait_for_player_directory_exists_2[what_player])
					{
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (what_player == 1)
							{
								player1_menu = "select_skin";
							}
							else
							if (what_player == 2)
							{
								player2_menu = "select_skin";
							}
							else
							if (what_player == 3)
							{
								player3_menu = "select_skin";
							}
							else
							if (what_player == 4)
							{
								player4_menu = "select_skin";
							}
						}
					}
					#endregion /* Show right key for character skin select END */
					
				}
			}
		}
		#endregion /* Player Select Skin END */
		
	}
	#endregion /* Display Selected Skin if skins are available END */
	
	#region /* Display Selected Voice Pack if voice packs are available */
	if (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		
		#region /* Player Select Voice Pack */
		if (character_portrait_for_player_directory_exists_3[what_player])
		{
			if (player_menu = "select_voicepack")
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (player_accept_selection == false)
				{
					
					#region /* Player key left Voice Pack */
					if (keyboard_check_pressed(player_key_left))
					or (keyboard_check_pressed(player_key2_left))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padl))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislh) < 0)
					and (menu_joystick_delay == 29)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
					and (mouse_check_button_released(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						and (voicepack_for_player > 0)
						{
							menu_delay = 3;
							if (what_player == 1)
							{
								global.voicepack_for_player_1 -= 1;
								menu_joystick1_delay = 60;
								xx1 = player_display_x - 32;
							}
							else
							if (what_player == 2)
							{
								global.voicepack_for_player_2 -= 1;
								menu_joystick2_delay = 60;
								xx2 = player_display_x - 32;
							}
							else
							if (what_player == 3)
							{
								global.voicepack_for_player_3 -= 1;
								menu_joystick3_delay = 60;
								xx3 = player_display_x - 32;
							}
							else
							if (what_player == 4)
							{
								global.voicepack_for_player_4 -= 1;
								menu_joystick4_delay = 60;
								xx4 = player_display_x - 32;
							}
						}
					}
					#endregion /* Player key left Voice Pack END */
					
					#region /* Player key right Voice Pack */
					if (keyboard_check_pressed(player_key_right))
					or (keyboard_check_pressed(player_key2_right))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padr))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislh) > 0)
					and (menu_joystick_delay == 29)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
					and (mouse_check_button_released(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						{
							if (character_portrait_for_player_directory_exists_4[what_player])
							{
								menu_delay = 3;
								if (what_player == 1)
								{
									global.voicepack_for_player_1 += 1;
									menu_joystick1_delay = 60;
									xx1 = player_display_x + 32;
								}
								else
								if (what_player == 2)
								{
									global.voicepack_for_player_2 += 1;
									menu_joystick2_delay = 60;
									xx2 = player_display_x + 32;
								}
								else
								if (what_player == 3)
								{
									global.voicepack_for_player_3 += 1;
									menu_joystick3_delay = 60;
									xx3 = player_display_x + 32;
								}
								else
								if (what_player == 4)
								{
									global.voicepack_for_player_4 += 1;
									menu_joystick4_delay = 60;
									xx4 = player_display_x + 32;
								}
							}
						}
					}
					#endregion /* Player key right Voice Pack END */
					
					#region /* Player key up Voice Pack */
					if (keyboard_check_pressed(player_key_up))
					or (keyboard_check_pressed(player_key2_up))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padu))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislv) < 0)
					and (menu_joystick_delay == 29)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							if (character_portrait_for_player_directory_exists_1[what_player])
							{
								
								#region /* Go from selecting voicepack to selecting skin */
								if (what_player == 1)
								{
									menu_joystick1_delay = 60;
									player1_menu = "select_skin";
								}
								else
								if (what_player == 2)
								{
									menu_joystick2_delay = 60;
									player2_menu = "select_skin";
								}
								else
								if (what_player == 3)
								{
									menu_joystick3_delay = 60;
									player3_menu = "select_skin";
								}
								else
								if (what_player == 4)
								{
									menu_joystick4_delay = 60;
									player4_menu = "select_skin";
								}
								#endregion /* Go from selecting voicepack to selecting skin END */
								
							}
							else
							{
								
								#region /* Go from selecting voicepack to selecting character */
								if (what_player == 1)
								{
									menu_joystick1_delay = 60;
									player1_menu = "select_character";
								}
								else
								if (what_player == 2)
								{
									menu_joystick2_delay = 60;
									player2_menu = "select_character";
								}
								else
								if (what_player == 3)
								{
									menu_joystick3_delay = 60;
									player3_menu = "select_character";
								}
								else
								if (what_player == 4)
								{
									menu_joystick4_delay = 60;
									player4_menu = "select_character";
								}
								#endregion /* Go from selecting voicepack to selecting character END */
								
							}
						}
					}
					#endregion /* Player key up Voice Pack END */
					
					#region /* Player key down Voice Pack */
					if (keyboard_check_pressed(player_key_down))
					or (keyboard_check_pressed(player_key2_down))
					or (gamepad_button_check_pressed(player_gamepad_slot, gp_padd))
					or (gamepad_axis_value(player_gamepad_slot, gp_axislv) > 0)
					and (menu_joystick_delay == 29)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							if (what_player == 1)
							{
								menu_joystick1_delay = 60;
								player1_menu = "select_name";
							}
							else
							if (what_player == 2)
							{
								menu_joystick2_delay = 60;
								player2_menu = "select_name";
							}
							else
							if (what_player == 3)
							{
								menu_joystick3_delay = 60;
								player3_menu = "select_name";
							}
							else
							if (what_player == 4)
							{
								menu_joystick4_delay = 60;
								player4_menu = "select_name";
							}
						}
					}
					#endregion /* Player key down Voice Pack END */
					
					#region /* Show left key for character voicepack select */
					if (voicepack_for_player > 0)
					{
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player_menu = "select_voicepack";
						}
					}
					#endregion /* Show left key for character voicepack select END */
					
					#region /* Show right key for character voicepack select */
					if (character_portrait_for_player_directory_exists_4[what_player])
					{
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player_menu = "select_voicepack";
						}
					}
					#endregion /* Show right key for character voicepack select END */
					
				}
			}
		}
		#endregion /* Player Select Voice Pack END */
	
	}
	#endregion /* Display Selected Voice Pack if voice packs are available END */
	
	#region /* Show left and right arrows when selecting character */
	if (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		if (player1_accept_selection == false)
		{
			if (gamepad_button_check_pressed(global.player1_slot, player_gamepad_button_back))
			and (menu_delay == 0)
			or (keyboard_check_pressed(ord("X")))
			and (menu_delay == 0)
			or (mouse_check_button_released(mb_right))
			and (menu_delay == 0)
			or (mouse_check_button_released(mb_side1))
			and (menu_delay == 0)
			or (keyboard_check_pressed(vk_escape))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][1][1][action.back]))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][1][2][action.back]))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				player1_accept_selection = -1;
			}
		}
		if (player2_accept_selection == false)
		{
			if (gamepad_button_check_pressed(1, player_gamepad_button_back))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][2][1][action.back]))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][2][2][action.back]))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				player2_accept_selection = -1;
			}
		}
		if (player3_accept_selection == false)
		{
			if (gamepad_button_check_pressed(2, player_gamepad_button_back))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][3][1][action.back]))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][3][2][action.back]))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				player3_accept_selection = -1;
			}
		}
		if (player4_accept_selection == false)
		{
			if (gamepad_button_check_pressed(3, player_gamepad_button_back))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][4][1][action.back]))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player_[inp.key][4][2][action.back]))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				player4_accept_selection = -1;
			}
		}
		
		#region /* Player Show left and right arrows when selecting character */
		if (player_menu = "select_character")
		or (global.controls_used_for_menu_navigation = "mouse")
		{
			if (player_accept_selection == false)
			{
					
				#region /* Key Left */
				if (global.character_index[what_player - 1] > 0)
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + 16))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (what_player == 1)
						{
							player1_menu = "select_character";
						}
						else
						if (what_player == 2)
						{
							player2_menu = "select_character";
						}
						else
						if (what_player == 3)
						{
							player3_menu = "select_character";
						}
						else
						if (what_player == 4)
						{
							player4_menu = "select_character";
						}
						
					}
				}
				#endregion /* Key Left END */
			
				#region /* Key Right */
				if (global.character_index[what_player - 1] < ds_list_size(global.all_loaded_characters) - 1)
				{
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + 16))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (what_player == 1)
						{
							player1_menu = "select_character";
						}
						else
						if (what_player == 2)
						{
							player2_menu = "select_character";
						}
						else
						if (what_player == 3)
						{
							player3_menu = "select_character";
						}
						else
						if (what_player == 4)
						{
							player4_menu = "select_character";
						}
					}
				}
				#endregion /* Key Right END */
				
			}
		}
		#endregion /* Player Show left and right arrows when selecting character END */
		
	}
	#endregion /* Show left and right arrows when selecting character END */
	
	#region /* Tell the player the inputed name */
	
	if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - 150, name_input_y - 16, get_window_width * 0.5 + player_display_x + 150, name_input_y + 16))
	and (global.controls_used_for_menu_navigation == "mouse")
	and (player_accept_selection >= 0)
	and (menu_delay == 0)
	{
		if (what_player == 1)
		{
			player1_menu = "select_name";
		}
		else
		if (what_player == 2)
		{
			player2_menu = "select_name";
		}
		else
		if (what_player == 3)
		{
			player3_menu = "select_name";
		}
		else
		if (what_player == 4)
		{
			player4_menu = "select_name";
		}
	}
	#endregion /* Tell the player the inputed name END */
	
	#region /* Tell the players what buttons to push */
	
	#region /* Tell the player what button to push to select or cancel a selection */
	if (player_menu != "select_name")
	and (player_menu != "back_from_character_select")
	and (player_menu != "open_custom_characters_folder")
	and (player_menu != "manage_character")
	and (player_menu != "search_character_id")
	and (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	or (global.controls_used_for_menu_navigation = "mouse")
	and (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		if (player_accept_selection == false)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				if (what_player == 1)
				{
					player1_menu = "select_character";
				}
				else
				if (what_player == 2)
				{
					player2_menu = "select_character";
				}
				else
				if (what_player == 3)
				{
					player3_menu = "select_character";
				}
				else
				if (what_player == 4)
				{
					player4_menu = "select_character";
				}
			}
		}
		else
		if (player_accept_selection)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				if (what_player == 1)
				{
					player1_menu = "select_character";
				}
				else
				if (what_player == 2)
				{
					player2_menu = "select_character";
				}
				else
				if (what_player == 3)
				{
					player3_menu = "select_character";
				}
				else
				if (what_player == 4)
				{
					player4_menu = "select_character";
				}
			
			}
		}
	}
	#endregion /* Tell the player what button to push to select or cancel a selection END */
	
	#endregion /* Tell the players what buttons to push END */
	
}