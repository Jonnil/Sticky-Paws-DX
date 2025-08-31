/// @function scr_process_language_file(lang_name, file_data)
/// @description Saves the CSV data for a language pack to disk,
/// then parses it so the game can actually use the new translations.
function scr_process_language_file(lang_name, file_data)
{
	/* 1) Create the language_packs folder if it doesn't exist */
	var folder_path = game_save_id + "language_packs/";

	if (!directory_exists(folder_path))
	{
		directory_create(folder_path);
	}

	/* 2) Construct a file path based on lang_name (e.g. "all.txt") */
	var file_path = folder_path + lang_name + ".txt";

	/* 3) Write the CSV data to disk */
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

	/* 4) (Optional) Debug parse of CSV lines */
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

	/* 5) Re-parse the saved file with scr_language_load_csv_into_memory */
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
		
	// Fennex note- calling global scripts as functions is deprecated. moved calculate_translation_completion here
	function calculate_translation_completion()
	{
		/* If the CSV grid isn't loaded, try to load it */
		if (global.language_local_data == 0)
		{
			show_debug_message("[calculate_translation_completion] language_local_data not loaded. Reinitializing...");
			scr_initialize_translations();

			if (global.language_local_data == 0)
			{
				show_debug_message("[calculate_translation_completion] ERROR: Failed to load language_local_data.");
				return;
			}
		}

		var grid_width = ds_grid_width(global.language_local_data);
		var grid_height = ds_grid_height(global.language_local_data);

		/* Ensure the grid has a valid size (e.g., at least one language column and at least 2 rows: headers + one entry) */
		if (grid_width <= global.language_column_start || grid_height < 2)
		{
			show_debug_message("[calculate_translation_completion] ERROR: Invalid language_local_data grid dimensions.");
			return;
		}

		/* Loop over each language column (starting at language_column_start) */
		for (var language_id = global.language_column_start; language_id < grid_width; language_id++)
		{
			var empty_count = 0;
			/* Loop through each translation entry, skip the header row at index 0 */
			for (var row_index = 1; row_index < grid_height; row_index++)
			{
				if (global.language_local_data[# language_id, row_index] == "")
				{
					empty_count++;
				}
			}
			/* Calculate completion percentage: */
			/* ((Total rows - Empty rows) / Total rows) * 100 */
			global.language_completion[language_id] = ((grid_height - empty_count) / grid_height) * 100;
		}

		scr_get_valid_languages();
	}
			//calculate_translation_completion();
		}
	}
