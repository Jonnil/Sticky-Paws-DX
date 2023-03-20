function scr_draw_menu_search_id()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var id_max_length = 9;
	
	#region /* Search ID menu */
	if (menu == "search_id_ok")
	or (menu == "search_id_cancel")
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
		
		search_id = scr_draw_name_input_screen(search_id, id_max_length, c_black, 1, false, display_get_gui_width() * 0.5, draw_name_input_screen_y, "search_id_ok", "search_id_cancel", true);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_name_input_screen_y - 64, l10n_text("Please enter a") + " \"" + string(global.game_name) + " " + " ID\"", global.default_text_size * 2, c_black, c_white, 1)
		
		#region /* Press Escape to back out from Search ID menu */
		if (keyboard_check_released(vk_enter))
		and (menu == "search_id_cancel")
		or (keyboard_check_released(vk_escape))
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		display_get_gui_width() * 0.5 - 185,
		draw_name_input_screen_y + 54 + 42,
		display_get_gui_width() * 0.5 - 185 + 370,
		draw_name_input_screen_y + 54 + 42 + 42))
		and (mouse_check_button_released(mb_left))
		or (mouse_check_button_released(mb_right))
		or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_back))
		or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_back))
		or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_back))
		or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_back))
		or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_back))
		or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_back))
		or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_back))
		or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_back))
		
		or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_accept))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_accept))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_accept))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_accept))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_accept))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_accept))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_accept))
		and (menu == "search_id_cancel")
		or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_accept))
		and (menu == "search_id_cancel")
		{
			if (menu_delay == 0)
			{
				search_id = "";
				select_custom_level_menu_open = true;
				menu = "search_id";
				menu_delay = 3;
			}
		}
		#endregion /* Press Escape to back out from Search ID menu END */
		
		#region /* Press Enter to search for the inputted ID */
		if (menu_delay == 0)
		and (keyboard_string != "")
		and (string_length(search_id) == id_max_length)
		and (search_id != undefined)
		{
			if (keyboard_check_released(vk_enter))
			and (menu != "search_id_ok")
			and (menu != "search_id_cancel")
			or (keyboard_check_released(vk_enter))
			and (menu == "search_id_ok")
			or (point_in_rectangle(mouse_get_x, mouse_get_y,
			display_get_gui_width() * 0.5 - 185,
			draw_name_input_screen_y + 54,
			display_get_gui_width() * 0.5 - 185 + 370,
			draw_name_input_screen_y + 54 + 42))
			and (mouse_check_button_released(mb_left))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_accept))
			or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_accept))
			or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_accept))
			or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_accept))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_accept))
			or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_accept))
			{
				http_get_file(global.url_downloader + string(search_id) + ".zip", working_directory + "/custom_levels/" + string(search_id) + ".zip"); /* Download the file from the server */
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
		if (file_exists(working_directory + "/custom_levels/" + string(search_id) + ".zip")) /* Find if a new .zip file has been downloaded */
		{
			zip_unzip(working_directory + "/custom_levels/" + string(search_id) + ".zip", working_directory + "/custom_levels/"); /* Unzip the downloaded file when the game finds it */
			file_delete(working_directory + "/custom_levels/" + string(search_id) + ".zip"); /* Destroy the unzipped file last */
			menu = "searched_file_downloaded"; /* Go to the screen where you see the file has been downloaded */
			menu_delay = 3;
		}
		
		#region /* Draw text explaining to the player that the file is downloading, and a loading icon that is spinning */
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath name input screen */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath name input screen END */
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "Downloading file...", global.default_text_size * 2, c_black, c_white, 1)
		
		#region /* Draw loading icon when waiting for download */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		global.loading_spinning_angle -= 10;
		draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64, 1, 1, global.loading_spinning_angle, c_white, 1);
		#endregion /* Draw loading icon when waiting for download END */
		
		#endregion /* Draw text explaining to the player that the file is downloading, and a loading icon that is spinning END */
		
	}
	#endregion /* Searching for ID menu END */
	
	else
	
	#region /* Searched file downloaded menu */
	if (menu == "searched_file_downloaded")
	{
		if (directory_exists(working_directory + "/custom_levels/" + string(search_id)))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "File downloaded!", global.default_text_size * 2, c_black, c_white, 1)
		}
		else
		if (!directory_exists(working_directory + "/custom_levels/" + string(search_id)))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "Failed to download file", global.default_text_size * 2, c_black, c_white, 1)
		}
		
		draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 64, "OK", "searched_file_downloaded", "searched_file_downloaded_ok");
		if (key_a_released)
		or (key_b_pressed)
		{
			menu = "searched_file_downloaded_ok";
		}
	}
	#endregion /* Searched file downloaded menu END */
	
	else
	
	#region /* Go back to select custom level menu */
	if (menu == "searched_file_downloaded_ok")
	{
		search_id = "";
		select_custom_level_menu_open = true;
		scr_load_custom_level_initializing();
		menu = "load_custom_level";
		menu_delay = 3;
	}
	#endregion /* Go back to select custom level menu END */
	
}