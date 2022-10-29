function scr_x_to_gui(xx)
{
	var t = application_get_position();
	if (asset_get_type("obj_title") == asset_object)
	and (instance_exists(obj_camera))
	{
		return (xx - camera_get_view_x(obj_camera.camera)) / camera_get_view_width(obj_camera.camera) * (t[2] - t[0]);
	}
}