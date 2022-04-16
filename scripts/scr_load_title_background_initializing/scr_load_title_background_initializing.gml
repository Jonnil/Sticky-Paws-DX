function scr_load_title_background_initializing()
{
	ds_list_clear(global.all_loaded_title_backgrounds);
	ds_list_add(global.all_loaded_title_backgrounds, "title_background0.png", "title_background1.png");
	
	first_title_background = string(file_find_first(working_directory + "custom_title_backgrounds/*", 0))
	if (file_exists(working_directory + "custom_title_backgrounds/" + first_title_background))
	{
		ds_list_add(global.all_loaded_title_backgrounds, first_title_background);
	}
}