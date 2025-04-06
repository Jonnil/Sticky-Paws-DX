function scr_save_crash_log(crash_logs_folder = "", crash_log_filename = "", game_name = "", save_date = "")
{
	/* If the network or token validation is not available, move the crash log file to the pending folder */
	if (file_exists(crash_logs_folder + crash_log_filename))
	{
		var pending_folder = game_save_id + "pending_crash_logs/";
		
		if (!directory_exists(pending_folder))
		{
			directory_create(pending_folder);
		}
		file_copy(crash_logs_folder + crash_log_filename, pending_folder + crash_log_filename);
		switch_save_data_commit();
		show_debug_message("[scr_crash_error_handling] Copied file from " + string(crash_logs_folder) + crash_log_filename + "\nto " + pending_folder + crash_log_filename + "\n");
	}
}