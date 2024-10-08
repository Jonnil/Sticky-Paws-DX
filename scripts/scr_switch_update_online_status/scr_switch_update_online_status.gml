function scr_switch_update_online_status(show_login_screen = true)
{
	if (os_type == os_switch)
	{
		if (os_is_network_connected(network_connect_passive)) /* Need to check if OS is connected to network before getting online */
		{
			global.switch_account_network_service_available = false;
			
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
					global.switch_account_network_service_available = switch_accounts_network_service_available(i);
					if (show_login_screen)
					&& (global.switch_logged_in != 1)
					{
						global.switch_logged_in = switch_accounts_login_user(i);
					}
					if (global.switch_logged_in) /* If you are logged in, only then are you able to retrieve the online token */
					&& (global.online_token_validated != true)
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
			
			/* If free communication is disabled, and switch_accounts_network_service_available is false, you shouldn't be able to upload or download custom content */
			/* If free communication is disabled, you shouldn't even see the buttons for going online */
			/* But if switch_accounts_network_service_available is false, you should be able to see the buttons for going online, but stop you from going online and instead show a notification telling you to link a Switch Account before proceeding */
			/* Free communication is basically what determines if you are using parental controls or not */
			global.free_communication_available = switch_free_communication_available();
		}
		else
		{
			global.switch_account_network_service_available = false;
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