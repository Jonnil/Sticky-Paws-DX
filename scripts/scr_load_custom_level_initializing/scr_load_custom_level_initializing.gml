function scr_load_custom_level_initializing()
{
	ds_list_clear(global.all_loaded_custom_levels);
	ds_list_add(global.all_loaded_custom_levels, "Create_Level");
	ds_list_clear(global.thumbnail_sprite);
	ds_list_add(global.thumbnail_sprite, spr_menu_create_custom_level);
	
	first_level = string(file_find_first(working_directory+"/custom_levels/*", fa_directory))
	if (directory_exists(working_directory+"/custom_levels/"+first_level))
	{
		if (file_exists(working_directory+"/custom_levels/"+first_level+"/automatic_thumbnail.png"))
		{
			ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/custom_levels/"+first_level+"/automatic_thumbnail.png", 0, false, true, 0, 0));
		}
		else
		{
			ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing);
		}
		ds_list_add(global.all_loaded_custom_levels, first_level)
	}
}