function scr_draw_menu_search_id()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var id_max_length = 11;
	var search_for_id_delay = 1000;
	
	#region /* Search ID menu */
	if (menu == "search_id_ok")
	or (menu == "search_id_cancel")
	{
		var draw_name_input_screen_y = display_get_gui_height() * 0.5;
		search_id = scr_draw_name_input_screen(search_id, id_max_length, c_black, 1, false, display_get_gui_width() * 0.5, draw_name_input_screen_y, "search_id_ok", "search_id_cancel");
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, draw_name_input_screen_y - 64, "Please enter the level ID", global.default_text_size * 2, c_black, c_white, 1)
		
		if (string_length(search_id) != id_max_length)
		{
			draw_rectangle_color(display_get_gui_width() * 0.5 - 185,
			draw_name_input_screen_y + 54,
			display_get_gui_width() * 0.5 - 185 + 370,
			draw_name_input_screen_y + 54 + 42, c_black, c_black, c_black, c_black, false);
		}
		
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
			or (gamepad_button_check_released(0, global.player1_gamepad_button_accept))
			or (gamepad_button_check_released(1, global.player2_gamepad_button_accept))
			or (gamepad_button_check_released(2, global.player3_gamepad_button_accept))
			or (gamepad_button_check_released(3, global.player4_gamepad_button_accept))
			{
				/* Search for ID on the server */
				menu = "searching_for_id";
				menu_delay = search_for_id_delay;
			}
		}
		#endregion /* Press Enter to search for the inputted ID END */
		
		#region /* Press Escape to back out from Search ID menu */
		if (keyboard_check_released(vk_enter))
		and (menu == "search_id_cancel")
		and (menu_delay == 0)
		or (keyboard_check_released(vk_escape))
		and (menu_delay == 0)
		or (point_in_rectangle(mouse_get_x, mouse_get_y,
		display_get_gui_width() * 0.5 - 185,
		draw_name_input_screen_y + 54 + 42,
		display_get_gui_width() * 0.5 - 185 + 370,
		draw_name_input_screen_y + 54 + 42 + 42))
		and (mouse_check_button_released(mb_left))
		and (menu_delay == 0)
		or (mouse_check_button_released(mb_right))
		and (menu_delay == 0)
		or (gamepad_button_check_released(0, global.player1_gamepad_button_back))
		and (menu_delay == 0)
		or (gamepad_button_check_released(1, global.player2_gamepad_button_back))
		and (menu_delay == 0)
		or (gamepad_button_check_released(2, global.player3_gamepad_button_back))
		and (menu_delay == 0)
		or (gamepad_button_check_released(3, global.player4_gamepad_button_back))
		and (menu_delay == 0)
		{
			search_id = "";
			select_custom_level_menu_open = true;
			menu = "search_id";
			menu_delay = 3;
		}
		#endregion /* Press Escape to back out from Search ID menu END */
		
	}
	#endregion /* Search ID menu END */
	
	#region /* Searching for ID menu */
	if (menu == "searching_for_id")
	{
		if (menu_delay == search_for_id_delay - 10)
		{
			/* Download the file from the server */
			http_get_file(global.url + string(search_id) + ".zip", working_directory + "/custom_levels/" + string(search_id) + ".zip");
		}
		
		/* Unzip the downloaded file when the game finds it */
		if (file_exists(working_directory + "/custom_levels/" + string(search_id) + ".zip"))
		{
			zip_unzip(working_directory + "/custom_levels/" + string(search_id) + ".zip", working_directory + "/custom_levels/");
			/* Destroy the unzipped file last */
			file_delete(working_directory + "/custom_levels/" + string(search_id) + ".zip");
			if (menu_delay > 3)
			{
				menu_delay = 3;
			}
		}
		
		#region /* Opaque transparent black rectangle over whole screen, but underneath name input screen */
		draw_set_alpha(0.9);
		draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		#endregion /* Opaque transparent black rectangle over whole screen, but underneath name input screen END */
		
		if (menu_delay > 0)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "Downloading file...", global.default_text_size * 2, c_black, c_white, 1)
			
			#region /* Draw loading icon when waiting for download */
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			global.loading_spinning_angle -= 10;
			draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64, 1, 1, global.loading_spinning_angle, c_white, 1);
			#endregion /* Draw loading icon when waiting for download END */
			
		}
		else
		if (menu_delay <= 0)
		and (!directory_exists(working_directory + "/custom_levels/" + string(search_id)))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "Failed to download file", global.default_text_size * 2, c_black, c_white, 1)
		}
		
		#region /* Go back to select custom level menu */
		if (menu_delay <= 0)
		{
			if (directory_exists(working_directory + "/custom_levels/" + string(search_id)))
			or (keyboard_check_released(vk_anykey))
			or (gamepad_button_check_released(0, global.player1_gamepad_button_back))
			or (gamepad_button_check_released(0, global.player1_gamepad_button2_back))
			or (gamepad_button_check_released(1, global.player2_gamepad_button_back))
			or (gamepad_button_check_released(1, global.player2_gamepad_button2_back))
			or (gamepad_button_check_released(2, global.player3_gamepad_button_back))
			or (gamepad_button_check_released(2, global.player3_gamepad_button2_back))
			or (gamepad_button_check_released(3, global.player4_gamepad_button_back))
			or (gamepad_button_check_released(3, global.player4_gamepad_button2_back))
			{
				search_id = "";
				select_custom_level_menu_open = true;
				scr_load_custom_level_initializing();
				menu = "load_custom_level";
				menu_delay = 3;
			}
		}
		#endregion /* Go back to select custom level menu END */
		
	}
	#endregion /* Searching for ID menu END */
	
}