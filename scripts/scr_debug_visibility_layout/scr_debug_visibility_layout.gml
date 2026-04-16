/// @function scr_debug_get_settings_overlay_target()
/* Returns the active menu instance that owns the settings state for the debug overlay. */
function scr_debug_get_settings_overlay_target()
{
	if (instance_exists(obj_pause))
	{
		var pause_instance = instance_find(obj_pause, 0);
		if (variable_instance_exists(pause_instance, "in_settings")
		&& pause_instance.in_settings)
		{
			return pause_instance;
		}
	}

	if (instance_exists(obj_title))
	{
		var title_instance = instance_find(obj_title, 0);
		if (variable_instance_exists(title_instance, "in_settings")
		&& title_instance.in_settings)
		{
			return title_instance;
		}
	}

	return noone;
}

/// @function scr_debug_get_menu_debug_target()
/* Returns the active menu debug target when one is available. */
function scr_debug_get_menu_debug_target()
{
	if (variable_instance_exists(self, "debug_target")
	&& instance_exists(debug_target))
	{
		return debug_target;
	}

	return scr_debug_get_settings_overlay_target();
}

/// @function scr_debug_should_use_compact_overlay()
/* Returns true when the full debug overlay should collapse into a menu-safe panel. */
function scr_debug_should_use_compact_overlay()
{
	var target = scr_debug_get_settings_overlay_target();
	if (target == noone)
	{
		return false;
	}

	if (global.debug_screen)
	{
		return true;
	}

	if (!variable_global_exists("debug_visibility_has_any_always"))
	{
		scr_debug_rebuild_visibility_runtime_cache();
	}

	return variable_global_exists("debug_visibility_has_any_always")
		&& global.debug_visibility_has_any_always;
}

/// @function scr_debug_get_room_info_text()
/* Returns the standard room information string used by the debug overlay. */
function scr_debug_get_room_info_text()
{
	return "current room: '" + string(global.level_name) + "' "
		+ string(global.select_level_index) + " "
		+ string(room_get_name(room)) + " "
		+ string(room_width) + "x" + string(room_height);
}

/// @function scr_debug_get_current_video_adapter_description()
/* Supports both struct and ds_map versions of os_get_info(). */
function scr_debug_get_current_video_adapter_description()
{
	var adapter_desc = undefined;

	if (is_struct(global.os_info))
	{
		if (variable_struct_exists(global.os_info, "video_adapter_description"))
		{
			adapter_desc = variable_struct_get(global.os_info, "video_adapter_description");
		}
	}
	else
	if (ds_exists(global.os_info, ds_type_map))
	{
		if (ds_map_exists(global.os_info, "video_adapter_description"))
		{
			adapter_desc = global.os_info[? "video_adapter_description"];
		}
	}

	return adapter_desc;
}

/// @function scr_debug_make_line_spec(item_key, variable_name, value, label_simplified, color_normal, color_alert, alert_condition, display_text_override)
/* Creates a uniform registry line description used by overlay, always, and compact layouts. */
function scr_debug_make_line_spec(item_key, variable_name, value, label_simplified, color_normal = c_white, color_alert = c_red, alert_condition = false, display_text_override = "")
{
	return
	{
		item_key: item_key,
		variable_name: variable_name,
		value: value,
		label_simplified: label_simplified,
		color_normal: color_normal,
		color_alert: color_alert,
		alert_condition: alert_condition,
		display_text_override: display_text_override
	};
}

/// @function scr_debug_reset_visibility_draw_cache()
/* Clears the per-draw-pass cache of registry line specs. */
function scr_debug_reset_visibility_draw_cache()
{
	global.debug_visibility_line_spec_cache = {};
}

