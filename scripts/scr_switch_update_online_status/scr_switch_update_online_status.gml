function scr_switch_update_online_status(show_login_screen = true)
{
	
	#region /* Update Nintendo Switch Online Status */
	if (os_type == os_switch)
	{
		/* Check if the system is connected to the network */
		if (os_is_network_connected(network_connect_passive))
		{
			/* Retrieve the number of available accounts on the system */
			var switch_accounts_num = switch_accounts_get_accounts();
			var logged_in_account = undefined;
			
			#region /* Iterate through accounts to find an open user with network service available */
			for (var i = 0; i < switch_accounts_num; ++i)
			{
				show_debug_message("Checking account index: " + string(i));
				
				if (switch_accounts_is_user_open(i)
				&& switch_accounts_network_service_available(i))
				{
					logged_in_account = i; /* Save the valid account index */
					global.switch_account_network_service_available = switch_accounts_network_service_available(i); /* Set global variable for network service availability */
					show_debug_message("Account is open and network service is available: " + string(i));
					
					/* Attempt to retrieve the ID token */
					var id_token = switch_accounts_get_online_token(i);
					show_debug_message("ID Token Retrieved: " + string(id_token));
					
					/* Check if the token is valid */
					if (id_token != ""
					&& id_token != undefined
					&& id_token != false)
					{
						show_debug_message("Valid ID Token found for account index: " + string(i));
						break; /* Stop checking further accounts once a valid one is found */
					}
					else
					{
						show_debug_message("ID Token is invalid or retrieval failed for account index: " + string(i));
						logged_in_account = undefined; /* Reset if the token is invalid */
					}
				}
				else
				{
					show_debug_message("Account index " + string(i) + " is either not open or network service is unavailable.");
				}
			}
			#endregion /* Iterate through accounts to find an open user with network service available END */
			
			#region /* If no valid account is found, prompt the user to log in */
			if (show_login_screen
			&& is_undefined(logged_in_account))
			{
				show_debug_message("No valid account found. Prompting user to select account...");
				logged_in_account = switch_accounts_select_account(true, true, false); /* Prompt user for account selection */
				global.switch_account_network_service_available = switch_accounts_network_service_available(logged_in_account); /* Set global variable for network service availability */
				show_debug_message("Logged in account: " + string(logged_in_account));
				
				/* Restart the room if login fails */
				if (!is_undefined(logged_in_account)
				&& !switch_accounts_login_user(logged_in_account))
				{
					show_debug_message("Login failed after prompting user. Restarting room...");
					room_restart();
				}
				else
				{
					show_debug_message("Login successful after prompting user.");
				}
			}
			#endregion /* If no valid account is found, prompt the user to log in END */
			
			/* Update global variable to reflect login status */
			global.switch_logged_in = !is_undefined(logged_in_account);
			show_debug_message("Global switch_logged_in: " + string(global.switch_logged_in));
			
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
						show_debug_message("Validating online token. Current global.online_token_validated value: " + string(global.online_token_validated));
						
						/* Check if token validation is required */
						if (global.online_token_validated == false
						|| typeof(global.online_token_validated) != "boolean")
						{
							show_debug_message("Token validation failed. Token data: " + string(global.online_token_validated));
							show_debug_message("Starting token validation process for account index: " + string(i));
							
							/* Create DS Map to hold HTTP Header info */
							var map = ds_map_create();
							var id_token = switch_accounts_get_online_token(i); /* Get the online token for the account */
							show_debug_message("id_token: " + string(id_token));
							
							/* Add headers to the map for the HTTP request */
							ds_map_add(map, "Host", global.base_url);
							ds_map_add(map, "Content-Type", "application/json");
							ds_map_add(map, "User-Agent", "gmdownloader");
							ds_map_add(map, "X-API-Key", global.api_key);
							
							/* Send the HTTP GET request to validate the token */
							global.online_token_validated = http_request(
								"https://" + global.base_url + "/validate_token" + "?id_token=" + string(id_token), /* URL */
								"GET", /* Method */
								map, /* Header Map */
								"" /* Body */
							);
							ds_map_destroy(map); /* Clean up the DS Map after use */
						}
					}
					
					/* Retrieve account details for further use */
					global.switch_account_name[i] = switch_accounts_get_nickname(i); /* Get account nickname */
					global.switch_account_handle[i] = switch_accounts_get_handle(i); /* Get account handle */
					global.switch_account_netid[i] = switch_accounts_get_netid(i); /* Get network ID of the account */
				}
				#endregion /* Process all accounts to retrieve detailed information END */
				
			}
			else
			{
				/* Set global variables to false if no user is logged in */
				global.switch_logged_in = false;
				global.online_token_validated = false;
				global.switch_account_network_service_available = false;
				show_debug_message("No user is logged in. Setting global variables to false.");
			}
		}
		else
		{
			/* Set global variables to false if the system is not connected to the network */
			global.switch_logged_in = false;
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			show_debug_message("System is not connected to the network. Setting global variables to false.");
		}
	}
	else
	{
		/* On any other version other than Switch, set these global variables to true */
		global.switch_account_network_service_available = true;
		global.switch_logged_in = true;
		global.online_token_validated = true;
		show_debug_message("Running on a platform other than Nintendo Switch. Defaulting online status to true.");
	}
	#endregion /* Update Nintendo Switch Online Status END */
	
}

function scr_online_token_is_valid()
{
	
	/* Static variable to track if a debug message has already been logged */
	static debug_logged = false;
	
	/* Need to make sure that online token is validated before going online */
	/* This variable can hold both string and bool values, so we need to make sure that it's a bool value of true first */
	if (typeof(global.online_token_validated) == typeof(true)
	&& global.online_token_validated == true)
	{
		debug_logged = false; /* Reset debug tracking if validation succeeds */
		show_debug_message("Token validation returned TRUE");
		return true;
	}
	
	/* Log only the first failed validation for better debugging */
	if (!debug_logged)
	{
		show_debug_message("Token validation returned FALSE. Please check server response or token validity.");
		debug_logged = true;
	}
	
	return false; /* Explicitly return false if the condition isn't met */
}