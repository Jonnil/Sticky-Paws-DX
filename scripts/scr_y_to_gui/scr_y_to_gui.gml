function scr_y_to_gui(yy)
{
	var t = application_get_position();
	return (yy - camera_get_view_y(view_camera[view_current])) / camera_get_view_height(view_camera[view_current]) * (t[3] - t[1]);
}