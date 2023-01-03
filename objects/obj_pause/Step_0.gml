gamepad_set_vibration(0, 0, 0);
gamepad_set_vibration(1, 0, 0);
gamepad_set_vibration(2, 0, 0);
gamepad_set_vibration(3, 0, 0);

#region /* Set screen size */
camera_set_view_border(view_camera[view_current], 1920, 1080); /* View Border */
camera_set_view_size(view_camera[view_current], 1920, 1080);

if (asset_get_type("obj_leveleditor") == asset_object)
and (!instance_exists(obj_leveleditor))
{
	camera_set_view_target(view_camera[view_current], self);
}
scr_set_screen_size();
#endregion /* Set screen size END */

scr_toggle_fullscreen();

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */