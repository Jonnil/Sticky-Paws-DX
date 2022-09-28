function scr_toggle_fullscreen()
{
	if (keyboard_check_pressed(global.fullscreen_key)) /*First check if fullscreen button is pressed before doing any other code. Default fullscreen button is F11*/
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		and (self == obj_camera) /*If this script is run from obj_camera, and there exists a obj_camera, then only run this script from obj_camera*/
		or (asset_get_type("obj_camera") == asset_object)
		and (!instance_exists(obj_camera)) /*If there doesn't exist a obj_camera, then be allowed to run this script*/
		{
			if (window_get_fullscreen()) /*If fullscreen is on, then turn fullscreen off*/
			{
				window_set_fullscreen(false);
			}
			else /*If fullscreen is off, then turn fullscreen on*/
			{
				window_set_fullscreen(true);
			}
			ini_open("config.ini");
			ini_write_real("config", "fullscreen_mode", window_get_fullscreen()); /*Save fullscreen settings to config.ini*/
			ini_close();
		}
	}
}