function scr_draw_menu_search_id(what_kind_of_id = "level")
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var id_max_length = 9;
	var downloaded_file_name = "";
	var content_type = string(what_kind_of_id) + "s"
	
	#region /* Search ID menu */
	if (menu == "search_id_ok")
	or (menu == "search_id_cancel")
	or (menu == "search_online_list")
	{
		
		#region /* Set name input screen to always be above the virtual keyboard */
		if (keyboard_virtual_status())
		and (keyboard_virtual_height() != 0)
		{
			var draw_name_input_screen_y = display_get_gui_height() - keyboard_virtual_height() - 160;
		}
		else
		{
			var draw_name_input_screen_y = display_get_gui_height() * 0.5;
		}
		#endregion /* Set name input screen to always be above the virtual keyboard END */
		
		if (in_online_download_list_menu == false)
		and (automatically_search_id == false)
		{
			search_id = scr_draw_name_input_screen(search_id, id_max_length, c_black, 1, false, display_get_gui_width() * 0.5, draw_name_input_screen_y, "search_id_ok", "search_id_cancel", true, false);
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
		and (automatically_search_id == false)
		{
			var draw_online_level_list_y = draw_name_input_screen_y + 42 + 42 + 42 + 42;
			if (what_kind_of_id == "level")
			{
				draw_menu_button(display_get_gui_width() * 0.5 - 185, draw_online_level_list_y, l10n_text("Online Level List"), "search_online_list", "search_online_list");
			}
			else
			if (what_kind_of_id == "character")
			{
				draw_menu_button(display_get_gui_width() * 0.5 - 185, draw_online_level_list_y, l10n_text("Online Character List"), "search_online_list", "search_online_list");
			}
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, draw_online_level_list_y + 2, display_get_gui_width() * 0.5 - 185 + 370, draw_online_level_list_y + 41))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (menu == "search_online_list")
			and (key_a_pressed)
			and (menu_delay == 0)
			{
				/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
				select_custom_level_menu_open = false;
				menu = "online_download_list_load";
			}
			
			#region /* Online List Button Navigation */
			if (menu_delay == 0)
			and (menu_joystick_delay <= 0)
			{
				if (menu == "search_id_ok")
				{
					if (keyboard_check_pressed(vk_up))
					or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
					or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_online_list";
					}
					else
					if (keyboard_check_pressed(vk_down))
					or (gamepad_button_check_pressed(global.player1_slot, gp_padd))
					or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
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
					or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
					or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_id_ok";
					}
					else
					if (keyboard_check_pressed(vk_down))
					or (gamepad_button_check_pressed(global.player1_slot, gp_padd))
					or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
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
					or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
					or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "search_id_cancel";
					}
					else
					if (keyboard_check_pressed(vk_down))
					or (gamepad_button_check_pressed(global.player1_slot, gp_padd))
					or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
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
		and (menu == "search_id_cancel")
		or (keyboard_check_pressed(vk_escape))
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		display_get_gui_width() * 0.5 - 185,
		draw_name_input_screen_y + 54 + 42,
		display_get_gui_width() * 0.5 - 185 + 370,
		draw_name_input_screen_y + 54 + 42 + 42))
		and (mouse_check_button_released(mb_left))
		or (mouse_check_button_released(mb_right))
		or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.back]))
		or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.back]))
		or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.back]))
		or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.back]))
		or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.back]))
		or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.back]))
		or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.back]))
		or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.back]))
		
		or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.accept]))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.accept]))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.accept]))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.accept]))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.accept]))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.accept]))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.accept]))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.accept]))
		and (menu == "search_id_cancel")
		{
			if (menu_delay == 0)
			{
				search_id = "";
				if (what_kind_of_id == "level")
				{
					select_custom_level_menu_open = true;
				}
				menu = "search_" + string(what_kind_of_id) + "_id";
				menu_delay = 3;
			}
		}
		#endregion /* Press Escape to back out from Search ID menu END */
		
		#region /* If game is retrieving a level ID over id_max_length, then show download failed and why */
		if (automatically_search_id == true)
		{
			if (string_length(search_id) < id_max_length)
			or (string_length(search_id) > id_max_length)
			{
				menu = "searched_file_downloaded_failed";
				menu_delay = 3;
			}
		}
		#endregion /* If game is retrieving a level ID over id_max_length, then show download failed and why */
		
		#region /* Press Enter to search for the inputted ID */
		if (menu_delay == 0)
		and (keyboard_string != "")
		and (string_length(search_id) == id_max_length)
		and (search_id != undefined)
		{
			if (keyboard_check_pressed(vk_enter))
			and (menu == "search_id_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			display_get_gui_width() * 0.5 - 185,
			draw_name_input_screen_y + 54,
			display_get_gui_width() * 0.5 - 185 + 370,
			draw_name_input_screen_y + 54 + 42))
			and (mouse_check_button_released(mb_left))
			or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][1][action.accept]))
			or (gamepad_button_check_pressed(global.player1_slot, global.player_[inp.gp][1][2][action.accept]))
			or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][1][action.accept]))
			or (gamepad_button_check_pressed(global.player2_slot, global.player_[inp.gp][2][2][action.accept]))
			or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][1][action.accept]))
			or (gamepad_button_check_pressed(global.player3_slot, global.player_[inp.gp][3][2][action.accept]))
			or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][1][action.accept]))
			or (gamepad_button_check_pressed(global.player4_slot, global.player_[inp.gp][4][2][action.accept]))
			or (automatically_search_id == true) /* If you enter this menu from "online level list menu", automatically enter the search ID and search for the level */
			{
				/* Create DS Map to hold the HTTP Header info */
				map = ds_map_create();
				
				/* Add to the header DS Map */
				ds_map_add(map, "Host", global.base_url);
				ds_map_add(map, "Content-Type", "application/json");
				ds_map_add(map, "User-Agent", "gmdownloader");
				
				/* Send the HTTP GET request to the /download endpoint */
				global.search_id = string_upper(search_id);
				global.http_request_id = http_request("http://" + global.base_url + global.download_endpoint + string(content_type) + "/" + global.search_id, "GET", map, "")
				ds_map_destroy(map);
				
				automatically_search_id = false;
				in_online_download_list_menu = false;
				global.online_download_list = ""; /* Reset "global online download list" so you can reload online download list next time you go to this menu */
				data = noone; /* Reset "data" so you can reload online level list next time you go to this menu */
				menu = "searching_for_id";
				menu_delay = 3;
			}
		}
		#endregion /* Press Enter to search for the inputted ID END */
		
	}
	#endregion /* Search ID menu END */
	
	else
	
	#region /* Searching for ID menu */
	if (menu == "searching_for_id")
	{
		
		#region /* Download file */
		if (file_exists(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip")) /* Find if a new .zip file has been downloaded */
		{
			zip_unzip(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip", working_directory + "/downloaded_" + string(what_kind_of_id) + "/"); /* Unzip the downloaded file when the game finds it */
			file_delete(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"); /* When the downloaded zip file is unzipped, immediately delete the zip file that is left */
			var downloaded_file_name = string(file_find_first(working_directory + "/downloaded_" + string(what_kind_of_id) + "/*", fa_directory)); /* After deleting the zip file left after unzipping, get the name of the directory that is left in the download folder */
			
			if (directory_exists(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string(downloaded_file_name)))
			{
				scr_copy_move_files(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string(downloaded_file_name), working_directory + "/custom_" + string(what_kind_of_id) + "s/" + string(downloaded_file_name), true);
			}
			
			#region /* Downloading level */
			if (what_kind_of_id == "level")
			{
				global.level_name = downloaded_file_name;
				global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, string(downloaded_file_name)); /* "Select level index" should be set to where the downloaded custom level is saved */
				scr_delete_sprite_properly(downloaded_thumbnail_sprite);
				if (file_exists(working_directory + "/custom_levels/" + string(downloaded_file_name) + "/thumbnail.png"))
				{
					downloaded_thumbnail_sprite = sprite_add(working_directory + "/custom_levels/" + string(downloaded_file_name) + "/thumbnail.png", 0, false, true, 0, 0);
					sprite_set_offset(downloaded_thumbnail_sprite, sprite_get_width(downloaded_thumbnail_sprite) * 0.5, 0);
				}
				else
				if (file_exists(working_directory + "/custom_levels/" + string(downloaded_file_name) + "/automatic_thumbnail.png"))
				{
					downloaded_thumbnail_sprite = sprite_add(working_directory + "/custom_levels/" + string(downloaded_file_name) + "/automatic_thumbnail.png", 0, false, true, 0, 0);
					sprite_set_offset(downloaded_thumbnail_sprite, sprite_get_width(downloaded_thumbnail_sprite) * 0.5, 0);
				}
				if (file_exists(working_directory + "/custom_levels/" + string(downloaded_file_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "/custom_levels/" + string(downloaded_file_name) + "/data/level_information.ini");
					{
						global.level_description = ini_read_string("info", "level_description", "");
					}
				}
				menu = "searched_file_downloaded_play"; /* Go to the screen where you see the file has been downloaded */
			}
			#endregion /* Downloading level END */
			
			else
			
			#region /* Downloading character */
			if (what_kind_of_id == "character")
			{
				downloaded_character_name = string(downloaded_file_name);
				scr_delete_sprite_properly(downloaded_thumbnail_sprite);
				downloaded_thumbnail_sprite = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player_1, 0, global.skin_for_player_1, string(downloaded_file_name));
				downloaded_thumbnail_sprite = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player_1, 0, global.skin_for_player_1, string(downloaded_file_name));
				downloaded_thumbnail_sprite = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player_1, 0, global.skin_for_player_1, string(downloaded_file_name));
				downloaded_thumbnail_sprite = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player_1, 0, global.skin_for_player_1, string(downloaded_file_name));
				if (file_exists(working_directory + "/custom_characters/" + string(downloaded_file_name) + "/data/character_config.ini"))
				{
					ini_open(working_directory + "/custom_characters/" + string(downloaded_file_name) + "/data/character_config.ini");
					{
						global.level_description = ini_read_string("info", "character_description", "");
					}
				}
				menu = "searched_file_downloaded_back"; /* Go to the screen where you see the file has been downloaded */
			}
			#endregion /* Downloading character END */
			
			ini_close();
			menu_delay = 3;
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
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Downloading" + " " + l10n_text(string(what_kind_of_id)) + "..."), global.default_text_size * 2, c_black, c_white, 1)
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64, string(global.search_id), global.default_text_size, c_black, c_white, 1)
		
		#region /* Draw loading icon when waiting for download */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		global.loading_spinning_angle -= 10;
		draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64 + 64, 1, 1, global.loading_spinning_angle, c_white, 1);
		#endregion /* Draw loading icon when waiting for download END */
		
		#endregion /* Draw text explaining to the player that the file is downloading, and a loading icon that is spinning END */
		
		#region /* You can always cancel searching if game can't find file on server */
		if (!directory_exists(working_directory + "custom_levels/*"))
		{
			var cancel_button_y = display_get_gui_height() * 0.5 + 100 + 64;
			draw_menu_button(display_get_gui_width() * 0.5 - 185, cancel_button_y, l10n_text("Cancel"), "searching_for_id", "searching_for_id");
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, cancel_button_y, display_get_gui_width() * 0.5 + 185, cancel_button_y + 41))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (menu == "searching_for_id")
			and (key_a_pressed)
			and (menu_delay == 0)
			{
				menu = "searching_for_id_back";
			}
		}
		#endregion /* You can always cancel searching if game can't find file on server END */
		
	}
	#endregion /* Searching for ID menu END */
	
	else
	
	#region /* Searched file downloaded menu */
	if (menu == "searched_file_downloaded_play")
	or (menu == "searched_file_downloaded_make")
	or (menu == "searched_file_downloaded_back")
	{
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath text */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
		
		var draw_name_y = + 32;
		
		#region /* If level existed and is downloaded, show this menu */
		if (directory_exists(working_directory + "custom_levels/" + string(downloaded_file_name)))
		{
			
			#region /* The level have been successfully downloaded, so delete temporary folders and zip files now */
			if (file_exists(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"))
			{
				file_delete(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"); /* Destroy the unzipped file last */
			}
			if (directory_exists(working_directory + "/downloaded_" + string(what_kind_of_id)))
			{
				directory_destroy(working_directory + "/downloaded_" + string(what_kind_of_id)); /* Destroy the now empty directory, it's only temporary */
			}
			#endregion /* The level have been successfully downloaded, so delete temporary folders and zip files now END */
			
			if (what_kind_of_id == "level")
			{
				/* Show level name, level thumbnail, and level description */
				
				draw_set_halign(fa_center);
				/* Draw Level Name */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_name_y, string(global.level_name), global.default_text_size * 1.9, c_black, c_white, 1);
				
				#region /* Draw Level Thumbnail */
				if (display_get_gui_height() <= 720)
				{
					if (downloaded_thumbnail_sprite > 0)
					{
						draw_sprite_ext(downloaded_thumbnail_sprite, 0, display_get_gui_width() * 0.5, 64, 384 / sprite_get_width(downloaded_thumbnail_sprite) * 1.1, 216 / sprite_get_height(downloaded_thumbnail_sprite) * 1.1, 0, c_white, 1);
						var draw_description_y = 350;
					}
					else
					{
						var draw_description_y = display_get_gui_height() * 0.5 - 22;
					}
				}
				else
				{
					if (downloaded_thumbnail_sprite > 0)
					{
						draw_sprite_ext(downloaded_thumbnail_sprite, 0, display_get_gui_width() * 0.5, 64, 384 / sprite_get_width(downloaded_thumbnail_sprite) * 2, 216 / sprite_get_height(downloaded_thumbnail_sprite) * 2, 0, c_white, 1);
						var draw_description_y = 532;
					}
					else
					{
						var draw_description_y = display_get_gui_height() * 0.5 - 22;
					}
				}
				#endregion /* Draw Level Thumbnail END */
				
				#region /* Draw who made the level */
				if (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
				{
					ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
					if (ini_key_exists("info", "username"))
					{
						draw_set_halign(fa_right);
						scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("By") + ": " + string(ini_read_string("info", "username", "")), global.default_text_size, c_black, c_white, 1);
					}
					ini_close();
				}
				#endregion /* Draw who made the level END */
				
			}
			else
			if (what_kind_of_id == "character")
			{
				draw_set_halign(fa_center);
				/* Draw Character Name */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_name_y, string(downloaded_character_name), global.default_text_size * 1.9, c_black, c_white, 1);
				
				#region /* Draw Character Thumbnail */
				if (downloaded_thumbnail_sprite > 0)
				{
					var scale_offset = 1;
					draw_sprite_ext(downloaded_thumbnail_sprite, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 100, (392 / sprite_get_width(downloaded_thumbnail_sprite)) * scale_offset, (392 / sprite_get_width(downloaded_thumbnail_sprite)) * scale_offset, 0, c_white, 1);
					var draw_description_y = display_get_gui_height() * 0.5 + 132;
				}
				else
				{
					var draw_description_y = display_get_gui_height() * 0.5 - 22;
				}
				#endregion /* Draw Character Thumbnail END */
				
				#region /* Draw who made the character */
				if (file_exists(working_directory + "/custom_characters/" + string(downloaded_character_name) + "/data/character_config.ini"))
				{
					ini_open(working_directory + "/custom_characters/" + string(downloaded_character_name) + "/data/character_config.ini");
					if (ini_key_exists("info", "username"))
					{
						draw_set_halign(fa_right);
						scr_draw_text_outlined(display_get_gui_width() - 32, display_get_gui_height() - 32, l10n_text("By") + ": " + string(ini_read_string("info", "username", "")), global.default_text_size, c_black, c_white, 1);
					}
					ini_close();
				}
				#endregion /* Draw who made the character END */
				
			}
			
			draw_set_halign(fa_center);
			/* Draw Level Description */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_description_y, string(global.level_description), global.default_text_size * 1.25, c_black, c_white, 1);
			/* Draw ID */ scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_description_y + 50, l10n_text(string(what_kind_of_id)) + " " + l10n_text("ID") + ": " + string(search_id), global.default_text_size * 1.25, c_black, c_white, 1);
			
			var downloaded_message_y = draw_description_y + 100;
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, downloaded_message_y, l10n_text(string(what_kind_of_id)) + " " + l10n_text("downloaded"), global.default_text_size * 2, c_black, c_white, 1)
			if (what_kind_of_id == "level")
			{
				/* Level is downloaded, so you get a choice if you want to play, make, or go back to custom level select*/
				draw_menu_button(display_get_gui_width() * 0.5 - 185, downloaded_message_y + 50, "Play", "searched_file_downloaded_play", "searched_file_downloaded_play");
				draw_menu_button(display_get_gui_width() * 0.5 - 185, downloaded_message_y + 50 + 42, "Make", "searched_file_downloaded_make", "searched_file_downloaded_make");
				var searched_file_downloaded_back_y = downloaded_message_y + 50 + (42 * 2);
				draw_menu_button(display_get_gui_width() * 0.5 - 185, searched_file_downloaded_back_y, "Back", "searched_file_downloaded_back", "searched_file_downloaded_back");
			}
			else
			{
				var searched_file_downloaded_back_y = downloaded_message_y + 50;
				draw_menu_button(display_get_gui_width() * 0.5 - 185, searched_file_downloaded_back_y, "Back", "searched_file_downloaded_back", "searched_file_downloaded_back");
			}
			
			#region /* Play, Make, Back Navigation */
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, downloaded_message_y + 50, display_get_gui_width() * 0.5 + 185, downloaded_message_y + 50 + 41))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			and (what_kind_of_id == "level")
			or (menu == "searched_file_downloaded_play")
			and (key_a_pressed)
			and (menu_delay == 0)
			and (what_kind_of_id == "level")
			{
				/* Play the downloaded level */
				global.doing_clear_check = false;
				global.actually_play_edited_level = true; /* Even before going to the level, set this variable to true */
				global.play_edited_level = true;
				can_navigate = false;
				menu_delay = 9999;
			}
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, downloaded_message_y + 50 + 42, display_get_gui_width() * 0.5 + 185, downloaded_message_y + 50 + 42 + 41))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			and (what_kind_of_id == "level")
			or (menu == "searched_file_downloaded_make")
			and (key_a_pressed)
			and (menu_delay == 0)
			and (what_kind_of_id == "level")
			{
				/* Edit the downloaded level */
				global.doing_clear_check = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_navigate = false;
				menu_delay = 9999;
			}
			
			if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, searched_file_downloaded_back_y, display_get_gui_width() * 0.5 + 185, searched_file_downloaded_back_y + 41))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (mouse_check_button_released(mb_left))
			and (menu_delay == 0)
			or (menu == "searched_file_downloaded_back")
			and (key_a_pressed)
			and (menu_delay == 0)
			{
				menu = "searching_for_id_back";
			}
			
			if (key_down)
			and (menu_delay == 0)
			and (what_kind_of_id == "level")
			{
				if (menu == "searched_file_downloaded_play")
				{
					menu = "searched_file_downloaded_make";
				}
				else
				if (menu == "searched_file_downloaded_make")
				{
					menu = "searched_file_downloaded_back";
				}
				else
				if (menu == "searched_file_downloaded_back")
				{
					menu = "searched_file_downloaded_play";
				}
				menu_delay = 3;
			}
			else
			if (key_up)
			and (menu_delay == 0)
			and (what_kind_of_id == "level")
			{
				if (menu == "searched_file_downloaded_play")
				{
					menu = "searched_file_downloaded_back";
				}
				else
				if (menu == "searched_file_downloaded_make")
				{
					menu = "searched_file_downloaded_play";
				}
				else
				if (menu == "searched_file_downloaded_back")
				{
					menu = "searched_file_downloaded_make";
				}
				menu_delay = 3;
			}
			#endregion /* Play, Make, Back Navigation END */
			
		}
		#endregion /* If level existed and is downloaded, show this menu END */
		
		else
		
		#region /* If level doesn't exist or is not downloaded, show this menu */
		if (!directory_exists(working_directory + "custom_levels/" + string(downloaded_file_name)))
		{
			
			#region /* The level have been successfully downloaded, so delete temporary folders and zip files now */
			if (file_exists(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"))
			{
				file_delete(working_directory + "/downloaded_" + string(what_kind_of_id) + "/" + string_upper(search_id) + ".zip"); /* Destroy the unzipped file last */
			}
			if (directory_exists(working_directory + "/downloaded_" + string(what_kind_of_id)))
			{
				directory_destroy(working_directory + "/downloaded_" + string(what_kind_of_id)); /* Destroy the now empty directory, it's only temporary */
			}
			#endregion /* The level have been successfully downloaded, so delete temporary folders and zip files now END */
			
			menu = "searched_file_downloaded_failed";
			menu_delay = 3;
		}
		#endregion /* If level doesn't exist or is not downloaded, show this menu END */
		
	}
	#endregion /* Searched file downloaded menu END */
	
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
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, downloaded_message_y + 50, display_get_gui_width() * 0.5 + 185, downloaded_message_y + 50 + 41))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (menu == "searched_file_downloaded_back")
		and (key_a_pressed)
		and (menu_delay == 0)
		{
			menu = "searching_for_id_back";
		}
	}
	#endregion /* Show Download Failed message END */
	
	if (menu == "searching_for_id_back")
	{
		search_id = ""; /* Always set this to empty string when going back to previous menu */
		menu_delay = 3;
		if (what_kind_of_id == "level")
		{
			/* Go back to select custom level menu */
			can_navigate = false;
			scr_delete_sprite_properly(downloaded_thumbnail_sprite);
			select_custom_level_menu_open = true;
			scr_load_custom_level_initializing();
			menu = "load_custom_level";
		}
		else
		if (what_kind_of_id == "character")
		{
			player1_menu = "load_downloaded_character";
			select_custom_level_menu_open = false;
			scr_load_character_initializing();
			menu = "load_characters";
			menu_delay = 3;
			menu_joystick1_delay = 30;
		}
	}
}