/// @function scr_debug_collect_bool_globals()
/// @description Capture names and values together; live globals can change after an error.
function scr_debug_collect_bool_globals()
{
	var names = struct_get_names(global);
	array_sort(names, true);
	var snapshot = [];

	for (var i = 0; i < array_length(names); i++)
	{
		var value = variable_struct_get(global, names[i]);
		if (is_bool(value))
		{
			array_push(snapshot, { name: names[i], active: value });
		}
	}

	return snapshot;
}

/// @function scr_debug_decode_nwt_code(code)
/// @description Decode v2 directly. Legacy codes require the exact saved BoolGlobals.ini snapshot.
function scr_debug_decode_nwt_code(_code)
{
	var code = string_trim(string(_code));
	var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
	var flags = [];
	var payload = "";
	var status = "Not recorded";
	var version = "";

	if (string_copy(code, 1, 7) == "NWT-v2-")
	{
		if (string_length(code) != 15)
		|| (string_copy(code, 11, 2) != "-H")
		{
			return { valid: false, reason: "Invalid NWT v2 length or status separator." };
		}

		payload = string_copy(code, 8, 3);
		var status_text = string_copy(code, 13, 3);
		if (status_text != "---")
		{
			if (string_length(string_digits(status_text)) != 3)
			{
				return { valid: false, reason: "Invalid NWT v2 HTTP status." };
			}
			status = string(real(status_text));
		}
		version = "v2";
	}
	else
	if (string_copy(code, 1, 4) == "NWT-")
	{
		var ini_path = game_save_id + "debug_logs/BoolGlobals.ini";
		if (!file_exists(ini_path))
		{
			return { valid: false, reason: "Legacy code needs its matching BoolGlobals.ini file." };
		}

		var file = file_text_open_read(ini_path);
		var in_flags = false;
		while (!file_text_eof(file))
		{
			var line = string_trim(file_text_readln(file));
			if (string_char_at(line, 1) == "[")
			{
				in_flags = (line == "[BoolGlobals]");
			}
			else
			if (in_flags)
			{
				var equals_at = string_pos("=", line);
				if (equals_at > 1)
				{
					var name = string_copy(line, 1, equals_at - 1);
					var raw_value = string_replace_all(string_trim(string_delete(line, 1, equals_at)), "\"", "");
					array_push(flags, { name: name, active: raw_value == "1.000000" });
				}
			}
		}
		file_text_close(file);

		if (array_length(flags) == 0)
		{
			return { valid: false, reason: "The legacy INI has no Boolean globals." };
		}

		var expected_payload = "";
		for (var first = 0; first < array_length(flags); first += 6)
		{
			var sextet = 0;
			for (var bit = 0; bit < 6; bit++)
			{
				if (first + bit < array_length(flags))
				&& (!flags[first + bit].active)
				{
					sextet = sextet | (1 << (5 - bit));
				}
			}
			expected_payload += string_char_at(alphabet, sextet + 1);
		}

		while (string_length(expected_payload) > 0)
		&& (string_char_at(expected_payload, string_length(expected_payload)) == "_")
		{
			expected_payload = string_delete(expected_payload, string_length(expected_payload), 1);
		}

		if (code != "NWT-" + expected_payload)
		{
			return { valid: false, reason: "The legacy INI values do not reproduce this code. Use the matching snapshot." };
		}

		return { valid: true, version: "legacy", flags: flags, http_status: status };
	}
	else
	{
		return { valid: false, reason: "Enter an NWT-v2 code or a legacy NWT code." };
	}

	var bits = "";
	for (var char_index = 1; char_index <= 3; char_index++)
	{
		var alphabet_index = string_pos(string_char_at(payload, char_index), alphabet);
		if (alphabet_index == 0)
		{
			return { valid: false, reason: "NWT v2 contains a character outside its alphabet." };
		}

		var sextet_value = alphabet_index - 1;
		for (var bit_index = 5; bit_index >= 0; bit_index--)
		{
			bits += ((sextet_value >> bit_index) & 1) == 1 ? "1" : "0";
		}
	}

	if (string_char_at(bits, 18) != "0")
	{
		return { valid: false, reason: "NWT v2 has a nonzero padding bit." };
	}

	var schema = scr_nwt_v2_flags();
	if (array_length(schema) != 17)
	{
		return { valid: false, reason: "The game does not recognize this NWT v2 schema." };
	}

	for (var flag_index = 0; flag_index < 17; flag_index++)
	{
		array_push(flags, {
			name: schema[flag_index].name,
			active: string_char_at(bits, flag_index + 1) == "1"
		});
	}

	return { valid: true, version: version, flags: flags, http_status: status };
}

