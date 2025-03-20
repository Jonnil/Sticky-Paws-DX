function preload_translation_missing_keywords()
{
	// Check a flag to disable file logging (e.g., on Nintendo Switch)
	if (global.enable_translation_file_logging)
	{
		/* Initialize Missing Translation Queue and Cache */
		global.missing_translation_queue = ds_list_create();
		global.missing_translation_cache = ds_map_create();
		
		/* Define the folder and file pattern */
		var folder_path = game_save_id + "translation_missing_keywords/";
		var pattern = "translation_missing_keywords-*.txt";
		
		var latest_file = "";
		var latest_date = "";
		
		/* Use file_find_first with attribute 0 (fa_none) */
		var file_name = file_find_first(folder_path + pattern, 0);
		while (file_name != "")
		{
			/* Expecting filenames like: */
			/* "translation_missing_keywords-{game_name}_v{build_date}_{YYYY-MM-DD}.txt" */
			/* Use string_last_pos() to find the position of the last underscore */
			var last_underscore = string_last_pos("_", file_name);
			
			/* Find the position of ".txt" (we assume it exists) */
			var dot_index = string_pos(".txt", file_name);
			if (dot_index == 0)
			{
				dot_index = string_length(file_name) + 1;
			}
			
			/* Extract the date substring from after the last underscore until before ".txt" */
			var date_str = string_copy(file_name, last_underscore + 1, dot_index - last_underscore - 1);
			
			/* Compare lexicographically; since the format is YYYY-MM-DD, higher string is later */
			if (date_str > latest_date)
			{
				latest_date = date_str;
				latest_file = file_name;
			}
			
			file_name = file_find_next();
		}
		file_find_close();
		
		/* If a file was found, load its contents into the cache */
		if (latest_file != "")
		{
			var translation_missing_keywords_file_path = folder_path + latest_file;
			if (file_exists(translation_missing_keywords_file_path))
			{
				var file = file_text_open_read(translation_missing_keywords_file_path);
				while (!file_text_eof(file))
				{
					var line = file_text_readln(file);
					var fields = string_split(line, ",");
					if (array_length(fields) > 0)
					{
						var keyword = string_replace_all(fields[0], "\"", "");
						ds_map_add(global.missing_translation_cache, keyword, true);
					}
				}
				file_text_close(file);
				show_debug_message("Preloaded existing keywords into cache from " + latest_file);
			}
			else
			{
				show_debug_message("No existing file found at " + translation_missing_keywords_file_path);
			}
		}
		else
		{
			show_debug_message("No translation missing keywords files found with pattern: " + pattern);
		}
	}
}