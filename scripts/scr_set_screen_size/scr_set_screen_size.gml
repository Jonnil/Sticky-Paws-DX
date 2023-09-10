function scr_set_screen_size()
{
	var window_width = window_get_width();
	var window_height = window_get_height();
	
	#region /* Set GUI size */
	switch (global.gui_scale_modifier)
	{
		case 0: global.gui_width = window_width * 0.7; global.gui_height = window_height * 0.7; break;
		case 1: global.gui_width = window_width * 0.8; global.gui_height = window_height * 0.8; break;
		case 2: global.gui_width = window_width * 0.9; global.gui_height = window_height * 0.9; break;
		case 3: global.gui_width = window_width; global.gui_height = window_height; break;
		case 4: global.gui_width = window_width * 1.1; global.gui_height = window_height * 1.1; break;
		case 5: global.gui_width = window_width * 1.2; global.gui_height = window_height * 1.2; break;
		case 6: global.gui_width = window_width * 1.3; global.gui_height = window_height * 1.3; break;
		default: break;
	}
	if (display_get_gui_width() != global.gui_width)
	|| (display_get_gui_height() != global.gui_height)
	{
		display_set_gui_size(global.gui_width, global.gui_height);
	}
	#endregion /* Set GUI size END */
	
	if (global.gui_scale != -1)
	{
		display_set_gui_maximise(global.gui_scale, global.gui_scale, 0, 0);
	}
	
	#region /* Set screen size */
	var current_camera = view_camera[view_current];
	if (camera_get_view_border_x(current_camera) != camera_get_view_width(current_camera))
	|| (camera_get_view_border_y(current_camera) != camera_get_view_height(current_camera))
	{
		camera_set_view_border(current_camera, camera_get_view_width(current_camera), camera_get_view_height(current_camera));
	}
	
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
	
	if (camera_get_view_target(current_camera) != self){camera_set_view_target(current_camera, self);}
	#endregion /* Set screen size END */
	
}