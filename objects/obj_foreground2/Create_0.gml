#region /* Initialize Foreground */
var official_level_information_path = scr_get_official_level_file_path("", "data", "level_information.ini");
var custom_level_information_path = global.use_temp_or_working + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini";

if (scr_is_loading_official_level())
&& file_exists(official_level_information_path)
|| (!scr_is_loading_official_level())
&& file_exists(custom_level_information_path)
{
	if (scr_is_loading_official_level())
	{
		ini_open(official_level_information_path);
	}
	else
	if (!scr_is_loading_official_level())
	{
		ini_open(custom_level_information_path);
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
