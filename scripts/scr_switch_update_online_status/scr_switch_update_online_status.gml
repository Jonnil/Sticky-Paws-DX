function scr_switch_update_online_status(show_login_screen = true)
{
	
	#region /* Update Switch Online Status */
	if (os_type == os_switch)
	{
		show_debug_message("[scr_switch_update_online_status] OS type is SWITCH. Starting update sequence...");
		
		/* Check network connection (passive mode) */
		if (os_is_network_connected(network_connect_passive)) /* Need to use 'os is network connected' specifically here */
		{
			show_debug_message("[scr_switch_update_online_status] Network connection PASS (passive check).");
			
			/* Get total number of accounts on the Switch */
			var switch_accounts_num = switch_accounts_get_accounts();
			show_debug_message("[scr_switch_update_online_status] Total Switch accounts available: " + string(switch_accounts_num));
			
			var preselected_user_index = switch_accounts_open_preselected_user();
			show_debug_message("[scr_switch_update_online_status] Switch Accounts Open Preselected User: " + string(preselected_user_index));
			switch_accounts_open_user(preselected_user_index);
			var valid_id_token_found = false;
			global.online_token_error_message = ""; /* Reset error message */
			
			#region /* Iterate through accounts to find a valid open account with network service */
			show_debug_message("[scr_switch_update_online_status] Checking account index: " + string(preselected_user_index));
			
			if (switch_accounts_is_user_open(preselected_user_index)
			&& switch_accounts_network_service_available(preselected_user_index))
			{
				show_debug_message("[scr_switch_update_online_status] Account " + string(preselected_user_index) + " is open and has network service available.");
				global.switch_account_network_service_available = switch_accounts_network_service_available(preselected_user_index);
				show_debug_message("[scr_switch_update_online_status] Global switch_account_network_service_available set to: " + string(global.switch_account_network_service_available));
				
				/* Retrieve the ID token for this account */
				var id_token = switch_accounts_get_online_token(preselected_user_index);
				show_debug_message("[scr_switch_update_online_status] Retrieved ID Token for account " + string(preselected_user_index) + ": " + string(id_token));
				
				/* Debug Token Info */
				global.online_token_source = l10n_text("Switch Account Services");
				global.online_token_present = (id_token != ""
											&& id_token != undefined
											&& id_token != false);
				
				/* Validate token */
				if (global.online_token_present)
				{
					show_debug_message("[scr_switch_update_online_status] Valid ID Token found for account index: " + string(preselected_user_index));
					valid_id_token_found = true;
					
					/* Debug Token Info */
					global.online_token_expired = false;
					global.online_current_attempt_result = l10n_text("Valid ID Token");
				}
				else
				{
					show_debug_message("[scr_switch_update_online_status] Invalid ID Token for account index: " + string(preselected_user_index));
					
					/* Debug Token Info */
					global.online_token_expired = false;  
					global.online_current_attempt_result = l10n_text("Invalid ID Token");
					
					global.online_token_error_message = "ID Token retrieval failed/invalid for account index: " + string(preselected_user_index);
				}
			}
			else
			{
				show_debug_message("[scr_switch_update_online_status] Account index " + string(preselected_user_index) + " is not open or network service unavailable.");
			}
			#endregion /* Iterate through accounts to find a valid open account with network service END */
			
			#region /* Prompt user if needed */
			if ((!valid_id_token_found
			|| is_undefined(preselected_user_index))
			&& show_login_screen)
			{
				if (!valid_id_token_found
				&& is_undefined(preselected_user_index))
				{
					show_debug_message("[scr_switch_update_online_status] ERROR: No valid ID Token AND no logged-in account detected.");
					global.online_token_error_message = "No valid ID Token and no logged-in account detected.";
				}
				else
				if (!valid_id_token_found)
				{
					show_debug_message("[scr_switch_update_online_status] ERROR: No valid ID Token found. Prompting user for account selection...");
					global.online_token_error_message = "No valid ID Token found.";
				}
				else
				if (is_undefined(preselected_user_index))
				{
					show_debug_message("[scr_switch_update_online_status] ERROR: No logged-in account detected. Prompting user for account selection...");
					global.online_token_error_message = "No logged-in account detected.";
				}
				
				preselected_user_index = switch_accounts_open_preselected_user(); //switch_accounts_select_account(true, true, false);
				switch_accounts_open_user(preselected_user_index);
				show_debug_message("[scr_switch_update_online_status] User selected account: " + string(preselected_user_index));
				
				global.switch_account_network_service_available = switch_accounts_network_service_available(preselected_user_index);
				show_debug_message("[scr_switch_update_online_status] Post-selection network service availability: " + string(global.switch_account_network_service_available));
				
				/* Try logging in with the selected account */
				if (!is_undefined(preselected_user_index)
				&& !switch_accounts_login_user(preselected_user_index))
				{
					show_debug_message("[scr_switch_update_online_status] ERROR: Login failed for account " + string(preselected_user_index) + ". Restarting room...");
					global.online_token_error_message = "Login failed for account " + string(preselected_user_index);
					room_restart();
					return; 
				}
				else
				{
					show_debug_message("[scr_switch_update_online_status] Login successful for account " + string(preselected_user_index));
					global.online_token_error_message = ""; /* Clear error message on success */
				}
			}
			#endregion /* Prompt user if needed END */
			
			/* Update global switch login status */
			global.switch_logged_in = !is_undefined(preselected_user_index);
			show_debug_message("[scr_switch_update_online_status] Global switch_logged_in set to: " + string(global.switch_logged_in));
			
			if (global.switch_logged_in)
			{
				
				#region /* Process all accounts for detailed info and token validation */
				//for (var i = 0; i < switch_accounts_num; ++i)
				//{
					global.switch_account_open[preselected_user_index] = switch_accounts_is_user_open(preselected_user_index);
					global.switch_account_is_user_online[preselected_user_index] = switch_accounts_is_user_online(preselected_user_index);
					show_debug_message("[scr_switch_update_online_status] Account " + string(preselected_user_index) + " open: " + string(global.switch_account_open[preselected_user_index]) + ", online: " + string(global.switch_account_is_user_online[preselected_user_index]));
					
					if (global.switch_account_open[preselected_user_index]
					&& global.switch_account_is_user_online[preselected_user_index])
					{
						show_debug_message("[scr_switch_update_online_status] Validating token for account " + string(preselected_user_index) + ". Current global.online_token_validated: " + string(global.online_token_validated));
						
						if (!global.online_token_validated)
						{
							show_debug_message("[scr_switch_update_online_status] Token validation required for account " + string(preselected_user_index));
							global.online_token_error_message = "Token validation required for account " + string(preselected_user_index);
							
							var token_validation_headers = ds_map_create();
							var id_token = switch_accounts_get_online_token(preselected_user_index);
							show_debug_message("[scr_switch_update_online_status] Retrieved token for validation from account " + string(preselected_user_index) + ": " + string(id_token));
							
							//ds_map_add(token_validation_headers, "Host", global.base_url);
							ds_map_add(token_validation_headers, "Content-Type", "application/json");
							ds_map_add(token_validation_headers, "User-Agent", "gmdownloader");
							ds_map_add(token_validation_headers, "X-API-Key", global.api_key);
							
							global.online_token_request = http_request(
								"https://" + global.base_url + "/validate_token?id_token=" + string(id_token),
								"GET",
								token_validation_headers,
								""
							);
							show_debug_message("[scr_switch_update_online_status] Sent token validation request for account " + string(preselected_user_index) + ". HTTP request ID: " + string(global.online_token_validated));
							
							ds_map_destroy(token_validation_headers);
						}
						else
						{
							global.online_token_error_message = "";
							show_debug_message("[scr_switch_update_online_status] Token already validated for account " + string(preselected_user_index) + ". Skipping validation.");
						}
					}
					else
					{
						show_debug_message("[scr_switch_update_online_status] Skipping token validation for account " + string(preselected_user_index) + " (Account closed or offline).");
					}
				//}
				#endregion /* Process all accounts for detailed info and token validation END */
			}
			else
			{
				global.switch_logged_in = false;
				global.online_token_validated = false;
				global.switch_account_network_service_available = false;
				global.online_token_error_message = "No user is logged in.";
				show_debug_message("[scr_switch_update_online_status] No valid logged-in account. Global login flags set to false.");
			}
		}
		else
		{
			global.switch_logged_in = false;
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			global.online_token_error_message = "System is not connected to the network.";
			
			/* Debug Online Info */
			global.online_current_attempt_result = l10n_text("No network connection");
			
			show_debug_message("[scr_switch_update_online_status] Network connection FAIL (passive check). Global login flags set to false.");
		}
	}
	else
	{
		/* If not on Switch, force online status */
		global.switch_account_network_service_available = true;
		global.switch_logged_in = true;
		global.online_token_validated = true;
		global.online_token_error_message = "";
		show_debug_message("[scr_switch_update_online_status] Non-Switch platform detected. Forcing online status to TRUE.");
	}
	#endregion /* Update Switch Online Status END */
	
}

function scr_online_token_is_valid()
{
	/* Static variable to track if a debug message has already been logged */
	static debug_logged = false;
	
	if (global.online_token_validated)
	{
		debug_logged = false; /* Reset if validation is now successful */
		show_debug_message("[scr_online_token_is_valid] Token validation returned TRUE. Clearing error message.");
		global.online_token_error_message = "";
		return true;
	}
	
	if (!debug_logged)
	{
		show_debug_message("[scr_online_token_is_valid] Token validation returned FALSE. Please check server response or token validity.");
		global.online_token_error_message = "Token validation failed. Check server response or token validity.";
		debug_logged = true;
	}
	
	return false;
}