/// @function scr_debug_get_registry_line_specs(item_key)
/* Returns all drawable line specs for a registry item in the current runtime context. */
function scr_debug_get_registry_line_specs(item_key)
{
	if (!variable_global_exists("debug_visibility_line_spec_cache")
	|| !is_struct(global.debug_visibility_line_spec_cache))
	{
		global.debug_visibility_line_spec_cache = {};
	}

	if (variable_struct_exists(global.debug_visibility_line_spec_cache, item_key))
	{
		return variable_struct_get(global.debug_visibility_line_spec_cache, item_key);
	}

	var line_specs = [];
	var menu_target = noone;
	var player_positions = [];

	switch (string(item_key))
	{
		case "game_version":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "game_version", string(global.game_name) + " v" + scr_get_build_date(), "Game Version"));
			break;

		case "fps":
			var fps_target = max(1, global.max_fps);
			var fps_real_target = (os_type == os_switch) ? 60 : 600;
			var fps_ratio = clamp(real(fps) / fps_target, 0, 1);
			var fps_real_ratio = clamp(real(fps_real) / max(1, fps_real_target), 0, 1);
			var fps_color = (fps >= global.max_fps
				&& fps_real >= fps_real_target)
				? c_lime
				: make_color_hsv(50 * min(fps_ratio, fps_real_ratio), 255, 255);
			array_push(line_specs, scr_debug_make_line_spec(item_key, "fps / fps_real",
				string(fps) + "/" + string(global.max_fps) + " | FPS Real: " + string(fps_real),
				"FPS", fps_color, c_red, false));
			break;

		case "instance_count":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "instance_count", instance_count, "Instance Count"));
			break;

		case "current_menu":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "menu"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "menu", menu_target.menu, "Current Menu", c_white, c_red, menu_target.menu == 0));
			}
			break;

		case "controller_slot":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "controller_slot", global.player_slot[1], "Controller Slot"));
			break;

		case "player_slots":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "player_slot", global.player_slot, "Player Slots"));
			break;

		case "player_position":
			player_positions = scr_get_player_positions();
			for (var position_index = 0; position_index < array_length(player_positions); position_index++)
			{
				var position_info = player_positions[position_index];
				array_push(line_specs, scr_debug_make_line_spec(item_key,
					"player " + string(position_info.player_pos_id) + " xy",
					string(position_info.player_pos_x) + " / " + string(position_info.player_pos_y),
					"Player " + string(position_info.player_pos_id) + " Position"));
			}
			break;

		case "player_speed":
			player_positions = scr_get_player_positions();
			for (var speed_index = 0; speed_index < array_length(player_positions); speed_index++)
			{
				var speed_info = player_positions[speed_index];
				array_push(line_specs, scr_debug_make_line_spec(item_key,
					"player " + string(speed_info.player_pos_id) + " speed",
					speed_info.player_speed,
					"Player " + string(speed_info.player_pos_id) + " Speed"));
			}
			break;

		case "current_datetime":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "current_datetime", scr_format_timestamp(date_current_datetime()), "Current Date/Time"));
			break;

		case "current_level_clear_rate":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "current_level_clear_rate", global.current_level_clear_rate, "Current Level Clear Rate"));
			break;

		case "doing_clear_check_character":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "doing_clear_check_character", global.doing_clear_check_character, "Doing Clear Check Character"));
			break;

		case "doing_clear_check_level":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "doing_clear_check_level", global.doing_clear_check_level, "Doing Clear Check Level"));
			break;

		case "player_image_index":
			player_positions = scr_get_player_positions();
			for (var _player_image_index = 0; _player_image_index < array_length(player_positions); _player_image_index++)
			{
				var image_info = player_positions[_player_image_index];
				array_push(line_specs, scr_debug_make_line_spec(item_key,
					"player " + string(image_info.player_pos_id) + " image_index",
					image_info.player_image_index,
					"Player " + string(image_info.player_pos_id) + " Image Index"));
			}
			break;

		case "player_image_speed":
			player_positions = scr_get_player_positions();
			for (var image_speed_index = 0; image_speed_index < array_length(player_positions); image_speed_index++)
			{
				var image_speed_info = player_positions[image_speed_index];
				array_push(line_specs, scr_debug_make_line_spec(item_key,
					"player " + string(image_speed_info.player_pos_id) + " image_speed",
					image_speed_info.player_image_speed,
					"Player " + string(image_speed_info.player_pos_id) + " Image Speed"));
			}
			break;

		case "player_on_ground":
			player_positions = scr_get_player_positions();
			for (var ground_index = 0; ground_index < array_length(player_positions); ground_index++)
			{
				var ground_info = player_positions[ground_index];
				array_push(line_specs, scr_debug_make_line_spec(item_key,
					"player " + string(ground_info.player_pos_id) + " on_ground",
					ground_info.player_on_ground,
					"Player " + string(ground_info.player_pos_id) + " On Ground"));
			}
			break;

		case "player_cutscene_time":
			player_positions = scr_get_player_positions();
			for (var cutscene_index = 0; cutscene_index < array_length(player_positions); cutscene_index++)
			{
				var cutscene_info = player_positions[cutscene_index];
				array_push(line_specs, scr_debug_make_line_spec(item_key,
					"player " + string(cutscene_info.player_pos_id) + " cutscene_time",
					cutscene_info.player_cutscene_time,
					"Player " + string(cutscene_info.player_pos_id) + " Cutscene Time"));
			}
			break;

		case "player_can_play":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "player_can_play", global.player_can_play, "Player Can Play"));
			break;

		case "level_editor_menu":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "level_editor_menu"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "level_editor_menu", menu_target.level_editor_menu, "Level Editor Menu"));
			}
			break;

		case "in_character_select_menu":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "in_character_select_menu"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "in_character_select_menu", menu_target.in_character_select_menu, "In Character Select Menu"));
			}
			break;

		case "in_settings_menu":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "in_settings"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "in_settings", menu_target.in_settings, "In Settings Menu"));
			}
			break;

		case "in_online_download_list_menu":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "in_online_download_list_menu"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "in_online_download_list_menu", menu_target.in_online_download_list_menu, "In Online Download List Menu"));
			}
			break;

		case "can_navigate_settings_sidebar":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "can_navigate_settings_sidebar"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "can_navigate_settings_sidebar", menu_target.can_navigate_settings_sidebar, "Can Navigate Settings Sidebar"));
			}
			break;

		case "controls_used_for_navigation":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "controls_used_for_navigation", global.controls_used_for_navigation, "Controls Used For Navigation"));
			break;

		case "scrolling_menu_with_mousewheel":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "scrolling_menu_with_mousewheel"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "scrolling_menu_with_mousewheel", menu_target.scrolling_menu_with_mousewheel, "Scrolling Menu With Mousewheel", c_white, c_red, menu_target.scrolling_menu_with_mousewheel));
			}
			break;

		case "menu_navigation_speed":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "menu_navigation_speed", global.menu_navigation_speed, "Menu Navigation Speed"));
			break;

		case "menu_cursor_y_position":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "menu_cursor_y_position"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "menu_cursor_y_position", menu_target.menu_cursor_y_position, "Menu Cursor Y Position"));
			}
			break;

		case "menu_y_offset":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "menu_y_offset"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "menu_y_offset", menu_target.menu_y_offset, "Menu Y Offset"));
			}
			break;

		case "menu_y_offset_real":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "menu_y_offset_real"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "menu_y_offset_real", menu_target.menu_y_offset_real, "Menu Y Offset (Real)"));
			}
			break;

		case "menu_delay":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "menu_delay"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "menu_delay", menu_target.menu_delay, "Menu Delay", c_white, c_red, menu_target.menu_delay > 0));
			}
			break;

		case "menu_joystick_delay":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "menu_joystick_delay")
			&& gamepad_is_connected(0))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "menu_joystick_delay", menu_target.menu_joystick_delay, "Menu Joystick Delay", c_white, c_red, menu_target.menu_joystick_delay > 0));
			}
			break;

		case "thumbnail_sprite":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "thumbnail_sprite", global.thumbnail_sprite, "Thumbnail Sprite"));
			break;

		case "info_queue_index":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "info_queue_index"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "info_queue_index", menu_target.info_queue_index, "Info Queue Index"));
			}
			break;

		case "content_type":
			menu_target = scr_debug_get_menu_debug_target();
			if (menu_target != noone
			&& variable_instance_exists(menu_target, "content_type"))
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "content_type", menu_target.content_type, "Content Type"));
			}
			break;

		case "online_content_data_level":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "online_content_data_level", global.online_content_data_level, "Online Content Data Level"));
			break;

		case "online_content_data_character":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "online_content_data_character", global.online_content_data_character, "Online Content Data Character"));
			break;

		case "selected_online_download_index":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "selected_online_download_index", global.selected_online_download_index, "Selected Online Download Index"));
			break;

		case "automatically_play_downloaded_level":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "automatically_play_downloaded_level", global.automatically_play_downloaded_level, "Automatically Play Downloaded Level"));
			break;

		case "switch_account_status":
			if (os_type == os_switch)
			{
				var switch_probe_index = global.switch_accounts_probe_user_index;
				var switch_probe_valid = switch_probe_index >= 0
					&& switch_probe_index < global.switch_accounts_get_accounts_result;
				var switch_is_user_open_label = switch_probe_valid
					? "switch_accounts_is_user_open(" + string(switch_probe_index) + ")"
					: "switch_accounts_is_user_open(accountId)";
				var switch_is_user_open_value = switch_probe_valid
					? (global.switch_accounts_is_user_open_result ? "open" : "closed")
					: "n/a";

				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_account_name", global.switch_account_name, "Switch Account Name"));
				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_account_handle", global.switch_account_handle, "Switch Account Handle"));
				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_accounts_get_accounts()", global.switch_accounts_get_accounts_result, "switch_accounts_get_accounts()", c_white, c_red, global.switch_accounts_get_accounts_result <= 0));
				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_accounts_open_preselected_user()", global.switch_accounts_open_preselected_user_result, "switch_accounts_open_preselected_user()", c_white, c_red, global.switch_accounts_open_preselected_user_result < 0));
				array_push(line_specs, scr_debug_make_line_spec(item_key, switch_is_user_open_label, switch_is_user_open_value, switch_is_user_open_label, c_white, c_red, !switch_probe_valid || !global.switch_accounts_is_user_open_result));
				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_accounts_open_states", global.switch_accounts_open_states, "Switch Account Open States", c_white, c_red, global.switch_accounts_open_states == ""));
				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_account_netid", global.switch_account_netid, "Switch Account NetID"));
				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_account_network_service_available", global.switch_account_network_service_available, "Switch Network Service Available", c_white, c_red, !global.switch_account_network_service_available));
				array_push(line_specs, scr_debug_make_line_spec(item_key, "switch_logged_in", global.switch_logged_in, "Switch Logged In", c_white, c_red, !global.switch_logged_in));
			}
			break;

		case "online_token_status":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "online_enabled", global.online_enabled, "Online Enabled"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "online_token_validated", global.online_token_validated, "Online Token Validated", c_white, c_red, !global.online_token_validated));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "online_token_error_message", global.online_token_error_message, "Online Token Error Message", c_white, c_red, string(global.online_token_error_message) != ""));
			break;

		case "level_loading_summary":
			var level_loading_debug = scr_get_level_loading_debug_data();
			var missing_level_info = level_loading_debug.expect_level_files
				&& !level_loading_debug.level_information_exists;
			var missing_object_json = level_loading_debug.expect_level_files
				&& !level_loading_debug.object_placement_exists;
			var missing_background_directory = level_loading_debug.expect_level_files
				&& !level_loading_debug.background_path_exists;
			var failed_loaded_object_snapshot = level_loading_debug.expect_level_files
				&& level_loading_debug.object_placement_exists
				&& level_loading_debug.loaded_placed_object_count <= 0;
			var level_info_summary = scr_debug_format_resolved_path_summary(level_loading_debug.level_information_path, level_loading_debug.level_information_exists);
			var object_json_summary = scr_debug_format_resolved_path_summary(level_loading_debug.object_placement_path, level_loading_debug.object_placement_exists);
			var background_summary = scr_debug_format_resolved_path_summary(level_loading_debug.background_path, level_loading_debug.background_path_exists);
			var snapshot_summary = scr_debug_format_snapshot_summary(level_loading_debug.load_snapshot_status, level_loading_debug.load_snapshot_reason);
			var level_folder_display = scr_debug_format_level_folder_display(scr_is_loading_official_level(), level_loading_debug.level_folder_name, level_loading_debug.custom_folder_name);
			var after_goal_display = scr_debug_format_after_goal_display(level_loading_debug.after_goal_go_to_this_level);
			var validation_failed = string_pos(level_loading_debug.validation_result, "FAILED") == 1;
			var validation_display = scr_debug_format_validation_summary(level_loading_debug.validation_result);
			var show_custom_folder = level_loading_debug.load_mode == "custom";
			var show_path_to_use = string(level_loading_debug.path_to_use) != ""
				&& string(level_loading_debug.path_to_use) != string(level_loading_debug.background_path);
			var placeholder_cleanup_note = level_loading_debug.monitor_active
				? "expected: 'still present now 0' is normal after placeholder objects spawn gameplay objects"
				: "edit mode keeps placeholder objects alive instead of deleting them after spawn";

			array_push(line_specs, scr_debug_make_line_spec(item_key, "load_mode", level_loading_debug.load_mode, "Load Mode", c_white, c_red, missing_level_info || missing_object_json));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "character_select_in_this_menu", level_loading_debug.character_select_menu, "Character Menu"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "create_level_from_template", level_loading_debug.create_level_from_template, "From Template"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "select_level_index", level_loading_debug.select_level_index, "Level Index"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "global.level_name", level_loading_debug.level_name, "Level Name"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "display_level_folder", level_folder_display, "Level Folder"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "scr_get_selected_official_level_id()", level_loading_debug.selected_official_level_id, "Selected Official ID"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "scr_get_active_official_level_id()", level_loading_debug.active_official_level_id, "Active Official ID"));

			if (show_custom_folder)
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "scr_get_custom_level_folder_name()", level_loading_debug.custom_folder_name, "Custom Folder"));
			}

			array_push(line_specs, scr_debug_make_line_spec(item_key, "level_information_path + level_information_exists", level_info_summary, "Level Info", c_white, c_red, missing_level_info));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "object_placement_path + object_placement_exists", object_json_summary, "Object JSON", c_white, c_red, missing_object_json));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "background_path + background_path_exists", background_summary, "Background", c_white, c_red, missing_background_directory));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "load_snapshot_status + load_snapshot_reason", snapshot_summary, "Load Snapshot", c_white, c_red, level_loading_debug.load_snapshot_status != "OK"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "load_snapshot_json_entry_count", level_loading_debug.load_snapshot_json_entry_count, "JSON Entries"));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "validation_result", validation_display, "Automatic Load Check", c_white, c_red, validation_failed));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "placeholder_cleanup_note", placeholder_cleanup_note, "Placeholder Object Rule"));

			if (show_path_to_use)
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "global.path_to_use", scr_censor_game_save_id_for_display(level_loading_debug.path_to_use), "Path To Use"));
			}

			array_push(line_specs, scr_debug_make_line_spec(item_key, "loaded/current obj_level_player1_start count", scr_debug_format_loaded_live_summary(level_loading_debug.loaded_player1_start_count, level_loading_debug.current_live_player1_start_count), "P1 Start Placeholder", c_white, c_red, level_loading_debug.expect_level_files && level_loading_debug.loaded_player1_start_count <= 0));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "loaded/current obj_level_end count", scr_debug_format_loaded_live_summary(level_loading_debug.loaded_level_end_count, level_loading_debug.current_live_level_end_count), "Level End Placeholder", c_white, c_red, level_loading_debug.expect_level_files && level_loading_debug.loaded_level_end_count <= 0));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "loaded/current obj_leveleditor_placed_object count", scr_debug_format_loaded_live_summary(level_loading_debug.loaded_placed_object_count, level_loading_debug.current_live_placed_object_count), "Placed-Object Placeholder", c_white, c_red, failed_loaded_object_snapshot));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "runtime_spawn_calls", scr_debug_format_runtime_spawn_pass_summary(level_loading_debug.runtime_spawn_calls), "Placed-Object Spawn Passes", c_white, c_red, validation_failed));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "runtime_instances_created_total", scr_debug_format_runtime_instances_created_summary(level_loading_debug.runtime_instances_created_total), "Gameplay Instances Created", c_white, c_red, validation_failed));
			array_push(line_specs, scr_debug_make_line_spec(item_key, "display_after_goal_go_to_this_level", after_goal_display, "After Goal Level"));
			break;

		case "display_info":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "display_info", string(window_get_width()) + "x" + string(window_get_height()), "Display"));
			break;

		case "video_adapter":
			var adapter_description = scr_debug_get_current_video_adapter_description();
			if (adapter_description != undefined)
			{
				array_push(line_specs, scr_debug_make_line_spec(item_key, "video_adapter", adapter_description, "Video Adapter"));
			}
			break;

		case "room_info":
			array_push(line_specs, scr_debug_make_line_spec(item_key, "room_info", scr_debug_get_room_info_text(), "Room Info"));
			break;

		case "all_instance_count":
			for (var _object_id = 0; _object_id < 100; _object_id++)
			{
				var object_count = instance_number(_object_id);
				if (object_count >= 1)
				{
					var object_name = object_get_name(_object_id);
					array_push(line_specs, scr_debug_make_line_spec(item_key, object_name, object_count, object_name, make_color_hsv(object_count, 255, 255), c_red, false));
				}
			}
			break;

		case "gamepad_descriptions":
			for (var gamepad_index = 0; gamepad_index < 5; gamepad_index++)
			{
				var gamepad_description = gamepad_get_description(gamepad_index);
				if (gamepad_description != "")
				{
					array_push(line_specs, scr_debug_make_line_spec(item_key, "gamepad(" + string(gamepad_index) + ")", gamepad_description, "Gamepad " + string(gamepad_index) + " Description"));
				}
			}
			break;
	}

	variable_struct_set(global.debug_visibility_line_spec_cache, item_key, line_specs);
	return line_specs;
}

