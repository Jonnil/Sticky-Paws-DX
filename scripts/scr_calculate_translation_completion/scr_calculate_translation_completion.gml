/* Function to calculate the completion percentage of translations for each language */
function calculate_translation_completion()
{
	/* Loop through each language column in the grid, starting from the second column (index 1) */
	for (var language_id = 1; language_id < ds_grid_width(global.language_local_data); language_id++)
	{
		/* Initialize a counter to track the number of empty (untranslated) entries */
		var empty_count = 0;
		
		/* Loop through each row (translation entry) in the current language column, starting from the second row (index 1) */
		for (var row_index = 1; row_index < ds_grid_height(global.language_local_data); row_index++)
		{
			/* Check if the translation entry is empty */
			if (global.language_local_data[# language_id, row_index] == "")
			{
				/* Increment the counter for empty entries */
				empty_count++;
			}
		}
		
		/* Calculate the completion percentage for the current language: */
		/* ((Total rows - Empty rows) / Total rows) * 100 to get the percentage of completed entries */
		global.language_completion[language_id] = 
			(ds_grid_height(global.language_local_data) - empty_count) / ds_grid_height(global.language_local_data) * 100;
	}
	scr_get_valid_languages();
}