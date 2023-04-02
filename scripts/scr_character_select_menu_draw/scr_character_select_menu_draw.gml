function scr_character_select_menu_draw()
{
	/* Player 1 Key Accept Pressed */ player1_key_a_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_accept)) or (keyboard_check_pressed(global.player1_key_accept)) or (keyboard_check_pressed(global.player1_key2_accept)) or (keyboard_check_pressed(vk_space));
	/* Player 1 Key Back Pressed */ player1_key_b_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_back)) or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_back)) or (keyboard_check_pressed(global.player1_key_back)) or (keyboard_check_pressed(global.player1_key2_back)) or (keyboard_check_pressed(vk_escape));
	/* Player 2 Key Accept Pressed */ player2_key_a_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_accept)) or (keyboard_check_pressed(global.player2_key_accept)) or (keyboard_check_pressed(global.player2_key2_accept));
	/* Player 2 Key Back Pressed */ player2_key_b_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_back)) or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_back)) or (keyboard_check_pressed(global.player2_key_back)) or (keyboard_check_pressed(global.player2_key2_back));
	/* Player 3 Key Accept Pressed */ player3_key_a_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_accept)) or (keyboard_check_pressed(global.player3_key_accept)) or (keyboard_check_pressed(global.player3_key2_accept));
	/* Player 3 Key Back Pressed */ player3_key_b_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_back)) or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_back)) or (keyboard_check_pressed(global.player3_key_back)) or (keyboard_check_pressed(global.player3_key2_back));
	/* Player 4 Key Accept Pressed */ player4_key_a_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_accept)) or (keyboard_check_pressed(global.player4_key_accept)) or (keyboard_check_pressed(global.player4_key2_accept));
	/* Player 4 Key Back Pressed */ player4_key_b_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_back)) or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_back)) or (keyboard_check_pressed(global.player4_key_back)) or (keyboard_check_pressed(global.player4_key2_back));
	
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
		if (global.skip_how_many_people_are_playing_screen == false)
		{
			
			#region /* "How many people are playing?" text */
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, 70, l10n_text("How many people are playing?"), global.default_text_size * 2, c_black, c_white, 1);
			#endregion /* "How many people are playing?" text END */
			
			#region /* Show Back key when you can go back to main menu */
			if (global.character_select_in_this_menu == "main_game")
			{
				draw_menu_button(0, 0, l10n_text("Back"), "how_many_people_back", "main_game");
			}
			else
			{
				draw_menu_button(0, 0, l10n_text("Back"), "how_many_people_back", "leveleditor");
			}
			draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
			#endregion /* Show Back key when you can go back to main menu END */
			
			#region /* How many players buttons */
			var menu_button_1player_x = get_window_width * 0.5 - 340 - 84;
			var menu_button_2player_x = get_window_width * 0.5 - 116 - 84;
			var menu_button_3player_x = get_window_width * 0.5 + 116 - 84;
			var menu_button_4player_x = get_window_width * 0.5 + 340 - 84;
			
			draw_menu_button_sprite(global.resource_pack_sprite_menu_button_1player, menu_button_1player_x, get_window_height * 0.5 - 84, 84, 84 - 16, 1, 1, 169, 169, "", "how_many_people_1player", "load_characters", true);
			draw_menu_button_sprite(global.resource_pack_sprite_menu_button_2player, menu_button_2player_x, get_window_height * 0.5 - 84, 84, 84 - 16, 1, 1, 169, 169, "", "how_many_people_2player", "load_characters", true);
			draw_menu_button_sprite(global.resource_pack_sprite_menu_button_3player, menu_button_3player_x, get_window_height * 0.5 - 84, 84, 84 - 16, 1, 1, 169, 169, "", "how_many_people_3player", "load_characters", true);
			draw_menu_button_sprite(global.resource_pack_sprite_menu_button_4player, menu_button_4player_x, get_window_height * 0.5 - 84, 84, 84 - 16, 1, 1, 169, 169, "", "how_many_people_4player", "load_characters", true);
			#endregion /* How many players buttons END */
			
		}
	}
	#endregion /* "How many people are playing?" menu END */
	
	if (menu == "select_character")
	or (menu == "back_from_character_select")
	or (menu == "open_custom_characters_folder")
	or (menu == "copy_character")
	or (menu == "search_character_id")
	or (menu == "input_name_ok")
	or (menu == "input_name_cancel")
	{
		
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
		
		#region /* Give feedback that you have selected a character, run this before the character portrait code */
		if (asset_get_type("spr_select_character_background") == asset_sprite)
		{
			if (player1_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player1_display_x, get_window_height * 0.5, player1_scale, player1_scale, 0, global.player1_color, 1);
			}
			if (player2_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player2_display_x, get_window_height * 0.5, player2_scale, player2_scale, 0, global.player2_color, 1);
			}
			if (player3_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player3_display_x, get_window_height * 0.5, player3_scale, player3_scale, 0, global.player3_color, 1);
			}
			if (player4_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player4_display_x, get_window_height * 0.5, player4_scale, player4_scale, 0, global.player4_color, 1);
			}
		}
		#endregion /* Give feedback that you have selected a character, run this before the character portrait code END */
		
		#region /* Display Selected Characters, run this before the "play the game" text code */
		if (global.playergame >= 0)
		or (global.skip_how_many_people_are_playing_screen == true)
		{
			scr_draw_character_portrait_for_player(1);
		}
		if (global.playergame >= 1)
		or (global.skip_how_many_people_are_playing_screen == true)
		{
			scr_draw_character_portrait_for_player(2);
		}
		if (global.playergame >= 2)
		or (global.skip_how_many_people_are_playing_screen == true)
		{
			scr_draw_character_portrait_for_player(3);
		}
		if (global.playergame >= 3)
		or (global.skip_how_many_people_are_playing_screen == true)
		{
			scr_draw_character_portrait_for_player(4);
		}
		#endregion /* Display Selected Characters, run this before the "play the game" text code END */
		
		#region /* Play the game text */
		if (player_start_game == true)
		{
			if (can_input_player1_name == false)
			and (can_input_player2_name == false)
			and (can_input_player3_name == false)
			and (can_input_player4_name == false)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				if (variable_instance_exists(self, "play_the_game_text_y"))
				and (point_in_rectangle(mouse_get_x, mouse_get_y, 0, play_the_game_text_y - 32, get_window_width, play_the_game_text_y + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_rectangle_color(0, play_the_game_text_y - 32 - 4, get_window_width, play_the_game_text_y + 32 + 4, c_red, c_yellow, c_yellow, c_red, false);
				}
				if (variable_instance_exists(self, "play_the_game_text_y"))
				{
					draw_rectangle_color(0, play_the_game_text_y - 32, get_window_width, play_the_game_text_y + 32, c_black, c_black, c_black, c_black, false);
					scr_draw_text_outlined(get_window_width * 0.5 -40, play_the_game_text_y, l10n_text("Play the game!"), global.default_text_size * 2, c_black, c_white, 1);
				}
				
				if (variable_instance_exists(self, "play_the_game_text_y"))
				and (player1_accept_selection == true)
				and (player2_accept_selection != 0)
				and (player3_accept_selection != 0)
				and (player4_accept_selection != 0)
				{
					draw_set_alpha(0.9);
					draw_rectangle_color(get_window_width * 0.5 - (string_width(l10n_text("Player 1 starts the game")) * 0.5), play_the_game_text_y + 32, get_window_width * 0.5 + (string_width(l10n_text("Player 1 starts the game")) * 0.5), play_the_game_text_y + 64, c_black, c_black, c_black, c_black, false);
					draw_set_alpha(1);
					scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y + 45, l10n_text("Player 1 starts the game"), global.default_text_size, c_black, global.player1_color, 1);
					
					#region /* Show Key A on screen */
					if (gamepad_is_connected(global.player1_slot))
					and (global.controls_used_for_menu_navigation == "controller")
					or (global.always_show_gamepad_buttons == true)
					{
						scr_draw_gamepad_buttons(global.player1_gamepad_button_accept, get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y, 0.5, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player1_key_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key_accept, get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player1_key2_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key2_accept, get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
					}
					#endregion /* Show Key A on screen END */
						
				}
				else
				if (variable_instance_exists(self, "play_the_game_text_y"))
				and (player1_accept_selection != 0)
				and (player2_accept_selection == true)
				and (player3_accept_selection != 0)
				and (player4_accept_selection != 0)
				{
					scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y + 45, l10n_text("Player 2 starts the game"), global.default_text_size, c_black, global.player2_color, 1);
						
					#region /* Show Key A on screen */
					if (gamepad_is_connected(global.player2_slot))
					{
						scr_draw_gamepad_buttons(global.player2_gamepad_button_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player2_key_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player2_key_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player2_key2_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player2_key2_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
					}
					#endregion /* Show Key A on screen END */
						
				}
				else
				if (variable_instance_exists(self, "play_the_game_text_y"))
				and (player1_accept_selection != 0)
				and (player2_accept_selection != 0)
				and (player3_accept_selection == true)
				and (player4_accept_selection != 0)
				{
					scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y + 45, l10n_text("Player 3 starts the game"), global.default_text_size, c_black, global.player3_color, 1);
						
					#region /* Show Key A on screen */
					if (gamepad_is_connected(global.player3_slot))
					{
						scr_draw_gamepad_buttons(global.player3_gamepad_button_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player3_key_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player3_key_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player3_key2_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player3_key2_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
					}
					#endregion /* Show Key A on screen END */
						
				}
				else
				if (variable_instance_exists(self, "play_the_game_text_y"))
				and (player1_accept_selection != 0)
				and (player2_accept_selection != 0)
				and (player3_accept_selection != 0)
				and (player4_accept_selection == true)
				{
					scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y + 45, l10n_text("Player 4 starts the game"), global.default_text_size, c_black, global.player4_color, 1);
						
					#region /* Show Key A on screen */
					if (gamepad_is_connected(global.player4_slot))
					{
						scr_draw_gamepad_buttons(global.player4_gamepad_button_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player4_key_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player4_key_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player4_key2_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player4_key2_accept, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
							}
						}
					}
					#endregion /* Show Key A on screen END */
						
				}
			}
		}
		#endregion /* Play the game text END */
		
		xx1 = lerp(xx1, player1_display_x, 0.1);
		xx2 = lerp(xx2, player2_display_x, 0.1);
		xx3 = lerp(xx3, player3_display_x, 0.1);
		xx4 = lerp(xx4, player4_display_x, 0.1);
		play_the_game_text_y = 125;
		
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
		
		#region /* Show Back key when you can go back to main menu */
		if (global.character_select_in_this_menu == "main_game")
		{
			draw_menu_button(0, 0, l10n_text("Back"), "back_from_character_select", "main_game");
		}
		else
		{
			draw_menu_button(0, 0, l10n_text("Back"), "back_from_character_select", "leveleditor");
		}
		draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
		#endregion /* Show Back key when you can go back to main menu END */
		
		#region /* Open Custom Levels Folder */
		if (global.enable_open_custom_folder == true)
		{
			draw_menu_button(0, 42, l10n_text("Open Character Folder"), "open_custom_characters_folder", "open_custom_characters_folder");
			draw_sprite_ext(spr_icons_folder, 0, 16, 42 + 21, 1, 1, 0, c_white, 1);
		}
		#endregion /* Open Custom Levels Folder END */
		
		#region /* Copy Characters */
		if (global.enable_copy_characters == true)
		{
			if (global.enable_open_custom_folder == true)
			{
				draw_menu_button(0, 42 + 42, l10n_text("Copy Characters"), "copy_character", "click_copy_character");
			}
			else
			{
				draw_menu_button(0, 42, l10n_text("Copy Characters"), "copy_character", "click_copy_character");
			}
		}
		#endregion /* Copy Characters END */
		
		#region /* Search Character ID Button */
		if (global.enable_open_custom_folder == true)
		{
			var draw_search_id_y = 42 * 3;
		}
		else
		{
			var draw_search_id_y = 42 * 2;
		}
		draw_menu_button(0, draw_search_id_y, l10n_text("Search Character ID"), "search_character_id", "search_character_id");
		
		#region /* Draw Search Key */
		if (gamepad_is_connected(global.player1_slot))
		and (global.controls_used_for_menu_navigation == "controller")
		or (global.always_show_gamepad_buttons == true)
		{
			scr_draw_gamepad_buttons(gp_face4, 16, draw_search_id_y + 21, 0.5, c_white, 1);
		}
		#endregion /* Draw Search key END */
		
		if (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		and (menu_delay == 0)
		and (open_sub_menu == false)
		{
			if (menu == "search_character_id")
			and (key_a_released)
			or (gamepad_button_check_released(global.player1_slot, gp_face4))
			or (gamepad_button_check_released(global.player2_slot, gp_face4))
			or (gamepad_button_check_released(global.player3_slot, gp_face4))
			or (gamepad_button_check_released(global.player4_slot, gp_face4))
			or (gamepad_button_check_released(4, gp_face4))
			or (point_in_rectangle(mouse_get_x, mouse_get_y, 0, draw_search_id_y + 2, 370, draw_search_id_y + 41))
			and (mouse_check_button_released(mb_left))
			{
				keyboard_string = "";
				search_id = "";
				content_type = "character";
				menu = "search_id_ok";
				select_custom_level_menu_open = false;
				menu_delay = 3;
			}
		}
		if (menu == "search_level_id")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "online_level_list";
			lerp_on = true;
		}
		if (menu == "search_level_id")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (show_level_editor_corner_menu == true)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
			scroll_to = floor(global.select_level_index / row);
			lerp_on = true;
		}
		if (menu == "search_level_id")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Search Character ID Button END */
		
		#endregion /* All code before menu navigation code END */
		
		#region /* If players haven't joined the game */
		if (can_input_player1_name == false)
		and (can_input_player2_name == false)
		and (can_input_player3_name == false)
		and (can_input_player4_name == false)
		{
			
			#region /* Player 1 Join Text */
			if (player1_accept_selection <= -1)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player1_display_x + 150, get_window_height * 0.5 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_set_alpha(0.5);
					draw_rectangle_color(get_window_width * 0.5 + player1_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player1_display_x + 150, get_window_height * 0.5 + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					scr_draw_text_outlined(get_window_width * 0.5 + player1_display_x + 60, get_window_height * 0.5, l10n_text("Player 1 Join"), global.default_text_size, c_white, global.player1_color, 1);
				}
				else
				{
					scr_draw_text_outlined(get_window_width * 0.5 + player1_display_x + 60, get_window_height * 0.5, l10n_text("Player 1 Join"), global.default_text_size, c_black, global.player1_color, 1);
				}
				
				#region /* Key A */
				if (menu != "back_from_character_select")
				and (player1_menu != "back_from_character_select")
				and (menu != "open_custom_characters_folder")
				and (player1_menu != "open_custom_characters_folder")
				and (menu != "copy_character")
				and (player1_menu != "copy_character")
				and (global.controls_used_for_menu_navigation != "mouse")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (gamepad_is_connected(global.player1_slot))
					and (global.controls_used_for_menu_navigation == "controller")
					{
						scr_draw_gamepad_buttons(global.player1_gamepad_button_accept, get_window_width * 0.5 + player1_display_x + 90, get_window_height * 0.5, 0.5, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player1_key_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key_accept, get_window_width * 0.5 + player1_display_x + 90, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player1_key2_accept > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key2_accept, get_window_width * 0.5 + player1_display_x + 90, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player1_display_x + 90, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
							}
						}
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 1 Join Text END */
			
			#region /* Player 2 Join Text */
			if (player2_accept_selection <= -1)
			and (global.playergame >= 1)
			or (player2_accept_selection <= -1)
			and (global.skip_how_many_people_are_playing_screen == true)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player2_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player2_display_x + 150, get_window_height * 0.5 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_set_alpha(0.5);
					draw_rectangle_color(get_window_width * 0.5 + player2_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player2_display_x + 150, get_window_height * 0.5 + 32 + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					scr_draw_text_outlined(get_window_width * 0.5 + player2_display_x + 60, get_window_height * 0.5 + 32, l10n_text("Player 2 Join"), global.default_text_size, c_white, global.player2_color, 1);
				}
				else
				{
					scr_draw_text_outlined(get_window_width * 0.5 + player2_display_x + 60, get_window_height * 0.5 + 32, l10n_text("Player 2 Join"), global.default_text_size, c_black, global.player2_color, 1);
				}
				
				#region /* Key A */
				if (gamepad_is_connected(global.player2_slot))
				{
					scr_draw_gamepad_buttons(global.player2_gamepad_button_accept, get_window_width * 0.5 + player2_display_x + 90, get_window_height * 0.5 + 32, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player2_key_accept > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key_accept, get_window_width * 0.5 + player2_display_x + 90, get_window_height * 0.5 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key2_accept > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key2_accept, get_window_width * 0.5 + player2_display_x + 90, get_window_height * 0.5 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player2_display_x + 90, get_window_height * 0.5 + 32, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
		
			}
			#endregion /* Player 2 Join Text END */
			
			#region /* Player 3 Join Text */
			if (player3_accept_selection <= -1)
			and (global.playergame >= 2)
			or (player3_accept_selection <= -1)
			and (global.skip_how_many_people_are_playing_screen == true)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player3_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player3_display_x + 150, get_window_height * 0.5 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_set_alpha(0.5);
					draw_rectangle_color(get_window_width * 0.5 + player3_display_x - 150, get_window_height * 0.5 - 32, get_window_width * 0.5 + player3_display_x + 150, get_window_height * 0.5 + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					scr_draw_text_outlined(get_window_width * 0.5 + player3_display_x + 60, get_window_height * 0.5, l10n_text("Player 3 Join"), global.default_text_size, c_white, global.player3_color, 1);
				}
				else
				{
					scr_draw_text_outlined(get_window_width * 0.5 + player3_display_x + 60, get_window_height * 0.5, l10n_text("Player 3 Join"), global.default_text_size, c_black, global.player3_color, 1);
				}
				
				#region /* Key A */
				if (gamepad_is_connected(global.player3_slot))
				{
					scr_draw_gamepad_buttons(global.player3_gamepad_button_accept, get_window_width * 0.5 + player3_display_x + 90, get_window_height * 0.5, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player3_key_accept > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key_accept, get_window_width * 0.5 + player3_display_x + 90, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key2_accept > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key2_accept, get_window_width * 0.5 + player3_display_x + 90, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player3_display_x + 90, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 3 Join Text END */
			
			#region /* Player 4 Join Text */
			if (player4_accept_selection <= -1)
			and (global.playergame >= 3)
			or (player4_accept_selection <= -1)
			and (global.skip_how_many_people_are_playing_screen == true)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player4_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player4_display_x + 150, get_window_height * 0.5 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					draw_set_alpha(0.5);
					draw_rectangle_color(get_window_width * 0.5 + player4_display_x - 150, get_window_height * 0.5 + 32 - 32, get_window_width * 0.5 + player4_display_x + 150, get_window_height * 0.5 + 32 + 32, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
					scr_draw_text_outlined(get_window_width * 0.5 + player4_display_x + 60, get_window_height * 0.5 + 32, l10n_text("Player 4 Join"), global.default_text_size, c_white, global.player4_color, 1);
				}
				else
				{
					scr_draw_text_outlined(get_window_width * 0.5 + player4_display_x + 60, get_window_height * 0.5 + 32, l10n_text("Player 4 Join"), global.default_text_size, c_black, global.player4_color, 1);
				}
				
				#region /* Key A */
				if (gamepad_is_connected(global.player4_slot))
				{
					scr_draw_gamepad_buttons(global.player4_gamepad_button_accept, get_window_width * 0.5 + player4_display_x + 90, get_window_height * 0.5 + 32, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player4_key_accept > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key_accept, get_window_width * 0.5 + player4_display_x + 90, get_window_height * 0.5 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key2_accept > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key2_accept, get_window_width * 0.5 + player4_display_x + 90, get_window_height * 0.5 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player4_display_x + 90, get_window_height * 0.5 + 32, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
				
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
		
		#region /* Draw Character Portrait for Player 1 */
		if (global.sprite_select_player_1 > 0)
		{
			draw_sprite_ext(global.sprite_select_player_1, 0, get_window_width * 0.5 +xx1, get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, global.hex_color_for_player_1, 1);
		}
		var uppercase_character_name;
		uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 1));
		uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))) - 1);
		var character_name = string(uppercase_character_name);
		scr_draw_text_outlined(get_window_width * 0.5 +xx1, get_window_height * 0.5 + 232, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		#endregion /* Draw Character Portrait for Player 1 END */
		
		#region /* Player 1 */
		
		#region /* Key Left */
		if (global.character_index[0] > 0)
		and (can_navigate == true)
		{
			if (gamepad_is_connected(global.player1_slot))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padl, get_window_width * 0.5 + player1_display_x - arrow_offset, get_window_height * 0.5, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player1_key_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, get_window_width * 0.5 + player1_display_x - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player1_key2_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, get_window_width * 0.5 + player1_display_x - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player1_display_x - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
					
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player1_display_x - arrow_offset + 16, get_window_height * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width * 0.5 + player1_display_x - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player1_display_x - arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Left END */
		
		#region /* Key Right */
		if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
		and (can_navigate == true)
		{
			if (gamepad_is_connected(global.player1_slot))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padr, get_window_width * 0.5 + player1_display_x + arrow_offset, get_window_height * 0.5, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player1_key_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, get_window_width * 0.5 + player1_display_x + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player1_key2_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, get_window_width * 0.5 + player1_display_x + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player1_display_x + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
				
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player1_display_x + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player1_display_x + arrow_offset + 16, get_window_height * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width * 0.5 + player1_display_x + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player1_display_x + arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Right END */
		
		#endregion /* Player 1 END */
		
		scr_draw_text_outlined(get_window_width * 0.5, 128, l10n_text("Copy Characters"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		
		#region /* Copy Characters */
		if (can_navigate == true)
		{
			if (global.enable_open_custom_folder == true)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height - 42 - 42 - 42, l10n_text("Copy Character"), "click_copy_character", "click_copy_character");
			}
			else
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height - 42 - 42, l10n_text("Copy Character"), "click_copy_character", "click_copy_character");
			}
		}
		#endregion /* Copy Characters END */
		
		#region /* Open Character Folder */
		if (can_navigate == true)
		{
			if (global.enable_open_custom_folder == true)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height - 42 - 42, l10n_text("Open Character Folder"), "open_folder_copy_character", "open_folder_copy_character");
				draw_sprite_ext(spr_icons_folder, 0, get_window_width * 0.5 - 185 + 16, get_window_height - 42 - 42 + 21, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Open Character Folder END */
		
		#region /* Back from Copy Characters */
		if (can_navigate == true)
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height - 42, l10n_text("Back"), "back_from_copy_character", "load_characters");
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height - 42 + 21, 1, 1, 0, c_white, 1);
		}
		#endregion /* Back from Copy Characters END */
		
		if (can_navigate == false) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 6), 1, 1, global.loading_spinning_angle, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 5), l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 4), string(file_found), global.default_text_size, c_white, c_black, 1);
		}
	}
}