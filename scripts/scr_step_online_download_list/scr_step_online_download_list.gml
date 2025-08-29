/// @function scr_step_online_download_list()
/// @description This script handles non-drawing logic for the online download list, including network checks, menu initialization, and input handling for navigation and selection */
function scr_step_online_download_list()
{
	var start_idx = 0;
	var page_count = 0;

	#region /* Initialization: Begin loading the online download list if requested */
	if (menu == "online_download_list_load")
	&& (global.online_token_validated)
	{
		if (scr_check_network_connection(network_connect_active))
		{

			#region /* Pagination-aware initial cursor/offset setup */
			var per_page = global.download_items_per_page;
			var current_page = clamp(global.download_current_page, 0, max(0, global.download_total_pages - 1));
			var page_offset = current_page * per_page;

			/* Determine how many items are actually on this page (handles short last page) */
			var current_page_visible_item_count = per_page;

			if (is_array(global.online_content_data))
			{
				var num_items = array_length(global.online_content_data);
				var current_page_first_global_index = page_offset;
				var current_page_last_global_index = min(current_page_first_global_index + per_page - 1, max(0, num_items - 1));
				current_page_visible_item_count = max(0, current_page_last_global_index - current_page_first_global_index + 1);
			}

			/* Index relative to the current page */
			var local_index = global.selected_online_download_index - page_offset;
			local_index = clamp(local_index, 0, max(0, current_page_visible_item_count - 1));

			var menu_cursor_y_position_start = 114 + (300 * (local_index));
			var menu_y_offset_real_start = -(170 * (local_index));

			/* Set up initial cursor/offset values */
			menu_cursor_y_position = menu_cursor_y_position_start;
			menu_y_offset_real = menu_y_offset_real_start;
			menu_y_offset = menu_y_offset_real_start;
			#endregion /* Pagination-aware initial cursor/offset setup END */

			/* Initialize the online download menu (draw helper remains in draw script) */
			scr_initialize_online_download_menu();
		}
		else
		{
			in_online_download_list_menu = false; show_debug_message("[scr_step_online_download_list] 'In online download list menu' is set to false");

			if (content_type == "character")
			{
				caution_online_takes_you_back_to = "download_online_search_id";
			}
			else
			if (content_type == "level")
			{
				select_custom_level_menu_open = true;
				show_level_editor_corner_menu = false;
				caution_online_takes_you_back_to = "level_editor_upload"; show_debug_message("[scr_step_online_download_list] caution_online_takes_you_back_to = level_editor_upload");
			}

			scr_handle_no_network_connection("scr_step_online_download_list", "online_download_list_load");
		}
	}
	else

	/* If we are in a 'download_online' menu, but the 'in_online_download_list_menu' flag is set to false, this is incorrect game state */
	if (menu_delay == 0
	&& menu_joystick_delay == 0
	&& !in_online_download_list_menu)
	&& (string_copy(menu, 1, string_length("download_online")) == "download_online")
	{
		/* If we're not in the online download list, force fallback to the previous state */
		show_debug_message("[scr_step_online_download_list] If we're not in the online download list, force fallback to the previous state. menu = " + string(menu) + ". string_copy(menu, 1, string_length('download_online')) = " + string(string_copy(menu, 1, string_length("download_online"))) +". in_online_download_list_menu = " + string(in_online_download_list_menu) + "\n");
		scr_fallback_to_previous_menu_state();
	}
	#endregion /* Initialization: Begin loading the online download list if requested END */

	#region /* Input Handling: Navigation for the online download list menu */
	if (string_copy(menu, 1, string_length("download_online")) == "download_online")
	{
		var num_items = array_length(global.online_content_data);

		/* Pagination slice calculation */
		var perPage        = global.download_items_per_page;
		var page        = clamp(global.download_current_page, 0, global.download_total_pages - 1);
		var start_idx    = page * perPage;
		var end_idx        = min(start_idx + perPage - 1, array_length(global.online_content_data) - 1);
		page_count    = end_idx - start_idx + 1;

		#region /* Combined Navigation with keyboard/joystick when data is present */
		if (global.online_content_data != undefined
		&& (menu != "search_id_ok"))
		{

			#region /* Handle UP key */
			if (key_up
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0))
			{
				menu_delay = 3;

				if (menu == "download_online_" + string(start_idx))
				{
					if (global.download_current_page < global.download_total_pages - 1)
					{
						menu = "download_online_page_next";
					}
					else
					if (global.download_current_page > 0)
					{
						menu = "download_online_page_prev";
					}
					else
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) <= 0))
					{
						menu = "download_online_back";
					}
					else
					{
						menu = "download_online_search_id";
					}
				}
				else
				if (menu == "download_online_" + string(global.selected_online_download_index))
				{
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) <= 0))
					{
						menu = "download_online_back";
					}
					else
					{
						menu = "download_online_" + string(global.selected_online_download_index - 1);
					}
				}
				else
				if (menu == "download_online_back")
				{
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) > 0))
					{
						menu = "download_online_" + string(end_idx);
						var menu_cursor_y_position_start = 114 + (300 * (end_idx));
						var menu_y_offset_real_start = -(170 * (end_idx));
						menu_cursor_y_position = menu_cursor_y_position_start;
						menu_y_offset = menu_y_offset_real_start - 999;
						menu_y_offset_real = menu_y_offset_real_start - 999;
					}
				}
				else
				if (menu == "download_online_search_id")
				{
					menu = "download_online_back";
				}
				else
				if (menu == "download_online_page_next")
				{
					if (global.download_current_page > 0)
					{
						menu = "download_online_page_prev";
					}
					else
					{
						menu = "download_online_search_id";
					}
				}
				else
				if (menu == "download_online_page_prev")
				{
					menu = "download_online_search_id";
				}
			}
			#endregion /* Handle UP key END */

			else

			#region /* Handle DOWN key */
			if (key_down
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0))
			{
				menu_delay = 3;

				if (menu == "download_online_" + string(start_idx))
				{
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) <= 0))
					{
						menu = "download_online_back";
					}
					else
					{
						if (array_length(global.online_content_data) >= 2)
						{
							menu = "download_online_" + string(start_idx + 1);
						}
						else
						{
							menu = "download_online_back";
						}
					}
				}
				else
				if (menu == "download_online_" + string(global.selected_online_download_index))
				{
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) <= 0))
					|| (menu == "download_online_" + string(end_idx))
					{
						menu = "download_online_back";
					}
					else
					if (global.selected_online_download_index < array_length(global.online_content_data) - 1)
					{
						menu = "download_online_" + string(global.selected_online_download_index + 1);
					}
					else
					{
						menu = "download_online_back";
					}
				}
				else
				if (menu == "download_online_back")
				{
					menu = "download_online_search_id";
				}
				else
				if (menu == "download_online_search_id")
				{
					if (global.download_current_page > 0)
					{
						menu = "download_online_page_prev";
					}
					else
					if (global.download_current_page < global.download_total_pages - 1)
					{
						menu = "download_online_page_next";
					}
					else
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) > 0))
					{
						menu = "download_online_" + string(start_idx);
						menu_y_offset_real = 0;
						menu_cursor_y_position = 0;
					}
				}
				else
				if (menu == "download_online_page_next")
				{
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) > 0))
					{
						menu = "download_online_" + string(start_idx);
						menu_y_offset_real = 0;
						menu_cursor_y_position = 0;
					}
				}
				else
				if (menu == "download_online_page_prev")
				{
					if (global.download_current_page < global.download_total_pages - 1)
					{
						menu = "download_online_page_next";
					}
					else
					if (is_array(global.online_content_data)
					&& (array_length(global.online_content_data) > 0))
					{
						menu = "download_online_" + string(start_idx);
						menu_y_offset_real = 0;
						menu_cursor_y_position = 0;
					}
				}
			}
			#endregion /* Handle DOWN key END */

			else

			#region /* Handle RIGHT key */
			if (key_right
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0))
			{
				menu_delay = 3;

				if (menu == "download_online_back")
				|| (menu == "download_online_search_id")
				|| (menu == "download_online_page_next")
				|| (menu == "download_online_page_prev")
				{
					menu = "download_online_" + string(global.selected_online_download_index);
				}
				else
				if (menu == "download_online_" + string(global.selected_online_download_index))
				&& (content_type == "level")
				{
					menu = "download_online_custom_level_assets";
				}
			}
			#endregion /* Handle RIGHT key END */

			else

			#region /* Handle LEFT key */
			if (key_left
			&& (menu_delay == 0)
			&& (menu_joystick_delay == 0))
			{
				menu_delay = 3;

				if (menu == "download_online_custom_level_assets")
				{
					menu = "download_online_" + string(global.selected_online_download_index);
				}
				else
				if (menu == "download_online_" + string(global.selected_online_download_index))
				{
					if (global.download_current_page < global.download_total_pages - 1)
					{
						menu = "download_online_page_next";
					}
					else
					if (global.download_current_page > 0)
					{
						menu = "download_online_page_prev";
					}
					else
					{
						menu = "download_online_search_id";
					}
				}
			}
			#endregion /* Handle LEFT key END */

		}
		#endregion /* Combined Navigation with keyboard/joystick when data is present END */

		#region /* Input Handling: Pressing the Back button */
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

				global.automatically_play_downloaded_level = false;
				global.use_temp_or_working = game_save_id;
				global.online_download_list = "";
				//online_content_data = undefined; show_debug_message("[scr_step_online_download_list] 'online content data' is set to undefined");
				//info_data = undefined;
				automatically_search_for_id = false;
				in_online_download_list_menu = false; show_debug_message("[scr_step_online_download_list] 'In online download list menu' is set to false");
				in_online_download_list_load_menu = false;
				keyboard_string = "";
				search_id = "";

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
		#endregion /* Input Handling: Pressing the Back button END */

		#region /* Input Handling: Pressing the Search ID button */
		if (((menu == "download_online_search_id")
		&& key_a_pressed)
		|| ((menu == "download_online_search_id")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, 42, 370, 84))
		&& mouse_check_button_released(mb_left))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4)))
		{
			menu_delay = 3;
			in_online_download_list_menu = false; show_debug_message("[scr_step_online_download_list] 'In online download list menu' is set to false");
			automatically_search_for_id = false;
			keyboard_string = "";
			search_id = "";
			caution_online_takes_you_to = "search_id_ok"
			menu = "search_id_ok";
			select_custom_level_menu_open = false;
		}
		#endregion /* Input Handling: Pressing the Search ID button END */

	}
	#endregion /* Input Handling: Navigation for the online download list menu END */

	if (in_online_download_list_menu)
	{
		/* Keep the thumbnail pipeline alive while the list is open */
		scr_download_thumbnails(true);

		#region /* Process Data */
		if (global.online_content_data == undefined
		&& in_online_download_list_menu)
		{
			scr_process_online_download_list_data();
		}
		else
		{
			global.server_timeout_end = undefined;
			scr_process_online_download_menu_data();
		}
		#endregion /* Process Data END */

	}
	else

	/* If we are in a 'download_online' menu, but the 'in_online_download_list_menu' flag is set to false, this is incorrect game state */
	if (menu_delay == 0
	&& menu_joystick_delay == 0
	&& !in_online_download_list_menu
	&& string_copy(menu, 1, string_length("download_online")) == "download_online")
	{
		show_debug_message("[scr_step_online_download_list] If we're not in the online download list EVEN STILL, force fallback to the previous state. menu = " + string(menu));
		scr_fallback_to_previous_menu_state();
	}

	/* Thumbnails are downloaded while the list is open (handled above). */
}
