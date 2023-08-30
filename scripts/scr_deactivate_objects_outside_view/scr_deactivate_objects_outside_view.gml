function scr_deactivate_objects_outside_view()
{
	var view_left = camera_get_view_x(view_camera[view_current]) - 64;
	var view_top = camera_get_view_y(view_camera[view_current]) - 64;
	var view_width = camera_get_view_width(view_camera[view_current]) + 128;
	var view_height = camera_get_view_height(view_camera[view_current]) + 128;
	
	deactivate_timer++;
	if (deactivate_timer > 60)
	{
		instance_deactivate_region(view_left, view_top, view_width, view_height, false, true); /* Deactivate instances outside view first */
		
		/* Activate objects that always should be active */
		instance_activate_object(obj_player);
		instance_activate_object(obj_player_lose);
		instance_activate_object(obj_foreground1);
		instance_activate_object(obj_foreground1_5);
		instance_activate_object(obj_foreground2);
		instance_activate_object(obj_foreground_secret);
		instance_activate_object(obj_water_level);
		
		deactivate_timer = 0;
	}
	instance_activate_region(view_left, view_top, view_width, view_height, true); /* Always activate within view */
}