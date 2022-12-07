function scr_draw_character_portrait_for_player(what_player = 1)
{
	
	#region /* Set correct variables for players */
	
	#region /* If player is player 1, set all the variables to player 1 variables */
	if (what_player == 1)
	{
		var sprite_select_player = global.sprite_select_player_1;
		var player_accept_selection = player1_accept_selection;
		var player_xx = xx1;
		var hex_color_for_player = global.hex_color_for_player_1;
	}
	#endregion /* If player is player 1, set all the variables to player 1 variables END */
	
	else
	
	#region /* If player is player 2, set all the variables to player 2 variables */
	if (what_player == 2)
	{
		var sprite_select_player = global.sprite_select_player_2;
		var player_accept_selection = player2_accept_selection;
		var player_xx = xx2;
		var hex_color_for_player = global.hex_color_for_player_2;
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
	}
	#endregion /* If player is player 4, set all the variables to player 4 variables END */
	
	#endregion /* Set correct variables for players END */
	
	#region /* Draw Character Portrait for Player */
	if (sprite_select_player > 0)
	and (player_accept_selection >= 0)
	{
		draw_sprite_ext(sprite_select_player, 0, window_get_width() / 2 + player_xx, window_get_height() / 2, 392 / sprite_get_width(sprite_select_player), 392 / sprite_get_width(sprite_select_player), 0, hex_color_for_player, 1);
		if (can_input_player1_name == true)
		or (can_input_player2_name == true)
		or (can_input_player3_name == true)
		or (can_input_player4_name == true)
		{
			draw_sprite_ext(sprite_select_player, 0, window_get_width() / 2 + player_xx, window_get_height() / 2, 392 / sprite_get_width(sprite_select_player), 392 / sprite_get_width(sprite_select_player), 0, c_black, 0.5);
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var uppercase_character_name;
		uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])), 1));
		uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]))) - 1);
		var character_name = string(uppercase_character_name);
		scr_draw_text_outlined(window_get_width() / 2 + player_xx, window_get_height() / 2 + 364, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /* Draw Character Portrait for Player END */
	
	#region /* Display Selected Skin if skins are available */
	if (can_input_player1_name = false)
	and (can_input_player2_name = false)
	and (can_input_player3_name = false)
	and (can_input_player4_name = false)
	{
		
		skin_y = 192;
		
		#region /* Player Select Skin */
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin0"))
		and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
		and (player1_accept_selection >= 0)
		or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin0"))
		and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin1"))
		and (player1_accept_selection >= 0)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(window_get_width() / 2 + player1_display_x, window_get_height() / 2 + skin_y, l10n_text("Skin") + " : " + string(global.skin_for_player_1 + 1), global.default_text_size, c_black, c_white, 1);
			
			if (player1_menu == "select_skin")
			or (global.controls_used_for_menu_navigation == "mouse")
			{
				if (player1_accept_selection = false)
				{
					
					#region /* Player 1 key left Skin */
					if (keyboard_check_pressed(global.player1_key_left))
					and (!keyboard_check_pressed(global.player1_key_right))
					or (keyboard_check_pressed(global.player1_key2_left))
					and (!keyboard_check_pressed(global.player1_key2_right))
					or (gamepad_button_check_pressed(0, gp_padl))
					and (!gamepad_button_check_pressed(0, gp_padr))
					or (gamepad_axis_value(0, gp_axislh) < 0)
					and (menu_joystick1_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
					and (mouse_check_button_pressed(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						and (global.skin_for_player_1 > 0)
						{
							menu_delay = 3;
							menu_joystick1_delay = 30;
							xx1 = player1_display_x - 32;
							global.skin_for_player_1 -= 1;
							
							#region /* Player 1 character select portrait sprite */
							global.sprite_select_player_1 = spr_noone;
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
							#endregion /* Player 1 character select portrait sprite END */
							
						}
					}
					#endregion /* Player 1 key left Skin END */
					
					#region /* Player 1 key right Skin */
					if (keyboard_check_pressed(global.player1_key_right))
					and (!keyboard_check_pressed(global.player1_key_left))
					or (keyboard_check_pressed(global.player1_key2_right))
					and (!keyboard_check_pressed(global.player1_key2_left))
					or (gamepad_button_check_pressed(0, gp_padr))
					and (!gamepad_button_check_pressed(0, gp_padl))
					or (gamepad_axis_value(0, gp_axislh) > 0)
					and (menu_joystick1_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
					and (mouse_check_button_pressed(mb_left))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						if (menu_delay == 0)
						and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
						or (menu_delay == 0)
						and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
						{
							menu_delay = 3;
							menu_joystick1_delay = 30;
							xx1 = player1_display_x + 32;
							global.skin_for_player_1 += 1;
							
							#region /* Player 1 character select portrait sprite */
							global.sprite_select_player_1 = spr_noone;
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1);
							global.sprite_select_player_1 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1);
							#endregion /* Player 1 character select portrait sprite END */
							
						}
					}
					#endregion /* Player 1 key right Skin END */
					
					#region /* Player 1 key up Skin */
					if (keyboard_check_pressed(global.player1_key_up))
					and (!keyboard_check_pressed(global.player1_key_down))
					or (keyboard_check_pressed(global.player1_key2_up))
					and (!keyboard_check_pressed(global.player1_key2_down))
					or (gamepad_button_check_pressed(0, gp_padu))
					and (!gamepad_button_check_pressed(0, gp_padd))
					or (gamepad_axis_value(0, gp_axislv) < 0)
					and (menu_joystick1_delay <= 0)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							menu_joystick1_delay = 30;
							player1_menu = "select_character";
						}
					}
					#endregion /* Player 1 key up Skin END */
					
					#region /* Player 1 key down Skin */
					if (keyboard_check_pressed(global.player1_key_down))
					and (!keyboard_check_pressed(global.player1_key_up))
					or (keyboard_check_pressed(global.player1_key2_down))
					and (!keyboard_check_pressed(global.player1_key2_up))
					or (gamepad_button_check_pressed(0, gp_padd))
					and (!gamepad_button_check_pressed(0, gp_padu))
					or (gamepad_axis_value(0, gp_axislv) > 0)
					and (menu_joystick1_delay <= 0)
					{
						if (menu_delay == 0)
						{
							menu_delay = 3;
							menu_joystick1_delay = 30;
							if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack0"))
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
							or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack0"))
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sound/voicepack1"))
							{
								player1_menu = "select_voicepack";
							}
							else
							{
								player1_menu = "select_name";
							}
						}
					}
					#endregion /* Player 1 key down Skin END */
					
					#region /* Show left key for character skin select */
					if (global.skin_for_player_1 > 0)
					{
						if (gamepad_is_connected(0))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player1_key_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player1_key2_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player1_menu = "select_skin";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Show left key for character skin select END */
					
					#region /* Show right key for character skin select */
					if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
					or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
					{
						if (gamepad_is_connected(0))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player1_key_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player1_key2_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player1_menu = "select_skin";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
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
	
}