/// @function scr_debug_item_has_overlay_lines(item_key)
/* Returns true when a registry item is visible in overlay and currently resolves to at least one line. */
function scr_debug_item_has_overlay_lines(item_key)
{
	if (!scr_debug_should_draw_registry_item(item_key))
	{
		return false;
	}

	return array_length(scr_debug_get_registry_line_specs(item_key)) > 0;
}

/// @function scr_debug_any_visible_registry_lines(item_keys)
/* Returns true when any registry item in the provided array resolves to visible overlay lines. */
function scr_debug_any_visible_registry_lines(item_keys)
{
	for (var i = 0; i < array_length(item_keys); i++)
	{
		if (scr_debug_item_has_overlay_lines(item_keys[i]))
		{
			return true;
		}
	}

	return false;
}

/// @function scr_debug_draw_registry_item_lines(item_key, xx, yy, text_halign, text_valign, text_scale, line_spacing, max_width, force_draw)
/* Draws every runtime line that belongs to a registry item. */
function scr_debug_draw_registry_item_lines(item_key, xx, yy, text_halign = fa_left, text_valign = fa_top, text_scale = -1, line_spacing = 25, max_width = -1, force_draw = false)
{
	if (!force_draw
	&& !scr_debug_should_draw_registry_item(item_key))
	{
		return yy;
	}

	var line_specs = scr_debug_get_registry_line_specs(item_key);
	for (var i = 0; i < array_length(line_specs); i++)
	{
		yy = scr_debug_draw_registry_line_spec(item_key, xx, yy, line_specs[i], text_halign, text_valign, text_scale, line_spacing, max_width, true);
	}

	return yy;
}

