#region /* Initialize Foreground */
if (global.character_select_in_this_menu == "main_game")
&& (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

|| (global.character_select_in_this_menu == "level_editor")
&& (file_exists(global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu == "main_game")
	|| (global.create_level_from_template)
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	}

	#region /* Custom Foreground x and y offset points */
	#region /* Custom Foreground 2 y offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_foreground2_y_offset"))
	{
		y_offset = ini_read_real("Custom Backgrounds", "custom_foreground2_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		&& (!global.create_level_from_template)
		{
			ini_write_real("Custom Backgrounds", "custom_foreground2_y_offset", 0);
		}
		y_offset = 0;
	}
	#endregion /* Custom Foreground 2 y offset point END */

	#region /* Custom Foreground 2 x offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_foreground2_x_offset"))
	{
		x_offset = ini_read_real("Custom Backgrounds", "custom_foreground2_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		&& (!global.create_level_from_template)
		{
			ini_write_real("Custom Backgrounds", "custom_foreground2_x_offset", 0);
		}
		x_offset = 0;
	}
	#endregion /* Custom Foreground 2 x offset point END */
	#endregion /* Custom Foreground 2 x and y offset points END */

	#region /* Custom Foreground 2 depth */
	if (ini_key_exists("Custom Backgrounds", "custom_foreground2_depth"))
	{
		depth = ini_read_real("Custom Backgrounds", "custom_foreground2_depth", -10);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		&& (!global.create_level_from_template)
		{
			ini_write_real("Custom Backgrounds", "custom_foreground2_depth", -10);
		}
		depth = -10;
	}
	#endregion /* Custom Foreground 2 depth END */

	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
else
{
	x_offset = 0;
	y_offset = 0;
	depth = -10;
}
#endregion /* Initialize Foreground END */
