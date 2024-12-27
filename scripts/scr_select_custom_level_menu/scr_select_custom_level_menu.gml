function scr_select_custom_level_menu()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	if (ds_list_size(global.all_loaded_custom_levels) - 1 >= global.max_custom_levels)
	{
		var max_custom_levels_reached = true;
	}
	else
	{
		var max_custom_levels_reached = false;
	}
	
	scroll = lerp(scroll, scroll_to, 0.15)
	
	if (have_downloaded_from_server)
	{
		/* If you are downloading a new level, the game needs to reload all custom levels when going back to back to level select, so you can select the new downloaded level */
		search_for_id_still = false;
		search_id = ""; /* Always set this to empty string when going back to previous menu */
		can_navigate = false;
		select_custom_level_menu_open = false;
		show_level_editor_corner_menu = true;
		scr_load_custom_level_initializing();
		menu = "load_custom_level";
		have_downloaded_from_server = false;
	}
	
	/* If there isn't any thumbnails loaded at all, then that is a mistake, so go back so you could reload the custom levels and the thumbnails should be corrected */
	if (ds_list_size(global.thumbnail_sprite) <= 0)
	&& (menu != "load_official_level_template")
	&& (menu != "level_editor_create_from_template")
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		can_input_level_name = false;
		menu_delay = 3;
		open_sub_menu = false;
		show_level_editor_corner_menu = true;
		can_navigate = true;
		select_custom_level_menu_open = false;
		level_editor_template_select = false;
		global.select_level_index = 0;
		menu = "level_editor"; /* Go back to level editor button if there isn't any loaded thumbnails at all */
	}
	
	/* Never have the select level index under 0, if it does, set it to 0 */
	if (global.select_level_index <= -1)
	{
		global.select_level_index = 0;
	}
	
	if (global.select_level_index >= 1)
	&& (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Can only open sub menu if there actually is a level existing */
	{
		if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
		{
			/* Update the "global level name" so game knows what level player is selecting when opening sub menu */
			global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
		}
	}
	
	if (os_type == os_linux)
	{
		show_delete_button = false; /* If delete custom level buttons should show up or not. Sometimes you don't want it to show up when the feature is unavailable */
	}
	else
	{
		show_delete_button = true;
	}
	if (get_window_width >= 1670)
	{
		thumbnail_x_offset = 0;
		row = 4;
	}
	else
	if (get_window_width >= 1276)
	{
		thumbnail_x_offset = 0;
		row = 3;
	}
	else
	if (get_window_width >= 882)
	{
		thumbnail_x_offset = - 64;
		row = 3;
	}
	else
	if (get_window_width >= 488)
	{
		thumbnail_x_offset = - 64;
		row = 1;
	}
	column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_custom_levels)))
	
	#region /* Navigate Menu */
	
	#region /* Key Up */
	if (key_up)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	|| (mouse_wheel_up())
	{
		if (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_sub_menu)
		&& (!open_upload_menu)
		&& (menu != "back_from_level_editor")
		&& (menu != "open_custom_levels_folder")
		&& (menu != "online_level_list")
		&& (menu != "caution_online_back")
		&& (menu != "caution_online_do_not_show")
		&& (menu != "caution_online_proceed")
		&& (menu != "caution_online_network_error")
		&& (menu != "upload_rules_back")
		&& (menu != "upload_rules_do_not_show")
		&& (menu != "upload_rules")
		&& (menu != "level_editor_downloaded_level")
		&& (menu != "level_length_recommendation_ok" && menu != "level_length_recommendation_back")
		{
			menu_delay = 3;
			if (global.select_level_index - row < 0)
			&& (global.controls_used_for_navigation != "mouse")
			&& (show_level_editor_corner_menu)
			{
				if (global.free_communication_available)
				{
					menu = "online_level_list";
				}
				else
				if (global.enable_open_custom_folder)
				{
					menu = "open_custom_levels_folder";
				}
				else
				{
					menu = "back_from_level_editor";
				}
			}
			else
			if (global.select_level_index - row > - 1)
			{
				global.select_level_index -= clamp(row, 0, ds_list_size(global.all_loaded_custom_levels));
				if (mouse_wheel_up())
				{
					scroll_to = scroll - 1;
				}
				else
				{
					scroll_to = floor(global.select_level_index / row);
				}
			}
		}
	}
	#endregion /* Key Up END */
	
	else
	
	#region /* Key Down */
	if (key_down)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	|| (mouse_wheel_down())
	{
		if (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_sub_menu)
		&& (!open_upload_menu)
		&& (menu != "back_from_level_editor")
		&& (menu != "open_custom_levels_folder")
		&& (menu != "online_level_list")
		&& (menu != "caution_online_back")
		&& (menu != "caution_online_do_not_show")
		&& (menu != "caution_online_proceed")
		&& (menu != "caution_online_network_error")
		&& (menu != "upload_rules_back")
		&& (menu != "upload_rules_do_not_show")
		&& (menu != "upload_rules")
		&& (menu != "level_editor_downloaded_level")
		&& (menu != "level_length_recommendation_ok" && menu != "level_length_recommendation_back")
		{
			menu_delay = 3;
			if (global.select_level_index + row > ds_list_size(global.thumbnail_sprite) - 1)
			&& (global.controls_used_for_navigation != "mouse")
			&& (show_level_editor_corner_menu)
			{
				menu = "back_from_level_editor";
			}
			else
			if (global.select_level_index + row < ds_list_size(global.thumbnail_sprite))
			{
				global.select_level_index += clamp(row, 0, ds_list_size(global.all_loaded_custom_levels));
				if (mouse_wheel_down())
				{
					scroll_to = scroll + 1
				}
				else
				{
					scroll_to = floor(global.select_level_index / row);
				}
			}
		}
	}
	#endregion /* Key Down END */
	
	else
	
	#region /* Key Left */
	if (key_left)
	&& (!can_input_level_name)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (!open_sub_menu)
	&& (!open_upload_menu)
	&& (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "caution_online_network_error")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
	&& (menu != "level_length_recommendation_ok" && menu != "level_length_recommendation_back")
	{
		menu_delay = 3;
		if (global.select_level_index - 1 < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
		}
		else
		{
			global.select_level_index --;
		}
		scroll_to = floor(global.select_level_index / row);
	}
	#endregion /* Key Left END */
	
	else
	
	#region /* Key Right */
	if (key_right)
	&& (!can_input_level_name)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (!open_sub_menu)
	&& (!open_upload_menu)
	&& (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "caution_online_network_error")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
	&& (menu != "level_length_recommendation_ok" && menu != "level_length_recommendation_back")
	{
		menu_delay = 3;
		if (global.select_level_index + 1 > ds_list_size(global.thumbnail_sprite) - 1)
		{
			global.select_level_index = 0;
		}
		else
		{
			global.select_level_index ++;
		}
		scroll_to = floor(global.select_level_index / row);
	}
	#endregion /* Key Right END */
	
	else
	
	#region /* Key A pressed */
	if (key_a_pressed)
	|| (mouse_check_button_released(mb_left))
	{
		if (!can_input_level_name)
		&& (!open_sub_menu)
		&& (!open_upload_menu)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu != "back_from_level_editor")
		&& (menu != "open_custom_levels_folder")
		&& (menu != "online_level_list")
		&& (menu != "caution_online_back")
		&& (menu != "caution_online_do_not_show")
		&& (menu != "caution_online_proceed")
		&& (menu != "caution_online_network_error")
		&& (menu != "upload_rules_back")
		&& (menu != "upload_rules_do_not_show")
		&& (menu != "upload_rules")
		&& (menu != "level_editor_downloaded_level")
		&& (menu != "level_length_recommendation_ok" && menu != "level_length_recommendation_back")
		{
			
			#region /* Create New Level */
			if (global.select_level_index == 0)
			&& (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Can only open sub menu if there actually is a level existing */
			&& (ds_list_size(global.all_loaded_custom_levels) - 1 < global.max_custom_levels) /* You should only be able to make a certain amount of levels, but can still download more levels */
			{
				menu_delay = 3;
				scroll_to = floor(global.select_level_index / row);
				menu = "level_editor_create_from_scratch";
				open_sub_menu = true;
			}
			#endregion /* Create New Level END */
			
			else
			
			#region /* Open sub menu for levels */
			if (global.select_level_index >= 1)
			&& (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Can only open sub menu if there actually is a level existing */
			{
				menu_delay = 3;
				if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
				{
					/* Update the "global level name" so game knows what level player is selecting when opening sub menu */
					global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
				}
				scroll_to = floor(global.select_level_index / row);
				menu = "level_editor_play";
				open_sub_menu = true;
			}
			#endregion /* Open sub menu for levels END */
			
		}
	}
	#endregion /* Key A pressed END */
	
	else
	
	#region /* Key B Pressed */
	if (key_b_pressed)
	&& (!can_input_level_name)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (show_level_editor_corner_menu)
	&& (open_sub_menu)
	{
		menu_delay = 3;
		open_sub_menu = false;
		show_level_editor_corner_menu = true;
		scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		menu = "level_editor_play";
	}
	#endregion /* Key B Pressed END */
	
	#endregion /* Navigate Menu END */
	
	scr_draw_level_editor_thumbnail(global.all_loaded_custom_levels, false);
	
	column = floor(global.select_level_index / row); /* Do this code again here so the sub menu doesn't get misaligned */
	
	#region /* Show the path of the custom level on the bottom of the screen */
	if (global.select_level_index >= 1)
	&& (global.enable_option_for_pc)
	&& (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Can only show path that isn't undefined */
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (get_window_width <= 1350)
		{
			var text_scale_modifier = 0.75;
		}
		else
		{
			var text_scale_modifier = 1;
		}
		draw_roundrect_color_ext(0, get_window_height - 32, get_window_width, get_window_height, 50, 50, c_black, c_black, false);
		var file_path_text = string_replace_all(string_replace_all(game_save_id, environment_get_variable("USERNAME"), "*") + "\custom_levels\\" + global.level_name, "\\", "/");
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 16, string(file_path_text), global.default_text_size * text_scale_modifier, c_menu_outline, c_dkgray, 1);
	}
	#endregion /* Show the path of the custom level on the bottom of the screen END */
	
	scr_draw_level_editor_sub_menu(); /* Code must be here to be above everything else */
	
	#region /* Corner menu: Back button, Open custom levels folder, Search button */
	if (menu != "load_custom_level")
	&& (menu != "load_characters")
	&& (menu != "load_official_level_template")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "caution_online_network_error")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
	&& (menu != "level_length_recommendation_ok" && menu != "level_length_recommendation_back")
	&& (show_level_editor_corner_menu)
	{
		
		#region /* Open Custom Levels Folder */
		if (global.enable_open_custom_folder)
		{
			var draw_open_custom_levels_folder_y = 42;
			draw_menu_button(0, draw_open_custom_levels_folder_y, l10n_text("Open Custom Levels Folder"), "open_custom_levels_folder", "");
			draw_sprite_ext(spr_icon_folder, 0, 16, 42 + 21, 1, 1, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, draw_open_custom_levels_folder_y + 2, 370, draw_open_custom_levels_folder_y + 41))
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (menu == "open_custom_levels_folder")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				scr_open_folder(game_save_id + "\custom_levels")
			}
			if (menu == "open_custom_levels_folder")
			&& (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (show_level_editor_corner_menu)
			{
				menu_delay = 3;
				can_navigate = true;
				select_custom_level_menu_open = true;
				menu = "back_from_level_editor";
			}
			else
			if (menu == "open_custom_levels_folder")
			&& (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				can_navigate = true;
				select_custom_level_menu_open = true;
				if (global.free_communication_available)
				{
					menu = "online_level_list";
				}
				else
				{
					menu = "level_editor_play";
					scroll_to = floor(global.select_level_index / row);
				}
			}
			if (menu == "open_custom_levels_folder")
			{
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
			}
		}
		#endregion /* Open Custom Levels Folder END */
		
		#region /* Online Level List */
		if (global.enable_open_custom_folder)
		{
			var draw_online_level_list_y = 42 * 2;
		}
		else
		{
			var draw_online_level_list_y = 42;
		}
		if (global.free_communication_available)
		{
			draw_menu_button(0, draw_online_level_list_y, l10n_text("Online Level List"), "online_level_list", "");
			if (levels_added_today_text != "")
			{
				draw_set_halign(fa_left);
				scr_draw_text_outlined(370 + 25, draw_online_level_list_y + 21, string(levels_added_today_text), global.default_text_size + scr_wave(0, 0.1, 1), c_black, c_lime, 1);
				draw_set_halign(fa_center);
			}
			
			if (menu == "online_level_list")
			&& (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, draw_online_level_list_y + 2, 370, draw_online_level_list_y + 41))
			|| (menu == "online_level_list")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.online_enabled)
				&& (os_is_network_connected())
				{
					scr_switch_update_online_status();
					
					if (global.switch_logged_in)
					{
						if (global.switch_account_network_service_available) /* Need to make sure that network service is available before going online */
						{
							if (scr_online_token_is_valid() == true)
							{
								/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
								select_custom_level_menu_open = false;
								content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
								global.selected_online_download_index = 0;
								menu = "online_download_list_load";
							}
							else
							{
								menu_delay = 3;
								caution_online_takes_you_to = "online_download_list_load";
								caution_online_takes_you_back_to = "online_level_list";
								menu = "caution_online_network_error";
							}
						}
						else
						{
							menu_delay = 3;
							caution_online_takes_you_to = "online_download_list_load";
							caution_online_takes_you_back_to = "online_level_list";
							menu = "caution_online_network_error";
						}
					}
					else
					{
						menu_delay = 3;
						menu = "online_level_list";
					}
				}
				else
				{
					content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
					caution_online_takes_you_to = "online_download_list_load";
					caution_online_takes_you_back_to = "online_level_list";
					if (os_is_network_connected())
					{
						menu = "caution_online_proceed";
					}
					else
					{
						menu = "no_internet_level";
					}
					menu_delay = 3;
				}
			}
		}
		if (menu == "online_level_list")
		&& (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (show_level_editor_corner_menu)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			if (global.enable_open_custom_folder)
			{
				menu = "open_custom_levels_folder";
			}
			else
			{
				menu = "back_from_level_editor";
			}
		}
		else
		if (menu == "online_level_list")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
			scroll_to = floor(global.select_level_index / row);
		}
		if (menu == "open_custom_levels_folder")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Online Level List END */
		
		#region /* Back Button */
		draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "");
		draw_sprite_ext(spr_icon_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
		if (menu == "back_from_level_editor")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_sub_menu)
		&& (!open_upload_menu)
		&& (!can_input_level_name)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!open_sub_menu)
		&& (!open_upload_menu)
		&& (!can_input_level_name)
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 42))
		&& (mouse_check_button_released(mb_left))
		{
			can_input_level_name = false;
			menu_delay = 3;
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
			can_navigate = true;
			select_custom_level_menu_open = false;
			level_editor_template_select = false;
			global.select_level_index = 0;
			menu = "level_editor";
		}
		if (menu == "back_from_level_editor")
		&& (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
			if (global.select_level_index - row < 0)
			{
				global.select_level_index = ds_list_size(global.thumbnail_sprite) - 1;
			}
			scroll_to = floor(global.select_level_index / row);
		}
		if (menu == "back_from_level_editor")
		&& (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (show_level_editor_corner_menu)
		{
			menu_delay = 3;
			can_navigate = true;
			select_custom_level_menu_open = true;
			if (global.enable_open_custom_folder)
			{
				menu = "open_custom_levels_folder";
			}
			else
			if (global.free_communication_available)
			{
				menu = "online_level_list";
			}
			else
			{
				menu = "level_editor_play";
			}
		}
		if (menu == "back_from_level_editor")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Back Button END */
		
		#region /* Hovering over level editor corner menu */
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, draw_online_level_list_y + 42))
		{
			hovering_over_level_editor_corner_menu = true; /* When hovering the mouse over level editor corner menu, don't let the player click on other buttons like thumbnails */
			open_sub_menu = false; /* Close the sub menu, otherwise it locks the thumbnail navigation */
		}
		else
		{
			hovering_over_level_editor_corner_menu = false;
		}
		#endregion /* Hovering over level editor corner menu END */
		
	}
	#endregion /* Corner menu: Back button, Open custom levels folder, Search button END */
	
	#region /* Show level information at bottom of screen */
	
	#region /* Draw Level Description and Creator*/
	if (global.select_level_index >= 1)
	&& (variable_instance_exists(self, "thumbnail_level_description"))
	{
		draw_set_valign(fa_middle);
		if (is_array(thumbnail_level_description))
		&& (array_length(thumbnail_level_description) > 0)
		&& (global.select_level_index >= 0)
		&& (global.select_level_index < array_length(thumbnail_level_description))
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 42, string(thumbnail_level_description[global.select_level_index]), global.default_text_size, c_black, c_white, 1);
		}
		draw_set_halign(fa_right);
		if (is_array(thumbnail_level_username))
		&& (array_length(thumbnail_level_username) > 0)
		&& (global.select_level_index >= 0)
		&& (global.select_level_index < array_length(thumbnail_level_username))
		&& (thumbnail_level_username[global.select_level_index] != "")
		{
			scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("By") + ": " + string(thumbnail_level_username[global.select_level_index]), global.default_text_size, c_black, c_white, 1);
		}
	}
	#endregion /* Draw Level Description and Creator END */
	
	#endregion /* Show level information at bottom of screen END */
	
	#region /* Draw above everything else */
	
	#region /* Input Level Name */
	if (menu == "level_editor_enter_name_ok")
	|| (menu == "level_editor_enter_name_cancel")
	{
		if (keyboard_virtual_status()
		&& keyboard_virtual_height() != 0
		&& keyboard_virtual_height() != undefined)
		{
			var draw_name_input_screen_y = display_get_gui_height() - keyboard_virtual_height() - 160;
		}
		else
		{
			var draw_name_input_screen_y = 226 * (column - scroll) + 500;
		}
		
		show_level_editor_corner_menu = false;
		if (can_input_level_name)
		{
			global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, 394 * (global.select_level_index - column * row) + 300 + thumbnail_x_offset, draw_name_input_screen_y, "level_editor_enter_name_ok", "level_editor_enter_name_cancel", false, true, false);
			if (creating_daily_build) {
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 64, l10n_text("Daily Build"), global.default_text_size * 2, c_black, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 128, l10n_text("The Daily Build features different items every day"), global.default_text_size, c_black, c_white, 1);
			}
		}
		
		#region /* Press Enter to confirm a new level name */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (keyboard_string != "")
		&& (global.level_name != undefined)
		&& (menu == "level_editor_enter_name_ok")
		{
			if (global.clicking_ok_input_screen)
			{
				scr_switch_expand_save_data(); /* Expand the save data before editing level name */
				if (global.save_data_size_is_sufficient)
				{
					if (level_editor_edit_name && global.level_name != old_level_name)
					{
						global.go_to_menu_when_going_back_to_title = "level_editor_edit_name";
						scr_rename_custom_level_name();
					}
					else
					if (level_editor_edit_name && global.level_name == old_level_name)
					{
						menu = "level_editor_edit_name";
						level_editor_edit_name = false;
					}
					else
					if (!level_editor_edit_name)
					{
						
						#region /* When creating a level from scratch, not editing level name of already existing level, run this code */
						var folder_name = global.level_name;
						folder_name = scr_replace_illegal_characters(folder_name);
						
						if (global.level_name != "")
						{
							ini_open(game_save_id + "custom_levels/" + folder_name + "/data/level_information.ini");
							ini_write_string("info", "level_name", global.level_name);
							ini_write_string("info", "level_description", ""); /* Save a blank level description */
							if (creating_daily_build)
							{
								ini_write_real("info", "if_daily_build", true);
							}
							ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
						}
						
						global.level_name = folder_name; /* Set the global level name to the filtered level name, because it will be reading filtered folder names */
						
						can_navigate = false;
						menu_delay = 9999;
						if (instance_exists(obj_camera))
						{
							obj_camera.iris_zoom = 0;
						}
						#endregion /* When creating a level from scratch, not editing level name of already existing level, run this code END */
						
					}
					global.doing_clear_check_level = false;
					global.actually_play_edited_level = false;
					global.play_edited_level = false;
					can_input_level_name = false;
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Press Enter to confirm a new level name END */
		
		#region /* Press Escape to cancel a new level name */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (global.clicking_cancel_input_screen)
		{
			menu_delay = 3;
			if (instance_exists(obj_camera))
			{
				obj_camera.iris_zoom = 0;
			}
			can_input_level_name = false;
			if (level_editor_edit_name)
			{
				menu = "level_editor_edit_name";
				level_editor_edit_name = false;
			}
			else
			{
				menu = "level_editor_create_from_scratch";
			}
		}
		#endregion /* Press Escape to cancel a new level name END */
		
	}
	#endregion /* Input Level Name END */
	
	#region /* Edit level description */
	if (menu == "level_editor_enter_description_ok")
	|| (menu == "level_editor_enter_description_cancel")
	{
		if (keyboard_virtual_status()
		&& keyboard_virtual_height() != 0
		&& keyboard_virtual_height() != undefined)
		{
			var draw_description_input_screen_y = display_get_gui_height() - keyboard_virtual_height() - 160;
		}
		else
		{
			var draw_description_input_screen_y = get_window_height * 0.5;
		}
		
		if (can_input_level_name)
		{
			show_level_editor_corner_menu = false;
			global.level_description = scr_draw_name_input_screen(global.level_description, 75, c_black, 1, false, get_window_width * 0.5, draw_description_input_screen_y, "level_editor_enter_description_ok", "level_editor_enter_description_cancel", false, true, false);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, draw_description_input_screen_y - 96, l10n_text("Enter level description for") + " " + string(thumbnail_level_name[global.select_level_index]), global.default_text_size, c_black, c_white, 1);
		}
		
		#region /* Input Level Description */
		
		#region /* Press Enter to make new description */
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
					show_level_editor_corner_menu = true;
					menu_delay = 3;
					
					ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					ini_write_string("info", "level_description", string(global.level_description)); /* Save description */
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					
					if (variable_instance_exists(self, "thumbnail_level_description"))
					{
						if (is_array(thumbnail_level_description))
						&& (array_length(thumbnail_level_description) > 0)
						&& (global.select_level_index >= 0)
						&& (global.select_level_index < array_length(thumbnail_level_description))
						{
							thumbnail_level_description[global.select_level_index] = string(global.level_description);
						}
					}
					
					menu = "level_editor_enter_description";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name)
				&& (global.level_description == old_level_description)
				{
					menu = "level_editor_enter_description";
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
		#endregion /* Press Enter to make new description END */
		
		#region /* Press Escape to back out from level from scratch menu */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (global.clicking_cancel_input_screen)
		{
			menu_delay = 3;
			if (instance_exists(obj_camera))
			{
				obj_camera.iris_zoom = 0;
			}
			can_input_level_name = false;
			if (level_editor_edit_name)
			{
				menu = "level_editor_enter_description";
				level_editor_edit_name = false;
			}
			else
			{
				menu = "level_editor_enter_description";
			}
		}
		#endregion /* Press Escape to back out from level from scratch menu END */
	
		#endregion /* Input Level Description END */
		
	}
	#endregion /* Edit level description END */
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, 16, string(ds_list_size(global.all_loaded_custom_levels) - 1) + " " + l10n_text("Levels"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
	if (ds_list_size(global.all_loaded_custom_levels) - 1 >= global.max_custom_levels)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 42, l10n_text("There are too many levels stored! Delete some levels"), global.default_text_size * 0.75, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 42, l10n_text("There are too many levels stored! Delete some levels"), global.default_text_size * 0.75, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
	}
	
	/* Display the total custom level folder size in MB */
	if (custom_levels_folder_megabytes > 1)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 32, l10n_text("Custom level folder size") + ": " + string(custom_levels_folder_megabytes) + " MB", global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	#endregion /* Draw above everything else END */
	
	/* When you first enter the level select screen, it doesn't always scroll correctly. Make sure that for several frames, the "scroll to" variable is forced to correct value */
	if (scroll_to_timer > 0)
	{
		scroll_to = floor(global.select_level_index / row);
		scroll_to_timer --;
	}
	
}