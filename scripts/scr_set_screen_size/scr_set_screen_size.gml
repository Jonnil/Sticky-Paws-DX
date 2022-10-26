function scr_set_screen_size()
{
	
	#region /* Set screen size */
	if (variable_instance_exists(self, "camera"))
	{
		camera_set_view_border(camera, camera_get_view_width(camera), camera_get_view_height(camera)); /* View Border */
		
		if (window_get_width() <= global.default_view_width)
		and (window_get_height() <= global.default_view_height)
		{
			camera_set_view_size(camera, window_get_width() + view_wview_lerp, window_get_height() + view_hview_lerp);
		}
		else
		if (window_get_width() > global.default_view_width)
		and (window_get_height() <= global.default_view_height)
		{
			camera_set_view_size(camera, global.default_view_width + view_wview_lerp, window_get_height() + view_hview_lerp);
		}
		else
		if (window_get_width() <= global.default_view_width)
		and (window_get_height() > global.default_view_height)
		{
			camera_set_view_size(camera, window_get_width() + view_wview_lerp, global.default_view_height + view_hview_lerp);
		}
		else
		{
			camera_set_view_size(camera, global.default_view_width + view_wview_lerp, global.default_view_height + view_hview_lerp);
		}
		if (global.play_edited_level == true)
		or (room = room_world_map)
		{
			camera_set_view_speed(camera, - 1, - 1);
		}
		else
		{
			camera_set_view_speed(camera, 0, 0);
		}
		camera_set_view_target(camera, self);
	}
	#endregion /* Set screen size END */
	
	display_set_gui_size(window_get_width(), window_get_height());
	
}