function scr_resize_application_surface() {
	var display_width = display_get_gui_width();
	var display_height = display_get_gui_height();
	
	if (display_width != prev_display_width || display_height != prev_display_height) {
		prev_display_width = display_width;
		prev_display_height = display_height;
		surface_resize(application_surface, prev_display_width, prev_display_height);
	}
}