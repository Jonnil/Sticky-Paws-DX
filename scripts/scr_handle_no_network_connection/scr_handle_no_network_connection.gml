/// @function scr_handle_no_network_connection()
/// @description Handles cases where there is no network connection.
function scr_handle_no_network_connection(what_script = "scr_handle_no_network_connection", retry_this_menu = "")
{
	/* Log the current state and incoming parameters */
	show_debug_message("[scr_handle_no_network_connection] -> [" + string(what_script) + "] Called with retry_this_menu: " + string(retry_this_menu)
					   + ", menu: " + string(menu)
					   + ", caution_online_takes_you_back_to: " + string(caution_online_takes_you_back_to));

	/* Capture current delay values and network check result */
	var net_check = false;

	if (global.online_enabled
	&& global.online_token_validated
	&& scr_check_network_connection(network_connect_passive))
	{
		net_check = true;
	}

	show_debug_message("[scr_handle_no_network_connection] menu_delay: " + string(menu_delay) + ", menu_joystick_delay: " + string(menu_joystick_delay));
	show_debug_message("[scr_handle_no_network_connection] scr_check_network_connection(network_connect_passive): " + string(net_check));

	/* If network is available, proceed to online caution screen */
	if (net_check)
	{
		show_debug_message("[scr_handle_no_network_connection] Network is available. Proceeding to caution_online_takes_you_to: " + string(caution_online_takes_you_to) + "\n");
		menu_delay = 3;
		menu = caution_online_takes_you_to;
		return;
	}

	var fallback_menu = retry_this_menu;

	if (fallback_menu == "")
	{
		fallback_menu = caution_online_takes_you_back_to;
	}

	if (fallback_menu == "")
	{
		fallback_menu = menu;
	}

	/* If a retry menu is provided, update the fallback menu */
	if (retry_this_menu != "")
	{
		show_debug_message("[scr_handle_no_network_connection] Updating fallback menu: setting caution_online_takes_you_back_to from "
						   + string(caution_online_takes_you_back_to) + " to " + string(retry_this_menu));

		caution_online_takes_you_back_to = retry_this_menu;
	}

	if (os_type == os_switch)
	&& (scr_is_active_network_request_pending())
	{
		scr_nifm_log_context("INFO", "nifm_result_pending_skip_in_game_error",
			"caller=" + string(what_script)
			+ " retry_menu=" + string(retry_this_menu)
			+ " in_game_network_error_visible=false");

		if (variable_instance_exists(self, "menu_delay"))
		{
			menu_delay = max(menu_delay, 3);
		}

		return;
	}

	if (os_type == os_switch)
	&& (global.switch_login_cancelled)
	{
		show_debug_message("[scr_handle_no_network_connection] Switch account prompt was cancelled. Restoring previous menu silently.");

		menu_delay = 3;
		can_navigate = true;
		in_online_download_list_menu = false;
		in_online_download_list_load_menu = false;
		global.language_update_allow_without_online_enabled = false;
		global.language_update_pending = false;

		if (string_copy(fallback_menu, 1, string_length("download_online")) == "download_online")
		|| (fallback_menu == "online_download_list_load")
		{
			if (content_type == "character")
			{
				fallback_menu = "online_character_list";
			}
			else
			{
				fallback_menu = "online_level_list";
			}
		}

		if (fallback_menu == "select_character")
		|| (fallback_menu == "online_level_list_title")
		|| (fallback_menu == "online_character_list")
		{
			in_character_select_menu = true;
			select_custom_level_menu_open = false;
			in_settings = false;
			information_menu_open = "";
		}
		else
		if (fallback_menu == "online_level_list")
		|| (fallback_menu == "level_editor_upload")
		{
			in_character_select_menu = false;
			select_custom_level_menu_open = true;
			in_settings = false;

			if (variable_instance_exists(self, "show_level_editor_corner_menu"))
			{
				show_level_editor_corner_menu = true;
			}
		}
		else
		if (fallback_menu == "language_check_updates")
		{
			in_settings = true;
			global.settings_sidebar_menu = "language_settings";
		}
		else
		if (fallback_menu == "about_online_level_list")
		{
			in_character_select_menu = false;
			select_custom_level_menu_open = false;
			in_settings = false;
			information_menu_open = "about";
		}

		global.switch_login_cancelled = false;
		global.switch_login_cancelled_account_id = -1;
		menu = fallback_menu;
		return;
	}

	/* Warn if the current menu doesn't match the expected fallback menu */
	if (menu != caution_online_takes_you_back_to)
	{
		show_debug_message("[scr_handle_no_network_connection] WARNING! Current menu (" + string(menu)
						   + ") does not match the expected fallback (caution_online_takes_you_back_to): "
						   + string(caution_online_takes_you_back_to));
	}

	/* No network: switch to the network error menu */
	scr_nifm_log_context("WARN", "show_in_game_network_error_without_pending_request",
		"caller=" + string(what_script)
		+ " retry_menu=" + string(retry_this_menu)
		+ " in_game_network_error_visible=true");
	menu_delay = 3;

	ini_open("save_file/config.ini");
	global.online_last_successful_check = ini_read_string("config", "online_last_successful_check", "Never");
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

	global.online_error_code = scr_generate_network_error_code();

	var ts = scr_format_timestamp(date_current_datetime());
	time_of_network_error = string(ts);

	menu = "network_error";

	show_debug_message("[scr_handle_no_network_connection] Exiting function. Final menu: " + string(menu) + "\n");
}
