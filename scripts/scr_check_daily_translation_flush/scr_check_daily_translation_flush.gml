/// @function scr_check_daily_translation_flush()
/// @description Checks if a day (86400 seconds) has passed since the last flush
/// of missing translation keys. If so, flush the queue and update the timestamp.
function scr_check_daily_translation_flush()
{
	/* If global.last_missing_flush_time hasn't been set yet, try to load it from config.ini */
	if (!variable_global_exists("last_missing_flush_time")
	|| global.last_missing_flush_time == 0)
	{
		ini_open(game_save_id + "save_file/config.ini");
		global.last_missing_flush_time = ini_read_real("translation_sync", "last_flush_time", 0);
		ini_close();
		
		/* If still zero, set to current time and store it */
		if (global.last_missing_flush_time == 0)
		{
			global.last_missing_flush_time = date_current_datetime();
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("translation_sync", "last_flush_time", global.last_missing_flush_time);
			ini_close();
		}
	}
	
	/* Calculate time elapsed in seconds */
	var diff = date_second_span(global.last_missing_flush_time, date_current_datetime());
	
	/* If 24 hours (86400 seconds) have passed and we have keys in the queue, flush them */
	if (diff >= 86400
	&& ds_list_size(global.missing_translation_queue) > 0)
	{
		scr_flush_missing_translation_keywords();
		global.last_missing_flush_time = date_current_datetime();
		ini_open(game_save_id + "save_file/config.ini");
		ini_write_real("translation_sync", "last_flush_time", global.last_missing_flush_time);
		ini_close();
		show_debug_message("[scr_check_daily_translation_flush] Daily flush complete. New flush time: " + string(global.last_missing_flush_time));
	}
}