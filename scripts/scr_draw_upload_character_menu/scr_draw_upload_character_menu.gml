function scr_draw_upload_character_menu()
{
	var fixed_player = 1;
	var destroy_zip_after_uploading = true; /* Game should destroy the zip file once it's been uploaded to the server as a zip file. By default set this to true */
	var character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]));
	var message_x_offset = 400;
	
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Upload Character Menu */
	if (menu == "upload_yes_character")
	|| (menu == "upload_no_character")
	|| (menu == "upload_clear_check_character_again")
	|| (menu == "upload_clear_check_character_open_character_folder")
	{
		var upload_name_question_y = window_get_height() * 0.5;
		var upload_character_no_y = (window_get_height() * 0.5) + 100;
		var upload_character_yes_y = (window_get_height() * 0.5) + 184;
		var upload_clear_check_character_again_y = (window_get_height() * 0.5) + 184 + 84;
		var upload_clear_check_character_open_character_folder_y = (window_get_height() * 0.5) + 184 + 84 + 42;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Draw Character Portrait */
		if (global.sprite_select_player[fixed_player] > 0)
		{
			draw_sprite_ext(global.sprite_select_player[fixed_player], 0, get_window_width * 0.5 + xx[fixed_player], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 0, c_white, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(get_window_width * 0.5 - message_x_offset, upload_name_question_y - 32, get_window_width * 0.5 + message_x_offset, upload_name_question_y + 32, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, upload_name_question_y, l10n_text("Upload") + " " + string(character_name) + "?", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Upload Character No */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_no_y - 42, get_window_width * 0.5 + 370, upload_character_no_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "upload_no_character";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_no_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_no_character")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "upload_no_character")
			&& (global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Character No END */
		
		#region /* Upload Character Yes */
		if (file_exists(working_directory + "custom_characters/" + character_name + "/data/character_config.ini"))
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_yes_y - 42, get_window_width * 0.5 + 370, upload_character_yes_y + 42))
			&& (global.controls_used_for_navigation == "mouse")
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "upload_yes_character";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_yes_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				if (menu == "upload_yes_character")
				&& (global.controls_used_for_navigation == "keyboard")
				|| (menu == "upload_yes_character")
				&& (global.controls_used_for_navigation == "gamepad")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_yes_y, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
					draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
					draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
				}
			}
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("character_config.ini is missing"), global.default_text_size * 1.5, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("character_config.ini is missing"), global.default_text_size * 1.5, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		#endregion /* Upload Character Yes END */
		
		draw_menu_button(get_window_width * 0.5 - 185, upload_clear_check_character_again_y, "Clear Check Again", "upload_clear_check_character_again", "upload_clear_check_character_again");
		
		if (global.enable_open_custom_folder)
		{
			draw_menu_button(get_window_width * 0.5 - 185, upload_clear_check_character_open_character_folder_y, "Open Character Folder", "upload_clear_check_character_open_character_folder", "upload_clear_check_character_open_character_folder");
			draw_sprite_ext(spr_icon_folder, 0, get_window_width * 0.5 - 185 + 16, upload_clear_check_character_open_character_folder_y + 21, 1, 1, 0, c_white, 1);
		}
		
		#region /* Click Character Clear Check Again */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, upload_clear_check_character_again_y - 21, get_window_width * 0.5 + 185, upload_clear_check_character_again_y + 21))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu == "upload_clear_check_character_again")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_a_pressed)
		&& (menu == "upload_clear_check_character_again")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			
			#region /* Set clear_check_character to false whenever you agree to do a clear check for the first time, just in case it's already not */
			if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
			&& (character_name != "")
			{
				ini_open(working_directory + "custom_characters/" + string(character_name) + "/data/character_config.ini");
				ini_write_real("info", "clear_check_character", false); /* Set "clear check" to false when you click on "clear check yes" just in case it isn't already false when doing a "clear check" */
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* Set clear_check_character to false whenever you agree to do a clear check for the first time, just in case it's already not END */
			
			global.select_level_index = 1; /* When doing clear check for character, they have to complete level 1 */
			global.character_select_in_this_menu = "main_game"; /* Play the official Level 1, always */
			
			var no_players_can_play = true;
			for(var i = 1; i <= global.max_players; i += 1)
			{
			    if (global.player_can_play[i])
			    {
			        no_players_can_play = false;
			        break; /* Exit the loop if at least one player can play */
			    }
			}
			if (no_players_can_play) /* When no player can play */
			|| (global.playergame <= 0)
			{
				global.player_can_play[fixed_player] = true; /* If there are no players joined, make it so player 1 is joined */
			}
			
			global.doing_clear_check_character = true; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
			global.actually_play_edited_level = true;
			global.play_edited_level = true;
			can_navigate = false;
			menu_delay = 9999;
			if (instance_exists(obj_camera))
			{
				obj_camera.iris_zoom = 0;
			}
		}
		#endregion /* Click Character Clear Check Again END */
		
		#region /* Click Character Clear Check Open Character Folder */
		if (global.enable_open_custom_folder)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, upload_clear_check_character_open_character_folder_y - 21, get_window_width * 0.5 + 185, upload_clear_check_character_open_character_folder_y + 21))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu == "upload_clear_check_character_open_character_folder")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (global.enable_open_custom_folder)
		&& (key_a_pressed)
		&& (menu == "upload_clear_check_character_open_character_folder")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "upload_clear_check_character_open_character_folder";
			
			if (directory_exists("characters\\" + character_name))
			{
				scr_open_folder(game_save_id + "\custom_characters\\");
			}
			else
			if (directory_exists(game_save_id + "\custom_characters\\" + character_name))
			{
				scr_open_folder(game_save_id + "\custom_characters\\" + character_name);
			}
		}
		#endregion /* Click Character Clear Check Open Character Folder END */
		
		#region /* Return to game */
		if (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			
			#region /* Set clear_check_character to false whenever you back out from uploading custom character, in case you edit the custom character later */
			if (character_name != "")
			{
				ini_open(working_directory + "custom_characters/" + string(character_name) + "/data/character_config.ini");
				ini_write_real("info", "clear_check_character", false); /* Set "clear check" to false */
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* Set clear_check_character to false whenever you back out from uploading custom character, in case you edit the custom character later END */
			
			menu_delay = 3;
			menu = "click_upload_character"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
		#region /* Upload Character Menu Navigation */
		if (menu == "upload_no_character")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_no_y - 42, get_window_width * 0.5 + 370, upload_character_no_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				
				#region /* Set clear_check_character to false whenever you back out from uploading custom character, in case you edit the custom character later */
				if (character_name != "")
				{
					ini_open(working_directory + "custom_characters/" + string(character_name) + "/data/character_config.ini");
					ini_write_real("info", "clear_check_character", false); /* Set "clear check" to false */
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Set clear_check_character to false whenever you back out from uploading custom character, in case you edit the custom character later END */
				
				menu_delay = 3;
				menu = "click_upload_character"; /* Return to previous menu */
			}
		}
		else
		if (menu == "upload_yes_character")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_yes_y - 42, get_window_width * 0.5 + 370, upload_character_yes_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (file_exists(working_directory + "custom_characters/" + character_name + "/data/character_config.ini"))
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (file_exists(working_directory + "custom_characters/" + character_name + "/data/character_config.ini"))
			{
				ini_open(working_directory + "custom_characters/" + string(character_name) + "/data/character_config.ini");
				if (ini_key_exists("info", "clear_check_character"))
				{
					if (ini_read_real("info", "clear_check_character", false))
					{
						if (global.username != "") /* Check if there is an username or not */
						{
							if (os_is_network_connected())
							{
								if (file_exists(working_directory + "custom_characters/" + character_name + "/data/character_config.ini"))
								{
									/* Essential files does exist, so upload now */
									menu = "uploading_character"; /* Go to uploading character loading screen */
									menu_delay = 60 * 3;
								}
							}
							else
							{
								menu_delay = 3;
								menu = "no_internet_character";
							}
						}
						else
						{
							keyboard_string = "";
							menu_delay = 3;
							menu = "upload_character_edit_username_ok"; /* If there isn't an username, have the player make an username */
						}
					}
					else
					{
						menu_delay = 3;
						menu = "clear_check_character_yes";
					}
				}
				else
				{
					menu_delay = 3;
					menu = "clear_check_character_yes";
				}
				ini_close();
			}
		}
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "upload_no_character")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "upload_clear_check_character_open_character_folder";
				}
				else
				{
					menu = "upload_clear_check_character_again";
				}
			}
			else
			if (menu == "upload_yes_character")
			{
				menu = "upload_no_character";
			}
			else
			if (menu == "upload_clear_check_character_again")
			{
				menu = "upload_yes_character";
			}
			else
			if (menu == "upload_clear_check_character_open_character_folder")
			{
				menu = "upload_clear_check_character_again";
			}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "upload_no_character")
			{
				menu = "upload_yes_character";
			}
			else
			if (menu == "upload_yes_character")
			{
				menu = "upload_clear_check_character_again";
			}
			else
			if (menu == "upload_clear_check_character_again")
			{
				if (global.enable_open_custom_folder)
				{
					menu = "upload_clear_check_character_open_character_folder";
				}
				else
				{
					menu = "upload_no_character";
				}
			}
			else
			if (menu == "upload_clear_check_character_open_character_folder")
			{
				menu = "upload_no_character";
			}
		}
		#endregion /* Upload Character Menu Navigation END */
		
	}
	#endregion /* Upload Character Menu END */
	
	else
	
	#region /* Draw clear check character menu */
	if (menu == "clear_check_character_no")
	|| (menu == "clear_check_character_yes")
	{
		var do_a_clear_check_character_y = 432;
		var do_a_clear_check_character_no_y = 532;
		var do_a_clear_check_character_yes_y = 532;
		if (!global.doing_clear_check_character)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			
			#region /* Draw Character Portrait */
			if (global.sprite_select_player[fixed_player] > 0)
			{
				draw_sprite_ext(global.sprite_select_player[fixed_player], 0, get_window_width * 0.5 + xx[fixed_player], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 0, c_white, 1);
			}
			#endregion /* Draw Character Portrait END */
			
			draw_set_alpha(0.9);
			draw_roundrect_color_ext(get_window_width * 0.5 - message_x_offset - 74, do_a_clear_check_character_y - 48, get_window_width * 0.5 + message_x_offset + 74, do_a_clear_check_character_y + 64, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
			scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_y - 16, l10n_text("Do a clear check?"), global.default_text_size * 1.9, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_y + 30, l10n_text("Custom character needs to be able to clear level 1 before upload"), global.default_text_size, c_black, c_white, 1);
			
			#region /* Clear Check No */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_character_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_character_no_y + 42))
			&& (global.controls_used_for_navigation == "mouse")
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "clear_check_character_no";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_character_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_character_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_character_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_character_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				if (menu == "clear_check_character_no")
				&& (global.controls_used_for_navigation == "keyboard")
				|| (menu == "clear_check_character_no")
				&& (global.controls_used_for_navigation == "gamepad")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_character_no_y, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_character_no_y, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_character_no_y, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
					draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_character_no_y, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_character_no_y, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
					draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_character_no_y, 1, 1, 0, c_white, 1);
				}
			}
			#endregion /* Clear Check No END */
			
			#region /* Clear Check Yes */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_character_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_character_yes_y + 84 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			{
				if (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "clear_check_character_yes";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_character_yes_y + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_character_yes_y + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_character_yes_y + 84, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				if (menu == "clear_check_character_yes")
				&& (global.controls_used_for_navigation == "keyboard")
				|| (menu == "clear_check_character_yes")
				&& (global.controls_used_for_navigation == "gamepad")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_character_yes_y + 84, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_character_yes_y + 84, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_character_yes_y + 84, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_character_yes_y + 84, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_character_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
				}
			}
			#endregion /* Clear Check Yes END */
			
			#region /* Return to game */
			if (key_b_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "click_upload_character"; /* Return to previous menu */
			}
			#endregion /* Return to game END */
			
		}
		
		#region /* Clear Check Menu Navigation */
		if (menu == "clear_check_character_no")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_character_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_character_no_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "click_upload_character"; /* Return to previous menu */
			}
		}
		else
		if (menu == "clear_check_character_yes")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_character_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_character_yes_y + 84 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				
				#region /* Set clear_check_character to false whenever you agree to do a clear check for the first time, just in case it's already not */
				if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
				&& (character_name != "")
				{
					ini_open(working_directory + "custom_characters/" + string(character_name) + "/data/character_config.ini");
					ini_write_real("info", "clear_check_character", false); /* Set "clear check" to false when you click on "clear check yes" just in case it isn't already false when doing a "clear check" */
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Set clear_check_character to false whenever you agree to do a clear check for the first time, just in case it's already not END */
				
				global.select_level_index = 1; /* When doing clear check for character, they have to complete level 1 */
				global.character_select_in_this_menu = "main_game"; /* Play the official Level 1, always */
				
				var no_players_can_play = true;
				for(var i = 1; i <= global.max_players; i += 1)
				{
				    if (global.player_can_play[i])
				    {
				        no_players_can_play = false;
				        break; /* Exit the loop if at least one player can play */
				    }
				}
				if (no_players_can_play) /* When no player can play */
				|| (global.playergame <= 0)
				{
					global.player_can_play[fixed_player] = true; /* If there are no players joined, make it so player 1 is joined */
				}
				
				global.doing_clear_check_character = true; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
				global.actually_play_edited_level = true;
				global.play_edited_level = true;
				can_navigate = false;
				menu_delay = 9999;
				iris_zoom = 0;
				loading_assets = false;
			}
		}
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "clear_check_character_no";
		}
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "clear_check_character_yes";
		}
		#endregion /* Clear Check Character Menu Navigation END */
		
	}
	#endregion /* Draw clear check character menu END */
	
	else
	
	#region /* Draw enter username screen */
	if (menu == "upload_character_edit_username_ok")
	|| (menu == "upload_character_edit_username_cancel")
	{
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var change_username_x = get_window_width * 0.5;
		var change_username_y = 20 + (40 * 5);
		
		#region /* Change username */
		if (menu == "upload_character_edit_username_ok")
		|| (menu == "upload_character_edit_username_cancel")
		{
			global.username = scr_draw_name_input_screen(global.username, 32, c_white, 0.9, false, change_username_x - 185 + 185, change_username_y + 21, "upload_character_edit_username_ok", "upload_character_edit_username_cancel", false);
			
			#region /* Pressing Change Username OK */
			if (key_a_pressed)
			&& (menu = "upload_character_edit_username_ok")
			&& (global.username != "")
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, change_username_x - 185, change_username_y + 22 + 52, change_username_x - 185 + 370, change_username_y + 22 + 52 + 42))
			&& (global.username != "")
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			{
				if (!keyboard_check_pressed(ord("Z")))
				&& (!keyboard_check_pressed(ord("X")))
				&& (!keyboard_check_pressed(vk_backspace))
				&& (!keyboard_check_pressed(vk_space))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					/* Save username to config file */
					ini_open(working_directory + "save_file/config.ini");
					ini_write_string("config", "username", string(global.username));
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					
					menu_delay = 3;
					input_key = false;
					if (os_is_network_connected())
					{
						menu = "uploading_character"; /* Go to uploading character loading screen */
					}
					else
					{
						menu = "no_internet_character";
					}
				}
			}
			#endregion /* Pressing Change Username OK END */
			
			else
			
			#region /* Pressing Change Username Cancel */
			if (key_a_pressed)
			&& (menu = "upload_character_edit_username_cancel")
			|| (key_b_pressed)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, change_username_x - 185, change_username_y + 22 + 52 + 42, change_username_x - 185 + 370, change_username_y + 22 + 52 + 42 + 42))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			{
				if (!keyboard_check_pressed(ord("Z")))
				&& (!keyboard_check_pressed(ord("X")))
				&& (!keyboard_check_pressed(vk_backspace))
				&& (!keyboard_check_pressed(vk_space))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					/* Save username as blank to config file, then go back */
					ini_open(working_directory + "save_file/config.ini");
					ini_write_string("config", "username", "");
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					global.username = "";
					keyboard_string = "";
					menu_delay = 3;
					input_key = false;
					menu = "click_upload_character"; /* Go back to the upload character button */
				}
			}
			#endregion /* Pressing Change Username Cancel END */
			
		}
		#region /* Draw the username text above everything */
		if (global.username != "")
		{
			scr_draw_text_outlined(change_username_x, 20 + (40 * 4), l10n_text("Account name") + ": " + string(global.username), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			scr_draw_text_outlined(change_username_x, 20 + (40 * 4), l10n_text("No username!"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(change_username_x, 20 + (40 * 4), l10n_text("No username!"), global.default_text_size, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
		}
		#endregion /* Draw the username text above everything END */
		
		#endregion /* Change username END */
		
	}
	#endregion /* Draw enter username screen END */
	
	#region /* Uploading Character */
	if (menu == "uploading_character")
	{
		content_type = "character"; /* Set "content type" to be correct for what kind of files you're uploading, before uploading the files to the server */
		var uploading_character_message_y = 532;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Draw Character Portrait */
		if (global.sprite_select_player[fixed_player] > 0)
		{
			draw_sprite_ext(global.sprite_select_player[fixed_player], 0, get_window_width * 0.5 + xx[fixed_player], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 0, c_white, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(get_window_width * 0.5 - message_x_offset, uploading_character_message_y - 32, get_window_width * 0.5 + message_x_offset, uploading_character_message_y + 32, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploading_character_message_y, l10n_text("Uploading") + " " + string(character_name) + "...", global.default_text_size * 1.9, c_black, c_white, 1);
		
		if (menu_delay >= 41)
		{
			scr_draw_text_outlined(get_window_width * 0.5, uploading_character_message_y + 42, l10n_text("Generating Level ID"), global.default_text_size, c_black, c_dkgray, 1);
		}
		else
		if (menu_delay <= 40)
		&& (!file_exists(working_directory + string(character_id) + ".zip"))
		{
			scr_draw_text_outlined(get_window_width * 0.5, uploading_character_message_y + 42, l10n_text("Creating Zip File"), global.default_text_size, c_black, c_dkgray, 1);
		}
		else
		if (menu_delay >= 0)
		&& (file_exists(working_directory + string(character_id) + ".zip"))
		{
			scr_draw_text_outlined(get_window_width * 0.5, uploading_character_message_y + 42, l10n_text("Send Zip File to the Server"), global.default_text_size, c_black, c_dkgray, 1);
		}
		
		#region /* Generate Character ID */
		if (menu_delay == 50)
		{
			scr_generate_id("character");
		}
		#endregion /* Generate Character ID END */
		
		#region /* Create Zip File */
		if (menu_delay <= 40)
		&& (!file_exists(working_directory + string(character_id) + ".zip"))
		{
			file = scr_upload_zip_add_files("character"); /* Add all the character files to a new zip file */
		}
		#endregion /* Create Zip File END */
		
		#region /* Send Zip File to the Server */
		if (menu_delay == 0)
		&& (file_exists(working_directory + string(character_id) + ".zip"))
		{
			var zip_file = file_bin_open(working_directory + string(character_id) + ".zip", 0);
			var zip_size = file_bin_size(zip_file);
			file_bin_close(zip_file);
			zip_megabytes = zip_size / 1024 / 1024;
			
			if (zip_megabytes > global.max_file_upload_megabytes)
			{
				if (destroy_zip_after_uploading) /* Delete some leftover files and folders */
				{
					file_delete(working_directory + string(character_id) + ".zip");
				}
				menu = "error_character_too_big";
			}
			else
			{
				scr_switch_expand_save_data(); /* Expand the save data before upload */
				if (global.save_data_size_is_sufficient)
				{
					#region /* Actually upload the character to the server */
					
					content_type = "character"; /* Set "content type" to be correct for what kind of files you're uploading, before uploading the files to the server */
					
					/* User is prompted for a file to upload */
					file_name = filename_name(file);
					
					/* Create DS Map to hold the HTTP Header info */
					map = ds_map_create();
					
					/* Add to the header DS Map */
					ds_map_add(map, "Host", global.base_url);
					var boundary = "----GMBoundary";
					ds_map_add(map, "Content-Type", "multipart/form-data; boundary=" + boundary);
					ds_map_add(map, "User-Agent", "gmuploader");
					ds_map_add(map, "X-API-Key", global.api_key);
					
					/* Loads the file into a buffer */
					send_buffer = buffer_create(1, buffer_grow, 1);
					buffer_load_ext(send_buffer, file, 0);
					
					/* Encodes the data as base64 */
					data_send = buffer_base64_encode(send_buffer, 0, buffer_get_size(send_buffer));
					
					/* Post the data to the upload script */
					var post_data = "--" + boundary + "\r\n";
					post_data += "Content-Disposition: form-data; name=\"name\"\r\n\r\n";
					post_data += file_name + "\r\n";
					post_data += "--" + boundary + "\r\n";
					post_data += "Content-Disposition: form-data; name=\"content_type\"\r\n\r\n";
					post_data += "characters" + "\r\n";
					post_data += "--" + boundary + "\r\n";
					post_data += "Content-Disposition: form-data; name=\"data\"\r\n\r\n";
					post_data += data_send + "\r\n";
					post_data += "--" + boundary + "--";
					
					/* Add the Content-Length header to the map */
					ds_map_add(map, "Content-Length", string(string_length(post_data)));
					global.http_request_id = http_request("https://" + global.base_url + global.upload_endpoint, "POST", map, post_data);
					
					/* Cleans up! */
					buffer_delete(send_buffer);
					ds_map_destroy(map);
					
					#endregion /* Actually upload the character to the server END */
					
					if (destroy_zip_after_uploading) /* Delete some leftover files and folders */
					{
						file_delete(working_directory + string(character_id) + ".zip");
					}
					
					if (os_is_network_connected())
					{
						menu_delay = 3;
						search_for_id_still = false;
						menu = "character_uploaded";
					}
					else
					{
						menu_delay = 3;
						menu = "no_internet_character";
					}
				}
			}
		}
		#endregion /* Send Zip File to the Server END */
		
	}
	#endregion /* Uploading Character END */
	
	#region /* Error Character Too Big */
	if (menu == "error_character_too_big")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 42, l10n_text("Character Too Big"), global.default_text_size * 2, c_black, c_white, 1);
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string(zip_megabytes) + " MB / " + string(global.max_file_upload_megabytes) + " MB", global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string(zip_megabytes) + " MB / " + string(global.max_file_upload_megabytes) + " MB", global.default_text_size, c_black, c_red, scr_wave(0, 1, 1, 0));
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 + 32, l10n_text("There is a max upload size, please make it smaller"), global.default_text_size, c_black, c_white, 1);
		
		var ok_y = get_window_height * 0.5 + 42 + 42 + 42;
		
		#region /* OK Button */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "error_character_too_big";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "error_character_too_big")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "error_character_too_big")
			&& (global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* OK Button END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (!level_editor_edit_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "click_upload_character"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* Error Character Too Big END */
	
	#region /* Character Uploaded */
	if (menu == "character_uploaded")
	{
		var uploaded_character_message_y = 432;
		var ok_y = uploaded_character_message_y + 168;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Draw Character Portrait */
		if (global.sprite_select_player[fixed_player] > 0)
		{
			draw_sprite_ext(global.sprite_select_player[fixed_player], 0, get_window_width * 0.5 + xx[fixed_player], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 392 / sprite_get_width(global.sprite_select_player[fixed_player]), 0, c_white, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(get_window_width * 0.5 - message_x_offset, uploaded_character_message_y - 32, get_window_width * 0.5 + message_x_offset, uploaded_character_message_y + 128, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploaded_character_message_y, string(character_name) + " " + l10n_text("Uploaded"), global.default_text_size * 1.9, c_black, c_white, 1);
		/* Show Character ID */ scr_draw_text_outlined(get_window_width * 0.5, uploaded_character_message_y + 84, l10n_text("Character ID") + ": " + string_upper(character_id), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Character Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				search_for_id_still = false;
				menu = "character_uploaded";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "character_uploaded")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "character_uploaded")
			&& (global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Character Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (mouse_check_button_released(mb_right))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			search_for_id_still = false;
			scr_load_character_initializing();
			menu = "load_characters";
			player_menu[fixed_player] = "select_character"; /* Go back to this menu after reloading all characters */
			menu_delay = 3;
			menu_specific_joystick_delay[fixed_player] = 30;
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* Character Uploaded END */
	
	#region /* No Internet */
	if (menu == "no_internet_character")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		/* Don't draw a character thumbnail here, to make it more obvious that there was an error connecting to the internet, because every other screen have a character thumbnail visible usually */
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("No Internet connection"), global.default_text_size * 1.9, c_black, c_white, 1);
		
		var ok_y = get_window_height * 0.5 + 42 + 42 + 42;
		
		#region /* Character Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "no_internet_character";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "no_internet_character")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "no_internet_character")
			&& (global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Character Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			menu = "download_online_search_id";
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* No Internet END */
	
}