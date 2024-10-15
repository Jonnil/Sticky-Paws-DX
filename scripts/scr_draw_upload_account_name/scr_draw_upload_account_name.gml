function scr_draw_upload_account_name(what_kind_of_file = "level")
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	#region /* Ask the player if they want to enter a account username before taking them to the enter username screen */
	/* On certain systems where they need to use a virtual keyboard, you need to explain what the player is expected to do before the virtual keyboard shows up */
	/* Otherwise the virtual keyboard will come up without explanation */
	if (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_options")
	|| (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_ok")
	|| (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel")
	{
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var change_username_x = get_window_width * 0.5;
		var change_username_y = get_window_height * 0.5;
		
		#region /* Draw the question text above everything */
		scr_draw_text_outlined(change_username_x, change_username_y - (42 * 3), l10n_text("You need a username before uploading"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(change_username_x, change_username_y - (42 * 2), l10n_text("Do you want to enter a username right now?"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		scr_draw_text_outlined(change_username_x, change_username_y - (42 * 1), l10n_text("You can enter a username at any time in options"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		#endregion /* Draw the question text above everything END */
		
		var button_options_y = change_username_y + 21 - 42;
		var button_ok_y = change_username_y + 21 + 42;
		var button_cancel_y = change_username_y + 21 + 42 + 42;
		
		draw_menu_button(change_username_x - 185, button_options_y, l10n_text("Account"), "question_upload_" + string(what_kind_of_file) + "_edit_username_options", "question_upload_" + string(what_kind_of_file) + "_edit_username_options");
		draw_sprite_ext(spr_icon_person, 0, change_username_x - 185 + 20, button_options_y + 20, 1, 1, 0, c_white, 1);
		draw_menu_button(change_username_x - 185, button_ok_y, l10n_text("OK"), "question_upload_" + string(what_kind_of_file) + "_edit_username_ok", "question_upload_" + string(what_kind_of_file) + "_edit_username_ok");
		draw_menu_button(change_username_x - 185, button_cancel_y, l10n_text("Cancel"), "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel", "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel");
		
		if (key_up && menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_options")
			{
				menu = "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel";
			}
			else
			if (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_ok")
			{
				menu = "question_upload_" + string(what_kind_of_file) + "_edit_username_options";
			}
			else
			if (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel")
			{
				menu = "question_upload_" + string(what_kind_of_file) + "_edit_username_ok";
			}
		}
		else
		if (key_down && menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			if (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_options")
			{
				menu = "question_upload_" + string(what_kind_of_file) + "_edit_username_ok";
			}
			else
			if (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_ok")
			{
				menu = "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel";
			}
			else
			if (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel")
			{
				menu = "question_upload_" + string(what_kind_of_file) + "_edit_username_options";
			}
		}
		
		#region /* Press Account Options */
		if (key_a_pressed)
		&& (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_options")
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_x - 185, button_options_y, change_username_x - 185 + 370, button_options_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		{
			if (variable_instance_exists(self, "open_sub_menu"))
			{
				open_sub_menu = false;
			}
			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
			
			keyboard_string = "";
			
			can_input_level_name = false;
			can_navigate = true;
			select_custom_level_menu_open = false;
			level_editor_template_select = false;
			
			menu_cursor_y_position = 0; /* Reset so the scrolling menus are back to 0 */
			in_settings = true;
			can_navigate_settings_sidebar = false;
			global.settings_sidebar_menu = "account_settings";
			menu = "change_username";
			menu_delay = 3;
			scr_load_storage_variables();
		}
		#endregion /* Press Account Options END */
		
		#region /* Press OK */
		if (key_a_pressed)
		&& (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_ok")
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_x - 185, button_ok_y, change_username_x - 185 + 370, button_ok_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		{
			keyboard_string = "";
			menu = "upload_" + string(what_kind_of_file) + "_edit_username_ok";
			menu_delay = 3;
		}
		#endregion /* Press OK END */
		
		else
		
		#region /* Press Cancel */
		if (key_a_pressed)
		&& (menu == "question_upload_" + string(what_kind_of_file) + "_edit_username_cancel")
		|| (key_b_pressed)
		|| (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_x - 185, button_cancel_y, change_username_x - 185 + 370, button_cancel_y + 42))
		&& (global.controls_used_for_navigation == "mouse")
		&& (mouse_check_button_released(mb_left))
		{
			keyboard_string = "";
			menu_delay = 3;
			input_key = false;
			if (what_kind_of_file == "character")
			{
				menu = "click_upload_character"; /* Go back to the upload character button */
			}
			else
			if (what_kind_of_file == "level")
			{
				if (variable_instance_exists(self, "open_sub_menu"))
				{
					open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
				}
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "level_editor_upload"; /* Go back to the upload level button */
			}
		}
		#endregion /* Press Cancel END */
		
	}
	#endregion /* Ask the player if they want to enter a account username before taking them to the enter username screen END */
	
	#region /* Draw enter username screen */
	if (menu == "upload_" + string(what_kind_of_file) + "_edit_username_ok")
	|| (menu == "upload_" + string(what_kind_of_file) + "_edit_username_cancel")
	{
		draw_set_alpha(0.9);
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var change_username_x = get_window_width * 0.5;
		var change_username_y = get_window_height * 0.5;
		
		#region /* Change username */
		global.username = scr_draw_name_input_screen(global.username, 32, c_white, 0.9, false, change_username_x - 185 + 185, change_username_y + 21, "upload_" + string(what_kind_of_file) + "_edit_username_ok", "upload_" + string(what_kind_of_file) + "_edit_username_cancel", false, true, false);
		
		#region /* Pressing Change Username OK */
		if (global.clicking_ok_input_screen && global.username != "")
		{
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_string("config", "username", string(global.username)); /* Save username to config file */
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				
			menu_delay = 3;
			input_key = false;
			if (os_is_network_connected())
			{
				scr_switch_update_online_status();
				
				if (global.switch_logged_in)
				{
					if (global.switch_account_network_service_available) /* Need to make sure that network service is available before going online */
					{
						if (global.online_token_validated) /* Need to make sure that online token is validated before going online */
						{
							if (what_kind_of_file == "character")
							{
								menu = "uploading_character"; /* Go to uploading character loading screen */
							}
							else
							if (what_kind_of_file == "level")
							{
								ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
								var short_level_minute = ini_read_real("rank", "rank_timeattack_minute", 0);
								ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
								
								#region /* Tell the player before uploading, if the level they clear checked was too short or not */
								if (global.enable_level_length_target)
								&& (short_level_minute < global.target_length_minutes)
								{
									menu = "level_length_recommendation_back";
								}
								else
								{
									menu = "upload_edit_name"; /* Go to edit name, description, and tags menu */
								}
								#endregion /* Tell the player before uploading, if the level they clear checked was too short or not END */
								
							}
						}
						else
						{
							menu = "caution_online_token_invalidated";
						}
					}
					else
					{
						menu = "caution_online_network_service_unavailable";
					}
				}
				else
				{
					menu_delay = 3;
					menu = "upload_" + string(what_kind_of_file) + "_edit_username_ok";
				}
			}
			else
			{
				menu = "no_internet_" + string(what_kind_of_file);
			}
		}
		#endregion /* Pressing Change Username OK END */
		
		else
		
		#region /* Pressing Change Username Cancel */
		if (global.clicking_cancel_input_screen)
		{
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_string("config", "username", ""); /* Save username as blank to config file, then go back */
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			global.username = "";
			keyboard_string = "";
			menu_delay = 3;
			input_key = false;
			if (what_kind_of_file == "character")
			{
				menu = "click_upload_character"; /* Go back to the upload character button */
			}
			else
			if (what_kind_of_file == "level")
			{
				if (variable_instance_exists(self, "open_sub_menu"))
				{
					open_sub_menu = true; /* Open the sub menu when not in uploading level menu */
				}
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "level_editor_upload"; /* Go back to the upload level button */
			}
		}
		#endregion /* Pressing Change Username Cancel END */
		
		#region /* Draw the username text above everything */
		if (global.username != "")
		{
			scr_draw_text_outlined(change_username_x, 20 + (40 * 4), l10n_text("Account name") + ": " + string(global.username), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			scr_draw_text_outlined(change_username_x, 20 + (40 * 4), l10n_text("No username!"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(change_username_x, 20 + (40 * 4), l10n_text("No username!"), global.default_text_size, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
		}
		#endregion /* Draw the username text above everything END */
		
		#endregion /* Change username END */
		
	}
	#endregion /* Draw enter username screen END */
	
}