function scr_set_screen_size()
{
	
	#region /* Set GUI size */
	if (global.gui_scale_modifier == 0)
	{
		global.gui_width = window_get_width();
		global.gui_height = window_get_height();
	}
	else
	if (global.gui_scale_modifier == 1)
	{
		global.gui_width = 1920;
		global.gui_height = 1080;
	}
	else
	if (global.gui_scale_modifier == 2)
	{
		global.gui_width = 1600;
		global.gui_height = 900;
	}
	else
	if (global.gui_scale_modifier == 3)
	{
		global.gui_width = 1366;
		global.gui_height = 768;
	}
	else
	if (global.gui_scale_modifier == 4)
	{
		global.gui_width = 1280;
		global.gui_height = 720;
	}
	else
	if (global.gui_scale_modifier == 5)
	{
		global.gui_width = 1024;
		global.gui_height = 576;
	}
	else
	if (global.gui_scale_modifier == 6)
	{
		global.gui_width = 864;
		global.gui_height = 480;
	}
	
	display_set_gui_size(global.gui_width, global.gui_height);
	if (global.gui_scale != -1)
	{
		display_set_gui_maximise(global.gui_scale, global.gui_scale, 0, 0);
	}
	#endregion /* Set GUI size END */
	
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
	
}