function set_pause_button_y_positions()
{
	
	#region /* Set pause button y positions */
	continue_y = display_get_gui_height() * 0.5 - 84;
	change_character_y = continue_y + 42;
	if (global.character_select_in_this_menu == "level_editor")
	&& (!file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
	&& (ds_list_size(global.all_loaded_custom_levels) - 1 < global.max_custom_levels) /* Don't let player download levels if they have reached the max amount of levels stored */
	|| (global.character_select_in_this_menu == "level_editor")
	&& (file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
	{
		edit_level_y = change_character_y + 42;
		option_y = edit_level_y + 42;
	}
	else
	{
		edit_level_y = -999;
		option_y = change_character_y + 42;
	}
	if (room == rm_leveleditor)
	|| (global.pause_room == rm_leveleditor)
	{
		restart_y = option_y + 42;
		quit_y = restart_y + 42;
	}
	else
	{
		restart_y = -999;
		quit_y = option_y + 42;
	}
	#endregion /* Set pause button y positions END */
	
}