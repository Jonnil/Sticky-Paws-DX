function scr_deactivate_objects_outside_view()
{
	var view_left = camera_get_view_x(view_camera[view_current]) - 64;
	var view_top = camera_get_view_y(view_camera[view_current]) - 64;
	var view_width = camera_get_view_width(view_camera[view_current]) + 128;
	var view_height = camera_get_view_height(view_camera[view_current]) + 128;
	
	deactivate_timer++;
	if (deactivate_timer > 60)
	{
		/* Deactivate instances outside view */
		//var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
		//var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
		//var view_distance_from_center = 1074;
		//var region_x = view_x_center - view_distance_from_center;
		//var region_y = view_y_center - view_distance_from_center;
		//var region_width = view_distance_from_center * 2;
		//var region_height = view_distance_from_center * 2;
		
		instance_deactivate_region(view_left, view_top, view_width, view_height, false, true); /* Deactivate first */
		
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