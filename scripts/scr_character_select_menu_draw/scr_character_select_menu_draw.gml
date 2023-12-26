function scr_character_select_menu_draw()
{
	if (ds_list_size(global.all_loaded_characters) >= global.max_custom_characters)
	{
		var max_custom_characters_reached = true;
	}
	else
	{
		var max_custom_characters_reached = false;
	}
	
	/* Player 1 Key Accept Pressed */ player1_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.accept])) || (keyboard_check_pressed(vk_space));
	/* Player 1 Key Back Pressed */ player1_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][1][2][action.back])) || (keyboard_check_pressed(vk_escape));
	/* Player 2 Key Accept Pressed */ player2_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.accept]));
	/* Player 2 Key Back Pressed */ player2_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][2][2][action.back]));
	/* Player 3 Key Accept Pressed */ player3_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.accept]));
	/* Player 3 Key Back Pressed */ player3_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][3][2][action.back]));
	/* Player 4 Key Accept Pressed */ player4_key_a_pressed = (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept])) || (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.accept])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.accept]));
	/* Player 4 Key Back Pressed */ player4_key_b_pressed = (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back])) || (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][1][action.back])) || (keyboard_check_pressed(global.player_[inp.key][4][2][action.back]));
	
	arrow_offset = 125;
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var window_width_half = get_window_width * 0.5;
	var window_height_half = get_window_height * 0.5;
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (menu == "select_character")
	|| (menu == "back_from_character_select")
	|| (menu == "manage_character")
	|| (menu == "online_character_list")
	|| (menu == "input_name_ok")
	|| (menu == "input_name_cancel")
	{
		
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
		
		#region /* Give feedback that you have selected a character, run this before the character portrait code */
		if (player1_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[1], get_window_height * 0.5, player1_scale, player1_scale, 0, global.player_color[1], 1);
		}
		if (player2_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[2], get_window_height * 0.5, player2_scale, player2_scale, 0, global.player_color[2], 1);
		}
		if (player3_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[3], get_window_height * 0.5, player3_scale, player3_scale, 0, global.player_color[3], 1);
		}
		if (player4_accept_selection)
		{
			draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[4], get_window_height * 0.5, player4_scale, player4_scale, 0, global.player_color[4], 1);
		}
		#endregion /* Give feedback that you have selected a character, run this before the character portrait code END */
		
		#region /* Display Selected Characters, run this before the "play the game" text code */
		if (global.playergame >= 0)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(1);
		}
		if (global.playergame >= 1)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(2);
		}
		if (global.playergame >= 2)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(3);
		}
		if (global.playergame >= 3)
		|| (global.skip_how_many_people_are_playing_screen)
		{
			scr_character_portrait_for_player_draw(4);
		}
		#endregion /* Display Selected Characters, run this before the "play the game" text code END */
		
		#region /* Play the game text */
		
		#region /* Draw Play the game text */
		if (play_the_game_text_y_lerp > -70) /* Only draw if it's within view */
		&& (play_the_game_text_y_lerp < display_get_gui_height() + 70)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_rectangle_color(0, play_the_game_text_y_lerp - 32 - 4, get_window_width, play_the_game_text_y_lerp + 32 + 4, c_red, c_yellow, c_yellow, c_red, false);
			}
			draw_rectangle_color(0, play_the_game_text_y_lerp - 32, get_window_width, play_the_game_text_y_lerp + 32, c_black, c_black, c_black, c_black, false);
			scr_draw_text_outlined(get_window_width * 0.5 -40, play_the_game_text_y_lerp, l10n_text("Play the game!"), global.default_text_size * 2, c_black, c_white, 1);
			
			if (player1_accept_selection)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				draw_set_alpha(0.9);
				draw_roundrect_color_ext(get_window_width * 0.5 - (string_width(l10n_text("Player 1 starts the game")) * 0.5), play_the_game_text_y_lerp + 32, get_window_width * 0.5 + (string_width(l10n_text("Player 1 starts the game")) * 0.5), play_the_game_text_y_lerp + 64, 50, 50, c_black, c_black, false);
				draw_set_alpha(1);
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 1 starts the game"), global.default_text_size, c_black, global.player_color[1], 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player_slot[1]))
				&& (global.controls_used_for_navigation == "gamepad")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][1][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][1][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection != 0)
			{
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 2 starts the game"), global.default_text_size, c_black, global.player_color[2], 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player_slot[2]))
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][2][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][2][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][2][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection)
			&& (player4_accept_selection != 0)
			{
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 3 starts the game"), global.default_text_size, c_black, global.player_color[3], 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player_slot[3]))
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][3][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][3][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][3][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
			else
			if (player1_accept_selection != 0)
			&& (player2_accept_selection != 0)
			&& (player3_accept_selection != 0)
			&& (player4_accept_selection)
			{
				scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, l10n_text("Player 4 starts the game"), global.default_text_size, c_black, global.player_color[4], 1);
				
				#region /* Show Key A on screen */
				if (gamepad_is_connected(global.player_slot[4]))
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][4][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, c_white, 1);
				}
				else
				{
					if (global.player_[inp.key][4][1][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][4][2][action.accept] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.accept], get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Show Key A on screen END */
				
			}
		}
		#endregion /* Draw Play the game text END */
		
		#endregion /* Play the game text END */
		
		xx[1] = lerp(xx[1], player_display_x[1], 0.1);
		xx[2] = lerp(xx[2], player_display_x[2], 0.1);
		xx[3] = lerp(xx[3], player_display_x[3], 0.1);
		xx[4] = lerp(xx[4], player_display_x[4], 0.1);
		
		#region /* All code before menu navigation code */
		
		#region /* Select your character text */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (get_window_width <= 1350)
		{
			scr_draw_text_outlined(get_window_width * 0.5 + 128, 70, l10n_text("Select your character!"), global.default_text_size * 2, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5, 70, l10n_text("Select your character!"), global.default_text_size * 2, c_black, c_white, 1);
		}
		#endregion /* Select your character text END */
		
		var back_y = 0;
		var manage_characters_y = 42;
		if (global.enable_manage_characters)
		{
			var draw_online_character_list_y = 42 * 2;
			var draw_search_id_y = 42 * 3;
		}
		else
		{
			var draw_online_character_list_y = 42 * 1;
			var draw_search_id_y = 42 * 2;
		}
		
		#region /* Show Back key when you can go back to main menu */
		if (global.character_select_in_this_menu == "main_game")
		{
			draw_menu_button(0, back_y, l10n_text("Back"), "back_from_character_select", "main_game");
		}
		else
		{
			draw_menu_button(0, back_y, l10n_text("Back"), "back_from_character_select", "level_editor");
		}
		draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
		#endregion /* Show Back key when you can go back to main menu END */
		
		#region /* Manage Characters */
		if (global.enable_manage_characters)
		{
			draw_menu_button(0, manage_characters_y, l10n_text("Manage Characters"), "manage_character", "manage_character");
			if (menu == "manage_character")
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, manage_characters_y + 2, 370, manage_characters_y + 41))
			&& (mouse_check_button_released(mb_left))
			|| (key_a_pressed)
			&& (menu == "manage_character")
			{
				if (global.sprite_select_player[1] < 0)
				|| (global.sprite_select_player[1] == spr_noone)
				{
					global.sprite_select_player[1] = spr_noone;
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
				}
				
				menu = "click_copy_character";
				menu_delay = 3;
			}
		}
		#endregion /* Manage Characters END */
		
		#region /* Online Character List Button */
		if (global.free_communication_available)
		{
			draw_menu_button(0, draw_online_character_list_y, l10n_text("Online Character List"), "online_character_list", "online_character_list");
			if (max_custom_characters_reached)
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, 0, draw_online_character_list_y + 21, 1, 1, 0, c_dkgray, 0.5);
				draw_sprite_ext(spr_lock_icon, 0, 16, draw_online_character_list_y + 21, 1, 1, 0, c_white, 1);
			}
			
			if (can_input_player1_name == false)
			&& (can_input_player2_name == false)
			&& (can_input_player3_name == false)
			&& (can_input_player4_name == false)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_sub_menu)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, draw_online_character_list_y + 2, 370, draw_online_character_list_y + 41))
				&& (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!max_custom_characters_reached)
				|| (menu == "online_character_list")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				&& (!max_custom_characters_reached)
				{
					if (global.online_enabled)
					{
						/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
						select_custom_level_menu_open = false;
						content_type = "character"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
						global.selected_online_download_index = 1;
						menu = "online_download_list_load";
					}
					else
					{
						content_type = "character"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
						caution_online_takes_you_to = "online_download_list_load";
						caution_online_takes_you_back_to = "online_character_list";
						menu = "caution_online_proceed";
						menu_delay = 3;
					}
				}
			}
		}
		#endregion /* Online Character List Button END */
		
		#endregion /* All code before menu navigation code END */
		
		#region /* If players haven't joined the game */
		if (can_input_player1_name == false)
		&& (can_input_player2_name == false)
		&& (can_input_player3_name == false)
		&& (can_input_player4_name == false)
		{
			
			#region /* Player 1 Join Text */
			if (player1_accept_selection <= -1 && !player1_automatically_join)
			{
				var player_join_x = window_width_half + player_display_x[1];
				var player_join_y = window_height_half;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_navigation == "mouse")
				{
					player_menu[1] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_roundrect_color_ext(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, 50, 50, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 1 Join"), global.default_text_size, player_join_outline_color, global.player_color[1], 1);
				
				#region /* Key A */
				var player1_key_accept_1 = global.player_[inp.key][1][1][action.accept];
				var player1_key_accept_2 = global.player_[inp.key][1][2][action.accept];
				if ((menu == "select_character" && global.controls_used_for_navigation != "mouse") || global.controls_used_for_navigation == "mouse")
				{
					if (gamepad_is_connected(global.player_slot[1]) && (global.controls_used_for_navigation == "gamepad" || global.always_show_gamepad_buttons))
					{
						scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
					}
					else
					{
						var keyboard_sprite_index = 0;
						if (player1_key_accept_1 > noone)
						{
							keyboard_sprite_index = player1_key_accept_1;
						}
						else if (player1_key_accept_2 > noone)
						{
							keyboard_sprite_index = player1_key_accept_2;
						}
						if (keyboard_sprite_index > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 1 Join Text END */
			
			#region /* Player 2 Join Text */
			if (player2_accept_selection <= -1 && !player2_automatically_join && (global.playergame >= 1 || global.skip_how_many_people_are_playing_screen))
			{
				var player_join_x = window_width_half + player_display_x[2];
				var player_join_y = window_height_half + 32;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_navigation == "mouse")
				{
					player_menu[2] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_roundrect_color_ext(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, 50, 50, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 2 Join"), global.default_text_size, player_join_outline_color, global.player_color[2], 1);
				
				#region /* Key A */
				var controls_used_for_navigation = global.controls_used_for_navigation;
				var player2_key_accept_1 = global.player_[inp.key][2][1][action.accept];
				var player2_key_accept_2 = global.player_[inp.key][2][2][action.accept];
				if (gamepad_is_connected(global.player_slot[2]) || global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][2][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
				}
				else
				{
					var keyboard_sprite_index = 0;
					if (player2_key_accept_1 > noone)
					{
						keyboard_sprite_index = player2_key_accept_1;
					}
					else if (player2_key_accept_2 > noone)
					{
						keyboard_sprite_index = player2_key_accept_2;
					}
					if (keyboard_sprite_index > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 2 Join Text END */
			
			#region /* Player 3 Join Text */
			if (player3_accept_selection <= -1 && !player3_automatically_join && (global.playergame >= 2 || global.skip_how_many_people_are_playing_screen))
			{
				var player_join_x = window_width_half + player_display_x[3];
				var player_join_y = window_height_half;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_navigation == "mouse")
				{
					player_menu[3] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_roundrect_color_ext(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, 50, 50, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 3 Join"), global.default_text_size, player_join_outline_color, global.player_color[3], 1);
				
				#region /* Key A */
				var controls_used_for_navigation = global.controls_used_for_navigation;
				var player3_key_accept_1 = global.player_[inp.key][3][1][action.accept];
				var player3_key_accept_2 = global.player_[inp.key][3][2][action.accept];
				if (gamepad_is_connected(global.player_slot[3]) || global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][3][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
				}
				else
				{
					var keyboard_sprite_index = 0;
					if (player3_key_accept_1 > noone)
					{
						keyboard_sprite_index = player3_key_accept_1;
					}
					else if (player3_key_accept_2 > noone)
					{
						keyboard_sprite_index = player3_key_accept_2;
					}
					if (keyboard_sprite_index > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 3 Join Text END */
			
			#region /* Player 4 Join Text */
			if (player4_accept_selection <= -1 && !player4_automatically_join && (global.playergame >= 3 || global.skip_how_many_people_are_playing_screen))
			{
				var player_join_x = window_width_half + player_display_x[4];
				var player_join_y = window_height_half + 32;
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_navigation == "mouse")
				{
					player_menu[4] = "select_character";
					menu = "select_character";
					draw_set_alpha(0.5);
					draw_roundrect_color_ext(player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32, 50, 50, c_white, c_white, false);
					draw_set_alpha(1);
					var player_join_outline_color = c_white;
				}
				else
				{
					var player_join_outline_color = c_black;
				}
				scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player 4 Join"), global.default_text_size, player_join_outline_color, global.player_color[4], 1);
				
				#region /* Key A */
				var controls_used_for_navigation = global.controls_used_for_navigation;
				var player4_key_accept_1 = global.player_[inp.key][4][1][action.accept];
				var player4_key_accept_2 = global.player_[inp.key][4][2][action.accept];
				if (gamepad_is_connected(global.player_slot[4]) || global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(global.player_[inp.gp][4][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
				}
				else
				{
					var keyboard_sprite_index = 0;
					if (player4_key_accept_1 > noone)
					{
						keyboard_sprite_index = player4_key_accept_1;
					}
					else if (player4_key_accept_2 > noone)
					{
						keyboard_sprite_index = player4_key_accept_2;
					}
					if (keyboard_sprite_index > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, keyboard_sprite_index, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, player_join_x + 90, player_join_y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 4 Join Text END */
			
		}
		#endregion /* If players haven't joined the game END */
		
		if (ds_list_size(global.all_loaded_characters) >= global.max_custom_characters) /* If there are more than a certain amount of characters stored, warn player about there being too many characters */
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 16, l10n_text("There are too many characters stored! Delete some characters in Manage Characters"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 16, l10n_text("There are too many characters stored! Delete some characters in Manage Characters"), global.default_text_size * 0.75, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
		}
		
	}
	else
	
	#region /* Draw Manage Characters Menu */
	{
		scr_character_manage_menu_draw();
	}
	#endregion /* Draw Manage Characters Menu END */
	
}