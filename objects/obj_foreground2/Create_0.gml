depth = -10;

#region /*Initialize Foreground*/
if (global.character_select_in_this_menu="game")
and(file_exists("Levels/"+string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/Data/level_information.ini"))
or(global.character_select_in_this_menu="level_editor")
and(file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Data/level_information.ini"))
{
	if (global.character_select_in_this_menu="game")
	{
		ini_open("Levels/"+string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/Data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu="level_editor")
	{
		ini_open(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Data/level_information.ini");
	}
	
	#region /*Custom Foreground x and y offset points*/
	#region /*Custom Foreground 2 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_foreground_2_y_offset"))
	{
		y_offset = ini_read_real("Custom Backgrounds", "custom_foreground_2_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu="level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_2_y_offset", 0);
		}
		y_offset = 0;
	}
	#endregion /*Custom Foreground 2 y offset point END*/
	
	#region /*Custom Foreground 2 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_foreground_2_x_offset"))
	{
		x_offset = ini_read_real("Custom Backgrounds", "custom_foreground_2_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu="level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_2_x_offset", 0);
		}
		x_offset = 0;
	}
	#endregion /*Custom Foreground 2 x offset point END*/
	#endregion /*Custom Foreground 2 x and y offset points END*/
	
	ini_close();
}
else
{
	x_offset = 0;
	y_offset = 0;
}
#region /*Initialize Foreground END*/