/// @function scr_nwt_v2_flags()
/// @description Fixed NWT v2 schema. Append no fields here without changing the version.
function scr_nwt_v2_flags()
{
	var is_switch = (os_type == os_switch);
	var retry_operation = "";

	if (variable_instance_exists(self, "online_retry_context"))
	&& is_struct(online_retry_context)
	&& variable_instance_exists(self, "caution_online_takes_you_to")
	&& (caution_online_takes_you_to == "search_id_ok")
	{
		retry_operation = online_retry_context.operation;
	}

	return [
		{ name: "switch_build", active: is_switch },
		{ name: "online_enabled", active: global.online_enabled },
		{ name: "passive_network_connected", active: variable_global_exists("online_cached_passive_network_connected") && global.online_cached_passive_network_connected },
		{ name: "token_present", active: is_switch && global.online_token_present },
		{ name: "token_validated", active: is_switch && global.online_token_validated },
		{ name: "token_expired", active: is_switch && global.online_token_expired },
		{ name: "switch_logged_in", active: is_switch && global.switch_logged_in },
		{ name: "switch_network_service_available", active: is_switch && global.switch_account_network_service_available },
		{ name: "active_network_request_pending", active: variable_global_exists("online_active_network_request_pending") && global.online_active_network_request_pending },
		{ name: "selected_download_pending", active: retry_operation == "selected_download" },
		{ name: "manual_id_pending", active: retry_operation == "manual_id" },
		{ name: "failure_network", active: global.online_failure_kind == "network" },
		{ name: "failure_http_transport", active: global.online_failure_kind == "http_transport" },
		{ name: "failure_http_response", active: global.online_failure_kind == "http_response" },
		{ name: "failure_timeout", active: global.online_failure_kind == "timeout" },
		{ name: "failure_token_rejected", active: global.online_failure_kind == "token_rejected" },
		{ name: "failure_account", active: global.online_failure_kind == "account" }
	];
}

/// @function scr_generate_network_error_code()
/// @description Encode the fixed, versioned network warning trace without a matching INI file.
function scr_generate_network_error_code()
{
	if (os_type != os_switch)
	{
		global.online_error_bool_snapshot = scr_debug_collect_bool_globals();
	}

	var http_status = "---";
	if (global.online_failure_http_status >= 0)
	&& (global.online_failure_http_status <= 999)
	{
		http_status = string_replace_all(string_format(global.online_failure_http_status, 3, 0), " ", "0");
	}

	return "NWT-v2-" + scr_flags_to_base64(scr_nwt_v2_flags()) + "-H" + http_status;
}
