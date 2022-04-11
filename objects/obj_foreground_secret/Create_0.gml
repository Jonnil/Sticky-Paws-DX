depth = -20;

if (global.custom_foreground_secret >= 0)
{
	mask_index = global.custom_foreground_secret;
	sprite_index = global.custom_foreground_secret;
}

#region /*Initialize Foreground*/
if (global.character_select_in_this_menu = "main_game")
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
or(global.character_select_in_this_menu = "level_editor")
and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu = "main_game")
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu = "level_editor")
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	
	#region /*Custom Foreground x and y offset points*/
	#region /*Custom Foreground secret y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_foreground_secret_y_offset"))
	{
		y = ini_read_real("Custom Backgrounds", "custom_foreground_secret_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_secret_y_offset", 0);
		}
		y = 0;
	}
	#endregion /*Custom Foreground secret y offset point END*/
	
	#region /*Custom Foreground secret x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_foreground_secret_x_offset"))
	{
		x = ini_read_real("Custom Backgrounds", "custom_foreground_secret_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_secret_x_offset", 0);
		}
		x = 0;
	}
	#endregion /*Custom Foreground secret x offset point END*/
	#endregion /*Custom Foreground secret x and y offset points END*/
	
	ini_close();
}
else
{
	x = 0;
	y = 0;
}
#endregion /*Initialize Foreground END*/