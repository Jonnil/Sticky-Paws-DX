x = mouse_x;
y = mouse_y;

#region /* Clamp mouse cursor so it's always within view */
if (instance_exists(obj_camera))
{
	x = clamp(x, camera_get_view_x(obj_camera.camera), camera_get_view_x(obj_camera.camera) + camera_get_view_width(obj_camera.camera));
	y = clamp(y, camera_get_view_y(obj_camera.camera), camera_get_view_y(obj_camera.camera) + camera_get_view_height(obj_camera.camera));
}
#endregion /* Clamp mouse cursor so it's always within view END */