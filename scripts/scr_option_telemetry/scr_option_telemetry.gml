/// Localized diagnostics text uses the existing loaded grid, with English-key fallback.
/// A stale downloaded pack never causes a missing-key upload just by opening privacy controls.
function scr_telemetry_text(key)
{
	var text = string(key);
	if (variable_global_exists("translations") && global.translations != 0 && ds_exists(global.translations, ds_type_map)
	&& variable_global_exists("language_local_data") && global.language_local_data != 0 && ds_exists(global.language_local_data, ds_type_grid)
	&& ds_map_exists(global.translations, key))
	{
		var row = global.translations[? key];
		var column = global.selected_language_id;
		if (column >= 0 && column < ds_grid_width(global.language_local_data))
		{
			var candidate = string(global.language_local_data[# column, row]);
			if (candidate != "") text = candidate;
			else
			{
				candidate = string(global.language_local_data[# global.language_column_start, row]);
				if (candidate != "") text = candidate;
			}
		}
	}
	if (key == "Open Custom Character Folder" && text == "Open Custom Character Folder")
		text = "Custom Character Folder";
	return string_replace_all(text, "{br}", "\n");
}

/// Player diagnostics UI. Drawing queues deliberate actions; Step owns I/O and core calls.
function scr_telemetry_ui_init()
{
	if (variable_global_exists("telemetry_ui")) return;
	global.telemetry_ui = {
		owner : noone, action : undefined, page : "main", scroll : 0,
		rows : [], snapshot : undefined, dictionary : [], records : [], retry_choice : undefined,
		preview : "", preview_title : "", message : "", selected_record : "",
		manual_preview : undefined, current_record : undefined, text : "", delete_kind : "", crash_code : "", error_codes : [],
		policy_open : false, policy_web_confirm : false, policy_text : "", policy_scroll : 0,
		policy_max : 0, policy_caller : undefined, last_focus : "", return_focus : "telemetry_mode"
	};
}

/// Called once before tlm_step. Never invoked from Draw.
function scr_telemetry_ui_step()
{
	scr_telemetry_ui_init();
	var u = global.telemetry_ui;
	if (!variable_global_exists("telemetry")) return;
	u.snapshot = tlm_snapshot();
	u.dictionary = tlm_dictionary();
	u.error_codes = tlm_error_codes();
	if (u.snapshot.manual_open && !u.policy_open)
	{
		var still_reviewing = instance_exists(u.owner)
			&& u.owner.in_settings && global.settings_sidebar_menu == "telemetry_settings";
		if (!still_reviewing)
		{
			tlm_manual_cancel();
			u.manual_preview = undefined;
			u.page = "main";
		}
	}
	if (is_undefined(u.action)) return;
	var a = u.action;
	u.action = undefined;
	if (!instance_exists(a.owner)) return;
	u.owner = a.owner;
	with (a.owner)
	{
		var ui = global.telemetry_ui;
		var result = {ok:true, reason:""};
		switch (a.kind)
		{
			case "page":
				if (ui.page == "manual" && a.value != "policy") tlm_manual_cancel();
				ui.page = a.value;
				ui.scroll = 0;
				menu = "telemetry_row_0";
				if (a.value == "data") ui.records = tlm_list();
				if (a.value == "fields" || a.value == "included") ui.dictionary = tlm_dictionary();
				break;
			case "choice":
				result = tlm_apply_choice(a.key, a.value);
				if (result.ok) ui.retry_choice = undefined;
				else if (!tlm_snapshot().saved) ui.retry_choice = {key:a.key, value:a.value};
				ui.dictionary = tlm_dictionary();
				break;
			case "enable":
				result = tlm_apply_choice("enabled", true);
				if (result.ok) ui.retry_choice = undefined;
				else if (!tlm_snapshot().saved) ui.retry_choice = {key:"enabled", value:true};
				ui.page = "main"; ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "retry_choices":
				// Reapply the exact failed choice, never invert a toggle or restore older consent.
				var retry_choice = is_struct(ui.retry_choice) ? ui.retry_choice : {key:"enabled", value:false};
				result = tlm_apply_choice(retry_choice.key, retry_choice.value);
				ui.retry_choice = result.ok ? undefined : retry_choice;
				ui.dictionary = tlm_dictionary();
				break;
			case "preview":
				ui.preview = tlm_preview_next();
				ui.preview_title = "Example of the next report";
				ui.page = "preview"; ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "manual":
				result = tlm_manual_begin(a.value, a.value == "" ? tlm_snapshot().last_error_code : "unclassified");
				if (result.ok)
				{
					ui.selected_record = a.value;
					ui.dictionary = tlm_dictionary();
					ui.manual_preview = tlm_manual_preview();
					ui.page = "manual"; ui.scroll = 0; menu = "telemetry_row_0";
				}
				break;
			case "record":
				ui.current_record = undefined;
				for (var record_index = 0; record_index < array_length(ui.records); record_index++)
					if (ui.records[record_index].report_id == a.value) ui.current_record = ui.records[record_index];
				ui.page = "record"; ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "select_code":
				ui.crash_code = a.value;
				ui.page = "confirm_code"; ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "manual_code":
				result = tlm_manual_from_code(ui.crash_code);
				if (result.ok)
				{
					ui.manual_preview = tlm_manual_preview();
					ui.page = "manual"; ui.scroll = 0; menu = "telemetry_row_0";
				}
				break;
			case "manual_field":
				result = tlm_manual_field(a.key, false);
				ui.manual_preview = tlm_manual_preview();
				break;
			case "manual_text":
				ui.text = "";
				keyboard_string = "";
				remember_keyboard_string = "";
				global.keyboard_virtual_timer = 0;
				input_key = true;
				menu = "telemetry_text_ok";
				ui.page = "text";
				break;
			case "summary":
				result = tlm_manual_summary(a.value);
				ui.manual_preview = tlm_manual_preview();
				ui.page = "manual"; input_key = false; ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "text_cancel":
				ui.page = "manual"; input_key = false; menu = "telemetry_row_0";
				break;
			case "send":
				result = tlm_manual_approve();
				if (result.ok) result = tlm_manual_send();
				ui.manual_preview = tlm_manual_preview();
				break;
			case "export":
				result = tlm_manual_approve();
				if (result.ok) result = tlm_manual_export();
				break;
			case "cancel_manual":
				tlm_manual_cancel();
				ui.manual_preview = undefined;
				ui.page = "data"; ui.records = tlm_list(); ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "delete_confirm":
				ui.delete_kind = a.value;
				ui.page = "delete"; ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "delete":
				result = tlm_delete(ui.delete_kind);
				ui.records = tlm_list(); ui.page = "data"; ui.scroll = 0; menu = "telemetry_row_0";
				break;
			case "folder":
				if (global.enable_open_custom_folder)
				{
					var folder = ui.snapshot.data_folder;
					if (a.value == "legacy_crash") folder = game_save_id + "crash_logs/";
					if (a.value == "legacy_pending") folder = game_save_id + "pending_crash_logs/";
					if (a.value == "legacy_debug") folder = game_save_id + "debug_logs/";
					if (a.value == "legacy_translation") folder = game_save_id + "translation_missing_keywords/";
					if (directory_exists(folder))
					{
						scr_open_folder(folder);
						result.reason = "Requested local folder opening. If it did not open, use the in-game list or copy its path. This is not a server export.";
					}
					else result = {ok:false, reason:"This local folder does not exist. No folder or diagnostic record was created."};
				}
				else result = {ok:false, reason:"Folder opening is unavailable here. The in-game data list works offline."};
				break;
			case "copy":
				var copy_text = "";
				if (a.value == "manual") copy_text = tlm_manual_preview().body;
				if (a.value == "existing" && is_struct(ui.current_record)) copy_text = ui.current_record.body;
				if (a.value == "example") copy_text = ui.preview;
				if (a.value == "folder") copy_text = ui.snapshot.data_folder;
				if (a.value == "policy") copy_text = ui.policy_text;
				if (a.value == "web") copy_text = global.link_to_privacy_policy;
				if (copy_text != "") { clipboard_set_text(copy_text); result.reason = "Copied to the clipboard. Nothing was sent."; }
				break;
			case "policy":
				ui.policy_caller = {
					menu : menu, in_settings : in_settings,
					sidebar : global.settings_sidebar_menu,
					sidebar_focus : can_navigate_settings_sidebar,
					menu_offset : menu_y_offset, menu_offset_real : menu_y_offset_real,
					ui_scroll : ui.scroll,
					information : variable_instance_exists(self, "information_menu_open") ? information_menu_open : ""
				};
				ui.policy_text = scr_telemetry_policy_load();
				ui.policy_scroll = 0;
				ui.policy_open = true;
				ui.policy_web_confirm = false;
				menu = "telemetry_policy_back";
				input_key = false;
				break;
			case "policy_back":
				if (is_struct(ui.policy_caller))
				{
					var caller = ui.policy_caller;
					menu = caller.menu;
					in_settings = caller.in_settings;
					global.settings_sidebar_menu = caller.sidebar;
					can_navigate_settings_sidebar = caller.sidebar_focus;
					menu_y_offset = caller.menu_offset;
					menu_y_offset_real = caller.menu_offset_real;
					ui.scroll = caller.ui_scroll;
					if (variable_instance_exists(self, "information_menu_open")) information_menu_open = caller.information;
				}
				ui.policy_open = false;
				break;
			case "policy_web":
				ui.policy_web_confirm = true;
				ui.message = "";
				menu = "telemetry_web_open";
				break;
			case "policy_web_cancel":
				ui.policy_web_confirm = false;
				menu = "telemetry_policy_web";
				break;
			case "policy_browser":
				if (global.enable_option_for_pc
				&& string_pos("https://", global.link_to_privacy_policy) == 1)
					url_open(global.link_to_privacy_policy);
				ui.policy_web_confirm = false;
				menu = "telemetry_policy_web";
				break;
		}
		if (result.reason != "") ui.message = result.reason;
		ui.snapshot = tlm_snapshot();
		menu_delay = 3;
	}
}

function scr_telemetry_ui_queue(kind, value = "", key = "")
{
	if (!variable_global_exists("telemetry_ui")) return;
	if (!is_undefined(global.telemetry_ui.action)) return;
	global.telemetry_ui.action = {owner:id, kind:kind, value:value, key:key};
}

/// The policy is read once on entry, locally, without URL validation or network work.
function scr_telemetry_policy_load()
{
	var missing = "The bundled Privacy Policy could not be read. Telemetry remains under your existing choices. You can return and keep playing.";
	if (!file_exists("privacy_policy.txt")) return missing;
	var handle = file_text_open_read("privacy_policy.txt");
	if (handle < 0) return missing;
	var content = "";
	while (!file_text_eof(handle) && string_byte_length(content) < 65536)
	{
		var line = file_text_read_string(handle);
		file_text_readln(handle);
		/* Prepared plain text also accepts the historical file's small Markdown subset. */
		while (string_pos("#", line) == 1) line = string_delete(line, 1, 1);
		line = string_replace_all(line, "**", "");
		line = string_replace_all(line, "__", "");
		content += string_trim(line) + "\n";
	}
	file_text_close(handle);
	return string_trim(content) == "" ? missing : content;
}

/// Bounded word/long-token wrapping using the current font and the same scale used to draw.
function scr_telemetry_ui_lines(text, width, scale)
{
	var output = [];
	var paragraphs = string_split(string(text), "\n");
	for (var p = 0; p < array_length(paragraphs); p++)
	{
		var source = string(paragraphs[p]);
		if (source == "") { array_push(output, ""); continue; }
		var line = "";
		var token = "";
		for (var c = 1; c <= string_length(source); c++)
		{
			var character = string_char_at(source, c);
			token += character;
			var candidate = line + token;
			if (string_width(candidate) * scale > width)
			{
				if (line != "") { array_push(output, string_trim(line)); line = ""; }
				if (string_width(token) * scale > width)
				{
					array_push(output, string_copy(token, 1, max(1, string_length(token) - 1)));
					token = character;
				}
			}
			if (character == " ") { line += token; token = ""; }
		}
		if (line + token != "") array_push(output, string_trim(line + token));
	}
	return output;
}

function scr_telemetry_ui_draw_lines(lines, xx, yy, width, scale, offset, bottom)
{
	draw_set_halign(fa_left); draw_set_valign(fa_top);
	var step_height = ceil(string_height("W") * scale) + 8;
	for (var i = 0; i < array_length(lines); i++)
	{
		var line_y = yy + i * step_height - offset;
		if (line_y >= yy && line_y + step_height <= bottom)
			scr_draw_text_outlined(xx, line_y, lines[i], scale, c_black, c_white, 1);
	}
	return step_height * array_length(lines);
}

function scr_telemetry_policy_draw()
{
	var ui = global.telemetry_ui;
	if (!ui.policy_open || ui.owner != id) return;
	var ww = display_get_gui_width();
	var hh = display_get_gui_height();
	draw_set_alpha(1); draw_set_color(make_color_rgb(12, 14, 20));
	draw_rectangle(0, 0, ww, hh, false);
	var scale = global.default_text_size;
	if (ui.policy_web_confirm)
	{
		var web_width = min(480, ww - 96);
		var web_x = (ww - web_width) * 0.5;
		var web_y = max(190, hh * 0.5 - 25);
		draw_set_halign(fa_left); draw_set_valign(fa_top);
		scr_draw_text_outlined(32, 40, scr_telemetry_text("Open or copy this website link?"), scale, c_black, c_white, 1);
		var web_lines = scr_telemetry_ui_lines(global.link_to_privacy_policy, ww - 64, scale);
		scr_telemetry_ui_draw_lines(web_lines, 32, 88, ww - 64, scale, 0, web_y - 42);
		scr_draw_text_outlined(32, hh - 78, scr_telemetry_text(ui.message != "" ? ui.message : "The web policy may be updated independently. Reading the bundled policy needs no connection."), scale * 0.8, c_black, c_white, 1, 28, ww - 64);
		if (draw_menu_button(web_x, web_y, scr_telemetry_text("Open in Browser"), "telemetry_web_open", "", c_lime, 1, web_width)) scr_telemetry_ui_queue("policy_browser");
		if (draw_menu_button(web_x, web_y + 50, scr_telemetry_text("Copy Link"), "telemetry_web_copy", "", c_lime, 1, web_width)) scr_telemetry_ui_queue("copy", "web");
		if (draw_menu_button(web_x, web_y + 100, scr_telemetry_text("Cancel"), "telemetry_web_cancel", "", c_lime, 1, web_width)) scr_telemetry_ui_queue("policy_web_cancel");
		var web_ids = ["telemetry_web_open", "telemetry_web_copy", "telemetry_web_cancel"];
		if ((key_up || key_down || key_left || key_right) && menu_delay == 0 && menu_joystick_delay == 0)
		{
			var web_selection = 0;
			for (var wi = 0; wi < 3; wi++) if (menu == web_ids[wi]) web_selection = wi;
			menu = web_ids[(web_selection + (key_up || key_left ? 2 : 1)) mod 3];
			menu_delay = 3;
		}
		if (key_back_pressed && menu_delay == 0 && menu_joystick_delay == 0) scr_telemetry_ui_queue("policy_web_cancel");
		scr_menu_navigation_with_joystick_delay();
		return;
	}
	var lines = scr_telemetry_ui_lines(ui.policy_text, max(1, ww - 64), scale);
	var english_only = global.language_local_data != 0
		&& global.language_local_data[# global.selected_language_id, 0] != "English";
	var top = english_only ? 154 : 112;
	var bottom = hh - 30;
	var line_height = ceil(string_height("W") * scale) + 8;
	ui.policy_max = max(0, array_length(lines) * line_height - (bottom - top));
	if (key_up || mouse_wheel_up()) ui.policy_scroll -= 30;
	if (key_down || mouse_wheel_down()) ui.policy_scroll += 30;
	ui.policy_scroll = clamp(ui.policy_scroll, 0, ui.policy_max);
	scr_telemetry_ui_draw_lines(lines, 32, top, ww - 64, scale, ui.policy_scroll, bottom);
	var button_width = min(260, (ww - 64) / 4);
	if (draw_menu_button(16, 12, scr_telemetry_text("Back"), "telemetry_policy_back", "", c_lime, 1, button_width))
		scr_telemetry_ui_queue("policy_back");
	if (draw_menu_button(24 + button_width, 12, scr_telemetry_text("To Top"), "telemetry_policy_top", "", c_lime, 1, button_width))
		ui.policy_scroll = 0;
	if (global.enable_option_for_pc && string_pos("https://", global.link_to_privacy_policy) == 1)
	{
		if (draw_menu_button(32 + button_width * 2, 12, scr_telemetry_text("Open Web Policy"), "telemetry_policy_web", "", c_lime, 1, button_width))
			scr_telemetry_ui_queue("policy_web");
	}
	if (global.enable_option_for_pc)
	{
		if (draw_menu_button(40 + button_width * 3, 12, scr_telemetry_text("Copy Policy Text"), "telemetry_policy_copy", "", c_lime, 1, button_width))
			scr_telemetry_ui_queue("copy", "policy");
	}
	draw_set_halign(fa_left); draw_set_valign(fa_top);
	scr_draw_text_outlined(32, 70, scr_telemetry_text("Bundled Privacy Policy - available offline"), scale, c_black, c_white, 1);
	if (english_only)
	{
		scr_draw_text_outlined(32, 102, scr_telemetry_text("Text only available in English"), scale * 0.8, c_black, c_yellow, 1);
		scr_draw_text_outlined(32, 126, "Text only available in English", scale * 0.8, c_black, c_white, 1);
	}
	var policy_ids = ["telemetry_policy_back", "telemetry_policy_top"];
	if (global.enable_option_for_pc)
	{
		if (string_pos("https://", global.link_to_privacy_policy) == 1) array_push(policy_ids, "telemetry_policy_web");
		array_push(policy_ids, "telemetry_policy_copy");
	}
	if ((key_left || key_right) && menu_delay == 0 && menu_joystick_delay == 0)
	{
		var policy_selection = 0;
		for (var policy_index = 0; policy_index < array_length(policy_ids); policy_index++)
			if (menu == policy_ids[policy_index]) policy_selection = policy_index;
		menu = policy_ids[(policy_selection + (key_right ? 1 : array_length(policy_ids) - 1)) mod array_length(policy_ids)];
		menu_delay = 3;
	}
	if (!global.enable_option_for_pc && menu == "telemetry_policy_web") menu = "telemetry_policy_back";
	if (key_back_pressed && menu_delay == 0 && menu_joystick_delay == 0) scr_telemetry_ui_queue("policy_back");
	if (ui.message != "")
	{
		draw_set_color(c_black); draw_rectangle(0, hh - 36, ww, hh, false);
		draw_set_halign(fa_left); draw_set_valign(fa_top);
		scr_draw_text_outlined(32, hh - 30, scr_telemetry_text(ui.message), scale * 0.8, c_black, c_white, 1);
	}
	scr_menu_navigation_with_joystick_delay();
}

function scr_telemetry_ui_state(state)
{
	var label = "Unrecognized local state";
	switch (state)
	{
		case "local_only": label = "Local only"; break;
		case "pending": label = "Pending"; break;
		case "active": label = "Sending - outcome not known yet"; break;
		case "attempted_unknown": label = "Attempted - outcome unknown"; break;
		case "acknowledged": label = "Acknowledged by receiver"; break;
		case "held_rejected": label = "Rejected or held for review"; break;
		case "expired": label = "Expired locally"; break;
		case "discarded": label = "Discarded locally"; break;
		case "unindexed": label = "Unindexed local file - never eligible for automatic sending"; break;
	}
	return scr_telemetry_text(label);
}

function scr_telemetry_ui_reason(reason)
{
	var label = "Review the local state before taking another action.";
	switch (reason)
	{
		case "none": label = "No delivery attempt has been recorded."; break;
		case "clock_uncertain": label = "The local clock is uncertain. Automatic sending is held."; break;
		case "expired": label = "The managed local lifetime has ended."; break;
		case "capacity": label = "The local count or size limit was reached."; break;
		case "cleanup_failed": label = "Local removal failed. The entry remains ineligible for sending."; break;
		case "body_invalid": label = "The retained data failed validation and cannot be sent."; break;
		case "start_failed": label = "The request did not start."; break;
		case "attempt_limit": label = "The attempt limit was reached. No automatic retry is allowed."; break;
		case "acknowledged": label = "A matching receiver acknowledgement reported storage. Local deletion does not erase server copies."; break;
		case "withdrawn": label = "Permission was withdrawn. An earlier request may already have arrived."; break;
		case "ack_invalid": label = "No valid matching storage acknowledgement was received."; break;
		case "transport": label = "A network error left delivery uncertain."; break;
		case "timeout": label = "The request timed out. Delivery is uncertain."; break;
		case "http_rejected": label = "The server rejected this request. It is not acknowledged."; break;
		case "http_retryable": label = "The server did not accept the report. Any retry stays within the limits."; break;
	}
	return scr_telemetry_text(label);
}

function scr_telemetry_ui_date(value)
{
	if (!is_real(value) || value <= 0) return scr_telemetry_text("Unknown local time");
	var stamp = date_create_datetime(1970, 1, 1, 0, 0, 0) + value / 86400;
	return string(date_get_year(stamp)) + "-" + scr_telemetry_ui_two(date_get_month(stamp))
		+ "-" + scr_telemetry_ui_two(date_get_day(stamp)) + " "
		+ scr_telemetry_ui_two(date_get_hour(stamp)) + ":" + scr_telemetry_ui_two(date_get_minute(stamp)) + " UTC";
}

function scr_telemetry_ui_two(value)
{
	return (value < 10 ? "0" : "") + string(floor(value));
}

function scr_telemetry_ui_code_label(code)
{
	var label = "Authored crash code";
	switch (code)
	{
		case "unclassified": label = "Unclassified error"; break;
		case "level_load": label = "Level loading error"; break;
		case "save_failure": label = "Save failure"; break;
		case "resource_unavailable": label = "Resource unavailable"; break;
	}
	return scr_telemetry_text(label) + ": " + code;
}

function scr_telemetry_ui_row(rows, label, row_action, value = "", key = "", help = "")
{
	var translated_label = key != "" || row_action == "record" || row_action == "manual_field" ? label : scr_telemetry_text(label);
	array_push(rows, {label:translated_label, action:row_action, value:value, key:key, help:row_action == "record" ? help : scr_telemetry_text(help)});
	return rows;
}

function scr_telemetry_ui_onoff(label, value)
{
	return scr_telemetry_text(label) + ": " + scr_telemetry_text(value ? "On" : "Off");
}

function scr_option_telemetry_is_subpage()
{
	return global.settings_sidebar_menu == "telemetry_settings"
		&& variable_global_exists("telemetry_ui")
		&& global.telemetry_ui.page != "main";
}

function scr_option_telemetry_back()
{
	var ui = global.telemetry_ui;
	if (ui.page == "manual") scr_telemetry_ui_queue("cancel_manual");
	else if (ui.page == "text") scr_telemetry_ui_queue("text_cancel");
	else scr_telemetry_ui_queue("page", ui.page == "delete" || ui.page == "record" ? "data" : "main");
}

/// Existing Options invokes this in its menu-instance scope.
function scr_option_telemetry()
{
	if (global.settings_sidebar_menu != "telemetry_settings") return;
	if (!variable_global_exists("telemetry_ui")) return;
	var ui = global.telemetry_ui;
	ui.owner = id;
	var s = ui.snapshot;
	if (!is_struct(s)) return;
	global.option_default = -1;
	global.option_description = "";
	menu_y_offset = 0; menu_y_offset_real = 0;
	var xx = 402;
	var width = max(120, display_get_gui_width() - xx - 32);
	var hh = display_get_gui_height();
	var scale = global.default_text_size;
	var title = "Telemetry Data";
	var intro = "Automatic diagnostics start off. Choosing categories alone does not start collection. Ordinary play does not require telemetry.";
	var rows = [];
	if (ui.page == "main")
	{
		rows = scr_telemetry_ui_row(rows, s.enabled ? "Automatic diagnostics: Configure data" : "Automatic diagnostics: Off", s.enabled ? "off" : "page", s.enabled ? "" : "enable", "", "Off stops new automatic diagnostic records, sampling, queue enrollment, uploads and retries. Existing local records keep their disclosed expiry. One-time manual reports are separate.");
		if (!s.saved)
			rows = scr_telemetry_ui_row(rows, "Retry Saving Choices", "retry_choices", "", "", "Try saving the exact last failed choice again without reversing it. If no such choice is available after recovery, this saves automatic diagnostics Off. Restrictions already apply while saving is unavailable.");
		rows = scr_telemetry_ui_row(rows, scr_telemetry_ui_onoff("Automatically send crash reports", s.auto_crash), "choice", !s.auto_crash, "auto_crash", "Only eligible future safe reports can be queued. Delivery remains unavailable until the receiver and its operations have been verified.");
		rows = scr_telemetry_ui_row(rows, scr_telemetry_ui_onoff("Keep minimized crash files locally", s.keep_local), "choice", !s.keep_local, "keep_local", "Keep safe crash details on this device within the disclosed limits. This is separate from sending.");
		rows = scr_telemetry_ui_row(rows, "Basic error details", "page", "included", "", "A chosen report needs its schema, random per-report ID, build, platform, event type and safe error code. These fields are necessary only for a report you choose to create.");
		var device_available = false;
		for (var da = 0; da < array_length(ui.dictionary); da++)
			if (ui.dictionary[da].category == "device" && ui.dictionary[da].available) device_available = true;
		if (device_available)
			rows = scr_telemetry_ui_row(rows, scr_telemetry_ui_onoff("Device details", s.device), "choice", !s.device, "device", "Optional supported device fields only. Unavailable renderer and GPU adapters stay omitted; no device name or permanent identifier is collected. See Included Data for each field.");
		else rows = scr_telemetry_ui_row(rows, "Device details: Unavailable", "page", "included", "", "Device fields are unavailable in this build. They stay omitted; a saved category choice cannot invent a measurement.");
		rows = scr_telemetry_ui_row(rows, scr_telemetry_ui_onoff("Game context", s.context), "choice", !s.context, "context", "Optional authored game mode, content origin and allowlisted room. No custom names, creator identity or paths.");
		rows = scr_telemetry_ui_row(rows, scr_telemetry_ui_onoff("Performance details", s.performance), "choice", !s.performance, "performance", "Optional bounded frame-rate samples and process memory. No performance sampling while automatic diagnostics are Off.");
		rows = scr_telemetry_ui_row(rows, "Advanced Field Choices", "page", "fields", "", "Omit individual optional fields. Declined information remains absent rather than becoming an invented empty or zero value.");
		rows = scr_telemetry_ui_row(rows, "Included Data", "page", "included", "", "Read what each field means and why it helps. Required means necessary for your chosen report, never required to play.");
		rows = scr_telemetry_ui_row(rows, "Preview Next Report Example", "preview", "", "", "A synthetic example, not a report captured from your game. Actual manual reports have a separate exact-byte review.");
		rows = scr_telemetry_ui_row(rows, "View My Data", "page", "data", "", "Works offline. View safe local records, delivery states and separate local cleanup actions.");
		rows = scr_telemetry_ui_row(rows, "Review a Crash Code", "page", "crash_codes", "", "Use only after a crash. Select the code shown in its error dialog and confirm it before creating a memory-only manual draft. No earlier context is recovered and automatic choices stay unchanged.");
		if (s.last_error_available)
			rows = scr_telemetry_ui_row(rows, "Review Last Handled Error", "manual", "", "", "Create a memory-only manual draft from the visible handled error code. No uncaptured context is recovered and future choices stay unchanged.");
		rows = scr_telemetry_ui_row(rows, "Privacy Policy", "policy", "", "", "Read the same bundled policy available through Information > About, without a connection.");
	}
	else if (ui.page == "crash_codes")
	{
		title = "Review a Crash Code";
		intro = "Use this only after a crash, including after restarting. Choose the authored code shown in the error dialog. While automatic diagnostics were Off, no historical crash context was captured. This creates no usage event and is not a general bug or idea form.";
		rows = scr_telemetry_ui_row(rows, "Back to Telemetry Data", "page", "main");
		for (var ci = 0; ci < array_length(ui.error_codes); ci++)
		{
			var code = ui.error_codes[ci];
			rows = scr_telemetry_ui_row(rows, scr_telemetry_ui_code_label(code), "select_code", code, "code_label", "Select only the code you saw after the crash. The next screen asks you to confirm before creating a draft.");
		}
		rows = scr_telemetry_ui_row(rows, "Privacy Policy", "policy");
	}
	else if (ui.page == "confirm_code")
	{
		title = "Confirm the crash code";
		intro = "Confirm and Review means you saw this code after a crash. The draft contains only current build/platform, this player-selected error code and necessary protocol fields. It does not verify the earlier crash or recover uncaptured device, game or performance context. Nothing is sent; automatic choices remain unchanged.";
		rows = scr_telemetry_ui_row(rows, "Confirm and Review", "manual_code");
		rows = scr_telemetry_ui_row(rows, "Choose a Different Code", "page", "crash_codes");
		rows = scr_telemetry_ui_row(rows, "Cancel", "page", "main");
		rows = scr_telemetry_ui_row(rows, "Privacy Policy", "policy");
	}
	else if (ui.page == "enable")
	{
		title = "Configure automatic diagnostics";
		intro = "This accepts the current diagnostic scope after a verified save. Local crash files and automatic sending remain separate choices. Names, permanent identifiers, paths, arbitrary error text and custom-content text are excluded. New optional fields stay off. Remote delivery remains unavailable until its prerequisites are verified.";
		rows = scr_telemetry_ui_row(rows, "Accept Current Scope", "enable");
		rows = scr_telemetry_ui_row(rows, "Keep Automatic Diagnostics Off", "page", "main");
		rows = scr_telemetry_ui_row(rows, "Included Data", "page", "included");
		rows = scr_telemetry_ui_row(rows, "Privacy Policy", "policy");
	}
	else if (ui.page == "fields")
	{
		title = "Advanced Field Choices";
		intro = "These choices apply within enabled categories. Changing categories or fields does not turn automatic diagnostics on. A restriction discards old pending generations; it cannot recall an active request.";
		rows = scr_telemetry_ui_row(rows, "Back to Telemetry Data", "page", "main");
		for (var d = 0; d < array_length(ui.dictionary); d++)
		{
			var field = ui.dictionary[d];
			if (field.optional && field.available)
				rows = scr_telemetry_ui_row(rows, scr_telemetry_ui_onoff(field.label, field.enabled), "choice", !field.enabled, field.key, field.purpose);
		}
	}
	else if (ui.page == "data")
	{
		title = "View My Data";
		intro = "Local view only. Delivery states describe the evidence we have; attempted with unknown outcome does not mean received. This list does not include every hosting-service log. Manual review starts only from a retained safe record and never enables automatic reporting.";
		rows = scr_telemetry_ui_row(rows, "Back to Telemetry Data", "page", "main");
		rows = scr_telemetry_ui_row(rows, "Refresh Local List", "page", "data");
		if (global.enable_open_custom_folder) rows = scr_telemetry_ui_row(rows, "Open Local Data Folder", "folder");
		if (global.enable_option_for_pc) rows = scr_telemetry_ui_row(rows, "Copy Local Data Folder Path", "copy", "folder", "", "Copy this profile's local diagnostics folder location. It may contain your device username. The path is never attached to a report.");
		for (var r = 0; r < array_length(ui.records); r++)
		{
			var record = ui.records[r];
			var label = scr_telemetry_ui_state(record.state) + " - " + string(record.report_id);
			rows = scr_telemetry_ui_row(rows, label, "record", record.report_id, "", scr_telemetry_ui_reason(record.reason));
		}
		rows = scr_telemetry_ui_row(rows, "Discard Pending Reports", "delete_confirm", "pending", "", "Stop future attempts for pending entries. This cannot recall bytes already sent.");
		rows = scr_telemetry_ui_row(rows, "Delete Local Records", "delete_confirm", "local", "", "Remove retained local safe records. This does not erase server data or exported copies.");
		rows = scr_telemetry_ui_row(rows, "Clear Local Receipts", "delete_confirm", "receipts", "", "Remove local delivery-state receipts. This does not remove a received server report.");
		rows = scr_telemetry_ui_row(rows, "Legacy Files: Review Information", "page", "legacy", "", "Old raw logs never enter the new automatic queue.");
		rows = scr_telemetry_ui_row(rows, "Server Data Removal Information", "page", "removal", "", "Local deletion and turning reporting off cannot erase remote data.");
	}
	else if (ui.page == "record")
	{
		title = "Existing local report";
		intro = "This is the retained local report or receipt, not a synthetic example. Creating a manual copy gives it a fresh ID and requires a new review. Local state is not evidence of remote erasure.";
		rows = scr_telemetry_ui_row(rows, "Back to My Data", "page", "data");
		if (global.enable_option_for_pc) rows = scr_telemetry_ui_row(rows, "Copy Existing Report Text", "copy", "existing");
		if (is_struct(ui.current_record) && ui.current_record.manual_available)
			rows = scr_telemetry_ui_row(rows, "Create Reviewed Manual Copy", "manual", ui.current_record.report_id, "", "A fresh manual ID may duplicate a previous uncertain attempt. Review the new exact bytes before sending or exporting.");
	}
	else if (ui.page == "delete")
	{
		title = "Confirm local action";
		intro = ui.delete_kind == "pending" ? "Discard pending reports and stop future attempts. A report already dispatched may have reached the server. Failed file removal leaves entries ineligible and is shown honestly." : "Delete only the selected kind of local data. Other stores, exports and server copies are separate. A failed removal will be reported.";
		rows = scr_telemetry_ui_row(rows, "Confirm Local Action", "delete");
		rows = scr_telemetry_ui_row(rows, "Cancel", "page", "data");
	}
	else if (ui.page == "manual")
	{
		title = "Review one-time report";
		intro = "Review these exact UTF-8 bytes before sending or exporting. Optional removals and edits update this preview. Send once does not change future automatic choices. Closing this draft discards it from memory. A new report ID can duplicate an earlier uncertain attempt.";
		rows = scr_telemetry_ui_row(rows, "Cancel Report", "cancel_manual");
		rows = scr_telemetry_ui_row(rows, s.remote_available ? "Send Once" : "Send Once: Unavailable", "send", "", "", s.remote_available ? "Send exactly the displayed bytes to the stated destination." : "Remote sending is unavailable until the receiving contract and operations have been verified.");
		rows = scr_telemetry_ui_row(rows, "Export Reviewed Copy", "export", "", "", "Create a separate local copy of the reviewed bytes. Exported copies are outside automatic expiry; you manage them.");
		if (global.enable_option_for_pc) rows = scr_telemetry_ui_row(rows, "Copy Reviewed JSON", "copy", "manual", "", "Copy exactly the displayed UTF-8 report text. Clipboard copying does not send or enable reporting.");
		rows = scr_telemetry_ui_row(rows, "Edit Optional Summary", "manual_text", "", "", "Optional text is manually supplied. Do not include passwords, names, contact details or private content. Clipboard paste is supported.");
		for (var f = 0; f < array_length(ui.dictionary); f++)
		{
			var optional = ui.dictionary[f];
			if (optional.optional) rows = scr_telemetry_ui_row(rows, scr_telemetry_text("Remove") + ": " + scr_telemetry_text(optional.label), "manual_field", false, optional.key, optional.purpose);
		}
		rows = scr_telemetry_ui_row(rows, "Privacy Policy", "policy");
	}
	else if (ui.page == "text")
	{
		ui.text = scr_draw_name_input_screen(ui.text, os_type == os_switch ? 500 : 2000, c_white, 0.9, true, xx + width * 0.5, hh * 0.5 - 64, "telemetry_text_ok", "telemetry_text_cancel", false, true, false);
		if (global.clicking_ok_input_screen && menu_delay == 0 && menu_joystick_delay == 0)
			scr_telemetry_ui_queue("summary", ui.text);
		else if ((global.clicking_cancel_input_screen || key_back_pressed) && menu_delay == 0 && menu_joystick_delay == 0)
			scr_telemetry_ui_queue("text_cancel");
		return;
	}
	else
	{
		rows = scr_telemetry_ui_row(rows, "Back to Telemetry Data", "page", "main");
		if (ui.page == "included") { title = "Included Data"; intro = "Core protocol fields are necessary only for a report you choose to create. Optional categories and fields may be omitted; normal gameplay never requires them."; }
		if (ui.page == "preview") { title = ui.preview_title; intro = "SYNTHETIC EXAMPLE. This is not an existing report and has not been sent."; }
		if (ui.page == "preview" && global.enable_option_for_pc) rows = scr_telemetry_ui_row(rows, "Copy Synthetic Example", "copy", "example");
		if (ui.page == "legacy") { title = "Legacy diagnostic files"; intro = "Older crash logs, pending crash logs, debug dumps and missing-translation keyword logs are outside the new automatic queue. No legacy body is read at startup or uploaded. Older translation logs may contain recorded text and timestamps; automatic missing-key logging and bulk uploads are disabled. Review and export old files locally before sharing; they may contain personal information or secrets. They cannot be converted into a consented automatic report. Use your platform's local file manager for selective review or deletion. The new diagnostics folder is separate."; }
		if (ui.page == "legacy" && global.enable_open_custom_folder)
		{
			rows = scr_telemetry_ui_row(rows, "Open Legacy Crash Folder", "folder", "legacy_crash");
			rows = scr_telemetry_ui_row(rows, "Open Legacy Pending Folder", "folder", "legacy_pending");
			rows = scr_telemetry_ui_row(rows, "Open Legacy Debug Folder", "folder", "legacy_debug");
			rows = scr_telemetry_ui_row(rows, "Open Legacy Translation Folder", "folder", "legacy_translation", "", "Older missing-translation logs are local legacy files. Review them privately before exporting or selectively deleting them. They are never imported or attached to a report.");
		}
		if (ui.page == "removal") { title = "Request removal of server data"; intro = "Turning reporting Off, discarding pending entries, deleting local records and clearing receipts are separate from requesting removal of received server data. Remote delivery is currently unavailable in this implementation. Historical server retention and the operator's rights-handling process still require verification. Use the verified contact route in the policy for existing reports; a report ID alone does not grant read or deletion access."; }
	}

	var top = 176;
	var bottom = max(top + 42, hh - 132);
	var row_height = 48;
	var body = "";
	if (ui.page == "included")
	{
		body = scr_telemetry_text("Necessary only for a chosen report") + "\n\n";
		for (var e = 0; e < array_length(ui.dictionary); e++)
		{
			var entry = ui.dictionary[e];
			body += scr_telemetry_text(entry.label) + " (" + entry.key + ")\n" + scr_telemetry_text(entry.purpose)
				+ "\n" + scr_telemetry_text(entry.optional ? (entry.available ? "Optional - can be omitted" : "Optional - unavailable on this build") : "Necessary only for a chosen report") + "\n\n";
		}
	}
	if (ui.page == "preview") body = string(ui.preview);
	if (ui.page == "record" && is_struct(ui.current_record))
		body = scr_telemetry_ui_state(ui.current_record.state) + "\n" + scr_telemetry_ui_reason(ui.current_record.reason)
			+ "\n" + scr_telemetry_text("Created or recorded") + ": " + scr_telemetry_ui_date(ui.current_record.created_at)
			+ "\n" + scr_telemetry_text("Managed local expiry") + ": " + scr_telemetry_ui_date(ui.current_record.expires_at)
			+ "\n\n" + string(ui.current_record.body);
	if (ui.page == "manual" && is_struct(ui.manual_preview))
		body = scr_telemetry_text("Destination") + ": " + ui.manual_preview.destination + "\nSHA-256: " + ui.manual_preview.digest + "\n\n" + ui.manual_preview.body;
	if (ui.page == "legacy" || ui.page == "removal" || ui.page == "enable" || ui.page == "crash_codes" || ui.page == "confirm_code")
	{
		body = scr_telemetry_text(intro);
		if (ui.page == "confirm_code") body = scr_telemetry_ui_code_label(ui.crash_code) + "\n\n" + body;
		intro = "";
	}

	var body_lines = scr_telemetry_ui_lines(body, width - 16, scale);
	var line_height = ceil(string_height("W") * scale) + 8;
	var content_height = array_length(rows) * row_height + (body == "" ? 0 : array_length(body_lines) * line_height + 24);
	var scroll_max = max(0, content_height - (bottom - top));
	var navigation_count = array_length(rows) + (scroll_max > 0 ? 2 : 0);
	if (!can_navigate_settings_sidebar)
	{
		var selected = -1;
		for (var n = 0; n < navigation_count; n++) if (menu == "telemetry_row_" + string(n)) selected = n;
		if (selected < 0) { selected = 0; menu = "telemetry_row_0"; }
		if ((key_up || key_down) && menu_delay == 0 && menu_joystick_delay == 0)
		{
			selected = (selected + (key_down ? 1 : -1) + navigation_count) mod navigation_count;
			menu = "telemetry_row_" + string(selected);
			menu_delay = 3;
			if (selected < array_length(rows)) ui.scroll = clamp(ui.scroll, selected * row_height - (bottom - top) + row_height, selected * row_height);
		}
		if (mouse_wheel_up()) ui.scroll -= 60;
		if (mouse_wheel_down()) ui.scroll += 60;
	}
	ui.scroll = clamp(ui.scroll, 0, scroll_max);

	draw_set_alpha(1); draw_set_color(make_color_rgb(12, 14, 20));
	draw_rectangle(xx - 16, 0, display_get_gui_width(), hh, false);
	draw_set_halign(fa_left); draw_set_valign(fa_top);
	scr_draw_text_outlined(xx, 24, scr_telemetry_text(title), scale * 1.1, c_black, c_white, 1);
	var status = scr_telemetry_text("Effective state") + ": " + scr_telemetry_text(string(s.effective)) + " | " + scr_telemetry_text(s.saved ? "Saved" : "Not saved");
	scr_draw_text_outlined(xx, 62, status, scale * 0.8, c_black, c_white, 1);
	var intro_lines = scr_telemetry_ui_lines(scr_telemetry_text(intro), width, scale * 0.8);
	scr_telemetry_ui_draw_lines(intro_lines, xx, 96, width, scale * 0.8, 0, top - 8);
	ui.rows = rows;
	for (var q = 0; q < array_length(rows); q++)
	{
		var row = rows[q];
		var yy = top + q * row_height - ui.scroll;
		if (yy >= top && yy + 42 <= bottom)
		{
			if (draw_menu_button(xx, yy, row.label, "telemetry_row_" + string(q), "", c_lime, 1, width))
			{
				if (row.action == "off") scr_telemetry_ui_queue("choice", false, "enabled");
				else scr_telemetry_ui_queue(row.action, row.value, row.key);
				menu_delay = 3;
			}
		}
	}
	if (body != "") scr_telemetry_ui_draw_lines(body_lines, xx + 8, top, width - 16, scale, ui.scroll - array_length(rows) * row_height - 16, bottom);
	if (scroll_max > 0)
	{
		var scroll_width = (width - 8) * 0.5;
		var down_id = "telemetry_row_" + string(array_length(rows));
		var up_id = "telemetry_row_" + string(array_length(rows) + 1);
		if (draw_menu_button(xx, hh - 124, scr_telemetry_text("Scroll Down"), down_id, "", c_lime, 1, scroll_width)
		|| (menu == down_id && key_accept_hold && menu_delay == 0 && menu_joystick_delay == 0))
		{
			ui.scroll = min(scroll_max, ui.scroll + 40); menu_delay = 3;
		}
		if (draw_menu_button(xx + scroll_width + 8, hh - 124, scr_telemetry_text("Scroll Up"), up_id, "", c_lime, 1, scroll_width)
		|| (menu == up_id && key_accept_hold && menu_delay == 0 && menu_joystick_delay == 0))
		{
			ui.scroll = max(0, ui.scroll - 40); menu_delay = 3;
		}
	}
	var help = "";
	for (var h = 0; h < array_length(rows); h++) if (menu == "telemetry_row_" + string(h)) help = rows[h].help;
	if (ui.last_focus != menu)
	{
		ui.message = "";
		ui.last_focus = menu;
	}
	var footer = ui.message != "" ? scr_telemetry_text(ui.message) : (help != "" ? help : scr_telemetry_text(s.status));
	var footer_lines = scr_telemetry_ui_lines(footer, width, scale * 0.8);
	scr_telemetry_ui_draw_lines(footer_lines, xx, hh - 76, width, scale * 0.8, 0, hh - 8);
}

