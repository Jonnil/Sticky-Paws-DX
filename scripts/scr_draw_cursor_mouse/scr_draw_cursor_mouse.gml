function scr_draw_cursor_mouse()
{
	if (global.controls_used_for_navigation == "mouse"
	&& !global.full_level_map_screenshot
	&& os_type != os_android
	&& os_type != os_ios)
	{
		if (instance_exists(obj_debug_manager))
		{
			var target = obj_debug_manager.debug_target;

			if (target == obj_leveleditor)
			&& (target.pause
			|| target.in_modify_object_menu)
			|| (!instance_exists(obj_leveleditor))
			{
				draw_sprite_ext(spr_cursor, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1, 1, 0, c_white, 1);
			}
		}
	}
}
