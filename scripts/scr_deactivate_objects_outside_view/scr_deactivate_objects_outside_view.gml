function scr_deactivate_objects_outside_view()
{
	/* Initialize variables */
	var camera_x = camera_get_view_x(view_camera[0]);
	var camera_y = camera_get_view_y(view_camera[0]);
	var camera_moving = false;
	var camera_delay = 5; /* Time delay in steps */
	
	/* Check for camera movement in each step */
	if (camera_get_view_x(view_camera[0]) != camera_x || camera_get_view_y(view_camera[0]) != camera_y)
	{
	    camera_moving = true;
	    camera_x = camera_get_view_x(view_camera[0]);
	    camera_y = camera_get_view_y(view_camera[0]);
	}
	
	/* Wait for the camera to stop moving */
	if (camera_moving)
	{
	    camera_delay--;
	    if (camera_delay <= 0)
	    {
	        camera_moving = false;
	        camera_delay = 5; /* Reset delay */
	        /* Code to run when camera stops moving goes here */
	    }
	}
	
	if (camera_moving)
	{
		
		#region /* Deactivate instances outside view */
		instance_activate_all();
		
		view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
		view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
		if (global.deactivate_objects_from_most_zoomed_out == false)
		{
			instance_deactivate_region(
			camera_get_view_x(view_camera[view_current]) - 64,
			camera_get_view_y(view_camera[view_current]) - 64,
			camera_get_view_width(view_camera[view_current]) + 128 /* Camera Width */,
			camera_get_view_height(view_camera[view_current]) + 128 /* Camera Height */,
			false, true);
		}
		else
		{
			var view_distance_from_center = 1000; /* Default: 1000 */
			instance_deactivate_region(
			view_x_center - view_distance_from_center /* Left */ ,
			view_y_center - view_distance_from_center /* Top */ ,
			view_distance_from_center * 2 /* Width */ ,
			view_distance_from_center * 2 /* Height */ ,
			false, true);
		}
		#endregion /* Deactivate instances outside view END */
		
		#region /* Activate objects that always should be active */
		var objects = [        obj_follow_mouse,        obj_level_player_1_start,        obj_level_player_2_start,        obj_level_player_3_start,        obj_level_player_4_start,        obj_player,        obj_player_map,        obj_player_lose,        obj_foreground1,        obj_foreground_above_static_objects,        obj_foreground2,        obj_foreground_secret,        obj_background_brightness_gameplay,        obj_water_level,        obj_level_height,        obj_level_width,        obj_credits,        obj_title    ];
	    for (var i = 0; i < array_length_1d(objects); i++) {
	        var object = objects[i];
	        if (asset_get_type(object) == asset_object) {
	            instance_activate_object(object);
	        }
	    }
		#endregion /* Activate objects that always should be active END */
		
	}
}