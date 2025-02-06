function scr_crash_error_handling()
{
	/* Crash Error Handling should run in every room of the game */
	exception_unhandled_handler(function(ex)
	{
		
		#region /* Define Crash Logs Folder and File */
		/* Create a folder to store crash logs if it doesn't already exist */
		var crash_logs_folder = game_save_id + "crash_logs/";
		if (!directory_exists(crash_logs_folder))
		{
			directory_create(crash_logs_folder);
		}
		
		/* Use the current date and time to generate a unique filename for each crash log */
		var save_date = string_replace_all(date_datetime_string(date_current_datetime()), ":", "_");
		save_date = string_replace_all(save_date, "/", "_");
		var crash_log_filename = crash_logs_folder + string(global.game_name) + "_" + save_date + "_crash.txt";
		#endregion /* Define Crash Logs Folder and File END */
		
		#region /* Extract Line Number from Error Message */
		/* Attempt to extract the line number from the error message */
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
		/* Retrieve relevant documentation and debugging advice */
		var docs_and_urls = scr_get_relevant_docs(string(ex.stacktrace), ex.longMessage);
		var doc_details = docs_and_urls[0]; /* Relevant documentation and advice details */
		var urls_to_open = docs_and_urls[1]; /* URLs to open in the browser */
		#endregion /* Get Documentation Links and Advice END */
		
		#region /* Generate Unified Crash Details */
		/* Create a detailed and unified crash log message for consistency across outputs */
		var crash_details = 
			"Game: " + string(global.game_name) + "\n" +
			"Timestamp: " + date_datetime_string(date_current_datetime()) + "\n\n" +
			"Message: " + ex.message + "\n\n" +
			"Long Message: " + ex.longMessage + "\n" +
			"Script: " + ex.script + "\n";
		
		if (line_number != -1) 
		{
			crash_details += "Line: " + string(line_number) + "\n\n";
		}
		
		crash_details += "Stack Trace: " + string(ex.stacktrace) + "\n\n";
		crash_details += doc_details + "\n";
		crash_details += "Crash Log File: " + string_replace(game_save_id, environment_get_variable("USERNAME"), "*") + "crash_logs/" + string(global.game_name) + "_" + save_date + "_crash.txt";
		#endregion /* Generate Unified Crash Details END */
		
		#region /* Write Crash Details to File */
		/* Save the crash details to a log file for debugging purposes */
		var _f = file_text_open_write(crash_log_filename);
		file_text_write_string(_f, crash_details);
		file_text_close(_f);
		#endregion /* Write Crash Details to File END */
		
		#region /* Output Crash Details to Debug Console */
		/* Print the crash details to the debug console for developers to see immediately */
		show_debug_message("--------------------------------------------------------------");
		show_debug_message(crash_details);
		show_debug_message("--------------------------------------------------------------");
		#endregion /* Output Crash Details to Debug Console END */
		
		#region /* Show Error Message to Players */
		/* Display a detailed error message to players, including where to find the crash log */
		show_message(
			"Sorry, the game has crashed. Please check the crash log for more details:\n" +
			string_replace(game_save_id, environment_get_variable("USERNAME"), "*") + "crash_logs/" + string(global.game_name) + "_" + save_date + "_crash.txt\n\n" +
			crash_details
		);
		#endregion /* Show Error Message to Players END */
		
		#region /* Ask to Open URLs */
		/* Prompt to open relevant documentation links, if available */
		if (array_length(urls_to_open) > 0)
		{
			if (global.open_crash_docs) /* Automatically open if enabled through global toggle */
			{
				for (var i = 0; i < array_length(urls_to_open); i++)
				{
					url_open(urls_to_open[i]);
				}
			}
			else
			if (show_question("Open relevant documentation links in your browser?")) /* Prompt */
			{
				for (var i = 0; i < array_length(urls_to_open); i++)
				{
					url_open(urls_to_open[i]);
				}
			}
		}
		#endregion /* Ask to Open URLs END */
		
		/* Return a specific exit code for debugging or automated systems to detect the crash */
		return 1;
	});
}