/// @function scr_debug_get_compact_overlay_flattened_lines()
/* Flattens all active registry items into the single-column compact overlay order. */
function scr_debug_get_compact_overlay_flattened_lines()
{
	var flattened_lines = [];
	var item_keys = [];

	if (global.debug_screen)
	{
		if (!variable_global_exists("debug_visibility_overlay_item_keys")
		|| !is_array(global.debug_visibility_overlay_item_keys))
		{
			scr_debug_rebuild_visibility_runtime_cache();
		}

		if (variable_global_exists("debug_visibility_overlay_item_keys")
		&& is_array(global.debug_visibility_overlay_item_keys))
		{
			item_keys = global.debug_visibility_overlay_item_keys;
		}
	}
	else
	{
		if (!variable_global_exists("debug_visibility_always_item_keys")
		|| !is_array(global.debug_visibility_always_item_keys))
		{
			scr_debug_rebuild_visibility_runtime_cache();
		}

		if (variable_global_exists("debug_visibility_always_item_keys")
		&& is_array(global.debug_visibility_always_item_keys))
		{
			item_keys = global.debug_visibility_always_item_keys;
		}
	}

	if (!is_array(item_keys))
	{
		return flattened_lines;
	}

	for (var item_index = 0; item_index < array_length(item_keys); item_index++)
	{
		var item_key = item_keys[item_index];
		var item_line_specs = scr_debug_get_registry_line_specs(item_key);
		for (var line_index = 0; line_index < array_length(item_line_specs); line_index++)
		{
			array_push(flattened_lines,
			{
				item_key: item_key,
				line_spec: item_line_specs[line_index]
			});
		}
	}

	return flattened_lines;
}

