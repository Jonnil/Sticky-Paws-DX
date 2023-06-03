var view_left = camera_get_view_x(view_camera[view_current]) - 42;
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 42;
var view_top = camera_get_view_y(view_camera[view_current]) - 42;
var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 42;

#region /* Don't move outside view */
if (die == false)
{
	if (x > view_right)
	&& (hspeed > 0)
	|| (x < view_left)
	&& (hspeed < 0)
	|| (y > view_bottom)
	&& (vspeed > 0)
	|| (y < view_top)
	&& (vspeed < 0)
	{
		hspeed = 0;
		vspeed = 0;
		speed = 0;
		gravity = 0;
		friction = 500;
	}
	else
	{
		friction = 0;
	}
}
else
{
	friction = 0;
}
#endregion /* Don't move outside view END */