var view_left = camera_get_view_x(view_camera[view_current]);
var view_top = camera_get_view_y(view_camera[view_current]);
var view_right = view_left + camera_get_view_width(view_camera[view_current]);
var view_bottom = view_top + camera_get_view_height(view_camera[view_current]);

if (bbox_top > room_height + 16)
{
	instance_destroy();
}

if (bbox_left > view_right + 16)
|| (bbox_right < view_left - 16)
|| (bbox_top > view_bottom + 16)
|| (bbox_bottom < view_top - 16)
{
	if (die)
	{
		instance_destroy();
	}
}
