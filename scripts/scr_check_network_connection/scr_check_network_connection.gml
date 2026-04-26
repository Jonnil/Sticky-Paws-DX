/// @function scr_check_network_connection(connect_mode, allow_account_prompt)
/// @description Wrapper function for network connectivity with debug override.
function scr_check_network_connection(connect_mode, allow_account_prompt = false)
{

	#region /* Check if debug override is enabled to simulate network errors (Only in test run mode) */
	if (global.debug_force_network_error)
	&& (GM_build_type == "run") /* Only enable debug features in test run, and not executable */
	{
		show_debug_message("[scr_check_network_connection] Debug override enabled: 'global.debug_force_network_error': " + string(global.debug_force_network_error));

		/* Default to false (simulate no network connection) */
		var debug_state = false;

		/* If holding down the shift key or gamepad select is pressed, force the network check to succeed */
		if (keyboard_check(vk_shift)
		|| gamepad_button_check(global.player_slot[1], gp_select))
		{
			debug_state = true;
			global.online_token_validated = true;
			global.online_enabled = true;
			show_debug_message("[scr_check_network_connection] Debug override keys detected (vk_shift or gp_select). Forcing network connection TRUE.");
		}
		else
		{
			global.online_token_validated = false;
			global.online_enabled = false;
			show_debug_message("[scr_check_network_connection] No debug override key pressed. Forcing network connection FALSE.");
		}

		show_debug_message("[scr_check_network_connection] Returning debug_state: " + string(debug_state));
		return debug_state;
	}
	#endregion /* Check if debug override is enabled to simulate network errors (Only in test run mode) END */

	var active_network_request = (connect_mode != network_connect_passive);
	var passive_network_status = scr_get_cached_passive_network_status(false);
	var actual_network_status = passive_network_status;

	if (!passive_network_status)
	&& (!active_network_request)
	{
		global.online_token_validated = false;
		global.switch_account_network_service_available = false;
		global.online_token_error_message = "System is not connected to the network.";
		global.online_current_attempt_result = l10n_text("No network connection");
		show_debug_message("[scr_check_network_connection] Passive network unavailable. Skipping Switch account/token validation.");
		return false;
	}

	if (active_network_request)
	{
		if (!scr_can_submit_active_network_request())
		{
			var reject_reason = "cooldown";

			if (scr_get_active_network_request_pending_raw())
			{
				reject_reason = "pending";
			}

			scr_nifm_log_active_request_rejected(reject_reason);
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			global.online_token_error_message = "System is not connected to the network.";
			global.online_current_attempt_result = l10n_text("No network connection");
			return false;
		}

		scr_mark_active_network_request_pending();
		scr_nifm_log_context("INFO", "active_request_submit_accepted",
			"connect_mode=active allow_account_prompt=" + scr_nifm_bool_string(allow_account_prompt)
			+ " passive_cached=" + scr_nifm_bool_string(passive_network_status));
		actual_network_status = os_is_network_connected(connect_mode);
		scr_set_cached_passive_network_status(actual_network_status);
		scr_nifm_log_context("DEBUG", "active_request_submit_returned",
			"actual_network_status=" + scr_nifm_bool_string(actual_network_status)
			+ " wait_for_async=" + scr_nifm_bool_string(os_type == os_switch && !actual_network_status));

		if (!actual_network_status)
		{
			global.online_token_validated = false;
			global.switch_account_network_service_available = false;
			global.online_token_error_message = "System is not connected to the network.";
			global.online_current_attempt_result = l10n_text("No network connection");

			if (os_type == os_switch)
			{
				scr_nifm_log_context("INFO", "waiting_for_nintendo_nifm_result",
					"in_game_network_error_visible=false");
				return false;
			}

			scr_clear_active_network_request_pending();
			scr_mark_active_network_request_submitted(2000000);
			scr_nifm_log_context("WARN", "active_request_failed_without_switch_async",
				"in_game_network_error_visible=true");
			return false;
		}

		scr_nifm_log_context("INFO", "active_request_succeeded_immediately",
			"will_validate_online_token=" + scr_nifm_bool_string(!global.online_token_validated));
		scr_clear_active_network_request_pending();
		global.online_active_network_request_cooldown_until = 0;
	}

	#region /* If online token has not been validated, update online status */
	if (!global.online_token_validated)
	{
		show_debug_message("[scr_check_network_connection] Online token not validated. Calling 'scr_switch_update_online_status(" + string(allow_account_prompt) + ")'...");

		if (os_type == os_switch)
		&& (allow_account_prompt)
		{
			scr_switch_capture_preselected_user(false);
			scr_switch_clear_cancelled_for_active_account();
		}

		scr_switch_update_online_status(allow_account_prompt);
		show_debug_message("[scr_check_network_connection] After update, global.online_token_validated = " + string(global.online_token_validated));
	}
	#endregion /* If online token has not been validated, update online status END */

	if (!active_network_request)
	{
		actual_network_status = passive_network_status;
	}

	/* Online Token must be validated before player is able to go online */
	if (global.online_token_validated
	&& actual_network_status)
	{
		if (active_network_request)
		|| (os_type == os_switch)
		{
			scr_nifm_log_online_check_succeeded(active_network_request);
		}

		/* Save last known online status, a timestamp that helps confirm whether the connection failed recently or has never worked */
		/* We know we *are* online, so record the timestamp */
		var ts = scr_format_timestamp(date_current_datetime());
		global.online_last_successful_check = string(ts);

		ini_open("save_file/config.ini");
		ini_write_string("config", "online_last_successful_check", string(ts));
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! Too many commited saves will go against guidelines */

		return true;
	}
	else
	{
		if (!global.online_token_validated)
		&& (!actual_network_status)
		{
			global.online_current_attempt_result = l10n_text("Token not validated AND network down");
		}
		else
		if (!global.online_token_validated)
		{
			global.online_current_attempt_result = l10n_text("Token not validated");
		}
		else
		if (!actual_network_status)
		{
			global.online_current_attempt_result = l10n_text("Network down");
		}

		show_debug_message("[scr_check_network_connection] Returning FALSE (online_token_validated: "
			+ string(global.online_token_validated)
			+ ", network status: "
			+ string(actual_network_status)
			+ ").");
		return false;
	}
}

