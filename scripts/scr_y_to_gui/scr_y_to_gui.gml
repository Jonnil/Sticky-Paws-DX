function scr_y_to_gui(yy)
{
	var t = application_get_position();
	if (asset_get_type("obj_title") == asset_object)
	and (instance_exists(obj_camera))
	{
		return (yy - camera_get_view_y(obj_camera.camera)) / camera_get_view_height(obj_camera.camera) * (t[2] - t[0]);
	}
}