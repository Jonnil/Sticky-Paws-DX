function scr_custom_level_select_with_the_mouse()
{
	/* Don't set the "row" or "thumbnail_x_offset" variables in here, those variables are set in scr_select_custom_level_menu */
	column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_custom_levels)))
	if (global.controls_used_for_menu_navigation == "mouse")
	and (open_sub_menu == false)
	and (can_input_level_name == false)
	and (can_navigate == true)
	{
		for(i = 0;
		i < ds_list_size(global.thumbnail_sprite);
		i += 1)
		{
			column = floor(i / row);
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 394 * (i - column * row) + 100 - 3 + thumbnail_x_offset, 226 * (column - scroll) + 250 - 3, 394 * (i - column * row) + 100 + 384 + 3 + thumbnail_x_offset, 226 * (column - scroll) + 250 + 216 + 3))
			{
				if (menu != "level_editor_play")
				and (menu_delay == 0)
				{
					menu = "level_editor_play";
				}
				global.select_level_index = i;
			}
		}
	}
}