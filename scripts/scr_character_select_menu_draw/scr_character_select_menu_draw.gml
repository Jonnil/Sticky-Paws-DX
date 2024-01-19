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
	
	var player_join_text_size = 1;
	if (string_width(l10n_text("Player 1 Join")) > 300)
	{
		var player_join_text_size = 0.75;
	}
	
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
		for(var i = 1; i <= global.max_players; i += 1)
		{
			/* Give feedback that you have selected a character, run this before the character portrait code */
			if (player_accept_selection[i] == 1) {
				draw_sprite_ext(spr_select_character_background, image_index, get_window_width * 0.5 + player_display_x[i], get_window_height * 0.5, player_scale[i], player_scale[i], 0, global.player_color[i], 1);
			}
			/* Display Selected Characters, run this before the "play the game" text code */
			if (global.playergame >= i - 1)
			|| (global.skip_how_many_people_are_playing_screen) {
				scr_character_portrait_for_player_draw(i);
			}
		}
		
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
			
			var what_player = 1;
			if (player_accept_selection[1] == 1)
			&& (player_accept_selection[2] != 0)
			&& (player_accept_selection[3] != 0)
			&& (player_accept_selection[4] != 0)
			{
				var what_player = 1;
			}
			else
			if (player_accept_selection[1] != 0)
			&& (player_accept_selection[2])
			&& (player_accept_selection[3] != 0)
			&& (player_accept_selection[4] != 0)
			{
				var what_player = 2;
			}
			else
			if (player_accept_selection[1] != 0)
			&& (player_accept_selection[2] != 0)
			&& (player_accept_selection[3])
			&& (player_accept_selection[4] != 0)
			{
				var what_player = 3;
			}
			else
			if (player_accept_selection[1] != 0)
			&& (player_accept_selection[2] != 0)
			&& (player_accept_selection[3] != 0)
			&& (player_accept_selection[4])
			{
				var what_player = 4;
			}
			
			var player_starts_the_game_text = l10n_text("Player " + string(what_player) + " starts the game");
			draw_set_alpha(0.9);
			draw_roundrect_color_ext(get_window_width * 0.5 - (string_width(player_starts_the_game_text) * 0.5), play_the_game_text_y_lerp + 32, get_window_width * 0.5 + (string_width(player_starts_the_game_text) * 0.5), play_the_game_text_y_lerp + 64, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
			scr_draw_text_outlined(get_window_width * 0.5, play_the_game_text_y_lerp + 45, string(player_starts_the_game_text), global.default_text_size, c_black, global.player_color[what_player], 1);
			
			#region /* Show Key A on screen */
			if (gamepad_is_connected(global.player_slot[what_player]))
			&& (global.controls_used_for_navigation == "gamepad")
			|| (global.always_show_gamepad_buttons)
			{
				scr_draw_gamepad_buttons(global.player_[inp.gp][what_player][1][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, c_white, 1);
			}
			else
			{
				if (global.player_[inp.key][what_player][1][action.accept] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][what_player][1][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_[inp.key][what_player][2][action.accept] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][what_player][2][action.accept], get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + (string_width(l10n_text("Play the game!")) * 0.5) + 64, play_the_game_text_y_lerp, 0.5, 0.5, 0, c_white, 1);
				}
			}
			#endregion /* Show Key A on screen END */
			
		}
		#endregion /* Draw Play the game text END */
		
		#endregion /* Play the game text END */
		
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
		draw_sprite_ext(spr_icon_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
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
				var fixed_player = 1;
				if (global.sprite_select_player[fixed_player] < 0)
				|| (global.sprite_select_player[fixed_player] == spr_noone)
				{
					global.sprite_select_player[fixed_player] = spr_noone;
					global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player]);
					global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player]);
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
			
			if (no_players_are_inputting_names)
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
		if (no_players_are_inputting_names)
		{
			
			#region /* Player Join Text */
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (player_accept_selection[i] <= -1 && !player_automatically_join[i])
				{
					var player_join_x = window_width_half + player_display_x[i];
					if (i % 2 == 0)
					{
						var player_join_y = window_height_half + 32;
					}
					else
					{
						var player_join_y = window_height_half;
					}
					draw_set_halign(fa_right);
					if (point_in_rectangle(mouse_get_x, mouse_get_y, player_join_x - 150, player_join_y - 32, player_join_x + 150, player_join_y + 32) && global.controls_used_for_navigation == "mouse")
					{
						player_menu[i] = "select_character";
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
					scr_draw_text_outlined(player_join_x + 60, player_join_y, l10n_text("Player " + string(i) + " Join"), global.default_text_size * player_join_text_size, player_join_outline_color, global.player_color[i], 1);
					
					#region /* Key A */
					var player_key_accept_1 = global.player_[inp.key][i][1][action.accept];
					var player_key_accept_2 = global.player_[inp.key][i][2][action.accept];
					
					if (i == 1)
					&& ((menu == "select_character" && global.controls_used_for_navigation != "mouse") || global.controls_used_for_navigation == "mouse")
					|| (i >= 2)
					{
						if (gamepad_is_connected(global.player_slot[i]) && (global.controls_used_for_navigation == "gamepad" || global.always_show_gamepad_buttons))
						{
							scr_draw_gamepad_buttons(global.player_[inp.gp][i][1][action.accept], player_join_x + 90, player_join_y, 0.5, c_white, 1);
						}
						else
						{
							var keyboard_sprite_index = 0;
							if (player_key_accept_1 > noone)
							{
								keyboard_sprite_index = player_key_accept_1;
							}
							else if (player_key_accept_2 > noone)
							{
								keyboard_sprite_index = player_key_accept_2;
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
			}
			#endregion /* Player Join Text END */
			
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