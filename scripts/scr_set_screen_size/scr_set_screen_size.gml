function scr_set_screen_size()
{
	
	#region /* Set GUI size */
	if (keyboard_check(ord("1")))
	{
		var gui_width = 768;
		var gui_height = 1024;
	}
	else
	if (keyboard_check(ord("2")))
	{
		var gui_width = 76;
		var gui_height = 102;
	}
	else
	if (keyboard_check(ord("3")))
	{
		var gui_width = 7680;
		var gui_height = 10240;
	}
	else
	if (keyboard_check(ord("4")))
	{
		var gui_width = 7;
		var gui_height = 10;
	}
	else
	{
		var gui_width = window_get_width();
		var gui_height = window_get_height();
	}
	
	var gui_xscale = 1;
	var gui_yscale = 1;
	
	display_set_gui_size(gui_width, gui_height);
	//display_set_gui_maximise(gui_xscale, gui_yscale, 0, 0);
	#endregion /* Set GUI size END */
	
	scr_draw_text_outlined(32, 32, gui_width)
	scr_draw_text_outlined(32, 32 + 32, gui_height)
	scr_draw_text_outlined(32, 32 + 64, gui_xscale)
	scr_draw_text_outlined(32, 32 + 96, gui_yscale)
	
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