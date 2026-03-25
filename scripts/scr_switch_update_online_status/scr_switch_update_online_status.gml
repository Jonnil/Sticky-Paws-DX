function scr_switch_update_online_status(show_login_screen = true)
{

	#region /* Update Switch Online Status */
	if (os_type == os_switch)
	{
		if (!variable_global_exists("switch_login_cancelled"))
		{
			global.switch_login_cancelled = false;
		}
		if (!variable_global_exists("switch_active_account_id"))
		{
			global.switch_active_account_id = -1;
		}
		if (!variable_global_exists("switch_online_token_account_id"))
		{
			global.switch_online_token_account_id = -1;
		}
		if (!variable_global_exists("switch_login_cancelled_account_id"))
		{
			global.switch_login_cancelled_account_id = -1;
		}

		var raw_preselected_user_id = scr_switch_capture_preselected_user(true);
		var active_user_id = global.switch_active_account_id;
		var has_active_user = scr_switch_has_account_id(active_user_id);
		scr_switch_refresh_account_debug_info(raw_preselected_user_id, active_user_id);

		if (!os_is_network_connected(network_connect_passive))
		{
			global.switch_logged_in = false;
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			global.online_token_error_message = "System is not connected to the network.";
			global.online_current_attempt_result = l10n_text("No network connection");
			show_debug_message("[scr_switch_update_online_status] Network connection FAIL (passive check). Global login flags set to false.");
			return;
		}

		global.online_token_error_message = "";
		global.online_token_source = l10n_text("Switch Account Services");

		if (show_login_screen)
		{
			scr_switch_clear_cancelled_for_active_account();
		}

		if (!has_active_user)
		&& show_login_screen
		{
			var selected_user_id = switch_accounts_select_account(
				true,	/* isSinglePlayer */
				false,	/* showOnlineCapableOnly */
				false	/* canSkip */
			);

			if (!scr_switch_has_account_id(selected_user_id))
			{
				scr_switch_mark_login_cancelled(global.switch_active_account_id);
				global.switch_logged_in = false;
				global.online_token_validated = false;
				global.switch_account_network_service_available = false;
				global.online_token_error_message = "Account selection cancelled.";
				global.online_current_attempt_result = l10n_text("Account selection cancelled");
				scr_switch_refresh_account_debug_info(raw_preselected_user_id, global.switch_active_account_id);
				return;
			}

			scr_switch_set_active_account(selected_user_id, true);
			scr_switch_clear_cancelled_for_active_account();
			active_user_id = global.switch_active_account_id;
			has_active_user = scr_switch_has_account_id(active_user_id);
			scr_switch_refresh_account_debug_info(raw_preselected_user_id, active_user_id);
		}

		if (!has_active_user)
		{
			global.switch_logged_in = false;
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			global.online_token_error_message = "No active Switch account selected.";
			global.online_current_attempt_result = l10n_text("No active Switch account");
			show_debug_message("[scr_switch_update_online_status] No active Switch account was found.");
			return;
		}

		global.switch_logged_in = switch_accounts_is_user_open(active_user_id);

		if (scr_switch_has_account_id(global.switch_online_token_account_id))
		&& (global.switch_online_token_account_id != active_user_id)
		{
			global.online_token_validated = false;
			global.online_token_request = -1;
		}

		if (!show_login_screen)
		{
			if (global.online_token_validated)
			&& (global.switch_online_token_account_id == active_user_id)
			{
				global.switch_account_network_service_available = true;
				global.online_token_error_message = "";
				global.online_current_attempt_result = l10n_text("Valid ID Token");
				show_debug_message("[scr_switch_update_online_status] Passive refresh kept validated token for active account " + string(active_user_id) + ".");
			}
			else
			{
				global.switch_account_network_service_available = false;
				global.online_token_error_message = "Passive Switch online checks do not open Nintendo Account UI.";
				global.online_current_attempt_result = l10n_text("Token not validated");
				show_debug_message("[scr_switch_update_online_status] Passive refresh for active account " + string(active_user_id) + " skipped login/token validation.");
			}

			scr_switch_refresh_account_debug_info(raw_preselected_user_id, active_user_id);
			return;
		}

		global.switch_account_network_service_available = switch_accounts_network_service_available(active_user_id);

		var login_success = switch_accounts_login_user(active_user_id);

		if (!login_success)
		{
			global.switch_logged_in = false;
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			global.online_token_request = -1;

			if (show_login_screen)
			{
				scr_log("WARN", "SWITCH.ACCOUNTS", "login_failed", "account_id=" + string(active_user_id));
				scr_switch_mark_login_cancelled(active_user_id);
				global.online_token_error_message = "Login cancelled for active account " + string(active_user_id);
				global.online_current_attempt_result = l10n_text("Login cancelled");
			}
			else
			{
				global.online_token_error_message = "Silent login unavailable for active account " + string(active_user_id);
				global.online_current_attempt_result = l10n_text("Token not validated");
			}

			scr_switch_refresh_account_debug_info(raw_preselected_user_id, active_user_id);
			return;
		}

		global.switch_logged_in = true;
		global.switch_account_network_service_available = switch_accounts_network_service_available(active_user_id);
		global.switch_login_cancelled = false;
		global.switch_login_cancelled_account_id = -1;
		scr_switch_refresh_account_debug_info(raw_preselected_user_id, active_user_id);

		if (!global.switch_account_network_service_available)
		{
			global.online_token_validated = false;
			global.online_token_error_message = "Nintendo Account not linked for active account " + string(active_user_id);
			global.online_current_attempt_result = l10n_text("Nintendo Account not linked");
			show_debug_message("[scr_switch_update_online_status] Active account lacks network service: " + string(active_user_id));
			return;
		}

		var id_token = switch_accounts_get_online_token(active_user_id);
		global.online_token_present = (id_token != ""
									&& id_token != undefined
									&& id_token != false);
		global.online_token_expired = false;

		if (!global.online_token_present)
		{
			global.online_token_validated = false;
			global.switch_online_token_account_id = -1;
			global.online_token_error_message = "ID Token retrieval failed for active account " + string(active_user_id);
			global.online_current_attempt_result = l10n_text("Invalid ID Token");
			show_debug_message("[scr_switch_update_online_status] Invalid ID Token for active account " + string(active_user_id));
			return;
		}

		scr_switch_dispatch_token_validation_request(active_user_id, id_token, "interactive active account");
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

function scr_switch_dispatch_token_validation_request(active_user_id, id_token, request_source = "active account")
{
	if (!scr_switch_has_account_id(active_user_id))
	{
		return false;
	}

	if (global.online_token_validated)
	&& (global.switch_online_token_account_id == active_user_id)
	{
		global.online_token_error_message = "";
		global.online_current_attempt_result = l10n_text("Valid ID Token");
		show_debug_message("[scr_switch_dispatch_token_validation_request] Token already validated for " + string(request_source) + " " + string(active_user_id) + ". Skipping validation.");
		return true;
	}

	if (global.online_token_request != -1)
	&& (global.switch_online_token_account_id == active_user_id)
	{
		global.online_current_attempt_result = l10n_text("Token validation required");
		show_debug_message("[scr_switch_dispatch_token_validation_request] Token validation already pending for " + string(request_source) + " " + string(active_user_id) + ". HTTP request ID: " + string(global.online_token_request));
		return false;
	}

	var token_validation_headers = ds_map_create();
	ds_map_add(token_validation_headers, "Content-Type", "application/json");
	ds_map_add(token_validation_headers, "User-Agent", "gmdownloader");
	ds_map_add(token_validation_headers, "X-API-Key", global.api_key);

	global.switch_online_token_account_id = active_user_id;
	global.online_token_validated = false;
	global.online_token_request = http_request(
		"https://" + global.base_url + "/validate_token?id_token=" + string(id_token),
		"GET",
		token_validation_headers,
		""
	);

	ds_map_destroy(token_validation_headers);

	if (global.online_token_request == -1)
	{
		global.switch_online_token_account_id = -1;
		global.online_token_error_message = "Failed to start token validation for " + string(request_source) + " " + string(active_user_id);
		global.online_current_attempt_result = l10n_text("Token validation request failed");
		scr_log("ERROR", "HTTP.AUTH", "token_validation_request_failed",
			"account_id=" + string(active_user_id) +
			", source=" + string(request_source));
		return false;
	}

	global.online_current_attempt_result = l10n_text("Token validation required");
	show_debug_message("[scr_switch_dispatch_token_validation_request] Sent token validation request for " + string(request_source) + " " + string(active_user_id) + ". HTTP request ID: " + string(global.online_token_request));
	return false;
}

function scr_switch_has_account_id(account_id)
{
	return !is_undefined(account_id)
		&& is_real(account_id)
		&& (account_id != noone)
		&& account_id >= 0;
}

function scr_switch_set_active_account(account_id, reset_token_state = true)
{
	if (!variable_global_exists("switch_active_account_id"))
	{
		global.switch_active_account_id = -1;
	}

	var previous_account_id = global.switch_active_account_id;

	if (!scr_switch_has_account_id(account_id))
	{
		global.switch_active_account_id = -1;
		global.switch_account_name = noone;
		global.switch_account_handle = noone;
		global.switch_account_netid = noone;
		global.switch_logged_in = false;
		global.switch_account_network_service_available = false;
		scr_switch_refresh_login_cancelled_state();
		return false;
	}

	account_id = floor(account_id);
	global.switch_active_account_id = account_id;
	global.switch_account_handle = account_id;
	global.switch_account_name = switch_accounts_get_nickname(account_id);
	global.switch_account_netid = noone;
	global.switch_logged_in = switch_accounts_is_user_open(account_id);

	if (reset_token_state)
	&& (previous_account_id != account_id)
	{
		global.online_token_validated = false;
		global.online_token_request = -1;
		global.switch_online_token_account_id = -1;
		global.online_token_error_message = "";
	}

	scr_switch_refresh_login_cancelled_state();
	return true;
}

function scr_switch_capture_preselected_user(reset_token_state = true)
{
	if (os_type != os_switch)
	{
		return -1;
	}

	var preselected_user_id = switch_accounts_open_preselected_user();
	global.switch_accounts_open_preselected_user_result = preselected_user_id;

	if (scr_switch_has_account_id(preselected_user_id))
	{
		scr_switch_set_active_account(preselected_user_id, reset_token_state);
	}
	else
	if (!scr_switch_has_account_id(global.switch_active_account_id))
	{
		scr_switch_set_active_account(-1, reset_token_state);
	}

	return preselected_user_id;
}

function scr_switch_refresh_login_cancelled_state()
{
	var active_account_id = variable_global_exists("switch_active_account_id")
		? global.switch_active_account_id
		: -1;
	var cancelled_account_id = variable_global_exists("switch_login_cancelled_account_id")
		? global.switch_login_cancelled_account_id
		: -1;

	global.switch_login_cancelled = scr_switch_has_account_id(active_account_id)
		&& scr_switch_has_account_id(cancelled_account_id)
		&& (active_account_id == cancelled_account_id);
}

function scr_switch_mark_login_cancelled(account_id = -1)
{
	if (!scr_switch_has_account_id(account_id))
	{
		account_id = variable_global_exists("switch_active_account_id")
			? global.switch_active_account_id
			: -1;
	}

	if (scr_switch_has_account_id(account_id))
	{
		global.switch_login_cancelled_account_id = floor(account_id);
	}
	else
	{
		global.switch_login_cancelled_account_id = -1;
	}

	scr_switch_refresh_login_cancelled_state();
}

function scr_switch_clear_cancelled_for_active_account()
{
	var active_account_id = variable_global_exists("switch_active_account_id")
		? global.switch_active_account_id
		: -1;

	if (scr_switch_has_account_id(active_account_id))
	&& (global.switch_login_cancelled_account_id == active_account_id)
	{
		global.switch_login_cancelled_account_id = -1;
	}

	scr_switch_refresh_login_cancelled_state();
}

function scr_switch_try_startup_token_prefetch()
{
	if (os_type != os_switch)
	{
		return false;
	}

	if (!variable_global_exists("switch_startup_token_prefetch_active"))
	{
		global.switch_startup_token_prefetch_active = false;
	}
	if (!variable_global_exists("switch_startup_resume_language_update"))
	{
		global.switch_startup_resume_language_update = false;
	}

	if (!global.switch_startup_token_prefetch_active)
	{
		return false;
	}

	if (global.language_auto_update_interval != 1)
	{
		global.switch_startup_resume_language_update = false;
		global.switch_startup_token_prefetch_active = false;
		return false;
	}

	var raw_preselected_user_id = scr_switch_capture_preselected_user(false);
	var active_user_id = global.switch_active_account_id;
	scr_switch_refresh_account_debug_info(raw_preselected_user_id, active_user_id);

	if (!scr_switch_has_account_id(active_user_id))
	{
		global.switch_startup_resume_language_update = false;
		global.switch_startup_token_prefetch_active = false;
		show_debug_message("[scr_switch_try_startup_token_prefetch] No active startup account found. Skipping startup token prefetch.");
		return false;
	}

	if (!os_is_network_connected(network_connect_passive))
	{
		global.switch_startup_resume_language_update = false;
		global.switch_startup_token_prefetch_active = false;
		global.online_token_error_message = "Startup token prefetch skipped because the system is offline.";
		global.online_current_attempt_result = l10n_text("No network connection");
		show_debug_message("[scr_switch_try_startup_token_prefetch] Passive network unavailable. Skipping startup token prefetch.");
		return false;
	}

	if (global.online_token_validated)
	&& (global.switch_online_token_account_id == active_user_id)
	{
		global.switch_startup_resume_language_update = false;
		global.switch_startup_token_prefetch_active = false;
		show_debug_message("[scr_switch_try_startup_token_prefetch] Startup account " + string(active_user_id) + " already has a validated token. Starting language update immediately.");
		scr_language_pack_update(true);
		return true;
	}

	if (global.online_token_request != -1)
	&& (global.switch_online_token_account_id == active_user_id)
	{
		global.switch_startup_resume_language_update = true;
		global.switch_startup_token_prefetch_active = false;
		show_debug_message("[scr_switch_try_startup_token_prefetch] Token validation already pending for startup account " + string(active_user_id) + ".");
		return false;
	}

	global.switch_logged_in = switch_accounts_is_user_open(active_user_id);
	global.switch_account_network_service_available = switch_accounts_network_service_available(active_user_id);

	if (!global.switch_account_network_service_available)
	{
		global.switch_startup_token_prefetch_active = false;
		global.switch_startup_resume_language_update = false;
		global.online_token_validated = false;
		global.online_token_error_message = "Startup token prefetch skipped because the active account is not linked to a Nintendo Account.";
		global.online_current_attempt_result = l10n_text("Nintendo Account not linked");
		show_debug_message("[scr_switch_try_startup_token_prefetch] Active startup account " + string(active_user_id) + " is not linked. Skipping token retrieval.");
		return false;
	}

	show_debug_message("[scr_switch_try_startup_token_prefetch] Active startup account " + string(active_user_id) + " is linked. Attempting silent Switch Online login.");
	var startup_login_success = switch_accounts_login_user(active_user_id);

	if (!startup_login_success)
	{
		global.switch_startup_token_prefetch_active = false;
		global.switch_startup_resume_language_update = false;
		global.switch_logged_in = false;
		global.online_token_validated = false;
		global.online_token_error_message = "Startup token prefetch could not log the active account into Switch Online.";
		global.online_current_attempt_result = l10n_text("Token not validated");
		show_debug_message("[scr_switch_try_startup_token_prefetch] Silent startup login failed for account " + string(active_user_id) + ".");
		return false;
	}

	global.switch_logged_in = true;
	global.switch_login_cancelled = false;
	global.switch_login_cancelled_account_id = -1;
	global.switch_account_network_service_available = switch_accounts_network_service_available(active_user_id);

	var id_token = switch_accounts_get_online_token(active_user_id);
	global.online_token_present = (id_token != ""
								&& id_token != undefined
								&& id_token != false);
	global.online_token_expired = false;

	if (!global.online_token_present)
	{
		global.switch_startup_token_prefetch_active = false;
		global.switch_startup_resume_language_update = false;
		global.online_token_validated = false;
		global.online_token_error_message = "Startup token prefetch could not retrieve an ID token for the active account.";
		global.online_current_attempt_result = l10n_text("Invalid ID Token");
		show_debug_message("[scr_switch_try_startup_token_prefetch] Silent token retrieval failed for startup account " + string(active_user_id) + ".");
		return false;
	}

	global.switch_startup_resume_language_update = true;
	global.switch_startup_token_prefetch_active = false;
	show_debug_message("[scr_switch_try_startup_token_prefetch] Retrieved startup token for active account " + string(active_user_id) + ". Starting validation request.");
	scr_switch_dispatch_token_validation_request(active_user_id, id_token, "startup active account");
	return false;
}

function scr_switch_refresh_account_debug_info(raw_preselected_user_index = -1, probe_user_index = -1)
{
	if (os_type != os_switch)
	{
		return;
	}

	var account_count = switch_accounts_get_accounts();
	var probe_user_is_open = false;
	var probe_user_open_text = "n/a";
	var open_states = "";

	if (scr_switch_has_account_id(probe_user_index))
	{
		probe_user_is_open = switch_accounts_is_user_open(probe_user_index);
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
	global.switch_accounts_open_preselected_user_result = raw_preselected_user_index;
	global.switch_accounts_probe_user_index = probe_user_index;
	global.switch_accounts_is_user_open_result = probe_user_is_open;
	global.switch_accounts_open_states = open_states;

	var snapshot = "count=" + string(account_count)
		+ ", preselected=" + string(raw_preselected_user_index)
		+ ", probe=" + string(probe_user_index)
		+ ", is_user_open=" + probe_user_open_text
		+ ", states=[" + open_states + "]";

	if (global.switch_accounts_last_snapshot != snapshot)
	{
		var log_level = (global.switch_accounts_last_snapshot == "") ? "INFO" : "DEBUG";
		scr_log(log_level, "SWITCH.ACCOUNTS", "account_snapshot", snapshot);
		global.switch_accounts_last_snapshot = snapshot;
	}
}
