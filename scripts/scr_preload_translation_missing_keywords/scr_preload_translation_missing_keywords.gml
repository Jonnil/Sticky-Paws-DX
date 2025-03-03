/* Pre-load existing keywords from .txt file into cache */
/* Call this in the Create Event at the start of the game to initialize the cache with persistent data */

function preload_translation_missing_keywords()
{
	/* Initialize the cache. This cache keeps track of already logged translation keywords to prevent duplicates */
	global.translation_missing_keywords_cache = ds_map_create();
	var file_path = game_save_id + "translation_missing_keywords.txt";
	
	if (file_exists(file_path))
	{
		var file = file_text_open_read(file_path);
		
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
		show_debug_message("No existing translation_missing_keywords.txt file found.");
	}
}