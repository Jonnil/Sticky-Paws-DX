depth = -40;
drag_object = false;
drag_release_timer = 0;
image_speed = 0.25;

if (global.character_select_in_this_menu == "main_game")
&& (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
|| (global.character_select_in_this_menu == "level_editor")
&& (file_exists(global.use_temp_or_working + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(global.use_temp_or_working + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini");
	}

	if (ini_key_exists("info", "level_player3_start_x"))
	{
		x = ini_read_real("info", "level_player3_start_x", 0);
	}
	if (ini_key_exists("info", "level_player3_start_y"))
	{
		y = ini_read_real("info", "level_player3_start_y", 0);
	}
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
