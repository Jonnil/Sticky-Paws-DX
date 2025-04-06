/// @function scr_draw_network_error_menu()
function scr_draw_network_error_menu()
{
	if (menu == "network_error")
	|| (menu == "network_error_main_menu")
	{
		in_settings = false;
		
		/* Get common dimensions and mouse position */
		var window_width   = display_get_gui_width();
		var window_height  = display_get_gui_height();
		var center_x	   = window_width * 0.5;
		var center_y	   = window_height * 0.5;
		var mouse_get_x	= device_mouse_x_to_gui(0);
		var mouse_get_y	= device_mouse_y_to_gui(0);
		
		/* Add a semi-transparent dark overlay */
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, window_width, window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		/* Determine the error message based on connection status */
		var error_text = "";
		
		if (!check_network_connection(network_connect_passive))
		{
			error_text = l10n_text("No Internet Connection Detected");
		}
		else
		if (!global.online_token_validated)
		|| (!global.online_enabled)
		{
			error_text = l10n_text("Invalid Online Credentials");
		}
		else
		{
			error_text = l10n_text("Network Error Encountered");
		}
		
		/* Display the error message and instructions */
		scr_draw_text_outlined(center_x, center_y - 120, error_text,
							   global.default_text_size * 1.9, c_black, c_white, 1);
		scr_draw_text_outlined(center_x, center_y - 70, l10n_text("Please check your network settings or credentials"),
							   global.default_text_size, c_black, c_white, 1);
		
		/* Calculate positions for the two buttons: Retry and Main Menu (Offline Mode) */
		var retry_button_y = center_y + 20;
		var mainmenu_button_y = center_y + 20 + 50;
		var retry_x	= center_x - 185; /* Left button: Retry */
		var mainmenu_x = center_x - 185; /* Right button: Main Menu */
		
		/* Determine hover state for each button (assuming button size: width 360, height 84) */
		var retry_hover	= point_in_rectangle(mouse_get_x, mouse_get_y, retry_x, retry_button_y, retry_x + 370, retry_button_y + 42);
		var mainmenu_hover = point_in_rectangle(mouse_get_x, mouse_get_y, mainmenu_x, mainmenu_button_y, mainmenu_x + 370, mainmenu_button_y + 42);
		
		/* Draw Retry Button (with different styles based on control scheme and hover) */
		draw_menu_button(retry_x, retry_button_y, l10n_text("Retry"), "network_error", "network_error");
		
		/* Draw Main Menu Button (Offline Mode) */
		draw_menu_button(mainmenu_x, mainmenu_button_y, l10n_text("Main Menu"), "network_error_main_menu", "network_error_main_menu");
		
		/* Handle button activation to avoid repetitive error pop-ups */
		var can_activate = (menu_delay == 0 && menu_joystick_delay == 0);
		var retry_clicked = false;
		var retry_successful = false;
		var mainmenu_clicked = false;
		
		#region /* Network Error Navigation */
		if (key_up)
		&& (!key_down)
		&& (can_activate)
		{
			menu_delay = 3;
			menu = "network_error"; /* Network Error Navigation to "network_error" */
		}
		else
		if (key_down)
		&& (!key_up)
		&& (can_activate)
		{
			menu_delay = 3;
			menu = "network_error_main_menu";
		}
		#endregion /* Network Error Navigation END */
		
		if (can_activate)
		{
			/* Mouse-based activation */
			if (retry_hover
			&& mouse_check_button_released(mb_left))
			{
				retry_clicked = true;
			}
			
			if (mainmenu_hover
			&& mouse_check_button_released(mb_left))
			{
				mainmenu_clicked = true;
			}
			
			/* Keyboard/Gamepad activation using a selected button indicator */
			if (global.controls_used_for_navigation == "keyboard"
			|| global.controls_used_for_navigation == "gamepad")
			{
				if (key_a_pressed
				|| key_b_pressed)
				{
					if (menu == "network_error")
					{
						retry_clicked = true;
					}
					else
					{
						mainmenu_clicked = true;
					}
				}
			}
		}
		
		/* Process button actions */
		if (retry_clicked)
		{
			menu_delay = 3;
			
			/* Recheck connection: if restored, proceed to online features; otherwise, remain on error screen */
			if (check_network_connection(network_connect_passive)
			&& global.online_enabled
			&& global.online_token_validated)
			{
				retry_successful = true;
			}
			else
			{
				scr_switch_update_online_status();
				
				if (check_network_connection(network_connect_active))
				{
					retry_successful = true;
				}
				else
				{
					menu = "network_error";
					/* Optionally prompt for credentials or open network settings: */
					/* scr_open_network_settings(); */
					/* Stay on error screen until the connection is fixed */
				}
			}
		}
		else
		if (mainmenu_clicked)
		{
			in_character_select_menu = false;
			in_edit_character_menu = false;
			in_online_download_list_menu = false; show_debug_message("[scr_draw_network_error_menu] 'In online download list menu' is set to false");
			in_online_download_list_load_menu = false;
			in_settings = false;
			global.go_to_menu_when_going_back_to_title = "";
			
			menu_delay = 3;
			menu = "main_game"; /* Switch to offline/main menu to let the user access non-network features */
		}
		
		if (retry_successful)
		{
			menu_delay = 3;
			
			if (caution_online_takes_you_back_to == "select_character")
			{
				in_character_select_menu = true;
				in_online_download_list_menu = false; show_debug_message("[scr_draw_network_error_menu] 'In online download list menu' is set to false");
			}
			
			if (caution_online_takes_you_back_to == "language_check_updates")
			{
				in_settings = true;
			}
			
			if (caution_online_takes_you_back_to == "about_online_level_list")
			{
				information_menu_open = "about";
			}
			
			/* If you are in any download_online menu, then you need to turn on in_online_download_list_menu again */
			if (string_copy(caution_online_takes_you_back_to, 1, string_length("download_online")) == "download_online") /* Any string that starts with download_online is accepted */
			{
				show_debug_message("[scr_handle_no_network_connection] If you are in any download_online menu, then you need to turn on in_online_download_list_menu again");
				in_online_download_list_menu = true; show_debug_message("[scr_handle_no_network_connection] 'In online download list menu' is set to true");
			}
			
			show_debug_message("[scr_handle_no_network_connection] menu = " + string(caution_online_takes_you_back_to) + ", caution_online_takes_you_back_to = " + string(caution_online_takes_you_back_to) + "\n");
			menu = caution_online_takes_you_back_to; /* Transition to the intended online feature screen */
		}
	}
}