function scr_option_account()
{

	#region /* Account Settings */
	if (global.settings_sidebar_menu == "account_settings")
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);

		var get_device_username_text = "";

		if (environment_get_variable("USERNAME") != "")
		{
			get_device_username_text = l10n_text("Get Device Username");
		}
		else
		if (os_type == os_switch)
		{
			get_device_username_text = l10n_text("Get Username");
		}

		var change_username_x = 410;
		var change_username_y = 80;

		if (menu != "get_device_name_ok")
		&& (menu != "get_device_name_cancel")
		{
			draw_set_halign(fa_right);

			scr_draw_text_outlined(display_get_gui_width() - 8, 40, l10n_text("Setup your Account here"), global.default_text_size * 0.9, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(display_get_gui_width() - 8, 40 * 2, l10n_text("This is used for uploading levels"), global.default_text_size * 0.9, c_menu_outline, c_menu_fill, 1);

			draw_set_halign(fa_center);

			if (menu != "change_username_ok")
			&& (menu != "change_username_cancel")
			{
				draw_menu_button(change_username_x, change_username_y, l10n_text("Change Username"), "change_username");

				if (get_device_username_text != "")
				{
					draw_menu_button(change_username_x, change_username_y + 50, get_device_username_text, "get_device_name");
				}

				global.caution_online_do_not_show = draw_menu_checkmark(change_username_x, change_username_y + 100, l10n_text("Do not show online caution screen again"), "caution_online_toggle", global.caution_online_do_not_show, false);

				if (os_type != os_switch)
				{
					global.send_crash_logs = draw_menu_checkmark(change_username_x, change_username_y + 150, l10n_text("Automatically send crash logs to server"), "send_crash_logs_toggle", global.send_crash_logs, true, l10n_text("Automatically Send Crash Logs Description"));
				}

				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_x, change_username_y + 100, change_username_x + 370, change_username_y + 100 + 41))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "caution_online_toggle")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					ini_open(game_save_id + "save_file/config.ini");
					ini_write_string("config", "caution_online_do_not_show", global.caution_online_do_not_show);
					global.online_enabled = global.caution_online_do_not_show;
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				}

				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_x, change_username_y + 150, change_username_x + 370, change_username_y + 150 + 41))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (menu == "send_crash_logs_toggle")
				&& (key_a_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (os_type != os_switch)
					{
						menu_delay = 3;

						ini_open(game_save_id + "save_file/config.ini");
						ini_write_string("config", "send_crash_logs", global.send_crash_logs);
						ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
					}
				}
			}
		}

		#region /* Ask the player if they want to change username into device name, and make sure they understand what this means */
		if (get_device_username_text != "")
		{
			if (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_x, change_username_y + 50, change_username_x + 370, change_username_y + 50 + 40 - 1))
			&& (menu == "get_device_name")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu == "get_device_name")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "get_device_name_cancel";
			}
			if (menu == "get_device_name_ok")
			|| (menu == "get_device_name_cancel")
			{
				draw_set_alpha(0.75);
				draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);

				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - (32 * 3), l10n_text("Are you sure you want to set your username to device name?"));

				if (global.enable_option_for_pc)
				{
					scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - (32 * 2), l10n_text("Your device name is the name displayed here"));
					draw_sprite_ext(spr_arrow_swirly, menu_cursor_index, display_get_gui_width() * 0.5 - 130, display_get_gui_height() * 0.5 - 15, 0.5, 0.5, 0, c_white, 1);
					draw_set_halign(fa_left);
					scr_draw_text_outlined(display_get_gui_width() * 0.5 - 285, display_get_gui_height() * 0.5 + 32, string_replace(game_save_id, environment_get_variable("USERNAME"), "*"));
				}
				var change_username_ok_x = display_get_gui_width() * 0.5 - 185;
				var change_username_ok_y = display_get_gui_height() * 0.5 + (32 * 2);
				var change_username_cancel_y = display_get_gui_height() * 0.5 + (32 * 3) + 11;

				draw_menu_button(change_username_ok_x, change_username_ok_y, l10n_text("Yes"), "get_device_name_ok", "get_device_name_ok");
				draw_menu_button(change_username_ok_x, change_username_cancel_y, l10n_text("No"), "get_device_name_cancel", "get_device_name", c_red);

				if (key_up)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "get_device_name_ok";
				}
				else
				if (key_down)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "get_device_name_cancel";
				}

				if (menu == "get_device_name_ok")
				&& (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_ok_x, change_username_ok_y, change_username_ok_x + 370, change_username_ok_y + 40 - 1))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (key_a_pressed)
				&& (menu == "get_device_name_ok")
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;

					with(instance_create_depth(change_username_x + 128, change_username_y + 50, 0, obj_score_up))
					{
						score_up = "Copied"; /* Show that you have copied the device username */
					}

					if (os_type == os_switch)
					{
						/* Open whichever account was pre-selected by your .nmeta at launch. Try the console's preselected account */
						var current_switch_account = switch_accounts_open_preselected_user();

						if (current_switch_account != -1)
						{
							global.username = switch_accounts_get_nickname(current_switch_account);
						}
						else
						{
							/* If no user, then let the player select themselves, without logging out the user. Force a selection if none was open */
							var selected_switch_account = switch_accounts_select_account(
								true, /* isSinglePlayer */
								false, /* showOnlineCapableOnly */
								false /* canSkip = false, this means the user must pick one */
							);
							global.username = switch_accounts_get_nickname(selected_switch_account);
						}
					}
					else
					{
						global.username = environment_get_variable("USERNAME");
					}

					/* Save username to config file */
					ini_open(game_save_id + "save_file/config.ini");
					ini_write_string("config", "username", string(global.username));
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

					menu = "get_device_name";
				}

				if (menu == "get_device_name_cancel")
				&& (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_released(mb_left))
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_ok_x, change_username_cancel_y, change_username_ok_x + 370, change_username_cancel_y + 40 - 1))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (key_a_pressed)
				&& (menu == "get_device_name_cancel")
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (key_b_pressed)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					menu = "get_device_name";
				}

			}
		}
		#endregion /* Ask the player if they want to change username into device name, and make sure they understand what this means END */

		#region /* Click Change username */
		if (menu == "change_username")
		{
			if (global.controls_used_for_navigation == "mouse")
			&& (mouse_check_button_released(mb_left))
			&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), change_username_x, change_username_y, change_username_x + 370, change_username_y + 40 - 1))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				input_key = true;
				keyboard_string = string(global.username);
				menu = "change_username_ok";
			}
		}
		#endregion /* Click Change username END */

		#region /* Draw the username text above everything */
		if (menu != "get_device_name_ok")
		&& (menu != "get_device_name_cancel")
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			if (global.username != "")
			{
				scr_draw_text_outlined(change_username_x, change_username_y - 40, l10n_text("Account name") + ": " + string(global.username), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			else
			{
				scr_draw_text_outlined(change_username_x, change_username_y - 40, l10n_text("No username!"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
				scr_draw_text_outlined(change_username_x, change_username_y - 40, l10n_text("No username!"), global.default_text_size, c_menu_outline, c_red, scr_wave(0, 1, 1, 0));
			}
		}
		#endregion /* Draw the username text above everything END */

		#region /* Type username */
		if (menu == "change_username_ok")
		|| (menu == "change_username_cancel")
		{
			global.username = scr_draw_name_input_screen(global.username, 32, c_white, 0.9, true, change_username_x + 185, change_username_y + 21, "change_username_ok", "change_username_cancel", false, true, false);

			if (global.clicking_ok_input_screen
			|| global.clicking_cancel_input_screen)
			&& (menu_delay == 0
			&& menu_joystick_delay == 0)
			{
				/* Save username to config file */
				ini_open(game_save_id + "save_file/config.ini");
				ini_write_string("config", "username", string(global.username));
				ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

				menu_delay = 3;
				input_key = false;
				menu = "change_username";
			}
		}
		#endregion /* Type username END */

		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!input_key)
		{
			menu_delay = 3;

			if (menu == "change_username")
			{
				if (os_type != os_switch)
				{
					menu = "send_crash_logs_toggle";
				}
				else
				{
					menu = "caution_online_toggle";
				}
			}
			else
			if (menu == "get_device_name")
			{
				menu = "change_username";
			}
			else
			if (menu == "caution_online_toggle")
			{
				if (get_device_username_text != "")
				{
					menu = "get_device_name";
				}
				else
				{
					menu = "change_username";
				}
			}
			else
			if (menu == "send_crash_logs_toggle")
			{
				menu = "caution_online_toggle";
			}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!input_key)
		{
			menu_delay = 3;
			if (menu == "change_username")
			{
				if (get_device_username_text != "")
				{
					menu = "get_device_name";
				}
				else
				{
					menu = "caution_online_toggle";
				}
			}
			else
			if (menu == "get_device_name")
			{
				menu = "caution_online_toggle";
			}
			else
			if (menu == "caution_online_toggle")
			{
				if (os_type != os_switch)
				{
					menu = "send_crash_logs_toggle";
				}
				else
				{
					menu = "change_username";
				}
			}
			else
			if (menu == "send_crash_logs_toggle")
			{
				menu = "change_username";
			}
		}
	}
	#endregion /* Account Settings END */

}
