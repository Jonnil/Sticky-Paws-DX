/// @function scr_language_pack_update(forced)
/// @description This script checks if a language pack update should occur, based on the user's
/// chosen auto-update interval and the time elapsed since the last update. It also supports a
/// forced update (e.g., when the user clicks "Check for language pack updates").
function scr_language_pack_update(forced = false)
{
	static downloaded_language_pack_update = false;
	static background_last_state = "";
	var online_enabled = global.online_enabled;
	var token_validated = global.online_token_validated;
	var passive_connected = os_is_network_connected(network_connect_passive);
	var update_blocked = global.language_update_blocked;
	var update_pending = global.language_update_pending;
	var active_primary_request = global.online_primary_request_active;
	var allow_without_online_enabled = global.language_update_allow_without_online_enabled;

	if (forced)
	{
		global.language_update_allow_without_online_enabled = true;
		allow_without_online_enabled = true;
	}

	if (forced)
	{
		background_last_state = "";
		scr_log("INFO", "LANG.UPDATE", "check_start",
			"forced=" + string(forced) +
			", downloaded_this_session=" + string(downloaded_language_pack_update) +
			", blocked=" + string(update_blocked) +
			", pending=" + string(update_pending) +
			", online_enabled=" + string(online_enabled) +
			", online_opt_in_bypass=" + string(allow_without_online_enabled) +
			", token_validated=" + string(token_validated) +
			", passive_connected=" + string(passive_connected) +
			", active_primary_request=" + string(active_primary_request));
	}

	if (downloaded_language_pack_update
	&& !forced)
	{
		if (background_last_state != "skip_session_cached")
		{
			background_last_state = "skip_session_cached";
			scr_log("DEBUG", "LANG.UPDATE", "skip_session_cached");
		}
		return;
	}

	/* Do not start a language update while primary online downloads are running */
	if (update_blocked)
	{
		var has_primary_context = false;

		if (is_real(global.http_request_contexts)
		&& ds_exists(global.http_request_contexts, ds_type_map)
		&& active_primary_request != noone)
		{
			has_primary_context = ds_map_exists(global.http_request_contexts, string(active_primary_request));
		}

		if (active_primary_request == noone
		&& !has_primary_context)
		{
			if (forced)
			{
				scr_log("WARN", "LANG.UPDATE", "stale_block_detected", "action=clear_block");
			}
			else
			if (background_last_state != "stale_block_detected")
			{
				background_last_state = "stale_block_detected";
				scr_log("WARN", "LANG.UPDATE", "stale_block_detected", "action=clear_block");
			}
			global.language_update_blocked = false;
			update_blocked = false;
		}
		else
		{
			global.language_update_pending = true;
			global.language_update_status_message = "Translation update is waiting for another online request to finish.";
			global.language_update_status_color = c_yellow;

			if (forced)
			{
				scr_log("WARN", "LANG.UPDATE", "blocked_by_primary_request",
					"active_primary_request=" + string(active_primary_request) +
					", pending=" + string(global.language_update_pending));
			}
			else
			{
				var blocked_state = "blocked_by_primary_request:" + string(active_primary_request);

				if (background_last_state != blocked_state)
				{
					background_last_state = blocked_state;
					scr_log("WARN", "LANG.UPDATE", "blocked_by_primary_request",
						"active_primary_request=" + string(active_primary_request) +
						", pending=" + string(global.language_update_pending));
				}
			}
			return;
		}
	}

	if (!online_enabled
	&& !allow_without_online_enabled)
	{
		global.language_update_pending = false;
		global.language_update_status_message = "Translation updates are disabled until online features are enabled.";
		global.language_update_status_color = c_red;

		if (forced)
		{
			scr_log("WARN", "LANG.UPDATE", "abort_online_disabled");
		}
		else
		if (background_last_state != "abort_online_disabled")
		{
			background_last_state = "abort_online_disabled";
			scr_log("WARN", "LANG.UPDATE", "abort_online_disabled");
		}
		return;
	}

	if (!token_validated)
	{
		global.language_update_pending = false;
		global.language_update_allow_without_online_enabled = false;
		global.language_update_status_message = "Translation updates are unavailable because online validation has not completed.";
		global.language_update_status_color = c_red;

		if (forced)
		{
			scr_log("WARN", "LANG.UPDATE", "abort_token_not_validated");
		}
		else
		if (background_last_state != "abort_token_not_validated")
		{
			background_last_state = "abort_token_not_validated";
			scr_log("WARN", "LANG.UPDATE", "abort_token_not_validated");
		}
		return;
	}

	if (!passive_connected)
	{
		global.language_update_pending = false;
		global.language_update_allow_without_online_enabled = false;
		global.language_update_status_message = "Translation updates are unavailable because no passive network connection was detected.";
		global.language_update_status_color = c_red;

		if (forced)
		{
			scr_log("WARN", "LANG.UPDATE", "abort_no_passive_network");
		}
		else
		if (background_last_state != "abort_no_passive_network")
		{
			background_last_state = "abort_no_passive_network";
			scr_log("WARN", "LANG.UPDATE", "abort_no_passive_network");
		}
		return;
	}

	/* 1. Read the langauge last update time from config.ini */
	/*    We'll store it under the [language_updates] section, key: "language_last_update_real" */
	var config_path = game_save_id + "save_file/config.ini";
	ini_open(config_path);
	var language_last_update_real = ini_read_real("language_updates", "language_last_update_real", 0);
	ini_close();

	if (forced)
	{
		scr_log("DEBUG", "LANG.UPDATE", "last_update_loaded",
			"path=" + string(config_path) +
			", raw=" + string(language_last_update_real));
	}

	/* If we never stored it before, set it to an old date/time so that the next check can trigger */
	if (language_last_update_real == 0)
	{
		/* For convenience, pick an old date so the script sees it as "very old" */
		language_last_update_real = date_create_datetime(1971, 1, 1, 0, 0, 0);

		if (forced)
		{
			scr_log("DEBUG", "LANG.UPDATE", "last_update_missing", "fallback=1971-01-01");
		}
	}

	/* 2. Determine the user's chosen interval */
	var interval_choice = global.language_auto_update_interval;
	var interval_name = "unknown";

	switch (interval_choice)
	{
		case 0: interval_name = "never"; break;
		case 1: interval_name = "startup"; break;
		case 2: interval_name = "weekly"; break;
		case 3: interval_name = "monthly"; break;
		case 4: interval_name = "yearly"; break;
	}

	if (forced)
	{
		scr_log("DEBUG", "LANG.UPDATE", "interval_selected",
			"value=" + string(interval_choice) +
			", name=" + interval_name);
	}

	/* 3. If "Never" and not forced, we do nothing */
	if (interval_choice == 0
	&& !forced)
	{
		if (background_last_state != "skip_interval_never")
		{
			background_last_state = "skip_interval_never";
			scr_log("DEBUG", "LANG.UPDATE", "skip_interval_never");
		}
		return;
	}

	/* 4. Compute how long it’s been since the last update */
	var language_current_time = date_current_datetime();
	var diff_in_seconds = date_second_span(language_last_update_real, language_current_time);

	if (forced)
	{
		scr_log("DEBUG", "LANG.UPDATE", "elapsed_since_last_update",
			"seconds=" + string(diff_in_seconds));
	}

	/* 5. Based on the chosen interval, decide if we should skip or proceed with the update */
	/* If forced = true, we always skip these checks and proceed */
	if (!forced)
	{
		switch (interval_choice)
		{
			case 1:
				/* On Startup => Always update on startup, no time check needed */
				break;

			case 2:
				/* Each Week (7 days ~ 604,800 seconds) */
				if (diff_in_seconds < 604800)
				{
					if (background_last_state != "skip_interval_not_elapsed:weekly")
					{
						background_last_state = "skip_interval_not_elapsed:weekly";
						scr_log("DEBUG", "LANG.UPDATE", "skip_interval_not_elapsed",
							"interval=weekly, required_seconds=604800");
					}
					return;
				}
				break;

			case 3:
				/* Each Month (approx. 30 days ~ 2,592,000 seconds) */
				if (diff_in_seconds < 2592000)
				{
					if (background_last_state != "skip_interval_not_elapsed:monthly")
					{
						background_last_state = "skip_interval_not_elapsed:monthly";
						scr_log("DEBUG", "LANG.UPDATE", "skip_interval_not_elapsed",
							"interval=monthly, required_seconds=2592000");
					}
					return;
				}
				break;

			case 4:
				/* Each Year (approx. 365 days ~ 31,536,000 seconds) */
				if (diff_in_seconds < 31536000)
				{
					if (background_last_state != "skip_interval_not_elapsed:yearly")
					{
						background_last_state = "skip_interval_not_elapsed:yearly";
						scr_log("DEBUG", "LANG.UPDATE", "skip_interval_not_elapsed",
							"interval=yearly, required_seconds=31536000");
					}
					return;
				}
				break;

			default:
				if (forced)
				{
					scr_log("WARN", "LANG.UPDATE", "unknown_interval_value", "value=" + string(interval_choice));
				}
				else
				{
					var unknown_interval_state = "unknown_interval_value:" + string(interval_choice);

					if (background_last_state != unknown_interval_state)
					{
						background_last_state = unknown_interval_state;
						scr_log("WARN", "LANG.UPDATE", "unknown_interval_value", "value=" + string(interval_choice));
					}
				}
				break;
		}
	}
	else
	{
		scr_log("DEBUG", "LANG.UPDATE", "forced_update_bypasses_interval");
	}

	/* 6. If we get here, it means either forced is true, or the time threshold is met => Perform the update */
	if (forced)
	{
		scr_log("INFO", "LANG.UPDATE", "dispatch_download", "forced=" + string(forced));
	}
	scr_download_language_packs();

	if (global.language_http_request_id != -1)
	{
		downloaded_language_pack_update = true;
		global.language_update_pending = false;

		if (forced)
		{
			scr_log("INFO", "LANG.UPDATE", "download_started", "request_id=" + string(global.language_http_request_id));
		}
		else
		if (background_last_state != "download_started")
		{
			background_last_state = "download_started";
			scr_log("INFO", "LANG.UPDATE", "download_started", "request_id=" + string(global.language_http_request_id));
		}
	}
	else
	{
		global.language_update_allow_without_online_enabled = false;
		if (forced)
		{
			scr_log("WARN", "LANG.UPDATE", "download_not_started");
		}
		else
		if (background_last_state != "download_not_started")
		{
			background_last_state = "download_not_started";
			scr_log("WARN", "LANG.UPDATE", "download_not_started");
		}
	}
}
