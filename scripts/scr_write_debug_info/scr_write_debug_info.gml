/// @function scr_write_debug_info()
/* Writes detailed debug information into the currently open INI file */
function scr_write_debug_info()
{
	/* [Log Metadata] */
	ini_write_string("Log Metadata", "Game Name", string(global.game_name));
	ini_write_string("Log Metadata", "Timestamp", scr_format_timestamp(date_current_datetime()));
	ini_write_real("Log Metadata", "Session Duration", current_time / 1000);

	/* [OS Info] */
	var os_info = os_get_info();
	var key = ds_map_find_first(os_info);

	while (key != undefined)
	{
		var value = ds_map_find_value(os_info, key);
		ini_write_string("OS Info", string(key), string(value));
		key = ds_map_find_next(os_info, key);
	}
	ds_map_destroy(os_info);

	/* [OS State] */
	ini_write_string("OS State", "os_browser", string(os_browser));
	ini_write_string("OS State", "os_device", string(os_get_info()));
	ini_write_string("OS State", "os_type", string(scr_os_type_to_string(false, true)));
	ini_write_string("OS State", "os_is_paused", string(os_is_paused()));
	ini_write_string("OS State", "os_is_network_connected", string(os_is_network_connected(network_connect_passive)));
	ini_write_string("OS State", "os_get_config", string(os_get_config()));
	ini_write_string("OS State", "os_get_language", string(os_get_language()));
	ini_write_string("OS State", "os_get_region", string(os_get_region()));

	/* [GameMaker Runtime Info] */
	ini_write_string("GameMaker Runtime Info", "build_date", date_time_string(GM_build_date));
	ini_write_string("GameMaker Runtime Info", "build_type", string(GM_build_type));
	ini_write_string("GameMaker Runtime Info", "version", string(GM_version));
	ini_write_string("GameMaker Runtime Info", "runtime_version", string(GM_runtime_version));
	ini_write_string("GameMaker Runtime Info", "project_filename", string(GM_project_filename));
	ini_write_real("GameMaker Runtime Info", "parameter_count", parameter_count());
	ini_write_string("GameMaker Runtime Info", "environment_APPDATA", string(environment_get_variable("APPDATA")));

	/* [Game State] */
	ini_write_string("Game State", "current_room", string(room_get_name(room)));
	ini_write_real("Game State", "current_fps", fps);
	ini_write_string("Game State", "player_positions", string(scr_get_player_positions()));
	ini_write_real("Game State", "instance_count", instance_count);

	/* [Level Loading] */
	var level_loading_debug = scr_get_level_loading_debug_data();
	ini_write_string("Level Loading", "load_mode", string(level_loading_debug.load_mode));
	ini_write_string("Level Loading", "character_select_in_this_menu", string(level_loading_debug.character_select_menu));
	ini_write_string("Level Loading", "create_level_from_template", string(level_loading_debug.create_level_from_template));
	ini_write_string("Level Loading", "select_level_index", string(level_loading_debug.select_level_index));
	ini_write_string("Level Loading", "global.level_name", string(level_loading_debug.level_name));
	ini_write_string("Level Loading", "global.level_folder_name", string(level_loading_debug.level_folder_name));
	ini_write_string("Level Loading", "global.level_description", string(level_loading_debug.level_description));
	ini_write_string("Level Loading", "selected_official_level_id", string(level_loading_debug.selected_official_level_id));
	ini_write_string("Level Loading", "active_official_level_id", string(level_loading_debug.active_official_level_id));
	ini_write_string("Level Loading", "custom_folder_name", string(level_loading_debug.custom_folder_name));
	ini_write_string("Level Loading", "level_information_path", string(level_loading_debug.level_information_path));
	ini_write_string("Level Loading", "level_information_exists", string(level_loading_debug.level_information_exists));
	ini_write_string("Level Loading", "object_placement_path", string(level_loading_debug.object_placement_path));
	ini_write_string("Level Loading", "object_placement_exists", string(level_loading_debug.object_placement_exists));
	ini_write_string("Level Loading", "background_path", string(level_loading_debug.background_path));
	ini_write_string("Level Loading", "background_path_exists", string(level_loading_debug.background_path_exists));
	ini_write_string("Level Loading", "load_snapshot_reason", string(level_loading_debug.load_snapshot_reason));
	ini_write_string("Level Loading", "load_snapshot_status", string(level_loading_debug.load_snapshot_status));
	ini_write_string("Level Loading", "load_snapshot_timestamp", string(level_loading_debug.load_snapshot_timestamp));
	ini_write_real("Level Loading", "loaded_json_entry_count", level_loading_debug.load_snapshot_json_entry_count);
	ini_write_string("Level Loading", "monitor_session_id", string(level_loading_debug.monitor_session_id));
	ini_write_string("Level Loading", "validation_result", string(level_loading_debug.validation_result));
	ini_write_string("Level Loading", "validation_pending", string(level_loading_debug.validation_pending));
	ini_write_string("Level Loading", "global.path_to_use", string(level_loading_debug.path_to_use));
	ini_write_real("Level Loading", "loaded_obj_level_player1_start_count", level_loading_debug.loaded_player1_start_count);
	ini_write_real("Level Loading", "current_live_obj_level_player1_start_count", level_loading_debug.current_live_player1_start_count);
	ini_write_real("Level Loading", "loaded_obj_level_end_count", level_loading_debug.loaded_level_end_count);
	ini_write_real("Level Loading", "current_live_obj_level_end_count", level_loading_debug.current_live_level_end_count);
	ini_write_real("Level Loading", "loaded_obj_leveleditor_placed_object_count", level_loading_debug.loaded_placed_object_count);
	ini_write_real("Level Loading", "current_live_obj_leveleditor_placed_object_count", level_loading_debug.current_live_placed_object_count);
	ini_write_real("Level Loading", "runtime_spawn_calls", level_loading_debug.runtime_spawn_calls);
	ini_write_real("Level Loading", "runtime_instances_created_total", level_loading_debug.runtime_instances_created_total);
	ini_write_string("Level Loading", "after_goal_go_to_this_level", string(level_loading_debug.after_goal_go_to_this_level));

	/* [Auto Level Load Error] */
	var auto_level_load_context = undefined;
	if (variable_global_exists("debug_auto_level_load_log_context")
	&& is_struct(global.debug_auto_level_load_log_context))
	{
		auto_level_load_context = global.debug_auto_level_load_log_context;
	}

	var auto_generated = false;
	var failure_reason = string(level_loading_debug.failure_reason);
	var failure_signature = string(level_loading_debug.failure_signature);
	var validation_delay_frames = level_loading_debug.validation_delay_frames;
	var session_id = string(level_loading_debug.monitor_session_id);

	if (!is_undefined(auto_level_load_context))
	{
		if (variable_struct_exists(auto_level_load_context, "auto_generated"))
		{
			auto_generated = auto_level_load_context.auto_generated;
		}

		if (variable_struct_exists(auto_level_load_context, "failure_reason"))
		{
			failure_reason = string(auto_level_load_context.failure_reason);
		}

		if (variable_struct_exists(auto_level_load_context, "failure_signature"))
		{
			failure_signature = string(auto_level_load_context.failure_signature);
		}

		if (variable_struct_exists(auto_level_load_context, "validation_delay_frames"))
		{
			validation_delay_frames = real(auto_level_load_context.validation_delay_frames);
		}

		if (variable_struct_exists(auto_level_load_context, "session_id"))
		{
			session_id = string(auto_level_load_context.session_id);
		}
	}

	ini_write_string("Auto Level Load Error", "auto_generated", string(auto_generated));
	ini_write_string("Auto Level Load Error", "session_id", session_id);
	ini_write_string("Auto Level Load Error", "validation_result", string(level_loading_debug.validation_result));
	ini_write_string("Auto Level Load Error", "failure_reason", failure_reason);
	ini_write_string("Auto Level Load Error", "failure_signature", failure_signature);
	ini_write_real("Auto Level Load Error", "validation_delay_frames", validation_delay_frames);
	ini_write_real("Auto Level Load Error", "runtime_spawn_calls", level_loading_debug.runtime_spawn_calls);
	ini_write_real("Auto Level Load Error", "runtime_instances_created_total", level_loading_debug.runtime_instances_created_total);

	/* [Performance Info] */
	ini_write_real("Performance Info", "FPS", fps);
	ini_write_real("Performance Info", "Real FPS", fps_real);
	ini_write_real("Performance Info", "Max FPS", global.max_fps);

	/* [Display & Room Info] */
	ini_write_string("Display & Room Info", "Screen", string(window_get_width()) + "x" + string(window_get_height()));
	ini_write_string("Display & Room Info", "Room", string(room_get_name(room)) + " (" + string(room_width) + "x" + string(room_height) + ")");

	/* [Instance Information] */
	for (var i = 0; i < 100; i++)
	{
		if (instance_number(i) > 0)
		{
			ini_write_real("Instance Information", string(object_get_name(i)), instance_number(i));
		}
	}

	/* [Controller Information] */
	for (var i = 0; i < gamepad_get_device_count(); i++)
	{
		var gamepad_desc = gamepad_get_description(i);
		if (gamepad_desc != "")
		{
			ini_write_string("Controller Information", "gamepad_" + string(i), gamepad_desc);
		}
	}
	ini_write_string("Controller Information", "active_players", string(global.playergame));
	ini_write_string("Controller Information", "player_slots", string(global.player_slot));

	/* [Menu Information] */
	var menu_debug_target = noone;

	if (instance_exists(obj_debug_manager))
	{
		var debug_manager = instance_find(obj_debug_manager, 0);

		if (variable_instance_exists(debug_manager, "debug_target"))
		{
			var candidate_debug_target = debug_manager.debug_target;

			if (instance_exists(candidate_debug_target))
			{
				menu_debug_target = candidate_debug_target;
			}
		}
	}

	if (menu_debug_target == noone)
	&& (
		variable_instance_exists(id, "menu")
		|| variable_instance_exists(id, "level_editor_menu")
		|| variable_instance_exists(id, "menu_cursor_y_position")
	)
	{
		menu_debug_target = id;
	}

	if (menu_debug_target != noone)
	&& (variable_instance_exists(menu_debug_target, "menu"))
	{
		ini_write_string("Menu Information", "current_menu", string(menu_debug_target.menu));
	}

	if (menu_debug_target != noone)
	&& (variable_instance_exists(menu_debug_target, "level_editor_menu"))
	{
		ini_write_string("Menu Information", "level_editor_menu", string(menu_debug_target.level_editor_menu));
	}

	if (menu_debug_target != noone)
	&& (variable_instance_exists(menu_debug_target, "menu_cursor_y_position"))
	{
		ini_write_real("Menu Information", "menu_cursor_y_position", menu_debug_target.menu_cursor_y_position);
	}

	ini_write_real("Menu Information", "menu_navigation_speed", global.menu_navigation_speed);

	/* [Switch Info] (if applicable) */
	if (os_type == os_switch)
	{
		ini_write_string("Switch Info", "account_name", string(global.switch_account_name));
		ini_write_string("Switch Info", "network_service_available", string(global.switch_account_network_service_available));
		ini_write_string("Switch Info", "online_token_error", string(global.online_token_error_message));
	}

	/* [Global Variables] */
	var keys = struct_get_names(global);
	var count = array_length(keys);

	for (var i = 0; i < count; i++)
	{
		var var_name = keys[i];
		var val = variable_global_get(var_name);

		if (is_real(val))
		{
			ini_write_real("Global Variables", var_name, real(val));
		}
		else
		{
			ini_write_string("Global Variables", var_name, string(val));
		}
	}
}
