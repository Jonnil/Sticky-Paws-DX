/// @function calculate_translation_completion()
/// @description Calculates the completion percentage for each language column
/// in the translation grid. If the grid is missing or invalid, it attempts to reinitialize it.
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