function scr_select_custom_level_menu()
{
	ds_list_add(global.all_loaded_custom_levels, "Level1")
	
	#region /*Draw Thumbnail*/
	if (ds_list_size(global.all_loaded_custom_levels) > 0)
	{
		if (directory_exists(working_directory+"/Custom Levels/"+ds_list_find_value(global.all_loaded_custom_levels, level_index)))
		and(file_exists(working_directory+"/Custom Levels/"+ds_list_find_value(global.all_loaded_custom_levels, level_index)+"/Thumbnail.png"))
		or(directory_exists(working_directory+"/Custom Levels/"+ds_list_find_value(global.all_loaded_custom_levels, level_index)))
		and(file_exists(working_directory+"/Custom Levels/"+ds_list_find_value(global.all_loaded_custom_levels, level_index)+"/Automatic Thumbnail.png"))
		{
			if (global.thumbnail_sprite>noone)
			{
				draw_sprite_ext(global.thumbnail_sprite, 0, window_get_width()/2+250, 0, 0.59, 0.59, 0, c_white, 1);
			}
		}
	}
	#endregion /*Draw Thumbnail END*/
	
}

function scr_check_next_level()
{
	level_index++;
}