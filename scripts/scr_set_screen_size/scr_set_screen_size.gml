function scr_set_screen_size()
{
	#region /* Set GUI size */
	switch (global.gui_scale_modifier)
	{
		case 0: global.gui_width = window_get_width() * 0.7; global.gui_height = window_get_height() * 0.7; break;
		case 1: global.gui_width = window_get_width() * 0.8; global.gui_height = window_get_height() * 0.8; break;
		case 2: global.gui_width = window_get_width() * 0.9; global.gui_height = window_get_height() * 0.9; break;
		case 3: global.gui_width = window_get_width(); global.gui_height = window_get_height(); break;
		case 4: global.gui_width = window_get_width() * 1.1; global.gui_height = window_get_height() * 1.1; break;
		case 5: global.gui_width = window_get_width() * 1.2; global.gui_height = window_get_height() * 1.2; break;
		case 6: global.gui_width = window_get_width() * 1.3; global.gui_height = window_get_height() * 1.3; break;
		default: break;
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
	
	if (global.play_edited_level || room == rm_world_map)
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