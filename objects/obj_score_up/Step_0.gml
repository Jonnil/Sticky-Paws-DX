#region /* Don't go outside view boundary */
if (x < camera_get_view_x(view_camera[view_current]) + 32 + (string_length(string_upper(score_up))))
{
	x = camera_get_view_x(view_camera[view_current]) + 32 + (string_length(string_upper(score_up)));
}
if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32 - (string_length(string_upper(score_up))))
{
	x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32 - (string_length(string_upper(score_up)));
}
if (y < camera_get_view_y(view_camera[view_current]) + 32)
{
	y = camera_get_view_y(view_camera[view_current]) + 32;
}
if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32)
{
	y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32;
}
#endregion /* Don't go outside view boundary END */

if (time < 5)
{
	y = lerp(y, ystart + 5, 0.1);
	image_xscale = lerp(image_xscale, 2, 0.15);
	image_yscale = lerp(image_yscale, 2, 0.15);
}
else
{
	y = lerp(y, ystart - 32, 0.1);
	image_xscale = lerp(image_xscale, 1, 0.1);
	image_yscale = lerp(image_yscale, 1, 0.1);
}
time += 1;
if (time > room_speed)
{
	image_alpha = lerp(image_alpha, 0, 0.1);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}