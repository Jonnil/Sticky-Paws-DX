var view_left = camera_get_view_x(view_camera[view_current]) - 25;
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 25;
var view_top = camera_get_view_y(view_camera[view_current]) - 25;
var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 25;

#region /* Gravity */
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (!place_meeting(x, y + 1, obj_semisolid_platform))
and (x < view_right)
and (x > view_left)
and (y < view_bottom)
and (y > view_top)
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