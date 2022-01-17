#region /*Set screen size*/
camera_set_view_border(view_camera[view_current], 1920, 1080); /*View Border*/
camera_set_view_size(view_camera[view_current], 1920, 1080);

if (asset_get_type("obj_leveleditor")==asset_object)
and (!instance_exists(obj_leveleditor))
{
	camera_set_view_target(view_camera[view_current], self);
}
display_set_gui_size(window_get_width(), window_get_height());
#endregion /*Set screen size END*/

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera")==asset_object)
and (!instance_exists(obj_camera))
and (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config","fullscreen_mode",window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/