function scr_get_cached_passive_network_status(force_refresh = false)
{
	/* On Switch, even passive probes can submit OS network requests. Keep this cached outside explicit checks. */
	var cache_initialized = variable_global_exists("online_cached_passive_network_initialized")
		&& global.online_cached_passive_network_initialized;

	if (!cache_initialized)
	{
		global.online_cached_passive_network_connected = false;
		global.online_cached_passive_network_checked_at = 0;
		global.online_cached_passive_network_initialized = true;

		if (force_refresh)
		|| (os_type != os_switch)
		{
			scr_set_cached_passive_network_status(os_is_network_connected(network_connect_passive));
		}
		return global.online_cached_passive_network_connected;
	}

	if (force_refresh)
	{
		scr_set_cached_passive_network_status(os_is_network_connected(network_connect_passive));
	}

	return global.online_cached_passive_network_connected;
}

function scr_set_cached_passive_network_status(network_connected)
{
	global.online_cached_passive_network_connected = network_connected;
	global.online_cached_passive_network_checked_at = get_timer();
	global.online_cached_passive_network_initialized = true;
}

function scr_nifm_bool_string(_value)
{
	if (_value)
	{
		return "true";
	}

	return "false";
}

function scr_nifm_get_active_network_request_id()
{
	if (!variable_global_exists("online_active_network_request_current_id"))
	{
		global.online_active_network_request_current_id = 0;
	}

	return global.online_active_network_request_current_id;
}

