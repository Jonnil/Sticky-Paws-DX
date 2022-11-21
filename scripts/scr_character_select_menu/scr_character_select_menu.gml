///scr_character_select_menu()
function scr_character_select_menu()
{
	arrow_offset = 125;
	
	if (menu == "select_character")
	or (menu == "back_from_character_select")
	or (menu == "open_custom_characters_folder")
	or (menu == "copy_character")
	or (menu == "input_name_ok")
	or (menu == "input_name_cancel")
	{
		
		#region /* Play the game text */
		if (player_start_game == true)
		and (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			if (can_input_player1_name = false)
			and (can_input_player2_name = false)
			and (can_input_player3_name = false)
			and (can_input_player4_name = false)
			{
				if (obj_camera.iris_xscale >= 1)
				and (obj_camera.iris_yscale >= 1)
				{
					if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, play_the_game_text_y - 32, window_get_width(), play_the_game_text_y + 32))
					and (global.controls_used_for_menu_navigation == "mouse")
					{
						draw_rectangle_color(0, play_the_game_text_y - 32 -4, window_get_width(), play_the_game_text_y + 32 + 4, c_red, c_yellow, c_yellow, c_red, false);
					}
					draw_rectangle_color(0, play_the_game_text_y - 32, window_get_width(), play_the_game_text_y + 32, c_black, c_black, c_black, c_black, false);
					
					scr_draw_text_outlined(window_get_width() / 2 -40, play_the_game_text_y, l10n_text("Play the game!"), global.default_text_size * 2, c_black, c_white, 1);
			
					draw_set_alpha(0.9);
					draw_rectangle_color(window_get_width() / 2 - 168, play_the_game_text_y + 32, window_get_width() / 2 + 168, play_the_game_text_y+64, c_black, c_black, c_black, c_black, false);
					
					draw_set_alpha(1);
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					
					if (player1_accept_selection == true)
					and (player2_accept_selection != 0)
					and (player3_accept_selection != 0)
					and (player4_accept_selection != 0)
					{
						scr_draw_text_outlined(window_get_width() / 2, play_the_game_text_y + 45, l10n_text("Player 1 starts the game"), global.default_text_size, c_black, global.player1_color, 1);
						
						#region /* Show Key A on screen */
						if (gamepad_is_connected(0))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, c_white, 1);
						}
						else
						{
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player1_key_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player1_key2_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
						}
						#endregion /* Show Key A on screen END */
						
					}
					else
					if (player1_accept_selection != 0)
					and (player2_accept_selection == true)
					and (player3_accept_selection != 0)
					and (player4_accept_selection != 0)
					{
						scr_draw_text_outlined(window_get_width() / 2, play_the_game_text_y + 45, l10n_text("Player 2 starts the game"), global.default_text_size, c_black, global.player2_color, 1);
						
						#region /* Show Key A on screen */
						if (gamepad_is_connected(1))
						{
							scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, c_white, 1);
						}
						else
						{
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player2_key_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player2_key2_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
						}
						#endregion /* Show Key A on screen END */
						
					}
					else
					if (player1_accept_selection != 0)
					and (player2_accept_selection != 0)
					and (player3_accept_selection == true)
					and (player4_accept_selection != 0)
					{
						scr_draw_text_outlined(window_get_width() / 2, play_the_game_text_y + 45, l10n_text("Player 3 starts the game"), global.default_text_size, c_black, global.player3_color, 1);
						
						#region /* Show Key A on screen */
						if (gamepad_is_connected(2))
						{
							scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, c_white, 1);
						}
						else
						{
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player3_key_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player3_key2_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
						}
						#endregion /* Show Key A on screen END */
						
					}
					else
					if (player1_accept_selection != 0)
					and (player2_accept_selection != 0)
					and (player3_accept_selection != 0)
					and (player4_accept_selection == true)
					{
						scr_draw_text_outlined(window_get_width() / 2, play_the_game_text_y + 45, l10n_text("Player 4 starts the game"), global.default_text_size, c_black, global.player4_color, 1);
						
						#region /* Show Key A on screen */
						if (gamepad_is_connected(3))
						{
							scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, c_white, 1);
						}
						else
						{
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player4_key_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player4_key2_jump > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + 180, play_the_game_text_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
						}
						#endregion /* Show Key A on screen END */
						
					}
				}
			}
		}
		#endregion /* Play the game text END */
		
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
		
		#region /* Select your character text */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (window_get_width() <= 1350)
		{
			scr_draw_text_outlined(window_get_width() / 2 + 128, 70, l10n_text("Select your character!"), global.default_text_size * 2, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(window_get_width() / 2, 70, l10n_text("Select your character!"), global.default_text_size * 2, c_black, c_white, 1);
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
		if (player1_menu = "back_from_character_select")
		{
			if (keyboard_check_pressed(global.player1_key_down))
			and (!keyboard_check_pressed(global.player1_key_up))
			or (keyboard_check_pressed(global.player1_key2_down))
			and (!keyboard_check_pressed(global.player1_key2_up))
			or (gamepad_button_check_pressed(0, gp_padd))
			and (!gamepad_button_check_pressed(0, gp_padu))
			or (gamepad_axis_value(0, gp_axislv) > 0)
			and (menu_joystick1_delay <= 0)
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (menu_delay == 0)
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
			}
		}
		else
		if (player1_menu = "open_custom_characters_folder")
		{
			if (keyboard_check_pressed(global.player1_key_down))
			and (!keyboard_check_pressed(global.player1_key_up))
			or (keyboard_check_pressed(global.player1_key2_down))
			and (!keyboard_check_pressed(global.player1_key2_up))
			or (gamepad_button_check_pressed(0, gp_padd))
			and (!gamepad_button_check_pressed(0, gp_padu))
			or (gamepad_axis_value(0, gp_axislv) > 0)
			and (menu_joystick1_delay <= 0)
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (menu_delay == 0)
				{
					menu_delay = 3;
					if (global.enable_copy_characters == true)
					{
						player1_menu = "copy_character";
						menu = "copy_character";
					}
					else
					{
						player1_menu = "back_from_character_select";
						menu = "back_from_character_select";
					}
				}
			}
		}
		#endregion /* Show Back key when you can go back to main menu END */
		
		#region /* Open Custom Levels Folder */
		if (global.enable_open_custom_folder == true)
		{
			draw_menu_button(0, 42, l10n_text("Open Character Folder"), "open_custom_characters_folder", "open_custom_characters_folder");
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, 42 + 2, 371, 42 + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (menu == "open_custom_characters_folder")
		and (key_a_pressed)
		and (menu_delay == 0)
		or (player1_menu = "open_custom_characters_folder")
		and (key_a_pressed)
		and (menu_delay == 0)
		{
			scr_open_folder(game_save_id + "\custom_characters")
		}
		if (menu == "open_custom_characters_folder")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "back_from_character_select";
			menu = "back_from_character_select";
		}
		if (menu == "open_custom_characters_folder")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
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
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, 42 + 2 + 42, 371, 42 + 41 + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		or (menu == "copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		or (player1_menu = "copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		{
			file_load_timer = 0;
			load_ok = 0;
			menu = "click_copy_character";
			menu_delay = 3;
		}
		if (menu == "copy_character")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
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
		if (menu == "copy_character")
		and (key_down)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "select_character";
			menu = "select_character";
		}
		#endregion /* Copy Characters END */
		
		#region /* Positions and Scale for each character display */
		
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
		
		#endregion /* Positions and Scale for each character display */
		
		#region /* Give feedback that you have selected a character */
		if (asset_get_type("spr_select_character_background") == asset_sprite)
		{
			if (player1_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, window_get_width() / 2 + player1_display_x, window_get_height() / 2, player1_scale, player1_scale, 0, global.player1_color, 1);
			}
			if (player2_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, window_get_width() / 2 + player2_display_x, window_get_height() / 2, player2_scale, player2_scale, 0, global.player2_color, 1);
			}
			if (player3_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, window_get_width() / 2 + player3_display_x, window_get_height() / 2, player3_scale, player3_scale, 0, global.player3_color, 1);
			}
			if (player4_accept_selection == true)
			{
				draw_sprite_ext(spr_select_character_background, image_index, window_get_width() / 2 + player4_display_x, window_get_height() / 2, player4_scale, player4_scale, 0, global.player4_color, 1);
			}
		}
		#endregion /* Give feedback that you have selected a character END */
		
		#region /* Display Selected Characters */
		
		#region /* Draw Character Portrait for Player 1 */
		if (global.sprite_select_player_1 > 0)
		and (player1_accept_selection >= 0)
		{
			draw_sprite_ext(global.sprite_select_player_1, 0, window_get_width() / 2 +xx1, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, global.hex_color_for_player_1, 1);
			if (can_input_player1_name == true)
			or (can_input_player2_name == true)
			or (can_input_player3_name == true)
			or (can_input_player4_name == true)
			{
				draw_sprite_ext(global.sprite_select_player_1, 0, window_get_width() / 2 +xx1, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, c_black, 0.5);
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			var uppercase_character_name;
			uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 1));
			uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))) - 1);
			var character_name = string(uppercase_character_name);
			scr_draw_text_outlined(window_get_width() / 2 +xx1, window_get_height() / 2 + 364, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Draw Character Portrait for Player 1 END */
		
		#region /* Draw Character Portrait for Player 2 */
		if (global.sprite_select_player_2 > 0)
		and (player2_accept_selection >= 0)
		{
			draw_sprite_ext(global.sprite_select_player_2, 0, window_get_width() / 2 +xx2, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_2), 392 / sprite_get_width(global.sprite_select_player_2), 0, global.hex_color_for_player_2, 1);
			if (can_input_player1_name == true)
			or (can_input_player2_name == true)
			or (can_input_player3_name == true)
			or (can_input_player4_name == true)
			{
				draw_sprite_ext(global.sprite_select_player_2, 0, window_get_width() / 2 +xx2, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_2), 392 / sprite_get_width(global.sprite_select_player_2), 0, c_black, 0.5);
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			var uppercase_character_name;
			uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])), 1));
			uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[1]))) - 1);
			var character_name = string(uppercase_character_name);
			scr_draw_text_outlined(window_get_width() / 2 +xx2, window_get_height() / 2 + 364, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Draw Character Portrait for Player 2 END */
		
		#region /* Draw Character Portrait for Player 3 */
		if (global.sprite_select_player_3 > 0)
		and (player3_accept_selection >= 0)
		{
			draw_sprite_ext(global.sprite_select_player_3, 0, window_get_width() / 2 +xx3, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_3), 392 / sprite_get_width(global.sprite_select_player_3), 0, global.hex_color_for_player_3, 1);
			if (can_input_player1_name == true)
			or (can_input_player2_name == true)
			or (can_input_player3_name == true)
			or (can_input_player4_name == true)
			{
				draw_sprite_ext(global.sprite_select_player_3, 0, window_get_width() / 2 +xx3, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_3), 392 / sprite_get_width(global.sprite_select_player_3), 0, c_black, 0.5);
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			var uppercase_character_name;
			uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])), 1));
			uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[2]))) - 1);
			var character_name = string(uppercase_character_name);
			scr_draw_text_outlined(window_get_width() / 2 +xx3, window_get_height() / 2 + 364, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Draw Character Portrait for Player 3 END */
		
		#region /* Draw Character Portrait for Player 4 */
		if (global.sprite_select_player_4 > 0)
		and (player4_accept_selection >= 0)
		{
			draw_sprite_ext(global.sprite_select_player_4, 0, window_get_width() / 2 +xx4, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_4), 392 / sprite_get_width(global.sprite_select_player_4), 0, global.hex_color_for_player_4, 1);
			if (can_input_player1_name == true)
			or (can_input_player2_name == true)
			or (can_input_player3_name == true)
			or (can_input_player4_name == true)
			{
				draw_sprite_ext(global.sprite_select_player_4, 0, window_get_width() / 2 +xx4, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_4), 392 / sprite_get_width(global.sprite_select_player_4), 0, c_black, 0.5);
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			var uppercase_character_name;
			uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])), 1));
			uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[3]))) - 1);
			var character_name = string(uppercase_character_name);
			scr_draw_text_outlined(window_get_width() / 2 +xx4, window_get_height() / 2 + 364, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /* Draw Character Portrait for Player 4 END */
		
		#endregion /* Display Selected Characters END */
		
		#region /* Display Selected Skin if skins are available */
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
		
			skin_y = 192;
		
			#region /* Player 1 Select Skin */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
			and (player1_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
			and (player1_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player1_display_x, window_get_height() / 2 + skin_y, l10n_text("Skin") + " : " + string(global.skin_for_player_1 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player1_menu = "select_skin")
				or (global.controls_used_for_menu_navigation = "mouse")
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
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
							or (menu_delay == 0)
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
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
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player_1 + 1)))
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
			#endregion /* Player 1 Select Skin END */
		
			#region /* Player 2 Select Skin */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
			and (player2_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
			and (player2_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player2_display_x, window_get_height() / 2 + skin_y, l10n_text("Skin") + " : " + string(global.skin_for_player_2 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player2_menu = "select_skin")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (player2_accept_selection = false)
					{
					
						#region /* Player 2 key left Skin */
						if (keyboard_check_pressed(global.player2_key_left))
						and (!keyboard_check_pressed(global.player2_key_right))
						or (keyboard_check_pressed(global.player2_key2_left))
						and (!keyboard_check_pressed(global.player2_key2_right))
						or (gamepad_button_check_pressed(1, gp_padl))
						and (!gamepad_button_check_pressed(1, gp_padr))
						or (gamepad_axis_value(1, gp_axislh) < 0)
						and (menu_joystick2_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (global.skin_for_player_2 > 0)
							{
								menu_delay = 3;
								menu_joystick2_delay = 30;
								xx2 = player2_display_x - 32;
								global.skin_for_player_2 -= 1;
							
								#region /* Player 2 character select portrait sprite */
								global.sprite_select_player_2 = spr_noone;
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
								#endregion /* Player 2 character select portrait sprite END */
							
							}
						}
						#endregion /* Player 2 key left Skin END */
					
						#region /* Player 2 key right Skin */
						if (keyboard_check_pressed(global.player2_key_right))
						and (!keyboard_check_pressed(global.player2_key_left))
						or (keyboard_check_pressed(global.player2_key2_right))
						and (!keyboard_check_pressed(global.player2_key2_left))
						or (gamepad_button_check_pressed(1, gp_padr))
						and (!gamepad_button_check_pressed(1, gp_padl))
						or (gamepad_axis_value(1, gp_axislh) > 0)
						and (menu_joystick2_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player_2 + 1)))
							or (menu_delay == 0)
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player_2 + 1)))
							{
								menu_delay = 3;
								menu_joystick2_delay = 30;
								xx2 = player2_display_x + 32;
								global.skin_for_player_2 += 1;
							
								#region /* Player 2 character select portrait sprite */
								global.sprite_select_player_2 = spr_noone;
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_2, 1, global.skin_for_player_2);
								global.sprite_select_player_2 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_2, 1, global.skin_for_player_2);
								#endregion /* Player 2 character select portrait sprite END */
							
							}
						}
						#endregion /* Player 2 key right Skin END */
					
						#region /* Player 2 key up Skin */
						if (keyboard_check_pressed(global.player2_key_up))
						and (!keyboard_check_pressed(global.player2_key_down))
						or (keyboard_check_pressed(global.player2_key2_up))
						and (!keyboard_check_pressed(global.player2_key2_down))
						or (gamepad_button_check_pressed(1, gp_padu))
						and (!gamepad_button_check_pressed(1, gp_padd))
						or (gamepad_axis_value(1, gp_axislv) < 0)
						and (menu_joystick2_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick2_delay = 30;
								player2_menu = "select_character";
							}
						}
						#endregion /* Player 2 key up Skin END */
					
						#region /* Player 2 key down Skin */
						if (keyboard_check_pressed(global.player2_key_down))
						and (!keyboard_check_pressed(global.player2_key_up))
						or (keyboard_check_pressed(global.player2_key2_down))
						and (!keyboard_check_pressed(global.player2_key2_up))
						or (gamepad_button_check_pressed(1, gp_padd))
						and (!gamepad_button_check_pressed(1, gp_padu))
						or (gamepad_axis_value(1, gp_axislv) > 0)
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
								{
									player2_menu = "select_name";
								}
							}
						}
						#endregion /* Player 2 key down Skin END */
					
						#region /* Show left key for character skin select */
						if (global.skin_for_player_2 > 0)
						{
							if (gamepad_is_connected(1))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player2_key_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player2_key2_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key2_left, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player2_menu = "select_skin";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show left key for character skin select END */
					
						#region /* Show right key for character skin select */
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player_2 + 1)))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player_2 + 1)))
						{
							if (gamepad_is_connected(1))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player2_key_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player2_key2_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key2_right, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player2_menu = "select_skin";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show right key for character skin select END */
					
					}
				}
			}
			#endregion /* Player 2 Select Skin END */
		
			#region /* Player 3 Select Skin */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
			and (player3_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
			and (player3_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player3_display_x, window_get_height() / 2 + skin_y, l10n_text("Skin") + " : " + string(global.skin_for_player_3 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player3_menu = "select_skin")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (player3_accept_selection = false)
					{
					
						#region /* Player 3 key left Skin */
						if (keyboard_check_pressed(global.player3_key_left))
						and (!keyboard_check_pressed(global.player3_key_right))
						or (keyboard_check_pressed(global.player3_key2_left))
						and (!keyboard_check_pressed(global.player3_key2_right))
						or (gamepad_button_check_pressed(2, gp_padl))
						and (!gamepad_button_check_pressed(2, gp_padr))
						or (gamepad_axis_value(2, gp_axislh) < 0)
						and (menu_joystick3_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (global.skin_for_player_3 > 0)
							{
								menu_delay = 3;
								menu_joystick3_delay = 30;
								xx3 = player3_display_x - 32;
								global.skin_for_player_3 -= 1;
							
								#region /* Player 3 character select portrait sprite */
								global.sprite_select_player_3 = spr_noone;
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
								#endregion /* Player 3 character select portrait sprite END */
							
							}
						}
						#endregion /* Player 3 key left Skin END */
					
						#region /* Player 3 key right Skin */
						if (keyboard_check_pressed(global.player3_key_right))
						and (!keyboard_check_pressed(global.player3_key_left))
						or (keyboard_check_pressed(global.player3_key2_right))
						and (!keyboard_check_pressed(global.player3_key2_left))
						or (gamepad_button_check_pressed(2, gp_padr))
						and (!gamepad_button_check_pressed(2, gp_padl))
						or (gamepad_axis_value(2, gp_axislh) > 0)
						and (menu_joystick3_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player_3 + 1)))
							or (menu_delay == 0)
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player_3 + 1)))
							{
								menu_delay = 3;
								menu_joystick3_delay = 30;
								xx3 = player3_display_x + 32;
								global.skin_for_player_3 += 1;
							
								#region /* Player 3 character select portrait sprite */
								global.sprite_select_player_3 = spr_noone;
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_3, 2, global.skin_for_player_3);
								global.sprite_select_player_3 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_3, 2, global.skin_for_player_3);
								#endregion /* Player 3 character select portrait sprite END */
							
							}
						}
						#endregion /* Player 3 key right Skin END */
					
						#region /* Player 3 key up Skin */
						if (keyboard_check_pressed(global.player3_key_up))
						and (!keyboard_check_pressed(global.player3_key_down))
						or (keyboard_check_pressed(global.player3_key2_up))
						and (!keyboard_check_pressed(global.player3_key2_down))
						or (gamepad_button_check_pressed(2, gp_padu))
						and (!gamepad_button_check_pressed(2, gp_padd))
						or (gamepad_axis_value(2, gp_axislv) < 0)
						and (menu_joystick3_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick3_delay = 30;
								player3_menu = "select_character";
							}
						}
						#endregion /* Player 3 key up Skin END */
					
						#region /* Player 3 key down Skin */
						if (keyboard_check_pressed(global.player3_key_down))
						and (!keyboard_check_pressed(global.player3_key_up))
						or (keyboard_check_pressed(global.player3_key2_down))
						and (!keyboard_check_pressed(global.player3_key2_up))
						or (gamepad_button_check_pressed(2, gp_padd))
						and (!gamepad_button_check_pressed(2, gp_padu))
						or (gamepad_axis_value(2, gp_axislv) > 0)
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
								{
									player3_menu = "select_name";
								}
							}
						}
						#endregion /* Player 3 key down Skin END */
					
						#region /* Show left key for character skin select */
						if (global.skin_for_player_3 > 0)
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player3_key_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player3_key2_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key2_left, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player3_menu = "select_skin";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show left key for character skin select END */
					
						#region /* Show right key for character skin select */
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player_3 + 1)))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player_3 + 1)))
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player3_key_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player3_key2_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key2_right, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player3_menu = "select_skin";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show right key for character skin select END */
					
					}
				}
			}
			#endregion /* Player 3 Select Skin END */
		
			#region /* Player 4 Select Skin */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
			and (player4_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
			and (player4_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player4_display_x, window_get_height() / 2 + skin_y, l10n_text("Skin") + " : " + string(global.skin_for_player_4 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player4_menu = "select_skin")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (player4_accept_selection = false)
					{
					
						#region /* Player 4 key left Skin */
						if (keyboard_check_pressed(global.player4_key_left))
						and (!keyboard_check_pressed(global.player4_key_right))
						or (keyboard_check_pressed(global.player4_key2_left))
						and (!keyboard_check_pressed(global.player4_key2_right))
						or (gamepad_button_check_pressed(2, gp_padl))
						and (!gamepad_button_check_pressed(2, gp_padr))
						or (gamepad_axis_value(2, gp_axislh) < 0)
						and (menu_joystick4_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (global.skin_for_player_4 > 0)
							{
								menu_delay = 3;
								menu_joystick4_delay = 30;
								xx4 = player4_display_x - 32;
								global.skin_for_player_4 -= 1;
							
								#region /* Player 4 character select portrait sprite */
								global.sprite_select_player_4 = spr_noone;
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 2, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 2, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 2, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 2, global.skin_for_player_4);
								#endregion /* Player 4 character select portrait sprite END */
							
							}
						}
						#endregion /* Player 4 key left Skin END */
					
						#region /* Player 4 key right Skin */
						if (keyboard_check_pressed(global.player4_key_right))
						and (!keyboard_check_pressed(global.player4_key_left))
						or (keyboard_check_pressed(global.player4_key2_right))
						and (!keyboard_check_pressed(global.player4_key2_left))
						or (gamepad_button_check_pressed(2, gp_padr))
						and (!gamepad_button_check_pressed(2, gp_padl))
						or (gamepad_axis_value(2, gp_axislh) > 0)
						and (menu_joystick4_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player_4 + 1)))
							or (menu_delay == 0)
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player_4 + 1)))
							{
								menu_delay = 3;
								menu_joystick4_delay = 30;
								xx4 = player4_display_x + 32;
								global.skin_for_player_4 += 1;
							
								#region /* Player 4 character select portrait sprite */
								global.sprite_select_player_4 = spr_noone;
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_4, 2, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_4, 2, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_4, 2, global.skin_for_player_4);
								global.sprite_select_player_4 = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_4, 2, global.skin_for_player_4);
								#endregion /* Player 4 character select portrait sprite END */
							
							}
						}
						#endregion /* Player 4 key right Skin END */
					
						#region /* Player 4 key up Skin */
						if (keyboard_check_pressed(global.player4_key_up))
						and (!keyboard_check_pressed(global.player4_key_down))
						or (keyboard_check_pressed(global.player4_key2_up))
						and (!keyboard_check_pressed(global.player4_key2_down))
						or (gamepad_button_check_pressed(2, gp_padu))
						and (!gamepad_button_check_pressed(2, gp_padd))
						or (gamepad_axis_value(2, gp_axislv) < 0)
						and (menu_joystick4_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick4_delay = 30;
								player4_menu = "select_character";
							}
						}
						#endregion /* Player 4 key up Skin END */
					
						#region /* Player 4 key down Skin */
						if (keyboard_check_pressed(global.player4_key_down))
						and (!keyboard_check_pressed(global.player4_key_up))
						or (keyboard_check_pressed(global.player4_key2_down))
						and (!keyboard_check_pressed(global.player4_key2_up))
						or (gamepad_button_check_pressed(3, gp_padd))
						and (!gamepad_button_check_pressed(3, gp_padu))
						or (gamepad_axis_value(3, gp_axislv) > 0)
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
								{
									player4_menu = "select_name";
								}
							}
						}
						#endregion /* Player 4 key down Skin END */
					
						#region /* Show left key for character skin select */
						if (global.skin_for_player_4 > 0)
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player4_key_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player4_key2_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key2_left, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player4_menu = "select_skin";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show left key for character skin select END */
					
						#region /* Show right key for character skin select */
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player_4 + 1)))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player_4 + 1)))
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player4_key_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player4_key2_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key2_right, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + skin_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player4_menu = "select_skin";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 + skin_y - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + skin_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show right key for character skin select END */
					
					}
				}
			}
			#endregion /* Player 4 Select Skin END */
		
		}
			#endregion /* Display Selected Skin if skins are available END */
		
		#region /* Display Selected Voice Pack if voice packs are available */
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
		
			voicepack_y = 234;
		
			#region /* Player 1 Select Voice Pack */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack1"))
			and (player1_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack1"))
			and (player1_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player1_display_x, window_get_height() / 2 + voicepack_y, l10n_text("Voice Pack") + " : " + string(global.voicepack_for_player_1 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player1_menu = "select_voicepack")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (player1_accept_selection = false)
					{
					
						#region /* Player 1 key left Voice Pack */
						if (keyboard_check_pressed(global.player1_key_left))
						and (!keyboard_check_pressed(global.player1_key_right))
						or (keyboard_check_pressed(global.player1_key2_left))
						and (!keyboard_check_pressed(global.player1_key2_right))
						or (gamepad_button_check_pressed(0, gp_padl))
						and (!gamepad_button_check_pressed(0, gp_padr))
						or (gamepad_axis_value(0, gp_axislh) < 0)
						and (menu_joystick1_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (global.voicepack_for_player_1 > 0)
							{
								menu_delay = 3;
								menu_joystick1_delay = 30;
								xx1 = player1_display_x - 32;
								global.voicepack_for_player_1 -= 1;
							}
						}
						#endregion /* Player 1 key left Voice Pack END */
					
						#region /* Player 1 key right Voice Pack */
						if (keyboard_check_pressed(global.player1_key_right))
						and (!keyboard_check_pressed(global.player1_key_left))
						or (keyboard_check_pressed(global.player1_key2_right))
						and (!keyboard_check_pressed(global.player1_key2_left))
						or (gamepad_button_check_pressed(0, gp_padr))
						and (!gamepad_button_check_pressed(0, gp_padl))
						or (gamepad_axis_value(0, gp_axislh) > 0)
						and (menu_joystick1_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1 + 1)))
							or (menu_delay == 0)
							and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1 + 1)))
							{
								menu_delay = 3;
								menu_joystick1_delay = 30;
								xx1 = player1_display_x + 32;
								global.voicepack_for_player_1 += 1;
							
							}
						}
						#endregion /* Player 1 key right Voice Pack END */
					
						#region /* Player 1 key up Voice Pack */
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
								if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
								and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
								or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin0"))
								and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin1"))
								{
									player1_menu = "select_skin"; /* Go from selecting voicepack to selecting skin */
								}
								else
								{
									player1_menu = "select_character"; /* Go from selecting voicepack to selecting character */
								}
							}
						}
						#endregion /* Player 1 key up Voice Pack END */
					
						#region /* Player 1 key down Voice Pack */
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
								player1_menu = "select_name";
							}
						}
						#endregion /* Player 1 key down Voice Pack END */
					
						#region /* Show left key for character voicepack select */
						if (global.voicepack_for_player_1 > 0)
						{
							if (gamepad_is_connected(0))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player1_key_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player1_key2_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player1_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show left key for character voicepack select END */
					
						#region /* Show right key for character voicepack select */
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1 + 1)))
						or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sound/voicepack" + string(global.voicepack_for_player_1 + 1)))
						{
							if (gamepad_is_connected(0))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player1_key_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player1_key2_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player1_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show right key for character voicepack select END */
					
					}
				}
			}
			#endregion /* Player 1 Select Voice Pack END */
		
			#region /* Player 2 Select Voice Pack */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack1"))
			and (player2_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack1"))
			and (player2_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player2_display_x, window_get_height() / 2 + voicepack_y, l10n_text("Voice Pack") + " : " + string(global.voicepack_for_player_2 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player2_menu = "select_voicepack")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (player2_accept_selection = false)
					{
					
						#region /* Player 2 key left Voice Pack */
						if (keyboard_check_pressed(global.player2_key_left))
						and (!keyboard_check_pressed(global.player2_key_right))
						or (keyboard_check_pressed(global.player2_key2_left))
						and (!keyboard_check_pressed(global.player2_key2_right))
						or (gamepad_button_check_pressed(1, gp_padl))
						and (!gamepad_button_check_pressed(1, gp_padr))
						or (gamepad_axis_value(1, gp_axislh) < 0)
						and (menu_joystick2_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (global.voicepack_for_player_2 > 0)
							{
								menu_delay = 3;
								menu_joystick2_delay = 30;
								xx2 = player2_display_x - 32;
								global.voicepack_for_player_2 -= 1;
							}
						}
						#endregion /* Player 2 key left Voice Pack END */
					
						#region /* Player 2 key right Voice Pack */
						if (keyboard_check_pressed(global.player2_key_right))
						and (!keyboard_check_pressed(global.player2_key_left))
						or (keyboard_check_pressed(global.player2_key2_right))
						and (!keyboard_check_pressed(global.player2_key2_left))
						or (gamepad_button_check_pressed(1, gp_padr))
						and (!gamepad_button_check_pressed(1, gp_padl))
						or (gamepad_axis_value(1, gp_axislh) > 0)
						and (menu_joystick2_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2 + 1)))
							{
								menu_delay = 3;
								menu_joystick2_delay = 30;
								xx2 = player2_display_x + 32;
								global.voicepack_for_player_2 += 1;
							}
						}
						#endregion /* Player 2 key right Voice Pack END */
					
						#region /* Player 2 key up Voice Pack */
						if (keyboard_check_pressed(global.player2_key_up))
						and (!keyboard_check_pressed(global.player2_key_down))
						or (keyboard_check_pressed(global.player2_key2_up))
						and (!keyboard_check_pressed(global.player2_key2_down))
						or (gamepad_button_check_pressed(1, gp_padu))
						and (!gamepad_button_check_pressed(1, gp_padd))
						or (gamepad_axis_value(1, gp_axislv) < 0)
						and (menu_joystick2_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick2_delay = 30;
								if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
								and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
								or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin0"))
								and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin1"))
								{
									player2_menu = "select_skin"; /* Go from selecting voicepack to selecting skin */
								}
								else
								{
									player2_menu = "select_character"; /* Go from selecting voicepack to selecting character */
								}
							}
						}
						#endregion /* Player 2 key up Voice Pack END */
					
						#region /* Player 2 key down Voice Pack */
						if (keyboard_check_pressed(global.player2_key_down))
						and (!keyboard_check_pressed(global.player2_key_up))
						or (keyboard_check_pressed(global.player2_key2_down))
						and (!keyboard_check_pressed(global.player2_key2_up))
						or (gamepad_button_check_pressed(1, gp_padd))
						and (!gamepad_button_check_pressed(1, gp_padu))
						or (gamepad_axis_value(1, gp_axislv) > 0)
						and (menu_joystick2_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick2_delay = 30;
								player2_menu = "select_name";
							}
						}
						#endregion /* Player 2 key down Voice Pack END */
					
						#region /* Show left key for character voicepack select */
						if (global.voicepack_for_player_2 > 0)
						{
							if (gamepad_is_connected(1))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player2_key_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player2_key2_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key2_left, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player2_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show left key for character voicepack select END */
					
						#region /* Show right key for character voicepack select */
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sound/voicepack" + string(global.voicepack_for_player_2 + 1)))
						{
							if (gamepad_is_connected(1))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player2_key_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player2_key2_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player2_key2_right, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player2_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show right key for character voicepack select END */
					
					}
				}
			}
			#endregion /* Player 2 Select Voice Pack END */
		
			#region /* Player 3 Select Voice Pack */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack1"))
			and (player3_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack1"))
			and (player3_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player3_display_x, window_get_height() / 2 + voicepack_y, l10n_text("Voice Pack") + " : " + string(global.voicepack_for_player_3 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player3_menu = "select_voicepack")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (player3_accept_selection = false)
					{
					
						#region /* Player 3 key left Voice Pack */
						if (keyboard_check_pressed(global.player3_key_left))
						and (!keyboard_check_pressed(global.player3_key_right))
						or (keyboard_check_pressed(global.player3_key2_left))
						and (!keyboard_check_pressed(global.player3_key2_right))
						or (gamepad_button_check_pressed(2, gp_padl))
						and (!gamepad_button_check_pressed(2, gp_padr))
						or (gamepad_axis_value(2, gp_axislh) < 0)
						and (menu_joystick3_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (global.voicepack_for_player_3 > 0)
							{
								menu_delay = 3;
								menu_joystick3_delay = 30;
								xx3 = player3_display_x - 32;
								global.voicepack_for_player_3 -= 1;
							}
						}
						#endregion /* Player 3 key left Voice Pack END */
					
						#region /* Player 3 key right Voice Pack */
						if (keyboard_check_pressed(global.player3_key_right))
						and (!keyboard_check_pressed(global.player3_key_left))
						or (keyboard_check_pressed(global.player3_key2_right))
						and (!keyboard_check_pressed(global.player3_key2_left))
						or (gamepad_button_check_pressed(2, gp_padr))
						and (!gamepad_button_check_pressed(2, gp_padl))
						or (gamepad_axis_value(2, gp_axislh) > 0)
						and (menu_joystick3_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3 + 1)))
							{
								menu_delay = 3;
								menu_joystick3_delay = 30;
								xx3 = player3_display_x + 32;
								global.voicepack_for_player_3 += 1;
							}
						}
						#endregion /* Player 3 key right Voice Pack END */
					
						#region /* Player 3 key up Voice Pack */
						if (keyboard_check_pressed(global.player3_key_up))
						and (!keyboard_check_pressed(global.player3_key_down))
						or (keyboard_check_pressed(global.player3_key2_up))
						and (!keyboard_check_pressed(global.player3_key2_down))
						or (gamepad_button_check_pressed(2, gp_padu))
						and (!gamepad_button_check_pressed(2, gp_padd))
						or (gamepad_axis_value(2, gp_axislv) < 0)
						and (menu_joystick3_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick3_delay = 30;
								if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
								and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
								or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin0"))
								and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin1"))
								{
									player3_menu = "select_skin"; /* Go from selecting voicepack to selecting skin */
								}
								else
								{
									player3_menu = "select_character"; /* Go from selecting voicepack to selecting character */
								}
							}
						}
						#endregion /* Player 3 key up Voice Pack END */
					
						#region /* Player 3 key down Voice Pack */
						if (keyboard_check_pressed(global.player3_key_down))
						and (!keyboard_check_pressed(global.player3_key_up))
						or (keyboard_check_pressed(global.player3_key2_down))
						and (!keyboard_check_pressed(global.player3_key2_up))
						or (gamepad_button_check_pressed(2, gp_padd))
						and (!gamepad_button_check_pressed(2, gp_padu))
						or (gamepad_axis_value(2, gp_axislv) > 0)
						and (menu_joystick3_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick3_delay = 30;
								player3_menu = "select_name";
							}
						}
						#endregion /* Player 3 key down Voice Pack END */
					
						#region /* Show left key for character voicepack select */
						if (global.voicepack_for_player_3 > 0)
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player3_key_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player3_key2_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key2_left, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player3_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show left key for character voicepack select END */
					
						#region /* Show right key for character voicepack select */
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sound/voicepack" + string(global.voicepack_for_player_3 + 1)))
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player3_key_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player3_key2_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player3_key2_right, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player3_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show right key for character voicepack select END */
					
					}
				}
			}
			#endregion /* Player 3 Select Voice Pack END */
		
			#region /* Player 4 Select Voice Pack */
			if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack0"))
			and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack1"))
			and (player4_accept_selection >= 0)
			or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack0"))
			and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack1"))
			and (player4_accept_selection >= 0)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_get_width() / 2 + player4_display_x, window_get_height() / 2 + voicepack_y, l10n_text("Voice Pack") + " : " + string(global.voicepack_for_player_4 + 1), global.default_text_size, c_black, c_white, 1);
			
				if (player4_menu = "select_voicepack")
				or (global.controls_used_for_menu_navigation = "mouse")
				{
					if (player4_accept_selection = false)
					{
					
						#region /* Player 4 key left Voice Pack */
						if (keyboard_check_pressed(global.player4_key_left))
						and (!keyboard_check_pressed(global.player4_key_right))
						or (keyboard_check_pressed(global.player4_key2_left))
						and (!keyboard_check_pressed(global.player4_key2_right))
						or (gamepad_button_check_pressed(2, gp_padl))
						and (!gamepad_button_check_pressed(2, gp_padr))
						or (gamepad_axis_value(2, gp_axislh) < 0)
						and (menu_joystick4_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (global.voicepack_for_player_4 > 0)
							{
								menu_delay = 3;
								menu_joystick4_delay = 30;
								xx4 = player4_display_x - 32;
								global.voicepack_for_player_4 -= 1;
							}
						}
						#endregion /* Player 4 key left Voice Pack END */
					
						#region /* Player 4 key right Voice Pack */
						if (keyboard_check_pressed(global.player4_key_right))
						and (!keyboard_check_pressed(global.player4_key_left))
						or (keyboard_check_pressed(global.player4_key2_right))
						and (!keyboard_check_pressed(global.player4_key2_left))
						or (gamepad_button_check_pressed(2, gp_padr))
						and (!gamepad_button_check_pressed(2, gp_padl))
						or (gamepad_axis_value(2, gp_axislh) > 0)
						and (menu_joystick4_delay <= 0)
						or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
						and (mouse_check_button_pressed(mb_left))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							if (menu_delay == 0)
							and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4 + 1)))
							{
								menu_delay = 3;
								menu_joystick4_delay = 30;
								xx4 = player4_display_x + 32;
								global.voicepack_for_player_4 += 1;
							}
						}
						#endregion /* Player 4 key right Voice Pack END */
					
						#region /* Player 4 key up Voice Pack */
						if (keyboard_check_pressed(global.player4_key_up))
						and (!keyboard_check_pressed(global.player4_key_down))
						or (keyboard_check_pressed(global.player4_key2_up))
						and (!keyboard_check_pressed(global.player4_key2_down))
						or (gamepad_button_check_pressed(2, gp_padu))
						and (!gamepad_button_check_pressed(2, gp_padd))
						or (gamepad_axis_value(2, gp_axislv) < 0)
						and (menu_joystick4_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick4_delay = 30;
								if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
								and (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
								or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin0"))
								and (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin1"))
								{
									player4_menu = "select_skin"; /* Go from selecting voicepack to selecting skin */
								}
								else
								{
									player4_menu = "select_character"; /* Go from selecting voicepack to selecting character */
								}
							}
						}
						#endregion /* Player 4 key up Voice Pack END */
					
						#region /* Player 4 key down Voice Pack */
						if (keyboard_check_pressed(global.player4_key_down))
						and (!keyboard_check_pressed(global.player4_key_up))
						or (keyboard_check_pressed(global.player4_key2_down))
						and (!keyboard_check_pressed(global.player4_key2_up))
						or (gamepad_button_check_pressed(3, gp_padd))
						and (!gamepad_button_check_pressed(3, gp_padu))
						or (gamepad_axis_value(3, gp_axislv) > 0)
						and (menu_joystick4_delay <= 0)
						{
							if (menu_delay == 0)
							{
								menu_delay = 3;
								menu_joystick4_delay = 30;
								player4_menu = "select_name";
							}
						}
						#endregion /* Player 4 key down Voice Pack END */
					
						#region /* Show left key for character voicepack select */
						if (global.voicepack_for_player_4 > 0)
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player4_key_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player4_key2_left > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key2_left, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player4_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show left key for character voicepack select END */
					
						#region /* Show right key for character voicepack select */
						if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sound/voicepack" + string(global.voicepack_for_player_4 + 1)))
						{
							if (gamepad_is_connected(2))
							and (global.controls_used_for_menu_navigation == "controller")
							{
								scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, c_white, 1);
							}
							else
							if (asset_get_type("spr_keyboard_keys") == asset_sprite)
							{
								if (global.player4_key_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								if (global.player4_key2_right > noone)
								{
									draw_sprite_ext(spr_keyboard_keys, global.player4_key2_right, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
								else
								{
									draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2 + voicepack_y, 0.5, 0.5, 0, c_white, 1);
								}
							}
							if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16))
							and (global.controls_used_for_menu_navigation == "mouse")
							{
								player4_menu = "select_voicepack";
								draw_set_alpha(0.5);
								draw_rectangle_color(window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 + voicepack_y - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + voicepack_y + 16, c_white, c_white, c_white, c_white, false);
								draw_set_alpha(1);
							}
						}
						#endregion /* Show right key for character voicepack select END */
						
					}
				}
			}
			#endregion /* Player 4 Select Voice Pack END */
			
		}
		#endregion /* Display Selected Voice Pack if voice packs are available END */
		
		#region /* Show left and right arrows when selecting character */
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			if (player1_accept_selection = false)
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
				or (keyboard_check_pressed(global.player1_key_dive))
				and (menu_delay == 0)
				or (keyboard_check_pressed(global.player1_key2_dive))
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
			
			#region /* Player 1 */
			if (player1_menu = "select_character")
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (player1_accept_selection = false)
				{
					
					#region /* Key Left */
					if (global.character_index[0] > 0)
					{
						if (gamepad_is_connected(0))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player1_key_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player1_key2_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
					
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player1_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Left END */
			
					#region /* Key Right */
					if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
					{
						if (gamepad_is_connected(0))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player1_key_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player1_key2_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
				
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player1_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Right END */
			
				}
			}
			#endregion /* Player 1 END */
			
			#region /* Player 2 */
			if (player2_menu = "select_character")
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (player2_accept_selection = false)
				{
					
					#region /* Key Left */
					if (global.character_index[1] > 0)
					{
						if (gamepad_is_connected(1))
						{
							scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player2_key_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player2_key2_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player2_key2_left, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
			
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player2_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player2_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player2_display_x - arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Left END */
			
					#region /* Key Right */
					if (global.character_index[1] < ds_list_size(global.all_loaded_characters) - 1)
					{
						if (gamepad_is_connected(1))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player2_key_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player2_key2_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player2_key2_right, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
			
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player2_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player2_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player2_display_x + arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Right END */
			
				}
			}
			#endregion /* Player 2 END */
			
			#region /* Player 3 */
			if (player3_menu = "select_character")
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (player3_accept_selection = false)
				{
					
					#region /* Key Left */
					if (global.character_index[2] > 0)
					{
						if (gamepad_is_connected(2))
						{
							scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player3_key_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player3_key2_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player3_key2_left, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
			
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player3_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player3_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player3_display_x - arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Left END */
			
					#region /* Key Right */
					if (global.character_index[2] < ds_list_size(global.all_loaded_characters) - 1)
					{
						if (gamepad_is_connected(2))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player3_key_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player3_key2_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player3_key2_right, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
			
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player3_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player3_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player3_display_x + arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Right */
			
				}
			}
			#endregion /* Player 3 END */
			
			#region /* Player 4 */
			if (player4_menu = "select_character")
			or (global.controls_used_for_menu_navigation = "mouse")
			{
				if (player4_accept_selection = false)
				{
					
					#region /* Key Left */
					if (global.character_index[3] > 0)
					{
						if (gamepad_is_connected(3))
						{
							scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player4_key_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player4_key2_left > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player4_key2_left, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
			
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player4_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player4_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player4_display_x - arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Left END */
				
					#region /* Key Right */
					if (global.character_index[3] < ds_list_size(global.all_loaded_characters) - 1)
					{
						if (gamepad_is_connected(3))
						and (global.controls_used_for_menu_navigation == "controller")
						{
							scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
						}
						else
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player4_key_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player4_key2_right > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player4_key2_right, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
			
						if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + 16))
						and (global.controls_used_for_menu_navigation == "mouse")
						{
							player4_menu = "select_character";
							draw_set_alpha(0.5);
							draw_rectangle_color(window_get_width() / 2 + player4_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player4_display_x + arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
							draw_set_alpha(1);
						}
					}
					#endregion /* Key Right END */
			
				}
			}
			#endregion /* Player 4 END */
			
		}
		#endregion /* Show left and right arrows when selecting character END */
		
		#region /* Tell the players what buttons to push to select or cancel a selection */
		
		#region /* Player 1: Tell the player what button to push to select or cancel a selection */
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		
		if (player1_menu!= "select_name")
		and (player1_menu!= "back_from_character_select")
		and (player1_menu!= "open_custom_characters_folder")
		and (player1_menu!= "copy_character")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		or (global.controls_used_for_menu_navigation = "mouse")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			if (player1_accept_selection = false)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player1_display_x + 100, window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player1_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(window_get_width() / 2 + player1_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player1_display_x + 100, window_get_height() / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
		
				#region /* Accept Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player1_display_x + 60, window_get_height() / 2 + 150, l10n_text("Accept") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Accept Text END */
	
				#region /* Key A */
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation == "controller")
				{
					scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player1_key_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player1_key2_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
		
			}
			else
			if (player1_accept_selection == true)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player1_display_x + 100, window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player1_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(window_get_width() / 2 + player1_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player1_display_x + 100, window_get_height() / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(0.5);
					draw_rectangle_color(window_get_width() / 2 + player1_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player1_display_x + 100, window_get_height() / 2 + 150 + 20, c_red, c_red, c_red, c_red, false);
					draw_set_alpha(1);
				}
			
				#region /* Cancel Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player1_display_x + 60, window_get_height() / 2 + 150, l10n_text("Cancel") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Cancel Text END */
		
				#region /* Key B */
				if (gamepad_is_connected(0))
				and (global.controls_used_for_menu_navigation == "controller")
				{
					scr_draw_gamepad_buttons(gp_face2, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player1_key_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key_dive, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player1_key2_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key2_dive, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player1_key_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key_sprint, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player1_key2_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key2_sprint, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key B END */
		
			}
		}
		#endregion /* Player 1: Tell the player what button to push to select or cancel a selection END */
		
		#region /* Player 2: Tell the player what button to push to select or cancel a selection */
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);

		if (player2_menu!= "select_name")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		or (global.controls_used_for_menu_navigation = "mouse")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			if (player2_accept_selection = false)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player2_display_x + 100, window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player2_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(window_get_width() / 2 + player2_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player2_display_x + 100, window_get_height() / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
		
				#region /* Accept Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player2_display_x + 60, window_get_height() / 2 + 150, l10n_text("Accept") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Accept Text END */
		
				#region /* Key A */
				if (gamepad_is_connected(1))
				{
					scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player2_key_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key2_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
		
			}
			else
			if (player2_accept_selection == true)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player2_display_x + 100, window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player2_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(window_get_width() / 2 + player2_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player2_display_x + 100, window_get_height() / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(0.5);
					draw_rectangle_color(window_get_width() / 2 + player2_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player2_display_x + 100, window_get_height() / 2 + 150 + 20, c_red, c_red, c_red, c_red, false);
					draw_set_alpha(1);
				}
			
				#region /* Cancel Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player2_display_x + 60, window_get_height() / 2 + 150, l10n_text("Cancel") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Cancel Text END */
		
				#region /* Key B */
				if (gamepad_is_connected(1))
				{
					scr_draw_gamepad_buttons(gp_face2, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player2_key_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key_dive, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key2_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key2_dive, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key_sprint, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key2_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key2_sprint, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key B END */
		
			}
		}
		#endregion /* Player 2: Tell the player what button to push to select or cancel a selection END */
		
		#region /* Player 3: Tell the player what button to push to select or cancel a selection */
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);

		if (player3_menu!= "select_name")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		or (global.controls_used_for_menu_navigation = "mouse")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			if (player3_accept_selection = false)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player3_display_x + 100, window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player3_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(window_get_width() / 2 + player3_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player3_display_x + 100, window_get_height() / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
		
				#region /* Accept Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player3_display_x + 60, window_get_height() / 2 + 150, l10n_text("Accept") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Accept Text END */
	
				#region /* Key A */
				if (gamepad_is_connected(2))
				{
					scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player3_key_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key2_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
		
			}
			else
			if (player3_accept_selection == true)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player3_display_x + 100, window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player3_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(window_get_width() / 2 + player3_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player3_display_x + 100, window_get_height() / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(0.5);
					draw_rectangle_color(window_get_width() / 2 + player3_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player3_display_x + 100, window_get_height() / 2 + 150 + 20, c_red, c_red, c_red, c_red, false);
					draw_set_alpha(1);
				}
			
				#region /* Cancel Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player3_display_x + 60, window_get_height() / 2 + 150, l10n_text("Cancel") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Cancel Text END */
	
				#region /* Key B */
				if (gamepad_is_connected(2))
				{
					scr_draw_gamepad_buttons(gp_face2, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player3_key_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key_dive, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key2_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key2_dive, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key_sprint, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key2_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key2_sprint, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key B END */
		
			}
		}
		#endregion /* Player 3: Tell the player what button to push to select or cancel a selection END */
		
		#region /* Player 4: Tell the player what button to push to select or cancel a selection */
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);

		if (player4_menu!= "select_name")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		or (global.controls_used_for_menu_navigation = "mouse")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			if (player4_accept_selection = false)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player4_display_x + 100, window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player4_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(window_get_width() / 2 + player4_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player4_display_x + 100, window_get_height() / 2 + 150 + 20, c_white, c_white, c_white, c_white, false);
					draw_set_alpha(1);
				}
			
				#region /* Accept Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player4_display_x + 60, window_get_height() / 2 + 150, l10n_text("Accept") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Accept Text END */
			
				#region /* Key A */
				if (gamepad_is_connected(3))
				{
					scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player4_key_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key2_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
			
			}
			else
			if (player4_accept_selection == true)
			{
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
				window_get_width() / 2 + player4_display_x - 100,
				window_get_height() / 2 + 150 - 20,
				window_get_width() / 2 + player4_display_x + 100,
				window_get_height() / 2 + 150 + 20))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					player4_menu = "select_character";
			
					draw_set_alpha(0.75);
					draw_rectangle_color(
					window_get_width() / 2 + player4_display_x - 100,
					window_get_height() / 2 + 150 - 20,
					window_get_width() / 2 + player4_display_x + 100,
					window_get_height() / 2 + 150 + 20,
					c_white, c_white, c_white, c_white, false);
					draw_set_alpha(0.5);
					draw_rectangle_color(
					window_get_width() / 2 + player4_display_x - 100,
					window_get_height() / 2 + 150 - 20,
					window_get_width() / 2 + player4_display_x + 100,
					window_get_height() / 2 + 150 + 20,
					c_red, c_red, c_red, c_red, false);
					draw_set_alpha(1);
				}
			
				#region /* Cancel Text */
				draw_set_halign(fa_right);
				scr_draw_text_outlined(window_get_width() / 2 + player4_display_x + 60, window_get_height() / 2 + 150, l10n_text("Cancel") + " : ", global.default_text_size, c_black, c_white, 1);
				#endregion /* Cancel Text END */
	
				#region /* Key B */
				if (gamepad_is_connected(3))
				{
					scr_draw_gamepad_buttons(gp_face2, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player4_key_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key_dive, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key2_dive > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key2_dive, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key_sprint, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key2_sprint > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key2_sprint, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x + 80, window_get_height() / 2 + 150, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key B END */
	
			}
		}
		#endregion /* Player 4: Tell the player what button to push to select or cancel a selection END */
		
		#region /* Tell player 1 what button to push to enter a name */
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		
		if (player1_menu = "select_name")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		and (global.controls_used_for_menu_navigation != "mouse")
		{
	
			#region /* Accept Text */
			scr_draw_text_outlined(window_get_width() / 2 + player1_display_x + 60, window_get_height() / 2 + name_y + 42, l10n_text("Enter name") + " : ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Accept Text END */
	
			#region /* Key A */
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player1_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, c_white, 1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player1_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, window_get_width() / 2 + player1_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player1_key2_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, window_get_width() / 2 + player1_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /* Key A END */
	
		}
		#endregion /* Tell player 1 what button to push to enter a name END */
		
		#region /* Tell player 2 what button to push to enter a name */
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);

		if (player2_menu = "select_name")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		and (global.controls_used_for_menu_navigation != "mouse")
		{
	
			#region /* Accept Text */
			scr_draw_text_outlined(window_get_width() / 2 + player2_display_x + 60, window_get_height() / 2 + name_y + 42, l10n_text("Enter name") + " : ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Accept Text END */
	
			#region /* Key A */
			if (gamepad_is_connected(1))
			{
				scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player2_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, c_white, 1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player2_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, window_get_width() / 2 + player2_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_key2_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, window_get_width() / 2 + player2_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /* Key A END */
	
		}
		#endregion /* Tell player 2 what button to push to enter a name END */
		
		#region /* Tell player 3 what button to push to enter a name */
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);

		if (player3_menu = "select_name")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		and (global.controls_used_for_menu_navigation != "mouse")
		{
	
			#region /* Accept Text */
			scr_draw_text_outlined(window_get_width() / 2 + player3_display_x + 60, window_get_height() / 2 + name_y + 42, l10n_text("Enter name") + " : ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Accept Text END */
	
			#region /* Key A */
			if (gamepad_is_connected(2))
			{
				scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player3_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, c_white, 1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player3_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, window_get_width() / 2 + player3_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_key2_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, window_get_width() / 2 + player3_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /* Key A END */
	
		}
		#endregion /* Tell player 3 what button to push to enter a name END */
		
		#region /* Tell player 4 what button to push to enter a name */
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);

		if (player4_menu = "select_name")
		and (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		and (global.controls_used_for_menu_navigation != "mouse")
		{
	
			#region /* Accept Text */
			scr_draw_text_outlined(window_get_width() / 2 + player4_display_x + 60, window_get_height() / 2 + name_y + 42, l10n_text("Enter name") + " : ", global.default_text_size, c_black, c_white, 1);
			#endregion /* Accept Text END */
	
			#region /* Key A */
			if (gamepad_is_connected(3))
			{
				scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player4_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, c_white, 1);
			}
			else
			{
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player4_key_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, window_get_width() / 2 + player4_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_key2_jump > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, window_get_width() / 2 + player4_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
					else
					{
						draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x + 70, window_get_height() / 2 + name_y + 42, 0.5, 0.5, 0, c_white, 1);
					}
				}
			}
			#endregion /* Key A END */
	
		}
		#endregion /* Tell player 4 what button to push to enter a name END */
		
		#endregion /* Tell the players what buttons to push to select or cancel a selection END */
		
		#region /* Tell the player the inputed name */
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		
		name_y = 292;
		
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - 150, window_get_height() / 2 + name_y - 16, window_get_width() / 2 + player1_display_x + 150, window_get_height() / 2 + name_y + 16))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (player1_accept_selection >= 0)
		and (menu_delay == 0)
		{
			player1_menu = "select_name";
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - 150, window_get_height() / 2 + name_y - 16, window_get_width() / 2 + player2_display_x + 150, window_get_height() / 2 + name_y + 16))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (player2_accept_selection >= 0)
		and (menu_delay == 0)
		{
			player2_menu = "select_name";
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - 150, window_get_height() / 2 + name_y - 16, window_get_width() / 2 + player3_display_x + 150, window_get_height() / 2 + name_y + 16))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (player3_accept_selection >= 0)
		and (menu_delay == 0)
		{
			player3_menu = "select_name";
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - 150, window_get_height() / 2 + name_y - 16, window_get_width() / 2 + player4_display_x + 150, window_get_height() / 2 + name_y + 16))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (player4_accept_selection >= 0)
		and (menu_delay == 0)
		{
			player4_menu = "select_name";
		}
		
		if (player1_accept_selection >= 0)
		and (can_input_player1_name = false)
		{
			if (global.player1_name = "")
			{
				scr_draw_name_box("Player 1", global.player1_color, 0.5, window_get_width() / 2 + player1_display_x, window_get_height() / 2 + name_y);
			}
			else
			{
				scr_draw_name_box(global.player1_name, global.player1_color, 0.5, window_get_width() / 2 + player1_display_x, window_get_height() / 2 + name_y);
			}
		}
		if (player2_accept_selection >= 0)
		and (can_input_player2_name = false)
		{
			if (global.player2_name = "")
			{
				scr_draw_name_box("Player 2", global.player2_color, 0.5, window_get_width() / 2 + player2_display_x, window_get_height() / 2 + name_y);
			}
			else
			{
				scr_draw_name_box(global.player2_name, global.player2_color, 0.5, window_get_width() / 2 + player2_display_x, window_get_height() / 2 + name_y);
			}
		}
		if (player3_accept_selection >= 0)
		and (can_input_player3_name = false)
		{
			if (global.player3_name = "")
			{
				scr_draw_name_box("Player 3", global.player3_color, 0.5, window_get_width() / 2 + player3_display_x, window_get_height() / 2 + name_y);
			}
			else
			{
				scr_draw_name_box(global.player3_name, global.player3_color, 0.5, window_get_width() / 2 + player3_display_x, window_get_height() / 2 + name_y);
			}
		}
		if (player4_accept_selection >= 0)
		and (can_input_player4_name = false)
		{
			if (global.player4_name = "")
			{
				scr_draw_name_box("Player 4", global.player4_color, 0.5, window_get_width() / 2 + player4_display_x, window_get_height() / 2 + name_y);
			}
			else
			{
				scr_draw_name_box(global.player4_name, global.player4_color, 0.5, window_get_width() / 2 + player4_display_x, window_get_height() / 2 + name_y);
			}
		}
		
		if (player1_accept_selection >= 0)
		and (can_input_player1_name == true)
		{
			global.player1_name = scr_draw_name_input_screen(global.player1_name, 32, global.player1_color, 0.5, true, window_get_width() / 2 + player1_display_x, window_get_height() / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
		if (player2_accept_selection >= 0)
		and (can_input_player2_name == true)
		{
			global.player2_name = scr_draw_name_input_screen(global.player2_name, 32, global.player2_color, 0.5, true, window_get_width() / 2 + player2_display_x, window_get_height() / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
		if (player3_accept_selection >= 0)
		and (can_input_player3_name == true)
		{
			global.player3_name = scr_draw_name_input_screen(global.player3_name, 32, global.player3_color, 0.5, true, window_get_width() / 2 + player3_display_x, window_get_height() / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
		if (player4_accept_selection >= 0)
		and (can_input_player4_name == true)
		{
			global.player4_name = scr_draw_name_input_screen(global.player4_name, 32, global.player4_color, 0.5, true, window_get_width() / 2 + player4_display_x, window_get_height() / 2 + name_y, "input_name_ok", "input_name_cancel");
		}
		
		#endregion /* Tell the player the inputed name END */
		
		#region /* Name Input */
		
		#region /* Press enter when done typing */
		if (can_input_player1_name == true)
		or (can_input_player2_name == true)
		or (can_input_player3_name == true)
		or (can_input_player4_name == true)
		{
			if (keyboard_check_pressed(vk_enter))
			or (keyboard_check_pressed(vk_escape))
			
			or (can_input_player1_name == true)
			and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player1_display_x - 185,
			window_get_height() / 2 + name_y + 52,
			window_get_width() / 2 + player1_display_x - 185 + 370,
			window_get_height() / 2 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (can_input_player2_name == true)
			and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player2_display_x - 185,
			window_get_height() / 2 + name_y + 52,
			window_get_width() / 2 + player2_display_x - 185 + 370,
			window_get_height() / 2 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (can_input_player3_name == true)
			and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player3_display_x - 185,
			window_get_height() / 2 + name_y + 52,
			window_get_width() / 2 + player3_display_x - 185 + 370,
			window_get_height() / 2 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (can_input_player4_name == true)
			and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player4_display_x - 185,
			window_get_height() / 2 + name_y + 52,
			window_get_width() / 2 + player4_display_x - 185 + 370,
			window_get_height() / 2 + name_y + 52 + 42 + 42))
			and (mouse_check_button_pressed(mb_left))
			
			or (gamepad_button_check_pressed(0, gp_face1))
			or (gamepad_button_check_pressed(1, gp_face1))
			or (gamepad_button_check_pressed(2, gp_face1))
			or (gamepad_button_check_pressed(3, gp_face1))
			or (gamepad_button_check_pressed(0, gp_face2))
			or (gamepad_button_check_pressed(1, gp_face2))
			or (gamepad_button_check_pressed(2, gp_face2))
			or (gamepad_button_check_pressed(3, gp_face2))
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
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			if (player1_menu = "select_character")
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
					and (!keyboard_check_pressed(global.player1_key_right))
					or (keyboard_check_pressed(global.player1_key2_left))
					and (!keyboard_check_pressed(global.player1_key2_right))
					or (gamepad_button_check_pressed(0, gp_padl))
					and (!gamepad_button_check_pressed(0, gp_padr))
					or (gamepad_axis_value(0, gp_axislh) < 0)
					and (menu_joystick1_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player1_display_x - arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player1_display_x - arrow_offset + 16,
					window_get_height() / 2 + 16))
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
					and (!keyboard_check_pressed(global.player1_key_left))
					or (keyboard_check_pressed(global.player1_key2_right))
					and (!keyboard_check_pressed(global.player1_key2_left))
					or (gamepad_button_check_pressed(0, gp_padr))
					and (!gamepad_button_check_pressed(0, gp_padl))
					or (gamepad_axis_value(0, gp_axislh) > 0)
					and (menu_joystick1_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player1_display_x + arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player1_display_x + arrow_offset + 16,
					window_get_height() / 2 + 16))
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
						if (player1_menu = "open_custom_characters_folder")
						or (menu == "open_custom_characters_folder")
						{
							player1_menu = "back_from_character_select";
							menu = "back_from_character_select";
						}
						else
						{
							if (global.enable_copy_characters == true)
							{
								player1_menu = "copy_character";
								menu = "copy_character";
							}
							else
							{
								player1_menu = "back_from_character_select";
								menu = "back_from_character_select";
							}
						}
					}
				}
				#endregion /* Player 1 key up END */
				
				#region /* Player 1 key down */
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
			if (player1_menu = "select_name")
			{
	
			#region /* Player 1 key up */
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
	
			if (can_input_player1_name = false)
			and (can_input_player2_name = false)
			and (can_input_player3_name = false)
			and (can_input_player4_name = false)
			{
				if (key_a_pressed)
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
			
			if (player2_menu = "select_character")
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
					and (!keyboard_check_pressed(global.player2_key_right))
					or (keyboard_check_pressed(global.player2_key2_left))
					and (!keyboard_check_pressed(global.player2_key2_right))
					or (gamepad_button_check_pressed(1, gp_padl))
					and (!gamepad_button_check_pressed(1, gp_padr))
					or (gamepad_axis_value(1, gp_axislh) < 0)
					and (menu_joystick2_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player2_display_x - arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player2_display_x - arrow_offset + 16,
					window_get_height() / 2 + 16))
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
					and (!keyboard_check_pressed(global.player2_key_left))
					or (keyboard_check_pressed(global.player2_key2_right))
					and (!keyboard_check_pressed(global.player2_key2_left))
					or (gamepad_button_check_pressed(1, gp_padr))
					and (!gamepad_button_check_pressed(1, gp_padl))
					or (gamepad_axis_value(1, gp_axislh) > 0)
					and (menu_joystick2_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player2_display_x + arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player2_display_x + arrow_offset + 16,
					window_get_height() / 2 + 16))
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
			and (!keyboard_check_pressed(global.player2_key_up))
			or (keyboard_check_pressed(global.player2_key2_down))
			and (!keyboard_check_pressed(global.player2_key2_up))
			or (gamepad_button_check_pressed(1, gp_padd))
			and (!gamepad_button_check_pressed(1, gp_padu))
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
			if (player2_menu = "select_name")
			{
		
				#region /* Player 2 key up */
				if (keyboard_check_pressed(global.player2_key_up))
				and (!keyboard_check_pressed(global.player2_key_down))
				or (keyboard_check_pressed(global.player2_key2_up))
				and (!keyboard_check_pressed(global.player2_key2_down))
				or (gamepad_button_check_pressed(1, gp_padu))
				and (!gamepad_button_check_pressed(1, gp_padd))
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
		
			if (can_input_player1_name = false)
			and (can_input_player2_name = false)
			and (can_input_player3_name = false)
			and (can_input_player4_name = false)
			{
				if (gamepad_button_check_pressed(1, gp_face1))
				or (keyboard_check_pressed(global.player2_key_jump))
				or (keyboard_check_pressed(global.player2_key2_jump))
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
			
			if (player3_menu = "select_character")
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
					and (!keyboard_check_pressed(global.player3_key_right))
					or (keyboard_check_pressed(global.player3_key2_left))
					and (!keyboard_check_pressed(global.player3_key2_right))
					or (gamepad_button_check_pressed(2, gp_padl))
					and (!gamepad_button_check_pressed(2, gp_padr))
					or (gamepad_axis_value(2, gp_axislh) < 0)
					and (menu_joystick3_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player3_display_x - arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player3_display_x - arrow_offset + 16,
					window_get_height() / 2 + 16))
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
					and (!keyboard_check_pressed(global.player3_key_left))
					or (keyboard_check_pressed(global.player3_key2_right))
					and (!keyboard_check_pressed(global.player3_key2_left))
					or (gamepad_button_check_pressed(2, gp_padr))
					and (!gamepad_button_check_pressed(2, gp_padl))
					or (gamepad_axis_value(2, gp_axislh) > 0)
					and (menu_joystick3_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player3_display_x + arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player3_display_x + arrow_offset + 16,
					window_get_height() / 2 + 16))
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
			and (!keyboard_check_pressed(global.player3_key_up))
			or (keyboard_check_pressed(global.player3_key2_down))
			and (!keyboard_check_pressed(global.player3_key2_up))
			or (gamepad_button_check_pressed(2, gp_padd))
			and (!gamepad_button_check_pressed(2, gp_padu))
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
			if (player3_menu = "select_name")
			{
	
				#region /* Player 3 key up */
				if (keyboard_check_pressed(global.player3_key_up))
				and (!keyboard_check_pressed(global.player3_key_down))
				or (keyboard_check_pressed(global.player3_key2_up))
				and (!keyboard_check_pressed(global.player3_key2_down))
				or (gamepad_button_check_pressed(2, gp_padu))
				and (!gamepad_button_check_pressed(2, gp_padd))
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
		
			if (can_input_player1_name = false)
			and (can_input_player2_name = false)
			and (can_input_player3_name = false)
			and (can_input_player4_name = false)
			{
				if (gamepad_button_check_pressed(2, gp_face1))
				or (keyboard_check_pressed(global.player3_key_jump))
				or (keyboard_check_pressed(global.player3_key2_jump))
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
			
			if (player4_menu = "select_character")
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
					and (!keyboard_check_pressed(global.player4_key_right))
					or (keyboard_check_pressed(global.player4_key2_left))
					and (!keyboard_check_pressed(global.player4_key2_right))
					or (gamepad_button_check_pressed(3, gp_padl))
					and (!gamepad_button_check_pressed(3, gp_padr))
					or (gamepad_axis_value(3, gp_axislh) < 0)
					and (menu_joystick4_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player4_display_x - arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player4_display_x - arrow_offset + 16,
					window_get_height() / 2 + 16))
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
					and (!keyboard_check_pressed(global.player4_key_left))
					or (keyboard_check_pressed(global.player4_key2_right))
					and (!keyboard_check_pressed(global.player4_key2_left))
					or (gamepad_button_check_pressed(3, gp_padr))
					and (!gamepad_button_check_pressed(3, gp_padl))
					or (gamepad_axis_value(3, gp_axislh) > 0)
					and (menu_joystick4_delay <= 0)
					or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
					window_get_width() / 2 + player4_display_x + arrow_offset - 16,
					window_get_height() / 2 - 16,
					window_get_width() / 2 + player4_display_x + arrow_offset + 16,
					window_get_height() / 2 + 16))
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
			and (!keyboard_check_pressed(global.player4_key_up))
			or (keyboard_check_pressed(global.player4_key2_down))
			and (!keyboard_check_pressed(global.player4_key2_up))
			or (gamepad_button_check_pressed(3, gp_padd))
			and (!gamepad_button_check_pressed(3, gp_padu))
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
			if (player4_menu = "select_name")
			{
		
				#region /* Player 4 key up */
				if (keyboard_check_pressed(global.player4_key_up))
				and (!keyboard_check_pressed(global.player4_key_down))
				or (keyboard_check_pressed(global.player4_key2_up))
				and (!keyboard_check_pressed(global.player4_key2_down))
				or (gamepad_button_check_pressed(3, gp_padu))
				and (!gamepad_button_check_pressed(3, gp_padd))
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
		
			if (can_input_player1_name = false)
			and (can_input_player2_name = false)
			and (can_input_player3_name = false)
			and (can_input_player4_name = false)
			{
				if (gamepad_button_check_pressed(3, gp_face1))
				or (keyboard_check_pressed(global.player4_key_jump))
				or (keyboard_check_pressed(global.player4_key2_jump))
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
			
		}
		#endregion /* Menu Navigation END */
		
		#region /* Click on name to input name */
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
		window_get_width() / 2 + player1_display_x - 150,
		window_get_height() / 2 + name_y - 16,
		window_get_width() / 2 + player1_display_x + 150,
		window_get_height() / 2 + name_y + 16))
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
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
		window_get_width() / 2 + player2_display_x - 150,
		window_get_height() / 2 + name_y - 16,
		window_get_width() / 2 + player2_display_x + 150,
		window_get_height() / 2 + name_y + 16))
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
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
		window_get_width() / 2 + player3_display_x - 150,
		window_get_height() / 2 + name_y - 16,
		window_get_width() / 2 + player3_display_x + 150,
		window_get_height() / 2 + name_y + 16))
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
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
		window_get_width() / 2 + player4_display_x - 150,
		window_get_height() / 2 + name_y - 16,
		window_get_width() / 2 + player4_display_x + 150,
		window_get_height() / 2 + name_y + 16))
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
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			
			#region /* Accept */
			if (key_a_pressed)
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player1_display_x - 100,
			window_get_height() / 2 + 150 - 20,
			window_get_width() / 2 + player1_display_x + 100,
			window_get_height() / 2 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player1_menu = "select_character")
				or (player1_menu = "select_skin")
				or (player1_menu = "select_voicepack")
				{
					if (player1_accept_selection = false)
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
			if (gamepad_button_check_pressed(1, gp_face1))
			or (keyboard_check_pressed(global.player2_key_jump))
			or (keyboard_check_pressed(global.player2_key2_jump))
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player2_display_x - 100,
			window_get_height() / 2 + 150 - 20,
			window_get_width() / 2 + player2_display_x + 100,
			window_get_height() / 2 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player2_menu = "select_character")
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
			if (gamepad_button_check_pressed(2, gp_face1))
			or (keyboard_check_pressed(global.player3_key_jump))
			or (keyboard_check_pressed(global.player3_key2_jump))
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player3_display_x - 100,
			window_get_height() / 2 + 150 - 20,
			window_get_width() / 2 + player3_display_x + 100,
			window_get_height() / 2 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player3_menu = "select_character")
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
			if (gamepad_button_check_pressed(3, gp_face1))
			or (keyboard_check_pressed(global.player4_key_jump))
			or (keyboard_check_pressed(global.player4_key2_jump))
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
			window_get_width() / 2 + player4_display_x - 100,
			window_get_height() / 2 + 150 - 20,
			window_get_width() / 2 + player4_display_x + 100,
			window_get_height() / 2 + 150 + 20))
			and (mouse_check_button_pressed(mb_left))
			{
				if (player4_menu = "select_character")
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
			
			#region /* Start Game */
	
			#region /* If player 1 has selected a character, be able to start game */
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
			#endregion /* If player 1 has selected a character, be able to start game END */
	
			#endregion /* Start Game END */
			
			if (player1_accept_selection == true)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (key_a_pressed)
			and (player1_menu != "back_from_character_select")
			and (player1_menu != "open_custom_characters_folder")
			and (player1_menu != "copy_character")
			or (player1_accept_selection == true)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (keyboard_check_pressed(global.player1_key_jump))
			and (player1_menu != "back_from_character_select")
			and (player1_menu != "open_custom_characters_folder")
			and (player1_menu != "copy_character")
			or (player1_accept_selection == true)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (keyboard_check_pressed(global.player1_key2_jump))
			and (player1_menu != "back_from_character_select")
			and (player1_menu != "open_custom_characters_folder")
			and (player1_menu != "copy_character")
			or (player1_accept_selection == true)
			and (player2_accept_selection != 0)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (gamepad_button_check_pressed(0, gp_face1))
			and (player1_menu != "back_from_character_select")
			and (player1_menu != "open_custom_characters_folder")
			and (player1_menu != "copy_character")
			
			or (player1_accept_selection = -1)
			and (player2_accept_selection == true)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (keyboard_check_pressed(global.player2_key_jump))
			and (player2_menu != "back_from_character_select")
			or (player1_accept_selection = -1)
			and (player2_accept_selection == true)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (keyboard_check_pressed(global.player2_key2_jump))
			and (player2_menu != "back_from_character_select")
			or (player1_accept_selection = -1)
			and (player2_accept_selection == true)
			and (player3_accept_selection != 0)
			and (player4_accept_selection != 0)
			and (gamepad_button_check_pressed(1, gp_face1))
			and (player2_menu != "back_from_character_select")
			
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection == true)
			and (player4_accept_selection != 0)
			and (keyboard_check_pressed(global.player3_key_jump))
			and (player3_menu != "back_from_character_select")
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection == true)
			and (player4_accept_selection != 0)
			and (keyboard_check_pressed(global.player3_key2_jump))
			and (player3_menu != "back_from_character_select")
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection == true)
			and (player4_accept_selection != 0)
			and (gamepad_button_check_pressed(2, gp_face1))
			and (player3_menu != "back_from_character_select")
			
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection = -1)
			and (player4_accept_selection == true)
			and (keyboard_check_pressed(global.player4_key_jump))
			and (player3_menu != "back_from_character_select")
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection = -1)
			and (player4_accept_selection == true)
			and (keyboard_check_pressed(global.player4_key2_jump))
			and (player3_menu != "back_from_character_select")
			or (player1_accept_selection = -1)
			and (player2_accept_selection = -1)
			and (player3_accept_selection = -1)
			and (player4_accept_selection == true)
			and (gamepad_button_check_pressed(3, gp_face1))
			and (player3_menu != "back_from_character_select")
			
			or (player_start_game == true)
			and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, play_the_game_text_y - 32, window_get_width(), play_the_game_text_y + 32))
			and (mouse_check_button_pressed(mb_left))
			{
				if (can_input_player1_name = false)
				and (can_input_player2_name = false)
				and (can_input_player3_name = false)
				and (can_input_player4_name = false)
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
			if (key_b_pressed)
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player1_display_x + 100, window_get_height() / 2 + 150 + 20))
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
			if (gamepad_button_check_pressed(1, gp_face2))
			or (keyboard_check_pressed(global.player2_key_dive))
			or (keyboard_check_pressed(global.player2_key2_dive))
			or (keyboard_check_pressed(global.player2_key_sprint))
			or (keyboard_check_pressed(global.player2_key2_sprint))
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player2_display_x + 100, window_get_height() / 2 + 150 + 20))
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
			if (gamepad_button_check_pressed(2, gp_face2))
			or (keyboard_check_pressed(global.player3_key_dive))
			or (keyboard_check_pressed(global.player3_key2_dive))
			or (keyboard_check_pressed(global.player3_key_sprint))
			or (keyboard_check_pressed(global.player3_key2_sprint))
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player3_display_x + 100, window_get_height() / 2 + 150 + 20))
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
			if (gamepad_button_check_pressed(3, gp_face2))
			or (keyboard_check_pressed(global.player4_key_dive))
			or (keyboard_check_pressed(global.player4_key2_dive))
			or (keyboard_check_pressed(global.player4_key_sprint))
			or (keyboard_check_pressed(global.player4_key2_sprint))
			or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - 100, window_get_height() / 2 + 150 - 20, window_get_width() / 2 + player4_display_x + 100, window_get_height() / 2 + 150 + 20))
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
			
			if (key_b_pressed)
			and (player1_accept_selection <= -1)
			or (key_a_pressed)
			and (menu == "back_from_character_select")
			or (key_a_pressed)
			and (player1_menu = "back_from_character_select")
			or (key_a_pressed)
			and (player2_menu = "back_from_character_select")
			or (key_a_pressed)
			and (player3_menu = "back_from_character_select")
			or (key_a_pressed)
			and (player4_menu = "back_from_character_select")
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
		if (can_input_player1_name = false)
		and (can_input_player2_name = false)
		and (can_input_player3_name = false)
		and (can_input_player4_name = false)
		{
			
			#region /* Player 1 Join Text */
			if (player1_accept_selection <= -1)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - 150, window_get_height() / 2 - 32, window_get_width() / 2 + player1_display_x + 150, window_get_height() / 2 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
					scr_draw_text_outlined(window_get_width() / 2 + player1_display_x + 60, window_get_height() / 2, l10n_text("Player 1 Join"), global.default_text_size, c_white, global.player1_color, 1);
				}
				else
				{
					scr_draw_text_outlined(window_get_width() / 2 + player1_display_x + 60, window_get_height() / 2, l10n_text("Player 1 Join"), global.default_text_size, c_black, global.player1_color, 1);
				}
				if (gamepad_button_check_pressed(0, gp_face1))
				or (key_a_pressed)
				or (keyboard_check_pressed(global.player1_key_jump))
				or (keyboard_check_pressed(global.player1_key2_jump))
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - 150, window_get_height() / 2 - 32, window_get_width() / 2 + player1_display_x + 150, window_get_height() / 2 + 32))
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
					if (gamepad_is_connected(0))
					and (global.controls_used_for_menu_navigation == "controller")
					{
						scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player1_display_x + 90, window_get_height() / 2, 0.5, c_white, 1);
					}
					else
					{
						if (asset_get_type("spr_keyboard_keys") == asset_sprite)
						{
							if (global.player1_key_jump > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, window_get_width() / 2 + player1_display_x + 90, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							if (global.player1_key2_jump > noone)
							{
								draw_sprite_ext(spr_keyboard_keys, global.player1_key2_jump, window_get_width() / 2 + player1_display_x + 90, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
							else
							{
								draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + 90, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
							}
						}
					}
				}
				#endregion /* Key A END */
				
			}
			#endregion /* Player 1 Join Text END */
			
			#region /* Player 2 Join Text */
			if (player2_accept_selection <= -1)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - 150, window_get_height() / 2 + 32 - 32, window_get_width() / 2 + player2_display_x + 150, window_get_height() / 2 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
					scr_draw_text_outlined(window_get_width() / 2 + player2_display_x + 60, window_get_height() / 2 + 32, l10n_text("Player 2 Join"), global.default_text_size, c_white, global.player2_color, 1);
				}
				else
				{
					scr_draw_text_outlined(window_get_width() / 2 + player2_display_x + 60, window_get_height() / 2 + 32, l10n_text("Player 2 Join"), global.default_text_size, c_black, global.player2_color, 1);
				}
		
				if (gamepad_button_check_pressed(1, gp_face1))
				or (keyboard_check_pressed(global.player2_key_jump))
				or (keyboard_check_pressed(global.player2_key2_jump))
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player2_display_x - 150, window_get_height() / 2 + 32 - 32, window_get_width() / 2 + player2_display_x + 150, window_get_height() / 2 + 32 + 32))
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
		
				#region /* Key A */
				if (gamepad_is_connected(1))
				{
					scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player2_display_x + 90, window_get_height() / 2 + 32, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player2_key_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key_jump, window_get_width() / 2 + player2_display_x + 90, window_get_height() / 2 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key2_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key2_jump, window_get_width() / 2 + player2_display_x + 90, window_get_height() / 2 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player2_display_x + 90, window_get_height() / 2 + 32, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
		
			}
			#endregion /* Player 2 Join Text END */
			
			#region /* Player 3 Join Text */
			if (player3_accept_selection <= -1)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - 150, window_get_height() / 2 - 32, window_get_width() / 2 + player3_display_x + 150, window_get_height() / 2 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
					scr_draw_text_outlined(window_get_width() / 2 + player3_display_x + 60, window_get_height() / 2, l10n_text("Player 3 Join"), global.default_text_size, c_white, global.player3_color, 1);
				}
				else
				{
					scr_draw_text_outlined(window_get_width() / 2 + player3_display_x + 60, window_get_height() / 2, l10n_text("Player 3 Join"), global.default_text_size, c_black, global.player3_color, 1);
				}
		
				if (gamepad_button_check_pressed(2, gp_face1))
				or (keyboard_check_pressed(global.player3_key_jump))
				or (keyboard_check_pressed(global.player3_key2_jump))
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player3_display_x - 150, window_get_height() / 2 - 32, window_get_width() / 2 + player3_display_x + 150, window_get_height() / 2 + 32))
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
		
				#region /* Key A */
				if (gamepad_is_connected(2))
				{
					scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player3_display_x + 90, window_get_height() / 2, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player3_key_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key_jump, window_get_width() / 2 + player3_display_x + 90, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key2_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key2_jump, window_get_width() / 2 + player3_display_x + 90, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player3_display_x + 90, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key A END */
		
			}
			#endregion /* Player 3 Join Text END */
			
			#region /* Player 4 Join Text */
			if (player4_accept_selection <= -1)
			{
				draw_set_halign(fa_right);
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - 150, window_get_height() / 2 + 32 - 32, window_get_width() / 2 + player4_display_x + 150, window_get_height() / 2 + 32 + 32))
				and (global.controls_used_for_menu_navigation == "mouse")
				{
					menu = "select_character";
					scr_draw_text_outlined(window_get_width() / 2 + player4_display_x + 60, window_get_height() / 2 + 32, l10n_text("Player 4 Join"), global.default_text_size, c_white, global.player4_color, 1);
				}
				else
				{
					scr_draw_text_outlined(window_get_width() / 2 + player4_display_x + 60, window_get_height() / 2 + 32, l10n_text("Player 4 Join"), global.default_text_size, c_black, global.player4_color, 1);
				}
		
				if (gamepad_button_check_pressed(3, gp_face1))
				or (keyboard_check_pressed(global.player4_key_jump))
				or (keyboard_check_pressed(global.player4_key2_jump))
				or (mouse_check_button_pressed(mb_left))
				and (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player4_display_x - 150, window_get_height() / 2 + 32 - 32, window_get_width() / 2 + player4_display_x + 150, window_get_height() / 2 + 32 + 32))
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
		
				#region /* Key A */
				if (gamepad_is_connected(3))
				{
					scr_draw_gamepad_buttons(gp_face1, window_get_width() / 2 + player4_display_x + 90, window_get_height() / 2 + 32, 0.5, c_white, 1);
				}
				else
				{
					if (asset_get_type("spr_keyboard_keys") == asset_sprite)
					{
						if (global.player4_key_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key_jump, window_get_width() / 2 + player4_display_x + 90, window_get_height() / 2 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key2_jump > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key2_jump, window_get_width() / 2 + player4_display_x + 90, window_get_height() / 2 + 32, 0.5, 0.5, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player4_display_x + 90, window_get_height() / 2 + 32, 0.5, 0.5, 0, c_white, 1);
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
			draw_sprite_ext(global.sprite_select_player_1, 0, window_get_width() / 2 +xx1, window_get_height() / 2, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, global.hex_color_for_player_1, 1);
		}
		var uppercase_character_name;
		uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 1));
		uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))) - 1);
		var character_name = string(uppercase_character_name);
		scr_draw_text_outlined(window_get_width() / 2 +xx1, window_get_height() / 2 + 232, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		#endregion /* Draw Character Portrait for Player 1 END */
		
		#region /* Player 1 */
		
		#region /* Player 1 change portrait when clicking left or right */
		
		#region /* Player 1 Key Left (change portrait sprites) */
		if (keyboard_check_pressed(global.player1_key_left))
		and (!keyboard_check_pressed(global.player1_key_right))
		or (keyboard_check_pressed(global.player1_key2_left))
		and (!keyboard_check_pressed(global.player1_key2_right))
		or (gamepad_button_check_pressed(0, gp_padl))
		and (!gamepad_button_check_pressed(0, gp_padr))
		or (gamepad_axis_value(0, gp_axislh) < 0)
		and (menu_joystick1_delay <= 0)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
		window_get_width() / 2 + player1_display_x - arrow_offset - 16,
		window_get_height() / 2 - 16,
		window_get_width() / 2 + player1_display_x - arrow_offset + 16,
		window_get_height() / 2 + 16))
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
		and (!keyboard_check_pressed(global.player1_key_left))
		or (keyboard_check_pressed(global.player1_key2_right))
		and (!keyboard_check_pressed(global.player1_key2_left))
		or (gamepad_button_check_pressed(0, gp_padr))
		and (!gamepad_button_check_pressed(0, gp_padl))
		or (gamepad_axis_value(0, gp_axislh) > 0)
		and (menu_joystick1_delay <= 0)
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
		window_get_width() / 2 + player1_display_x + arrow_offset - 16,
		window_get_height() / 2 - 16,
		window_get_width() / 2 + player1_display_x + arrow_offset + 16,
		window_get_height() / 2 + 16))
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
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padl, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player1_key_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player1_key2_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x - arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
				}
			}
					
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				player1_menu = "select_character";
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width() / 2 + player1_display_x - arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x - arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Left END */
		
		#region /* Key Right */
		if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
		and (can_navigate == true)
		{
			if (gamepad_is_connected(0))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padr, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player1_key_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player1_key2_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, window_get_width() / 2 + player1_display_x + arrow_offset, window_get_height() / 2, 0.5, 0.5, 0, c_white, 1);
				}
			}
				
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				player1_menu = "select_character";
				draw_set_alpha(0.5);
				draw_rectangle_color(window_get_width() / 2 + player1_display_x + arrow_offset - 16, window_get_height() / 2 - 16, window_get_width() / 2 + player1_display_x + arrow_offset + 16, window_get_height() / 2 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Right END */
		
		#endregion /* Player 1 END */
		
		scr_draw_text_outlined(window_get_width() / 2, 128, l10n_text("Copy Characters"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		
		#region /* Copy Characters */
		if (can_navigate == true)
		{
			if (global.enable_open_custom_folder == true)
			{
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() - 42 - 42 - 42, l10n_text("Copy Character"), "click_copy_character", "click_copy_character");
			}
			else
			{
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() - 42 - 42, l10n_text("Copy Character"), "click_copy_character", "click_copy_character");
			}
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() - 42 - 42 - 42 + 2, window_get_width() / 2 - 185 + 371, window_get_height() - 42 - 43 + 42 - 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "click_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "click_copy_character")
		and (key_a_pressed)
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
		if (menu == "click_copy_character")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "back_from_copy_character";
			menu = "back_from_copy_character";
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
						with(instance_create_depth(window_get_width() / 2, window_get_height() - 42 - 42 - 42, 0, obj_score_up))
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
		if (can_navigate == true)
		{
			if (global.enable_open_custom_folder == true)
			{
				draw_menu_button(window_get_width() / 2 - 185, window_get_height() - 42 - 42, l10n_text("Open Character Folder"), "open_folder_copy_character", "open_folder_copy_character");
			}
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() - 42 - 42 + 2, window_get_width() / 2 - 185 + 371, window_get_height() - 42 - 41 + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "open_folder_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "open_folder_copy_character")
		and (key_a_pressed)
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
		if (menu == "open_folder_copy_character")
		and (key_up)
		and (menu_delay == 0)
		and (menu_joystick_delay <= 0)
		and (can_navigate == true)
		{
			menu_delay = 3;
			can_navigate = true;
			player1_menu = "click_copy_character";
			menu = "click_copy_character";
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
		if (can_navigate == true)
		{
			draw_menu_button(window_get_width() / 2 - 185, window_get_height() - 42, l10n_text("Back"), "back_from_copy_character", "load_characters");
			draw_sprite_ext(spr_icons_back, 0, window_get_width() / 2 - 185 + 20, window_get_height() - 42 + 21, 1, 1, 0, c_white, 1);
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() - 42 + 2, window_get_width() / 2 - 185 + 371, window_get_height() - 42 - 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_pressed(mb_left))
		and (menu_delay == 0)
		and (can_navigate == true)
		or (menu == "back_from_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (player1_menu = "back_from_copy_character")
		and (key_a_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		or (key_b_pressed)
		and (menu_delay == 0)
		and (can_navigate == true)
		{
			scr_load_character_initializing();
			menu = "load_characters";
			player1_menu = "load_characters";
			menu_delay = 3;
		}
		if (menu == "back_from_copy_character")
		and (key_up)
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
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_sprite_ext(spr_loading, 0, display_get_gui_width() / 2, display_get_gui_height() - 32 - (32 * 6), 1, 1, loading_spinning_angle, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() - 32 - (32 * 5), l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
			scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() - 32 - (32 * 4), string(file_found), global.default_text_size, c_white, c_black, 1);
		}
		
	}
}