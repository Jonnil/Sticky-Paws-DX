function scr_load_title_logo_initializing()
{
	ds_list_clear(global.all_loaded_title_logos);
	ds_list_add(global.all_loaded_title_logos, "title_logo_english.png", "title_logo_japanese.png", "title_logo_japanese_old_style.png", "title_logo_old.png");
	
	first_title_logo = string(file_find_first(working_directory + "custom_title_logos/* ", fa_directory))
	if (file_exists(working_directory + "custom_title_logos/" + first_title_logo))
	{
		ds_list_add(global.all_loaded_title_logos, first_title_logo);
	}
}