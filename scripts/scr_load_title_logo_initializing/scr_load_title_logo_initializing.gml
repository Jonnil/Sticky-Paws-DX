function scr_load_title_logo_initializing()
{
	ds_list_clear(global.all_loaded_title_logo);
	ds_list_add(global.all_loaded_title_logo,
	"title_logo_english.png",
	"title_logo_japanese.png",
	"title_logo_japanese_old_style.png",
	"title_logo_old.png",
	"title_logo_christmas_english.png");
	
	first_title_logo = string(file_find_first(game_save_id + "custom_title_logo/*", fa_directory))
	if (file_exists(game_save_id + "custom_title_logo/" + first_title_logo))
	{
		ds_list_add(global.all_loaded_title_logo, first_title_logo);
	}
}