function scr_deactivate_objects_outside_view()
{
	/* This function needs to be at the very end of the step event to work correctly, otherwise it can't detect when camera is moving or not */
	if (x != xprevious) /* If camera is moving, then update the "instance deactivate" script */
	|| (y != yprevious)
	|| (global.deactivate_timer > 60) /* Sometimes you want to force a deactivate region by setting the deactivate timer to over 60, like when first starting the room */
	{
		/* Deactivating from view center makes it more consistend, where players with any view zoom will experience the same things */
		/* It might deactivate less things on more zoomed in, but we have to find other things to optimize */
		var view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) * 0.5);
		var view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) * 0.5);
		var view_distance_from_center = 1074; /* How many pixels from view center objects should deactivate. Needs to be enought to not cause problems */
		var view_left = view_x_center - view_distance_from_center;
		var view_top = view_y_center - view_distance_from_center;
		var view_width = view_distance_from_center * 2;
		var view_height = view_distance_from_center * 2;
		
		global.deactivate_timer++;
		
		if (global.deactivate_timer > 100)
		{
			instance_deactivate_region(view_left, view_top, view_width, view_height, false, true); /* Deactivate instances outside view first */
			
			/* Activate objects that always should be active */
			if (room == rm_leveleditor)
			{
				instance_activate_object(obj_player);
				instance_activate_object(obj_player_lose);
				instance_activate_object(obj_foreground1);
				instance_activate_object(obj_foreground1_5);
				instance_activate_object(obj_foreground2);
				instance_activate_object(obj_foreground_secret);
				instance_activate_object(obj_water_level);
				if (instance_exists(obj_leveleditor_placed_object))
				{
					with (obj_leveleditor_placed_object)
					{
						scr_make_sprite_transparent_setting_difficulty_levels();
					}
				}
			}
			else
			if (room == rm_world_map)
			{
				instance_activate_object(obj_camera_map);
				instance_activate_object(obj_level);
				instance_activate_object(obj_unlock_next_level);
				instance_activate_object(obj_path);
				instance_activate_object(obj_map_path_turn);
				instance_activate_object(obj_map_exit);
			}
			
			global.deactivate_timer = 0; /* Reset the deactivate timer */
		}
		if (global.deactivate_timer % 7 == 0)
		{
			instance_activate_region(view_left, view_top, view_width, view_height, true); /* Always activate within view */
		}
	}
}