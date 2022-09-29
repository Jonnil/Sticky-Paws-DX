function scr_draw_mouse_cursor()
{
	
	#region /* Tongue aim should always be above everything, it represents the mouse cursor */
	if (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (instance_exists(obj_camera))
	and (obj_camera.player1 >= 1)
	and (obj_camera.can_spawn_player1 == true)
	and (obj_camera.player1.allow_tongue == true)
	{
		if (obj_camera.player1.can_tongue == true) /* If you're able to use the tongue */
		and (obj_camera.player1.climb == false)
		and (obj_camera.player1.horizontal_rope_climb == false)
		{
			
			#region /* Draw aim cursor with lines */
			draw_line_width_color (mouse_x - 10, mouse_y, mouse_x - 2, mouse_y, 2, c_red, c_red);
			draw_line_width_color (mouse_x + 2, mouse_y, mouse_x + 10, mouse_y, 2, c_red, c_red);
			draw_line_width_color (mouse_x, mouse_y - 10, mouse_x, mouse_y - 2, 2, c_red, c_red);
			draw_line_width_color (mouse_x, mouse_y + 2, mouse_x, mouse_y + 10, 2, c_red, c_red);
			#endregion /* Draw aim cursor with lines END */
			
		}
		else /* If you're not able to use the tongue */
		{
			
			#region /* Draw aim cursor with lines but transparent */
			draw_set_alpha(0.5);
			draw_line_width_color (mouse_x - 10, mouse_y, mouse_x - 2, mouse_y, 2, c_red, c_red);
			draw_line_width_color (mouse_x + 2, mouse_y, mouse_x + 10, mouse_y, 2, c_red, c_red);
			draw_line_width_color (mouse_x, mouse_y - 10, mouse_x, mouse_y - 2, 2, c_red, c_red);
			draw_line_width_color (mouse_x, mouse_y + 2, mouse_x, mouse_y + 10, 2, c_red, c_red);
			draw_set_alpha(1);
			#endregion /* Draw aim cursor with lines END */
			
		}
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