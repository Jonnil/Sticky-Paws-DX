function scr_character_manage_menu_draw()
{
	var enable_edit_character = true;
	
	if (ds_list_size(global.all_loaded_characters) >= global.max_custom_characters)
	{
		var max_custom_characters_reached = true;
	}
	else
	{
		var max_custom_characters_reached = false;
	}
	
	if (os_type == os_switch)
	{
		var enable_copy_character = false;
		var enable_upload_character = false;
	}
	else
	{
		var enable_copy_character = true;
		var enable_upload_character = true;
	}
	
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var fixed_player = 1;
	
	if (menu == "click_edit_character")
	|| (menu == "click_copy_character")
	|| (menu == "click_delete_character")
	|| (menu == "click_delete_character_no")
	|| (menu == "click_delete_character_yes")
	|| (menu == "click_upload_character")
	|| (menu == "open_folder_copy_character")
	|| (menu == "back_from_copy_character")
	{
		
		#region /* Draw character portrait for player 1 */
		if (sprite_exists(global.sprite_select_player[1]))
		{
			draw_sprite_ext(global.sprite_select_player[1], 0, get_window_width * 0.5 + xx[1], get_window_height * 0.5, 392 / sprite_get_width(global.sprite_select_player[1]), 392 / sprite_get_width(global.sprite_select_player[1]), 0, c_white, 1);
		}
		#endregion /* Draw character portrait for player 1 END */
		
		#region /* Left and Right Keys */
	
		#region /* Key Left */
		if (global.character_index[0] > 0)
		&& (can_navigate)
		&& (menu != "click_delete_character_no")
		&& (menu != "click_delete_character_yes")
		{
			if (gamepad_is_connected(global.player_slot[fixed_player]))
			&& (global.controls_used_for_navigation == "gamepad")
			{
				scr_draw_gamepad_buttons(gp_padl, get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset, get_window_height * 0.5, 0.5, c_white, 1, 1, 1, fixed_player);
			}
			else
			{
				if (global.player_[inp.key][fixed_player][1][action.left] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][fixed_player][1][action.left], get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_[inp.key][fixed_player][2][action.left] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][fixed_player][2][action.left], get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
		
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset + 16, get_window_height * 0.5 + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[fixed_player] - arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
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
			if (gamepad_is_connected(global.player_slot[fixed_player]))
			&& (global.controls_used_for_navigation == "gamepad")
			{
				scr_draw_gamepad_buttons(gp_padr, get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset, get_window_height * 0.5, 0.5, c_white, 1, 1, 1, fixed_player);
			}
			else
			{
				if (global.player_[inp.key][fixed_player][1][action.right] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][fixed_player][1][action.right], get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_[inp.key][fixed_player][2][action.right] > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][fixed_player][2][action.right], get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset, get_window_height * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset + 16, get_window_height * 0.5 + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset - 16, get_window_height * 0.5 - 16, get_window_width * 0.5 + player_display_x[fixed_player] + arrow_offset + 16, get_window_height * 0.5 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Right END */
	
		#endregion /* Left and Right Keys END */
		
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			var selecting_official_character = true;
			enable_edit_character = false;
		}
		else
		{
			var selecting_official_character = false;
		}
		
		var char_name_y, edit_character_y, copy_character_y, delete_character_y, upload_character_y, open_character_folder_y;

		if (global.enable_open_custom_folder)
		{
		    if (global.free_communication_available)
			{
				char_name_y = get_window_height - (42 * 6);
			}
			else
			{
				char_name_y = get_window_height - (42 * 5);
			}
		    open_character_folder_y = get_window_height - 42;
		}
		else
		{
			if (global.free_communication_available)
			{
				char_name_y = get_window_height - (42 * 5);
			}
			else
			{
				char_name_y = get_window_height - (42 * 4);
			}
		    open_character_folder_y = -9999;
		}
		
		if (!selecting_official_character)
		{
		    if (global.free_communication_available)
			{
		        copy_character_y = enable_copy_character ? get_window_height - (42 * 4) : -9999;
		        delete_character_y = get_window_height - (42 * 3);
		        upload_character_y = enable_copy_character ? get_window_height - (42 * 2) : -9999;
				edit_character_y = copy_character_y - 42;
		    }
			else
			{
		        copy_character_y = enable_copy_character ? get_window_height - (42 * 3) : -9999;
		        delete_character_y = get_window_height - (42 * 2);
		        upload_character_y = -9999;
				edit_character_y = copy_character_y - 42;
		    }
		}
		else
		{
		    copy_character_y = enable_copy_character ? get_window_height - (42 * 2) : -9999;
		    delete_character_y = -9999;
		    upload_character_y = -9999;
			edit_character_y = copy_character_y - 42;
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]));
		if (string_ends_with(string(character_name), " - Copy"))
		{
			/* Show that the character is a copy */
			scr_draw_text_outlined(get_window_width * 0.5 + player_display_x[fixed_player], char_name_y + scr_wave(0, 2, 0.5, 0), string(character_name), global.default_text_size, c_menu_outline, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5 + player_display_x[fixed_player], char_name_y, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		
		if (can_navigate)
		{
			if (menu == "click_edit_character")
			|| (menu == "click_copy_character")
			|| (menu == "click_delete_character")
			|| (menu == "click_upload_character")
			|| (menu == "open_folder_copy_character")
			|| (menu == "back_from_copy_character")
			{
				if (enable_edit_character)
				{
					draw_menu_button(get_window_width * 0.5 - 185, edit_character_y, l10n_text("Edit Character"), "click_edit_character", "click_edit_character"); /* Edit Characters */
					draw_sprite_ext(spr_icon_pen, 0, get_window_width * 0.5 - 185 + 16, edit_character_y + 21, 1, 1, 0, c_white, 1);
				}
				
				draw_menu_button(get_window_width * 0.5 - 185, copy_character_y, l10n_text("Copy Character"), "click_copy_character", "click_copy_character"); /* Copy Characters */
				if (max_custom_characters_reached)
				{
					draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 185, copy_character_y + 21, 1, 1, 0, c_dkgray, 0.5);
					draw_sprite_ext(spr_lock_icon, 0, get_window_width * 0.5 - 185 + 16, copy_character_y + 21, 1, 1, 0, c_white, 1);
				}
				if (!selecting_official_character)
				{
					draw_menu_button(get_window_width * 0.5 - 185, delete_character_y, l10n_text("Delete Character"), "click_delete_character", "click_delete_character_no", c_red); /* Delete Characters */
					draw_sprite_ext(spr_icon_delete, 0, get_window_width * 0.5 - 185 + 16, delete_character_y + 21, 1, 1, 0, c_white, 1);
					if (global.free_communication_available && enable_upload_character)
					{
						draw_menu_button(get_window_width * 0.5 - 185, upload_character_y, l10n_text("Upload Character"), "click_upload_character", "click_upload_character"); /* Upload Characters */
						draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 185 + 16, upload_character_y + 21, 1, 1, 0, c_white, 1);
					}
				}
				
				#region /* Open Character Folder */
				if (global.enable_open_custom_folder)
				{
					draw_menu_button(get_window_width * 0.5 - 185, open_character_folder_y, l10n_text("Open Character Folder"), "open_folder_copy_character", "open_folder_copy_character");
					draw_sprite_ext(spr_icon_folder, 0, get_window_width * 0.5 - 185 + 16, open_character_folder_y + 21, 1, 1, 0, c_white, 1);
				}
				#endregion /* Open Character Folder END */
				
				#region /* Back from Copy Characters */
				draw_menu_button(0, 0, l10n_text("Back"), "back_from_copy_character", "back_from_copy_character");
				draw_sprite_ext(spr_icon_back, 0, 20, 21, 1, 1, 0, c_white, 1);
				#endregion /* Back from Copy Characters END */
				
				#region /* Get information from character config */
				draw_set_halign(fa_right);
				if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini"))
				{
					ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
					
					#region /* Draw who made the character */
					if (ini_key_exists("info", "username"))
					&& (ini_read_string("info", "username", "") != "")
					{
						scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("By") + ": " + string(ini_read_string("info", "username", "")), global.default_text_size, c_black, c_white, 1);
					}
					#endregion /* Draw who made the character END */
					
					#region /* Draw if character is unlisted */
					if (ini_key_exists("info", "visibility_index"))
					&& (ini_read_string("info", "visibility_index", "") == 1)
					{
						var draw_character_id_y = get_window_height - 96;
						scr_draw_text_outlined(get_window_width - 32, get_window_height - 64, l10n_text("Unlisted"), global.default_text_size, c_black, c_white, 1);
						draw_sprite_ext(spr_icon_unlisted, 0, get_window_width - 32 - string_width(l10n_text("Unlisted")), get_window_height - 64, 1, 1, 0, c_white, 1);
					}
					else
					{
						var draw_character_id_y = get_window_height - 64;
					}
					#endregion /* Draw if character is unlisted END */
					
					#region /* Draw character ID */
					if (ini_key_exists("info", "character_id"))
					&& (ini_read_string("info", "character_id", "") != "")
					{
						var draw_character_id = string(ini_read_string("info", "character_id", ""));
						scr_draw_text_outlined(get_window_width - 32, draw_character_id_y, draw_character_id, global.default_text_size, c_black, c_white, 1);
						draw_sprite_ext(spr_icon_upload, 0, get_window_width - 32 - string_width(draw_character_id), draw_character_id_y, 1, 1, 0, c_white, 1);
					}
					#endregion /* Draw character ID END */
					
					ini_close();
				}
				#endregion /* Get information from character config END */
				
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
				draw_sprite_ext(spr_icon_back, 0, delete_x + 8 + 20, delete_character_no_y + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(delete_x + 8, delete_character_yes_y, l10n_text("Yes"), "click_delete_character_yes", "click_delete_character_yes", c_red);
				draw_sprite_ext(spr_icon_delete, 0, delete_x + 8 + 16, delete_character_yes_y + 21, 1, 1, 0, c_white, 1);
			}
			
		}
		else
		if (!can_navigate) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			scr_draw_loading(1, get_window_width * 0.5, get_window_height - 32 - (32 * 5));
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32 - (32 * 3), string(file_found), global.default_text_size, c_white, c_black, 1);
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 16, string(ds_list_size(global.all_loaded_characters)) + " " + l10n_text("Characters"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		if (ds_list_size(global.all_loaded_characters) >= global.max_custom_characters) /* If there are more than a certain amount of characters stored, warn player about there being too many characters */
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 50, l10n_text("There are too many characters stored! Delete some characters"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 50, l10n_text("There are too many characters stored! Delete some characters"), global.default_text_size * 0.75, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
		}
		
	}
	
	scr_draw_upload_character_menu();
	
}