/// @function scr_check_network_connection(connect_mode)
/// @description Wrapper function for network connectivity with debug override.
function scr_check_network_connection(connect_mode)
{

	#region /* Check if debug override is enabled to simulate network errors (Only in test run mode) */
	if (global.debug_force_network_error)
	&& (GM_build_type == "run") /* Only enable debug features in test run, and not executable */
	{
		show_debug_message("[scr_check_network_connection] Debug override enabled: 'global.debug_force_network_error': " + string(global.debug_force_network_error));

		/* Default to false (simulate no network connection) */
		var debug_state = false;

		/* If holding down the shift key or gamepad select is pressed, force the network check to succeed */
		if (keyboard_check(vk_shift)
		|| gamepad_button_check(global.player_slot[1], gp_select))
		{
			debug_state = true;
			global.online_token_validated = true;
			global.online_enabled = true;
			show_debug_message("[scr_check_network_connection] Debug override keys detected (vk_shift or gp_select). Forcing network connection TRUE.");
		}
		else
		{
			global.online_token_validated = false;
			global.online_enabled = false;
			show_debug_message("[scr_check_network_connection] No debug override key pressed. Forcing network connection FALSE.");
		}

		show_debug_message("[scr_check_network_connection] Returning debug_state: " + string(debug_state));
		return debug_state;
	}
	#endregion /* Check if debug override is enabled to simulate network errors (Only in test run mode) END */

	#region /* If online token has not been validated, update online status */
	if (!global.online_token_validated)
	{
		show_debug_message("[scr_check_network_connection] Online token not validated. Calling 'scr switch update online status(false)'...");

		if os_is_network_connected(network_connect_active)
		{
			/* Prompt user to connect to internet */
			show_debug_message("[scr_check_network_connection] Connected to internet");
		}
		else
		{
			show_debug_message("[scr_check_network_connection] NOT CONNECTED TO INTERNET");
		}

		scr_switch_update_online_status(true); /* Show the login screen for Switch if there isn't any online token validated */
		show_debug_message("[scr_check_network_connection] After update, global.online_token_validated = " + string(global.online_token_validated));
	}
	#endregion /* If online token has not been validated, update online status END */

	var actual_network_status = os_is_network_connected(connect_mode);

	/* Online Token must be validated before player is able to go online */
	if (global.online_token_validated
	&& actual_network_status)
	{
		/* Save last known online status, a timestamp that helps confirm whether the connection failed recently or has never worked */
		/* We know we *are* online, so record the timestamp */
		var ts = scr_format_timestamp(date_current_datetime());
		global.online_last_successful_check = string(ts);

		ini_open("save_file/config.ini");
		ini_write_string("config", "online_last_successful_check", string(ts));
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! Too many commited saves will go against guidelines */

		return true;
	}
	else
	{
		if (!global.online_token_validated)
		&& (!actual_network_status)
		{
			global.online_current_attempt_result = l10n_text("Token not validated AND network down");
		}
		else
		if (!global.online_token_validated)
		{
			global.online_current_attempt_result = l10n_text("Token not validated");
		}
		else
		if (!actual_network_status)
		{
			global.online_current_attempt_result = l10n_text("Network down");
		}

		show_debug_message("[scr_check_network_connection] Returning FALSE (online_token_validated: "
			+ string(global.online_token_validated)
			+ ", network status: "
			+ string(actual_network_status)
			+ ").");
		return false;
	}
}
