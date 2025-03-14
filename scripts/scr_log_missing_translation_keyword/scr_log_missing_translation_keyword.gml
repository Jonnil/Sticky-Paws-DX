/// @function scr_log_missing_translation_keyword
/// @description Handles logging of missing translation keywords locally and enqueues them for bulk server upload
function scr_log_missing_translation_keyword(log_translation_key = "")
{
	var verbose_translation_logging = true;
	
	// Only show region messages if verbose logging is enabled.
	
	if (log_translation_key != "" && !ds_map_exists(global.missing_translation_cache, log_translation_key))
	{
		show_debug_message("[scr_log_missing_translation_keyword] Cache Check passed for key: " + string(log_translation_key));
		
		if (verbose_translation_logging)
			show_debug_message("[scr_log_missing_translation_keyword] Entering Validate Input region");
			
		if (log_translation_key == "" || log_translation_key == undefined)
		{
			show_debug_message("[scr_log_missing_translation_keyword] Error: Invalid log_translation_key provided. Key is: " + string(log_translation_key));
			if (verbose_translation_logging)
				show_debug_message("[scr_log_missing_translation_keyword] Exiting Validate Input region with error");
			return;
		}
		show_debug_message("[scr_log_missing_translation_keyword] Valid log_translation_key provided! Key is: " + string(log_translation_key));
		if (verbose_translation_logging)
			show_debug_message("[scr_log_missing_translation_keyword] Validate Input region passed");
		
		if (verbose_translation_logging)
			show_debug_message("[scr_log_missing_translation_keyword] Entering Log Missing Keyword Locally region");
		
		var year   = string(current_year);
		var month  = string(current_month);
		if (current_month < 10) month = "0" + month;
		var day	= string(current_day);
		if (current_day < 10) day = "0" + day;
		show_debug_message("[scr_log_missing_translation_keyword] Date formatted as: " + year + "-" + month + "-" + day);
		
		var game_name = string_replace_all(global.game_name, " ", "_");
		var save_date = year + "-" + month + "-" + day;
		var translation_missing_keywords_filename =
			"translation_missing_keywords-" + string(game_name)
			+ "_v" + string(scr_get_build_date())
			+ "_" + save_date + ".txt";
		show_debug_message("[scr_log_missing_translation_keyword] Filename constructed: " + translation_missing_keywords_filename);
		
		// Build the directory path
		var dir_path = game_save_id + "translation_missing_keywords/";
		if (!directory_exists(dir_path))
		{
			show_debug_message("[scr_log_missing_translation_keyword] Directory does not exist, creating: " + dir_path);
			directory_create(dir_path);
			if (!directory_exists(dir_path))
			{
				show_debug_message("[scr_log_missing_translation_keyword] ERROR: Directory creation failed: " + dir_path);
				show_debug_message("[scr_log_missing_translation_keyword] Exiting Log Missing Keyword Locally region due to directory error.");
				return;
			}
			else
			{
				show_debug_message("[scr_log_missing_translation_keyword] Directory successfully created: " + dir_path);
			}
		}
		else
		{
			show_debug_message("[scr_log_missing_translation_keyword] Directory already exists: " + dir_path);
		}
		
		var translation_missing_keywords_file_path = dir_path + translation_missing_keywords_filename;
		show_debug_message("[scr_log_missing_translation_keyword] File path constructed: " + translation_missing_keywords_file_path);
		
		var hour   = string(current_hour);   if (current_hour < 10) hour   = "0" + hour;
		var minute = string(current_minute);   if (current_minute < 10) minute = "0" + minute;
		var second = string(current_second);   if (current_second < 10) second = "0" + second;
		var formatted_time = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
		show_debug_message("[scr_log_missing_translation_keyword] Formatted time: " + formatted_time);
		
		var safe_keyword   = "\"" + string_replace_all(log_translation_key, "\"", "\"\"") + "\"";
		var safe_timestamp = "\"" + formatted_time + "\"";
		var log_entry = safe_keyword + "," + safe_timestamp;
		show_debug_message("[scr_log_missing_translation_keyword] Log entry constructed: " + log_entry);
		
		// Check a flag to disable file logging (e.g., on Nintendo Switch)
		if (!global.enable_translation_file_logging)
		{
			show_debug_message("[scr_log_missing_translation_keyword] File logging is disabled for this platform. Skipping file write.");
		}
		else
		{
			try
			{
				var file = file_text_open_append(translation_missing_keywords_file_path);
				if (file == -1)
				{
					show_debug_message("[scr_log_missing_translation_keyword] Unable to open file for logging: " + string(translation_missing_keywords_file_path));
				}
				file_text_write_string(file, log_entry);
				file_text_writeln(file);
				file_text_close(file);
				show_debug_message("[scr_log_missing_translation_keyword] Log entry written and file closed successfully.");
			}
			catch(_exception)
			{
				show_debug_message("[scr_log_missing_translation_keyword] Exception caught while writing file:");
				show_debug_message("  Message: " + _exception.message);
				show_debug_message("  Long Message: " + _exception.longMessage);
				show_debug_message("  Script: " + _exception.script);
				show_debug_message("  Stacktrace: " + string(_exception.stacktrace));
				return;
			}
		}
		
		if (verbose_translation_logging)
			show_debug_message("[scr_log_missing_translation_keyword] Exiting Log Missing Keyword Locally region");
		
		if (verbose_translation_logging)
			show_debug_message("[scr_log_missing_translation_keyword] Entering Enqueue Key for Bulk Upload region");
		
		if (!variable_global_exists("missing_translation_queue"))
		{
			show_debug_message("[scr_log_missing_translation_keyword] missing_translation_queue not found. Creating a new ds_list.");
			global.missing_translation_queue = ds_list_create();
		}
		
		ds_list_add(global.missing_translation_queue, log_translation_key);
		show_debug_message("[scr_log_missing_translation_keyword] Queued missing translation key: " + log_translation_key);
		
		if (verbose_translation_logging)
			show_debug_message("[scr_log_missing_translation_keyword] Exiting Enqueue Key for Bulk Upload region");
		
		ds_map_add(global.missing_translation_cache, log_translation_key, true);
		show_debug_message("[scr_log_missing_translation_keyword] Added key to missing_translation_cache: " + log_translation_key);
	}
}