function scr_nifm_get_request_details(_extra_details = "")
{
	var details = "request_id=" + string(scr_nifm_get_active_network_request_id());

	if (variable_global_exists("online_active_network_request_started_from_menu"))
	&& (global.online_active_network_request_started_from_menu != "")
	{
		details += " started_from_menu=" + string(global.online_active_network_request_started_from_menu);
	}
	else
	if (variable_global_exists("online_active_network_request_last_started_from_menu"))
	&& (global.online_active_network_request_last_started_from_menu != "")
	{
		details += " started_from_menu=" + string(global.online_active_network_request_last_started_from_menu);
	}

	if (variable_instance_exists(self, "menu"))
	{
		details += " current_menu=" + string(menu);
	}

	if (variable_instance_exists(self, "caution_online_takes_you_to"))
	{
		details += " target_menu=" + string(caution_online_takes_you_to);
	}

	if (variable_instance_exists(self, "caution_online_takes_you_back_to"))
	{
		details += " fallback_menu=" + string(caution_online_takes_you_back_to);
	}

	details += " pending=" + scr_nifm_bool_string(scr_get_active_network_request_pending_raw());

	if (_extra_details != "")
	{
		details += " " + string(_extra_details);
	}

	return details;
}

function scr_nifm_log_context(_level, _message, _extra_details = "")
{
	scr_log(_level, "NIFM", _message, scr_nifm_get_request_details(_extra_details));
}

function scr_nifm_log_online_check_succeeded(_active_network_request)
{
	var request_id = scr_nifm_get_active_network_request_id();

	if (!_active_network_request)
	{
		if (!variable_global_exists("online_passive_check_succeeded_logged_request_id"))
		{
			global.online_passive_check_succeeded_logged_request_id = -1;
		}

		if (global.online_passive_check_succeeded_logged_request_id == request_id)
		{
			return;
		}

		global.online_passive_check_succeeded_logged_request_id = request_id;
	}
	else
	{
		global.online_passive_check_succeeded_logged_request_id = request_id;
	}

	scr_nifm_log_context("INFO", "online_check_succeeded",
		"active_request=" + scr_nifm_bool_string(_active_network_request)
		+ " online_token_validated=" + scr_nifm_bool_string(global.online_token_validated));
}

function scr_nifm_log_active_request_rejected(_reason)
{
	var request_id = scr_nifm_get_active_network_request_id();

	if (_reason == "pending")
	{
		if (!variable_global_exists("online_active_network_request_reject_logged_for_request"))
		|| (global.online_active_network_request_reject_logged_for_request != request_id)
		{
			global.online_active_network_request_reject_logged_for_request = request_id;
			scr_nifm_log_context("WARN", "active_request_submit_rejected",
				"reason=pending duplicate_submit_prevented=true");
		}

		return;
	}

	static last_cooldown_reject_log_time = 0;

	if ((get_timer() - last_cooldown_reject_log_time) > 1000000)
	{
		last_cooldown_reject_log_time = get_timer();
		scr_nifm_log_context("WARN", "active_request_submit_rejected",
			"reason=" + string(_reason) + " duplicate_submit_prevented=true");
	}
}

function scr_nifm_network_event_type_name(_network_event_type)
{
	if (_network_event_type == network_type_up)
	{
		return "network_type_up";
	}

	if (_network_event_type == network_type_up_failed)
	{
		return "network_type_up_failed";
	}

	if (_network_event_type == network_type_down)
	{
		return "network_type_down";
	}

	return string(_network_event_type);
}

function scr_nifm_input_action_name(_action)
{
	if (_action == action.up)
	{
		return "up";
	}

	if (_action == action.down)
	{
		return "down";
	}

	if (_action == action.left)
	{
		return "left";
	}

	if (_action == action.right)
	{
		return "right";
	}

	if (_action == action.accept)
	{
		return "accept";
	}

	if (_action == action.back)
	{
		return "back";
	}

	return string(_action);
}

