function scr_deactivate_objects_outside_view()
{
	deactivate_timer++;
	if (deactivate_timer > 10)
	{
		/* Deactivate instances outside view */
		instance_activate_all();
		
		var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
		var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
		
		//if (!global.deactivate_objects_from_most_zoomed_out)
		//{
		//	var region_x = camera_get_view_x(view_camera[view_current]) - 64 - 32;
		//	var region_y = camera_get_view_y(view_camera[view_current]) - 64 - 32;
		//	var region_width = camera_get_view_width(view_camera[view_current]) + 128 + 32;
		//	var region_height = camera_get_view_height(view_camera[view_current]) + 128 + 32;
		//}
		//else
		//{
			var view_distance_from_center = 1100;
			var region_x = view_x_center - view_distance_from_center;
			var region_y = view_y_center - view_distance_from_center;
			var region_width = view_distance_from_center * 2;
			var region_height = view_distance_from_center * 2;
		//}
		
		instance_deactivate_region(region_x, region_y, region_width, region_height, false, true);
		
		/* Activate objects that always should be active */
		var objects = [
		obj_player,
		obj_player_lose,
		obj_foreground1,
		obj_foreground_above_static_objects,
		obj_foreground2,
		obj_foreground_secret,
		obj_water_level];
		
		for (var i = 0; i < array_length_1d(objects); i++)
		{
			var object = objects[i];
			instance_activate_object(object);
		}
		deactivate_timer = 0;
	}
}