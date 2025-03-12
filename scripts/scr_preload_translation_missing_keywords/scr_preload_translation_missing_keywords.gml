/* Pre-load existing keywords from .txt file into cache */
/* Call this in the Create Event at the start of the game to initialize the cache with persistent data */

function preload_translation_missing_keywords()
{
	/* Initialize the cache. This cache keeps track of already logged translation keywords to prevent duplicates */
	global.translation_missing_keywords_cache = ds_map_create();
	
	/* Build the timestamp string "YYYY-MM-DD" using built-in date variables for the filename, don't include time, only include date */
	var year   = string(current_year);
	
	var month  = string(current_month);
	if (current_month < 10) month = "0" + month;
	
	var day	= string(current_day);
	if (current_day < 10) day = "0" + day;
	
	var game_name = string_replace_all(global.game_name, " ", "_");
	var save_date = string(year) + "-" + string(month) + "-" + string(day);
	
	var translation_missing_keywords_filename = "translation_missing_keywords-" + string(game_name) + "_v" + string(scr_get_build_date()) + "_" + save_date + ".txt";
	var translation_missing_keywords_file_path = game_save_id + "translation_missing_keywords/" + string(translation_missing_keywords_filename);
	
	if (file_exists(translation_missing_keywords_file_path))
	{
		var file = file_text_open_read(translation_missing_keywords_file_path);
		
		while (!file_text_eof(file))
		{
			var line = file_text_readln(file); /* Move to the next line */
			var fields = string_split(line, ","); /* Split the CSV line by comma */
			if (array_length(fields) > 0)
			{
				var keyword = string_replace_all(fields[0], "\"", ""); /* Remove the surrounding quotes from the keyword field */
				ds_map_add(global.translation_missing_keywords_cache, keyword, true); /* Add to cache */
			}
		}
		
		file_text_close(file);
		
		/* Debug message to confirm preloaded cache */
		show_debug_message("Preloaded existing keywords into cache.");
	}
	else
	{
		/* Debug message to confirm no existing file */
		show_debug_message("No existing " + string(translation_missing_keywords_filename) + " file found.");
	}
}