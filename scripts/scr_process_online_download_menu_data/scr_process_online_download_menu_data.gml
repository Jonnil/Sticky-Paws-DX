/// @function scr_process_online_download_menu_data()
/// @description Processes the online download menu with thumbnails, buttons, and handles navigation when data is available.
function scr_process_online_download_menu_data()
{
	var num_items = array_length(variable_global_get("online_content_data_" + string(content_type)));

	#region /* Show online downloads if data is available */
	if (variable_global_get("online_content_data_" + string(content_type)) != undefined
	&& (menu != "search_id_ok"))
	{
		scr_scroll_menu(300, false);

		if (is_array(variable_global_get("online_content_data_" + string(content_type))))
		{

			#region /* Set level data for each download */
			if (!variable_instance_exists(id, "finished_level")
			|| !is_array(finished_level))
			{
				finished_level = array_create(num_items, undefined);
			}

			if (!variable_instance_exists(id, "zero_defeats_level")
			|| !is_array(zero_defeats_level))
			{
				zero_defeats_level = array_create(num_items, undefined);
			}

			if (!variable_instance_exists(id, "liked_content")
			|| !is_array(liked_content))
			{
				liked_content = array_create(num_items, undefined);
			}
			#endregion /* Set level data for each download END */

		}
		else
		{
			num_items = 0;
			show_debug_message("[scr_process_online_download_menu_data] data is not an array! num_items = " + string(num_items));
		}
	}
	#endregion /* Show online downloads if data is available END */

	#region /* Only run this code if we are still not in the network error menu */
	if (menu != "network_error")
	&& (menu != "network_error_copy_error_code")
	&& (menu != "network_error_main_menu")
	&& (menu_delay == 0
	&& menu_joystick_delay == 0)
	{
		if (!global.online_enabled
		|| !global.online_token_validated
		|| !scr_check_network_connection(network_connect_passive))
		{
			in_online_download_list_menu = false; show_debug_message("[scr_process_online_download_menu_data] 'In online download list menu' is set to false when we are no longer in the error menu, but we still have no internet connection\n");

			if (content_type == "character")
			{
				caution_online_takes_you_back_to = "download_online_search_id";
			}
			else
			if (content_type == "level")
			{
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				caution_online_takes_you_back_to = "level_editor_upload"; show_debug_message("[scr_process_online_download_menu_data] caution_online_takes_you_back_to = level_editor_upload");
			}

			caution_online_takes_you_back_to = menu;

			scr_handle_no_network_connection("scr_process_online_download_menu_data", caution_online_takes_you_back_to);
		}
	}
	#endregion /* Only run this code if we are still not in the network error menu END */

	#region /* Handle Back Button Input */
	if ((key_b_pressed)
	|| ((menu == "download_online_back")
	&& ((key_a_pressed)
	|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 0, 370, 42)
	&& mouse_check_button_released(mb_left)))))
	{
		if (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;

			/* Safe resets that don't affect thumbnail cache */
			global.automatically_play_downloaded_level = false;
			global.use_temp_or_working = game_save_id;

			/* Reset only UI/input state */
			automatically_search_for_id = false;
			in_online_download_list_menu = false;
			show_debug_message("[scr_process_online_download_menu_data] 'In online download list menu' is set to false when clicking Back\n");
			in_online_download_list_load_menu = false;
			keyboard_string = "";
			search_id = "";

			/* Paging variables, make sure scroll/page position restores correctly */
			var page_offset = global.download_current_page * global.download_items_per_page;
			info_queue_index = page_offset;

			/* Change menu state last */
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
		if (menu_delay == 0
		&& menu_joystick_delay == 0)
		{
			menu_delay = 3;
			in_online_download_list_menu = false; show_debug_message("[scr_process_online_download_menu_data] 'In online download list menu' is set to false when we are about to search for a content ID\n");
			automatically_search_for_id = false;
			keyboard_string = "";
			search_id = "";
			caution_online_takes_you_to = "search_id_ok"
			menu = "search_id_ok";
			select_custom_level_menu_open = false;
		}
	}
	#endregion /* Handle Search ID Button Input END */
	
}
