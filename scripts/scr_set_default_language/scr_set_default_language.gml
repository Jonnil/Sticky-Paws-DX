function scr_set_default_language()
{
	if (file_exists("localization.csv"))
	{
		for (i = 1; i < ds_grid_width(global.language_local_data); i++;)
		{
			if (os_get_language() == "en")
			&& (global.language_local_data[# i + 1, 0] == "English")
			{
				global.language_localization = i;
				break;
			}
			else
			if (os_get_language() == "ja")
			&& (global.language_local_data[# i + 1, 0] == "日本語")
			{
				global.language_localization = i;
				break;
			}
			else
			if (os_get_language() == "pl")
			&& (global.language_local_data[# i + 1, 0] == "Polski")
			{
				global.language_localization = i;
				break;
			}
			else
			if (os_get_language() == "es")
			&& (global.language_local_data[# i + 1, 0] == "Español")
			{
				global.language_localization = i;
				break;
			}
			else
			if (os_get_language() == "sv")
			&& (global.language_local_data[# i + 1, 0] == "Svenska")
			{
				global.language_localization = i;
				break;
			}
			else
			{
				global.language_localization = 0; /* Set the default language to 0 if no language is recognized */
			}
		}
	}
	calculate_translation_completion();
}