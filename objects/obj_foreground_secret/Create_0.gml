mask_index = spr_noone;
sprite_index = spr_noone;

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
	#region /* Custom Foreground secret y offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_foreground_secret_y_offset"))
	{
		y = ini_read_real("Custom Backgrounds", "custom_foreground_secret_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		&& (!global.create_level_from_template)
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_secret_y_offset", 0);
		}
		y = 0;
	}
	#endregion /* Custom Foreground secret y offset point END */
	
	#region /* Custom Foreground secret x offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_foreground_secret_x_offset"))
	{
		x = ini_read_real("Custom Backgrounds", "custom_foreground_secret_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		&& (!global.create_level_from_template)
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_secret_x_offset", 0);
		}
		x = 0;
	}
	#endregion /* Custom Foreground secret x offset point END */
	#endregion /* Custom Foreground secret x and y offset points END */
	
	#region /* Custom Foreground Secret depth */
	if (ini_key_exists("Custom Backgrounds", "custom_foreground_secret_depth"))
	{
		depth = ini_read_real("Custom Backgrounds", "custom_foreground_secret_depth", -20);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		&& (!global.create_level_from_template)
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_secret_depth", -20);
		}
		depth = -20;
	}
	#endregion /* Custom Foreground Secret depth END */
	
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
else
{
	x = 0;
	y = 0;
	depth = -20;
}
#endregion /* Initialize Foreground END */