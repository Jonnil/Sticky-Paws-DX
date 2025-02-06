function scr_save_debug_info_ini()
{
	/* Logs debug information to a .ini file in the Local AppData folder for this game */
	/* Captures system, game state, runtime data, performance, and diagnostics for debugging */
	
	/* Ensure the debug logs folder exists */
	var logs_folder = game_save_id + "debug_logs/";
	if (!directory_exists(logs_folder))
	{
		directory_create(logs_folder);
	}
	
	/* Format the date and time to create a unique file name */
	var save_date = string_replace_all(date_datetime_string(date_current_datetime()), ":", "_");
	save_date = string_replace_all(save_date, "/", "_");
	
	/* Include game name in the file name for easier identification */
	var log_file_path = logs_folder + string(global.game_name) + "_" + save_date + "_debug_info.ini";
	ini_open(log_file_path);
	
	/* --- Log Metadata Section --- */
	ini_write_string("Log_Metadata", "game_name", string(global.game_name));
	ini_write_string("Log_Metadata", "timestamp", string(date_datetime_string(date_current_datetime())));
	ini_write_string("Log_Metadata", "session_duration", string(current_time / 1000) + " seconds");
	ini_write_string("Log_Metadata", "log_file_path", log_file_path);
	
	/* --- OS Info Section --- */
	var os_info = os_get_info();
	var key = ds_map_find_first(os_info);
	while (key != undefined)
	{
		var value = ds_map_find_value(os_info, key);
		ini_write_string("OS_Info", key, string(value));
		key = ds_map_find_next(os_info, key);
	}
	ds_map_destroy(os_info);
	
	/* --- OS State Section --- */
	ini_write_string("OS_State", "os_browser", string(os_browser));
	ini_write_string("OS_State", "os_device", string(os_device));
	ini_write_string("OS_State", "os_type", string(os_type));
	ini_write_string("OS_State", "os_is_paused", string(os_is_paused()));
	ini_write_string("OS_State", "os_is_network_connected", string(os_is_network_connected()));
	ini_write_string("OS_State", "os_get_config", string(os_get_config()));
	ini_write_string("OS_State", "os_get_language", string(os_get_language()));
	ini_write_string("OS_State", "os_get_region", string(os_get_region()));
	
	/* --- GameMaker Runtime Info Section --- */
	ini_write_string("GM_Runtime_Info", "build_date", date_time_string(GM_build_date));
	ini_write_string("GM_Runtime_Info", "build_type", string(GM_build_type));
	ini_write_string("GM_Runtime_Info", "version", string(GM_version));
	ini_write_string("GM_Runtime_Info", "runtime_version", string(GM_runtime_version));
	ini_write_string("GM_Runtime_Info", "project_filename", string(GM_project_filename));
	ini_write_string("GM_Runtime_Info", "parameter_count", string(parameter_count()));
	ini_write_string("GM_Runtime_Info", "environment_APPDATA", string(environment_get_variable("APPDATA")));
	
	/* --- Game State Section --- */
	ini_write_string("Game_State", "current_room", string(room_get_name(room)));
	ini_write_string("Game_State", "current_fps", string(fps));
	ini_write_string("Game_State", "player_positions", json_stringify(scr_get_player_positions())); /* Custom function */
	ini_write_string("Game_State", "instance_count", string(instance_count));
	
	/* --- Performance Section --- */
	ini_write_string("Performance", "fps", string(fps));
	ini_write_string("Performance", "fps_real", string(fps_real));
	ini_write_string("Performance", "max_fps", string(global.max_fps));
	
	/* --- Display and Room Info Section --- */
	ini_write_string("Display_Info", "screen_width", string(window_get_width()));
	ini_write_string("Display_Info", "screen_height", string(window_get_height()));
	ini_write_string("Display_Info", "room_width", string(room_width));
	ini_write_string("Display_Info", "room_height", string(room_height));
	
	/* --- Instance Information Section --- */
	if (global.show_all_instance_count)
	{
		for (var i = 0; i < 100; i++)
		{
			if (instance_number(i) > 0)
			{
				ini_write_string("Instance_Info", object_get_name(i), string(instance_number(i)));
			}
		}
	}
	
	/* --- Controller Information Section --- */
	for (var i = 0; i < gamepad_get_device_count(); i++)
	{
		var gamepad_desc = gamepad_get_description(i);
		if (gamepad_desc != "")
		{
			ini_write_string("Controller_Info", "gamepad_" + string(i), gamepad_desc);
		}
	}
	ini_write_string("Controller_Info", "active_players", string(global.playergame));
	ini_write_string("Controller_Info", "player_slots", string(global.player_slot));
	
	/* --- Menu Information Section --- */
	if (variable_instance_exists(self, "menu"))
	{
		ini_write_string("Menu_Info", "current_menu", string(menu));
	}
	if (variable_instance_exists(self, "level_editor_menu"))
	{
		ini_write_string("Menu_Info", "level_editor_menu", string(level_editor_menu));
	}
	if (variable_instance_exists(self, "menu_cursor_y_position"))
	{
		ini_write_string("Menu_Info", "menu_cursor_y_position", string(menu_cursor_y_position));
	}
	ini_write_string("Menu_Info", "menu_navigation_speed", string(global.menu_navigation_speed));
	
	/* --- Switch-Specific Information Section --- */
	if (os_type == os_switch)
	{
		ini_write_string("Switch_Info", "account_name", string(global.switch_account_name));
		ini_write_string("Switch_Info", "is_user_online", string(global.switch_account_is_user_online));
		ini_write_string("Switch_Info", "network_service_available", string(global.switch_account_network_service_available));
		ini_write_string("Switch_Info", "online_token_error", string(global.online_token_error_message));
	}
	
	/* Close the .ini file to commit the data */
	ini_close();
	
	/* Optional Debug Message */
	show_debug_message("Debug information saved to: " + log_file_path);
}