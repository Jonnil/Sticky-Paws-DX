function scr_x_to_gui(xx)
{
	var t = application_get_position();
	return (xx - camera_get_view_x(view_get_camera(view_current))) / camera_get_view_width(view_get_camera(view_current)) * (t[2] - t[0]);
}
