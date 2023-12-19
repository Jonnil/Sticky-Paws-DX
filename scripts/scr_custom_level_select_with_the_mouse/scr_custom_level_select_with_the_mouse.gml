function scr_custom_level_select_with_the_mouse(all_loaded_what = global.all_loaded_custom_levels)
{
	if (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "load_custom_level")
	{
		
		/* Don't set the "row" or "thumbnail_x_offset" variables in here, those variables are set in "scr select custom level menu" */
		column = clamp(floor(global.select_level_index / row), 0, floor(ds_list_size(all_loaded_what)))
		if (!open_sub_menu)
		&& (!open_upload_menu)
		&& (!can_input_level_name)
		&& (can_navigate)
		&& (file_load_timer == 0) /* You should not be able to navigate the custom level select if it's still loading the levels */
		{
			for(i = 0;
			i < ds_list_size(global.thumbnail_sprite);
			i += 1)
			{
				column = floor(i / row);
				if (!hovering_over_level_editor_corner_menu)
				&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 394 * (i - column * row) + 100 - 3 + thumbnail_x_offset, 226 * (column - scroll) + 250 - 3, 394 * (i - column * row) + 100 + 384 + 3 + thumbnail_x_offset, 226 * (column - scroll) + 466 + 3))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					if (room == rm_title)
					&& (menu != "level_editor_play")
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = "level_editor_play";
					}
					else
					if (room == rm_leveleditor)
					if (menu != "choose_official_level_to_take_from")
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu = "choose_official_level_to_take_from";
					}
					global.select_level_index = i;
				}
			}
		}
	}
}