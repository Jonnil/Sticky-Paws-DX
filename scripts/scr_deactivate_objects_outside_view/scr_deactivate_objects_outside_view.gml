function scr_deactivate_objects_outside_view()
{
	#region /* Debug toggles */
	var deactivate_objects_outside_view = true; /* This is for debug purposes, and should always be set to true when playing the game normally */
	var can_activate_always_active_objects = true;
	#endregion /* Debug toggles END */
	
	#region /* Deactivate instances outside view */
	if (delay >= 10)
	{
		instance_activate_all();
		if (deactivate_objects_outside_view == true) /* This global variable is for debug purposes, and should always be set to true when playing the game normally */
		{
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
		}
	}
	else
	{
		delay += 1;
	}
	#endregion /* Deactivate instances outside view END */
	
	#region /* Activate objects that always should be active */
	
	if (can_activate_always_active_objects == true)
	{
		if (asset_get_type("obj_follow_mouse") == asset_object)
		{
			instance_activate_object(obj_follow_mouse);
		}
		if (asset_get_type("obj_level_player_1_start") == asset_object)
		{
			instance_activate_object(obj_level_player_1_start);
		}
		if (asset_get_type("obj_level_player_2_start") == asset_object)
		{
			instance_activate_object(obj_level_player_2_start);
		}
		if (asset_get_type("obj_level_player_3_start") == asset_object)
		{
			instance_activate_object(obj_level_player_3_start);
		}
		if (asset_get_type("obj_level_player_4_start") == asset_object)
		{
			instance_activate_object(obj_level_player_4_start);
		}
		if (asset_get_type("obj_player") == asset_object)
		{
			instance_activate_object(obj_player);
		}
		if (asset_get_type("obj_player_map") == asset_object)
		{
			instance_activate_object(obj_player_map);
		}
		if (asset_get_type("obj_player_lose") == asset_object)
		{
			instance_activate_object(obj_player_lose);
		}
		if (asset_get_type("obj_foreground1") == asset_object)
		{
			instance_activate_object(obj_foreground1);
		}
		if (asset_get_type("obj_foreground_above_static_objects") == asset_object)
		{
			instance_activate_object(obj_foreground_above_static_objects);
		}
		if (asset_get_type("obj_foreground2") == asset_object)
		{
			instance_activate_object(obj_foreground2);
		}
		if (asset_get_type("obj_foreground_secret") == asset_object)
		{
			instance_activate_object(obj_foreground_secret);
		}
		if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
		{
			instance_activate_object(obj_background_brightness_gameplay);
		}
		if (asset_get_type("obj_water_level") == asset_object)
		{
			instance_activate_object(obj_water_level);
		}
		if (asset_get_type("obj_level_height") == asset_object)
		{
			instance_activate_object(obj_level_height);
		}
		if (asset_get_type("obj_level_width") == asset_object)
		{
			instance_activate_object(obj_level_width);
		}
		if (asset_get_type("obj_credits") == asset_object)
		{
			instance_activate_object(obj_credits);
		}
		if (asset_get_type("obj_title") == asset_object)
		{
			instance_activate_object(obj_title);
		}
	}
	#endregion /* Activate objects that always should be active END */
	
}