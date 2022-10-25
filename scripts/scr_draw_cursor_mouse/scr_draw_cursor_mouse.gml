function scr_draw_cursor_mouse()
{
	
	#region /* Tongue aim should always be above everything, it represents the mouse cursor */
	if (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (instance_exists(obj_camera))
	and (obj_camera.player1 >= 1)
	and (obj_camera.can_spawn_player1 == true)
	and (obj_camera.player1.allow_tongue == true)
	{
		/* Do not show normal cursor */
	}
	#endregion /* Tongue aim should always be above everything, it represents the mouse cursor END */
	
	else
	
	#region /* Draw mouse cursor for menu navigation */
	if (global.controls_used_for_menu_navigation == "mouse")
	and (global.full_level_map_screenshot == false)
	and (global.pause == false)
	and (os_type != os_android)
	and (os_type != os_ios)
	{
		draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
	}
	#endregion /* Draw mouse cursor for menu navigation END */
	
}