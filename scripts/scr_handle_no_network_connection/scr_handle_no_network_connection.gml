/// @function scr_handle_no_network_connection()
/// @description Handles cases where there is no network connection.
function scr_handle_no_network_connection(what_script = "scr_handle_no_network_connection", retry_this_menu = "")
{
	/* Log the current menu state for debugging purposes */
	show_debug_message("[scr_handle_no_network_connection] -> [" + string(what_script) + "] Network Error on menu: " + string(menu) + ", caution_online_takes_you_back_to = " + string(caution_online_takes_you_back_to));
	
	/* If network is available, proceed to online caution screen */
	if (menu_delay == 0
	&& menu_joystick_delay == 0)
	&& (check_network_connection(network_connect_passive))
	{
		menu_delay = 3;
		menu = "caution_online_proceed";
		return;
	}
	
	/* If a retry menu is provided, update the caution fallback */
	if (retry_this_menu != "")
	{
		caution_online_takes_you_back_to = retry_this_menu;
	}
	
	/* Warn if the current menu doesn't match the expected caution menu */
	if (menu != caution_online_takes_you_back_to)
	{
		show_debug_message("[scr_handle_no_network_connection] -> [" + string(what_script) + "] WARNING! Menu (" + string(menu)
						   + ") does not match caution_online_takes_you_back_to (" 
						   + string(caution_online_takes_you_back_to) + ")");
	}
	
	/* No network: switch to network error menu */
	if (menu_delay == 0
	&& menu_joystick_delay == 0)
	{
		menu_delay = 3;
		menu = "network_error";
	}
}

/// @function check_network_connection(connect_mode)
/// @description Wrapper function for network connectivity with debug override.
function check_network_connection(connect_mode)
{
	/* Use a global flag for debug purposes so it can be toggled easily */
	/* Set global.debug_force_network = true to enable forcing the network state */
	if (global.debug_force_network)
	{
		/* Default to false (simulate no network connection) */
		var debug_state = false;  
		
		/* When holding down the shift key, force the network check to succeed */
		if (keyboard_check(vk_shift))
		{
			debug_state = true;
		}
		
		return debug_state;
	}
	
	/* Otherwise, return the actual network connection status */
	return os_is_network_connected(connect_mode);
}