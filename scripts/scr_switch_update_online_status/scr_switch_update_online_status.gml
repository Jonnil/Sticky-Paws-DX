function scr_switch_update_online_status(show_login_screen = true)
{

	#region /* Update Switch Online Status */
	if (os_type == os_switch)
	{
		/* Track a one-shot cancel flag so we don't spam the Switch UI after the user presses Cancel */
		if (!variable_global_exists("switch_login_cancelled"))
		{
			global.switch_login_cancelled = false;
		}

		var raw_preselected_user_index = switch_accounts_open_preselected_user();
		var active_user_index = raw_preselected_user_index;
		scr_switch_refresh_account_debug_info(raw_preselected_user_index, active_user_index);
		var account_count = global.switch_accounts_get_accounts_result;
		var has_active_user = scr_switch_is_valid_account_index(active_user_index, account_count);

		/* Check network connection (passive mode) */
		if (!global.online_token_validated)
		&& (os_is_network_connected(network_connect_passive))
		{
			show_debug_message("[scr_switch_update_online_status] Network connection PASS (passive check).");

			show_debug_message("[scr_switch_update_online_status] Switch Accounts Open Preselected User: " + string(raw_preselected_user_index));
			var valid_id_token_found = false;
			global.online_token_error_message = ""; /* Reset error message */

			#region /* Iterate through accounts to find a valid open account with network service */
			show_debug_message("[scr_switch_update_online_status] Checking account index: " + string(active_user_index));

			if (!global.switch_login_cancelled
			&& has_active_user
			&& !show_login_screen /* Avoid double prompts: only auto-login when we're not planning to show the UI */
			&& switch_accounts_login_user(active_user_index))
			{
				show_debug_message("[scr_switch_update_online_status] Account " + string(active_user_index) + " is open and has network service available.");
				global.switch_account_network_service_available = true;
				show_debug_message("[scr_switch_update_online_status] Global switch_account_network_service_available set to: " + string(global.switch_account_network_service_available));
				scr_switch_refresh_account_debug_info(raw_preselected_user_index, active_user_index);

				/* Retrieve the ID token for this account */
				var id_token = switch_accounts_get_online_token(active_user_index);
				show_debug_message("[scr_switch_update_online_status] Retrieved ID Token for account " + string(active_user_index) + ": " + string(id_token));

				/* Debug Token Info */
				global.online_token_source = l10n_text("Switch Account Services");
				global.online_token_present = (id_token != ""
											&& id_token != undefined
											&& id_token != false);

				/* Validate token */
				if (global.online_token_present)
				{
					show_debug_message("[scr_switch_update_online_status] Valid ID Token found for account index: " + string(active_user_index));
					valid_id_token_found = true;

					/* Debug Token Info */
					global.online_token_expired = false;
					global.online_current_attempt_result = l10n_text("Valid ID Token");
				}
				else
				{
					show_debug_message("[scr_switch_update_online_status] Invalid ID Token for account index: " + string(active_user_index));

					/* Debug Token Info */
					global.online_token_expired = false;
					global.online_current_attempt_result = l10n_text("Invalid ID Token");

					global.online_token_error_message = "ID Token retrieval failed/invalid for account index: " + string(active_user_index);
				}
			}
			else
			if (global.switch_login_cancelled)
			{
				show_debug_message("[scr_switch_update_online_status] Skipping auto login attempt because user previously cancelled.");
				active_user_index = -1;
				has_active_user = false;
				scr_switch_refresh_account_debug_info(raw_preselected_user_index, active_user_index);
			}
			else
			if (!has_active_user)
			{
				show_debug_message("[scr_switch_update_online_status] No valid preselected Switch account was found.");
			}
			else
			if (show_login_screen)
			{
				show_debug_message("[scr_switch_update_online_status] Skipping auto login because login screen will be shown.");
			}
			else
			{
				show_debug_message("[scr_switch_update_online_status] Account index " + string(active_user_index) + " is not open or network service unavailable.");
			}
			#endregion /* Iterate through accounts to find a valid open account with network service END */

			#region /* Prompt user if needed */
			if ((!valid_id_token_found
			|| !has_active_user)
			&& show_login_screen)
			{
				if (global.switch_login_cancelled)
				{
					show_debug_message("[scr_switch_update_online_status] Skipping login prompt because user previously cancelled.");
					return;
				}

				if (!valid_id_token_found
				&& !has_active_user)
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
				if (!has_active_user)
				{
					show_debug_message("[scr_switch_update_online_status] ERROR: No logged-in account detected. Prompting user for account selection...");
					global.online_token_error_message = "No logged-in account detected.";
				}

				var selected_user_index = switch_accounts_open_user(has_active_user ? active_user_index : -1);
				var has_selected_user = scr_switch_is_valid_account_index(selected_user_index, account_count);
				show_debug_message("[scr_switch_update_online_status] Preselected account: " + string(raw_preselected_user_index) + ", User selected account: " + string(selected_user_index));
				scr_switch_refresh_account_debug_info(raw_preselected_user_index, selected_user_index);

				/* If the user cancels out of the Switch UI, bail immediately so we don't reopen the prompt repeatedly */
				if (!has_selected_user)
				{
					scr_log("WARN", "SWITCH.ACCOUNTS", "selection_cancelled",
						"preselected=" + string(raw_preselected_user_index) + ", account_count=" + string(account_count));
					show_debug_message("[scr_switch_update_online_status] User cancelled account selection. Aborting login flow.");
					global.switch_logged_in = false;
					global.online_token_validated = false;
					global.switch_account_network_service_available = false;
					global.online_token_error_message = "Account selection cancelled.";
					global.switch_login_cancelled = true;
					active_user_index = -1;
					has_active_user = false;
					scr_switch_refresh_account_debug_info(raw_preselected_user_index, active_user_index);
					return;
				}

				/* From this point on, work with the actual selection */
				active_user_index = selected_user_index;
				has_active_user = true;
				global.switch_account_network_service_available = switch_accounts_network_service_available(active_user_index);
				show_debug_message("[scr_switch_update_online_status] Post-selection network service availability: " + string(global.switch_account_network_service_available));

				/* Try logging in with the selected account */
				if (!switch_accounts_login_user(active_user_index))
				{
					scr_log("WARN", "SWITCH.ACCOUNTS", "login_failed", "account_index=" + string(active_user_index));
					show_debug_message("[scr_switch_update_online_status] ERROR: Login failed for account " + string(active_user_index) + ". Cancelling login flow.");
					global.online_token_error_message = "Login cancelled for account " + string(active_user_index);
					global.switch_logged_in = false;
					global.online_token_validated = false;
					global.switch_account_network_service_available = false;
					global.switch_login_cancelled = true;
					active_user_index = -1;
					has_active_user = false;
					scr_switch_refresh_account_debug_info(raw_preselected_user_index, active_user_index);
					return;
				}
				else
				{
					show_debug_message("[scr_switch_update_online_status] Login successful for account " + string(active_user_index));
					global.online_token_error_message = ""; /* Clear error message on success */
					global.switch_login_cancelled = false;
					scr_switch_refresh_account_debug_info(raw_preselected_user_index, active_user_index);
					scr_log("INFO", "SWITCH.ACCOUNTS", "login_success",
						"account_index=" + string(active_user_index) + ", is_user_open=" + (global.switch_accounts_is_user_open_result ? "open" : "closed"));
				}
			}
			#endregion /* Prompt user if needed END */

			/* Update global switch login status */
			global.switch_logged_in = has_active_user;
			show_debug_message("[scr_switch_update_online_status] Global switch_logged_in set to: " + string(global.switch_logged_in));

			if (global.switch_logged_in)
			{

				#region /* Process all accounts for detailed info and token validation */
				scr_switch_refresh_account_debug_info(raw_preselected_user_index, active_user_index);
				if (has_active_user
				&& global.switch_accounts_is_user_open_result
				&& switch_accounts_is_user_online(active_user_index))
				{
					show_debug_message("[scr_switch_update_online_status] Validating token for account " + string(active_user_index) + ". Current global.online_token_validated: " + string(global.online_token_validated));

					if (!global.online_token_validated)
					{
						show_debug_message("[scr_switch_update_online_status] Token validation required for account " + string(active_user_index));
						global.online_token_error_message = "Token validation required for account " + string(active_user_index);

						var token_validation_headers = ds_map_create();
						var id_token = switch_accounts_get_online_token(active_user_index);
						show_debug_message("[scr_switch_update_online_status] Retrieved token for validation from account " + string(active_user_index) + ": " + string(id_token));

						ds_map_add(token_validation_headers, "Content-Type", "application/json");
						ds_map_add(token_validation_headers, "User-Agent", "gmdownloader");
						ds_map_add(token_validation_headers, "X-API-Key", global.api_key);

						global.online_token_request = http_request(
							"https://" + global.base_url + "/validate_token?id_token=" + string(id_token),
							"GET",
							token_validation_headers,
							""
						);

						show_debug_message("[scr_switch_update_online_status] Sent token validation request for account " + string(active_user_index) + ". HTTP request ID: " + string(global.online_token_validated));

						ds_map_destroy(token_validation_headers);
					}
					else
					{
						global.online_token_error_message = "";
						show_debug_message("[scr_switch_update_online_status] Token already validated for account " + string(active_user_index) + ". Skipping validation.");
					}
				}
				else
				{
					show_debug_message("[scr_switch_update_online_status] Skipping token validation for account " + string(active_user_index) + " (Account closed or offline).");
				}
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
		if (global.online_token_validated)
		{
			/* Do nothing, everything is working correctly if token is already validated */
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
		/* If not on Switch, force online status to TRUE */
		global.switch_account_network_service_available = true;
		global.switch_logged_in = true;
		global.online_token_validated = true;
		global.online_token_error_message = "";
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

function scr_switch_is_valid_account_index(account_index, account_count = undefined)
{
	if (is_undefined(account_count))
	{
		account_count = switch_accounts_get_accounts();
	}

	return !is_undefined(account_index)
		&& is_real(account_index)
		&& account_index >= 0
		&& account_index < account_count;
}

function scr_switch_refresh_account_debug_info(raw_preselected_user_index = -1, probe_user_index = -1)
{
	if (os_type != os_switch)
	{
		return;
	}

	var account_count = switch_accounts_get_accounts();
	var safe_preselected_user_index = scr_switch_is_valid_account_index(raw_preselected_user_index, account_count) ? floor(raw_preselected_user_index) : -1;
	var safe_probe_user_index = scr_switch_is_valid_account_index(probe_user_index, account_count) ? floor(probe_user_index) : -1;
	var probe_user_is_open = false;
	var probe_user_open_text = "n/a";
	var open_states = "";

	if (safe_probe_user_index >= 0)
	{
		probe_user_is_open = switch_accounts_is_user_open(safe_probe_user_index);
		probe_user_open_text = probe_user_is_open ? "open" : "closed";
	}

	for (var i = 0; i < account_count; i++)
	{
		var is_user_open = switch_accounts_is_user_open(i);

		if (i > 0)
		{
			open_states += ", ";
		}

		open_states += string(i) + ":" + (is_user_open ? "open" : "closed");
	}

	global.switch_accounts_get_accounts_result = account_count;
	global.switch_accounts_open_preselected_user_result = safe_preselected_user_index;
	global.switch_accounts_probe_user_index = safe_probe_user_index;
	global.switch_accounts_is_user_open_result = probe_user_is_open;
	global.switch_accounts_open_states = open_states;

	var snapshot = "count=" + string(account_count)
		+ ", preselected=" + string(safe_preselected_user_index)
		+ ", probe=" + string(safe_probe_user_index)
		+ ", is_user_open=" + probe_user_open_text
		+ ", states=[" + open_states + "]";

	if (global.switch_accounts_last_snapshot != snapshot)
	{
		var log_level = (global.switch_accounts_last_snapshot == "") ? "INFO" : "DEBUG";
		scr_log(log_level, "SWITCH.ACCOUNTS", "account_snapshot", snapshot);
		global.switch_accounts_last_snapshot = snapshot;
	}
}
