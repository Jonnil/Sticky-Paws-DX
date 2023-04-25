function scr_set_screen_size()
{
	#region /* Set GUI size */
	if (global.gui_scale_modifier == 0)
	{
		global.gui_width = window_get_width();
		global.gui_height = window_get_height();
	}
	else
	{
		switch (global.gui_scale_modifier)
		{
			case 1: global.gui_width = 1920; global.gui_height = 1080; break;
			case 2: global.gui_width = 1600; global.gui_height = 900; break;
			case 3: global.gui_width = 1366; global.gui_height = 768; break;
			case 4: global.gui_width = 1280; global.gui_height = 720; break;
			case 5: global.gui_width = 1024; global.gui_height = 576; break;
			case 6: global.gui_width = 864; global.gui_height = 480; break;
			default: break;
		}
	}
	display_set_gui_size(global.gui_width, global.gui_height);
	#endregion /* Set GUI size END */
	
	if (global.gui_scale != -1)
	{
		display_set_gui_maximise(global.gui_scale, global.gui_scale, 0, 0);
	}
	
	#region /* Set screen size */
	var current_camera = view_camera[view_current];
	camera_set_view_border(current_camera, camera_get_view_width(current_camera), camera_get_view_height(current_camera));
	
	var window_width = window_get_width();
	var window_height = window_get_height();
	
	if (window_width <= global.default_view_width && window_height <= global.default_view_height)
	{
		camera_set_view_size(current_camera, window_width, window_height);
	}
	else if (window_width > global.default_view_width && window_height <= global.default_view_height)
	{
		camera_set_view_size(current_camera, global.default_view_width, window_height);
	}
	else if (window_width <= global.default_view_width && window_height > global.default_view_height)
	{
		camera_set_view_size(current_camera, window_width, global.default_view_height);
	}
	else
	{
		camera_set_view_size(current_camera, global.default_view_width, global.default_view_height);
	}
	
	if (global.play_edited_level || room == room_world_map)
	{
		camera_set_view_speed(current_camera, -1, -1);
	}
	else
	{
		camera_set_view_speed(current_camera, 0, 0);
	}
	
	camera_set_view_target(current_camera, self);
	#endregion /* Set screen size END */
	
}