function scr_nifm_log_blocked_input_attempt(_action, _hold, _player)
{
	var action_name = scr_nifm_input_action_name(_action);
	var request_id = scr_nifm_get_active_network_request_id();
	var log_key = string(request_id) + ":" + string(action_name) + ":" + string(_hold);

	if (!variable_global_exists("online_active_network_request_last_blocked_input_log_key"))
	|| (global.online_active_network_request_last_blocked_input_log_key != log_key)
	{
		global.online_active_network_request_last_blocked_input_log_key = log_key;
		scr_nifm_log_context("INFO", "modal_input_attempt_ignored",
			"action=" + string(action_name)
			+ " hold_mode=" + string(_hold)
			+ " player=" + string(_player)
			+ " input_locked=true");
	}
}

function scr_can_submit_active_network_request()
{
	if (!variable_global_exists("online_active_network_request_cooldown_until"))
	{
		global.online_active_network_request_cooldown_until = 0;
	}

	if (scr_is_active_network_request_pending())
	{
		return false;
	}

	return get_timer() >= global.online_active_network_request_cooldown_until;
}

function scr_get_active_network_request_pending_raw()
{
	return variable_global_exists("online_active_network_request_pending")
		&& global.online_active_network_request_pending;
}

function scr_mark_active_network_request_pending()
{
	if (!variable_global_exists("online_active_network_request_sequence"))
	{
		global.online_active_network_request_sequence = 0;
	}

	global.online_active_network_request_sequence++;
	global.online_active_network_request_current_id = global.online_active_network_request_sequence;
	global.online_active_network_request_pending = true;
	global.online_active_network_request_started_at = get_timer();
	global.online_active_network_request_modal_logged_id = -1;
	global.online_active_network_request_input_block_logged_id = -1;
	global.online_active_network_request_reject_logged_for_request = -1;

	if (variable_instance_exists(self, "menu"))
	{
		global.online_active_network_request_started_from_menu = string(menu);
	}
}

function scr_clear_active_network_request_pending()
{
	if (variable_global_exists("online_active_network_request_started_from_menu"))
	{
		global.online_active_network_request_last_started_from_menu = global.online_active_network_request_started_from_menu;
	}

	global.online_active_network_request_pending = false;
	global.online_active_network_request_started_at = 0;
	global.online_active_network_request_started_from_menu = "";
}

function scr_is_active_network_request_pending(timeout_microseconds = 120000000)
{
	if (!scr_get_active_network_request_pending_raw())
	{
		return false;
	}

	if (!variable_global_exists("online_active_network_request_started_at"))
	|| (global.online_active_network_request_started_at <= 0)
	{
		global.online_active_network_request_started_at = get_timer();
		return true;
	}

	if ((get_timer() - global.online_active_network_request_started_at) > timeout_microseconds)
	{
		scr_nifm_log_context("ERROR", "active_request_async_timeout",
			"timeout_microseconds=" + string(timeout_microseconds) + " will_show_in_game_network_error=true");
		global.online_token_validated = false;
		global.switch_account_network_service_available = false;
		global.online_token_error_message = "System is not connected to the network.";
		global.online_current_attempt_result = l10n_text("No network connection");
		global.online_last_network_async_failure_was_active_request = true;
		scr_set_cached_passive_network_status(false);
		scr_clear_active_network_request_pending();
		scr_mark_active_network_request_submitted(2000000);

		if (variable_instance_exists(self, "menu"))
		{
			scr_route_network_async_failure_to_menu(true);
		}

		return false;
	}

	return true;
}

function scr_mark_active_network_request_submitted(cooldown_microseconds = 2000000)
{
	global.online_active_network_request_cooldown_until = get_timer() + cooldown_microseconds;
}

function scr_is_network_request_modal_active()
{
	if (os_type != os_switch)
	{
		return false;
	}

	return scr_is_active_network_request_pending();
}

