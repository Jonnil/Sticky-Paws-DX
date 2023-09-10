function scr_draw_menu_search_id(what_kind_of_id = "level")
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var id_max_length = 9;
	var downloaded_file_name = "";
	var content_type_add_s = string(what_kind_of_id) + "s";
	var delete_file_after_download = true; /* Should be set to true when creating executable */
	
	#region /* Search ID menu */
	if (menu == "search_id_ok")
	|| (menu == "search_id_cancel")
	|| (menu == "search_online_list")
	{
		
		#region /* Set name input screen to always be above the virtual keyboard */
		if (keyboard_virtual_status())
		&& (keyboard_virtual_height() != 0)
		{
			var draw_name_input_screen_y = display_get_gui_height() - keyboard_virtual_height() - 160;
		}
		else
		{
			var draw_name_input_screen_y = display_get_gui_height() * 0.5;
		}
		#endregion /* Set name input screen to always be above the virtual keyboard END */
		
		if (in_online_download_list_menu == false)
		&& (automatically_search_for_id == false)
		{
			search_id = scr_draw_name_input_screen(search_id, id_max_length, c_black, 1, false, display_get_gui_width() * 0.5, draw_name_input_screen_y, "search_id_ok", "search_id_cancel", true, false, true);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_name_input_screen_y - 64, l10n_text("Please enter a") + " " + l10n_text(string(what_kind_of_id)) + " " + l10n_text("ID"), global.default_text_size * 2, c_black, c_white, 1)
		}
		else
		{
			
			#region /* Opaque transparent black rectangle over whole screen, but underneath text */
			draw_set_alpha(0.9);
			draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
			
		}
		
		#region /* Online List */
		if (in_online_download_list_menu == false)
		&& (automatically_search_for_id == false)
		{
			var draw_online_level_list_y = draw_name_input_screen_y + 42 + 42 + 42 + 42;
			if (what_kind_of_id == "level")
			&& (global.free_communication_available)
			{
				draw_menu_button(display_get_gui_width() * 0.5 - 185, draw_online_level_list_y, l10n_text("Online Level List"), "search_online_list", "search_online_list");
			}
			else
			if (what_kind_of_id == "character")
			&& (global.free_communication_available)
			{
				draw_menu_button(display_get_gui_width() * 0.5 - 185, draw_online_level_list_y, l10n_text("Online Character List"), "search_online_list", "search_online_list");
			}
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, draw_online_level_list_y + 2, display_get_gui_width() * 0.5 - 185 + 370, draw_online_level_list_y + 41))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (menu == "search_online_list")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.free_communication_available)
				{
					if (global.online_enabled)
					{
						/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
						select_custom_level_menu_open = false;
						selected_online_download_index = 1;
						menu = "online_download_list_load";
						menu_delay = 3;
					}
					else
					{
						caution_online_takes_you_to = "online_download_list_load";
						caution_online_takes_you_back_to = "search_online_list";
						menu = "caution_online_proceed";
						menu_delay = 3;
					}
				}
			}
			
			#region /* Online List Button Navigation */
			if (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (menu == "search_id_ok")
				{
					if (keyboard_check_pressed(vk_up))
					|| (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
					|| (gamepad_axis_value(global.player_slot[1], gp_axislv) < 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_online_list";
					}
					else
					if (keyboard_check_pressed(vk_down))
					|| (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
					|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_id_cancel";
					}
				}
				else
				if (menu == "search_id_cancel")
				{
					if (keyboard_check_pressed(vk_up))
					|| (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
					|| (gamepad_axis_value(global.player_slot[1], gp_axislv) < 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_id_ok";
					}
					else
					if (keyboard_check_pressed(vk_down))
					|| (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
					|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_online_list";
					}
				}
				else
				if (menu == "search_online_list")
				{
					if (keyboard_check_pressed(vk_up))
					|| (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
					|| (gamepad_axis_value(global.player_slot[1], gp_axislv) < 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_id_cancel";
					}
					else
					if (keyboard_check_pressed(vk_down))
					|| (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
					|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_id_ok";
					}
				}
			}
			#endregion /* Online List Button Navigation END */
			
		}
		#endregion /* Online List END */
		
		#region /* Press Escape to back out from Search ID menu */
		if (keyboard_check_pressed(vk_enter))
		&& (menu == "search_id_cancel")
		|| (keyboard_check_pressed(vk_escape))
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, draw_name_input_screen_y + 54 + 42, display_get_gui_width() * 0.5 - 185 + 370, draw_name_input_screen_y + 54 + 42 + 42))
		&& (mouse_check_button_released(mb_left))
		|| (mouse_check_button_released(mb_right))
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back]))
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.back]))
		
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
		&& (menu == "search_id_cancel")
		|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
		&& (menu == "search_id_cancel")
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
		&& (menu == "search_id_cancel")
		|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept]))
		&& (menu == "search_id_cancel")
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
		&& (menu == "search_id_cancel")
		|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept]))
		&& (menu == "search_id_cancel")
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
		&& (menu == "search_id_cancel")
		|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept]))
		&& (menu == "search_id_cancel")
		{
			show_level_editor_corner_menu = true;
			search_for_id_still = false;
			search_id = "";
			if (what_kind_of_id == "level")
			{
				select_custom_level_menu_open = true;
			}
			menu = "search_" + string(what_kind_of_id) + "_id";
			menu_delay = 3;
		}
		#endregion /* Press Escape to back out from Search ID menu END */
		
		#region /* If game is retrieving a level ID over id_max_length, then show download failed and why */
		if (automatically_search_for_id)
		&& (search_for_id_still)
		{
			if (string_length(search_id) < id_max_length)
			|| (string_length(search_id) > id_max_length)
			{
				menu = "searched_file_downloaded_failed";
				menu_delay = 3;
			}
		}
		#endregion /* If game is retrieving a level ID over id_max_length, then show download failed and why */
		
		#region /* Press Enter to search for the inputted ID */
		if (menu_delay == 0 && menu_joystick_delay == 0)
		&& (keyboard_string != "")
		&& (string_length(search_id) == id_max_length)
		&& (search_id != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			&& (menu == "search_id_ok")
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, draw_name_input_screen_y + 54, display_get_gui_width() * 0.5 - 185 + 370, draw_name_input_screen_y + 54 + 42))
			&& (mouse_check_button_released(mb_left))
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))
			|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.accept]))
			|| (automatically_search_for_id) /* If you enter this menu from "online level list menu", automatically enter the search ID and search for the level */
			{
				scr_switch_expand_save_data(); /* Expand the save data before download */
				if (global.save_data_size_is_sufficient)
				{
					search_for_id_still = true; /* Turn this on when you want to search for ID */
					
					/* Create DS Map to hold the HTTP Header info */
					map = ds_map_create();
					
					/* Add to the header DS Map */
					ds_map_add(map, "Host", global.base_url);
					ds_map_add(map, "Content-Type", "application/json");
					ds_map_add(map, "User-Agent", "gmdownloader");
					ds_map_add(map, "X-API-Key", global.api_key);
					
					/* Send the HTTP GET request to the /download endpoint */
					global.search_id = string_upper(search_id);
					global.http_request_id = http_request("https://" + global.base_url + global.download_endpoint + string(content_type_add_s) + "/" + global.search_id, "GET", map, "")
					ds_map_destroy(map);
					
					automatically_search_for_id = false;
					in_online_download_list_menu = false;
					global.online_download_list = ""; /* Reset "global online download list" so you can reload online download list next time you go to this menu */
					data = noone; /* Reset "data" so you can reload online level list next time you go to this menu */
					menu = "searching_for_id";
					menu_delay = 3;
				}
			}
		}
		#endregion /* Press Enter to search for the inputted ID END */
		
		if (!os_is_network_connected())
		{
			if (content_type == "character")
			{
				in_online_download_list_menu = false;
				menu = "no_internet_character";
			}
			else
			if (content_type == "level")
			{
				in_online_download_list_menu = false;
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				menu = "no_internet_level";
			}
		}
		
	}
	#endregion /* Search ID menu END */
	
	else
	
	#region /* Searching for ID menu */
	if (menu == "searching_for_id")
	{
		
		#region /* Download file */
		if (file_exists(working_directory + "downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip")) /* Find if a new .zip file has been downloaded */
		{
			scr_switch_expand_save_data(); /* Expand the save data before unzipping file */
			if (global.save_data_size_is_sufficient)
			{
				zip_unzip(working_directory + "downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip", working_directory + "downloaded_" + string(what_kind_of_id) + "/"); /* Unzip the downloaded file when the game finds it */
				/* Must delete downloaded .zip file first, before game can properly recognize the unzipped folder */
				file_delete(working_directory + "downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"); /* When the downloaded zip file is unzipped, immediately delete the zip file that is left */
				var downloaded_file_name = string(file_find_first(working_directory + "downloaded_" + string(what_kind_of_id) + "/*", fa_directory)); /* After deleting the zip file left after unzipping, get the name of the directory that is left in the download folder */
				
				/* Copy the downloaded file lastly */
				scr_copy_move_files(working_directory + "downloaded_" + string(what_kind_of_id) + "/" + string(downloaded_file_name), working_directory + "custom_" + string(what_kind_of_id) + "s/" + string(downloaded_file_name), true);
				
				#region /* Get downloaded level info */
				if (what_kind_of_id == "level")
				{
					global.level_name = downloaded_file_name;
					
					if (switch_check_profanity(downloaded_file_name))
					{
						masked_level_name = string(switch_mask_profanity(downloaded_file_name));
					}
					else
					{
						masked_level_name = string(downloaded_file_name);
					}
					
					global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, string(global.level_name)); /* "Select level index" should be set to where the downloaded custom level is saved */
					scr_delete_sprite_properly(downloaded_thumbnail_sprite);
					downloaded_thumbnail_sprite = noone;
					if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/thumbnail.png"))
					{
						downloaded_thumbnail_sprite = sprite_add(working_directory + "custom_levels/" + string(global.level_name) + "/thumbnail.png", 0, false, false, 0, 0);
					}
					else
					if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png"))
					{
						downloaded_thumbnail_sprite = sprite_add(working_directory + "custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png", 0, false, false, 0, 0);
					}
					sprite_set_offset(downloaded_thumbnail_sprite, sprite_get_width(downloaded_thumbnail_sprite) * 0.5, 0);
					if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
					{
						ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						global.level_description = ini_read_string("info", "level_description", "");
						masked_username = ini_read_string("info", "username", "");
						ini_close();
						if (switch_check_profanity(global.level_description))
						{
							global.level_description = string(switch_mask_profanity(global.level_description));
						}
						if (switch_check_profanity(masked_username))
						{
							masked_username = string(switch_mask_profanity(masked_username));
						}
					}
					with(instance_create_depth(room_width * 0.5, room_height * 0.5, obj_title.depth - 100, obj_score_up))
					{
						/* Tell the player briefly that the thing has finished downloading */
						above_gui = true;
						score_up = l10n_text(string(what_kind_of_id)) + " " + l10n_text("downloaded");
					}
					menu = "searched_file_downloaded_play"; /* Go to the screen where you see the file has been downloaded */
				}
				#endregion /* Get downloaded level info END */
				
				else
				
				#region /* Get downloaded character info */
				if (what_kind_of_id == "character")
				{
					downloaded_character_name = string(downloaded_file_name);
					
					if (switch_check_profanity(downloaded_file_name))
					{
						masked_character_name = string(switch_mask_profanity(downloaded_file_name));
					}
					else
					{
						masked_character_name = string(downloaded_file_name);
					}
					
					scr_delete_sprite_properly(downloaded_thumbnail_sprite);
					downloaded_thumbnail_sprite = noone;
					
					downloaded_thumbnail_sprite = scr_initialize_custom_character_select_sprite("stand", downloaded_thumbnail_sprite, 0, 0, string(downloaded_character_name));
					downloaded_thumbnail_sprite = scr_initialize_custom_character_select_sprite("character_select_portrait", downloaded_thumbnail_sprite, 0, 0, string(downloaded_character_name));
					
					if (file_exists(working_directory + "custom_characters/" + string(downloaded_character_name) + "/data/character_config.ini"))
					{
						ini_open(working_directory + "custom_characters/" + string(downloaded_character_name) + "/data/character_config.ini");
						global.level_description = ini_read_string("info", "character_description", "");
						masked_username = ini_read_string("info", "username", "");
						ini_close();
						if (switch_check_profanity(global.level_description))
						{
							global.level_description = string(switch_mask_profanity(global.level_description));
						}
						if (switch_check_profanity(masked_username))
						{
							masked_username = string(switch_mask_profanity(masked_username));
						}
					}
					with(instance_create_depth(room_width * 0.5, room_height * 0.5, obj_title.depth - 100, obj_score_up))
					{
						/* Tell the player briefly that the thing has finished downloading */
						above_gui = true;
						score_up = l10n_text(string(what_kind_of_id)) + " " + l10n_text("downloaded");
					}
					menu = "searched_file_downloaded_back_to_list"; /* Go to the screen where you see the file has been downloaded */
				}
				#endregion /* Get downloaded character info END */
				
				menu_delay = 3;
			}
		}
		#endregion /* Download file END */
		
		#region /* Draw text explaining to the player that the file is downloading, and a loading icon that is spinning */
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath name input screen */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath name input screen END */
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Downloading" + " " + l10n_text(string(what_kind_of_id)) + "..."), global.default_text_size * 2, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64, string(global.search_id), global.default_text_size, c_black, c_white, 1);
		
		/* If we could show the player the growing http buffer, that would be great feedback that the files are downloading */
		/* var growing_http_buffer = buffer_get_size(global.http_request_id) */
		/* scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 128, "Growing http buffer to: " + string(growing_http_buffer), global.default_text_size, c_black, c_white, 1) */
		
		#region /* Draw loading icon when waiting for download */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		global.loading_spinning_angle -= 10;
		draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64 + 64, 1, 1, global.loading_spinning_angle, c_white, 1);
		#endregion /* Draw loading icon when waiting for download END */
		
		#endregion /* Draw text explaining to the player that the file is downloading, and a loading icon that is spinning END */
		
		#region /* You can always cancel searching if game can't find file on server */
		var cancel_button_y = display_get_gui_height() * 0.5 + 100 + 64;
		draw_menu_button(display_get_gui_width() * 0.5 - 185, cancel_button_y, l10n_text("Cancel"), "searching_for_id", "searching_for_id");
		draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, cancel_button_y + 20, 1, 1, 0, c_white, 1);
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, cancel_button_y, display_get_gui_width() * 0.5 + 185, cancel_button_y + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "searching_for_id")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "searching_for_id_back";
		}
		#endregion /* You can always cancel searching if game can't find file on server END */
		
		if (!os_is_network_connected())
		{
			if (content_type == "character")
			{
				in_online_download_list_menu = false;
				menu = "no_internet_character";
			}
			else
			if (content_type == "level")
			{
				in_online_download_list_menu = false;
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				menu = "no_internet_level";
			}
		}
		
	}
	#endregion /* Searching for ID menu END */
	
	else
	
	#region /* Searched file downloaded menu */
	if (menu == "searched_file_downloaded_play")
	|| (menu == "searched_file_downloaded_make")
	|| (menu == "searched_file_downloaded_delete")
	|| (menu == "searched_file_downloaded_back_to_list")
	|| (menu == "searched_file_downloaded_back")
	|| (menu == "searched_file_downloaded_report")
	|| (menu == "searched_file_downloaded_i_understand")
	{
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		var draw_name_y = + 32;
		
		#region /* If level existed and is downloaded, show this menu */
		if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		|| (file_exists(working_directory + "custom_characters/" + string(downloaded_character_name) + "/data/character_config.ini"))
		{
			
			if (what_kind_of_id == "level")
			{
				/* Show level name, level thumbnail, and level description */
				
				draw_set_halign(fa_center);
				/* Draw Level Name */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_name_y, string(masked_level_name), global.default_text_size * 1.9, c_black, c_white, 1);
				
				#region /* Draw Level Thumbnail */
				if (display_get_gui_height() <= 720)
				{
					if (downloaded_thumbnail_sprite > 0)
					{
						draw_sprite_ext(downloaded_thumbnail_sprite, 0, display_get_gui_width() * 0.5, 64, 384 / sprite_get_width(downloaded_thumbnail_sprite) * 1.1, 216 / sprite_get_height(downloaded_thumbnail_sprite) * 1.1, 0, c_white, 1);
						var draw_description_y = 330;
					}
					else
					{
						draw_sprite_ext(spr_thumbnail_missing, 0, display_get_gui_width() * 0.5 - 192, display_get_gui_height() * 0.5 - 108, 1, 1, 0, c_white, 1);
						var draw_description_y = display_get_gui_height() * 0.5 - 22;
					}
				}
				else
				{
					if (downloaded_thumbnail_sprite > 0)
					{
						draw_sprite_ext(downloaded_thumbnail_sprite, 0, display_get_gui_width() * 0.5, 64, 384 / sprite_get_width(downloaded_thumbnail_sprite) * 2, 216 / sprite_get_height(downloaded_thumbnail_sprite) * 2, 0, c_white, 1);
						var draw_description_y = 522;
					}
					else
					{
						draw_sprite_ext(spr_thumbnail_missing, 0, display_get_gui_width() * 0.5 - 192, display_get_gui_height() * 0.5 - 108, 1, 1, 0, c_white, 1);
						var draw_description_y = display_get_gui_height() * 0.5 - 22;
					}
				}
				#endregion /* Draw Level Thumbnail END */
				
			}
			else
			if (what_kind_of_id == "character")
			{
				
				#region /* Draw Character Thumbnail */
				if (downloaded_thumbnail_sprite > 0)
				{
					var scale_offset = 1;
					draw_sprite_ext(downloaded_thumbnail_sprite, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 100, (392 / sprite_get_width(downloaded_thumbnail_sprite)) * scale_offset, (392 / sprite_get_width(downloaded_thumbnail_sprite)) * scale_offset, 0, c_white, 1);
					var draw_description_y = display_get_gui_height() * 0.5 + 132;
				}
				else
				{
					draw_sprite_ext(spr_thumbnail_missing, 0, display_get_gui_width() * 0.5 - 192, display_get_gui_height() * 0.5 - 108, 1, 1, 0, c_white, 1);
					var draw_description_y = display_get_gui_height() * 0.5 - 22;
				}
				#endregion /* Draw Character Thumbnail END */
				
				draw_set_halign(fa_center);
				/* Draw Character Name on top of Character Thumbnail */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_name_y, string(downloaded_character_name), global.default_text_size * 1.9, c_black, c_white, 1);
				
			}
			
			#region /* Draw who made the level */
			if (masked_username != "")
			{
				draw_set_halign(fa_right);
				scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("By") + ": " + string(masked_username), global.default_text_size, c_black, c_white, 1);
			}
			#endregion /* Draw who made the level END */
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			search_for_id_still = false;
			
			var searched_file_play_y = display_get_gui_height() - (42 * 6);
			var searched_file_make_y = display_get_gui_height() - (42 * 5);
			var searched_file_downloaded_delete_y = display_get_gui_height() - (42 * 4);
			var back_to_list_y = display_get_gui_height() - (42 * 3);
			var searched_file_downloaded_back_y = display_get_gui_height() - (42 * 2);
			
			if (what_kind_of_id == "level")
			{
				/* Level is downloaded, so you get a choice if you want to play, make, or go back to custom level select*/
				if (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				&& (inform_about_report_feature == false)
				{
					draw_menu_button(display_get_gui_width() * 0.5 - 185, searched_file_play_y, l10n_text("Play"), "searched_file_downloaded_play", "searched_file_downloaded_play");
					draw_menu_button(display_get_gui_width() * 0.5 - 185, searched_file_make_y, l10n_text("Make"), "searched_file_downloaded_make", "searched_file_downloaded_make");
				}
				var draw_description_y = display_get_gui_height() - (42 * 8);
				var draw_id_y = display_get_gui_height() - (42 * 7);
				var back_to_list_text = l10n_text("Back to online level list");
				var searched_file_downloaded_back_text = l10n_text("Back to custom level select");
			}
			else
			if (inform_about_report_feature == false)
			{
				var draw_description_y = display_get_gui_height() - (42 * 6);
				var draw_id_y = display_get_gui_height() - (42 * 5);
				var back_to_list_text = l10n_text("Back to online character list");
				var searched_file_downloaded_back_text = l10n_text("Back to character select");
			}
			
			draw_set_halign(fa_center);
			/* Draw Description */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_description_y, string(global.level_description), global.default_text_size * 1.25, c_black, c_white, 1);
			/* Draw ID */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_id_y, l10n_text(string(what_kind_of_id)) + " " + l10n_text("ID") + ": " + string(search_id), global.default_text_size * 1.25, c_black, c_white, 1);
			
			if (inform_about_report_feature == false)
			{
				draw_menu_button(display_get_gui_width() * 0.5 - 185, searched_file_downloaded_delete_y, l10n_text("Delete"), "searched_file_downloaded_delete", "searched_file_downloaded_delete", c_red);
				draw_sprite_ext(spr_icons_delete, 0, display_get_gui_width() * 0.5 - 185 + 16, searched_file_downloaded_delete_y + 20, 1, 1, 0, c_white, 1);
				draw_menu_button(display_get_gui_width() * 0.5 - 185, back_to_list_y, back_to_list_text, "searched_file_downloaded_back_to_list", "searched_file_downloaded_back_to_list");
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, back_to_list_y + 20, 1, 1, 0, c_white, 1);
				draw_menu_button(display_get_gui_width() * 0.5 - 185, searched_file_downloaded_back_y, searched_file_downloaded_back_text, "searched_file_downloaded_back", "searched_file_downloaded_back");
				draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, searched_file_downloaded_back_y + 20, 1, 1, 0, c_white, 1);
			}
			
			#region /* Inform about report feature. Needs to be above all other buttons */
			if (inform_about_report_feature)
			{
				inform_about_report_feature_alpha = lerp(inform_about_report_feature_alpha, 1, 0.05);
				
				/* Darken background behind report button even more when giving information about the report button */
				draw_set_alpha(inform_about_report_feature_alpha * 0.9);
				draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(inform_about_report_feature_alpha * 1);
				
				draw_sprite_ext(spr_arrow_swirly, menu_cursor_index, 164, display_get_gui_height() - 132 + scr_wave(0, 16, 1), 1, 1, 0, c_white, inform_about_report_feature_alpha);
				draw_set_halign(fa_left);
				scr_draw_text_outlined(264, display_get_gui_height() - 196, l10n_text("If you see any inappropriate content when downloading user-generated content online"), global.default_text_size, c_black, c_white, inform_about_report_feature_alpha);
				scr_draw_text_outlined(264, display_get_gui_height() - 164, l10n_text("Please report it by clicking this button"), global.default_text_size, c_black, c_white, inform_about_report_feature_alpha);
				draw_set_halign(fa_center);
				draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() - 64, l10n_text("I understand"), "searched_file_downloaded_i_understand", "searched_file_downloaded_i_understand", c_lime, inform_about_report_feature_alpha);
				menu = "searched_file_downloaded_i_understand";
				
				if (menu_delay == 0 && menu_joystick_delay == 0)
				&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, display_get_gui_height() - 64, display_get_gui_width() * 0.5 + 185, display_get_gui_height() - 64 + 41))
				&& (menu == "searched_file_downloaded_i_understand")
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				|| (menu_delay == 0 && menu_joystick_delay == 0)
				&& (menu == "searched_file_downloaded_i_understand")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					ini_open(working_directory + "config.ini");
					ini_write_real("config", "inform_about_report_feature", false);
					ini_close();switch_save_data_commit();
					inform_about_report_feature = false;
					if (what_kind_of_id == "level")
					{
						menu = "searched_file_downloaded_play"; /* Go to the screen where you see the file has been downloaded */
					}
					else
					{
						menu = "searched_file_downloaded_back_to_list"; /* Go to the screen where you see the file has been downloaded */
					}
				}
				draw_set_alpha(1);
			}
			#endregion /* Inform about report feature. Needs to be above all other buttons END */
			
			/* Report Button in bottom left corner */
			draw_menu_button(0, display_get_gui_height() - 42, l10n_text("Report"), "searched_file_downloaded_report", "searched_file_downloaded_report");
			draw_sprite_ext(spr_icons_report, 0, 16, display_get_gui_height() - 42 + 20, 1, 1, 0, c_white, 1);
			
			#region /* Play, Make, Delete, Back Navigation */
			
			#region /* Click Play */
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (what_kind_of_id == "level")
			&& (inform_about_report_feature == false)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, searched_file_play_y, display_get_gui_width() * 0.5 + 185, searched_file_play_y + 41))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				|| (menu == "searched_file_downloaded_play")
				&& (key_a_pressed)
				{
					/* Play the downloaded level */
					global.doing_clear_check = false;
					global.actually_play_edited_level = true; /* Even before going to the level, set this variable to true */
					global.play_edited_level = true;
					can_navigate = false;
					menu_delay = 9999;
				}
			}
			#endregion /* Click Play END */
			
			#region /* Click Make */
			if (menu_delay == 0 && menu_joystick_delay == 0)
			&& (what_kind_of_id == "level")
			&& (inform_about_report_feature == false)
			{
				if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, searched_file_make_y, display_get_gui_width() * 0.5 + 185, searched_file_make_y + 41))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				|| (menu == "searched_file_downloaded_make")
				&& (key_a_pressed)
				{
					/* Edit the downloaded level */
					global.doing_clear_check = false;
					global.actually_play_edited_level = false;
					global.play_edited_level = false;
					can_navigate = false;
					menu_delay = 9999;
				}
			}
			#endregion /* Click Make END */
			
			#region /* Click Delete */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, searched_file_downloaded_delete_y, display_get_gui_width() * 0.5 + 185, searched_file_downloaded_delete_y + 41))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			|| (menu == "searched_file_downloaded_delete")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			{
				if (what_kind_of_id == "level")
				&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					if (delete_file_after_download)
					{
						directory_destroy(working_directory + "custom_levels/" + string(global.level_name));
					}
					ini_open(working_directory + "save_files/custom_level_save.ini");
					ini_section_delete(string(global.level_name));
					ini_close();
					global.select_level_index = 0;
					global.level_name = "";
				}
				else
				if (what_kind_of_id == "character")
				&& (file_exists(working_directory + "custom_characters/" + string(downloaded_character_name) + "/data/character_config.ini"))
				{
					directory_destroy(working_directory + "custom_characters/" + string(downloaded_character_name));
					
					#region /* After deleting character, go to previous character, so you don't accidentally go to a undefined character */
					global.character_index[0] = clamp(global.character_index[0] - 1, 0, ds_list_size(global.all_loaded_characters) - 1);
					global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0])
					xx_delay[1] = -1;
					
					/* Update the player sprite */
					global.sprite_select_player[1] = spr_noone;
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					#endregion /* After deleting character, go to previous character, so you don't accidentally go to a undefined character END */
					
				}
				menu = "searched_file_downloaded_deleted_back_to_list";
				menu_delay = 3;
			}
			#endregion /* Click Delete END */
			
			#region /* Click back to online level list */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, back_to_list_y, display_get_gui_width() * 0.5 + 185, back_to_list_y + 41))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			|| (menu == "searched_file_downloaded_back_to_list")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			{
				select_custom_level_menu_open = false;
				/* Don't set the "select level index" or "level name" here, because we want it saved still */
				menu = "online_download_list_load"; /* Go back to online level list */
				menu_delay = 3;
			}
			#endregion /* Click back to online level list END */
			
			#region /* Click back to custom level select */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, searched_file_downloaded_back_y, display_get_gui_width() * 0.5 + 185, searched_file_downloaded_back_y + 41))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			|| (menu == "searched_file_downloaded_back")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			{
				menu = "searching_for_id_back";
				menu_delay = 3;
			}
			#endregion /* Click back to custom level select END */
			
			#region /* Click Report */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 42, 370, display_get_gui_height()))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			|| (menu == "searched_file_downloaded_report")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (inform_about_report_feature == false)
			{
				report_back_to_menu = "searched_file_downloaded_report";
				menu = "report_next";
				menu_delay = 3;
			}
			#endregion /* Click Report END */
			
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (what_kind_of_id == "level")
			&& (inform_about_report_feature == false)
			{
				menu_delay = 3;
				if (menu == "searched_file_downloaded_play")
				{
					menu = "searched_file_downloaded_make";
				}
				else
				if (menu == "searched_file_downloaded_make")
				{
					menu = "searched_file_downloaded_delete";
				}
				else
				if (menu == "searched_file_downloaded_delete")
				{
					menu = "searched_file_downloaded_back_to_list";
				}
				else
				if (menu == "searched_file_downloaded_back_to_list")
				{
					menu = "searched_file_downloaded_back";
				}
				else
				if (menu == "searched_file_downloaded_back")
				{
					menu = "searched_file_downloaded_report";
				}
				else
				if (menu == "searched_file_downloaded_report")
				{
					menu = "searched_file_downloaded_play";
				}
			}
			else
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (what_kind_of_id == "level")
			&& (inform_about_report_feature == false)
			{
				menu_delay = 3;
				if (menu == "searched_file_downloaded_play")
				{
					menu = "searched_file_downloaded_report";
				}
				else
				if (menu == "searched_file_downloaded_make")
				{
					menu = "searched_file_downloaded_play";
				}
				else
				if (menu == "searched_file_downloaded_delete")
				{
					menu = "searched_file_downloaded_make";
				}
				else
				if (menu == "searched_file_downloaded_back_to_list")
				{
					menu = "searched_file_downloaded_delete";
				}
				else
				if (menu == "searched_file_downloaded_back")
				{
					menu = "searched_file_downloaded_back_to_list";
				}
				else
				if (menu == "searched_file_downloaded_report")
				{
					menu = "searched_file_downloaded_back";
				}
			}
			else
			if (key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (what_kind_of_id == "character")
			&& (inform_about_report_feature == false)
			{
				menu_delay = 3;
				if (menu == "searched_file_downloaded_delete")
				{
					menu = "searched_file_downloaded_back_to_list";
				}
				else
				if (menu == "searched_file_downloaded_back_to_list")
				{
					menu = "searched_file_downloaded_back";
				}
				else
				if (menu == "searched_file_downloaded_back")
				{
					menu = "searched_file_downloaded_report";
				}
				else
				if (menu == "searched_file_downloaded_report")
				{
					menu = "searched_file_downloaded_delete";
				}
			}
			else
			if (key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (what_kind_of_id == "character")
			&& (inform_about_report_feature == false)
			{
				menu_delay = 3;
				if (menu == "searched_file_downloaded_delete")
				{
					menu = "searched_file_downloaded_report";
				}
				else
				if (menu == "searched_file_downloaded_back_to_list")
				{
					menu = "searched_file_downloaded_delete";
				}
				else
				if (menu == "searched_file_downloaded_back")
				{
					menu = "searched_file_downloaded_back_to_list";
				}
				else
				if (menu == "searched_file_downloaded_report")
				{
					menu = "searched_file_downloaded_back";
				}
			}
			#endregion /* Play, Make, Delete, Back Navigation END */
			
		}
		#endregion /* If level existed and is downloaded, show this menu END */
		
		else
		
		#region /* Level was not uploaded correctly */
		{
			if (what_kind_of_id == "level")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 128, string(global.level_name), global.default_text_size, c_black, c_white, 1)
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 64, l10n_text("Level was not correctly uploaded"), global.default_text_size * 2, c_black, c_white, 1)
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Uploaded level was missing level_information.ini"), global.default_text_size, c_black, c_white, 1)
			}
			else
			if (what_kind_of_id == "character")
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 128, string(downloaded_character_name), global.default_text_size, c_black, c_white, 1)
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 64, l10n_text("Character was not correctly uploaded"), global.default_text_size * 2, c_black, c_white, 1)
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Uploaded character was missing character_config.ini"), global.default_text_size, c_black, c_white, 1)
			}
			
			draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 50, l10n_text("OK"), "searched_file_downloaded_play", "searched_file_downloaded_play");
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, display_get_gui_height() * 0.5 + 50 + 20, 1, 1, 0, c_white, 1);
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 50, display_get_gui_width() * 0.5 + 185, display_get_gui_height() * 0.5 + 50 + 41))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (menu == "searched_file_downloaded_play")
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "searching_for_id_back";
			}
		}
		#endregion /* Level was not uploaded correctly END */
		
		#region /* The level have been successfully downloaded, so delete temporary folders and zip files now */
		if (delete_file_after_download)
		{
			file_delete(working_directory + "downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"); /* Destroy the unzipped file first */
			directory_destroy(working_directory + "downloaded_" + string(what_kind_of_id)); /* Destroy the now empty directory, it's only temporary */
		}
		#endregion /* The level have been successfully downloaded, so delete temporary folders and zip files now END */
		
	}
	#endregion /* Searched file downloaded menu END */
	
	else
	
	#region /* Deleted file */
	if (menu == "searched_file_downloaded_deleted_download_again")
	|| (menu == "searched_file_downloaded_deleted_back_to_list")
	|| (menu == "searched_file_downloaded_deleted")
	{
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		var deleted_download_again_y = display_get_gui_height() * 0.5;
		var deleted_back_to_list_y = deleted_download_again_y + 42;
		var deleted_back_to_level_select_y = deleted_back_to_list_y + 42;
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (what_kind_of_id == "level")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("Deleted") + " " + string(masked_level_name), global.default_text_size * 2, c_black, c_white, 1);
			draw_menu_button(display_get_gui_width() * 0.5 - 185, deleted_back_to_list_y + 50, l10n_text("Back to online level list"), "searched_file_downloaded_deleted_back_to_list", "searched_file_downloaded_deleted_back_to_list");
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, deleted_back_to_list_y + 50 + 20, 1, 1, 0, c_white, 1);
			draw_menu_button(display_get_gui_width() * 0.5 - 185, deleted_back_to_level_select_y + 50, l10n_text("Back to custom level select"), "searched_file_downloaded_deleted", "searched_file_downloaded_deleted");
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, deleted_back_to_level_select_y + 50 + 20, 1, 1, 0, c_white, 1);
		}
		else
		if (what_kind_of_id == "character")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("Deleted") + " " + string(masked_character_name), global.default_text_size * 2, c_black, c_white, 1);
			draw_menu_button(display_get_gui_width() * 0.5 - 185, deleted_back_to_list_y + 50, l10n_text("Back to online character list"), "searched_file_downloaded_deleted_back_to_list", "searched_file_downloaded_deleted_back_to_list");
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, deleted_back_to_list_y + 50 + 20, 1, 1, 0, c_white, 1);
			draw_menu_button(display_get_gui_width() * 0.5 - 185, deleted_back_to_level_select_y + 50, l10n_text("Back to character select"), "searched_file_downloaded_deleted", "searched_file_downloaded_deleted");
			draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, deleted_back_to_level_select_y + 50 + 20, 1, 1, 0, c_white, 1);
		}
		draw_menu_button(display_get_gui_width() * 0.5 - 185, deleted_download_again_y + 50, l10n_text("Oops... Download Again"), "searched_file_downloaded_deleted_download_again", "searched_file_downloaded_deleted_download_again");
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, deleted_back_to_list_y + 50, display_get_gui_width() * 0.5 + 185, deleted_back_to_list_y + 50 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "searched_file_downloaded_deleted_back_to_list")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, deleted_back_to_level_select_y + 50, display_get_gui_width() * 0.5 + 185, deleted_back_to_level_select_y + 50 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "searched_file_downloaded_deleted")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			
			#region /* If any "character index" is set to undefined, reset it to 0 */
			if (ds_list_find_value(global.all_loaded_characters, global.character_index[0]) == undefined)
			{
				global.character_index[0] = 0;
			}
			if (ds_list_find_value(global.all_loaded_characters, global.character_index[1]) == undefined)
			{
				global.character_index[1] = 0;
			}
			if (ds_list_find_value(global.all_loaded_characters, global.character_index[2]) == undefined)
			{
				global.character_index[2] = 0;
			}
			if (ds_list_find_value(global.all_loaded_characters, global.character_index[3]) == undefined)
			{
				global.character_index[3] = 0;
			}
			#endregion /* If any "character index" is set to undefined, reset it to 0 END */
			
		}
		
		#region /* Click download again */
		if (menu == "searched_file_downloaded_deleted_download_again")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, deleted_download_again_y + 50, display_get_gui_width() * 0.5 + 185, deleted_download_again_y + 50 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "searched_file_downloaded_deleted_download_again")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			/* Begin downloading again */
			automatically_search_for_id = true;
			keyboard_string = search_id;
			menu = "search_id_ok"; /* Go back to online level list */
			menu_delay = 3;
		}
		#endregion /* Click download again END */
		
		#region /* Click back to online list */
		if (menu == "searched_file_downloaded_deleted_back_to_list")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, deleted_back_to_list_y + 50, display_get_gui_width() * 0.5 + 185, deleted_back_to_list_y + 50 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "searched_file_downloaded_deleted_back_to_list")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			select_custom_level_menu_open = false;
			/* Don't set the "select level index" or "level name" here, because we want it saved still */
			menu = "online_download_list_load"; /* Go back to online level list */
			menu_delay = 3;
		}
		#endregion /* Click back to online list END */
		
		#region /* Click back to custom level select */
		if (menu == "searched_file_downloaded_deleted")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, deleted_back_to_level_select_y + 50, display_get_gui_width() * 0.5 + 185, deleted_back_to_level_select_y + 50 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "searched_file_downloaded_deleted")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			global.select_level_index = 0;
			global.level_name = "";
			menu = "searching_for_id_back";
			menu_delay = 3;
		}
		#endregion /* Click back to custom level select END */
		
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "searched_file_downloaded_deleted_download_again")
			{
				menu = "searched_file_downloaded_deleted_back_to_list";
			}
			else
			if (menu == "searched_file_downloaded_deleted_back_to_list")
			{
				menu = "searched_file_downloaded_deleted";
			}
			else
			if (menu == "searched_file_downloaded_deleted")
			{
				menu = "searched_file_downloaded_deleted_download_again";
			}
			menu_delay = 3;
		}
		else
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "searched_file_downloaded_deleted_download_again")
			{
				menu = "searched_file_downloaded_deleted";
			}
			else
			if (menu == "searched_file_downloaded_deleted_back_to_list")
			{
				menu = "searched_file_downloaded_deleted_download_again";
			}
			else
			if (menu == "searched_file_downloaded_deleted")
			{
				menu = "searched_file_downloaded_deleted_back_to_list";
			}
			menu_delay = 3;
		}
		
	}
	#endregion /* Deleted file END */
	
	else
	
	#region /* Show Download Failed message */
	if (menu == "searched_file_downloaded_failed")
	{
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		var downloaded_message_y = display_get_gui_height() * 0.5;
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("Failed to download") + " " + l10n_text(string(what_kind_of_id)), global.default_text_size * 2, c_black, c_white, 1)
		if (string_length(search_id) > id_max_length)
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 22, l10n_text("Retrieved ID with more than max character length"), global.default_text_size, c_black, c_white, 1)
		}
		else
		if (string_length(search_id) < id_max_length)
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 22, l10n_text("Retrieved ID with less than max character length"), global.default_text_size, c_black, c_white, 1)
		}
		draw_menu_button(display_get_gui_width() * 0.5 - 185, downloaded_message_y + 50, l10n_text("OK"), "searched_file_downloaded_failed", "searched_file_downloaded_failed");
		draw_sprite_ext(spr_icons_back, 0, display_get_gui_width() * 0.5 - 185 + 16, downloaded_message_y + 50 + 20, 1, 1, 0, c_white, 1);
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, downloaded_message_y + 50, display_get_gui_width() * 0.5 + 185, downloaded_message_y + 50 + 41))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "searched_file_downloaded_failed")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			file_delete(working_directory + "downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"); /* Destroy any leftover files in temporary folder */
			directory_destroy(working_directory + "downloaded_" + string(what_kind_of_id)); /* Destroy the now empty directory, it's only temporary */
			menu = "searching_for_id_back";
		}
	}
	#endregion /* Show Download Failed message END */
	
	else
	
	if (menu == "searching_for_id_back")
	{
		search_for_id_still = false;
		search_id = ""; /* Always set this to empty string when going back to previous menu */
		menu_delay = 3;
		if (what_kind_of_id == "level")
		{
			/* Go back to select custom level menu */
			can_navigate = false;
			select_custom_level_menu_open = true;
			show_level_editor_corner_menu = true;
			scr_load_custom_level_initializing();
			menu = "load_custom_level";
		}
		else
		if (what_kind_of_id == "character")
		{
			player_menu[1] = "load_downloaded_character";
			select_custom_level_menu_open = false;
			scr_load_character_initializing();
			player1_automatically_join = true;
			menu = "load_characters";
			menu_delay = 3;
			menu_specific_joystick_delay[1] = 30;
		}
	}
}