/// @function scr_debug_start_network_error_preview()
/// @description Show a synthetic PC error without changing network connectivity.
function scr_debug_start_network_error_preview()
{
	if (os_type == os_switch) return;

	nwt_debug_preview_saved = {
		failure_kind: global.online_failure_kind,
		failure_origin: global.online_failure_origin,
		failure_http_status: global.online_failure_http_status,
		current_attempt_result: global.online_current_attempt_result,
		error_code: global.online_error_code,
		error_snapshot: variable_global_exists("online_error_bool_snapshot") ? global.online_error_bool_snapshot : undefined,
		retry_attempts: global.online_retry_attempts,
		return_target: caution_online_takes_you_to,
		error_time: variable_instance_exists(self, "time_of_network_error") ? time_of_network_error : ""
	};
	global.nwt_debug_preview_active = true;
	caution_online_takes_you_to = "";
	global.online_retry_attempts = 0;
	scr_record_online_failure("network", "debug_preview");
	time_of_network_error = scr_format_timestamp(date_current_datetime());
	global.online_error_code = scr_generate_network_error_code();
	menu = "network_error";
	menu_delay = 3;
	in_settings = false;
}

/// @function scr_debug_finish_network_error_preview()
function scr_debug_finish_network_error_preview()
{
	if (!variable_instance_exists(self, "nwt_debug_preview_saved")) return;
	var saved = nwt_debug_preview_saved;
	global.online_failure_kind = saved.failure_kind;
	global.online_failure_origin = saved.failure_origin;
	global.online_failure_http_status = saved.failure_http_status;
	global.online_current_attempt_result = saved.current_attempt_result;
	global.online_error_code = saved.error_code;
	global.online_error_bool_snapshot = saved.error_snapshot;
	global.online_retry_attempts = saved.retry_attempts;
	caution_online_takes_you_to = saved.return_target;
	time_of_network_error = saved.error_time;
	global.nwt_debug_preview_active = false;
	nwt_debug_preview_saved = undefined;
	global.settings_sidebar_menu = "debug_settings";
	in_settings = true;
	menu = "debug_network_error_preview";
	menu_delay = 3;
}

