/// @function scr_draw_network_error_menu()
function scr_draw_network_error_menu()
{
	if (menu == "network_error")
	|| (menu == "network_error_copy_error_code")
	|| (menu == "network_error_main_menu")
	{
		if (scr_draw_network_request_modal())
		{
			return;
		}

		/* Get common dimensions and mouse position */
		var window_width    = display_get_gui_width();
		var window_height    = display_get_gui_height();
		var center_x        = window_width * 0.5;
		var center_y        = window_height * 0.5;
		var mouse_get_x        = device_mouse_x_to_gui(0);
		var mouse_get_y        = device_mouse_y_to_gui(0);
		var fixed_player = 1;

		/* Handle button activation to avoid repetitive error pop-ups */
		var can_activate = (menu_delay == 0 && menu_joystick_delay == 0);
		var retry_clicked = false;
		var retry_successful = false;
		var copy_clicked = false;
		var mainmenu_clicked = false;
		var passive_network_connected = scr_get_cached_passive_network_status(false);

		/* Calculate positions for the buttons */
		var retry_button_y = center_y + 100 + 20;
		var copy_error_code_button_y = center_y + 100 + 20 + 50;
		var mainmenu_button_y = center_y + 100 + 20 + 50 + 50;

		if (!global.enable_option_for_pc)
		{
			mainmenu_button_y = center_y + 100 + 20 + 50;
		}

		var retry_x    = center_x - 185; /* Top button: Retry */
		var copy_error_code_x = center_x - 185; /* Middle button: Copy Error Code */
		var mainmenu_x = center_x - 185; /* Bottom button: Main Menu */

		/* Add a semi-transparent dark overlay */
		draw_set_alpha(0.75);
		draw_rectangle_color(0, 0, window_width, window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);

		/* Draw Main Menu Button (Offline Mode) */
		draw_menu_button(mainmenu_x, mainmenu_button_y, l10n_text("Main Menu"), "network_error_main_menu", "network_error_main_menu");
		draw_sprite_ext(spr_icon_back, 0, mainmenu_x + 16, mainmenu_button_y + 21, 1, 1, 0, c_white, 1);

		/* Determine hover state for each button (assuming button size: width 360, height 84) */
		var retry_hover    = point_in_rectangle(mouse_get_x, mouse_get_y, retry_x, retry_button_y, retry_x + 370, retry_button_y + 42);
		var copy_hover = point_in_rectangle(mouse_get_x, mouse_get_y, copy_error_code_x, copy_error_code_button_y, copy_error_code_x + 370, copy_error_code_button_y + 42);
		var mainmenu_hover = point_in_rectangle(mouse_get_x, mouse_get_y, mainmenu_x, mainmenu_button_y, mainmenu_x + 370, mainmenu_button_y + 42);

		if (can_activate)
		{
			if (mainmenu_hover
			&& mouse_check_button_released(mb_left))
			{
				mainmenu_clicked = true;
			}

			/* Keyboard/Gamepad activation using a selected button indicator */
			if (global.controls_used_for_navigation == "keyboard"
			|| global.controls_used_for_navigation == "gamepad")
			{
				if (key_back_pressed)
				{
					mainmenu_clicked = true;
				}
				else
				if (key_accept_pressed)
				&& (menu == "network_error_main_menu")
				{
					mainmenu_clicked = true;
				}
			}
		}

		if (global.online_token_request != -1)
		&& (!global.online_token_validated)
		{
			scr_draw_loading(1,,,l10n_text("Looking for Token"));

			menu = "network_error_main_menu";
		}
		else
		if (global.online_enabled)
		&& (global.online_token_validated)
		&& (passive_network_connected)
		&& (caution_online_takes_you_to != "")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			scr_finish_prepared_user_online_flow("scr_draw_network_error_menu_auto");
		}
		else
		{
			static network_error_debug_toggle = false;

			if (can_activate)
			{
				/* Mouse-based activation */
				if (retry_hover
				&& mouse_check_button_released(mb_left))
				{
					retry_clicked = true;
				}

				if (copy_hover
				&& mouse_check_button_released(mb_left))
				&& (global.enable_option_for_pc)
				{
					copy_clicked = true;
				}

				/* Keyboard/Gamepad activation using a selected button indicator */
				if (global.controls_used_for_navigation == "keyboard"
				|| global.controls_used_for_navigation == "gamepad")
				{
					if (key_accept_pressed)
					{
						if (menu == "network_error")
						{
							retry_clicked = true;
						}
						else
						if (menu == "network_error_copy_error_code")
						&& (global.enable_option_for_pc)
						{
							copy_clicked = true;
						}
					}
				}
			}

			in_settings = false;

			#region /* Extra debug messages in top-left corner of screen */
			/* First build up your text in a variable */
			var debug_text = "";

			/* Time when network error happened */
			if (variable_global_exists("online_last_successful_check"))
			&& (variable_instance_exists(self, "time_of_network_error"))
			&& (time_of_network_error != "")
			{
				debug_text += l10n_text("Time of network error") + ": "
					+ string(time_of_network_error)
					+ "\n";
			}

			/* Last Successful Check */
			if (variable_global_exists("online_last_successful_check"))
			&& (global.online_last_successful_check != "")
			{
				debug_text += l10n_text("Last Successful Check") + ": "
					+ string(global.online_last_successful_check)
					+ "\n";
			}

			/* Retry Attempts */
			if (variable_global_exists("online_retry_attempts"))
			{
				debug_text += l10n_text("Retry Attempts") + ": "
					+ string(global.online_retry_attempts)
					+ "\n";
			}

			/* Separator Line */
			debug_text += "\n";

			/* Token source */
			if (variable_global_exists("online_token_source"))
			&& (global.online_token_source != "")
			{
				debug_text += l10n_text("Token Source") + ": " + string(global.online_token_source) + "\n";
			}

			///* Environment */
			//if (variable_global_exists("online_environment")
			//&& global.online_environment != "")
			//{
			//    debug_text += l10n_text("Environment") + ": " + global.online_environment + "\n";
			//}

			/* Token Present */
			if (variable_global_exists("online_token_present"))
			&& (!global.online_token_present)
			{
				debug_text += l10n_text("Token Present") + ": "
					+ (global.online_token_present ? "Yes" : "No")
					+ "\n";
			}

			/* Current Attempt Result */
			if (variable_global_exists("online_current_attempt_result")
			&& global.online_current_attempt_result != "" )
			{
				debug_text += l10n_text("Attempt Result") + ": "
					+ string(global.online_current_attempt_result)
					+ "\n";
			}

			/* Then draw it once */
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			scr_draw_text_outlined(
				8, 16,
				string(debug_text),
				global.default_text_size * 0.75,
				c_black, c_white, 1
			);
			#endregion /* Extra debug messages in top-left corner of screen END */

			/* Determine the error message based on connection status */
			var error_text = "";

			if (!passive_network_connected)
			{
				error_text += l10n_text("No Internet Connection Detected") + "\n";
			}

			if (global.online_token_expired)
			{
				error_text += l10n_text("Online Token Expired") + "\n";
			}
			else
			if (!global.online_token_validated)
			{
				error_text += l10n_text("Invalid Online Token") + "\n";
			}

			if (!global.online_enabled)
			{
				error_text += l10n_text("Invalid Online Credentials") + "\n";
			}

			if (global.online_token_error_message != "")
			{
				error_text += l10n_text(global.online_token_error_message) + "\n";
			}

			if (error_text == "")
			{
				error_text += l10n_text("Network Error Encountered") + "\n";
			}

			/* Display Error Code */
			if (os_type != os_switch)
			&& (variable_global_exists("online_error_code"))
			&& (global.online_error_code != "")
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_top);
				scr_draw_text_outlined(center_x, center_y - 200, l10n_text("Error Code") + ": " + string(global.online_error_code),
										global.default_text_size * 1.5, c_black, c_white, 1);
			}

			/* Display the error message and instructions */
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			scr_draw_text_outlined(center_x, center_y + 100 - 120, string(error_text),
									global.default_text_size * 1.1, c_black, c_white, 1);

			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(center_x, center_y + 100 - 70, l10n_text("Please check your network settings or credentials"),
									global.default_text_size, c_black, c_white, 1);

			if (global.debug_force_network_error)
			{
				scr_draw_text_outlined(center_x, center_y + 100 - 20, "Debug Force Network Error is Enabled",
										global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(center_x, center_y + 100 - 20, "Debug Force Network Error is Enabled",
										global.default_text_size, c_black, c_red, scr_wave(1, 0, 1));
			}

			/* Draw Retry Button (with different styles based on control scheme and hover) */
			draw_menu_button(retry_x, retry_button_y, l10n_text("Retry"), "network_error", "network_error");

			/* Draw Copy to Clipboard Button */
			if (global.enable_option_for_pc)
			{
				draw_menu_button(copy_error_code_x, copy_error_code_button_y, l10n_text("Copy Error Code to Clipboard"), "network_error_copy_error_code", "network_error_copy_error_code");
			}

			#region /* Network Error Navigation */
			if (key_up)
			&& (!key_down)
			&& (can_activate)
			{
				menu_delay = 3;

				if (menu == "network_error")
				{
					menu = "network_error_main_menu";
				}
				else
				if (menu == "network_error_copy_error_code")
				{
					menu = "network_error";
				}
				else
				if (menu == "network_error_main_menu")
				{
					if (global.enable_option_for_pc)
					{
						menu = "network_error_copy_error_code";
					}
					else
					{
						menu = "network_error";
					}
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (can_activate)
			{
				menu_delay = 3;

				if (menu == "network_error")
				{
					if (global.enable_option_for_pc)
					{
						menu = "network_error_copy_error_code";
					}
					else
					{
						menu = "network_error_main_menu";
					}
				}
				else
				if (menu == "network_error_copy_error_code")
				{
					menu = "network_error_main_menu";
				}
				else
				if (menu == "network_error_main_menu")
				{
					menu = "network_error";
				}
			}
			#endregion /* Network Error Navigation END */

		}

		#region /* Process button actions */
		if (retry_clicked)
		{
			menu_delay = 3;
			global.online_enabled = true;

			if (!variable_global_exists("online_retry_attempts"))
			{
				global.online_retry_attempts = 0;
			}

			global.online_retry_attempts++;
			scr_nifm_log_context("INFO", "retry_accepted",
				"retry_attempts=" + string(global.online_retry_attempts)
				+ " selected_menu=" + string(menu)
				+ " action=submit_active_network_request_if_needed");

			#region /* Recheck connection: if restored, proceed to online features; otherwise, remain on error screen */
			if (global.online_enabled
			&& global.online_token_validated
			&& scr_check_network_connection(network_connect_passive))
			{
				scr_nifm_log_context("INFO", "retry_passive_check_succeeded",
					"retry_attempts=" + string(global.online_retry_attempts));
				retry_successful = true;
			}
			else
			{
				if (scr_check_network_connection(network_connect_active, true))
				{
					retry_successful = true;
				}
				else
				{
					retry_successful = false;
					menu = "network_error";
					if (scr_get_active_network_request_pending_raw())
					{
						scr_nifm_log_context("INFO", "retry_waiting_for_nintendo_nifm_result",
							"retry_attempts=" + string(global.online_retry_attempts)
							+ " in_game_network_error_visible=false");
					}
					else
					{
						scr_nifm_log_context("WARN", "retry_failed_without_pending_request",
							"retry_attempts=" + string(global.online_retry_attempts)
							+ " in_game_network_error_visible=true");
					}
					/* Optionally prompt for credentials or open network settings: */
					/* scr_open_network_settings(); */
					/* Stay on error screen until the connection is fixed */
				}
			}
			#endregion /* Recheck connection: if restored, proceed to online features; otherwise, remain on error screen END */

		}
		else
		if (copy_clicked)
		&& (global.enable_option_for_pc)
		{
			menu_delay = 3;

			clipboard_set_text(global.online_error_code);

			with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
			{
				above_gui = true;
				score_up = "Copied"; /* Show that you have copied the error code */
			}

		}
		else
		if (mainmenu_clicked)
		|| (global.switch_login_cancelled)
		{
			scr_nifm_log_context("INFO", "network_error_back_to_offline_menu",
				"mainmenu_clicked=" + scr_nifm_bool_string(mainmenu_clicked)
				+ " switch_login_cancelled=" + scr_nifm_bool_string(global.switch_login_cancelled));
			scr_return_to_stable_offline_menu("scr_draw_network_error_menu_main_menu");
		}

		if (retry_successful)
		{
			scr_nifm_log_context("INFO", "retry_successful_resume_online_flow",
				"target_menu=" + string(caution_online_takes_you_to)
				+ " retry_attempts=" + string(global.online_retry_attempts));
			menu_delay = 3;

			if (caution_online_takes_you_to == "")
			{
				caution_online_takes_you_to = caution_online_takes_you_back_to;
			}

			scr_finish_prepared_user_online_flow("scr_draw_network_error_menu_retry");
		}
		#endregion /* Process button actions END */

	}
}
