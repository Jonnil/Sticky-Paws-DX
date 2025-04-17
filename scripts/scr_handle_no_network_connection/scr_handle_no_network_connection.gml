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
	
	/* If a retry menu is provided, update the fallback menu */
	if (retry_this_menu != "")
	{
		show_debug_message("[scr_handle_no_network_connection] Updating fallback menu: setting caution_online_takes_you_back_to from " 
						   + string(caution_online_takes_you_back_to) + " to " + string(retry_this_menu));
		
		caution_online_takes_you_back_to = retry_this_menu;
	}
	
	/* Warn if the current menu doesn't match the expected fallback menu */
	if (menu != caution_online_takes_you_back_to)
	{
		show_debug_message("[scr_handle_no_network_connection] WARNING! Current menu (" + string(menu)
						   + ") does not match the expected fallback (caution_online_takes_you_back_to): " 
						   + string(caution_online_takes_you_back_to));
	}
	
	/* No network: switch to the network error menu */
	show_debug_message("[scr_handle_no_network_connection] No network available. Switching to 'network_error' menu.");
	menu_delay = 3;
	menu = "network_error";
	
	show_debug_message("[scr_handle_no_network_connection] Exiting function. Final menu: " + string(menu) + "\n");
}