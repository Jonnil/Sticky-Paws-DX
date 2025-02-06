function scr_set_default_language()
{
	if (file_exists("localization.csv"))
	{
		var default_language_name = "English";
		var switch_languages = switch_language_get_desired_language();
		var num_languages = ds_grid_width(global.language_local_data);
		
		/* Default to the starting language column, the first valid language, in case "English" isn't found */
		var default_language = global.language_column_start;
		
		/* Find the actual index of "English" */
		for (var i = global.language_column_start; i < num_languages; i ++)
		{
			if (global.language_local_data[# i, 0] == string(default_language_name))
			{
				default_language = i; /* Set to the actual index of "English" if found */
				break;
			}
		}
		
		/* Set the correct selected language ID */
		for (var i = 1; i < num_languages; i ++)
		{
			if ((os_get_language() == "en" || switch_languages == "en-US") && (global.language_local_data[# i, 0] == string(default_language_name))
			|| (os_get_language() == "ja" || switch_languages == "ja") && (global.language_local_data[# i, 0] == "日本語 (Japanese)")
			|| (os_get_language() == "pl" || switch_languages == "pl") && (global.language_local_data[# i, 0] == "Polski (Polish)")
			|| (os_get_language() == "es" || switch_languages == "es") && (global.language_local_data[# i, 0] == "Español (Spanish)")
			|| (os_get_language() == "sv" || switch_languages == "sv") && (global.language_local_data[# i, 0] == "Svenska (Swedish)"))
			{
				global.selected_language_id = i; /* Set to the corresponding language ID */
				break;
			}
			else
			{
				global.selected_language_id = default_language; /* Default to English or the first language */
			}
		}
		
		/* Get only the sorted position for highlighting */
		global.current_language_menu_position = scr_get_sorted_language_position(global.selected_language_id);
	}
}