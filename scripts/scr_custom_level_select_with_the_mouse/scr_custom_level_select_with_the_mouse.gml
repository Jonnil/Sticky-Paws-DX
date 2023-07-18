function scr_custom_level_select_with_the_mouse()
{
	if (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	{
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		
		/* Don't set the "row" or "thumbnail_x_offset" variables in here, those variables are set in "scr select custom level menu" */
		column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(global.all_loaded_custom_levels)))
		if (open_sub_menu == false)
		&& (can_input_level_name == false)
		&& (can_navigate)
		&& (file_load_timer == 0) /* You should not be able to navigate the custom level select if it's still loading the levels */
		{
			for(i = 0;
			i < ds_list_size(global.thumbnail_sprite);
			i += 1)
			{
				column = floor(i / row);
				if (point_in_rectangle(mouse_get_x, mouse_get_y, 394 * (i - column * row) + 100 - 3 + thumbnail_x_offset, 226 * (column - scroll) + 250 - 3, 394 * (i - column * row) + 100 + 384 + 3 + thumbnail_x_offset, 226 * (column - scroll) + 250 + 216 + 3))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					if (menu != "level_editor_play")
					&& (menu_delay == 0)
					{
						menu = "level_editor_play";
					}
					global.select_level_index = i;
				}
			}
		}
	}
}