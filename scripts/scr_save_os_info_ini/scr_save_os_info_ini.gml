function scr_save_os_info_ini()
{
	/* Format the date for the file name */
	var save_date = string_replace_all(date_datetime_string(date_current_datetime()), ":", "_");
	save_date = string_replace_all(save_date, "/", "_");
	
	/* Open the .ini file with a path including the save date */
	ini_open(game_save_id + "telemetry/" + string(save_date) + "_telemetry.ini");
	
	/* --- OS Get Info Section --- */
	var _info = os_get_info(); /* Retrieve OS info as a DS map */
	var key = ds_map_find_first(_info); /* Get the first key in the DS map */
	
	/* Iterate through the map to write all key-value pairs */
	while (key != undefined)
	{
		var value = ds_map_find_value(_info, key);
		ini_write_string("OS_Info", key, string(value)); /* Write key-value to the .ini file */
		key = ds_map_find_next(_info, key); /* Move to the next key */
	}
	
	ds_map_destroy(_info); /* Clean up the DS map */
	
	/* --- Additional OS and Game Info --- */
	ini_write_string("OS_Info", "os_browser", string(os_browser));
	ini_write_string("OS_Info", "os_device", string(os_device));
	ini_write_string("OS_Info", "os_type", string(os_type));
	ini_write_string("OS_Info", "os_is_paused", string(os_is_paused()));
	ini_write_string("OS_Info", "os_is_network_connected", string(os_is_network_connected()));
	ini_write_string("OS_Info", "os_get_config", string(os_get_config()));
	ini_write_string("OS_Info", "os_get_language", string(os_get_language()));
	ini_write_string("OS_Info", "os_get_region", string(os_get_region()));
	
	/* --- Additional GameMaker Info --- */
	ini_write_string("Other", "GM_build_date", date_time_string(GM_build_date));
	ini_write_string("Other", "GM_build_type", string(GM_build_type));
	ini_write_string("Other", "GM_version", string(GM_version));
	ini_write_string("Other", "GM_runtime_version", string(GM_runtime_version));
	ini_write_string("Other", "GM_project_filename", string(GM_project_filename));
	ini_write_string("Other", "parameter_count", string(parameter_count()));
	ini_write_string("Other", "environment_get_variable(APPDATA)", string(environment_get_variable("APPDATA")));
	ini_write_string("Other", "game_version", "v" + string(scr_get_build_date()));
	ini_write_string("Other", "date_current_datetime", string(date_datetime_string(date_current_datetime())));
	
	/* Close the .ini file and commit the save data */
	ini_close();
	switch_save_data_commit();
}