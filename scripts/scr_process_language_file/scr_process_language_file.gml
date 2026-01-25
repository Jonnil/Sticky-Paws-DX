/// @function scr_process_language_file(lang_name, file_data)
/// @description Saves the CSV data for a language pack to disk,
/// then parses it so the game can actually use the new translations.
function scr_process_language_file(lang_name, file_data)
{
	/* Create the language_packs folder if it doesn't exist */
	var folder_path = game_save_id + "language_packs/";

	if (!directory_exists(folder_path))
	{
		directory_create(folder_path);
	}

	/* Construct a file path based on lang_name (e.g. "all.txt") */
	var file_path = folder_path + lang_name + ".txt";

	/* Write the CSV data to disk */
	var file_id = file_text_open_write(file_path);

	if (file_id != -1)
	{
		file_text_write_string(file_id, file_data);
		file_text_close(file_id);
		show_debug_message("[scr_process_language_file] Language pack for \"" + lang_name + "\" saved to " + file_path);
	}
	else
	{
		show_debug_message("[scr_process_language_file] Error: cannot open " + file_path + " for writing\n");
		return;
	}

	/* (Optional) Debug parse of CSV lines */
	var lines = string_split(file_data, "\n");

	if (array_length(lines) > 0)
	{
		show_debug_message("[scr_process_language_file] Found " + string(array_length(lines)) + " lines in CSV.");

		if (global.translation_debug)
		{
			for (var i = 0; i < array_length(lines); i++)
			{
				var this_line = string_trim(lines[i]);

				if (this_line == "")
				{
					continue; /* skip empty lines */
				}

				var columns = string_split(this_line, ",");

				if (array_length(columns) > 1)
				{
					show_debug_message("[scr_process_language_file] Line " + string(i) + ": code=" + columns[0] + " text=" + columns[1]);
				}
			}
		}
	}

	/* Re-parse the saved file with scr_language_load_csv_into_memory */
	var translations_map = scr_language_load_csv_into_memory(file_path);

	if (translations_map != -1)
	{
		global.translations = translations_map;

		/* Only call scr_set_default_language if the current selected language is out of bounds */
		var grid_width = ds_grid_width(global.language_local_data);

		if (global.selected_language_id >= grid_width
		|| global.selected_language_id < 2)
		{
			scr_set_default_language(false);
		}
		else
		{
			show_debug_message("[scr_process_language_file] Selected language ID is still valid (" + string(global.selected_language_id) + ").\n");
		}

		/* Re-calculate the translation completion after you have finished downloading the new language pack */
		scr_initialize_translations();
		scr_calculate_translation_completion();
	}
}