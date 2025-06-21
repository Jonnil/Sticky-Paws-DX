/// @function scr_crash_error_handling()
function scr_crash_error_handling()
{
	if (os_type == os_switch) exit; /* Retrieve Crash Reports from CRPORTAL instead */
	
	/* Crash Error Handling should run in every room of the game */
	exception_unhandled_handler(function(ex)
	{
		var game_name = string_replace_all(global.game_name, " ", "_");
		
		#region /* Define Crash Logs Folder and File */
		var crash_logs_folder = game_save_id + "crash_logs/";
		
		if (!directory_exists(crash_logs_folder))
		{
			directory_create(crash_logs_folder);
		}
		
		#region /* Save Date */
		var current_dt = date_current_datetime();
		
		var year_str  = string(date_get_year(current_dt));
		
		var month_val = date_get_month(current_dt);
		var month_str = (month_val < 10) ? "0" + string(month_val) : string(month_val);
		
		var day_val   = date_get_day(current_dt);
		var day_str   = (day_val < 10) ? "0" + string(day_val) : string(day_val);
		
		var hour_val  = date_get_hour(current_dt);
		var hour_str  = (hour_val < 10) ? "0" + string(hour_val) : string(hour_val);
		
		var minute_val = date_get_minute(current_dt);
		var minute_str = (minute_val < 10) ? "0" + string(minute_val) : string(minute_val);
		
		var second_val = date_get_second(current_dt);
		var second_str = (second_val < 10) ? "0" + string(second_val) : string(second_val);
		
		var save_date = year_str + "-" + month_str + "-" + day_str + "_" + hour_str + "." + minute_str + "." + second_str;
		#endregion /* Save Date END */
		
		/* Filename format .ini */
		var crash_log_filename = "crash-" + string(game_name) + "_v" + string(scr_get_build_date()) + "_" + save_date + "_" + string(scr_os_type_to_string(true, true)) + ".ini";
		#endregion /* Define Crash Logs Folder and File END */
		
		#region /* Extract Line Number from Error Message */
		var line_number = -1;
		var line_start = string_pos("(line ", ex.longMessage);
		if (line_start > 0)
		{
			line_start += 6;
			var remaining_message = string_copy(ex.longMessage, line_start, string_length(ex.longMessage) - line_start + 1);
			var line_end = string_pos(")", remaining_message);
			if (line_end > 0)
			{
				line_number = real(string_copy(remaining_message, 1, line_end - 1));
			}
		}
		#endregion /* Extract Line Number from Error Message END */
		
		#region /* Get Documentation Links and Advice */
		var docs_and_urls = scr_get_relevant_docs(string(ex.stacktrace), ex.longMessage);
		var doc_details = docs_and_urls[0];
		var urls_to_open = docs_and_urls[1];
		#endregion /* Get Documentation Links and Advice END */
		
		#region /* Write Crash Details and Debug Info to INI File */
		ini_open(crash_logs_folder + crash_log_filename);
		
		#region /* [Crash] section */
		ini_write_string("Crash", "Game", string(game_name));
		ini_write_string("Crash", "Version", "v" + scr_get_build_date());
		ini_write_string("Crash", "Timestamp", save_date);
		ini_write_string("Crash", "Message", ex.message);
		ini_write_string("Crash", "LongMessage", ex.longMessage);
		ini_write_string("Crash", "Script", ex.script);
		
		var crash_details = 
			"Game: " + string(game_name) + "\n" +
			"Version: " + "v" + scr_get_build_date() + "\n" +
			"Timestamp: " + save_date + "\n\n" +
			"Message: " + ex.message + "\n\n" +
			"Long Message: " + ex.longMessage + "\n" +
			"Script: " + ex.script + "\n";
		
		if (line_number != -1)
		{
			ini_write_real("Crash", "Line", line_number);
			crash_details += "Line: " + string(line_number) + "\n\n";
		}
		ini_write_string("Crash", "StackTrace", string(ex.stacktrace));
		ini_write_string("Crash", "Documentation", doc_details);
		ini_write_string("Crash", "CrashLogFile", string_replace(game_save_id, environment_get_variable("USERNAME"), "*") +
			"crash_logs/" + string(crash_log_filename));
		
		crash_details += "Stack Trace: " + string(ex.stacktrace) + "\n\n";
		crash_details += doc_details + "\n";
		#endregion /* [Crash] section END */
		
		/* [Debug] and additional sections via 'scr write debug info' */
		scr_write_debug_info();
		
		ini_close();
		switch_save_data_commit();
		#endregion /* Write Crash Details and Debug Info to INI File END */
		
		#region /* Output Crash Details and Notify User */
		show_debug_message("--------------------------------------------------------------");
		show_debug_message("Crash occurred! Details written to: " + crash_logs_folder + crash_log_filename);
		show_debug_message("");
		show_debug_message(string(crash_details));
		show_debug_message("--------------------------------------------------------------");
		show_message(
			"Sorry, the game has crashed. Please check the crash log for more details:\n" +
			string_replace(game_save_id, environment_get_variable("USERNAME"), "*") +
			"crash_logs/" + crash_log_filename + "\n\n" +
			string(crash_details)
		);
		#endregion /* Output Crash Details and Notify User END */
		
		scr_save_crash_log(crash_logs_folder, crash_log_filename, game_name, save_date); /* Send Crash Log to Server */
		
		#region /* Ask to Open URLs */
		if (array_length(urls_to_open) > 0)
		{
			if (global.auto_open_crash_docs)
			{
				for (var i = 0; i < array_length(urls_to_open); i++)
				{
					url_open(urls_to_open[i]);
				}
			}
			else
			if (show_question("Open relevant documentation links in your browser?"))
			{
				for (var i = 0; i < array_length(urls_to_open); i++)
				{
					url_open(urls_to_open[i]);
				}
			}
		}
		#endregion /* Ask to Open URLs END */
		
	});
}