/// @function scr_debug_bool_globals_browser(from_network_error)
/// @description PC-only browser for live values, the last NWT snapshot, and entered codes.
function scr_debug_bool_globals_browser(_from_network_error = false)
{
	if (os_type == os_switch)
	{
		return;
	}

	if (!variable_instance_exists(self, "debug_bool_browser_mode"))
	{
		debug_bool_browser_mode = "live";
		debug_bool_browser_page = 0;
		debug_bool_browser_code = "";
		debug_bool_browser_decoded = undefined;
		debug_bool_browser_message = "";
	}

	var prefix = _from_network_error ? "network_error_details_" : "bool_globals_";
	var return_menu = _from_network_error ? "network_error" : "bool_globals_menu";
	var width = display_get_gui_width();
	var height = display_get_gui_height();
	var left = _from_network_error ? 30 : 400;
	var button_x = left + 10;
	var can_activate = (menu_delay == 0) && (menu_joystick_delay == 0);
	var modal = (menu == prefix + "input_ok") || (menu == prefix + "input_cancel");
	var ids = [prefix + "back", prefix + "live", prefix + "snapshot", prefix + "code", prefix + "prev", prefix + "next"];

	if (_from_network_error)
	{
		draw_set_alpha(0.94);
		draw_rectangle_color(0, 0, width, height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}

	if (!modal)
	{
		if (draw_menu_button(button_x, 82, l10n_text("Back"), ids[0], "") && can_activate)
		{
			menu = return_menu;
			menu_delay = 3;
			return;
		}
		if (draw_menu_button(button_x, 130, "Current BoolGlobals", ids[1], "") && can_activate)
		{
			debug_bool_browser_mode = "live";
			debug_bool_browser_page = 0;
			menu_delay = 3;
		}
		if (draw_menu_button(button_x, 178, "Network error snapshot", ids[2], "") && can_activate)
		{
			debug_bool_browser_mode = "error";
			debug_bool_browser_page = 0;
			menu_delay = 3;
		}
		if (draw_menu_button(button_x, 226, "Enter NWT code", ids[3], "") && can_activate)
		{
			input_key = true;
			keyboard_string = string(debug_bool_browser_code);
			menu = prefix + "input_ok";
			menu_delay = 3;
		}
		if (draw_menu_button(button_x, 274, "Previous page", ids[4], "") && can_activate)
		{
			debug_bool_browser_page = max(0, debug_bool_browser_page - 1);
			menu_delay = 3;
		}
		if (draw_menu_button(button_x, 322, "Next page", ids[5], "") && can_activate)
		{
			debug_bool_browser_page += 1;
			menu_delay = 3;
		}

		if (can_activate)
		&& ((key_up && !key_down) || (key_down && !key_up))
		{
			var current_index = 0;
			for (var id_index = 0; id_index < array_length(ids); id_index++)
			{
				if (menu == ids[id_index]) current_index = id_index;
			}
			current_index = (current_index + (key_down ? 1 : array_length(ids) - 1)) mod array_length(ids);
			menu = ids[current_index];
			menu_delay = 3;
		}

		if (_from_network_error && key_back_pressed && can_activate)
		{
			menu = return_menu;
			menu_delay = 3;
			return;
		}

		var button_positions = [82, 130, 178, 226, 274, 322];
		for (var selected_button = 0; selected_button < array_length(ids); selected_button++)
		{
			if (menu == ids[selected_button])
			{
				menu_cursor_y_position = button_positions[selected_button];
				break;
			}
		}
	}

	var flags = [];
	var heading = "Current BoolGlobals";
	var status_line = "Live values change while the game runs.";
	if (debug_bool_browser_mode == "live")
	{
		flags = scr_debug_collect_bool_globals();
	}
	else
	if (debug_bool_browser_mode == "error")
	{
		heading = "Network error snapshot";
		status_line = "Captured when the last PC NWT code was generated.";
		if (variable_global_exists("online_error_bool_snapshot"))
		&& is_array(global.online_error_bool_snapshot)
		{
			flags = global.online_error_bool_snapshot;
		}
		else
		{
			status_line = "No network error snapshot is available in this session.";
		}
	}
	else
	{
		heading = "Decoded NWT code";
		if (is_struct(debug_bool_browser_decoded))
		&& debug_bool_browser_decoded.valid
		{
			flags = debug_bool_browser_decoded.flags;
			status_line = "Format: " + debug_bool_browser_decoded.version
				+ "  HTTP status: " + debug_bool_browser_decoded.http_status;
		}
		else
		{
			status_line = debug_bool_browser_message;
		}
	}

	var flag_row_y = 455;
	var page_size = max(4, floor((height - flag_row_y - 15) / 31));
	var page_count = max(1, ceil(array_length(flags) / page_size));
	debug_bool_browser_page = clamp(debug_bool_browser_page, 0, page_count - 1);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(left + 10, 38, heading, global.default_text_size * 1.3, c_black, c_white, 1);
	scr_draw_text_outlined(left + 10, 392, status_line, global.default_text_size * 0.8, c_black, c_white, 1);
	scr_draw_text_outlined(left + 10, 422, "Page " + string(debug_bool_browser_page + 1) + "/" + string(page_count)
		+ "  (" + string(array_length(flags)) + " flags)", global.default_text_size * 0.8, c_black, c_white, 1);

	var first_flag = debug_bool_browser_page * page_size;
	for (var row = 0; row < page_size; row++)
	{
		var index = first_flag + row;
		if (index >= array_length(flags)) break;
		var entry = flags[index];
		var label = (entry.active ? "TRUE  " : "FALSE ") + entry.name;
		scr_draw_text_outlined(left + 10, flag_row_y + row * 31, label, global.default_text_size * 0.78,
			c_black, entry.active ? c_lime : c_ltgray, 1);
	}

	if (!_from_network_error)
	{
		menu_cursor_y_position_end = height;
	}

	if (modal)
	{
		draw_set_alpha(0.85);
		draw_rectangle_color(0, 0, width, height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		scr_draw_text_outlined(width * 0.5, height * 0.5 - 90, "Enter NWT code", global.default_text_size * 1.3, c_black, c_white, 1);
		var edited_code = scr_draw_name_input_screen(debug_bool_browser_code, 80, c_black, 1, true,
			width * 0.5, height * 0.5, prefix + "input_ok", prefix + "input_cancel", false, true, false);
		if (global.clicking_ok_input_screen && can_activate)
		{
			debug_bool_browser_code = string_trim(edited_code);
			debug_bool_browser_decoded = scr_debug_decode_nwt_code(debug_bool_browser_code);
			debug_bool_browser_message = debug_bool_browser_decoded.valid ? "" : debug_bool_browser_decoded.reason;
			debug_bool_browser_mode = "code";
			debug_bool_browser_page = 0;
			input_key = false;
			menu = prefix + "code";
			menu_delay = 3;
		}
		else
		if (global.clicking_cancel_input_screen && can_activate)
		{
			input_key = false;
			menu = prefix + "code";
			menu_delay = 3;
		}
	}
}
