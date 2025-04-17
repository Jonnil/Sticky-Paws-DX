/// @function scr_check_network_connection(connect_mode)
/// @description Wrapper function for network connectivity with debug override.
function scr_check_network_connection(connect_mode)
{
	
	#region /* Check if debug override is enabled to simulate network errors */
	if (global.debug_force_network_error)
	{
		show_debug_message("[scr_check_network_connection] Debug override enabled: 'global.debug_force_network_error': " + string(global.debug_force_network_error));
		
		/* Default to false (simulate no network connection) */
		var debug_state = false;
		
		/* If holding down the shift key or gamepad select is pressed, force the network check to succeed */
		if (keyboard_check(vk_shift)
		|| gamepad_button_check(global.player_slot[1], gp_select))
		{
			debug_state = true;
			show_debug_message("[scr_check_network_connection] Debug override keys detected (vk_shift or gp_select). Forcing network connection TRUE.");
		}
		else
		{
			show_debug_message("[scr_check_network_connection] No debug override key pressed. Forcing network connection FALSE.");
		}
		
		show_debug_message("[scr_check_network_connection] Returning debug_state: " + string(debug_state));
		return debug_state;
	}
	#endregion /* Check if debug override is enabled to simulate network errors END */
	
	/* If online token has not been validated, update online status. */
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
	
	var actual_network_status = os_is_network_connected(connect_mode);
	
	if (global.online_token_validated
	&& actual_network_status)
	{
		return true;
	}
	else
	{
		show_debug_message("[scr_check_network_connection] Returning FALSE (online_token_validated: " + string(global.online_token_validated)
							+ ", network status: " + string(actual_network_status) + ").");
		return false;
	}
}