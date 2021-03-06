drag_object = false;
drag_release_timer = 0;
image_speed = 0.25;

if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Data/level_information.ini"))
{
	ini_open(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Data/level_information.ini");

	if (ini_key_exists("Info", "level_height"))
	{
		y = ini_read_real("Info", "level_height", 0);
	}
	ini_close();
}