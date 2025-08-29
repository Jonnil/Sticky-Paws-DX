var view_left = camera_get_view_x(view_camera[view_current]) - 25;
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 25;
var view_top = camera_get_view_y(view_camera[view_current]) - 25;
var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 25;

#region /* Gravity */
if (!place_meeting(x, y + 1, obj_wall))
&& (!place_meeting(x, y + 1, obj_semisolid_platform))
&& (x < view_right)
&& (x > view_left)
&& (y < view_bottom)
&& (y > view_top)
{
	gravity = 0.5;
}
else
{
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}
if (vspeed >= 16)
{
	vspeed = 16;
}
#endregion /* Gravity END */
