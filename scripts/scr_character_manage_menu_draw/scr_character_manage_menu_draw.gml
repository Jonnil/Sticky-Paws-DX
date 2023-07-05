function scr_character_manage_menu_draw()
{
	var character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]));
	var max_megabytes = 32;
	
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	if (menu == "click_copy_character")
	|| (menu == "click_delete_character")
	|| (menu == "click_delete_character_no")
	|| (menu == "click_delete_character_yes")
	|| (menu == "click_upload_character")
	|| (menu == "open_folder_copy_character")
	|| (menu == "back_from_copy_character")
	{
		
		#region /* Draw Character Portrait for Player 1 */
		if (global.sprite_select_player[1] > 0)
		{
			draw_sprite_ext(global.sprite_select_player[1], 0, get_window_width * 0.5 + xx[1], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[1]), 392 / sprite_get_width(global.sprite_select_player[1]), 0, global.hex_color_for_player1, 1);
		}
		#endregion /* Draw Character Portrait for Player 1 END */
		
		#region /* Left and Right Keys */
	
		#region /* Key Left */
		if (global.character_index[0] > 0)
		&& (can_navigate)
		&& (menu != "click_delete_character_no")
		&& (menu != "click_delete_character_yes")
		{
			if (gamepad_is_connected(global.player1_slot))
			&& (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padl, get_window_width * 0.5 + player_display_x[1] - arrow_offset, get_window_height * 0.5, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player_[inp.key][1][1][action.left] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.left], get_window_width * 0.5 + player_display_x[1] - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_[inp.key][1][2][action.left] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.left], get_window_width * 0.5 + player_display_x[1] - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x[1] - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
		
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[1] - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[1] - arrow_offset + 16, get_window_height * 0.5 + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width * 0.5 + player_display_x[1] - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[1] - arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Left END */
	
		#region /* Key Right */
		if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
		&& (can_navigate)
		&& (menu != "click_delete_character_no")
		&& (menu != "click_delete_character_yes")
		{
			if (gamepad_is_connected(global.player1_slot))
			&& (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padr, get_window_width * 0.5 + player_display_x[1] + arrow_offset, get_window_height * 0.5, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player_[inp.key][1][1][action.right] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.right], get_window_width * 0.5 + player_display_x[1] + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_[inp.key][1][2][action.right] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.right], get_window_width * 0.5 + player_display_x[1] + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x[1] + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
		
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[1] + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[1] + arrow_offset + 16, get_window_height * 0.5 + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width * 0.5 + player_display_x[1] + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[1] + arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Right END */
	
		#endregion /* Left and Right Keys END */
		
		scr_draw_text_outlined(get_window_width * 0.5, 128, l10n_text("Manage Characters"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			var selecting_official_character = true;
		}
		else
		{
			var selecting_official_character = false;
		}
		
		if (global.enable_open_custom_folder)
		{
			var character_name_y = get_window_height - (42 * 6);
			if (selecting_official_character == false)
			{
				var copy_character_y = get_window_height - (42 * 5);
				var delete_character_y = get_window_height - (42 * 4);
				var upload_character_y = get_window_height - (42 * 3);
			}
			else
			{
				var copy_character_y = get_window_height - (42 * 3);
				var delete_character_y = -9999;
				var upload_character_y = -9999;
			}
			var open_character_folder_y = get_window_height - 42 - 42;
		}
		else
		{
			if (selecting_official_character == false)
			{
				var copy_character_y = get_window_height - (42 * 4);
				var delete_character_y = get_window_height - (42 * 3);
				var upload_character_y = get_window_height - (42 * 2);
			}
			else
			{
				var copy_character_y = get_window_height - (42 * 2);
				var delete_character_y = -9999;
				var upload_character_y = -9999;
			}
			var open_character_folder_y = -9999;
		}
		var back_y = get_window_height - 42;
		
		if string_ends_with(string(character_name), " - Copy")
		{
			/* Show that the character is a copy */
			scr_draw_text_outlined(get_window_width * 0.5 + player_display_x[1], character_name_y + scr_wave(0, 2, 0.5, 0), string(character_name), global.default_text_size, c_menu_outline, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5 + player_display_x[1], character_name_y, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		
		if (can_navigate)
		{
			if (menu == "click_copy_character")
			|| (menu == "click_delete_character")
			|| (menu == "click_upload_character")
			|| (menu == "open_folder_copy_character")
			|| (menu == "back_from_copy_character")
			{
				draw_menu_button(get_window_width * 0.5 - 185, copy_character_y, l10n_text("Copy Character"), "click_copy_character", "click_copy_character"); /* Copy Characters */
				if (selecting_official_character == false)
				{
					draw_menu_button(get_window_width * 0.5 - 185, delete_character_y, l10n_text("Delete Character"), "click_delete_character", "click_delete_character_no"); /* Copy Characters */
					draw_sprite_ext(spr_icons_delete, 0, get_window_width * 0.5 - 185 + 16, delete_character_y + 21, 1, 1, 0, c_white, 1);
					draw_menu_button(get_window_width * 0.5 - 185, upload_character_y, l10n_text("Upload Character"), "click_upload_character", "click_upload_character"); /* Copy Characters */
					draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 185 + 16, upload_character_y + 21, 1, 1, 0, c_white, 1);
				}
				
				#region /* Open Character Folder */
				if (global.enable_open_custom_folder)
				{
					draw_menu_button(get_window_width * 0.5 - 185, open_character_folder_y, l10n_text("Open Character Folder"), "open_folder_copy_character", "open_folder_copy_character");
					draw_sprite_ext(spr_icons_folder, 0, get_window_width * 0.5 - 185 + 16, open_character_folder_y + 21, 1, 1, 0, c_white, 1);
				}
				#endregion /* Open Character Folder END */
				
				#region /* Back from Copy Characters */
				draw_menu_button(get_window_width * 0.5 - 185, back_y, l10n_text("Back"), "back_from_copy_character", "manage_character");
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, back_y + 21, 1, 1, 0, c_white, 1);
				#endregion /* Back from Copy Characters END */
				
				#region /* Draw who made the character */
				draw_set_halign(fa_right);
				if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
				{
					ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
					if (ini_key_exists("info", "username"))
					and (ini_read_string("info", "username", "") != "")
					{
						scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("By") + ": " + string(ini_read_string("info", "username", "")), global.default_text_size, c_black, c_white, 1);
					}
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				#endregion /* Draw who made the character END */
				
			}
			else
			if (menu == "click_delete_character_no")
			|| (menu == "click_delete_character_yes")
			{
				var delete_character_no_y = get_window_height - (42 * 3);
				var delete_character_yes_y = get_window_height - (42 * 2);
				var delete_x = get_window_width * 0.5 - 185;
				
				draw_rectangle_color(delete_x, delete_character_no_y - 42 - 3, delete_x + 384, get_window_height, c_red, c_red, c_red, c_red, false);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(delete_x + 200, delete_character_no_y - 21, l10n_text("Delete Character") + "?", global.default_text_size * 1.2, c_white, c_black, 1);
				draw_menu_button(delete_x + 8, delete_character_no_y, l10n_text("No"), "click_delete_character_no", "click_delete_character"); /* + 47 on y */
				draw_sprite_ext(spr_icons_back, 0, delete_x + 8 + 20, delete_character_no_y + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(delete_x + 8, delete_character_yes_y, l10n_text("Yes"), "click_delete_character_yes", "click_delete_character_yes");
				draw_sprite_ext(spr_icons_delete, 0, delete_x + 8 + 16, delete_character_yes_y + 21, 1, 1, 0, c_white, 1);
			}
			
		}
		else
		if (can_navigate == false) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_sprite_ext(spr_loading, 0, get_window_width * 0.5, get_window_height - 32 - (32 * 6), 1, 1, global.loading_spinning_angle, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32 - (32 * 5), l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32 - (32 * 4), string(file_found), global.default_text_size, c_white, c_black, 1);
		}
	}
	
	var message_x_offset = 400;
	
	#region /* Upload Character Menu */
	if (menu == "upload_yes_character")
	|| (menu == "upload_no_character")
	{
		var upload_name_question_y = 432;
		var upload_character_no_y = 532;
		var upload_character_yes_y = 532 + 84;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Draw Character Portrait */
		if (global.sprite_select_player[1] > 0)
		{
			draw_sprite_ext(global.sprite_select_player[1], 0, get_window_width * 0.5 + xx[1], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[1]), 392 / sprite_get_width(global.sprite_select_player[1]), 0, global.hex_color_for_player1, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, upload_name_question_y - 32, get_window_width * 0.5 + message_x_offset, upload_name_question_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, upload_name_question_y, l10n_text("Upload") + " " + string(character_name) + "?", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Upload Character No */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_no_y - 42, get_window_width * 0.5 + 370, upload_character_no_y + 42))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_no_character";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_no_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_no_character")
			&& (global.controls_used_for_menu_navigation == "keyboard")
			|| (menu == "upload_no_character")
			&& (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Character No END */
	
		#region /* Upload Character Yes */
		if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_yes_y - 42, get_window_width * 0.5 + 370, upload_character_yes_y + 42))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				if (menu_delay == 0)
				{
					menu = "upload_yes_character";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_yes_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				if (menu == "upload_yes_character")
				&& (global.controls_used_for_menu_navigation == "keyboard")
				|| (menu == "upload_yes_character")
				&& (global.controls_used_for_menu_navigation == "controller")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_character_yes_y, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
					draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
					draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
				}
			}
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("character_config.ini is missing"), global.default_text_size * 1.5, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_character_yes_y, l10n_text("character_config.ini is missing"), global.default_text_size * 1.5, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		#endregion /* Upload Character Yes END */
		
		#region /* Return to game */
		if (key_b_pressed)
		&& (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "click_upload_character"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
		#region /* Upload Character Menu Navigation */
		if (menu == "upload_no_character")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_no_y - 42, get_window_width * 0.5 + 370, upload_character_no_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "click_upload_character"; /* Return to previous menu */
			}
		}
		else
		if (menu == "upload_yes_character")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_character_yes_y - 42, get_window_width * 0.5 + 370, upload_character_yes_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0)
			{
				if (global.username != "") /* Check if there is an username or not */
				{
					if (os_is_network_connected())
					{
						if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
						{
							/* Essential files does exist, so upload now */
							menu = "uploading_character"; /* Go to uploading character loading screen */
							menu_delay = 60 * 3;
						}
					}
					else
					{
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
		}
		if (key_up)
		{
			menu_delay = 3;
			menu = "upload_no_character";
		}
		if (key_down)
		{
			menu_delay = 3;
			menu = "upload_yes_character";
		}
		#endregion /* Upload Character Menu Navigation END */
		
	}
	#endregion /* Upload Character Menu END */
	
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
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			{
				if (!keyboard_check_pressed(ord("Z")))
				&& (!keyboard_check_pressed(ord("X")))
				&& (!keyboard_check_pressed(vk_backspace))
				&& (menu_delay == 0)
				{
					/* Save username to config file */
					ini_open(working_directory + "config.ini");
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
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			{
				if (!keyboard_check_pressed(ord("Z")))
				&& (!keyboard_check_pressed(ord("X")))
				&& (!keyboard_check_pressed(vk_backspace))
				&& (!keyboard_check_pressed(vk_space))
				&& (menu_delay == 0)
				{
					/* Save username as blank to config file, then go back */
					ini_open(working_directory + "config.ini");
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
		if (global.sprite_select_player[1] > 0)
		{
			draw_sprite_ext(global.sprite_select_player[1], 0, get_window_width * 0.5 + xx[1], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[1]), 392 / sprite_get_width(global.sprite_select_player[1]), 0, global.hex_color_for_player1, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, uploading_character_message_y - 32, get_window_width * 0.5 + message_x_offset, uploading_character_message_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploading_character_message_y, l10n_text("Uploading") + " " + string(character_name) + "...", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Generate Character ID */
		if (menu_delay = 50)
		{
			/* Certain characters is not used as they look too similar to other characters in certain fonts. It's easier to just not include those letters in the Character ID */
			character_id_1 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_2 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_3 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_4 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_5 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_6 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_7 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_8 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id_9 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			character_id = string(character_id_1) + string(character_id_2) + string(character_id_3) + string(character_id_4) + string(character_id_5) + string(character_id_6) + string(character_id_7) + string(character_id_8) + string(character_id_9);
			ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
			ini_write_string("info", "character_id", string(character_id)); /* Save the character ID in the character_config.ini file, so that it can be referenced later */
			ini_write_string("info", "username", string(global.username)); /* Save the username in the level character_config.ini file, so that it can be referenced later */
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		#endregion /* Generate Character ID END */
		
		#region /* Create Zip File */
		if (menu_delay = 40)
		{
			file = scr_upload_zip_add_files("character"); /* Add all the character files to a new zip file */
		}
		#endregion /* Create Zip File END */
		
		#region /* Send Zip File to the Server */
		if (menu_delay <= 0)
		&& (file_exists(working_directory + string(character_id) + ".zip"))
		{
			var zip_file = file_bin_open(working_directory + string(character_id) + ".zip", 0);
			var zip_size = file_bin_size(zip_file);
			file_bin_close(zip_file);
			zip_megabytes = zip_size / 1024 / 1024;
			
			if (zip_megabytes > max_megabytes)
			{
				file_delete(file); /* Delete some leftover files and folders */
				menu = "error_character_too_big";
			}
			else
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
				
				file_delete(file); /* Delete some leftover files and folders */
				
				if (os_is_network_connected())
				{
					search_for_id_still = false;
					menu = "character_uploaded";
				}
				else
				{
					menu = "no_internet_character";
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
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string(zip_megabytes) + " MB / " + string(max_megabytes) + " MB", global.default_text_size, c_black, c_white, 1);
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string(zip_megabytes) + " MB / " + string(max_megabytes) + " MB", global.default_text_size, c_black, c_red, scr_wave(0, 1, 1, 0));
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 + 32, l10n_text("There is a max upload size, please make it smaller"), global.default_text_size, c_black, c_white, 1);
		
		var ok_y = get_window_height * 0.5 + 42 + 42 + 42;
		
		#region /* OK Button */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "error_character_too_big";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "error_character_too_big")
			&& (global.controls_used_for_menu_navigation == "keyboard")
			|| (menu == "error_character_too_big")
			&& (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* OK Button END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		|| (key_a_pressed)
		&& (menu_delay == 0)
		|| (key_b_pressed)
		&& (level_editor_edit_name == false)
		&& (menu_delay == 0)
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
		if (global.sprite_select_player[1] > 0)
		{
			draw_sprite_ext(global.sprite_select_player[1], 0, get_window_width * 0.5 + xx[1], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[1]), 392 / sprite_get_width(global.sprite_select_player[1]), 0, global.hex_color_for_player1, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, uploaded_character_message_y - 32, get_window_width * 0.5 + message_x_offset, uploaded_character_message_y + 128, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploaded_character_message_y, string(character_name) + " " + l10n_text("Uploaded"), global.default_text_size * 1.9, c_black, c_white, 1);
		/* Show Character ID */ scr_draw_text_outlined(get_window_width * 0.5, uploaded_character_message_y + 84, l10n_text("Character ID") + ": " + string(character_id), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Character Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				search_for_id_still = false;
				menu = "character_uploaded";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "character_uploaded")
			&& (global.controls_used_for_menu_navigation == "keyboard")
			|| (menu == "character_uploaded")
			&& (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Character Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		|| (mouse_check_button_released(mb_right))
		&& (menu_delay == 0)
		|| (key_a_pressed)
		&& (menu_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0)
		{
			search_for_id_still = true;
			scr_load_character_initializing();
			menu = "load_characters";
			player_menu[1] = "select_character"; /* Go back to this menu after reloading all characters */
			menu_delay = 3;
			menu_specific_joystick_delay[1] = 30;
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
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "no_internet_character";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "no_internet_character")
			&& (global.controls_used_for_menu_navigation == "keyboard")
			|| (menu == "no_internet_character")
			&& (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Character Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		|| (key_a_pressed)
		&& (menu_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "search_character_id";
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* No Internet END */
	
}