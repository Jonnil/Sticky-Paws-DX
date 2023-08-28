function scr_draw_cursor_mouse()
{
	
	#region /* Draw mouse cursor for menu navigation */
	if (global.controls_used_for_menu_navigation == "mouse")
	&& (global.full_level_map_screenshot == false)
	&& (os_type != os_android)
	&& (os_type != os_ios)
	{
		draw_sprite(spr_cursor, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	}
	#endregion /* Draw mouse cursor for menu navigation END */
	
}