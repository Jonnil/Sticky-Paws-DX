function scr_draw_upload_level_menu()
{
	
	#region /* Debug toggles */
	var destroy_zip_after_uploading = true; /* Game should destroy the zip file once it's been uploaded to the server as a zip file. By default set this to true */
	var skip_clear_check = false;
	#endregion /* Debug toggles END */
	
	var upload_y = 42 * 2;
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var upload_level_path = game_save_id + "custom_levels/" + global.level_name; /* Path will be used many times, and I don't want it to come up too many times in search, it will only check in working directory */
	
	if (menu == "level_editor_upload_pressed")
	|| (menu == "clear_check_no")
	|| (menu == "clear_check_yes")
	|| (menu == "question_upload_level_edit_username_options")
	|| (menu == "question_upload_level_edit_username_ok")
	|| (menu == "question_upload_level_edit_username_cancel")
	|| (menu == "upload_level_edit_username_ok")
	|| (menu == "upload_level_edit_username_cancel")
	|| (menu == "upload_edit_name")
	|| (menu == "upload_edit_description")
	|| (menu == "upload_edit_tags")
	|| (menu == "edit_ok")
	|| (menu == "edit_cancel")
	|| (menu == "upload_enter_name_ok")
	|| (menu == "upload_enter_name_cancel")
	|| (menu == "upload_enter_description_ok")
	|| (menu == "upload_enter_description_cancel")
	
	|| (menu == "upload_edit_tags_ok")
	|| (menu == "tag_art")
	|| (menu == "tag_boss_battle")
	|| (menu == "tag_dont_move")
	|| (menu == "tag_kaizo")
	|| (menu == "tag_multiplayer")
	|| (menu == "tag_music")
	|| (menu == "tag_puzzle_solving")
	|| (menu == "tag_short_and_sweet")
	|| (menu == "tag_singleplayer")
	|| (menu == "tag_speedrun")
	|| (menu == "tag_standard")
	|| (menu == "tag_technical")
	|| (menu == "tag_themed")
	|| (menu == "tag_glitch_showcase")
	|| (menu == "intended_level_difficulty")
	
	|| (menu == "upload_yes")
	|| (menu == "upload_no")
	|| (menu == "uploading_level")
	|| (menu == "error_level_too_big")
	|| (menu == "level_uploaded")
	|| (menu == "no_internet_level")
	
	|| (menu == "level_uses_photographic_images_checkbox")
	|| (menu == "background1_uses_photographic_image")
	|| (menu == "background2_uses_photographic_image")
	|| (menu == "background3_uses_photographic_image")
	|| (menu == "background4_uses_photographic_image")
	|| (menu == "foreground1_uses_photographic_image")
	|| (menu == "foreground1_5_uses_photographic_image")
	|| (menu == "foreground2_uses_photographic_image")
	|| (menu == "foreground_secret_uses_photographic_image")
	|| (menu == "thumbnail_uses_photographic_image")
	|| (menu == "level_uses_photographic_images_confirm")
	|| (menu == "level_uses_photographic_images_back")
	{
		open_upload_menu = true;
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	else
	{
		open_upload_menu = false
	}
	
	#region /* Pressing the Upload button */
	if (menu == "level_editor_upload")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = true;
		}
		can_input_level_name = false;
		
		if (room == rm_title)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, 394 * (global.select_level_index - column * row) + 110 - 3, 226 * (column - scroll) + 475 + (upload_y) - 3, 394 * (global.select_level_index - column * row) + 110 - 3 + 370, 226 * (column - scroll) + 475 + (upload_y) - 3 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		|| (room == rm_leveleditor)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42 + 42 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		|| (key_a_pressed)
		{
			if (variable_instance_exists(self, "open_sub_menu"))
			{
				open_sub_menu = false; /* Close the the sub menu when uploading level, so it doesn't interfere */
			}
			open_upload_menu = true;
			
			if (room == rm_leveleditor)
			{
				ini_open(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini");
				ini_write_real("info", "clear_check", false); /* Set clear check to false when trying to upload within the level editor */
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			
			if (global.free_communication_available)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.online_enabled)
				{
					if (upload_rules_do_not_show_level)
					{
						menu = "level_editor_upload_pressed";
						menu_delay = 3;
					}
					else
					{
						if (variable_instance_exists(self, "show_level_editor_corner_menu"))
						{
							show_level_editor_corner_menu = false;
						}
						caution_online_takes_you_to = "level_editor_upload_pressed";
						caution_online_takes_you_back_to = "level_editor_upload";
						content_type = "level";
						menu = "upload_rules";
						menu_delay = 3;
					}
				}
				else
				{
					if (variable_instance_exists(self, "show_level_editor_corner_menu"))
					{
						show_level_editor_corner_menu = false;
					}
					caution_online_takes_you_to = "level_editor_upload_pressed";
					caution_online_takes_you_back_to = "level_editor_upload";
					menu = "caution_online_proceed";
					menu_delay = 3;
				}
			}
		}
	}
	#endregion /* Pressing the Upload button END */
	
	else
	
	#region /* Pressing the Upload button */
	if (menu == "level_editor_upload_pressed")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = false;
		}
		can_input_level_name = false;
		if (global.free_communication_available)
		{
			if (global.online_enabled)
			{
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				menu_delay = 3;
				ini_open(upload_level_path + "/data/level_information.ini");
				if (ini_key_exists("info", "clear_check") && !skip_clear_check) || (skip_clear_check)
				{
					if (ini_read_real("info", "clear_check", false) && !skip_clear_check) || (skip_clear_check)
					{
						if (global.username != "") /* Check if there is an username or not */
						{
							if (os_is_network_connected()) /* Check if you're even connected to the internet */
							{
								
								scr_load_level_tags(upload_level_path);
									
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
								menu = "no_internet_level"; /* If you're not connected to the internet, tell the player that */
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
							menu = "question_upload_level_edit_username_ok"; /* If there isn't an username, have the player make an username */
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
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			else
			{
				if (variable_instance_exists(self, "open_sub_menu"))
				{
					open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
				}
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "level_editor_upload";
				menu_delay = 3;
			}
		}
	}
	#endregion /* Pressed the Upload button END */
	
	else
	
	#region /* Draw clear check menu */
	if (menu == "clear_check_no")
	|| (menu == "clear_check_yes")
	{
		var do_a_clear_check_y = 432;
		var do_a_clear_check_no_y = 532;
		var do_a_clear_check_yes_y = 532;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(0, do_a_clear_check_y - 32, get_window_width, do_a_clear_check_y + 32, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_y, l10n_text("Do a clear check?"), global.default_text_size * 1.9, c_black, c_white, 1);
		
		/* Tell the player that they must use the first official character when doing a clear check */
		var first_official_character_name = string(ds_list_find_value(global.all_loaded_characters, 0));
		scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_y + 40, l10n_text("You must use " + first_official_character_name + " when doing a clear check"), global.default_text_size, c_black, c_white, 1);
		
		#region /* Clear Check No */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_no_y + 42)
		&& global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "clear_check_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_no_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "clear_check_no" && global.controls_used_for_navigation == "keyboard")
			|| (menu == "clear_check_no" && global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_no_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, do_a_clear_check_no_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Clear Check No END */
		
		#region /* Clear Check Yes */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_yes_y + 84 + 42)
		&& global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "clear_check_yes";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_yes_y + 84, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_yes_y + 84, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
		}
		else
		{
			if (menu == "clear_check_yes" && global.controls_used_for_navigation == "keyboard")
			|| (menu == "clear_check_yes" && global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, do_a_clear_check_yes_y + 84, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, do_a_clear_check_yes_y + 84, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, do_a_clear_check_yes_y + 84, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
			}
		}
		#endregion /* Clear Check Yes END */
		
		#region /* Return to game */
		if (key_b_pressed && !level_editor_edit_name && menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (variable_instance_exists(self, "open_sub_menu"))
			{
				open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
			}
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			menu = "level_editor_upload"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
		#region /* Clear Check Menu Navigation */
		if (menu == "clear_check_no")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_no_y - 42, get_window_width * 0.5 + 370, do_a_clear_check_no_y + 42) && mouse_check_button_released(mb_left) && menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed && menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (variable_instance_exists(self, "open_sub_menu"))
				{
					open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
				}
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "level_editor_upload"; /* Return to previous menu */
			}
		}
		else
		if (menu == "clear_check_yes")
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, do_a_clear_check_yes_y + 84 - 42, get_window_width * 0.5 + 370, do_a_clear_check_yes_y + 84 + 42) && mouse_check_button_released(mb_left) && menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed && menu_delay == 0 && menu_joystick_delay == 0)
			{
				
				#region /* Set clear_check to false whenever you agree to do a clear check for the first time, just in case it's already not */
				if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
				{
					if (global.level_name != "")
					{
						ini_open(upload_level_path + "/data/level_information.ini");
						ini_write_real("info", "clear_check", false); /* Set "clear check" to false when you click on "clear check yes" just in case it isn't already false when doing a "clear check" */
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
				}
				#endregion /* Set clear_check to false whenever you agree to do a clear check for the first time, just in case it's already not END */
				
				/* Levels must be able to be cleared with the default official character, so you can't clear the level with a character that can cheat */
				for(var i = 1; i <= global.max_players; i += 1)
				{
					if (global.player_can_play[i])
					{
						global.character_index[i - 1] = 0; /* 0 = first official character */
					}
				}
				
				global.checkpoint_x = 0;
				global.checkpoint_y = 0;
				global.doing_clear_check_level = true; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
				global.actually_play_edited_level = false; /* Don't turn this variable on yet, let the level editor do this itself, so that the correct functions can run when in level editor */
				global.play_edited_level = false;
				can_navigate = false;
				if (room != rm_leveleditor)
				{
					menu_delay = 9999;
					if (instance_exists(obj_camera))
					{
						obj_camera.iris_zoom = 0;
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
	
	scr_draw_upload_account_name("level");
	scr_draw_upload_photographic_images();
	
	if (keyboard_virtual_status() && keyboard_virtual_height() != 0)
	{
		var draw_name_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var draw_name_y = get_window_height * 0.5 - 22;
	}
	if (keyboard_virtual_status() && keyboard_virtual_height() != 0)
	{
		var draw_description_y = display_get_gui_height() - keyboard_virtual_height() - 160;
	}
	else
	{
		var draw_description_y = get_window_height * 0.5 + 42;
	}
	var draw_tags_y = get_window_height * 0.5 + 42 * 2;
	var edit_name_y = get_window_height * 0.5 + 42 * 3;
	var edit_description_y = get_window_height * 0.5 + 42 * 4;
	var edit_tags_y = get_window_height * 0.5 + 42 * 5;
	var ok_y = get_window_height * 0.5 + 42 * 6;
	var cancel_y = get_window_height * 0.5 + 42 * 7;
	
	#region /* Edit things before uploading */
	if (menu == "upload_edit_name")
	|| (menu == "upload_edit_description")
	|| (menu == "upload_edit_tags")
	|| (menu == "edit_ok")
	|| (menu == "edit_cancel")
	{
		if (global.username == "") /* Check if there is no username */
		{
			/* You should never be able to get to this screen without having entered a username */
			keyboard_string = "";
			menu_delay = 3;
			menu = "question_upload_level_edit_username_ok"; /* If there isn't an username, have the player make an username */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = false;
			}
		}
		
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = false;
		}
		open_sub_menu = false;
		if (room == rm_title)
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
		/* Draw Level Name */ scr_draw_text_outlined(get_window_width * 0.5, draw_name_y, global.level_name, global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Draw Level Description */
		if (thumbnail_level_description[global.select_level_index] == "")
		{
			/* Notify the player that the level doesn't have a description */
			scr_draw_text_outlined(get_window_width * 0.5, draw_description_y, l10n_text("Description") + ": " + l10n_text("None"), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, draw_description_y, l10n_text("Description") + ": " + l10n_text("None"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		else
		{
			scr_draw_text_outlined(get_window_width * 0.5, draw_description_y, string(thumbnail_level_description[global.select_level_index]), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Draw Level Description END */
		
		scr_draw_level_tags(, draw_tags_y);
		
		#region /* Draw who made the level */
		draw_set_halign(fa_right);
		if (file_exists(upload_level_path + "/data/level_information.ini"))
		{
			ini_open(upload_level_path + "/data/level_information.ini");
			if (ini_key_exists("info", "username"))
			&& (ini_read_string("info", "username", "") != "")
			{
				scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("By") + ": " + string(ini_read_string("info", "username", "")), global.default_text_size, c_black, c_white, 1);
			}
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		#endregion /* Draw who made the level END */
		
		draw_menu_button(get_window_width * 0.5 - 185, edit_name_y, l10n_text("Edit Name"), "upload_edit_name", "upload_edit_name");
		draw_sprite_ext(spr_icon_pen, 0, get_window_width * 0.5 - 185 + 16, edit_name_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, edit_description_y, l10n_text("Edit Description"), "upload_edit_description", "upload_edit_description");
		draw_sprite_ext(spr_icon_pen, 0, get_window_width * 0.5 - 185 + 16, edit_description_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, edit_tags_y, l10n_text("Edit Tags"), "upload_edit_tags", "upload_edit_tags");
		draw_sprite_ext(spr_icon_pen, 0, get_window_width * 0.5 - 185 + 16, edit_tags_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, ok_y, l10n_text("Upload"), "edit_ok", "edit_ok");
		draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 185 + 16, ok_y + 21, 1, 1, 0, c_white, 1);
		draw_menu_button(get_window_width * 0.5 - 185, cancel_y, l10n_text("Cancel"), "edit_cancel", "edit_cancel");
		draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 16, cancel_y + 21, 1, 1, 0, c_white, 1);
		
		#region /* Pressing the Edit Name button */
		if (menu == "upload_edit_name")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_name_y, get_window_width * 0.5 + 185, edit_name_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			&& (!level_editor_edit_name)
			|| (key_a_pressed)
			&& (!level_editor_edit_name)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check_level = false;
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
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_description_y, get_window_width * 0.5 + 185, edit_description_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			&& (!level_editor_edit_name)
			|| (key_a_pressed)
			&& (!level_editor_edit_name)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.level_description = global.level_name;
				
				if (file_exists(upload_level_path + "/data/level_information.ini"))
				{
					ini_open(upload_level_path + "/data/level_information.ini");
					keyboard_string = ini_read_string("info", "level_description", "");
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
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
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, edit_tags_y, get_window_width * 0.5 + 185, edit_tags_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			&& (!level_editor_edit_name)
			|| (key_a_pressed)
			&& (!level_editor_edit_name)
			{
				level_editor_edit_name = false;
				can_input_level_name = false;
				can_navigate = true;
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "tag_art";
			}
		}
		#endregion /* Pressing the Edit Tags button END */
		
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
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
		&& (menu_delay == 0 && menu_joystick_delay == 0)
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
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (key_a_pressed
		|| point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, ok_y, get_window_width * 0.5 + 185, ok_y + 42)
		&& mouse_check_button_released(mb_left)
		&& global.controls_used_for_navigation == "mouse")
		{
			
			#region /* If at any point the game checks that the level isn't clear checked, then go to the clear check menu */
			ini_open(upload_level_path + "/data/level_information.ini");
			if (!ini_read_real("info", "clear_check", false))
			&& (!skip_clear_check)
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
				if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.png"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.png"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.png"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.png"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.png"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.png"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.png"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.png"))
				
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.bmp"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.bmp"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.bmp"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.bmp"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.bmp"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.bmp"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.bmp"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.bmp"))
				
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.gif"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.gif"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.gif"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.gif"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.gif"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.gif"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.gif"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.gif"))
				
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.jpg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.jpg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.jpg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.jpg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.jpg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.jpg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.jpg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.jpg"))
				
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background1.jpeg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background2.jpeg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background3.jpeg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/background4.jpeg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1.jpeg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground1_5.jpeg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground2.jpeg"))
				|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/foreground_secret.jpeg"))
				{
					ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					background1_uses_photographic_image = ini_read_real("Custom Backgrounds", "background1_uses_photographic_image", false);
					background2_uses_photographic_image = ini_read_real("Custom Backgrounds", "background2_uses_photographic_image", false);
					background3_uses_photographic_image = ini_read_real("Custom Backgrounds", "background3_uses_photographic_image", false);
					background4_uses_photographic_image = ini_read_real("Custom Backgrounds", "background4_uses_photographic_image", false);
					foreground1_uses_photographic_image = ini_read_real("Custom Backgrounds", "foreground1_uses_photographic_image", false);
					foreground1_5_uses_photographic_image = ini_read_real("Custom Backgrounds", "foreground1_5_uses_photographic_image", false);
					foreground2_uses_photographic_image = ini_read_real("Custom Backgrounds", "foreground2_uses_photographic_image", false);
					foreground_secret_uses_photographic_image = ini_read_real("Custom Backgrounds", "foreground_secret_uses_photographic_image", false);
					thumbnail_uses_photographic_image = ini_read_real("Custom Backgrounds", "thumbnail_uses_photographic_image", false);
					ini_close();
					
					if (background1_uses_photographic_image)
					|| (background2_uses_photographic_image)
					|| (background3_uses_photographic_image)
					|| (background4_uses_photographic_image)
					|| (foreground1_uses_photographic_image)
					|| (foreground1_5_uses_photographic_image)
					|| (foreground2_uses_photographic_image)
					|| (foreground_secret_uses_photographic_image)
					{
						level_uses_photographic_images = true;
					}
					else
					{
						level_uses_photographic_images = false;
					}
					
					menu = "level_uses_photographic_images_checkbox"; /* If custom backgrounds are detected, ask player if it includes photographic images */
				}
				else
				{
					menu = "upload_yes"; /* Go to upload confirmation screen */
				}
				menu_delay = 3;
			}
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			#endregion /* If at any point the game checks that the level isn't clear checked, then go to the clear check menu END */
			
		}
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, cancel_y, get_window_width * 0.5 + 185, cancel_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		|| (menu == "edit_cancel")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (variable_instance_exists(self, "open_sub_menu"))
			{
				open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
			}
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			menu = "level_editor_upload"; /* Return to previous menu */
		}
	}
	#endregion /* Edit things before uploading END */
	
	else
	
	#region /* Edit level name */
	if (menu == "upload_enter_name_ok")
	|| (menu == "upload_enter_name_cancel")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		
		if (can_input_level_name)
		{
			global.level_name = scr_draw_name_input_screen(global.level_name, global.max_level_name_lenght, c_black, 1, false, get_window_width * 0.5, draw_name_y, "upload_enter_name_ok", "upload_enter_name_cancel", false, true, false);
		}
		
		#region /* Input Level Name */
		
		#region /* Press Enter to confirm new name */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (keyboard_string != "")
		&& (global.level_name != undefined && global.level_name != "")
		{
			if (global.clicking_ok_input_screen)
			{
				menu_delay = 3;
				if (level_editor_edit_name && global.level_name != old_level_name)
				{
					scr_switch_expand_save_data(); /* Expand the save data before editing level name */
					if (global.save_data_size_is_sufficient)
					{
						
						global.go_to_menu_when_going_back_to_title = "upload_edit_name";
						scr_rename_custom_level_name();
						
					}
				}
				else
				if (level_editor_edit_name && global.level_name == old_level_name)
				{
					menu = "upload_edit_name";
				}
				else
				if (!level_editor_edit_name)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (instance_exists(obj_camera))
					{
						obj_camera.iris_zoom = 0;
					}
				}
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to confirm new name END */
	
		#region /* Press Escape to back out from name input menu */
		if (can_input_level_name && menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (global.clicking_cancel_input_screen)
			{
				menu_delay = 3;
				if (instance_exists(obj_camera))
				{
					obj_camera.iris_zoom = 0;
				}
				can_input_level_name = false;
				if (level_editor_edit_name)
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
	|| (menu == "upload_enter_description_cancel")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		/* Draw Level Name above description input */ scr_draw_text_outlined(get_window_width * 0.5, draw_name_y, global.level_name, global.default_text_size * 1.9, c_black, c_white, 1);
		
		if (can_input_level_name)
		{
			global.level_description = scr_draw_name_input_screen(global.level_description, 75, c_black, 1, false, get_window_width * 0.5, draw_description_y, "upload_enter_description_ok", "upload_enter_description_cancel", false, true, false);
		}
		
		#region /* Input Level Description */
		
		#region /* Press Enter to confirm new description */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (keyboard_string != "")
		&& (global.level_description != undefined)
		{
			if (global.clicking_ok_input_screen)
			{
				if (level_editor_edit_name)
				&& (global.level_description != old_level_description)
				{
					can_navigate = true;
					menu_delay = 3;
					
					/* Save description to level_information.ini */
					ini_open(upload_level_path + "/data/level_information.ini");
					ini_write_string("info", "level_description", string(global.level_description));
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					
					if (is_array(thumbnail_level_description))
					&& (array_length(thumbnail_level_description) > 0)
					&& (global.select_level_index >= 0)
					&& (global.select_level_index < array_length(thumbnail_level_description))
					{
						thumbnail_level_description[global.select_level_index] = string(global.level_description);
					}
					
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name)
				&& (global.level_description == old_level_description)
				{
					menu = "upload_edit_description";
					level_editor_edit_name = false;
				}
				else
				if (!level_editor_edit_name)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (instance_exists(obj_camera))
					{
						obj_camera.iris_zoom = 0;
					}
				}
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to confirm new description END */
		
		#region /* Press Escape to back out from description input menu */
		if (can_input_level_name && menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (global.clicking_cancel_input_screen)
			{
				menu_delay = 3;
				if (instance_exists(obj_camera))
				{
					obj_camera.iris_zoom = 0;
				}
				can_input_level_name = false;
				if (level_editor_edit_name)
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
	|| (menu == "tag_art")
	|| (menu == "tag_boss_battle")
	|| (menu == "tag_dont_move")
	|| (menu == "tag_kaizo")
	|| (menu == "tag_multiplayer")
	|| (menu == "tag_music")
	|| (menu == "tag_puzzle_solving")
	|| (menu == "tag_short_and_sweet")
	|| (menu == "tag_singleplayer")
	|| (menu == "tag_speedrun")
	|| (menu == "tag_standard")
	|| (menu == "tag_technical")
	|| (menu == "tag_themed")
	|| (menu == "tag_glitch_showcase")
	|| (menu == "intended_level_difficulty")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = false;
		}
		
		var center_of_screen = display_get_gui_width() * 0.5 - 185;
		
		tag_art = draw_menu_checkmark(center_of_screen - 185, (45 * 3), "Art", "tag_art", tag_art);
		tag_boss_battle = draw_menu_checkmark(center_of_screen + 185, (45 * 3), "Boss Battle", "tag_boss_battle", tag_boss_battle);
		tag_dont_move = draw_menu_checkmark(center_of_screen - 185, (45 * 4), "Don't Move", "tag_dont_move", tag_dont_move);
		tag_kaizo = draw_menu_checkmark(center_of_screen + 185, (45 * 4), "Kaizo", "tag_kaizo", tag_kaizo);
		tag_multiplayer = draw_menu_checkmark(center_of_screen - 185, (45 * 5), "Multiplayer Only", "tag_multiplayer", tag_multiplayer);
		tag_music = draw_menu_checkmark(center_of_screen + 185, (45 * 5), "Music", "tag_music", tag_music);
		tag_puzzle_solving = draw_menu_checkmark(center_of_screen - 185, (45 * 6), "Puzzle-solving", "tag_puzzle_solving", tag_puzzle_solving);
		tag_short_and_sweet = draw_menu_checkmark(center_of_screen + 185, (45 * 6), "Short and Sweet", "tag_short_and_sweet", tag_short_and_sweet);
		tag_singleplayer = draw_menu_checkmark(center_of_screen - 185, (45 * 7), "Singleplayer Only", "tag_singleplayer", tag_singleplayer);
		tag_speedrun = draw_menu_checkmark(center_of_screen + 185, (45 * 7), "Speedrun", "tag_speedrun", tag_speedrun);
		tag_standard = draw_menu_checkmark(center_of_screen - 185, (45 * 8), "Standard", "tag_standard", tag_standard);
		tag_technical = draw_menu_checkmark(center_of_screen + 185, (45 * 8), "Technical", "tag_technical", tag_technical);
		tag_themed = draw_menu_checkmark(center_of_screen - 185, (45 * 9), "Themed", "tag_themed", tag_themed);
		tag_glitch_showcase = draw_menu_checkmark(center_of_screen + 185, (45 * 9), "Glitch Showcase", "tag_glitch_showcase", tag_glitch_showcase);
		draw_menu_dropdown(center_of_screen - 185, (45 * 10) + 20, "Intended Difficulty", "intended_level_difficulty", intended_level_difficulty, "Easy", "Normal", "Hard", "Super Hard")
		
		scr_draw_level_tags(, 42); /* Tell player what tags are selected at top of tags */
		
		if (how_many_tags <= 3)
		{
			/* Show message that you can only have 3 tags max */
			draw_set_halign(fa_center);
			scr_draw_text_outlined(center_of_screen + 185, 42 + 42, string("A level can only have three tags!"), global.default_text_size * 0.75, c_black, c_white, 1);
		}
		
		#region /* Draw back button at top of screen if you have 3 or less tags */
		if (how_many_tags <= 3)
		{
			draw_menu_button(0, 0, l10n_text("Back"), "upload_edit_tags_ok", "upload_edit_tags_ok");
		}
		#endregion /* Draw back button at top of screen if you have 3 or less tags END*/
		
		#region /* Save tags to level when going back to previous menu */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 42))
		&& (mouse_check_button_released(mb_left))
		|| (key_a_pressed)
		&& (menu == "upload_edit_tags_ok")
		|| (key_b_pressed)
		{
			if (how_many_tags <= 3) /* Don't save and back out if there are more than 3 tags */
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!open_dropdown)
			{
				/* Save tags to level_information.ini */
				ini_open(upload_level_path + "/data/level_information.ini");
				if (ini_section_exists("tags"))
				{
					ini_section_delete("tags"); /* Delete every tag before saving tags, so there doesn't have to be a bunch of tags not used */
				}
				if (tag_art){ini_write_real("tags", "tag_art", true);}
				if (tag_boss_battle){ini_write_real("tags", "tag_boss_battle", true);}
				if (tag_dont_move){ini_write_real("tags", "tag_dont_move", true);}
				if (tag_kaizo){ini_write_real("tags", "tag_kaizo", true);}
				if (tag_multiplayer){ini_write_real("tags", "tag_multiplayer", true);}
				if (tag_music){ini_write_real("tags", "tag_music", true);}
				if (tag_puzzle_solving){ini_write_real("tags", "tag_puzzle_solving", true);}
				if (tag_short_and_sweet){ini_write_real("tags", "tag_short_and_sweet", true);}
				if (tag_singleplayer){ini_write_real("tags", "tag_singleplayer", true);}
				if (tag_speedrun){ini_write_real("tags", "tag_speedrun", true);}
				if (tag_standard){ini_write_real("tags", "tag_standard", true);}
				if (tag_technical){ini_write_real("tags", "tag_technical", true);}
				if (tag_themed){ini_write_real("tags", "tag_themed", true);}
				if (tag_glitch_showcase){ini_write_real("tags", "tag_glitch_showcase", true);}
				ini_write_real("info", "intended_level_difficulty", intended_level_difficulty);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				
				menu_delay = 3;
				menu = "upload_edit_tags";
			}
		}
		#endregion /* Save tags to level when going back to previous menu END */
		
		if (key_right)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu == "upload_edit_tags_ok")
		&& (!open_dropdown)
		{
			menu_delay = 3;
			menu = "tag_art";
		}
		else
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_dropdown)
		{
			menu_delay = 3;
			if (menu == "upload_edit_tags_ok"){menu = "intended_level_difficulty";}else
			if (menu == "tag_art"){if (how_many_tags <= 3){menu = "upload_edit_tags_ok";}else{menu = "intended_level_difficulty";}}else
			if (menu == "tag_boss_battle"){if (how_many_tags <= 3){menu = "upload_edit_tags_ok";}else{menu = "intended_level_difficulty";}}else
			if (menu == "tag_dont_move"){menu = "tag_art";}else
			if (menu == "tag_kaizo"){menu = "tag_boss_battle";}else
			if (menu == "tag_multiplayer"){menu = "tag_dont_move";}else
			if (menu == "tag_music"){menu = "tag_kaizo";}else
			if (menu == "tag_puzzle_solving"){menu = "tag_multiplayer";}else
			if (menu == "tag_short_and_sweet"){menu = "tag_music";}else
			if (menu == "tag_singleplayer"){menu = "tag_puzzle_solving";}else
			if (menu == "tag_speedrun"){menu = "tag_short_and_sweet";}else
			if (menu == "tag_standard"){menu = "tag_singleplayer";}else
			if (menu == "tag_technical"){menu = "tag_speedrun";}else
			if (menu == "tag_themed"){menu = "tag_standard";}else
			if (menu == "tag_glitch_showcase"){menu = "tag_technical";}else
			if (menu == "intended_level_difficulty")&& (!open_dropdown){menu = "tag_themed";}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_dropdown)
		{
			menu_delay = 3;
			if (menu == "upload_edit_tags_ok"){menu = "tag_art";}else
			if (menu == "tag_art"){menu = "tag_dont_move";}else
			if (menu == "tag_boss_battle"){menu = "tag_kaizo";}else
			if (menu == "tag_dont_move"){menu = "tag_multiplayer";}else
			if (menu == "tag_kaizo"){menu = "tag_music";}else
			if (menu == "tag_multiplayer"){menu = "tag_puzzle_solving";}else
			if (menu == "tag_music"){menu = "tag_short_and_sweet";}else
			if (menu == "tag_puzzle_solving"){menu = "tag_singleplayer";}else
			if (menu == "tag_short_and_sweet"){menu = "tag_speedrun";}else
			if (menu == "tag_singleplayer"){menu = "tag_standard";}else
			if (menu == "tag_speedrun"){menu = "tag_technical";}else
			if (menu == "tag_standard"){menu = "tag_themed";}else
			if (menu == "tag_technical"){menu = "tag_glitch_showcase";}else
			if (menu == "tag_themed"){menu = "intended_level_difficulty";}else
			if (menu == "tag_glitch_showcase"){menu = "intended_level_difficulty";}else
			if (menu == "intended_level_difficulty")&& (!open_dropdown){if (how_many_tags <= 3){menu = "upload_edit_tags_ok";}else{menu = "tag_art";}}
		}
		else
		if (key_left || key_right)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_dropdown)
		{
			menu_delay = 3;
			if (menu == "tag_art"){menu = "tag_boss_battle";}else
			if (menu == "tag_boss_battle"){menu = "tag_art";}else
			if (menu == "tag_dont_move"){menu = "tag_kaizo";}else
			if (menu == "tag_kaizo"){menu = "tag_dont_move";}else
			if (menu == "tag_multiplayer"){menu = "tag_music";}else
			if (menu == "tag_music"){menu = "tag_multiplayer";}else
			if (menu == "tag_puzzle_solving"){menu = "tag_short_and_sweet";}else
			if (menu == "tag_short_and_sweet"){menu = "tag_puzzle_solving";}else
			if (menu == "tag_singleplayer"){menu = "tag_speedrun";}else
			if (menu == "tag_speedrun"){menu = "tag_singleplayer";}else
			if (menu == "tag_standard"){menu = "tag_technical";}else
			if (menu == "tag_technical"){menu = "tag_standard";}else
			if (menu == "tag_themed"){menu = "tag_glitch_showcase";}else
			if (menu == "tag_glitch_showcase"){menu = "tag_themed";}
		}
		
		if (menu == "intended_level_difficulty")
		{
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (intended_level_difficulty > 0)
			{
				intended_level_difficulty --;
				menu_delay = 3;
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_dropdown)
			&& (intended_level_difficulty < 3)
			{
				intended_level_difficulty ++;
				menu_delay = 3;
			}
		}
	}
	#endregion /* Edit level tags END */
	
	else
	
	#region /* Upload Level Menu */
	if (menu == "upload_yes")
	|| (menu == "upload_no")
	{
		
		if (global.username == "")
		{
			keyboard_string = "";
			menu_delay = 3;
			menu = "question_upload_level_edit_username_ok"; /* If there isn't an username, have the player make an username */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = false;
			}
		}
		
		var upload_name_question_y = 432;
		var upload_level_no_y = 532;
		var upload_level_yes_y = 532 + 84;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(0, upload_name_question_y - 32, get_window_width, upload_name_question_y + 32, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, upload_name_question_y, l10n_text("Upload") + " " + global.level_name + "?", global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Upload Level No */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_no_y - 42, get_window_width * 0.5 + 370, upload_level_no_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "upload_no";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_no_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "upload_no")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "upload_no")
			&& (global.controls_used_for_navigation == "gamepad")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_no_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_no_y, 1, 1, 180, c_white, 1);
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_lime, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_black, c_white, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_level_no_y, 2, 2, 0, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, upload_level_no_y, l10n_text("NO"), global.default_text_size * 2.3, c_white, c_black, 1);
				draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, upload_level_no_y, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Upload Level No END */
		
		#region /* Upload Level Yes */
		if (file_exists(upload_level_path + "/data/level_information.ini"))
		{
			if (file_exists(upload_level_path + "/data/object_placement_all.json"))
			{
				if (file_exists(upload_level_path + "/thumbnail.png"))
				|| (file_exists(upload_level_path + "/automatic_thumbnail.png"))
				{
					/* Essential files does exist, so upload now */
					if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, upload_level_yes_y - 42, get_window_width * 0.5 + 370, upload_level_yes_y + 42))
					&& (global.controls_used_for_navigation == "mouse")
					{
						if (menu_delay == 0 && menu_joystick_delay == 0)
						{
							menu = "upload_yes";
						}
						draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
						draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_yes_y, 1, 1, 180, c_white, 1);
						draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_lime, 1);
						scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
						draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
					}
					else
					{
						if (menu == "upload_yes")
						&& (global.controls_used_for_navigation == "keyboard"
						|| global.controls_used_for_navigation == "gamepad")
						{
							draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
							draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, upload_level_yes_y, 1, 1, 180, c_white, 1);
							draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_lime, 1);
							scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_black, c_white, 1);
							draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
						}
						else
						{
							draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, upload_level_yes_y, 2, 2, 0, c_white, 1);
							scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("YES"), global.default_text_size * 2.3, c_white, c_black, 1);
							draw_sprite_ext(spr_icon_upload, 0, get_window_width * 0.5 - 370 + 32, upload_level_yes_y, 1, 1, 0, c_white, 1);
						}
					}
				}
			}
		}
		if (!file_exists(upload_level_path + "/data/level_information.ini"))
		{
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("level_information.ini is missing"), global.default_text_size * 1.5, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y, l10n_text("level_information.ini is missing"), global.default_text_size * 1.5, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		if (!file_exists(upload_level_path + "/data/object_placement_all.json"))
		{
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y + 42, l10n_text("object_placement_all.json is missing"), global.default_text_size * 1.5, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y + 42, l10n_text("object_placement_all.json is missing"), global.default_text_size * 1.5, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		if (!file_exists(upload_level_path + "/thumbnail.png"))
		&& (!file_exists(upload_level_path + "/automatic_thumbnail.png"))
		{
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y + 42 + 42, l10n_text("thumbnail.png is missing"), global.default_text_size * 1.5, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5, upload_level_yes_y + 42 + 42, l10n_text("thumbnail.png is missing"), global.default_text_size * 1.5, c_black, c_red, scr_wave(0, 1, 1, 0));
		}
		#endregion /* Upload Level Yes END */
		
		#region /* Return to game */
		if (key_b_pressed)
		&& (!level_editor_edit_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
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
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
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
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				/* Check if essential files exists or not */
				if (file_exists(upload_level_path + "/data/level_information.ini"))
				{
					if (file_exists(upload_level_path + "/data/object_placement_all.json"))
					{
						if (file_exists(upload_level_path + "/thumbnail.png"))
						|| (file_exists(upload_level_path + "/automatic_thumbnail.png"))
						{
							/* Essential files does exist, so upload now */
							menu = "uploading_level"; /* Go to uploading level loading screen */
							menu_delay = 60 * 3;
						}
					}
				}
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
		
		if (global.username == "")
		{
			keyboard_string = "";
			menu_delay = 3;
			menu = "question_upload_level_edit_username_ok"; /* If there isn't an username, have the player make an username */
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = false;
			}
		}
		
		content_type = "level"; /* Set "content type" to be correct for what kind of files you're uploading, before uploading the files to the server */
		var uploading_level_message_y = 532;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(0, uploading_level_message_y - 32, get_window_width, uploading_level_message_y + 32, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploading_level_message_y, l10n_text("Uploading") + " " + global.level_name + "...", global.default_text_size * 1.9, c_black, c_white, 1);
		
		draw_menu_button(get_window_width * 0.5 - 185, get_window_height - 42, l10n_text("Cancel"), "uploading_level", "edit_ok");
		draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 16, get_window_height - 42 + 21, 1, 1, 0, c_white, 1);
		
		if (key_b_pressed)
		{
			menu = "edit_ok";
		}
		
		if (menu_delay >= 41)
		{
			scr_draw_text_outlined(get_window_width * 0.5, uploading_level_message_y + 42, l10n_text("Generating Level ID"), global.default_text_size, c_black, c_dkgray, 1);
		}
		else
		if (menu_delay <= 40 && !file_exists(game_save_id + string(level_id) + ".zip"))
		{
			scr_draw_text_outlined(get_window_width * 0.5, uploading_level_message_y + 42, l10n_text("Creating Zip File"), global.default_text_size, c_black, c_dkgray, 1);
		}
		else
		if (menu_delay >= 0 && file_exists(game_save_id + string(level_id) + ".zip"))
		{
			scr_draw_text_outlined(get_window_width * 0.5, uploading_level_message_y + 42, l10n_text("Send Zip File to the Server"), global.default_text_size, c_black, c_dkgray, 1);
		}
		
		#region /* Generate Level ID */
		if (menu_delay == 50)
		{
			scr_generate_id("level");
			thumbnail_level_id[global.select_level_index] = string(level_id);
		}
		#endregion /* Generate Level ID END */
		
		#region /* Create Zip File */
		if (menu_delay <= 40 && !file_exists(game_save_id + string(level_id) + ".zip"))
		{
			file = scr_upload_zip_add_files("level"); /* Add all the level files to a new zip file */
		}
		#endregion /* Create Zip File END */
		
		else
		
		#region /* Send Zip File to the Server */
		if (menu_delay == 0 && file_exists(game_save_id + string(level_id) + ".zip"))
		{
			var zip_file = file_bin_open(game_save_id + string(level_id) + ".zip", 0);
			var zip_size = file_bin_size(zip_file);
			file_bin_close(zip_file); switch_save_data_commit(); /* Remember to commit the save data! */
			zip_megabytes = zip_size / 1024 / 1024;
			
			if (zip_megabytes > global.max_file_upload_megabytes)
			{
				if (destroy_zip_after_uploading)
				{
					file_delete(game_save_id + string(level_id) + ".zip");
				}
				menu = "error_level_too_big";
			}
			else
			{
				scr_switch_expand_save_data(); /* Expand the save data before upload */
				if (global.save_data_size_is_sufficient)
				{
					
					#region /* Actually upload the level to the server */
					content_type = "level"; /* Set "content type" to be correct for what kind of files you're uploading, before uploading the files to the server */
					
					/* User is prompted for a file to upload */
					file_name = filename_name(game_save_id + string(file));
					
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
					buffer_load_ext(send_buffer, game_save_id + string(file), 0);
					
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
					global.http_request_id = http_request("https://" + global.base_url + "/upload", "POST", map, post_data);
					
					/* Cleans up! */
					buffer_delete(send_buffer);
					ds_map_destroy(map);
					#endregion /* Actually upload the level to the server END */
					
					/* Delete some leftover files and folders */
					if (destroy_zip_after_uploading)
					{
						file_delete(game_save_id + string(level_id) + ".zip");
					}
					if (os_is_network_connected())
					{
						/* Update a list of downloaded levels that you have finished. The level you are uploading have already been finished */
						ini_open(game_save_id + "save_file/custom_level_save.ini");
						if (ini_read_real("finished_downloaded_level", string(level_id), 0) < 2)
						{
							ini_write_real("finished_downloaded_level", string(level_id), 2); /* Played and finished when uploading own level */
						}
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
						
						search_for_id_still = false;
						menu = "level_uploaded";
					}
					else
					{
						menu = "no_internet_level";
					}
				}
			}
		}
		#endregion /* Send Zip File to the Server END */
		
	}
	#endregion /* Uploading Level END */
	
	#region /* Error Level Too Big */
	if (menu == "error_level_too_big")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 42, l10n_text("Level Too Big"), global.default_text_size * 2, c_black, c_white, 1);
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
				menu = "error_level_too_big";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "error_level_too_big")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "error_level_too_big")
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
			if (variable_instance_exists(self, "open_sub_menu"))
			{
				open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
			}
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			menu = "level_editor_upload"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* Error Level Too Big END */
	
	#region /* Level Uploaded */
	if (menu == "level_uploaded")
	{
		var uploaded_level_message_y = 432;
		var ok_y = uploaded_level_message_y + 168;
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (ds_list_find_value(global.thumbnail_sprite, global.select_level_index) > 0)
		{
			/* Draw Thumbnail */
			draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, global.select_level_index), 0, get_window_width * 0.5 - 390, 32, 384 / sprite_get_width(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 216 / sprite_get_height(ds_list_find_value(global.thumbnail_sprite, global.select_level_index)) * 2, 0, c_white, 1);
		}
		draw_set_alpha(0.9);
		draw_roundrect_color_ext(0, uploaded_level_message_y - 32, get_window_width, uploaded_level_message_y + 128, 50, 50, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_text_outlined(get_window_width * 0.5, uploaded_level_message_y, global.level_name + " " + l10n_text("Uploaded"), global.default_text_size * 1.9, c_black, c_white, 1);
		/* Show Level ID */ scr_draw_text_outlined(get_window_width * 0.5, uploaded_level_message_y + 84, l10n_text("Level ID") + ": " + string_upper(level_id), global.default_text_size * 1.9, c_black, c_white, 1);
		
		#region /* Level Uploaded OK */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "level_uploaded";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "level_uploaded")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "level_uploaded")
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
		#endregion /* Level Uploaded OK END */
		
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
			menu_delay = 3;
			if (variable_instance_exists(self, "open_sub_menu"))
			{
				open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
			}
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			menu = "level_editor_upload"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* Level Uploaded END */
	
	#region /* No Internet */
	if (menu == "no_internet_level")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		/* Don't draw a level thumbnail here, to make it more obvious that there was an error connecting to the internet, because every other screen have a level thumbnail visible usually */
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, l10n_text("No Internet connection"), global.default_text_size * 1.9, c_black, c_white, 1);
		
		var ok_y = get_window_height * 0.5 + 42 + 42 + 42;
		
		#region /* OK Button */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 370, ok_y - 42, get_window_width * 0.5 + 370, ok_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		{
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "no_internet_level";
			}
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 - 370 - 32, ok_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, get_window_width * 0.5 + 370 + 32, ok_y, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_menu_button, global.menu_button_subimg, get_window_width * 0.5 - 370, ok_y, 2, 2, 0, c_lime, 1);
			scr_draw_text_outlined(get_window_width * 0.5, ok_y, l10n_text("OK"), global.default_text_size * 2.3, c_black, c_white, 1);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 370 + 32, ok_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			if (menu == "no_internet_level")
			&& (global.controls_used_for_navigation == "keyboard")
			|| (menu == "no_internet_level")
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
			if (variable_instance_exists(self, "open_sub_menu"))
			{
				open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
			}
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			menu = "level_editor_upload"; /* Return to previous menu */
		}
		#endregion /* Return to game END */
		
	}
	#endregion /* No Internet END */
	
	#region /* Enter Custom Level */
	if (room == rm_title)
	&& (iris_xscale <= 0.01)
	&& (global.character_select_in_this_menu == "level_editor")
	&& (!loading_assets)
	&& (!can_navigate)
	{
		if (audio_is_playing(title_music))
		{
			audio_stop_sound(title_music);
		}
		scr_delete_sprite_properly(title_screen_background[title_bg_layer]);
		scr_update_all_backgrounds();
		global.part_limit = 0; /* How many objects are currently placed in the level editor */
		global.part_limit_entity = 0; /* How many entities are currently placed in the level editor */
		loading_assets = true;
		room_goto(rm_leveleditor); /* Enter level editor from upload level menu */
	}
	#endregion /* Enter Custom Level END */
	
	if (open_dropdown && menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (key_a_pressed || key_b_pressed)
		{
			menu_delay = 3;
			open_dropdown = false;
		}
	}
}