function scr_block_menu_input_for_network_request()
{
	if (!scr_is_network_request_modal_active())
	{
		return false;
	}

	var request_id = scr_nifm_get_active_network_request_id();

	if (!variable_global_exists("online_active_network_request_input_block_logged_id"))
	|| (global.online_active_network_request_input_block_logged_id != request_id)
	{
		global.online_active_network_request_input_block_logged_id = request_id;
		scr_nifm_log_context("INFO", "menu_input_blocked_by_network_request",
			"input_locked=true retry_back_navigation_disabled=true");
	}

	if (variable_instance_exists(self, "menu_delay"))
	{
		menu_delay = max(menu_delay, 3);
	}

	if (variable_instance_exists(self, "menu_joystick_delay"))
	{
		menu_joystick_delay = max(menu_joystick_delay, 3);
	}

	return true;
}

function scr_draw_network_request_modal()
{
	if (!scr_is_network_request_modal_active())
	{
		return false;
	}

	var request_id = scr_nifm_get_active_network_request_id();

	if (!variable_global_exists("online_active_network_request_modal_logged_id"))
	|| (global.online_active_network_request_modal_logged_id != request_id)
	{
		global.online_active_network_request_modal_logged_id = request_id;
		scr_nifm_log_context("INFO", "network_request_modal_drawn",
			"in_game_network_error_visible=false input_locked=true");
	}

	static last_draw_time = -1;

	if (last_draw_time == current_time)
	{
		return true;
	}

	last_draw_time = current_time;

	var window_width = display_get_gui_width();
	var window_height = display_get_gui_height();

	draw_set_alpha(0.9);
	draw_rectangle_color(0, 0, window_width, window_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);

	scr_draw_loading(1, window_width * 0.5, window_height * 0.5, "Loading");

	return true;
}

function scr_handle_networking_async_event(_network_async_data)
{
	if (!ds_map_exists(_network_async_data, "type"))
	{
		return;
	}

	var network_event_type = ds_map_find_value(_network_async_data, "type");
	var active_network_request_was_pending = scr_get_active_network_request_pending_raw();
	var network_event_type_name = scr_nifm_network_event_type_name(network_event_type);

	scr_nifm_log_context("DEBUG", "async_network_event_received",
		"event_type=" + string(network_event_type_name)
		+ " active_request_was_pending=" + scr_nifm_bool_string(active_network_request_was_pending));

	if (network_event_type == network_type_up)
	{
		var network_up_message = "network_available";

		if (active_network_request_was_pending)
		{
			network_up_message = "active_request_async_success";
		}

		scr_nifm_log_context("INFO", network_up_message,
			"event_type=" + string(network_event_type_name)
			+ " active_request_was_pending=" + scr_nifm_bool_string(active_network_request_was_pending)
			+ " will_validate_online_status=" + scr_nifm_bool_string(active_network_request_was_pending && global.online_enabled && !global.online_token_validated));
		scr_set_cached_passive_network_status(true);
		scr_clear_active_network_request_pending();
		global.online_active_network_request_cooldown_until = 0;

		if (active_network_request_was_pending)
		&& (global.online_enabled)
		&& (!global.online_token_validated)
		{
			scr_switch_update_online_status(true);
		}

		return;
	}

	if (network_event_type != network_type_up_failed)
	&& (network_event_type != network_type_down)
	{
		return;
	}

	scr_nifm_log_context("WARN", "active_request_async_failed_or_refused",
		"event_type=" + string(network_event_type_name)
		+ " active_request_was_pending=" + scr_nifm_bool_string(active_network_request_was_pending)
		+ " will_show_in_game_network_error=true");
	global.online_token_validated = false;
	global.switch_account_network_service_available = false;
	global.online_token_error_message = "System is not connected to the network.";
	global.online_current_attempt_result = l10n_text("No network connection");
	scr_set_cached_passive_network_status(false);
	scr_clear_active_network_request_pending();

	if (active_network_request_was_pending)
	|| (network_event_type == network_type_up_failed)
	{
		scr_mark_active_network_request_submitted(2000000);
	}

	global.online_last_network_async_failure_was_active_request = active_network_request_was_pending;

	if (variable_instance_exists(self, "debug_target"))
	&& (instance_exists(debug_target))
	{
		with (debug_target)
		{
			scr_route_network_async_failure_to_menu(global.online_last_network_async_failure_was_active_request);
		}
	}
	else
	{
		scr_route_network_async_failure_to_menu(active_network_request_was_pending);
	}
}

