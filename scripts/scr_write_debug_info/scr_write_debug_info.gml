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
	ini_write_string("OS State", "os_device", string(os_get_info));
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
	if (variable_instance_exists(debug_target, "menu"))
	{
		ini_write_string("Menu Information", "current_menu", string(debug_target.menu));
	}

	if (variable_instance_exists(debug_target, "level_editor_menu"))
	{
		ini_write_string("Menu Information", "level_editor_menu", string(debug_target.level_editor_menu));
	}

	if (variable_instance_exists(debug_target, "menu_cursor_y_position"))
	{
		ini_write_real("Menu Information", "menu_cursor_y_position", debug_target.menu_cursor_y_position);
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
