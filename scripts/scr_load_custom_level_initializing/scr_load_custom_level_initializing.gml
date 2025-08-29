function scr_load_custom_level_initializing()
{
	ds_list_clear(global.all_loaded_custom_levels);
	ds_list_add(global.all_loaded_custom_levels, "Create_Level");
	scr_clear_thumbnail_sprites(); show_debug_message("[scr_load_custom_level_initializing] 'ds list clear(global thumbnail sprite)' Need to clear thumbnails so we can load custom levels all over again");
	ds_list_add(global.thumbnail_sprite, spr_menu_create_custom_level);
	first_level = string(file_find_first(game_save_id + "custom_levels/*", fa_directory))

	if (file_exists(game_save_id + "custom_levels/" + first_level + "/data/level_information.ini"))
	{

		#region /* Update Thumbnail */
		/* PNG Custom Thumbnail */
		if (file_exists(game_save_id + "custom_levels/" + first_level + "/thumbnail.png"))
		{
			ds_list_add(global.thumbnail_sprite, sprite_add(game_save_id + "custom_levels/" + first_level + "/thumbnail.png", 0, false, false, 0, 0));
			ds_list_add(global.all_loaded_custom_levels, first_level);
		}
		else
		/* PNG Automatic Thumbnail */
		if (file_exists(game_save_id + "custom_levels/" + first_level + "/automatic_thumbnail.png"))
		{
			ds_list_add(global.thumbnail_sprite, sprite_add(game_save_id + "custom_levels/" + first_level + "/automatic_thumbnail.png", 0, false, false, 0, 0));
			ds_list_add(global.all_loaded_custom_levels, first_level);
		}
		#endregion /* Update Thumbnail END */

	}
}
