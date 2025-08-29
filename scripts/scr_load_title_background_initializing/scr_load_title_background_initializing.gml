function scr_load_title_background_initializing()
{
	ds_list_clear(global.all_loaded_title_backgrounds);
	ds_list_add(global.all_loaded_title_backgrounds, "title_background0.png", "title_background1.png");

	first_title_background = string(file_find_first(game_save_id + "custom_title_background/*", fa_directory))
	if (file_exists(game_save_id + "custom_title_background/" + first_title_background))
	{
		ds_list_add(global.all_loaded_title_backgrounds, first_title_background);
	}
}
