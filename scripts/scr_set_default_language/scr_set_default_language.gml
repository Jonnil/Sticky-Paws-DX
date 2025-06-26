/// @function scr_set_default_language(force_default_language)
/// @description Ensures that the selected language ID is within valid bounds.
/// If the language data isn’t loaded (or if the selected language ID is invalid),
/// this function reinitializes the translations and then sets a default language.
function scr_set_default_language(force_default_language = false)
{
	/* If no translation data is loaded, try to initialize it */
	if (global.language_local_data == 0)
	{
		if (global.translation_debug)
		{
			show_debug_message("[scr_set_default_language] No language data found. Reinitializing...");
		}
		
		scr_initialize_translations();
		
		if (global.language_local_data == 0)
		{
			show_debug_message("[scr_set_default_language] ERROR: Unable to load language data.\n");
			return;
		}
	}
	
	/* Get the number of language columns from the DS grid */
	var grid_width = ds_grid_width(global.language_local_data);
	
	/* Check if the currently selected language ID is out of bounds */
	if (global.selected_language_id >= grid_width
	|| global.selected_language_id < 2)
	|| (force_default_language)
	{
		/* Default to "English" if possible; otherwise, fall back to the first valid language */
		var default_language_name = "English";
		var default_language = global.language_column_start; /* Languages start at this column index */
		
		for (var i = global.language_column_start; i < grid_width; i++)
		{
			if (global.language_local_data[# i, 0] == string(default_language_name))
			{
				default_language = i;
				break;
			}
		}
		
		global.selected_language_id = max(default_language, 2);
		
		if (global.translation_debug)
		{
			show_debug_message("[scr_set_default_language] Invalid selected_language_id. Reset to column: " + string(default_language));
		}
	}
	
	/* Update the current menu position for highlighting */
	global.current_language_menu_position = scr_get_sorted_language_position(global.selected_language_id);
	
	if (global.translation_debug)
	{
		show_debug_message("[scr_set_default_language] Current language set to column: " + string(global.selected_language_id) + "\n");
	}
}