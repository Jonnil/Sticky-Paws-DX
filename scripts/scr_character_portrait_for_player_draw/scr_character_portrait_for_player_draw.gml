function scr_character_portrait_for_player_draw(what_player = 1)
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
	
	#endregion /* Set correct variables for players END */
	
	#region /* Draw Character Portrait for Player */
	if (sprite_select_player > 0)
	and (player_accept_selection >= 0)
	and (sprite_exists(sprite_select_player))
	{
		draw_sprite_ext(sprite_select_player, 0, get_window_width * 0.5 + player_xx, get_window_height * 0.5, (392 / sprite_get_width(sprite_select_player)) * scale_offset, (392 / sprite_get_width(sprite_select_player)) * scale_offset, 0, hex_color_for_player, 1);
		if (can_input_player1_name)
		or (can_input_player2_name)
		or (can_input_player3_name)
		or (can_input_player4_name)
		{
			draw_sprite_ext(sprite_select_player, 0, get_window_width * 0.5 + player_xx, get_window_height * 0.5, (392 / sprite_get_width(sprite_select_player)) * scale_offset, (392 / sprite_get_width(sprite_select_player)) * scale_offset, 0, c_black, 0.5);
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var uppercase_character_name;
		uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])), 1));
		uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]))) - 1);
		var character_name = string(uppercase_character_name);
		
		#region /* Display Character Name */
		if (player_menu != "select_name")
		and (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		or (global.controls_used_for_menu_navigation == "mouse")
		{
			scr_draw_text_outlined(get_window_width * 0.5 + player_display_x, get_window_height * 0.5 + 324, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Display Character Name END */
		
	}
	#endregion /* Draw Character Portrait for Player END */
	
	#region /* Display Selected Skin if skins are available */
	if (can_input_player1_name == false)
	and (can_input_player2_name == false)
	and (can_input_player3_name == false)
	and (can_input_player4_name == false)
	{
		
		#region /* Player Select Skin */
		if (character_portrait_for_player_directory_exists_1[what_player])
		{
			if (player_accept_selection == false)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(get_window_width * 0.5 + player_display_x, get_window_height * 0.5 + skin_y, l10n_text("Skin") + ": " + string(skin_for_player + 1), global.default_text_size, c_black, c_white, 1);
			}
			
			if (player_menu == "select_skin")
			or (global.controls_used_for_menu_navigation == "mouse")
			{
				if (player_accept_selection == false)
				{
					
					#region /* Show left key for character skin select */
					if (skin_for_player > 0)
					{
						if (gamepad_is_connected(player_gamepad_slot))
						and (global.controls_used_for_menu_navigation == "controller")
						or (global.always_show_gamepad_buttons)
						{
							scr_draw_gamepad_buttons(gp_padl, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + skin_y, 0.5, c_white, 1);
						}
						else
						if (player_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key_left, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + skin_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (player_key2_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key2_left, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + skin_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + skin_y, 0.5, 0.5, 0, c_white, 1);
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + skin_y + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Show left key for character skin select END */
					
					#region /* Show right key for character skin select */
					if (character_portrait_for_player_directory_exists_2[what_player])
					{
						if (gamepad_is_connected(player_gamepad_slot))
						and (global.controls_used_for_menu_navigation == "controller")
						or (global.always_show_gamepad_buttons)
						{
							scr_draw_gamepad_buttons(gp_padr, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + skin_y, 0.5, c_white, 1);
						}
						else
						if (player_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key_right, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + skin_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (player_key2_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key2_right, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + skin_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + skin_y, 0.5, 0.5, 0, c_white, 1);
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + skin_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + skin_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + skin_y + 16, c_white, c_white, c_white, c_white, false);
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
		if (character_portrait_for_player_directory_exists_3[what_player])
		{
			if (player_accept_selection == false)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(get_window_width * 0.5 + player_display_x, get_window_height * 0.5 + voicepack_y, l10n_text("Voice Pack") + ": " + string(voicepack_for_player + 1), global.default_text_size, c_black, c_white, 1);
			}
			
			if (player_menu = "select_voicepack")
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (player_accept_selection == false)
				{
					
					#region /* Show left key for character voicepack select */
					if (voicepack_for_player > 0)
					{
						if (gamepad_is_connected(player_gamepad_slot))
						and (global.controls_used_for_menu_navigation == "controller")
						or (global.always_show_gamepad_buttons)
						{
							scr_draw_gamepad_buttons(gp_padl, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, c_white, 1);
						}
						else
						if (player_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key_left, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (player_key2_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key2_left, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player_menu = "select_voicepack";
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Show left key for character voicepack select END */
					
					#region /* Show right key for character voicepack select */
					if (character_portrait_for_player_directory_exists_4[what_player])
					{
						if (gamepad_is_connected(player_gamepad_slot))
						and (global.controls_used_for_menu_navigation == "controller")
						or (global.always_show_gamepad_buttons)
						{
							scr_draw_gamepad_buttons(gp_padr, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, c_white, 1);
						}
						else
						if (player_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key_right, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (player_key2_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, player_key2_right, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
						}
						if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player_menu = "select_voicepack";
							draw_set_alpha(0.5);
							draw_rectangle_color(get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 + voicepack_y - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
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
		
		#region /* Player Show left and right arrows when selecting character */
		if (player_menu = "select_character")
		or (global.controls_used_for_menu_navigation = "mouse")
		{
			if (player_accept_selection == false)
			{
				
				#region /* Key Left */
				if (global.character_index[what_player - 1] > 0)
				{
					if (gamepad_is_connected(player_gamepad_slot))
					and (global.controls_used_for_menu_navigation == "controller")
					or (global.always_show_gamepad_buttons)
					{
						scr_draw_gamepad_buttons(gp_padl, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5, 0.5, c_white, 1);
					}
					else
					if (player_key_left > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key_left, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (player_key2_left > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key2_left, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
					}
					
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + 16))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(get_window_width * 0.5 + player_display_x - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x - arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
						draw_set_alpha(1);
					}
				}
				#endregion /* Key Left END */
			
				#region /* Key Right */
				if (global.character_index[what_player - 1] < ds_list_size(global.all_loaded_characters) - 1)
				{
					if (gamepad_is_connected(player_gamepad_slot))
					and (global.controls_used_for_menu_navigation == "controller")
					or (global.always_show_gamepad_buttons)
					{
						scr_draw_gamepad_buttons(gp_padr, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5, 0.5, c_white, 1);
					}
					else
					if (player_key_right > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key_right, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (player_key2_right > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, player_key2_right, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
					}
					
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + 16))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						draw_set_alpha(0.5);
						draw_rectangle_color(get_window_width * 0.5 + player_display_x + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x + arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
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
	
	if (player_accept_selection >= 0)
	and (can_input_player_name == false)
	{
		if (player_name = "")
		{
			if (what_player == 1)
			{
				scr_draw_name_box("Player 1", player_color, 0.5, get_window_width * 0.5 + player_display_x, name_input_y);
			}
			else
			if (what_player == 2)
			{
				scr_draw_name_box("Player 2", player_color, 0.5, get_window_width * 0.5 + player_display_x, name_input_y);
			}
			else
			if (what_player == 3)
			{
				scr_draw_name_box("Player 3", player_color, 0.5, get_window_width * 0.5 + player_display_x, name_input_y);
			}
			else
			if (what_player == 4)
			{
				scr_draw_name_box("Player 4", player_color, 0.5, get_window_width * 0.5 + player_display_x, name_input_y);
			}
		}
		else
		{
			scr_draw_name_box(player_name, player_color, 0.5, get_window_width * 0.5 + player_display_x, name_input_y);
		}
	}
	
	if (player_accept_selection >= 0)
	and (can_input_player_name)
	{
		if (what_player == 1)
		{
			global.player1_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width * 0.5 + player_display_x, name_input_y, "input_name_ok", "input_name_cancel");
		}
		else
		if (what_player == 2)
		{
			global.player2_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width * 0.5 + player_display_x, name_input_y, "input_name_ok", "input_name_cancel");
		}
		else
		if (what_player == 3)
		{
			global.player3_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width * 0.5 + player_display_x, name_input_y, "input_name_ok", "input_name_cancel");
		}
		else
		if (what_player == 4)
		{
			global.player4_name = scr_draw_name_input_screen(player_name, 32, player_color, 0.5, true, get_window_width * 0.5 + player_display_x, name_input_y, "input_name_ok", "input_name_cancel");
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
				draw_set_alpha(0.75);
				draw_rectangle_color(get_window_width * 0.5 + player_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x + 100, get_window_height * 0.5 + 150 + 20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
			else
			{
				/* Make the Accept button blink to make it more noticable for the player */
				draw_set_alpha(scr_wave(0, 0.75, 1, 0));
				draw_rectangle_color(get_window_width * 0.5 + player_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x + 100, get_window_height * 0.5 + 150 + 20, player_color, player_color, player_color, player_color, false);
				draw_set_alpha(1);
			}
			
			#region /* Accept Text */
			draw_set_halign(fa_right);
			scr_draw_text_outlined(get_window_width * 0.5 + player_display_x + 60, get_window_height * 0.5 + 150, l10n_text("Accept") + ": ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Accept Text END */
			
			#region /* Key A */
			if (gamepad_is_connected(player_gamepad_slot))
			and (global.controls_used_for_menu_navigation == "controller")
			or (global.always_show_gamepad_buttons)
			{
				scr_draw_gamepad_buttons(player_gamepad_button_accept, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, c_white, 1);
			}
			else
			{
				if (player_key_accept > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, player_key_accept, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (player_key2_accept > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, player_key2_accept, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, 0.5, 0, c_white, 1);
				}
			}
			#endregion /* Key A END */
			
		}
		else
		if (player_accept_selection)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x + 100, get_window_height * 0.5 + 150 + 20))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_set_alpha(0.75);
				draw_rectangle_color(get_window_width * 0.5 + player_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x + 100, get_window_height * 0.5 + 150 + 20, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width * 0.5 + player_display_x - 100, get_window_height * 0.5 + 150 - 20, get_window_width * 0.5 + player_display_x + 100, get_window_height * 0.5 + 150 + 20, c_red, c_red, c_red, c_red, false);
				draw_set_alpha(1);
			}
			
			#region /* Cancel Text */
			draw_set_halign(fa_right);
			scr_draw_text_outlined(get_window_width * 0.5 + player_display_x + 60, get_window_height * 0.5 + 150, l10n_text("Cancel") + ": ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Cancel Text END */
			
			#region /* Key B */
			if (gamepad_is_connected(player_gamepad_slot))
			and (global.controls_used_for_menu_navigation == "controller")
			or (global.always_show_gamepad_buttons)
			{
				scr_draw_gamepad_buttons(player_gamepad_button_back, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, c_white, 1);
			}
			else
			{
				if (player_key_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, player_key_back, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (player_key2_back > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, player_key2_back, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x + 80, get_window_height * 0.5 + 150, 0.5, 0.5, 0, c_white, 1);
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
		scr_draw_text_outlined(get_window_width * 0.5 + player_display_x + 60, name_input_y + 35, l10n_text("Enter name") + ": ", global.default_text_size, c_black, c_white, 1); /* Accept Text */
		
		#region /* Key A */
		if (gamepad_is_connected(player_gamepad_slot))
		and (global.controls_used_for_menu_navigation == "controller")
		or (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(player_gamepad_button_accept, get_window_width * 0.5 + player_display_x + 70, name_input_y + 35, 0.5, c_white, 1);
		}
		else
		{
			if (player_key_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, player_key_accept, get_window_width * 0.5 + player_display_x + 70, name_input_y + 35, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (player_key2_accept > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, player_key2_accept, get_window_width * 0.5 + player_display_x + 70, name_input_y + 35, 0.5, 0.5, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x + 70, name_input_y + 35, 0.5, 0.5, 0, c_white, 1);
			}
		}
		#endregion /* Key A END */
		
	}
	#endregion /* Tell player what button to push to enter a name END */
	
	#endregion /* Tell the players what buttons to push END */
	
}