/// @function scr_debug_get_compact_overlay_title()
/* Returns the title text for the menu-safe compact debug overlay panel. */
function scr_debug_get_compact_overlay_title()
{
	return global.debug_screen
		? "Debug Overlay"
		: "Debug Overlay (Always)";
}

/// @function scr_debug_get_compact_overlay_footer_top(gui_width, gui_height)
/* Estimates the top edge of the options footer box so the compact overlay can avoid it. */
function scr_debug_get_compact_overlay_footer_top(gui_width, gui_height)
{
	var option_default = "";
	if (global.option_default == 1)
	{
		option_default = l10n_text("On by default");
	}
	else
	if (global.option_default == 0)
	{
		option_default = l10n_text("Off by default");
	}

	var option_description_text = "";
	if (global.option_description != "" && global.option_default == -2)
	{
		option_description_text = l10n_text("Default") + ": " + string(global.option_description);
	}
	else
	if (global.option_description != "" && option_default != "")
	{
		option_description_text = string(global.option_description) + " - " + string(option_default);
	}
	else
	if (global.option_description != "")
	{
		option_description_text = string(global.option_description);
	}
	else
	{
		option_description_text = string(option_default);
	}

	if (option_description_text == "")
	{
		return gui_height - 20;
	}

	var max_text_width = gui_width * 0.98;
	var padding = 20;
	var scale = (global.default_text_size > 0) ? global.default_text_size * 0.9 : 1;
	var line_sep = 32;
	var text_height = scr_get_wrapped_text_height(option_description_text, max_text_width, line_sep, scale);
	var rect_bottom = gui_height - 10;
	var rect_top = rect_bottom - (max(32, text_height * 0.8)) - padding;

	return rect_top - 20;
}

