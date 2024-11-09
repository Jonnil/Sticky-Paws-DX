function scr_switch_update_online_status(show_login_screen = true)
{
	if (os_type == os_switch)
	{
		if (os_is_network_connected(network_connect_passive)) /* Need to check if OS is connected to network before getting online */
		{
			
			#region /* Login user correctly */
			/* First, make sure to login the user correctly before anything else */
			var switch_accounts_num = switch_accounts_get_accounts();
			for (var i = 0; i < switch_accounts_num; ++i;)
			{
				global.switch_account_network_service_available = switch_accounts_network_service_available(i);
				global.switch_logged_in = switch_accounts_is_user_open(i); /* This checks if the player is logged in */
				if (global.switch_logged_in)
				{
					break; /* Make sure that global.switch_logged_in does not overwrite itself during the loop unintentionally. Verify that the intended user is consistently checked and set, not just the last checked account in the loop */
				}
			}
			if (show_login_screen)
			&& (!global.switch_logged_in || !global.switch_account_network_service_available)
			{
				global.switch_logged_in = switch_accounts_login_user(0);
				/* switch_accounts_login_user is used to forcefully login a user, need to use a function to ask player to login manually */
			}
			#endregion /* Login user correctly END */
			
			#region /* If user is logged in, then do other online checks */
			if (global.switch_logged_in)
			{
				var switch_accounts_num = switch_accounts_get_accounts();
				for (var i = 0; i < switch_accounts_num; ++i;)
				{
					
					#region /* First, check if user is open and user is online */
					global.switch_account_open[i] = switch_accounts_is_user_open(i); /* Second get if user is open. With this function you can check an account ID slot to see if the account has been flagged as "open" (active) or not */
					global.switch_account_is_user_online[i] = switch_accounts_is_user_online(i);
					#endregion /* First, check if user is open and user is online END */
					
					#region /* Second, check network service availability and login user */
					/* For some reason I can't retrieve information from network_service_available as an array without crashing the game with unknown error */
					/* Account needs to be open before you can check network service availability */
					if (global.switch_account_open[i])
					&& (global.switch_account_is_user_online[i])
					{
						if (global.online_token_validated != true) /* If you are logged in, only then are you able to retrieve the online token */
						{
							/* Create DS Map to hold the HTTP Header info */
							var map = ds_map_create();
							
							/* Create a JSON object with the id_token */
							var id_token = switch_accounts_get_online_token(i); /* ID token you need to send */
							
							/* Add to the header DS Map */
							ds_map_add(map, "Host", global.base_url);
							ds_map_add(map, "Content-Type", "application/json");
							ds_map_add(map, "User-Agent", "gmdownloader");
							ds_map_add(map, "X-API-Key", global.api_key);
							
							/* Send the HTTP GET request to the /validate_token endpoint */
							global.online_token_validated = http_request("https://" + global.base_url + "/validate_token" + "?id_token=" + string(id_token), "GET", map, "");
							ds_map_destroy(map);
						}
					}
					#endregion /* Second, check network service availability and login user END */
					
					#region /* Third, retrieve information about the account */
					global.switch_account_name[i] = switch_accounts_get_nickname(i); /* First get the nickname. With this function you can retrieve the nickname of the user in the given Account ID slot or the User Network Id */
					global.switch_account_handle[i] = switch_accounts_get_handle(i); /* Third get the handle. With this function you can retrieve the "handle" (as a pointer) of the user in the given Account ID slot */
					
					/* Other Switch accounts functions to look for */
					global.switch_account_netid[i] = switch_accounts_get_netid(i);
					#endregion /* Third, retrieve information about the account END */
					
				}
			}
			#endregion /* If user is logged in, then do other online checks END */
			
			else
			{
				global.switch_logged_in = false;
				global.online_token_validated = false;
			}
		}
		else
		{
			global.switch_logged_in = false;
			global.online_token_validated = false;
		}
	}
	else
	{
		/* On any other version other than Switch, these global variables should be set to true */
		global.switch_account_network_service_available = true;
		global.switch_logged_in = true;
		global.online_token_validated = true;
	}
}