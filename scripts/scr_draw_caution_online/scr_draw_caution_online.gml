function scr_draw_caution_online()
{
	var fixed_player = 1;
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Opaque transparent black rectangle over whole screen, but underneath text */
	draw_set_alpha(0.75);
	draw_rectangle_color(- 32, - 32, display_get_gui_width() + 32, display_get_gui_height() + 32, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_roundrect_color_ext(display_get_gui_width() * 0.5 - 600, display_get_gui_height() * 0.5 - 200, display_get_gui_width() * 0.5 + 600, display_get_gui_height() * 0.5 + 200, 50, 50, c_black, c_black, false);
	#endregion /* Opaque transparent black rectangle over whole screen, but underneath text END */
	
	if (menu == "caution_online_back")
	|| (menu == "caution_online_do_not_show")
	|| (menu == "caution_online_proceed")
	{
		if (variable_instance_exists(self, "show_level_editor_corner_menu"))
		{
			show_level_editor_corner_menu = false;
		}
		
		draw_menu_button(0, 0, l10n_text("Back"), "caution_online_back", "caution_online_back");
		draw_sprite_ext(spr_icon_back, 0, 16, 21, 1, 1, 0, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 128, l10n_text("Caution: Online Communication"), global.default_text_size * 2, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 64, l10n_text("Online communication is offered by official servers that are owned operated and supervised by us"), global.default_text_size * 0.8, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("We are moderating user-generated content as much as we can but we might not catch everything"), global.default_text_size * 0.8, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("You may be exposed to unmoderated user-generated content that may not be suitable for everyone"), global.default_text_size * 0.8, c_black, c_white, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 32, l10n_text("If you find inappropriate content please report it"), global.default_text_size, c_black, c_white, 1);
		global.caution_online_do_not_show = draw_menu_checkmark(display_get_gui_width() * 0.5 - 280, display_get_gui_height() * 0.5 + 96, l10n_text("Do not show this screen again"), "caution_online_do_not_show", global.caution_online_do_not_show);
		draw_menu_button(display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 138, l10n_text("Proceed"), "caution_online_proceed", "caution_online_proceed");
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, display_get_gui_height() * 0.5 + 138, display_get_gui_width() * 0.5 - 185 + 370, display_get_gui_height() * 0.5 + 138 + 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "caution_online_proceed")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			
			/* If you have enabled "do not show", then save that regardless if you have a internet connection or not */
			if (global.caution_online_do_not_show)
			{
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_string("config", "caution_online_do_not_show", true);
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			}
			
			if (scr_check_network_connection(network_connect_active)) /* Need to check if you are connected to the internet before proceeding to online content */
			{
				if (global.switch_logged_in)
				{
					if (global.switch_account_network_service_available) /* Need to make sure that network service is available before going online */
					{
						if (scr_online_token_is_valid() == true)
						{
							show_debug_message("[scr_draw_caution_online] Online token is valid. Token Validity: " + string(scr_online_token_is_valid()) + ", caution_online_takes_you_to: " + string(caution_online_takes_you_to) + ", current menu: " + string(menu));
							
							if (caution_online_takes_you_to == "online_download_list_load")
							{
								show_debug_message("[scr_draw_caution_online] Transitioning to online download list load menu. Selected index: " + string(global.selected_online_download_index) + ", content_type: " + string(content_type));
								/* Go to online level list, so you can browse all uploaded levels, instead of just searching for specific levels */
								select_custom_level_menu_open = false;
								global.selected_online_download_index = 0;
							}
							else
							if (caution_online_takes_you_to == "search_id_ok")
							{
								show_debug_message("[scr_draw_caution_online] Transitioning to search ID OK menu. content_type: " + string(content_type) + ", keyboard_string: " + string(keyboard_string) + ", search_id: " + string(search_id));
								keyboard_string = "";
								search_id = "";
								content_type = "character";
								menu = "search_id_ok";
								select_custom_level_menu_open = false;
							}
							
							global.online_enabled = true;
							
							var no_players_can_play = true;
							
							for(var i = 1; i <= global.max_players; i += 1)
							{
							    if (global.player_can_play[i])
								{
							        no_players_can_play = false;
							        break; /* exit the loop if any player can play */
							    }
							}
							
							if (no_players_can_play)
							|| (global.playergame <= 0)
							{
								global.player_can_play[fixed_player] = true;
							}
							information_menu_open = "";
							
							if (!global.upload_rules_do_not_show_level) /* If you have not yet agreed to the upload rules for uploading levels */
							&& (caution_online_takes_you_to == "level_editor_upload_pressed") /* And you're supposed to go to the upload edit menu */
							{
								menu = "upload_rules"; /* Then take you to the upload rules menu */
							}
							else
							{
								menu = caution_online_takes_you_to; /* You go to the menu you're supposed to go to from beginning */
							}
						}
						else
						{
							menu = "caution_online_network_error";
						}
					}
					else
					{
						menu = "caution_online_network_error";
					}
				}
				else
				{
					menu = "caution_online_proceed";
				}
			}
			else
			{
				/* No Internet Connection */
				in_online_download_list_menu = false; show_debug_message("[scr_draw_caution_online] 'In online download list menu' is set to false");
				
				if (content_type == "character")
				{
					scr_handle_no_network_connection("scr_draw_caution_online", "download_online_search_id");
				}
				else
				if (content_type == "level")
				{
					select_custom_level_menu_open = true;
					show_level_editor_corner_menu = false;
					scr_handle_no_network_connection("scr_draw_caution_online", "level_editor_upload");
				}
			}
		}
		
		if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, 370, 41))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (menu == "caution_online_back")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			if (caution_online_takes_you_back_to == "about_online_level_list")
			{
				information_menu_open = "about"; /* Go back to the about page on information menu when going back from online caution menu */
			}
			menu = caution_online_takes_you_back_to;
		}
		
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "caution_online_back")
			{
				menu = "caution_online_proceed";
			}
			else
			if (menu == "caution_online_do_not_show")
			{
				menu = "caution_online_back";
			}
			else
			if (menu == "caution_online_proceed")
			{
				menu = "caution_online_do_not_show";
			}
			menu_delay = 3;
		}
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "caution_online_back")
			{
				menu = "caution_online_do_not_show";
			}
			else
			if (menu == "caution_online_do_not_show")
			{
				menu = "caution_online_proceed";
			}
			else
			if (menu == "caution_online_proceed")
			{
				menu = "caution_online_back";
			}
			menu_delay = 3;
		}
	}
	
	else
	
	#region /* Caution Online Network Service Unavailable */
	if (menu == "caution_online_network_error")
	{
		var network_service_unavailable_x = display_get_gui_width() * 0.5 - 180;
		var network_service_unavailable_y = display_get_gui_height() - 64;
		
		draw_menu_button(network_service_unavailable_x, network_service_unavailable_y, l10n_text("Back"), "caution_online_network_error", "caution_online_network_error");
		draw_sprite_ext(spr_icon_back, 0, network_service_unavailable_x + 16, network_service_unavailable_y + 21, 1, 1, 0, c_white, 1);
		
		#region /* Tell the player when Network Servie is unavailable */
		if (!global.switch_account_network_service_available)
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 128, l10n_text("Network Service is Unavailable!"), global.default_text_size * 2, c_black, c_white, 1);
			
			if (os_type == os_switch)
			{
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 32, l10n_text("Please connect your account"), global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("With a connected account you can access online play"), global.default_text_size * 0.75, c_black, c_ltgray, 1);
			}
		}
		#endregion /* Tell the player when Network Servie is unavailable END */
		
		#region /* Tell the player when Online Token is invalidated */
		if (!global.online_token_validated)
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 128, l10n_text("Online Token Invalid!"), global.default_text_size * 2, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 192, l10n_text(string(global.online_token_error_message)), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Tell the player when Online Token is invalidated END */
		
		/* If you are still in this network error screen, but there isn't any immediate errors, just make this into a loading screen */
		if (global.switch_account_network_service_available)
		&& (global.online_token_validated)
		{
			scr_draw_loading(1);
		}
		
		if (caution_online_takes_you_to != "")
		&& (global.switch_account_network_service_available) /* In case this variable gets enabled on this error screen, proceed automatically to the correct menu */
		&& (global.online_token_validated) /* Make sure that id token isn't missing too before proceeding automatically */
		&& (scr_online_token_is_valid() == true)
		{
			menu = caution_online_takes_you_to;
		}
		
		if (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, network_service_unavailable_x, network_service_unavailable_y, network_service_unavailable_x + 370, network_service_unavailable_y + 41))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			if (caution_online_takes_you_back_to == "about_online_level_list")
			{
				information_menu_open = "about"; /* Go back to the about page on information menu when going back from online caution menu */
			}
			menu_delay = 3;
			menu = caution_online_takes_you_back_to;
		}
		
	}
	#endregion /* Caution Online Network Service Unavailable END */
	
	else
	if (menu == "server_timeout_retry")
	|| (menu == "server_timeout_check_status")
	|| (menu == "server_timeout_back")
	{
		scr_draw_server_timeout_error();
	}
	
}