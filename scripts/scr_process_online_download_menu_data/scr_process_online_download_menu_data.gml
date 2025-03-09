/// @function scr_process_online_download_menu_data()
/// @description Processes the online download menu with thumbnails, buttons, and handles navigation when data is available.
function scr_process_online_download_menu_data()
{
	
	#region /* Show online downloads if data is available */
	if (data != undefined
	&& (menu != "search_id_ok"))
	{
		scr_scroll_menu(300, false);
		
		if (is_array(data))
		{
			
			#region /* Set level data for each download */
			var num_items = array_length(data);
			
			if (!is_array(finished_level))
			{
				finished_level = array_create(num_items, undefined);
			}
			if (!is_array(zero_defeats_level))
			{
				zero_defeats_level = array_create(num_items, undefined);
			}
			if (!is_array(liked_content))
			{
				liked_content = array_create(num_items, undefined);
			}
			#endregion /* Set level data for each download END */
			
		}
		else
		{
			var num_items = 0;
			show_debug_message("data is not an array! data = " + string(data) + " num_items = " + string(num_items));
		}
		
		scr_download_thumbnails(true, num_items);
	}
	#endregion /* Show online downloads if data is available END */
	
	if (!global.online_token_validated
	|| !os_is_network_connected())
	{
		scr_handle_no_network_connection();
	}
	
	#region /* Handle Back Button Input */
	if ((key_b_pressed)
	|| ((menu == "download_online_back")
	&& ((key_a_pressed)
	|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 0, 370, 42)
	&& mouse_check_button_released(mb_left)))))
	{
		if ((menu_delay == 0)
		&& (menu_joystick_delay == 0))
		{
			menu_delay = 3;
			if (content_type == "level")
			{
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				select_custom_level_menu_open = false;
				if (global.online_level_list_back == "online_level_list_title")
				{
					menu = "online_level_list_title";
				}
				else
				{
					global.online_level_list_back = "";
					menu = "load_custom_level"; /* Reload custom levels before level select */
				}
			}
			else
			{
				menu = "online_character_list";
			}
			global.automatically_play_downloaded_level = false;
			global.use_temp_or_working = game_save_id;
			global.online_download_list = "";
			data = undefined;
			info_data = undefined;
			automatically_search_for_id = false;
			in_online_download_list_menu = false;
			in_online_download_list_load_menu = false;
			keyboard_string = "";
			search_id = "";
		}
	}
	#endregion /* Handle Back Button Input END */
	
	#region /* Handle Search ID Button Input */
	if (((menu == "download_online_search_id")
	&& key_a_pressed)
	|| ((menu == "download_online_search_id")
	&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 42, 370, 84))
	&& mouse_check_button_released(mb_left))
	|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4)))
	{
		menu_delay = 3;
		in_online_download_list_menu = false;
		automatically_search_for_id = false;
		keyboard_string = "";
		search_id = "";
		menu = "search_id_ok";
		select_custom_level_menu_open = false;
	}
	#endregion /* Handle Search ID Button Input END */
	
	menu_y_offset_real = clamp(menu_y_offset_real, -250 + window_get_height() - (300 * array_length(data)), 0);
}