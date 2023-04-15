function scr_draw_upload_level_menu()
{
	
	#region /* Debug toggles */
	var destroy_zip_after_uploading = true; /* Game should destroy the zip file once it's been uploaded to the server as a zip file */
	var skip_clear_check = false;
	#endregion /* Debug toggles END */
	
	var upload_y = 42 * 2;
	var message_x_offset = 400;
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* How many tags */
	var how_may_tags = 0;
	if (tag_art == true){var tag_art_text = "Art" + " ";how_may_tags += 1;}else{var tag_art_text = "";};
	if (tag_boss_battle == true){var tag_boss_battle_text = "Boss Battle" + " ";how_may_tags += 1;}else{var tag_boss_battle_text = "";};
	if (tag_dont_move == true){var tag_dont_move_text = "Don't Move" + " ";how_may_tags += 1;}else{var tag_dont_move_text = "";};
	if (tag_kaizo == true){var tag_kaizo_text = "Kaizo" + " ";how_may_tags += 1;}else{var tag_kaizo_text = "";};
	if (tag_multiplayer == true){var tag_multiplayer_text = "Multiplayer Only" + " ";how_may_tags += 1;}else{var tag_multiplayer_text = "";};
	if (tag_music == true){var tag_music_text = "Music" + " ";how_may_tags += 1;}else{var tag_music_text = "";};
	if (tag_puzzle_solving == true){var tag_puzzle_solving_text = "Puzzle-solving" + " ";how_may_tags += 1;}else{var tag_puzzle_solving_text = "";};
	if (tag_short_and_sweet == true){var tag_short_and_sweet_text = "Short and Sweet" + " ";how_may_tags += 1;}else{var tag_short_and_sweet_text = "";};
	if (tag_singleplayer == true){var tag_singleplayer_text = "Singleplayer Only" + " ";how_may_tags += 1;}else{var tag_singleplayer_text = "";};
	if (tag_speedrun == true){var tag_speedrun_text = "Speedrun" + " ";how_may_tags += 1;}else{var tag_speedrun_text = "";};
	if (tag_standard == true){var tag_standard_text = "Standard" + " ";how_may_tags += 1;}else{var tag_standard_text = "";};
	if (tag_technical == true){var tag_technical_text = "Technical" + " ";how_may_tags += 1;}else{var tag_technical_text = "";};
	if (tag_themed == true){var tag_themed_text = "Themed" + " ";how_may_tags += 1;}else{var tag_themed_text = "";};
	#endregion /* How many tags END */
	
	#region /* Pressing the Upload button */
	if (menu == "level_editor_upload")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = true;
		}
		can_input_level_name = false;
		if (room == room_title)
		and (point_in_rectangle(mouse_get_x, mouse_get_y, 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (upload_y) - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (upload_y) - 3 + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		or (room = room_leveleditor)
		and (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42 + 42 + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		or (key_a_pressed)
		{
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			menu_delay = 10;
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			if (ini_key_exists("info", "clear_check"))
			and (skip_clear_check == false)
			or (skip_clear_check == true)
			{
				if (ini_read_real("info", "clear_check", false) == true)
				and (skip_clear_check == false)
				or (skip_clear_check == true)
				{
					if (global.username != "") /* Check if there is an username or not */
					{
						if (os_is_network_connected()) /* Check if you're even connected to the internet */
						{
							
							#region /* loads tags from level_information.ini */
							ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
							tag_art = ini_read_real("tags", "tag_art", false);
							tag_boss_battle = ini_read_real("tags", "tag_boss_battle", false);
							tag_dont_move = ini_read_real("tags", "tag_dont_move", false);
							tag_kaizo = ini_read_real("tags", "tag_kaizo", false);
							tag_multiplayer = ini_read_real("tags", "tag_multiplayer", false);
							tag_music = ini_read_real("tags", "tag_music", false);
							tag_puzzle_solving = ini_read_real("tags", "tag_puzzle_solving", false);
							tag_short_and_sweet = ini_read_real("tags", "tag_short_and_sweet", false);
							tag_singleplayer = ini_read_real("tags", "tag_singleplayer", false);
							tag_speedrun = ini_read_real("tags", "tag_speedrun", false);
							tag_standard = ini_read_real("tags", "tag_standard", false);
							tag_technical = ini_read_real("tags", "tag_technical", false);
							tag_themed = ini_read_real("tags", "tag_themed", false);
							intended_level_difficulty = ini_read_real("info", "intended_level_difficulty", 1);
							ini_close();
							#endregion /* loads tags from level_information.ini END */
							
							menu_delay = 3;
							menu = "upload_edit_name"; /* Go to the menu where you can edit things about the custom level before uploading it*/
							if (variable_instance_exists(self, "show_level_editor_corner_menu"))
							{
								show_level_editor_corner_menu = false;
							}
						}
						else
						{
							menu_delay = 3;
							menu = "no_internet"; /* If you're not connected to the internet, tell the player that */
							if (variable_instance_exists(self, "show_level_editor_corner_menu"))
							{
								show_level_editor_corner_menu = false;
							}
						}
					}
					else
					{
						keyboard_string = "";
						menu_delay = 3;
						menu = "upload_edit_username_ok"; /* If there isn't an username, have the player make an username */
						if (variable_instance_exists(self, "show_level_editor_corner_menu"))
						{
							show_level_editor_corner_menu = false;
						}
					}
				}
				else
				{
					menu_delay = 3;
					menu = "clear_check_yes";
					if (variable_instance_exists(self, "show_level_editor_corner_menu"))
					{
						show_level_editor_corner_menu = false;
					}
				}
			}
			else
			{
				menu_delay = 3;
				menu = "clear_check_yes";
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = false;
				}
			}
			ini_close();
		}
	}
	#endregion /* Pressing the Upload button END */
	
	else
	
	#region /* Draw clear check menu */
	if (menu == "clear_check_no")
	or (menu == "clear_check_yes")
	{
		var do_a_clear_check_y = 432;
		var do_a_clear_check_no_y = 532;
		var do_a_clear_check_yes_y = 532;
		if (global.doing_clear_check == false)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_alpha(0.9);
			draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
			{
				/* Draw Thumbnail */
				draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
			}
			draw_set_alpha(0.9);
			draw_rectangle_color(get_window_width * 0.5 - message_x_offset, do_a_clear_check_y - 32, get_window_width * 0.5 + message_x_offset, do_a_clear_check_y + 32, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_y, l10n_text("Do a clear check?"), global.default_text_size * 1.9, c_black, c_white, 1);
			
			#region /* Clear Check No */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_no_y + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				if (menu_delay == 0)
				{
					menu = "clear_check_no";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				if (menu == "clear_check_no")
				and (global.controls_used_for_menu_navigation == "keyboard")
				or (menu == "clear_check_no")
				and (global.controls_used_for_menu_navigation == "controller")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_no_y, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
					draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
					draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
				}
			}
			#endregion /* Clear Check No END */
			
			#region /* Clear Check Yes */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_yes_y + 84 + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			{
				if (menu_delay == 0)
				{
					menu = "clear_check_yes";
				}
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_yes_y + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_yes_y + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				if (menu == "clear_check_yes")
				and (global.controls_used_for_menu_navigation == "keyboard")
				or (menu == "clear_check_yes")
				and (global.controls_used_for_menu_navigation == "controller")
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_yes_y + 84, 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_yes_y + 84, 1, 1, 180, c_white, 1);
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_lime, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_white, 1);
					scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
				}
			}
			#endregion /* Clear Check Yes END */
			
			#region /* Return to game */
			if (key_b_pressed)
			and (level_editor_edit_name = false)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "level_editor_upload"; /* Return to previous menu */
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
			}
			#endregion /* Return to game END */
			
		}
		
		#region /* Clear Check Menu Navigation */
		if (menu == "clear_check_no")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_no_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "level_editor_upload"; /* Return to previous menu */
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
			}
		}
		else
		if (menu == "clear_check_yes")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_yes_y + 84 + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				
				#region /* Set clear_check to false whenever you agree to do a clear check for the first time, just in case it's already not */
				if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
				{
					if (global.level_name != "")
					{
						ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					}
					ini_write_real("info", "clear_check", false); /* Set "clear check" to false when you click on "clear check yes" just in case it isn't already false when doing a "clear check" */
					ini_close();
				}
				#endregion /* Set clear_check to false whenever you agree to do a clear check for the first time, just in case it's already not END */
				
				global.doing_clear_check = true; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
				global.actually_play_edited_level = true;
				global.play_edited_level = true;
				can_navigate = false;
				if (room == room_leveleditor)
				{
					pause = false;
					menu_delay = 0;
					global.character_select_in_this_menu = "level_editor";
					room_restart();
				}
				else
				{
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
			}
		}
		if (key_up)
		{
			menu_delay = 3;
			menu = "clear_check_no";
		}
		if (key_down)
		{
			menu_delay = 3;
			menu = "clear_check_yes";
		}
		#endregion /* Clear Check Menu Navigation END */
		
	}
	#endregion /* Draw clear check menu END */
	
	#region /* Draw enter username screen */
	if (menu == "upload_edit_username_ok")
	or (menu == "upload_edit_username_cancel")
	{
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var change_username_x = display_get_gui_width() * 0.5;
		var change_username_y = 20 + (40 * 5);
		
		#region /* Change username */
		if (menu == "upload_edit_username_ok")
		or (menu == "upload_edit_username_cancel")
		{
			global.username = scr_draw_name_input_screen(global.username, 32, c_white, 0.9, false, change_username_x - 185 + 185, change_username_y + 21, "upload_edit_username_ok", "upload_edit_username_cancel", false);
			
			#region /* Pressing Change Username OK */
			if (key_a_pressed)
			and (menu = "upload_edit_username_ok")
			and (global.username != "")
			or (point_in_rectangle(mouse_get_x, mouse_get_y, change_username_x - 185, change_username_y + 22 + 52, change_username_x - 185 + 370, change_username_y + 22 + 52 + 42))
			and (global.username != "")
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			{
				if (!keyboard_check_pressed(ord("Z")))
				and (!keyboard_check_pressed(ord("X")))
				and (!keyboard_check_pressed(vk_backspace))
				and (menu_delay == 0)
				{
					/* Save username to config file */
					ini_open(working_directory + "config.ini");
					ini_write_string("config", "username", string(global.username));
					ini_close();
					
					menu_delay = 3;
					input_key = false;
					if (os_is_network_connected())
					{
						menu = "upload_edit_name"; /* Go to edit name, description, and tags menu */
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
			and (menu = "upload_edit_username_cancel")
			or (key_b_pressed)
			or (point_in_rectangle(mouse_get_x, mouse_get_y, change_username_x - 185, change_username_y + 22 + 52 + 42, change_username_x - 185 + 370, change_username_y + 22 + 52 + 42 + 42))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			{
				if (!keyboard_check_pressed(ord("Z")))
				and (!keyboard_check_pressed(ord("X")))
				and (!keyboard_check_pressed(vk_backspace))
				and (!keyboard_check_pressed(vk_space))
				and (menu_delay == 0)
				{
					/* Save username as blank to config file, then go back */
					ini_open(working_directory + "config.ini");
					ini_write_string("config", "username", "");
					ini_close();
					global.username = "";
					keyboard_string = "";
					menu_delay = 3;
					input_key = false;
					menu = "level_editor_upload";
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
	
	if (keyboard_virtual_status())
	and (keyboard_virtual_height() != 0)
	{
		var draw_name_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var draw_name_y = get_window_height * 0.5 - 22;
	}
	if (keyboard_virtual_status())
	and (keyboard_virtual_height() != 0)
	{
		var draw_description_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var draw_description_y = get_window_height * 0.5 + 42 * 1;
	}
	var draw_tags_y = get_window_height * 0.5 + 42 * 2;
	var edit_name_y = get_window_height * 0.5 + 42 * 3;
	var edit_description_y = get_window_height * 0.5 + 42 * 4;
	var edit_tags_y = get_window_height * 0.5 + 42 * 5;
	var ok_y = get_window_height * 0.5 + 42 * 6;
	var cancel_y = get_window_height * 0.5 + 42 * 7;
	
	#region /* Edit things before uploading */
	if (menu == "upload_edit_name")
	or (menu == "upload_edit_description")
	or (menu == "upload_edit_tags")
	or (menu == "edit_ok")
	or (menu == "edit_cancel")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = false;
		}
		open_sub_menu = true;
		lerp_on = true;
		if (room == room_title)
		{
			if (get_window_height <= 720)
			{
				scroll_to = floor(global.select_level_index / row) + 0.8; /* Scroll the view to fit all the buttons */
			}
			else
			{
				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
			}
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (get_window_height <= 720)
		{
			if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
			{
				/* Draw Thumbnail */
				draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 210, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 1.1, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 1.1, 0, c_white, 1);
			}
		}
		else
		{
			if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
			{
				/* Draw Thumbnail */
				draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
			}
		}
		/* Draw Level Name */ scr_draw_text_outlined(get_window_width * 0.5, draw_name_y, string(global.level_name), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Draw Level Description */
		if (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			if (ini_key_exists("info", "level_description"))
			{
				scr_draw_text_outlined(get_window_width * 0.5, draw_description_y, string(ini_read_string("info", "level_description", "")), global.default_text_size * 1.25, c_black, c_white, 1);
			}
			ini_close();
		}
		#endregion /* Draw Level Description END */
		
		#region /* Draw Level Tags */
		draw_set_halign(fa_center);
		if (tag_art_text == "")
		and (tag_boss_battle_text == "")
		and (tag_dont_move_text == "")
		and (tag_kaizo_text == "")
		and (tag_multiplayer_text == "")
		and (tag_music_text == "")
		and (tag_puzzle_solving_text == "")
		and (tag_short_and_sweet_text == "")
		and (tag_singleplayer_text == "")
		and (tag_speedrun_text == "")
		and (tag_standard_text == "")
		and (tag_technical_text == "")
		and (tag_themed_text == "")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_tags_y, l10n_text("Tags") + ": " + l10n_text("None"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_tags_y, l10n_text("Tags") + ": " + l10n_text("None"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_tags_y, l10n_text("Tags") + ": " +
			string(tag_art_text) +
			string(tag_boss_battle_text) +
			string(tag_dont_move_text) +
			string(tag_kaizo_text) +
			string(tag_multiplayer_text) +
			string(tag_music_text) +
			string(tag_puzzle_solving_text) +
			string(tag_short_and_sweet_text) +
			string(tag_singleplayer_text) +
			string(tag_speedrun_text) +
			string(tag_standard_text) +
			string(tag_technical_text) +
			string(tag_themed_text)
			, global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Draw Level Tags END */
		
		#region /* Draw who made the level */
		draw_set_halign(fa_right);
		if (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			if (ini_key_exists("info", "username"))
			{
				scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("By") + ": " + string(ini_read_string("info", "username", "")), global.default_text_size, c_black, c_white, 1);
			}
			ini_close();
		}
		#endregion /* Draw who made the level END */
		
		draw_menu_button(get_window_width * 0.5 - 185, edit_name_y, l10n_text("Edit Name"), "upload_edit_name", "upload_edit_name");
		draw_sprite_ext(spr_icons_pen, 0, get_window_width * 0.5 - 185 + 16, edit_name_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, edit_description_y, l10n_text("Edit Description"), "upload_edit_description", "upload_edit_description");
		draw_sprite_ext(spr_icons_pen, 0, get_window_width * 0.5 - 185 + 16, edit_description_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, edit_tags_y, l10n_text("Edit Tags"), "upload_edit_tags", "upload_edit_tags");
		draw_sprite_ext(spr_icons_pen, 0, get_window_width * 0.5 - 185 + 16, edit_tags_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, ok_y, l10n_text("Upload"), "edit_ok", "upload_yes");
		draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 185 + 16, ok_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, cancel_y, l10n_text("Cancel"), "edit_cancel", "edit_cancel");
		draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 16, cancel_y + 21, 1, 1, 0, c_white, 1);
		
		#region /* Pressing the Edit Name button */
		if (menu == "upload_edit_name")
		and (menu_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_name_y, get_window_width * 0.5 + 185, edit_name_y + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (level_editor_edit_name = false)
			or (key_a_pressed)
			and (level_editor_edit_name = false)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
				{
					global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
					keyboard_string = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
				}
				old_level_name = global.level_name; /* Need to remember original name of level, so that renaming level doesn't actually happen if you haven't edited the name */
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "upload_enter_name_ok";
			}
		}
		#endregion /* Pressing the Edit Name button END */
		
		#region /* Pressing the Edit Description button */
		if (menu == "upload_edit_description")
		and (menu_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_description_y, get_window_width * 0.5 + 185, edit_description_y + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (level_editor_edit_name = false)
			or (key_a_pressed)
			and (level_editor_edit_name = false)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.level_description = string(global.level_name);
				
				if (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					keyboard_string = ini_read_string("info", "level_description", "");
					ini_close();
				}
				else
				{
					keyboard_string = "";
				}
				old_level_description = global.level_description; /* Need to remember original description of level, so that renaming level doesn't actually happen if you haven't edited the description */
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "upload_enter_description_ok";
			}
		}
		#endregion /* Pressing the Edit Description button END */
		
		#region /* Pressing the Edit Tags button */
		if (menu == "upload_edit_tags")
		and (menu_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_tags_y, get_window_width * 0.5 + 185, edit_tags_y + 42))
			and (mouse_check_button_released(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (level_editor_edit_name = false)
			or (key_a_pressed)
			and (level_editor_edit_name = false)
			{
				level_editor_edit_name = false;
				can_input_level_name = false;
				can_navigate = true;
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "tag_art";
			}
		}
		#endregion /* Pressing the Edit Tags button END */
		
		if (key_up)
		and (menu_delay == 3)
		{
			menu_delay = 3;
			if (menu == "upload_edit_name")
			{
				menu = "edit_cancel";
			}
			else
			if (menu == "upload_edit_description")
			{
				menu = "upload_edit_name";
			}
			else
			if (menu == "upload_edit_tags")
			{
				menu = "upload_edit_description";
			}
			else
			if (menu == "edit_ok")
			{
				menu = "upload_edit_tags";
			}
			else
			if (menu == "edit_cancel")
			{
				menu = "edit_ok";
			}
		}
		if (key_down)
		and (menu_delay == 3)
		{
			menu_delay = 3;
			if (menu == "upload_edit_name")
			{
				menu = "upload_edit_description";
			}
			else
			if (menu == "upload_edit_description")
			{
				menu = "upload_edit_tags";
			}
			else
			if (menu == "upload_edit_tags")
			{
				menu = "edit_ok";
			}
			else
			if (menu == "edit_ok")
			{
				menu = "edit_cancel";
			}
			else
			if (menu == "edit_cancel")
			{
				menu = "upload_edit_name";
			}
		}
		if (menu == "edit_ok")
		and (key_a_pressed)
		and (menu_delay == 0)
		{
			
			#region /* If at any point the game checks that the level isn't clear checked, then go to the clear check menu */
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			if (ini_read_real("info", "clear_check", false) == false)
			and (skip_clear_check == false)
			{
				menu = "clear_check_yes";
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = false;
				}
				menu_delay = 3;
			}
			else
			{
				menu = "upload_yes"; /* Go to upload confirmation screen */
				menu_delay = 3;
			}
			ini_close();
			#endregion /* If at any point the game checks that the level isn't clear checked, then go to the clear check menu END */
			
		}
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, cancel_y, get_window_width * 0.5 + 185, cancel_y + 42))
		and (mouse_check_button_released(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		or (menu == "edit_cancel")
		and (key_a_pressed)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
		}
	}
	#endregion /* Edit things before uploading END */
	
	else
	
	#region /* Edit level name */
	if (menu == "upload_enter_name_ok")
	or (menu == "upload_enter_name_cancel")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		
		if (can_input_level_name == true)
		{
			global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, get_window_width * 0.5, draw_name_y, "upload_enter_name_ok", "upload_enter_name_cancel");
		}
		
		#region /* Input Level Name */
	
		#region /* Press Enter to confirm new name */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		and (keyboard_string != "")
		and (global.level_name != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			and (menu != "upload_enter_name_ok")
			and (menu != "upload_enter_name_cancel")
			or (keyboard_check_pressed(vk_enter))
			and (menu == "upload_enter_name_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_name_y + 54,
			get_window_width * 0.5 - 185 + 370,
			draw_name_y + 54 + 42))
			and (mouse_check_button_released(mb_left))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_accept))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_accept))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_accept))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_accept))
			{
				if (level_editor_edit_name == true)
				and (global.level_name != old_level_name)
				{
					can_navigate = true;
					menu_delay = 3;
					scr_copy_move_files(string(game_save_id) + "\custom_levels\\" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), string(game_save_id) + "\custom_levels\\" + string(global.level_name), true);
					scr_load_custom_level_initializing();
					global.go_to_menu_after_loading_custom_levels = "upload_edit_name";
					menu = "load_custom_level";
					level_editor_edit_name = false;
					if (global.level_name != "")
					{
						ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						ini_write_string("info", "level_name", global.level_name);
						ini_close();
					}
				}
				else
				if (level_editor_edit_name == true)
				and (global.level_name == old_level_name)
				{
					menu = "upload_edit_name";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to confirm new name END */
	
		#region /* Press Escape to back out from name input menu */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		{
			if (keyboard_check_pressed(vk_enter))
			and (menu == "upload_enter_name_cancel")
			or (keyboard_check_pressed(vk_escape))
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_name_y + 54 + 42,
			get_window_width * 0.5 - 185 + 370,
			draw_name_y + 54 + 42 + 42))
			and (mouse_check_button_released(mb_left))
			or (mouse_check_button_pressed(mb_right))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_back))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_back))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_back))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_back))
			{
				menu_delay = 3;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						iris_zoom = 0;
					}
				}
				can_input_level_name = false;
				if (level_editor_edit_name == true)
				{
					menu = "upload_edit_name";
					level_editor_edit_name = false;
				}
				else
				{
					menu = "upload_edit_name";
				}
			}
		}
		#endregion /* Press Escape to back out from name input menu END */
		
		#endregion /* Input Level Name END */
		
	}
	#endregion /* Edit level name END */
	
	else
	
	#region /* Edit level description */
	if (menu == "upload_enter_description_ok")
	or (menu == "upload_enter_description_cancel")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		/* Draw Level Name above description input */ scr_draw_text_outlined(get_window_width * 0.5, draw_name_y, string(global.level_name), global.default_text_size * 1.9, c_black, c_white, 1);
		
		if (can_input_level_name == true)
		{
			global.level_description = scr_draw_name_input_screen(global.level_description, 75, c_black, 1, false, get_window_width * 0.5, draw_description_y, "upload_enter_description_ok", "upload_enter_description_cancel");
		}
		
		#region /* Input Level Description */
		
		#region /* Press Enter to confirm new description */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		and (keyboard_string != "")
		and (global.level_description != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			and (menu != "upload_enter_description_ok")
			and (menu != "upload_enter_description_cancel")
			or (keyboard_check_pressed(vk_enter))
			and (menu == "upload_enter_description_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_description_y + 54,
			get_window_width * 0.5 - 185 + 370,
			draw_description_y + 54 + 42))
			and (mouse_check_button_released(mb_left))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_accept))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_accept))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_accept))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_accept))
			{
				if (level_editor_edit_name == true)
				and (global.level_description != old_level_description)
				{
					can_navigate = true;
					menu_delay = 3;
					
					/* Save description to level_information.ini */
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "level_description", string(global.level_description));
					ini_close();
					
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == true)
				and (global.level_description == old_level_description)
				{
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (asset_get_type("obj_camera") == asset_object)
					and (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							iris_zoom = 0;
						}
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to confirm new description END */
		
		#region /* Press Escape to back out from description input menu */
		if (can_input_level_name == true)
		and (menu_delay == 0)
		{
			if (keyboard_check_pressed(vk_enter))
			and (menu == "upload_enter_description_cancel")
			or (keyboard_check_pressed(vk_escape))
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			get_window_width * 0.5 - 185,
			draw_description_y + 54 + 42,
			get_window_width * 0.5 - 185 + 370,
			draw_description_y + 54 + 42 + 42))
			and (mouse_check_button_released(mb_left))
			or (mouse_check_button_pressed(mb_right))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_back))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_back))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_back))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_back))
			or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_back))
			{
				menu_delay = 3;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						iris_zoom = 0;
					}
				}
				can_input_level_name = false;
				if (level_editor_edit_name == true)
				{
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				{
					menu = "upload_edit_description";
				}
			}
		}
		#endregion /* Press Escape to back out from descriptin input menu END */
	
		#endregion /* Input Level Description END */
		
	}
	#endregion /* Edit level description END */
	
	else
	
	#region /* Edit level tags */
	if (menu == "upload_edit_tags_ok")
	or (menu == "tag_art")
	or (menu == "tag_boss_battle")
	or (menu == "tag_dont_move")
	or (menu == "tag_kaizo")
	or (menu == "tag_multiplayer")
	or (menu == "tag_music")
	or (menu == "tag_puzzle_solving")
	or (menu == "tag_short_and_sweet")
	or (menu == "tag_singleplayer")
	or (menu == "tag_speedrun")
	or (menu == "tag_standard")
	or (menu == "tag_technical")
	or (menu == "tag_themed")
	or (menu == "intended_level_difficulty")
	{
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		#region /* Scroll menu */
		menu_y_offset = lerp(menu_y_offset, menu_y_offset_real, 0.5);
		if (menu_y_offset_real >= 0)
		{
			menu_y_offset_real = 0;
		}
		if (abs(menu_y_offset_real) + get_window_height - 300 < menu_cursor_y_position)
		{
			menu_y_offset_real -= 10;
		}
		if (abs(menu_y_offset_real) + 200 > menu_cursor_y_position)
		{
			menu_y_offset_real += 10;
		}
		if (abs(menu_y_offset_real) + get_window_height + 300 < menu_cursor_y_position)
		{
			menu_y_offset_real -= 100;
		}
		if (abs(menu_y_offset_real) - 200 > menu_cursor_y_position)
		{
			menu_y_offset_real += 100;
		}
		#endregion /* Scroll menu END */
		
		tag_art = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 3) + menu_y_offset, "Art", "tag_art", tag_art);
		tag_boss_battle = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 4) + menu_y_offset, "Boss Battle", "tag_boss_battle", tag_boss_battle);
		tag_dont_move = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 5) + menu_y_offset, "Don't Move", "tag_dont_move", tag_dont_move);
		tag_kaizo = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 6) + menu_y_offset, "Kaizo", "tag_kaizo", tag_kaizo);
		tag_multiplayer = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 7) + menu_y_offset, "Multiplayer Only", "tag_multiplayer", tag_multiplayer);
		tag_music = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 8) + menu_y_offset, "Music", "tag_music", tag_music);
		tag_puzzle_solving = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 9) + menu_y_offset, "Puzzle-solving", "tag_puzzle_solving", tag_puzzle_solving);
		tag_short_and_sweet = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 10) + menu_y_offset, "Short and Sweet", "tag_short_and_sweet", tag_short_and_sweet);
		tag_singleplayer = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 11) + menu_y_offset, "Singleplayer Only", "tag_singleplayer", tag_singleplayer);
		tag_speedrun = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 12) + menu_y_offset, "Speedrun", "tag_speedrun", tag_speedrun);
		tag_standard = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 13) + menu_y_offset, "Standard", "tag_standard", tag_standard);
		tag_technical = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 14) + menu_y_offset, "Technical", "tag_technical", tag_technical);
		tag_themed = draw_menu_checkmark(display_get_gui_width() * 0.5 - 185, (45 * 15) + menu_y_offset, "Themed", "tag_themed", tag_themed);
		draw_menu_dropdown(display_get_gui_width() * 0.5 - 185, (45 * 16) + menu_y_offset, "Intended Difficulty", "intended_level_difficulty", intended_level_difficulty, "Easy", "Normal", "Hard", "Super Hard")
		
		#region /* Tell player what tags are selected at top of tags */
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, 42 * 2 + 16, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		
		if (tag_art_text == "")
		and (tag_boss_battle_text == "")
		and (tag_dont_move_text == "")
		and (tag_kaizo_text == "")
		and (tag_multiplayer_text == "")
		and (tag_music_text == "")
		and (tag_puzzle_solving_text == "")
		and (tag_short_and_sweet_text == "")
		and (tag_singleplayer_text == "")
		and (tag_speedrun_text == "")
		and (tag_standard_text == "")
		and (tag_technical_text == "")
		and (tag_themed_text == "")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 42, l10n_text("Tags") + ": " + l10n_text("None"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 42, l10n_text("Tags") + ": " + l10n_text("None"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		else
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 42, l10n_text("Tags") + ": " +
			string(tag_art_text) +
			string(tag_boss_battle_text) +
			string(tag_dont_move_text) +
			string(tag_kaizo_text) +
			string(tag_multiplayer_text) +
			string(tag_music_text) +
			string(tag_puzzle_solving_text) +
			string(tag_short_and_sweet_text) +
			string(tag_singleplayer_text) +
			string(tag_speedrun_text) +
			string(tag_standard_text) +
			string(tag_technical_text) +
			string(tag_themed_text)
			, global.default_text_size, c_black, c_white, 1);
		}
		if (how_may_tags > 3)
		{
			/* If you have more than 3 tags, show message that you can only have 3 tags max */
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 42 * 2, string("A level can only have three tags!"), global.default_text_size, c_black, c_red, 1);
		}
		#endregion /* Tell player what tags are selected at top of tags END */
		
		#region /* Draw back button at top of screen if you have 3 or less tags */
		if (how_may_tags <= 3)
		{
			draw_menu_button(0, 0, "Back", "upload_edit_tags_ok", "upload_edit_tags_ok");
		}
		#endregion /* Draw back button at top of screen if you have 3 or less tags END*/
		
		#region /* Save tags to level when going back to previous menu */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 42))
		and (mouse_check_button_released(mb_left))
		or (key_a_pressed)
		and (menu == "upload_edit_tags_ok")
		or (key_b_pressed)
		{
			if (how_may_tags <= 3) /* Don't save and back out if there are more than 3 tags */
			and (menu_delay == 0)
			and (open_dropdown == false)
			{
				/* Save tags to level_information.ini */
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				if (ini_section_exists("tags"))
				{
					ini_section_delete("tags"); /* Delete every tag before saving tags, so there doesn't have to be a bunch of tags not used */
				}
				if (tag_art == true){ini_write_real("tags", "tag_art", true);}
				if (tag_boss_battle == true){ini_write_real("tags", "tag_boss_battle", true);}
				if (tag_dont_move == true){ini_write_real("tags", "tag_dont_move", true);}
				if (tag_kaizo == true){ini_write_real("tags", "tag_kaizo", true);}
				if (tag_multiplayer == true){ini_write_real("tags", "tag_multiplayer", true);}
				if (tag_music == true){ini_write_real("tags", "tag_music", true);}
				if (tag_puzzle_solving == true){ini_write_real("tags", "tag_puzzle_solving", true);}
				if (tag_short_and_sweet == true){ini_write_real("tags", "tag_short_and_sweet", true);}
				if (tag_singleplayer == true){ini_write_real("tags", "tag_singleplayer", true);}
				if (tag_speedrun == true){ini_write_real("tags", "tag_speedrun", true);}
				if (tag_standard == true){ini_write_real("tags", "tag_standard", true);}
				if (tag_technical == true){ini_write_real("tags", "tag_technical", true);}
				if (tag_themed == true){ini_write_real("tags", "tag_themed", true);}
				ini_write_real("info", "intended_level_difficulty", intended_level_difficulty);
				ini_close();
				
				menu_delay = 3;
				menu = "upload_edit_tags";
			}
		}
		#endregion /* Save tags to level when going back to previous menu END */
		
		if (key_up)
		and (menu_delay == 3)
		{
			menu_delay = 3;
			if (menu == "upload_edit_tags_ok"){menu = "intended_level_difficulty";}else
			if (menu == "tag_art"){if (how_may_tags <= 3){menu = "upload_edit_tags_ok";}else{menu = "intended_level_difficulty";}}else
			if (menu == "tag_boss_battle"){menu = "tag_art";}else
			if (menu == "tag_dont_move"){menu = "tag_boss_battle";}else
			if (menu == "tag_kaizo"){menu = "tag_dont_move";}else
			if (menu == "tag_multiplayer"){menu = "tag_kaizo";}else
			if (menu == "tag_music"){menu = "tag_multiplayer";}else
			if (menu == "tag_puzzle_solving"){menu = "tag_music";}else
			if (menu == "tag_short_and_sweet"){menu = "tag_puzzle_solving";}else
			if (menu == "tag_singleplayer"){menu = "tag_short_and_sweet";}else
			if (menu == "tag_speedrun"){menu = "tag_singleplayer";}else
			if (menu == "tag_standard"){menu = "tag_speedrun";}else
			if (menu == "tag_technical"){menu = "tag_standard";}else
			if (menu == "tag_themed"){menu = "tag_technical";}else
			if (menu == "intended_level_difficulty")and (open_dropdown == false){menu = "tag_themed";}
		}
		else
		if (key_down)
		and (menu_delay == 3)
		{
			menu_delay = 3;
			if (menu == "upload_edit_tags_ok"){menu = "tag_art";}else
			if (menu == "tag_art"){menu = "tag_boss_battle";}else
			if (menu == "tag_boss_battle"){menu = "tag_dont_move";}else
			if (menu == "tag_dont_move"){menu = "tag_kaizo";}else
			if (menu == "tag_kaizo"){menu = "tag_multiplayer";}else
			if (menu == "tag_multiplayer"){menu = "tag_music";}else
			if (menu == "tag_music"){menu = "tag_puzzle_solving";}else
			if (menu == "tag_puzzle_solving"){menu = "tag_short_and_sweet";}else
			if (menu == "tag_short_and_sweet"){menu = "tag_singleplayer";}else
			if (menu == "tag_singleplayer"){menu = "tag_speedrun";}else
			if (menu == "tag_speedrun"){menu = "tag_standard";}else
			if (menu == "tag_standard"){menu = "tag_technical";}else
			if (menu == "tag_technical"){menu = "tag_themed";}else
			if (menu == "tag_themed"){menu = "intended_level_difficulty";}else
			if (menu == "intended_level_difficulty")and (open_dropdown == false){if (how_may_tags <= 3){menu = "upload_edit_tags_ok";}else{menu = "tag_art";}}
		}
		
		if (menu == "intended_level_difficulty")
		{
			if (key_up)
			and (menu_delay == 3)
			and (open_dropdown == true)
			and (intended_level_difficulty > 0)
			{
				intended_level_difficulty -= 1;
				menu_delay = 3;
			}
			else
			if (key_down)
			and (menu_delay == 3)
			and (open_dropdown == true)
			and (intended_level_difficulty < 3)
			{
				intended_level_difficulty += 1;
				menu_delay = 3;
			}
		}
	}
	#endregion /* Edit level tags END */
	
	else
	
	#region /* Upload Level Menu */
	if (menu == "upload_yes")
	or (menu == "upload_no")
	{
		var upload_name_question_y = 432;
		var upload_level_no_y = 532;
		var upload_level_yes_y = 532 + 84;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, upload_name_question_y - 32, get_window_width * 0.5 + message_x_offset, upload_name_question_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, upload_name_question_y, l10n_text("Upload") + " " + string(global.level_name) + "?", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Upload Level No */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_no_y - 42, get_window_width * 0.5 + 370, upload_level_no_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_no_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_no")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_no")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Level No END */
	
		#region /* Upload Level Yes */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_yes_y - 42, get_window_width * 0.5 + 370, upload_level_yes_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "upload_yes";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_yes_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_yes")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "upload_yes")
			and (global.controls_used_for_menu_navigation == "controller")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_yes_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Level Yes END */
		
		#region /* Return to game */
		if (key_b_pressed)
		and (level_editor_edit_name = false)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "edit_ok"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = false;
			}
		}
		#endregion /* Return to game END */
		
		#region /* Upload Level Menu Navigation */
		if (menu == "upload_no")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_no_y - 42, get_window_width * 0.5 + 370, upload_level_no_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				menu = "edit_ok"; /* Return to previous menu */
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = false;
				}
			}
		}
		else
		if (menu == "upload_yes")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_yes_y - 42, get_window_width * 0.5 + 370, upload_level_yes_y + 42))
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (key_a_pressed)
			and (menu_delay == 0)
			{
				menu = "uploading_level"; /* Go to uploading level loading screen */
				menu_delay = 60 * 3;
			}
		}
		if (key_up)
		{
			menu_delay = 3;
			menu = "upload_no";
		}
		if (key_down)
		{
			menu_delay = 3;
			menu = "upload_yes";
		}
		#endregion /* Upload Level Menu Navigation END */
		
	}
	#endregion /* Upload Level Menu END */
	
	#region /* Uploading Level */
	if (menu == "uploading_level")
	{
		content_type = "level"; /* Set "content type" to be correct for what kind of files you're uploading, before uploading the files to the server */
		var uploading_level_message_y = 532;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, uploading_level_message_y - 32, get_window_width * 0.5 + message_x_offset, uploading_level_message_y + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploading_level_message_y, l10n_text("Uploading") + " " + string(global.level_name) + "...", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Generate Level ID */
		if (menu_delay = 50)
		{
			/* Certain characters is not used as they look too similar to other characters in certain fonts. It's easier to just not include those letters in the Level ID */
			level_id_1 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_2 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_3 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_4 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_5 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_6 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_7 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_8 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id_9 = choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y");
			level_id = string(level_id_1) + string(level_id_2) + string(level_id_3) + string(level_id_4) + string(level_id_5) + string(level_id_6) + string(level_id_7) + string(level_id_8) + string(level_id_9);
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			ini_write_string("info", "level_id", string(level_id)); /* Save the level ID in the level information.ini file, so that it can be referenced later */
			ini_write_string("info", "username", string(global.username)); /* Save the username in the level information.ini file, so that it can be referenced later */
			ini_close();
		}
		#endregion /* Generate Level ID END */
		
		#region /* Create Zip File */
		if (menu_delay = 40)
		{
			file = scr_upload_zip_add_files("level"); /* Add all the level files to a new zip file */
		}
		#endregion /* Create Zip File END */
		
		#region /* Send Zip File to the Server */
		if (menu_delay <= 0)
		and (file_exists(working_directory + string(level_id) + ".zip"))
		{
			
			#region /* Actually upload the level to the server */
			
			content_type = "level"; /* Set "content type" to be correct for what kind of files you're uploading, before uploading the files to the server */
			
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
			post_data += "levels" + "\r\n";
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
			
			#endregion /* Actually upload the level to the server END */
			
			#region /* Delete some leftover files and folders */
			if (destroy_zip_after_uploading == true)
			{
				file_delete(file);
			}
			#endregion /* Delete some leftover files and folders END */
			
			menu = "level_uploaded";
		}
		#endregion /* Send Zip File to the Server END */
		
	}
	#endregion /* Uploading Level END */
	
	#region /* Level Uploaded */
	if (menu == "level_uploaded")
	{
		var uploaded_level_message_y = 432;
		var ok_y = uploaded_level_message_y + 168;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_rectangle_color(get_window_width * 0.5 - message_x_offset, uploaded_level_message_y - 32, get_window_width * 0.5 + message_x_offset, uploaded_level_message_y + 128, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploaded_level_message_y, string(global.level_name) + " " + l10n_text("Uploaded"), global.default_text_size * 1.9, c_black, c_white, 1);
		/* Show Level ID */ scr_draw_text_outlined(get_window_width * 0.5, uploaded_level_message_y + 84, l10n_text("Level ID") + ": " + string(level_id), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Level Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "level_uploaded";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "level_uploaded")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "level_uploaded")
			and (global.controls_used_for_menu_navigation == "controller")
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
		#endregion /* Level Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (mouse_check_button_pressed(mb_right))
		and (menu_delay == 0)
		or (key_a_pressed)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* Level Uploaded END */
	
	#region /* No Internet */
	if (menu == "no_internet")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		/* Don't draw a level thumbnail here, to make it more obvious that there was an error connecting to the internet, because every other screen have a level thumbnail visible usually */
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("No Internet connection"), global.default_text_size * 1.9, c_black, c_white, 1);
		
		var ok_y = get_window_height * 0.5 + 42 + 42 + 42;
		
		#region /* Level Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (menu_delay == 0)
			{
				menu = "no_internet";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, 0, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "no_internet")
			and (global.controls_used_for_menu_navigation == "keyboard")
			or (menu == "no_internet")
			and (global.controls_used_for_menu_navigation == "controller")
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
		#endregion /* Level Uploaded OK END */
		
		#region /* Return to game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (key_a_pressed)
		and (menu_delay == 0)
		or (key_b_pressed)
		and (level_editor_edit_name = false)
		and (menu_delay == 0)
		{
			menu_delay = 3;
			menu = "level_editor_upload"; /* Return to previous menu */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* No Internet END */
	
	#region /* Enter Custom Level */
	if (room == room_title)
	and (iris_xscale <= 0.001)
	and (global.character_select_in_this_menu == "level_editor")
	{
		if (audio_is_playing(title_music))
		{
			audio_stop_sound(title_music);
		}
		if (asset_get_type("room_leveleditor") == asset_room)
		{
			scr_delete_sprite_properly(title_screen_background);
			
			scr_update_all_backgrounds();
			
			room_goto(room_leveleditor);
		}
	}
	#endregion /* Enter Custom Level END */
	
}