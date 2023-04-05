function scr_character_manage_menu_draw()
{
	var uppercase_character_name;
	uppercase_character_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 1));
	uppercase_character_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))) - 1);
	var character_name = string(uppercase_character_name);
	
	if (menu == "click_copy_character")
	or (menu == "click_delete_character")
	or (menu == "click_delete_character_no")
	or (menu == "click_delete_character_yes")
	or (menu == "click_upload_character")
	or (menu == "open_folder_copy_character")
	or (menu == "back_from_copy_character")
	{
		
		#region /* Draw Character Portrait for Player 1 */
		if (global.sprite_select_player_1 > 0)
		{
			draw_sprite_ext(global.sprite_select_player_1, 0, display_get_gui_width() * 0.5 + xx1, display_get_gui_height() * 0.5, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, global.hex_color_for_player_1, 1);
		}
		#endregion /* Draw Character Portrait for Player 1 END */
		
		#region /* Left and Right Keys */
	
		#region /* Key Left */
		if (global.character_index[0] > 0)
		and (can_navigate == true)
		and (menu != "click_delete_character_no")
		and (menu != "click_delete_character_yes")
		{
			if (gamepad_is_connected(global.player1_slot))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padl, display_get_gui_width() * 0.5 + player1_display_x - arrow_offset, display_get_gui_height() * 0.5, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player1_key_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, display_get_gui_width() * 0.5 + player1_display_x - arrow_offset, display_get_gui_height() * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player1_key2_left > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, display_get_gui_width() * 0.5 + player1_display_x - arrow_offset, display_get_gui_height() * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, display_get_gui_width() * 0.5 + player1_display_x - arrow_offset, display_get_gui_height() * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
		
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player1_display_x - arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player1_display_x - arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(display_get_gui_width() * 0.5 + player1_display_x - arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player1_display_x - arrow_offset + 16, display_get_gui_height() * 0.5 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Left END */
	
		#region /* Key Right */
		if (global.character_index[0] < ds_list_size(global.all_loaded_characters) - 1)
		and (can_navigate == true)
		and (menu != "click_delete_character_no")
		and (menu != "click_delete_character_yes")
		{
			if (gamepad_is_connected(global.player1_slot))
			and (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_padr, display_get_gui_width() * 0.5 + player1_display_x + arrow_offset, display_get_gui_height() * 0.5, 0.5, c_white, 1);
			}
			else
			if (asset_get_type("spr_keyboard_keys") == asset_sprite)
			{
				if (global.player1_key_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, display_get_gui_width() * 0.5 + player1_display_x + arrow_offset, display_get_gui_height() * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player1_key2_right > noone)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, display_get_gui_width() * 0.5 + player1_display_x + arrow_offset, display_get_gui_height() * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys_none, 0, display_get_gui_width() * 0.5 + player1_display_x + arrow_offset, display_get_gui_height() * 0.5, 0.5, 0.5, 0, c_white, 1);
				}
			}
		
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 + player1_display_x + arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player1_display_x + arrow_offset + 16, display_get_gui_height() * 0.5 + 16))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				draw_set_alpha(0.5);
				draw_rectangle_color(display_get_gui_width() * 0.5 + player1_display_x + arrow_offset - 16, display_get_gui_height() * 0.5 - 16, display_get_gui_width() * 0.5 + player1_display_x + arrow_offset + 16, display_get_gui_height() * 0.5 + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}
		#endregion /* Key Right END */
	
		#endregion /* Left and Right Keys END */
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 128, l10n_text("Manage Characters"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		
		if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]))))
		{
			var selecting_official_character = true;
		}
		else
		{
			var selecting_official_character = false;
		}
		
		if (global.enable_open_custom_folder == true)
		{
			var character_name_y = display_get_gui_height() - (42 * 6);
			if (selecting_official_character == false)
			{
				var copy_character_y = display_get_gui_height() - (42 * 5);
				var delete_character_y = display_get_gui_height() - (42 * 4);
				var upload_character_y = display_get_gui_height() - (42 * 3);
			}
			else
			{
				var copy_character_y = display_get_gui_height() - (42 * 3);
				var delete_character_y = -9999;
				var upload_character_y = -9999;
			}
			var open_character_folder_y = display_get_gui_height() - 42 - 42;
		}
		else
		{
			if (selecting_official_character == false)
			{
				var copy_character_y = display_get_gui_height() - (42 * 4);
				var delete_character_y = display_get_gui_height() - (42 * 3);
				var upload_character_y = display_get_gui_height() - (42 * 2);
			}
			else
			{
				var copy_character_y = display_get_gui_height() - (42 * 2);
				var delete_character_y = -9999;
				var upload_character_y = -9999;
			}
			var open_character_folder_y = -9999;
		}
		var back_y = display_get_gui_height() - 42;
		
		if string_ends_with(string(character_name), " - Copy")
		{
			/* Show that the character is a copy */
			scr_draw_text_outlined(display_get_gui_width() * 0.5 + player1_display_x, character_name_y + scr_wave(0, 2, 0.5, 0), string(character_name), global.default_text_size, c_menu_outline, c_lime, 1);
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5 + player1_display_x, character_name_y, string(character_name), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		
		if (can_navigate == true)
		{
			if (menu == "click_copy_character")
			or (menu == "click_delete_character")
			or (menu == "click_upload_character")
			or (menu == "open_folder_copy_character")
			or (menu == "back_from_copy_character")
			{
				draw_menu_button(display_get_gui_width() * 0.5 - 185, copy_character_y, l10n_text("Copy Character"), "click_copy_character", "click_copy_character"); /* Copy Characters */
				if (selecting_official_character == false)
				{	
					draw_menu_button(display_get_gui_width() * 0.5 - 185, delete_character_y, l10n_text("Delete Character"), "click_delete_character", "click_delete_character_no"); /* Copy Characters */
					draw_sprite_ext(spr_icons_delete, 0, display_get_gui_width() * 0.5 - 185 + 16, delete_character_y + 21, 1, 1, 0, c_white, 1);
					draw_menu_button(display_get_gui_width() * 0.5 - 185, upload_character_y, l10n_text("Upload Character"), "click_upload_character", "click_upload_character"); /* Copy Characters */
					draw_sprite_ext(spr_icons_upload, 0, display_get_gui_width() * 0.5 - 185 + 16, upload_character_y + 21, 1, 1, 0, c_white, 1);
				}
				
				#region /* Open Character Folder */
				if (global.enable_open_custom_folder == true)
				{
					draw_menu_button(display_get_gui_width() * 0.5 - 185, open_character_folder_y, l10n_text("Open Character Folder"), "open_folder_copy_character", "open_folder_copy_character");
					draw_sprite_ext(spr_icons_folder, 0, display_get_gui_width() * 0.5 - 185 + 16, open_character_folder_y + 21, 1, 1, 0, c_white, 1);
				}
				#endregion /* Open Character Folder END */
				
				#region /* Back from Copy Characters */
				draw_menu_button(display_get_gui_width() * 0.5 - 185, back_y, l10n_text("Back"), "back_from_copy_character", "manage_character");
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 20, back_y + 21, 1, 1, 0, c_white, 1);
				#endregion /* Back from Copy Characters END */
			
			}
			else
			if (menu == "click_delete_character_no")
			or (menu == "click_delete_character_yes")
			{
				var delete_character_no_y = display_get_gui_height() - (42 * 3);
				var delete_character_yes_y = display_get_gui_height() - (42 * 2);
				var delete_x = display_get_gui_width() * 0.5 - 185;
				
				draw_rectangle_color(delete_x, delete_character_no_y - 42 - 3, delete_x + 384, display_get_gui_height(), c_red, c_red, c_red, c_red, false);
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
			draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 6), 1, 1, global.loading_spinning_angle, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 5), l10n_text("Loading"), global.default_text_size, c_white, c_black, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 4), string(file_found), global.default_text_size, c_white, c_black, 1);
		}
	}
	
	var message_x_offset = 400;
	
	#region /* Upload Character Menu */
	if (menu == "upload_yes_character")
	or (menu == "upload_no_character")
	{
		var upload_name_question_y = 432;
		var upload_character_no_y = 532;
		var upload_character_yes_y = 532 + 84;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Draw Character Portrait */
		if (global.sprite_select_player_1 > 0)
		{
			draw_sprite_ext(global.sprite_select_player_1, 0, display_get_gui_width() * 0.5 + xx1, display_get_gui_height() * 0.5, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, global.hex_color_for_player_1, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_rectangle_color(display_get_gui_width() * 0.5 - message_x_offset, upload_name_question_y - 32, display_get_gui_width() * 0.5 + message_x_offset, upload_name_question_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, upload_name_question_y, l10n_text("Upload") + " " + string(character_name) + "?", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Upload Character No */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, upload_character_no_y - 42, display_get_gui_width() * 0.5 + 370, upload_character_no_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_no_character";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, upload_character_no_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_no_character")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_no_character")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, upload_character_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, upload_character_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, upload_character_no_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, upload_character_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, upload_character_no_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Character No END */
	
		#region /* Upload Character Yes */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, upload_character_yes_y - 42, display_get_gui_width() * 0.5 + 370, upload_character_yes_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_yes_character";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, upload_character_yes_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_upload, 0, display_get_gui_width() * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_yes_character")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_yes_character")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, upload_character_yes_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_upload, 0, display_get_gui_width() * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, upload_character_yes_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, upload_character_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_upload, 0, display_get_gui_width() * 0.5 - 370 + 32, upload_character_yes_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Character Yes END */
		
		#region /* Return to game */
		if (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "click_upload_character"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
		#region /* Upload Character Menu Navigation */
		if (menu == "upload_no_character")
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, upload_character_no_y - 42, display_get_gui_width() * 0.5 + 370, upload_character_no_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "click_upload_character"; /* Return to previous menu */
			}
		}
		else
		if (menu == "upload_yes_character")
		{
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, upload_character_yes_y - 42, display_get_gui_width() * 0.5 + 370, upload_character_yes_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				if (os_is_network_connected())
				{
					menu = "uploading_character"; /* Go to uploading character loading screen */
				}
				else
				{
					menu = "no_internet_character";
				}
				menu_delay = 60 * 3;
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
	
	#region /* Uploading Character */
	if (menu == "uploading_character")
	{
		content_type = "character"; /* Set "content type" to be correct for what kind of files you're uploading, before uploading the files to the server */
		var uploading_character_message_y = 532;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Draw Character Portrait */
		if (global.sprite_select_player_1 > 0)
		{
			draw_sprite_ext(global.sprite_select_player_1, 0, display_get_gui_width() * 0.5 + xx1, display_get_gui_height() * 0.5, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, global.hex_color_for_player_1, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_rectangle_color(display_get_gui_width() * 0.5 - message_x_offset, uploading_character_message_y - 32, display_get_gui_width() * 0.5 + message_x_offset, uploading_character_message_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, uploading_character_message_y, l10n_text("Uploading") + " " + string(character_name) + "...", global.default_text_size * 1.9, c_black, c_white, 1);
		
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
			ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
			ini_write_string("info", "character_id", string(character_id)); /* Save the character ID in the character_config.ini file, so that it can be referenced later */
			ini_close();
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
			global.http_request_id = http_request("https://" + global.base_url + global.upload_endpoint + "/characters", "POST", map, post_data);
			
			/* Cleans up! */
			buffer_delete(send_buffer);
			ds_map_destroy(map);
			
			#endregion /* Actually upload the character to the server END */
			
			file_delete(file); /* Delete some leftover files and folders */
			
			if (os_is_network_connected())
			{
				menu = "character_uploaded";
			}
			else
			{
				menu = "no_internet_character";
			}
		}
		#endregion /* Send Zip File to the Server END */
		
	}
	#endregion /* Uploading Character END */
	
	#region /* Character Uploaded */
	if (menu == "character_uploaded")
	{
		var uploaded_character_message_y = 432;
		var ok_y = uploaded_character_message_y + 168;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Draw Character Portrait */
		if (global.sprite_select_player_1 > 0)
		{
			draw_sprite_ext(global.sprite_select_player_1, 0, display_get_gui_width() * 0.5 + xx1, display_get_gui_height() * 0.5, 392 / sprite_get_width(global.sprite_select_player_1), 392 / sprite_get_width(global.sprite_select_player_1), 0, global.hex_color_for_player_1, 1);
		}
		#endregion /* Draw Character Portrait END */
		
		draw_set_alpha(0.9);
		draw_rectangle_color(display_get_gui_width() * 0.5 - message_x_offset, uploaded_character_message_y - 32, display_get_gui_width() * 0.5 + message_x_offset, uploaded_character_message_y + 128, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, uploaded_character_message_y, string(character_name) + " " + l10n_text("Uploaded"), global.default_text_size * 1.9, c_black, c_white, 1);
		/* Show Character ID */ scr_draw_text_outlined(display_get_gui_width() * 0.5, uploaded_character_message_y + 84, l10n_text("Character ID") + ": " + string(character_id), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Character Uploaded OK */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, ok_y - 42, display_get_gui_width() * 0.5 + 370, ok_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "character_uploaded";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "character_uploaded")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "character_uploaded")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Character Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, ok_y - 42, display_get_gui_width() * 0.5 + 370, ok_y + 42))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (mouse_check_button_released(mb_right))
		and (menu_delay == 0)
		or (key_a_pressed)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (menu_delay == 0)
		{
			scr_load_character_initializing();
			menu = "load_characters";
			player1_menu = "select_character"; /* Go back to this menu after reloading all characters */
			menu_delay = 3;
			menu_joystick1_delay = 30;
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
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		/* Don't draw a character thumbnail here, to make it more obvious that there was an error connecting to the internet, because every other screen have a character thumbnail visible usually */
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("No Internet connection"), global.default_text_size * 1.9, c_black, c_white, 1);
		
		var ok_y = display_get_gui_height() * 0.5 + 42 + 42 + 42;
		
		#region /* Character Uploaded OK */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, ok_y - 42, display_get_gui_width() * 0.5 + 370, ok_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "no_internet_character";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "no_internet_character")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "no_internet_character")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, display_get_gui_width() * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, display_get_gui_width() * 0.5 - 370, ok_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Character Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), display_get_gui_width() * 0.5 - 370, ok_y - 42, display_get_gui_width() * 0.5 + 370, ok_y + 42))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (key_a_pressed)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "search_character_id";
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* No Internet END */
	
}