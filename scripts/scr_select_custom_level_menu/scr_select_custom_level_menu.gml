function scr_select_custom_level_menu()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var max_custom_levels = 180; /* You should be able to store 180 custom levels, these are both levels you have made, and levels you have downloaded */
	var separate_created_and_downloaded_level = false;
	if (ds_list_size(global.all_loaded_custom_levels) - 1 >= max_custom_levels)
	{
		var max_custom_levels_reached = true;
	}
	else
	{
		var max_custom_levels_reached = false;
	}
	
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
	{
		can_input_level_name = false;
		menu_delay = 3;
		open_sub_menu = false;
		show_level_editor_corner_menu = true;
		can_navigate = true;
		select_custom_level_menu_open = false;
		level_editor_template_select = false;
		global.select_level_index = 0;
		lerp_on = true;
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
		&& (open_sub_menu == false)
		&& (menu != "back_from_level_editor")
		&& (menu != "open_custom_levels_folder")
		&& (menu != "online_level_list")
		&& (menu != "caution_online_back")
		&& (menu != "caution_online_do_not_show")
		&& (menu != "caution_online_proceed")
		&& (menu != "upload_rules_back")
		&& (menu != "upload_rules_do_not_show")
		&& (menu != "upload_rules")
		&& (menu != "level_editor_downloaded_level")
		{
			menu_delay = 3;
			if (global.select_level_index - row < 0)
			&& (global.controls_used_for_menu_navigation != "mouse")
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
				lerp_on = true;
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
		&& (open_sub_menu == false)
		&& (menu != "back_from_level_editor")
		&& (menu != "open_custom_levels_folder")
		&& (menu != "online_level_list")
		&& (menu != "caution_online_back")
		&& (menu != "caution_online_do_not_show")
		&& (menu != "caution_online_proceed")
		&& (menu != "upload_rules_back")
		&& (menu != "upload_rules_do_not_show")
		&& (menu != "upload_rules")
		&& (menu != "level_editor_downloaded_level")
		{
			menu_delay = 3;
			if (global.select_level_index + row > ds_list_size(global.thumbnail_sprite) - 1)
			&& (global.controls_used_for_menu_navigation != "mouse")
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
				lerp_on = true;
			}
		}
	}
	#endregion /* Key Down END */
	
	else
	
	#region /* Key Left */
	if (key_left)
	&& (!can_input_level_name)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (open_sub_menu == false)
	&& (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
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
		lerp_on = true;
	}
	#endregion /* Key Left END */
	
	else
	
	#region /* Key Right */
	if (key_right)
	&& (!can_input_level_name)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	&& (open_sub_menu == false)
	&& (menu != "back_from_level_editor")
	&& (menu != "open_custom_levels_folder")
	&& (menu != "online_level_list")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
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
		lerp_on = true;
	}
	#endregion /* Key Right END */
	
	else
	
	#region /* Key A pressed */
	if (key_a_pressed)
	|| (mouse_check_button_released(mb_left))
	{
		if (!can_input_level_name)
		&& (open_sub_menu == false)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (menu != "back_from_level_editor")
		&& (menu != "open_custom_levels_folder")
		&& (menu != "online_level_list")
		&& (menu != "caution_online_back")
		&& (menu != "caution_online_do_not_show")
		&& (menu != "caution_online_proceed")
		&& (menu != "upload_rules_back")
		&& (menu != "upload_rules_do_not_show")
		&& (menu != "upload_rules")
		&& (menu != "level_editor_downloaded_level")
		{
			
			#region /* Create New Level */
			if (global.select_level_index == 0)
			&& (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Can only open sub menu if there actually is a level existing */
			&& (ds_list_size(global.all_loaded_custom_levels) - 1 < 120) /* You should only be able to make 120 levels, but can still download more levels */
			{
				menu_delay = 3;
				scroll_to = floor(global.select_level_index / row);
				lerp_on = true;
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
				lerp_on = true;
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
	{
		if (open_sub_menu)
		{
			menu_delay = 3;
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
			menu = "level_editor_play";
		}
	}
	#endregion /* Key B Pressed END */
	
	#endregion /* Navigate Menu END */
	
	scr_draw_level_editor_thumbnail(global.all_loaded_custom_levels, false);
	
	column = floor(global.select_level_index / row); /* Do this code again here so the sub menu doesn't get misaligned */
	
	scr_draw_level_editor_sub_menu(); /* Code must be here to be above everything else */
	
	#region /* Corner menu: Back button, Open custom levels folder, Search button */
	if (menu != "load_custom_level")
	&& (menu != "load_characters")
	&& (menu != "load_official_level_template")
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (show_level_editor_corner_menu)
	{
		
		#region /* Downloaded Levels Button */
		if (separate_created_and_downloaded_level)
		{
			draw_menu_button(display_get_gui_width() * 0.5, 0, l10n_text("Downloaded Levels"), "level_editor_downloaded_level", "level_editor_downloaded_level");
			draw_sprite_ext(spr_icons_upload, 0, display_get_gui_width() * 0.5 + 20, + 21, 1, 1, 0, c_white, 1);
			if (menu == "level_editor_downloaded_level")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_sub_menu == false)
			&& (!can_input_level_name)
			|| (key_b_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (open_sub_menu == false)
			&& (!can_input_level_name)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5, 0, display_get_gui_width() * 0.5 + 320, 42))
			&& (mouse_check_button_released(mb_left))
			{
				can_input_level_name = false;
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				can_navigate = true;
				select_custom_level_menu_open = true;
				level_editor_template_select = false;
				global.select_level_index = 0;
				lerp_on = true;
				menu = "level_editor_downloaded_level";
			}
			if (menu == "level_editor_downloaded_level")
			&& (key_left)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				can_navigate = true;
				select_custom_level_menu_open = true;
				menu = "back_from_level_editor";
				scroll_to = floor(global.select_level_index / row);
				lerp_on = true;
			}
			if (menu == "back_from_level_editor")
			|| (menu == "open_custom_levels_folder")
			|| (menu == "online_level_list")
			{
				if (key_right && menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					can_navigate = true;
					select_custom_level_menu_open = true;
					menu = "level_editor_downloaded_level";
					scroll_to = floor(global.select_level_index / row);
					lerp_on = true;
				}
			}
			if (menu == "level_editor_downloaded_level")
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
				lerp_on = true;
			}
			if (menu == "level_editor_downloaded_level")
			&& (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (show_level_editor_corner_menu)
			{
				menu_delay = 3;
				can_navigate = true;
				select_custom_level_menu_open = true;
				menu = "level_editor_play";
				scroll_to = floor(global.select_level_index / row);
				lerp_on = true;
			}
			if (menu == "level_editor_downloaded_level")
			{
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
			}
		}
		#endregion /* Downloaded Levels Button END */
		
		#region /* Back Button */
		draw_menu_button(0, 0, l10n_text("Back"), "back_from_level_editor", "back_from_level_editor");
		draw_sprite_ext(spr_icons_back, 0, + 20, + 21, 1, 1, 0, c_white, 1);
		if (menu == "back_from_level_editor")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (open_sub_menu == false)
		&& (!can_input_level_name)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (open_sub_menu == false)
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
			lerp_on = true;
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
			lerp_on = true;
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
			lerp_on = true;
		}
		if (menu == "back_from_level_editor")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Back Button END */
		
		#region /* Open Custom Levels Folder */
		var draw_open_custom_levels_folder_y = 42;
		draw_menu_button(0, draw_open_custom_levels_folder_y, l10n_text("Open Custom Levels Folder"), "open_custom_levels_folder", "open_custom_levels_folder");
		draw_sprite_ext(spr_icons_folder, 0, 16, 42 + 21, 1, 1, 0, c_white, 1);
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, draw_open_custom_levels_folder_y + 2, 370, draw_open_custom_levels_folder_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
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
			lerp_on = true;
		}
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
			lerp_on = true;
		}
		if (menu == "open_custom_levels_folder")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
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
			draw_menu_button(0, draw_online_level_list_y, l10n_text("Online Level List"), "online_level_list", "online_level_list");
			if (max_custom_levels_reached)
			{
				draw_sprite_ext(spr_menu_button, global.menu_button_subimg, 0, draw_online_level_list_y + 21, 1, 1, 0, c_dkgray, 0.5);
				draw_sprite_ext(spr_lock_icon, 0, 16, draw_online_level_list_y + 21, 1, 1, 0, c_white, 1);
			}
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, draw_online_level_list_y + 2, 370, draw_online_level_list_y + 41))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!max_custom_levels_reached)
			|| (menu == "online_level_list")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!max_custom_levels_reached)
			{
				if (global.online_enabled)
				{
					/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
					select_custom_level_menu_open = false;
					content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
					global.selected_online_download_index = 1;
					menu = "online_download_list_load";
				}
				else
				{
					content_type = "level"; /* Need to set the "content type" to "level", so Async - HTTP Event is running correctly */
					caution_online_takes_you_to = "online_download_list_load";
					caution_online_takes_you_back_to = "online_level_list";
					menu = "caution_online_proceed";
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
			lerp_on = true;
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
			lerp_on = true;
		}
		if (menu == "open_custom_levels_folder")
		{
			open_sub_menu = false;
			show_level_editor_corner_menu = true;
			scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
		}
		#endregion /* Online Level List END */
		
		if (global.controls_used_for_menu_navigation == "mouse")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, draw_online_level_list_y + 42))
		{
			hovering_over_level_editor_corner_menu = true; /* When hovering the mouse over level editor corner menu, don't let the player click on other buttons like thumbnails */
		}
		else
		{
			hovering_over_level_editor_corner_menu = false;
		}
		
	}
	#endregion /* Corner menu: Back button, Open custom levels folder, Search button END */
	
	#region /* Show level information at bottom of screen */
	
	#region /* Draw Level Description and Creator*/
	if (global.select_level_index >= 1)
	{
		draw_set_valign(fa_middle);
		if (array_length(thumbnail_level_description) > 0)
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 74, string(thumbnail_level_description[global.select_level_index]), global.default_text_size * 1.25, c_black, c_white, 1);
		}
		draw_set_halign(fa_right);
		if (array_length(thumbnail_level_username) > 0)
		&& (thumbnail_level_username[global.select_level_index] != "")
		{
			scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("By") + ": " + string(thumbnail_level_username[global.select_level_index]), global.default_text_size, c_black, c_white, 1);
		}
	}
	#endregion /* Draw Level Description and Creator END */
	
	#region /* Show the path of the custom level on the bottom of the screen */
	if (global.select_level_index >= 1)
	&& (global.enable_options_for_pc)
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
		scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32, string_replace_all(game_save_id + "\custom_levels\\" + global.level_name, "\\", "/"), global.default_text_size * text_scale_modifier, c_menu_outline, c_dkgray, 1);
	}
	#endregion /* Show the path of the custom level on the bottom of the screen END */
	
	#endregion /* Show level information at bottom of screen END */
	
	#region /* Draw above everything else */
	
	#region /* Input Level Name */
	if (menu == "level_editor_enter_name_ok")
	|| (menu == "level_editor_enter_name_cancel")
	{
		if (keyboard_virtual_status())
		&& (keyboard_virtual_height() != 0)
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
			global.level_name = scr_draw_name_input_screen(global.level_name, 32, c_black, 1, false, 394 * (global.select_level_index - column * row) + 300 + thumbnail_x_offset, draw_name_input_screen_y, "level_editor_enter_name_ok", "level_editor_enter_name_cancel");
		}
		
		#region /* Press Enter to make new level from scratch */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (keyboard_string != "")
		&& (global.level_name != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			&& (menu == "level_editor_enter_name_ok")
			|| (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, 394 * (global.select_level_index - column * row) + 300 - 185 + thumbnail_x_offset, draw_name_input_screen_y + 54, 394 * (global.select_level_index - column * row) + 300 - 185 + 370 + thumbnail_x_offset, draw_name_input_screen_y + 54 + 42))
			&& (mouse_check_button_released(mb_left))
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
			&& (menu == "level_editor_enter_name_ok")
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
			&& (menu == "level_editor_enter_name_ok")
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
			&& (menu == "level_editor_enter_name_ok")
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
			&& (menu == "level_editor_enter_name_ok")
			{
				if (level_editor_edit_name)
				&& (global.level_name != old_level_name)
				{
					scr_switch_expand_save_data(); /* Expand the save data before editing level name */
					if (global.save_data_size_is_sufficient)
					{
						can_navigate = true;
						menu_delay = 3;
						ini_open(working_directory + "save_file/custom_level_save.ini");
						ini_section_delete(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
						scr_copy_move_files(working_directory + "custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), working_directory + "custom_levels/" + global.level_name, true);
						scr_load_custom_level_initializing();
						menu = "load_custom_level";
						level_editor_edit_name = false;
						if (global.level_name != "")
						{
							ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
							ini_write_string("info", "level_name", global.level_name);
							ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
							thumbnail_level_name[global.select_level_index] = global.level_name;
						}
						global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, global.level_name); /* After renaming a level, make sure "select level index" is updated */
					}
				}
				else
				if (level_editor_edit_name)
				&& (global.level_name == old_level_name)
				{
					menu = "level_editor_edit_name";
					level_editor_edit_name = false;
				}
				else
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (instance_exists(obj_camera))
					{
						obj_camera.iris_zoom = 0;
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to make new level from scratch END */
		
		#region /* Press Escape to back out from level from scratch menu */
		if (keyboard_check_pressed(vk_enter))
		&& (menu == "level_editor_enter_name_cancel")
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (keyboard_check_pressed(vk_escape))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y,
		394 * (global.select_level_index - column * row) + 300 - 185 + thumbnail_x_offset,
		draw_name_input_screen_y + 54 + 42,
		394 * (global.select_level_index - column * row) + 300 - 185 + 370 + thumbnail_x_offset,
		draw_name_input_screen_y + 54 + 42 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (mouse_check_button_released(mb_right))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
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
		#endregion /* Press Escape to back out from level from scratch menu END */
		
	}
	#endregion /* Input Level Name END */
	
	#region /* Edit level description */
	if (menu == "level_editor_enter_description_ok")
	|| (menu == "level_editor_enter_description_cancel")
	{
		if (keyboard_virtual_status())
		&& (keyboard_virtual_height() != 0)
		{
			var draw_description_input_screen_y = display_get_gui_height() - keyboard_virtual_height() - 160;
		}
		else
		{
			var draw_description_input_screen_y = get_window_height * 0.5;
		}
		
		if (can_input_level_name)
		{
			global.level_description = scr_draw_name_input_screen(global.level_description, 75, c_black, 1, false, get_window_width * 0.5, draw_description_input_screen_y, "level_editor_enter_description_ok", "level_editor_enter_description_cancel");
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5, draw_description_input_screen_y - 32, l10n_text("Enter level description for") + " " + string(thumbnail_level_name[global.select_level_index]), global.default_text_size, c_black, c_white, 1);
		}
		
		#region /* Input Level Description */
		
		#region /* Press Enter to make new description */
		if (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (keyboard_string != "")
		&& (global.level_description != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			&& (menu == "level_editor_enter_description_ok")
			|| (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, draw_description_input_screen_y + 54, get_window_width * 0.5 - 185 + 370, draw_description_input_screen_y + 54 + 42))
			&& (mouse_check_button_released(mb_left))
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
			{
				if (level_editor_edit_name)
				&& (global.level_description != old_level_description)
				{
					can_navigate = true;
					menu_delay = 3;
					
					/* Save description to level_information.ini */
					ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
					ini_write_string("info", "level_description", string(global.level_description));
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					
					thumbnail_level_description[global.select_level_index] = string(global.level_description);
					
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
				if (level_editor_edit_name == false)
				{
					can_navigate = false;
					menu_delay = 9999;
					if (instance_exists(obj_camera))
					{
						obj_camera.iris_zoom = 0;
					}
				}
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_input_level_name = false;
			}
		}
		#endregion /* Press Enter to make new description END */
		
		#region /* Press Escape to back out from level from scratch menu */
		if (keyboard_check_pressed(vk_enter))
		&& (menu == "level_editor_enter_description_cancel")
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (keyboard_check_pressed(vk_escape))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, draw_description_input_screen_y + 54 + 42, get_window_width * 0.5 - 185 + 370, draw_description_input_screen_y + 54 + 42 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (mouse_check_button_released(mb_right))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back]))
		&& (can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
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
	if (ds_list_size(global.all_loaded_custom_levels) - 1 >= 120)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 32 * 2, l10n_text("There are too many levels stored"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 32 * 3, l10n_text("Delete some levels"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 32 * 2, l10n_text("There are too many levels stored"), global.default_text_size, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 32 * 3, l10n_text("Delete some levels"), global.default_text_size, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
	}
	
	/* Display the total custom level folder size in MB */
	if (custom_levels_folder_megabytes > 1)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, 32, "Custom level folder size: " + string(custom_levels_folder_megabytes) + " MB", global.default_text_size, c_menu_outline, c_menu_fill, 1);
	}
	
	#endregion /* Draw above everything else END */
	
}