/// @function scr_debug_draw_compact_overlay()
/* Draws the registry-driven debug panel that stays readable while the settings menu is open. */
function scr_debug_draw_compact_overlay()
{
	var target = scr_debug_get_settings_overlay_target();
	if (target == noone)
	{
		return;
	}

	if (!variable_global_exists("debug_compact_overlay_scroll_index"))
	{
		global.debug_compact_overlay_scroll_index = 0;
	}

	var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();
	var panel_margin = 20;
	var panel_width = min(clamp(gui_width * 0.36, 400, 540), gui_width - 410);
	var panel_left = gui_width - panel_width - panel_margin;
	var panel_top = panel_margin;
	var panel_right = panel_left + panel_width;
	var panel_padding = 16;
	var title_height = 30;
	var panel_content_top = panel_top + panel_padding + title_height + 12;
	var line_spacing = 23;
	var text_scale = global.default_text_size * 0.78;
	var flattened_lines = scr_debug_get_compact_overlay_flattened_lines();
	var total_line_count = array_length(flattened_lines);
	var panel_title = scr_debug_get_compact_overlay_title();
	var footer_top = min(scr_debug_get_compact_overlay_footer_top(gui_width, gui_height), gui_height - 120);
	var min_panel_height = panel_padding + title_height + 12 + 60 + panel_padding;
	var max_panel_bottom = min(gui_height - panel_margin, footer_top);
	var max_panel_height = max(min_panel_height, max_panel_bottom - panel_top);
	var max_panel_content_height = max(60, max_panel_height - (panel_padding + title_height + 12 + panel_padding));
	var max_visible_line_count = max(1, floor(max_panel_content_height / line_spacing));
	var visible_line_count = max(1, min(max_visible_line_count, total_line_count));
	var panel_content_height = max(60, visible_line_count * line_spacing);
	var panel_content_bottom = panel_content_top + panel_content_height;
	var panel_bottom = panel_content_bottom + panel_padding;
	var panel_content_width = panel_width - (panel_padding * 2) - 12;
	var max_scroll_index = max(0, total_line_count - visible_line_count);
	var key_page_up = vk_pageup;
	var key_page_down = vk_pagedown;
	var _gui_mouse_x = device_mouse_x_to_gui(0);
	var _gui_mouse_y = device_mouse_y_to_gui(0);
	var panel_hovered = point_in_rectangle(_gui_mouse_x, _gui_mouse_y, panel_left, panel_top, panel_right, panel_bottom);

	if (panel_hovered
	&& mouse_wheel_up())
	{
		global.debug_compact_overlay_scroll_index -= 1;
	}
	else
	if (panel_hovered
	&& mouse_wheel_down())
	{
		global.debug_compact_overlay_scroll_index += 1;
	}

	if (keyboard_check_pressed(key_page_up))
	{
		global.debug_compact_overlay_scroll_index -= 5;
	}
	else
	if (keyboard_check_pressed(key_page_down))
	{
		global.debug_compact_overlay_scroll_index += 5;
	}

	if (gamepad_is_connected(global.player_slot[1]))
	{
		if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderl))
		{
			global.debug_compact_overlay_scroll_index -= 5;
		}
		else
		if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderr))
		{
			global.debug_compact_overlay_scroll_index += 5;
		}
	}

	global.debug_compact_overlay_scroll_index = clamp(global.debug_compact_overlay_scroll_index, 0, max_scroll_index);

	draw_set_alpha(0.84);
	draw_roundrect_color_ext(panel_left, panel_top, panel_right, panel_bottom, 20, 20, c_black, c_black, false);
	draw_set_alpha(1);
	draw_line_width_color(panel_left + panel_padding, panel_top + panel_padding + title_height, panel_right - panel_padding, panel_top + panel_padding + title_height, 2, c_yellow, c_yellow);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	scr_draw_text_outlined(panel_left + panel_padding, panel_top + panel_padding, panel_title, global.default_text_size * 0.92, c_black, c_yellow, 1);

	if (total_line_count <= 0)
	{
		scr_draw_text_outlined(panel_left + panel_padding, panel_content_top, "No active debug screen text", text_scale, c_black, c_ltgray, 1);
		return;
	}

	var draw_y = panel_content_top;
	for (var visible_index = global.debug_compact_overlay_scroll_index; visible_index < total_line_count; visible_index++)
	{
		if (draw_y + line_spacing > panel_content_bottom + 1)
		{
			break;
		}

		var flattened_entry = flattened_lines[visible_index];
		draw_y = scr_debug_draw_registry_line_spec(flattened_entry.item_key, panel_left + panel_padding, draw_y, flattened_entry.line_spec, fa_left, fa_top, text_scale, line_spacing, panel_content_width, true);
	}

	if (max_scroll_index > 0)
	{
		var scrollbar_left = panel_right - 8;
		var scrollbar_top = panel_content_top;
		var scrollbar_bottom = panel_content_bottom;
		var scrollbar_height = scrollbar_bottom - scrollbar_top;
		var thumb_height = max(24, (visible_line_count / total_line_count) * scrollbar_height);
		var thumb_top = scrollbar_top + ((global.debug_compact_overlay_scroll_index / max_scroll_index) * max(1, scrollbar_height - thumb_height));

		draw_set_alpha(0.4);
		draw_rectangle_color(scrollbar_left, scrollbar_top, scrollbar_left + 4, scrollbar_bottom, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
		draw_rectangle_color(scrollbar_left, thumb_top, scrollbar_left + 4, thumb_top + thumb_height, c_yellow, c_yellow, c_yellow, c_yellow, false);
	}
}

