#region /* Don't go outside view boundary */
if (bounce_up)
{
	var view_x = camera_get_view_x(view_camera[view_current]);
	var view_y = camera_get_view_y(view_camera[view_current]);
	var view_width = camera_get_view_width(view_camera[view_current]);
	var view_height = camera_get_view_height(view_camera[view_current]);
	x = clamp(x, view_x + 32, view_x + view_width - 32);
	y = clamp(y, view_y + 32, view_y + view_height);
}
#endregion /* Don't go outside view boundary END */