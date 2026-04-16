function scr_resize_application_surface()
{
	var display_width = round(display_get_gui_width());
	var display_height = round(display_get_gui_height());

	if (display_width <= 0 || display_height <= 0)
	{
		return;
	}

	if (display_width != prev_display_width || display_height != prev_display_height)
	{
		/* The application surface can disappear while minimized / device-lost.
		   Leave prev_display_* unchanged so we retry the resize once it comes back. */
		if (surface_exists(application_surface))
		{
			show_debug_message("Window resized!");
			prev_display_width = display_width;
			prev_display_height = display_height;
			surface_resize(application_surface, prev_display_width, prev_display_height);
			global.deactivate_timer = 999; /* Force update deactivate region */
		}
	}
}
