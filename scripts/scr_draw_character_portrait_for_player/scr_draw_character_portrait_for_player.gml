function scr_draw_character_portrait_for_player(what_player = 1)
{
	var skin_y = 192;
	var voicepack_y = 234;
	var name_y = 292;
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
		var sprite_select_player = global.sprite_select_player_1;
		var player_accept_selection = player1_accept_selection;
		var player_xx = xx1;
		var hex_color_for_player = global.hex_color_for_player_1;
		var player_display_x = player1_display_x;
		var skin_for_player = global.skin_for_player_1;
		var voicepack_for_player = global.voicepack_for_player_1;
		var player_menu = player1_menu;
		var player_key_left = global.player1_key_left;
		var player_key_right = global.player1_key_right;
		var player_key2_left = global.player1_key2_left;
		var player_key2_right = global.player1_key2_right;
		var player_key_up = global.player1_key_up;
		var player_key_down = global.player1_key_down;
		var player_key2_up = global.player1_key2_up;
		var player_key2_down = global.player1_key2_down;
		var player_key_dive = global.player1_key_dive;
		var player_key2_dive = global.player1_key2_dive;
		var player_key_sprint = global.player1_key_sprint;
		var player_key2_sprint = global.player1_key2_sprint;
		var player_key_jump = global.player1_key_jump;
		var player_key2_jump = global.player1_key2_jump;
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
		var sprite_select_player = global.sprite_select_player_2;
		var player_accept_selection = player2_accept_selection;
		var player_xx = xx2;
		var hex_color_for_player = global.hex_color_for_player_2;
		var player_display_x = player2_display_x;
		var skin_for_player = global.skin_for_player_2;
		var voicepack_for_player = global.voicepack_for_player_2;
		var player_menu = player2_menu;
		var player_key_left = global.player2_key_left;
		var player_key_right = global.player2_key_right;
		var player_key2_left = global.player2_key2_left;
		var player_key2_right = global.player2_key2_right;
		var player_key_up = global.player2_key_up;
		var player_key_down = global.player2_key_down;
		var player_key2_up = global.player2_key2_up;
		var player_key2_down = global.player2_key2_down;
		var player_key_dive = global.player2_key_dive;
		var player_key2_dive = global.player2_key2_dive;
		var player_key_sprint = global.player2_key_sprint;
		var player_key2_sprint = global.player2_key2_sprint;
		var player_key_jump = global.player2_key_jump;
		var player_key2_jump = global.player2_key2_jump;
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
		var sprite_select_player = global.sprite_select_player_3;
		var player_accept_selection = player3_accept_selection;
		var player_xx = xx3;
		var hex_color_for_player = global.hex_color_for_player_3;
		var player_display_x = player3_display_x;
		var skin_for_player = global.skin_for_player_3;
		var voicepack_for_player = global.voicepack_for_player_3;
		var player_menu = player3_menu;
		var player_key_left = global.player3_key_left;
		var player_key_right = global.player3_key_right;
		var player_key2_left = global.player3_key2_left;
		var player_key2_right = global.player3_key2_right;
		var player_key_up = global.player3_key_up;
		var player_key_down = global.player3_key_down;
		var player_key2_up = global.player3_key2_up;
		var player_key2_down = global.player3_key2_down;
		var player_key_dive = global.player3_key_dive;
		var player_key2_dive = global.player3_key2_dive;
		var player_key_sprint = global.player3_key_sprint;
		var player_key2_sprint = global.player3_key2_sprint;
		var player_key_jump = global.player3_key_jump;
		var player_key2_jump = global.player3_key2_jump;
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
		var sprite_select_player = global.sprite_select_player_4;
		var player_accept_selection = player4_accept_selection;
		var player_xx = xx4;
		var hex_color_for_player = global.hex_color_for_player_4;
		var player_display_x = player4_display_x;
		var skin_for_player = global.skin_for_player_4;
		var voicepack_for_player = global.voicepack_for_player_4;
		var player_menu = player4_menu;
		var player_key_left = global.player4_key_left;
		var player_key_right = global.player4_key_right;
		var player_key2_left = global.player4_key2_left;
		var player_key2_right = global.player4_key2_right;
		var player_key_up = global.player4_key_up;
		var player_key_down = global.player4_key_down;
		var player_key2_up = global.player4_key2_up;
		var player_key2_down = global.player4_key2_down;
		var player_key_dive = global.player4_key_dive;
		var player_key2_dive = global.player4_key2_dive;
		var player_key_sprint = global.player4_key_sprint;
		var player_key2_sprint = global.player4_key2_sprint;
		var player_key_jump = global.player4_key_jump;
		var player_key2_jump = global.player4_key2_jump;
		var menu_joystick_delay = menu_joystick4_delay;
		var can_input_player_name = can_input_player4_name;
		var player_name = global.player4_name;
		var player_color = global.player4_color;
	}
	#endregion /* If player is player 4, set all the variables to player 4 variables END */
	
	#endregion /* Set correct variables for players END */
	
	#region /* Draw Character Portrait for Player */
	if (sprite_select_player > 0)
	and (player_accept_selection >= 0)
	{
		draw_sprite_ext(sprite_select_player, 0, get_window_width / 2 + player_xx, get_window_height / 2, (392 / sprite_get_width(sprite_select_player)) * scale_offset, (392 / sprite_get_width(sprite_select_player)) * scale_offset, 0, hex_color_for_player, 1);
		if (can_input_player1_name == true)
		or (can_input_player2_name == true)
		or (can_input_player3_name == true)
		or (can_input_player4_name == true)
		{
			draw_sprite_ext(sprite_select_player, 0, get_window_width / 2 + player_xx, get_window_height / 2, (392 / sprite_get_width(sprite_select_player)) * scale_offset, (392 / sprite_get_width(sprite_select_player)) * scale_offset, 0, c_black, 0.5);
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var uppercase_character_name;
		uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])), 1));
		uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]))) - 1);
		var character_name = string(uppercase_character_name);
		scr_draw_text_outlined(get_window_width / 2 + player_xx, get_window_height / 2 + 364, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /* Draw Character Portrait for Player END */
	
	#region /* Display Selected Skin if skins are available */
	if (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		
		#region /* Player Select Skin */
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin0"))
		and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
		and (player_accept_selection >= 0)
		or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin0"))
		and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
		and (player_accept_selection >= 0)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width / 2 + player_display_x, get_window_height / 2 + skin_y, l10n_text("Skin") + " : " + string(skin_for_player + 1), global.default_text_size, c_black, c_white, 1);
			
			if (player_menu == "select_skin")
			or (global.controls_used_for_menu_navigation == "mouse")
			{
				if (player_accept_selection == false)
				{
					
					#region /* Player key left Skin */
					if (keyboard_check_pressed(player_key_left))
					and (!keyboard_check_pressed(player_key_right))
					or (keyboard_check_pressed(player_key2_left))
					and (!keyboard_check_pressed(player_key2_right))
					or (gamepad_button_check_pressed(what_player - 1, gp_padl))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padr))
					or (gamepad_axis_value(what_player - 1, gp_axislh) < 0)
					and (menu_joystick_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 + skin_y - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + skin_y + 16))
					and (mouse_check_button_pressed(mb_left))
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
								menu_joystick1_delay = 30;
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
								menu_joystick2_delay = 30;
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
								menu_joystick3_delay = 30;
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
								menu_joystick4_delay = 30;
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
					and (!keyboard_check_pressed(player_key_left))
					or (keyboard_check_pressed(player_key2_right))
					and (!keyboard_check_pressed(player_key2_left))
					or (gamepad_button_check_pressed(what_player - 1, gp_padr))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padl))
					or (gamepad_axis_value(what_player - 1, gp_axislh) > 0)
					and (menu_joystick_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 + skin_y - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + skin_y + 16))
					and (mouse_check_button_pressed(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1)))
						or (menu_delay == 0)
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1)))
						{
							menu_delay = 3;
							
							#region /* Player character select portrait sprite */
							if (what_player == 1)
							{
								global.skin_for_player_1 += 1;
								menu_joystick1_delay = 30;
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
								menu_joystick2_delay = 30;
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
								menu_joystick3_delay = 30;
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
								menu_joystick4_delay = 30;
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
					#endregion /* Player key right Skin END */
					
					#region /* Player key up Skin */
					if (keyboard_check_pressed(player_key_up))
					and (!keyboard_check_pressed(player_key_down))
					or (keyboard_check_pressed(player_key2_up))
					and (!keyboard_check_pressed(player_key2_down))
					or (gamepad_button_check_pressed(what_player - 1, gp_padu))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padd))
					or (gamepad_axis_value(what_player - 1, gp_axislv) < 0)
					and (menu_joystick_delay <= 0)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							menu_joystick_delay = 30;
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
					#endregion /* Player key up Skin END */
					
					#region /* Player key down Skin */
					if (keyboard_check_pressed(player_key_down))
					and (!keyboard_check_pressed(player_key_up))
					or (keyboard_check_pressed(player_key2_down))
					and (!keyboard_check_pressed(player_key2_up))
					or (gamepad_button_check_pressed(what_player - 1, gp_padd))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padu))
					or (gamepad_axis_value(what_player - 1, gp_axislv) > 0)
					and (menu_joystick_delay <= 0)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							menu_joystick_delay = 30;
							if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack0"))
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
							or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack0"))
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
							{
								if (what_player == 1)
								{
									player1_menu = "select_voicepack";
								}
								else
								if (what_player == 2)
								{
									player2_menu = "select_voicepack";
								}
								else
								if (what_player == 3)
								{
									player3_menu = "select_voicepack";
								}
								else
								if (what_player == 4)
								{
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
						if (gamepad_is_connected(what_player - 1))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padl, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + skin_y, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (player_key_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key_left, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (player_key2_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key2_left, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 + skin_y - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + skin_y + 16))
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
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 + skin_y - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Show left key for character skin select END */
					
					#region /* Show right key for character skin select */
					if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1)))
					or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(skin_for_player + 1)))
					{
						if (gamepad_is_connected(what_player - 1))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padr, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + skin_y, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (player_key_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key_right, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (player_key2_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key2_right, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 + skin_y - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + skin_y + 16))
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
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 + skin_y - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
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
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack0"))
		and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
		and (player_accept_selection >= 0)
		or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack0"))
		and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
		and (player_accept_selection >= 0)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width / 2 + player_display_x, get_window_height / 2 + voicepack_y, l10n_text("Voice Pack") + " : " + string(voicepack_for_player + 1), global.default_text_size, c_black, c_white, 1);
			
			if (player_menu = "select_voicepack")
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (player_accept_selection == false)
				{
					
					#region /* Player key left Voice Pack */
					if (keyboard_check_pressed(player_key_left))
					and (!keyboard_check_pressed(player_key_right))
					or (keyboard_check_pressed(player_key2_left))
					and (!keyboard_check_pressed(player_key2_right))
					or (gamepad_button_check_pressed(what_player - 1, gp_padl))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padr))
					or (gamepad_axis_value(what_player - 1, gp_axislh) < 0)
					and (menu_joystick_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 + voicepack_y - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + voicepack_y + 16))
					and (mouse_check_button_pressed(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						and (voicepack_for_player > 0)
						{
							menu_delay = 3;
							if (what_player == 1)
							{
								global.voicepack_for_player_1 -= 1;
								menu_joystick1_delay = 30;
								xx1 = player_display_x - 32;
							}
							else
							if (what_player == 2)
							{
								global.voicepack_for_player_2 -= 1;
								menu_joystick2_delay = 30;
								xx2 = player_display_x - 32;
							}
							else
							if (what_player == 3)
							{
								global.voicepack_for_player_3 -= 1;
								menu_joystick3_delay = 30;
								xx3 = player_display_x - 32;
							}
							else
							if (what_player == 4)
							{
								global.voicepack_for_player_4 -= 1;
								menu_joystick4_delay = 30;
								xx4 = player_display_x - 32;
							}
						}
					}
					#endregion /* Player key left Voice Pack END */
					
					#region /* Player key right Voice Pack */
					if (keyboard_check_pressed(player_key_right))
					and (!keyboard_check_pressed(player_key_left))
					or (keyboard_check_pressed(player_key2_right))
					and (!keyboard_check_pressed(player_key2_left))
					or (gamepad_button_check_pressed(what_player - 1, gp_padr))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padl))
					or (gamepad_axis_value(what_player - 1, gp_axislh) > 0)
					and (menu_joystick_delay <= 0)
					or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 + voicepack_y - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + voicepack_y + 16))
					and (mouse_check_button_pressed(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1)))
						or (menu_delay == 0)
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1)))
						{
							menu_delay = 3;
							if (what_player == 1)
							{
								global.voicepack_for_player_1 += 1;
								menu_joystick1_delay = 30;
								xx1 = player_display_x + 32;
							}
							else
							if (what_player == 2)
							{
								global.voicepack_for_player_2 += 1;
								menu_joystick2_delay = 30;
								xx2 = player_display_x + 32;
							}
							else
							if (what_player == 3)
							{
								global.voicepack_for_player_3 += 1;
								menu_joystick3_delay = 30;
								xx3 = player_display_x + 32;
							}
							else
							if (what_player == 4)
							{
								global.voicepack_for_player_4 += 1;
								menu_joystick4_delay = 30;
								xx4 = player_display_x + 32;
							}
						}
					}
					#endregion /* Player key right Voice Pack END */
					
					#region /* Player key up Voice Pack */
					if (keyboard_check_pressed(player_key_up))
					and (!keyboard_check_pressed(player_key_down))
					or (keyboard_check_pressed(player_key2_up))
					and (!keyboard_check_pressed(player_key2_down))
					or (gamepad_button_check_pressed(what_player - 1, gp_padu))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padd))
					or (gamepad_axis_value(what_player - 1, gp_axislv) < 0)
					and (menu_joystick_delay <= 0)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin0"))
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
							or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin0"))
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
							{
								
								#region /* Go from selecting voicepack to selecting skin */
								if (what_player == 1)
								{
									menu_joystick1_delay = 30;
									player1_menu = "select_skin";
								}
								else
								if (what_player == 2)
								{
									menu_joystick2_delay = 30;
									player2_menu = "select_skin";
								}
								else
								if (what_player == 3)
								{
									menu_joystick3_delay = 30;
									player3_menu = "select_skin";
								}
								else
								if (what_player == 4)
								{
									menu_joystick4_delay = 30;
									player4_menu = "select_skin";
								}
								#endregion /* Go from selecting voicepack to selecting skin END */
								
							}
							else
							{
								
								#region /* Go from selecting voicepack to selecting character */
								if (what_player == 1)
								{
									menu_joystick1_delay = 30;
									player1_menu = "select_character";
								}
								else
								if (what_player == 2)
								{
									menu_joystick2_delay = 30;
									player2_menu = "select_character";
								}
								else
								if (what_player == 3)
								{
									menu_joystick3_delay = 30;
									player3_menu = "select_character";
								}
								else
								if (what_player == 4)
								{
									menu_joystick4_delay = 30;
									player4_menu = "select_character";
								}
								#endregion /* Go from selecting voicepack to selecting character END */
								
							}
						}
					}
					#endregion /* Player key up Voice Pack END */
					
					#region /* Player key down Voice Pack */
					if (keyboard_check_pressed(player_key_down))
					and (!keyboard_check_pressed(player_key_up))
					or (keyboard_check_pressed(player_key2_down))
					and (!keyboard_check_pressed(player_key2_up))
					or (gamepad_button_check_pressed(what_player - 1, gp_padd))
					and (!gamepad_button_check_pressed(what_player - 1, gp_padu))
					or (gamepad_axis_value(what_player - 1, gp_axislv) > 0)
					and (menu_joystick_delay <= 0)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							if (what_player == 1)
							{
								menu_joystick1_delay = 30;
								player1_menu = "select_name";
							}
							else
							if (what_player == 2)
							{
								menu_joystick2_delay = 30;
								player2_menu = "select_name";
							}
							else
							if (what_player == 3)
							{
								menu_joystick3_delay = 30;
								player3_menu = "select_name";
							}
							else
							if (what_player == 4)
							{
								menu_joystick4_delay = 30;
								player4_menu = "select_name";
							}
						}
					}
					#endregion /* Player key down Voice Pack END */
					
					#region /* Show left key for character voicepack select */
					if (voicepack_for_player > 0)
					{
						if (gamepad_is_connected(what_player - 1))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padl, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + voicepack_y, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (player_key_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key_left, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (player_key2_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key2_left, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 + voicepack_y - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + voicepack_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player_menu = "select_voicepack";
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 + voicepack_y - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Show left key for character voicepack select END */
					
					#region /* Show right key for character voicepack select */
					if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1)))
					or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack" + string(voicepack_for_player + 1)))
					{
						if (gamepad_is_connected(what_player - 1))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padr, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + voicepack_y, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (player_key_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key_right, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (player_key2_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, player_key2_right, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 + voicepack_y - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + voicepack_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player_menu = "select_voicepack";
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 + voicepack_y - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
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
			if (gamepad_button_check_pressed(0, gp_face2))
			and (menu_delay == 0)
			or (keyboard_check_pressed(ord("X")))
			and (menu_delay == 0)
			or (mouse_check_button_pressed(mb_right))
			and (menu_delay == 0)
			or (mouse_check_button_pressed(mb_side1))
			and (menu_delay == 0)
			or (keyboard_check_pressed(vk_backspace))
			and (menu_delay == 0)
			or (keyboard_check_pressed(vk_escape))
			and (menu_delay == 0)
			or (keyboard_check_pressed(player_key_dive))
			and (menu_delay == 0)
			or (keyboard_check_pressed(player_key2_dive))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				player1_accept_selection = -1;
			}
		}
		if (player2_accept_selection = false)
		{
			if (gamepad_button_check_pressed(1, gp_face2))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player2_key_dive))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player2_key2_dive))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				player2_accept_selection = -1;
			}
		}
		if (player3_accept_selection = false)
		{
			if (gamepad_button_check_pressed(2, gp_face2))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player3_key_dive))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player3_key2_dive))
			and (menu_delay == 0)
			{
				menu_delay = 3;
				player3_accept_selection = -1;
			}
		}
		if (player4_accept_selection = false)
		{
			if (gamepad_button_check_pressed(3, gp_face2))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player4_key_dive))
			and (menu_delay == 0)
			or (keyboard_check_pressed(global.player4_key2_dive))
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
					if (gamepad_is_connected(what_player - 1))
					and (global.controls_used_for_menu_navigation == "controller")
					{
						scr_draw_gamepad_buttons(gp_padl, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2, 0.5, c_white, 1);
					}
					else
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (player_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key_left, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (player_key2_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key2_left, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x - arrow_offset, get_window_height / 2, 0.5, 0.5, 0, c_white, 1);
						}
					}
					
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + 16))
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
						draw_set_alpha(0.5);
						draw_rectangle_color(get_window_width / 2 + player_display_x - arrow_offset - 16, get_window_height / 2 - 16, get_window_width / 2 + player_display_x - arrow_offset + 16, get_window_height / 2 + 16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /* Key Left END */
			
				#region /* Key Right */
				if (global.character_index[what_player - 1] < ds_list_size(global.all_loaded_characters) - 1)
				{
					if (gamepad_is_connected(what_player - 1))
					and (global.controls_used_for_menu_navigation == "controller")
					{
						scr_draw_gamepad_buttons(gp_padr, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2, 0.5, c_white, 1);
					}
					else
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (player_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key_right, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (player_key2_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key2_right, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x + arrow_offset, get_window_height / 2, 0.5, 0.5, 0, c_white, 1);
						}
					}
				
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + 16))
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
						draw_set_alpha(0.5);
						draw_rectangle_color(get_window_width / 2 + player_display_x + arrow_offset - 16, get_window_height / 2 - 16, get_window_width / 2 + player_display_x + arrow_offset + 16, get_window_height / 2 + 16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /* Key Right END */
			
			}
		}
		#endregion /* Player Show left and right arrows when selecting character END */
		
	}
	#endregion /* Show left and right arrows when selecting character END */
	
	#region /* Tell the player the inputed name */
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - 150, get_window_height / 2 + name_y - 16, get_window_width / 2 + player_display_x + 150, get_window_height / 2 + name_y + 16))
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
	
	if (player_accept_selection >= 0)
	and (can_input_player_name == false)
	{
		if (player_name = "")
		{
			if (what_player == 1)
			{
				scr_draw_name_box("Player 1", player_color, 0.5, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y);
			}
			else
			if (what_player == 2)
			{
				scr_draw_name_box("Player 2", player_color, 0.5, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y);
			}
			else
			if (what_player == 3)
			{
				scr_draw_name_box("Player 3", player_color, 0.5, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y);
			}
			else
			if (what_player == 4)
			{
				scr_draw_name_box("Player 4", player_color, 0.5, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y);
			}
		}
		else
		{
			scr_draw_name_box(player_name, player_color, 0.5, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y);
		}
	}
		
	if (player_accept_selection >= 0)
	and (can_input_player_name == true)
	{
		if (what_player == 1)
		{
			global.player1_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
		else
		if (what_player == 2)
		{
			global.player2_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
		else
		if (what_player == 3)
		{
			global.player3_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
		else
		if (what_player == 4)
		{
			global.player4_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width / 2 + player_display_x, get_window_height / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
	}
	
	#endregion /* Tell the player the inputed name END */
	
	#region /* Tell the players what buttons to push */
	
	#region /* Tell the player what button to push to select or cancel a selection */
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	
	if (player_menu != "select_name")
	and (player_menu != "back_from_character_select")
	and (player_menu != "open_custom_characters_folder")
	and (player_menu != "copy_character")
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
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - 100, get_window_height / 2 + 150 - 20, get_window_width / 2 + player_display_x + 100, get_window_height / 2 + 150 + 20))
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
				
				draw_set_alpha(0.75);
				draw_rectangle_color(get_window_width / 2 + player_display_x - 100, get_window_height / 2 + 150 - 20, get_window_width / 2 + player_display_x + 100, get_window_height / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		
			#region /* Accept Text */
			draw_set_halign(fa_right);
			scr_draw_text_outlined(get_window_width / 2 + player_display_x + 60, get_window_height / 2 + 150, l10n_text("Accept") + " : ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Accept Text END */
	
			#region /* Key A */
			if (gamepad_is_connected(what_player - 1))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_face1, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, c_white, 1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (player_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key_jump, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (player_key2_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key2_jump, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /* Key A END */
		
		}
		else
		if (player_accept_selection == true)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width / 2 + player_display_x - 100, get_window_height / 2 + 150 - 20, get_window_width / 2 + player_display_x + 100, get_window_height / 2 + 150 + 20))
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
			
				draw_set_alpha(0.75);
				draw_rectangle_color(get_window_width / 2 + player_display_x - 100, get_window_height / 2 + 150 - 20, get_window_width / 2 + player_display_x + 100, get_window_height / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width / 2 + player_display_x - 100, get_window_height / 2 + 150 - 20, get_window_width / 2 + player_display_x + 100, get_window_height / 2 + 150 + 20, c_red, c_red, c_red, c_red, false);
				draw_set_alpha(1);
			}
			
			#region /* Cancel Text */
			draw_set_halign(fa_right);
			scr_draw_text_outlined(get_window_width / 2 + player_display_x + 60, get_window_height / 2 + 150, l10n_text("Cancel") + " : ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Cancel Text END */
		
			#region /* Key B */
			if (gamepad_is_connected(what_player - 1))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_face2, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, c_white, 1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (player_key_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key_dive, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (player_key2_dive > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key2_dive, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (player_key_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key_sprint, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (player_key2_sprint > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key2_sprint, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x + 80, get_window_height / 2 + 150, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /* Key B END */
		
		}
	}
	#endregion /* Tell the player what button to push to select or cancel a selection END */
	
	#region /* Tell player what button to push to enter a name */
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	
	if (player_menu = "select_name")
	and (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	and (global.controls_used_for_menu_navigation != "mouse")
	{
		scr_draw_text_outlined(get_window_width / 2 + player_display_x + 60, get_window_height / 2 + name_y + 42, l10n_text("Enter name") + " : ", global.default_text_size, c_black, c_white, 1); /* Accept Text */
		
		#region /* Key A */
		if (gamepad_is_connected(what_player - 1))
		and (global.controls_used_for_menu_navigation == "controller")
		{
			scr_draw_gamepad_buttons(gp_face1, get_window_width / 2 + player_display_x + 70, get_window_height / 2 + name_y + 42, 0.5, c_white, 1);
		}
		else
		{
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (player_key_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, player_key_jump, get_window_width / 2 + player_display_x + 70, get_window_height / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (player_key2_jump > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, player_key2_jump, get_window_width / 2 + player_display_x + 70, get_window_height / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width / 2 + player_display_x + 70, get_window_height / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
				}
			}
		}
		#endregion /* Key A END */
		
	}
	#endregion /* Tell player what button to push to enter a name END */
	
	#endregion /* Tell the players what buttons to push END */
	
}