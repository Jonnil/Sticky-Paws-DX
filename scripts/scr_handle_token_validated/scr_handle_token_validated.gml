function scr_handle_token_validated()
{
	/* Check if the current request "online_token_validated" matches the one we sent */
	if (async_load[? "id"] == global.online_token_request)
	//&& (global.online_enabled)
	&& (!global.online_token_validated)
	{
		var resume_pending_language_update = global.language_update_pending
			&& (!global.language_update_blocked);
		var resume_startup_language_update = variable_global_exists("switch_startup_resume_language_update")
			&& global.switch_startup_resume_language_update;
		var token_validation_succeeded = false;
		var request_account_id = variable_global_exists("switch_online_token_account_id")
			? global.switch_online_token_account_id
			: -1;
		var active_account_id = variable_global_exists("switch_active_account_id")
			? global.switch_active_account_id
			: -1;

		if (os_type == os_switch)
		&& (scr_switch_has_account_id(request_account_id))
		&& (scr_switch_has_account_id(active_account_id))
		&& (request_account_id != active_account_id)
		{
			global.online_token_validated = false;
			global.online_token_error_message = "Discarded token response for inactive Switch account.";
			global.online_token_request = -1;
			global.switch_startup_resume_language_update = false;
			scr_log("WARN", "HTTP.AUTH", "token_response_discarded",
				"request_account_id=" + string(request_account_id) +
				", active_account_id=" + string(active_account_id));
			return;
		}

		/* Get the status code and response body */
		var status_code = async_load[? "http_status"];
		var response_str = async_load[? "result"];

		/* Check if the response status is 200 (OK) */
		if (status_code == 200)
		{
			var response_json = json_decode(response_str);
			var payload_present = false;
			var validation_failed = false;
			var validation_error_message = "";
			var malformed_response = (response_json == undefined)
				|| !ds_exists(response_json, ds_type_map);

			if (response_json != undefined)
			&& ds_exists(response_json, ds_type_map)
			{
				if (ds_map_exists(response_json, "data"))
				{
					var response_data = response_json[? "data"];
					payload_present = is_string(response_data)
						&& (string_length(response_data) > 0);
				}

				if (ds_map_exists(response_json, "success"))
				&& (response_json[? "success"] == false)
				{
					validation_failed = true;
				}
				else
				if (ds_map_exists(response_json, "valid"))
				&& (response_json[? "valid"] == false)
				{
					validation_failed = true;
				}

				if (validation_failed)
				{
					if (ds_map_exists(response_json, "message"))
					{
						validation_error_message = string(response_json[? "message"]);
					}
					else
					if (ds_map_exists(response_json, "error"))
					{
						validation_error_message = string(response_json[? "error"]);
					}
				}
			}

			if (!validation_failed)
			&& (!malformed_response)
			{
				global.online_token_validated = true;
				global.online_token_rejected = false;
				global.online_token_expired = false;
				scr_clear_online_failure();
				token_validation_succeeded = true;
				global.switch_online_token_account_id = request_account_id;
				global.online_token_error_message = "";

				scr_log("INFO", "HTTP.AUTH", "token_validated",
					"http_status=200, validated=" + string(global.online_token_validated) +
					", account_id=" + string(request_account_id) +
					", payload_present=" + string(payload_present));

				scr_get_todays_upload_count(); /* Update the todays upload count whenever you first go online */
			}
			else
			{
				global.online_token_validated = false;
				global.online_token_rejected = !malformed_response;
				global.online_token_expired = !malformed_response
					&& scr_token_response_reports_expiry(response_json);
				if (malformed_response)
				{
					scr_record_online_failure("http_response", "token_validation_invalid_json", status_code);
				}
				else
				{
					scr_record_online_failure("token_rejected", "token_validation_payload", status_code);
				}
				global.language_update_pending = false;
				global.language_update_allow_without_online_enabled = false;
				global.switch_startup_resume_language_update = false;
				global.language_update_status_message = malformed_response
					? "Translation update could not continue because token validation returned an invalid response."
					: "Translation update could not continue because account validation failed.";
				global.language_update_status_color = c_red;
				global.online_token_error_message = malformed_response
					? "Token validation returned invalid JSON."
					: (validation_error_message != "" ? validation_error_message : "Token validation failed.");
				scr_log("ERROR", "HTTP.AUTH", "token_validation_failed_payload",
					"http_status=200, account_id=" + string(request_account_id) +
					", error=" + string(global.online_token_error_message));
			}

			if (response_json != undefined)
			&& ds_exists(response_json, ds_type_map)
			{
				ds_map_destroy(response_json);
			}
		}
		else
		{
			if (status_code == 0)
			{
				scr_log("ERROR", "HTTP.AUTH", "token_validation_network_failed",
					"validated=false, account_id=" + string(request_account_id));
				scr_invalidate_online_session("token_validation_http_status_0", "scr_handle_token_validated");

				if (variable_instance_exists(self, "menu"))
				{
					scr_route_network_async_failure_to_menu(true);
				}

				return;
			}

			global.online_token_validated = false; /* Set it to false, can only be a boolean value */
			global.online_token_rejected = (status_code == 401) || (status_code == 403);
			global.online_token_expired = false;
			if (global.online_token_rejected)
			{
				var rejected_response = json_decode(response_str);
				global.online_token_expired = scr_token_response_reports_expiry(rejected_response);
				if (rejected_response != undefined)
				&& ds_exists(rejected_response, ds_type_map)
				{
					ds_map_destroy(rejected_response);
				}
				scr_record_online_failure("token_rejected", "token_validation_http", status_code);
			}
			else
			{
				scr_record_online_failure("http_response", "token_validation_http", status_code);
			}
			global.language_update_pending = false;
			global.language_update_allow_without_online_enabled = false;
			global.switch_startup_resume_language_update = false;
			global.language_update_status_message = global.online_token_rejected
				? "Translation update could not continue because account validation failed."
				: "Translation update could not continue because the server request failed.";
			global.language_update_status_color = c_red;
			global.online_token_error_message = "Token validation returned HTTP " + string(status_code) + ".";
			scr_log("ERROR", "HTTP.AUTH", "token_validation_failed",
				"validated=" + string(global.online_token_validated) +
				", account_id=" + string(request_account_id));
		}

		global.online_token_request = -1;

		if (token_validation_succeeded)
		&& (resume_pending_language_update || resume_startup_language_update)
		{
			global.switch_startup_resume_language_update = false;
			scr_log("INFO", "LANG.UPDATE", "resume_after_token_validation",
				"account_id=" + string(request_account_id) +
				", startup_resume=" + string(resume_startup_language_update) +
				", pending_resume=" + string(resume_pending_language_update));
			scr_language_pack_update(true);
		}
	}
}

function scr_token_response_reports_expiry(_response)
{
	if (_response == undefined)
	|| !ds_exists(_response, ds_type_map)
	{
		return false;
	}

	if (ds_map_exists(_response, "expired"))
	&& (_response[? "expired"] == true)
	{
		return true;
	}

	var response_code = "";
	if (ds_map_exists(_response, "error_code"))
	{
		response_code = string_lower(string(_response[? "error_code"]));
	}
	else
	if (ds_map_exists(_response, "code"))
	{
		response_code = string_lower(string(_response[? "code"]));
	}
	else
	if (ds_map_exists(_response, "error"))
	{
		response_code = string_lower(string(_response[? "error"]));
	}

	return response_code == "token_expired";
}
