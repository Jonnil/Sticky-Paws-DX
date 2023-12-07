function scr_toggle_fullscreen()
{
	if (keyboard_check_pressed(global.fullscreen_key)) /* First check if fullscreen button is pressed before doing any other code. Default fullscreen button is F11 */
	{
		if (window_get_fullscreen()) /* If fullscreen is on, then turn fullscreen off */
		{
			window_set_fullscreen(false);
		}
		else /* If fullscreen is off, then turn fullscreen on */
		{
			window_set_fullscreen(true);
		}
		ini_open("save_file/config.ini");
		ini_write_real("config", "fullscreen_mode", window_get_fullscreen()); /* Save fullscreen settings to config.ini */
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
}