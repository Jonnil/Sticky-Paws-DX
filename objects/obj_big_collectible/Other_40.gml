#region /* Don't go outside view boundary */
if (bounce_up)
{
	var view_x = camera_get_view_x(view_camera[view_current]);
	var view_y = camera_get_view_y(view_camera[view_current]);
	var view_width = camera_get_view_width(view_camera[view_current]);
	var view_height = camera_get_view_height(view_camera[view_current]);
	x = clamp(x, view_x - (sprite_width * 0.5), view_x + view_width + (sprite_width * 0.5));
	y = clamp(y, view_y - (sprite_height * 0.5), view_y + view_height + (sprite_height * 0.5));
}
#endregion /* Don't go outside view boundary END */