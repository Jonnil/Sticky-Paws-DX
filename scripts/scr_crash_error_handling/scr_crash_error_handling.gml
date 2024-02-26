function scr_crash_error_handling()
{
	exception_unhandled_handler(function(ex)
	{
		/* Print some messages to the output log */
		show_debug_message( "--------------------------------------------------------------");
		show_debug_message( "Unhandled exception " + string(ex) );
		show_debug_message( "--------------------------------------------------------------");
		
		/* Write the exception struct to a file */
		var save_date = string_replace_all(date_datetime_string(date_current_datetime()), ":", "_");
		var save_date = string_replace_all(save_date, "/", "_");
		var _f = file_text_open_write(game_save_id + "crash_logs/" + string(save_date) + "_crash.txt");
		file_text_write_string(_f, date_datetime_string(date_current_datetime()) + "\n\n" + string(ex));
		file_text_close(_f); switch_save_data_commit(); /* Remember to commit the save data! */
		
		/* Show the error message (for debug purposes only) */
		show_message("Sorry, the game has crashed. Go here to view crash log: " + string_replace(game_save_id, environment_get_variable("USERNAME"), "*") + "crash_logs/" + string(save_date) + "_crash.txt" +
					"\n\n" +
					date_datetime_string(date_current_datetime()) +
					"\n\n" +
					ex.longMessage);
		
		return 0;
	});
}