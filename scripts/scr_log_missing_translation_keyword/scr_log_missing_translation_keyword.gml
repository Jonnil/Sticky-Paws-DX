#region /* Script: scr_log_missing_translation_keyword */
/* Handles logging of missing translation keywords locally and enqueues them for bulk server upload */

function scr_log_missing_translation_keyword(log_translation_key = "")
{
	
	#region /* Check Cache */
	if (log_translation_key != ""
	&& !ds_map_exists(global.missing_translation_cache, log_translation_key))
	{
		
		#region /* Validate Input */
		if (log_translation_key == "" || log_translation_key == undefined)
		{
			show_debug_message("[TranslationSync] Error: Invalid log_translation_key provided. Key is: " + string(log_translation_key));
			return;
		}
		#endregion /* Validate Input END */
		
		#region /* Log Missing Keyword Locally for CSV */
		var year   = string(current_year);
		var month  = string(current_month); if (current_month < 10) month = "0" + month;
		var day	= string(current_day);   if (current_day < 10)   day   = "0" + day;
		
		var game_name = string_replace_all(global.game_name, " ", "_");
		var save_date = year + "-" + month + "-" + day;
		
		var translation_missing_keywords_filename
			= "translation_missing_keywords-" + string(game_name)
			+ "_v" + string(scr_get_build_date())
			+ "_" + save_date + ".txt";
		
		var translation_missing_keywords_file_path
			= game_save_id + "translation_missing_keywords/"
			+ translation_missing_keywords_filename;
		
		var file = file_text_open_append(translation_missing_keywords_file_path);
		if (file != -1)
		{
			/* Build "YYYY-MM-DD hh:mm:ss" */
			var hour   = string(current_hour);   if (current_hour < 10)   hour   = "0" + hour;
			var minute = string(current_minute); if (current_minute < 10) minute = "0" + minute;
			var second = string(current_second); if (current_second < 10) second = "0" + second;
			
			var formatted_time = year + "-" + month + "-" + day
								 + " " + hour + ":" + minute + ":" + second;
			
			/* CSV-safe */
			var safe_keyword   = "\"" + string_replace_all(log_translation_key, "\"", "\"\"") + "\"";
			var safe_timestamp = "\"" + formatted_time + "\"";
			
			var log_entry = safe_keyword + "," + safe_timestamp;
			file_text_write_string(file, log_entry);
			file_text_writeln(file);
			file_text_close(file);
		}
		else
		{
			show_debug_message("[TranslationSync] Error: Unable to open file for logging: "
				+ translation_missing_keywords_file_path);
		}
		#endregion /* Log Missing Keyword Locally for CSV END */
		
		#region /* Enqueue Key for Bulk Upload (Removed immediate request) */
		if (!variable_global_exists("missing_translation_queue"))
		{
			/* Safety check: if queue wasn't initialized, create it now */
			global.missing_translation_queue = ds_list_create();
		}
		
		ds_list_add(global.missing_translation_queue, log_translation_key);
		show_debug_message("[TranslationSync] Queued missing translation key: " + log_translation_key);
		#endregion /* Enqueue Key for Bulk Upload END */
		
		/* Mark in cache to avoid duplicates */
		ds_map_add(global.missing_translation_cache, log_translation_key, true);
	}
	#endregion /* Check Cache END */
	
}
#endregion /* Script: scr_log_missing_translation_keyword END */