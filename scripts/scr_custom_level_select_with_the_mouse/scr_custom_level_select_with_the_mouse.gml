function scr_custom_level_select_with_the_mouse()
{
	R = 4;
	C = clamp(floor(global.select_level_index/R), 0, floor(ds_list_size(global.all_loaded_custom_levels)))
	if (global.controls_used_for_menu_navigation = "mouse")
	and (open_sub_menu = false)
	and (can_input_level_name = false)
	and (can_navigate = true)
	{
		for(i = 0;
		i < ds_list_size(global.thumbnail_sprite);
		i += 1)
		{
			C = floor(i / R);
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), 394*(i-C*R) + 100 -3, 226*(C-scroll) + 250 -3, 394*(i-C*R) + 100 + 384+ 3, 226*(C-scroll) + 250 + 216+ 3))
			{
				if (menu != "level_editor_play")
				and (menu_delay = 0)
				{
					menu = "level_editor_play";
				}
				global.select_level_index = i;
			}
		}
	}
}