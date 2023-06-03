function scr_draw_cursor_mouse()
{
	
	#region /* Tongue aim should always be above everything, it represents the mouse cursor */
	if (asset_get_type("obj_player") == asset_object)
	&& (instance_exists(obj_player))
	&& (instance_exists(obj_camera))
	&& (obj_camera.player1 >= 1)
	&& (obj_camera.can_spawn_player1)
	&& (obj_camera.player1.allow_tongue)
	{
		/* Do not show normal cursor */
	}
	#endregion /* Tongue aim should always be above everything, it represents the mouse cursor END */
	
	else
	
	#region /* Draw mouse cursor for menu navigation */
	if (global.controls_used_for_menu_navigation == "mouse")
	&& (global.full_level_map_screenshot == false)
	&& (os_type != os_android)
	&& (os_type != os_ios)
	{
		draw_set_alpha(1);
		draw_sprite_ext(spr_cursor, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1, 1, 0, c_white, 1);
	}
	#endregion /* Draw mouse cursor for menu navigation END */
	
}