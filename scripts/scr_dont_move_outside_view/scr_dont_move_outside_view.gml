function scr_dont_move_outside_view()
{
	
	#region /* Don't move outside view */
	var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
	var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
	var view_distance_from_center = 1044; /* How many pixels from view center objects should deactivate. Needs to be enought to not cause problems */
	var view_left = view_x_center - view_distance_from_center;
	var view_top = view_y_center - view_distance_from_center;
	var view_right = view_x_center + view_distance_from_center;
	var view_bottom = view_y_center + view_distance_from_center;
	if (!die)
	{
		if (bbox_right < min(camera_get_view_x(view_camera[view_current]) - 32, view_left))
		|| (bbox_left > max(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32, view_right))
		|| (bbox_bottom < min(camera_get_view_y(view_camera[view_current]) - 32, view_top))
		|| (bbox_top > max(camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32, view_bottom))
		{
			hspeed = 0;
			vspeed = 0;
			speed = 0;
			gravity = 0;
			friction = 500;
			/* Stop enemy from moving, but don't reset the "sliding along ground" variable */
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
	
}