/// @function scr_debug_draw_always_registry_widgets()
/* Draws active ALWAYS-mode registry items in their declared anchor order when the full overlay is closed. */
function scr_debug_draw_always_registry_widgets()
{
	if (global.debug_screen
	|| scr_debug_should_use_compact_overlay())
	{
		return;
	}

	if (!variable_global_exists("debug_visibility_has_any_always"))
	{
		scr_debug_rebuild_visibility_runtime_cache();
	}

	if (!variable_global_exists("debug_visibility_has_any_always")
	|| !global.debug_visibility_has_any_always
	|| !variable_global_exists("debug_visibility_always_item_keys")
	|| !is_array(global.debug_visibility_always_item_keys))
	{
		return;
	}

	var top_left_x = 32;
	var top_left_y = 32;
	var top_right_x = display_get_gui_width() - 32;
	var top_right_y = 32;
	var bottom_center_lines = [];
	var line_spacing = 25;

	for (var item_index = 0; item_index < array_length(global.debug_visibility_always_item_keys); item_index++)
	{
		var item_key = global.debug_visibility_always_item_keys[item_index];
		var definition = scr_debug_get_visibility_definition(item_key);
		if (definition == undefined
		|| !definition.allow_always)
		{
			continue;
		}

		switch (string(definition.always_anchor))
		{
			case "top_left":
				top_left_y = scr_debug_draw_registry_item_lines(item_key, top_left_x, top_left_y, fa_left, fa_top, global.default_text_size, line_spacing, -1, true);
				break;

			case "top_right":
				top_right_y = scr_debug_draw_registry_item_lines(item_key, top_right_x, top_right_y, fa_right, fa_top, global.default_text_size, line_spacing, -1, true);
				break;

			case "bottom_center":
				var bottom_specs = scr_debug_get_registry_line_specs(item_key);
				for (var bottom_index = 0; bottom_index < array_length(bottom_specs); bottom_index++)
				{
					array_push(bottom_center_lines,
					{
						item_key: item_key,
						line_spec: bottom_specs[bottom_index]
					});
				}
				break;
		}
	}

	if (array_length(bottom_center_lines) > 0)
	{
		var bottom_center_start_y = display_get_gui_height() - 32 - ((array_length(bottom_center_lines) - 1) * line_spacing);
		for (var line_index = 0; line_index < array_length(bottom_center_lines); line_index++)
		{
			var bottom_entry = bottom_center_lines[line_index];
			scr_debug_draw_registry_line_spec(bottom_entry.item_key, display_get_gui_width() * 0.5, bottom_center_start_y + (line_index * line_spacing), bottom_entry.line_spec, fa_center, fa_middle, global.default_text_size, line_spacing, -1, true);
		}
	}
}
