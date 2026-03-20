depth = -40;
drag_object = false;
drag_release_timer = 0;
image_speed = 0.25;

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