function scr_route_network_async_failure_to_menu(force_online_flow = false)
{
	if (!variable_instance_exists(self, "menu"))
	{
		scr_nifm_log_context("DEBUG", "route_network_error_skipped",
			"reason=no_menu_instance force_online_flow=" + scr_nifm_bool_string(force_online_flow));
		return false;
	}

	var current_menu = string(menu);
	var already_in_network_error_menu = (current_menu == "network_error")
		|| (current_menu == "network_error_copy_error_code")
		|| (current_menu == "network_error_main_menu");
	var is_online_flow = (current_menu == "caution_online_proceed")
		|| (current_menu == "network_error")
		|| (current_menu == "network_error_copy_error_code")
		|| (current_menu == "network_error_main_menu")
		|| (current_menu == "online_download_list_load")
		|| (current_menu == "searching_for_id")
		|| (current_menu == "report_send_to_server")
		|| (current_menu == "level_editor_upload_pressed")
		|| (current_menu == "upload_yes")
		|| (current_menu == "upload_yes_character")
		|| (current_menu == "click_upload_character")
		|| (current_menu == "language_check_updates")
		|| (string_copy(current_menu, 1, string_length("download_online")) == "download_online");

	if (!is_online_flow)
	&& (!force_online_flow)
	{
		scr_nifm_log_context("DEBUG", "route_network_error_skipped",
			"reason=not_online_flow force_online_flow=" + scr_nifm_bool_string(force_online_flow));
		return false;
	}

	if (variable_instance_exists(self, "search_for_id_still"))
	{
		search_for_id_still = false;
	}

	if (variable_instance_exists(self, "in_online_download_list_load_menu"))
	{
		in_online_download_list_load_menu = false;
	}

	if (variable_instance_exists(self, "can_navigate"))
	{
		can_navigate = true;
	}

	if (!already_in_network_error_menu)
	{
		scr_nifm_log_context("WARN", "show_in_game_network_error_after_nifm",
			"from_menu=" + string(current_menu)
			+ " to_menu=network_error force_online_flow=" + scr_nifm_bool_string(force_online_flow)
			+ " can_navigate=true");
		ini_open("save_file/config.ini");
		global.online_last_successful_check = ini_read_string("config", "online_last_successful_check", "Never");
		ini_close();

		global.online_error_code = scr_generate_network_error_code();

		var ts = scr_format_timestamp(date_current_datetime());
		time_of_network_error = string(ts);

		menu = "network_error";
	}
	else
	{
		var request_id = scr_nifm_get_active_network_request_id();

		if (!variable_global_exists("online_network_error_route_logged_request_id"))
		|| (global.online_network_error_route_logged_request_id != request_id)
		{
			global.online_network_error_route_logged_request_id = request_id;
			scr_nifm_log_context("DEBUG", "network_error_route_already_visible",
				"current_menu=" + string(current_menu) + " duplicate_route_prevented=true");
		}
	}

	if (variable_instance_exists(self, "menu_delay"))
	{
		if (already_in_network_error_menu)
		{
			menu_delay = min(max(menu_delay, 0), 3);
		}
		else
		{
			menu_delay = 3;
		}
	}

	return true;
}
