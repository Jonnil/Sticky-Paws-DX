/// @function scr_get_debug_info()
/* Returns a string containing key debug information */
/* Modify this function to include whatever debug data you need */
function scr_get_debug_info()
{
	/* Logs debug information to a info variable */
	/* Captures system, game state, runtime data, performance, and diagnostics for debugging */
	var info = "";
	
	/* --- Log Metadata Section --- */
	info += "--- Log Metadata ---\n";
	info += "Game Name: " + string(global.game_name) + "\n";
	info += "Timestamp: " + date_datetime_string(date_current_datetime()) + "\n";
	info += "Session Duration: " + string(current_time / 1000) + " seconds\n";
	
	/* --- OS Info Section --- */
	info += "\n--- OS Info ---\n";
	var os_info = os_get_info();
	var key = ds_map_find_first(os_info);
	while (key != undefined)
	{
		var value = ds_map_find_value(os_info, key);
		info += string(key) + ": " + string(value) + "\n";
		key = ds_map_find_next(os_info, key);
	}
	ds_map_destroy(os_info);
	
	/* --- OS State Section --- */
	info += "\n--- OS State ---\n";
	info += "os_browser: " + string(os_browser) + "\n";
	info += "os_device: " + string(os_device) + "\n";
	info += "os_type: " + string(os_type) + "\n";
	info += "os_is_paused: " + string(os_is_paused()) + "\n";
	info += "os_is_network_connected: " + string(os_is_network_connected()) + "\n";
	info += "os_get_config: " + string(os_get_config()) + "\n";
	info += "os_get_language: " + string(os_get_language()) + "\n";
	info += "os_get_region: " + string(os_get_region()) + "\n";
	
	/* --- GameMaker Runtime Info Section --- */
	info += "\n--- GameMaker Runtime Info ---\n";
	info += "build_date: " + date_time_string(GM_build_date) + "\n";
	info += "build_type: " + string(GM_build_type) + "\n";
	info += "version: " + string(GM_version) + "\n";
	info += "runtime_version: " + string(GM_runtime_version) + "\n";
	info += "project_filename: " + string(GM_project_filename) + "\n";
	info += "parameter_count: " + string(parameter_count()) + "\n";
	info += "environment_APPDATA: " + string(environment_get_variable("APPDATA")) + "\n";
	
	/* --- Game State Section --- */
	info += "\n--- Game State ---\n";
	info += "current_room: " + string(room_get_name(room)) + "\n";
	info += "current_fps: " + string(fps) + "\n";
	info += "player_positions: " + string(scr_get_player_positions()) + "\n";
	info += "instance_count: " + string(instance_count) + "\n";
	
	/* --- Performance Section --- */
	info += "\n--- Performance Info ---\n";
    info += "FPS: " + string(fps) + "\n";
    info += "Real FPS: " + string(fps_real) + "\n";
    info += "Max FPS: " + string(global.max_fps) + "\n";
	
	/* --- Display and Room Info Section --- */
	info += "\n--- Display & Room Info ---\n";
    info += "Screen: " + string(window_get_width()) + "x" + string(window_get_height()) + "\n";
    info += "Room: " + string(room_get_name(room)) + " (" + string(room_width) + "x" + string(room_height) + ")\n";
	
	/* --- Instance Information Section --- */
	info += "\n--- Instance Information ---\n";
	for (var i = 0; i < 100; i++)
	{
		if (instance_number(i) > 0)
		{
			info += string(object_get_name(i)) + ": " + string(instance_number(i)) + "\n";
		}
	}
	
	/* --- Controller Information Section --- */
	info += "\n--- Controller Information ---\n";
	for (var i = 0; i < gamepad_get_device_count(); i++)
	{
		var gamepad_desc = gamepad_get_description(i);
		if (gamepad_desc != "")
		{
			info += "gamepad_" + string(i) + ": " + gamepad_desc + "\n";
		}
	}
	info += "active_players: " + string(global.playergame) + "\n";
	info += "player_slots: " + string(global.player_slot) + "\n";
	
	/* --- Menu Information Section --- */
	info += "\n--- Menu Information ---\n";
	if (variable_instance_exists(debug_target, "menu"))
	{
		info += "current_menu: " + string(debug_target.menu) + "\n";
	}
	if (variable_instance_exists(debug_target, "level_editor_menu"))
	{
		info += "level_editor_menu: " + string(debug_target.level_editor_menu) + "\n";
	}
	if (variable_instance_exists(debug_target, "menu_cursor_y_position"))
	{
		info += "menu_cursor_y_position: " + string(debug_target.menu_cursor_y_position) + "\n";
	}
	info += "menu_navigation_speed: " + string(global.menu_navigation_speed) + "\n";
	
	/* --- Switch-Specific Information Section --- */
	if (os_type == os_switch)
	{
		info += "\n--- Switch Info ---\n";
		info += "account_name: " + string(global.switch_account_name) + "\n";
		info += "is_user_online: " + string(global.switch_account_is_user_online) + "\n";
		info += "network_service_available: " + string(global.switch_account_network_service_available) + "\n";
		info += "online_token_error: " + string(global.online_token_error_message) + "\n";
	}
	
	/* --- Global Variables Information Section --- */
	info += "\n--- Global Variables ---\n";
	info += scr_save_all_globals() + "\n";
	
	return info;
}

/// @function scr_save_all_globals()
/* Saves every global variable to the given INI section */
/* @param {string} ini_section - The name of the INI section under which to save all globals */
function scr_save_all_globals()
{
	var info = "";
	
	/* Get an array of all global variable names */
	var keys = struct_get_names(global);
	var count = array_length(keys);
	
	/* Loop through every global variable */
	for (var i = 0; i < count; i++)
	{
		var var_name = keys[i];
		
		/* Retrieve the variable's value */
		/* Note: Ensure that the value can be converted to a string */
		var val = string(variable_global_get(var_name));
		
		/* Write the global variable's value to the info variable */
		info += var_name + ": " + string(val) + "\n";
	}
	
	return info;
}