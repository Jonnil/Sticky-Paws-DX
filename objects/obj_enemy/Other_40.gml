var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
var view_distance_from_center = 1100;
var region_x = view_x_center - view_distance_from_center;
var region_y = view_y_center - view_distance_from_center;
var region_width = view_distance_from_center * 2;
var region_height = view_distance_from_center * 2;
var view_left = region_x - 142;
var view_right = region_x + region_width + 142;
var view_top = region_y - 142;
var view_bottom = region_y + region_height + 142;

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

scr_enemy_dying_offscreen();