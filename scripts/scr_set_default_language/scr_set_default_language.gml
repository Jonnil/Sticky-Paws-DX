function scr_set_default_language()
{
	for (i = 1; i < ds_grid_width(global.language_local_data); i++;)
	{
		if (os_get_language() = "en")
		and (global.language_local_data[# 1, 0] == "English")
		{
			global.language_localization = i;
			break;
		}
		else
		if (os_get_language() = "ja")
		and (global.language_local_data[# 1, 0] == "日本語")
		{
			global.language_localization = i;
			break;
		}
		else
		if (os_get_language() = "sv")
		and (global.language_local_data[# 1, 0] == "Svenska")
		{
			global.language_localization = i;
			break;
		}
		else
		{
			global.language_localization = 0; /*Set the default language to 0 if no language is recognized*/
		}
	}
}