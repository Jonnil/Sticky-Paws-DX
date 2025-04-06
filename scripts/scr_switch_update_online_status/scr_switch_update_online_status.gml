function scr_switch_update_online_status(show_login_screen = true)
{
	
	#region /* Update Switch Online Status */
	if (os_type == os_switch)
	{
		/* Check if the system is connected to the network */
		if (scr_check_network_connection(network_connect_passive))
		{
			/* Retrieve the number of available accounts on the system */
			var switch_accounts_num = switch_accounts_get_accounts();
			var logged_in_account = undefined;
			var valid_id_token_found = false;
			global.online_token_error_message = ""; /* Reset error message */
			
			#region /* Iterate through accounts to find an open user with network service available */
			for (var i = 0; i < switch_accounts_num; ++i)
			{
				show_debug_message("[scr_switch_update_online_status] Checking account index: " + string(i));
				
				if (switch_accounts_is_user_open(i)
				&& switch_accounts_network_service_available(i))
				{
					logged_in_account = i; /* Save the valid account index */
					global.switch_account_network_service_available = switch_accounts_network_service_available(i); /* Set global variable for network service availability */
					show_debug_message("[scr_switch_update_online_status] Account is open and network service is available: " + string(i));
					
					/* Attempt to retrieve the ID token */
					var id_token = switch_accounts_get_online_token(i);
					show_debug_message("[scr_switch_update_online_status] ID Token Retrieved: " + string(id_token));
					
					/* Check if the token is valid */
					if (id_token != ""
					&& id_token != undefined
					&& id_token != false)
					{
						show_debug_message("[scr_switch_update_online_status] Valid ID Token found for account index: " + string(i));
						valid_id_token_found = true;
						break; /* Stop checking further accounts once a valid one is found */
					}
					else
					{
						show_debug_message("[scr_switch_update_online_status] ID Token is invalid or retrieval failed for account index: " + string(i));
						logged_in_account = undefined; /* Reset if the token is invalid */
						global.online_token_error_message = "ID Token retrieval failed or invalid for account index: " + string(i);
					}
				}
				else
				{
					show_debug_message("[scr_switch_update_online_status] Account index " + string(i) + " is either not open or network service is unavailable.");
				}
			}
			#endregion /* Iterate through accounts to find an open user with network service available END */
			
			#region /* If no valid ID token is found or no account is logged in, prompt the user */
			if ((!valid_id_token_found
			|| is_undefined(logged_in_account)) 
			&& show_login_screen)
			{
				if (!valid_id_token_found && is_undefined(logged_in_account))
				{
					show_debug_message("[scr_switch_update_online_status] No valid ID Token found AND no logged-in account detected. Prompting user to select account...");
					global.online_token_error_message = "No valid ID Token and no logged-in account detected.";
				}
				else
				if (!valid_id_token_found)
				{
					show_debug_message("[scr_switch_update_online_status] No valid ID Token found. Prompting user to select account...");
					global.online_token_error_message = "No valid ID Token found.";
				}
				else
				if (is_undefined(logged_in_account))
				{
					show_debug_message("[scr_switch_update_online_status] No logged-in account detected. Prompting user to select account...");
					global.online_token_error_message = "No logged-in account detected.";
				}
				
				logged_in_account = switch_accounts_select_account(true, true, false); /* Prompt user for account selection */
				global.switch_account_network_service_available = switch_accounts_network_service_available(logged_in_account); /* Set global variable for network service availability */
				show_debug_message("[scr_switch_update_online_status] Logged in account: " + string(logged_in_account));
				
				/* Restart the room if login fails */
				if (!is_undefined(logged_in_account)
				&& !switch_accounts_login_user(logged_in_account))
				{
					show_debug_message("[scr_switch_update_online_status] Login failed after prompting user. Restarting room...");
					global.online_token_error_message = "Login failed after prompting user.";
					room_restart();
				}
				else
				{
					show_debug_message("[scr_switch_update_online_status] Login successful after prompting user.");
					global.online_token_error_message = ""; /* Clear error message */
				}
			}
			#endregion /* If no valid ID token is found or no account is logged in, prompt the user END */
			
			/* Update global variable to reflect login status */
			global.switch_logged_in = !is_undefined(logged_in_account);
			show_debug_message("[scr_switch_update_online_status] Global switch_logged_in: " + string(global.switch_logged_in));
			
			if (global.switch_logged_in)
			{
				
				#region /* Process all accounts to retrieve detailed information */
				for (var i = 0; i < switch_accounts_num; ++i)
				{
					global.switch_account_open[i] = switch_accounts_is_user_open(i); /* Check if account is open */
					global.switch_account_is_user_online[i] = switch_accounts_is_user_online(i); /* Check if account is online */
					
					/* If the account is open and online, validate the online token */
					if (global.switch_account_open[i]
					&& global.switch_account_is_user_online[i])
					{
						show_debug_message("[scr_switch_update_online_status] Validating online token. Current global.online_token_validated value: " + string(global.online_token_validated));
						
						/* Check if token validation is required */
						if (!global.online_token_validated)
						{
							show_debug_message("[scr_switch_update_online_status] Token validation failed. Token data: " + string(global.online_token_validated));
							show_debug_message("[scr_switch_update_online_status] Starting token validation process for account index: " + string(i));
							global.online_token_error_message = "Token validation required.";
							
							/* Create DS Map to hold HTTP Header info */
							var token_validation_headers = ds_map_create();
							var id_token = switch_accounts_get_online_token(i); /* Get the online token for the account */
							show_debug_message("[scr_switch_update_online_status] id_token: " + string(id_token));
							
							/* Add headers to the map for the HTTP request */
							ds_map_add(token_validation_headers, "Host", global.base_url);
							ds_map_add(token_validation_headers, "Content-Type", "application/json");
							ds_map_add(token_validation_headers, "User-Agent", "gmdownloader");
							ds_map_add(token_validation_headers, "X-API-Key", global.api_key);
							
							/* Send the HTTP GET request to validate the token */
							global.online_token_validated = http_request(
								"https://" + global.base_url + "/validate_token" + "?id_token=" + string(id_token), /* URL */
								"GET", /* Method */
								token_validation_headers, /* Header Map */
								"" /* Body */
							);
							ds_map_destroy(token_validation_headers); /* Clean up the DS Map after use */
						}
						else
						{
							global.online_token_error_message = ""; /* Clear error message */
						}
					}
				}
				#endregion /* Process all accounts to retrieve detailed information END */
				
			}
			else
			{
				/* Set global variables to false if no user is logged in */
				global.switch_logged_in = false;
				global.online_token_validated = false;
				global.switch_account_network_service_available = false;
				global.online_token_error_message = "No user is logged in.";
				show_debug_message("[scr_switch_update_online_status] No user is logged in. Setting global variables to false.");
			}
		}
		else
		{
			/* Set global variables to false if the system is not connected to the network */
			global.switch_logged_in = false;
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			global.online_token_error_message = "System is not connected to the network.";
			show_debug_message("[scr_switch_update_online_status] System is not connected to the network. Setting global variables to false.");
		}
	}
	else
	{
		/* On any other version other than Switch, set these global variables to true */
		global.switch_account_network_service_available = true;
		global.switch_logged_in = true;
		global.online_token_validated = true;
		global.online_token_error_message = ""; /* Clear error message */
	}
	#endregion /* Update Switch Online Status END */
	
}

function scr_online_token_is_valid()
{
	/* Static variable to track if a debug message has already been logged */
	static debug_logged = false;
	
	/* Need to make sure that online token is validated before going online */
	if (global.online_token_validated)
	{
		debug_logged = false; /* Reset debug tracking if validation succeeds */
		show_debug_message("[scr_switch_update_online_status] Token validation returned TRUE");
		global.online_token_error_message = ""; /* Clear error message */
		return true;
	}
	
	/* Log only the first failed validation for better debugging */
	if (!debug_logged)
	{
		show_debug_message("[scr_switch_update_online_status] Token validation returned FALSE. Please check server response or token validity.");
		global.online_token_error_message = "Token validation failed. Check server response or token validity.";
		debug_logged = true;
	}
	
	return false; /* Explicitly return false if the condition isn't met */
}