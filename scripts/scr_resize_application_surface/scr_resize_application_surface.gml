function scr_resize_application_surface()
{
	var display_width = display_get_gui_width();
	var display_height = display_get_gui_height();

	if (display_width != prev_display_width || display_height != prev_display_height)
	{
		/* Check if the dimensions are valid (greater than 0). In the case where dimensions are not valid, then don't resize the surface, otherwise game will crash */
		if (display_width > 0 && display_height > 0)
		{
			show_debug_message("Window resized!");
			prev_display_width = display_width;
			prev_display_height = display_height;
			surface_resize(application_surface, prev_display_width, prev_display_height);
			global.deactivate_timer = 999; /* Force update deactivate region */
		}
	}
}
