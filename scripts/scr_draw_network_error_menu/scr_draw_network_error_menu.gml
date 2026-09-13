/// @function scr_draw_network_error_menu()
function scr_draw_network_error_menu()
{
	if (os_type != os_switch)
	&& (string_pos("network_error_details_", string(menu)) == 1)
	{
		scr_debug_bool_globals_browser(true);
		return;
	}

	if (menu == "network_error")
	|| (menu == "network_error_copy_error_code")
	|| (menu == "network_error_details")
	|| (menu == "network_error_main_menu")
	{
		var debug_preview = variable_global_exists("nwt_debug_preview_active")
			&& global.nwt_debug_preview_active;
		if (!debug_preview && scr_draw_network_request_modal())
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
		var details_clicked = false;
		var mainmenu_clicked = false;
		var pc_details = (os_type != os_switch) && global.enable_option_for_pc;
		var passive_network_connected = scr_get_cached_passive_network_status(false);

		/* Calculate positions for the buttons */
		var retry_button_y = center_y + 100 + 20;
		var copy_error_code_button_y = center_y + 100 + 20 + 50;
		var details_button_y = center_y + 100 + 20 + 50 + 50;
		var mainmenu_button_y = pc_details ? details_button_y + 50 : details_button_y;

		if (!pc_details)
		{
			mainmenu_button_y = center_y + 100 + 20 + 50;
		}

		var retry_x    = center_x - 185; /* Top button: Retry */
		var copy_error_code_x = center_x - 185; /* Middle button: Copy Error Code */
		var details_x = center_x - 185;
		var mainmenu_button_width = debug_preview ? 480 : 370;
		var mainmenu_x = center_x - mainmenu_button_width * 0.5; /* Bottom button: Main Menu */

		/* Add a semi-transparent dark overlay */
		draw_set_alpha(0.75);
		draw_rectangle_color(0, 0, window_width, window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);

		/* Draw Main Menu Button (Offline Mode) */
		draw_menu_button(mainmenu_x, mainmenu_button_y, debug_preview ? "Back to Debug Settings" : l10n_text("Main Menu"), "network_error_main_menu", "network_error_main_menu", c_lime, 1, mainmenu_button_width);
		draw_sprite_ext(spr_icon_back, 0, mainmenu_x + 24, mainmenu_button_y + 21, 1, 1, 0, c_white, 1);

		/* Determine hover state for each button (assuming button size: width 360, height 84) */
		var retry_hover    = point_in_rectangle(mouse_get_x, mouse_get_y, retry_x, retry_button_y, retry_x + 370, retry_button_y + 42);
		var copy_hover = point_in_rectangle(mouse_get_x, mouse_get_y, copy_error_code_x, copy_error_code_button_y, copy_error_code_x + 370, copy_error_code_button_y + 42);
		var details_hover = point_in_rectangle(mouse_get_x, mouse_get_y, details_x, details_button_y, details_x + 370, details_button_y + 42);
		var mainmenu_hover = point_in_rectangle(mouse_get_x, mouse_get_y, mainmenu_x, mainmenu_button_y, mainmenu_x + mainmenu_button_width, mainmenu_button_y + 42);

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

		if (!debug_preview)
		&& (global.online_token_request != -1)
		&& (!global.online_token_validated)
		{
			scr_draw_loading(1,,,l10n_text("Looking for Token"));

			menu = "network_error_main_menu";
		}
		else
		if (!debug_preview)
		&& (global.online_enabled)
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
				&& (pc_details)
				{
					copy_clicked = true;
				}

				if (details_hover && mouse_check_button_released(mb_left) && pc_details)
				{
					details_clicked = true;
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
						&& (pc_details)
						{
							copy_clicked = true;
						}
						else
					if (menu == "network_error_details" && pc_details)
						{
							details_clicked = true;
						}
					}
				}
			}

			in_settings = false;

			#region /* Extra debug messages in top-left corner of screen */
			if (os_type != os_switch)
			{
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

			/* Token details only apply to Switch account validation. */
			if (os_type == os_switch)
			&& (variable_global_exists("online_token_source"))
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

			/* A transport failure clears token state, so do not present it as a token diagnosis. */
			if (os_type == os_switch)
			&& ((global.online_failure_kind == "token_rejected") || (global.online_failure_kind == "account"))
			{
				debug_text += l10n_text("Token Present") + ": "
					+ (global.online_token_present ? "Yes" : "No")
					+ "\n";
			}

			if (global.online_failure_kind != "")
			{
				debug_text += "Failure Kind: " + string(global.online_failure_kind) + "\n";
				debug_text += "Failure Origin: " + string(global.online_failure_origin) + "\n";
			}

			if (global.online_failure_http_status >= 0)
			{
				debug_text += "HTTP Status: " + string(global.online_failure_http_status) + "\n";
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
			}
			#endregion /* Extra debug messages in top-left corner of screen END */

			/* Show the recorded cause, not the flags cleared while handling that cause. */
			var error_text = "";
			var advice_text = l10n_text("Please try again later");

			switch (global.online_failure_kind)
			{
				case "network":
					error_text = l10n_text("No Internet Connection Detected");
					advice_text = l10n_text("Please check your network settings or credentials");
					break;
				case "http_transport":
					error_text = l10n_text("HTTP request exception");
					break;
				case "http_response":
					error_text = (os_type != os_switch && global.online_failure_http_status >= 100)
						? "Server returned HTTP " + string(global.online_failure_http_status)
						: l10n_text("Invalid server response");
					break;
				case "timeout":
					error_text = l10n_text("Request timed out");
					break;
				case "token_rejected":
					error_text = global.online_token_expired
						? l10n_text("Online Token Expired")
						: l10n_text("Invalid Online Token");
					advice_text = l10n_text("Please check your network settings or credentials");
					break;
				case "account":
					switch (global.online_failure_origin)
					{
						case "switch_login_failed":
							error_text = l10n_text("Account login failed");
							break;
						case "switch_token_retrieval_failed":
							error_text = l10n_text("Could not obtain online token");
							break;
						default:
							error_text = l10n_text("Network Service is Unavailable!");
							break;
					}
					advice_text = l10n_text("Please check your network settings or credentials");
					break;
				default:
					error_text = l10n_text("Network Error Encountered");
					break;
			}

			/* Display Error Code */
			if (variable_global_exists("online_error_code"))
			&& (global.online_error_code != "")
			&& (os_type != os_switch)
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
			scr_draw_text_outlined(center_x, center_y + 100 - 70, advice_text,
									global.default_text_size, c_black, c_white, 1);

			if (global.debug_force_network_error && os_type != os_switch && !debug_preview)
			{
				scr_draw_text_outlined(center_x, center_y + 100 - 20, "Debug Force Network Error is Enabled",
										global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(center_x, center_y + 100 - 20, "Debug Force Network Error is Enabled",
										global.default_text_size, c_black, c_red, scr_wave(1, 0, 1));
			}

			/* Draw Retry Button (with different styles based on control scheme and hover) */
			draw_menu_button(retry_x, retry_button_y, l10n_text("Retry"), "network_error", "network_error");

			/* Draw Copy to Clipboard Button */
			if (pc_details)
			{
				draw_menu_button(copy_error_code_x, copy_error_code_button_y, l10n_text("Copy Error Code to Clipboard"), "network_error_copy_error_code", "network_error_copy_error_code");
			}
			if (pc_details)
			{
				draw_menu_button(details_x, details_button_y, "BoolGlobals / NWT Details", "network_error_details", "network_error_details");
			}
			if (debug_preview)
			{
				scr_draw_text_outlined(center_x, center_y + 100 - 20, "Preview mode: Retry is disabled", global.default_text_size, c_black, c_yellow, 1);
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
				if (menu == "network_error_details")
				{
					menu = "network_error_copy_error_code";
				}
				else
				if (menu == "network_error_main_menu")
				{
					if (pc_details)
					{
						menu = "network_error_details";
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
					if (pc_details)
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
					menu = pc_details ? "network_error_details" : "network_error_main_menu";
				}
				else
				if (menu == "network_error_details")
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
		if (retry_clicked && !debug_preview)
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
				+ " action=begin_shared_online_flow");

			#region /* Recheck connection: if restored, proceed to online features; otherwise, remain on error screen */
			if (caution_online_takes_you_to == "")
			{
				caution_online_takes_you_to = caution_online_takes_you_back_to;
			}

			var retry_fallback_menu = caution_online_takes_you_back_to;

			if (retry_fallback_menu == "")
			{
				retry_fallback_menu = caution_online_takes_you_to;
			}

			var retry_content_type = variable_instance_exists(self, "content_type")
				? content_type
				: "";

			if (caution_online_takes_you_to != "")
			{
				scr_clear_online_failure();
			}

			if (caution_online_takes_you_to == "")
			{
				retry_successful = false;
				menu = "network_error";
				scr_nifm_log_context("WARN", "retry_missing_online_target",
					"retry_attempts=" + string(global.online_retry_attempts)
					+ " in_game_network_error_visible=true");
			}
			else
			if (scr_begin_user_online_flow(caution_online_takes_you_to, retry_fallback_menu, retry_content_type, "scr_draw_network_error_menu_retry"))
			{
				retry_successful = true;
			}
			else
			{
				retry_successful = false;

				if (scr_get_active_network_request_pending_raw())
				{
					scr_nifm_log_context("INFO", "retry_waiting_for_network_request_result",
						"retry_attempts=" + string(global.online_retry_attempts)
						+ " in_game_network_error_visible=false");
				}
				else
				if (global.online_token_request != -1)
				&& (!global.online_token_validated)
				{
					scr_nifm_log_context("INFO", "retry_waiting_for_token_validation",
						"retry_attempts=" + string(global.online_retry_attempts)
						+ " in_game_network_error_visible=false");
				}
				else
				{
					menu = "network_error";
					scr_nifm_log_context("WARN", "retry_failed_after_shared_online_flow",
						"retry_attempts=" + string(global.online_retry_attempts)
						+ " in_game_network_error_visible=true");
				}
			}
			#endregion /* Recheck connection: if restored, proceed to online features; otherwise, remain on error screen END */

		}
		else
		if (details_clicked && pc_details)
		{
			debug_bool_browser_mode = "error";
			debug_bool_browser_page = 0;
			debug_bool_browser_code = string(global.online_error_code);
			debug_bool_browser_decoded = undefined;
			debug_bool_browser_message = "";
			menu = "network_error_details_back";
			menu_delay = 3;
		}
		else
		if (copy_clicked)
		&& (pc_details)
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
			if (debug_preview)
			{
				scr_debug_finish_network_error_preview();
			}
			else
			{
				scr_return_to_stable_offline_menu("scr_draw_network_error_menu_main_menu");
			}
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
