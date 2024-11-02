function scr_set_default_language()
{
	if (file_exists("localization.csv"))
	{
		var switch_languages = switch_language_get_desired_language();
		var num_languages = ds_grid_width(global.language_local_data);
		var default_language = 0; /* Default language index (English) */
		
		for (i = 1; i < num_languages; i++;)
		{
			if (os_get_language() == "en"
			|| switch_languages == "en-US")
			&& (global.language_local_data[# i + 1, 0] == "English")
			|| (os_get_language() == "ja"
			|| switch_languages == "ja")
			&& (global.language_local_data[# i + 1, 0] == "日本語 (Japanese)")
			|| (os_get_language() == "pl"
			|| switch_languages == "pl")
			&& (global.language_local_data[# i + 1, 0] == "Polski (Polish)")
			|| (os_get_language() == "es"
			|| switch_languages == "es")
			&& (global.language_local_data[# i + 1, 0] == "Español (Spanish)")
			|| (os_get_language() == "sv"
			|| switch_languages == "sv")
			&& (global.language_local_data[# i + 1, 0] == "Svenska (Swedish)")
			{
				global.language_localization = i;
				break;
			}
			else
			{
				global.language_localization = default_language; /* Set the default language to 0 (English) if no language is recognized */
			}
		}
	}
}