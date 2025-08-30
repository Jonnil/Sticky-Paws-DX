function scr_deactivate_objects_outside_view()
{
	/* This function needs to be at the very end of the step event to work correctly, otherwise it can't detect when camera is moving or not */
	if (x != xprevious) /* If camera is moving, then update the "instance deactivate" script */
	|| (y != yprevious)
	|| (global.deactivate_timer > 60) /* Sometimes you want to force a deactivate region by setting the deactivate timer to over 60, like when first starting the room */
	{
		/* Deactivating from view center makes it more consistend, where players with any view zoom will experience the same things */
		/* It might deactivate less things on more zoomed in, but we have to find other things to optimize */
		var view_camera_current = view_get_camera(view_current);
		var view_x_center = camera_get_view_x(view_camera_current) + (camera_get_view_width(view_camera_current) * 0.5);
		var view_y_center = camera_get_view_y(view_camera_current) + (camera_get_view_height(view_camera_current) * 0.5);
		var view_distance_from_center = 1074; /* How many pixels from view center objects should deactivate. Needs to be enought to not cause problems */

		/* Using the "min" and "max" function, it will either read the distance from center if that's the bigger number, or if the actual view is bigger it will read that number instead */
		var view_left = min(view_x_center - view_distance_from_center, camera_get_view_x(view_camera_current) - 64);
		var view_top = min(view_y_center - view_distance_from_center, camera_get_view_y(view_camera_current) - 64);
		var view_width = max(view_distance_from_center * 2, camera_get_view_width(view_camera_current) + 128);
		var view_height = max(view_distance_from_center * 2, camera_get_view_height(view_camera_current) + 128);

		global.deactivate_timer++;

		if (global.deactivate_timer > 100)
		{
			/* When you are forcing the deactivate timer, you only want to update "instance activate region" */
			if (global.deactivate_timer < 990)
			{
				/* Deactivate instances outside view first */
				instance_deactivate_region(view_left, view_top, view_width, view_height, false, true);
			}

			#region /* Activate objects that always should be active */
			if (room == rm_leveleditor)
			{
				var exclude_list = [
					obj_player,
					obj_player_lose,
					obj_foreground1,
					obj_foreground1_5,
					obj_foreground2,
					obj_foreground_secret,
					obj_water_level,
					obj_level_height,
					obj_level_width,
					obj_goal,
					obj_big_collectible_number,
					obj_key_fragment_number,
					obj_debug_manager
				];

				/* Loop through the exclude list and activate each object */
				for (var i = 0; i < array_length(exclude_list); i++)
				{
					instance_activate_object(exclude_list[i]);
				}
			}
			else
			if (room == rm_world)
			{
				var exclude_list = [
					obj_camera_map,
					obj_level,
					obj_unlock_next_level,
					obj_map_path,
					obj_map_path_turn,
					obj_map_exit,
					obj_debug_manager
				];

				/* Loop through the exclude list and activate each object */
				for (var i = 0; i < array_length(exclude_list); i++)
				{
					instance_activate_object(exclude_list[i]);
				}
			}
			#endregion /* Activate objects that always should be active END */

			/* Always activate within view before reseting deactivate timer */
			instance_activate_region(view_left, view_top, view_width, view_height, true);
			global.deactivate_timer = 0; /* Reset the deactivate timer */
		}

		if (global.deactivate_timer % 7 == 0)
		|| (global.deactivate_timer > 100)
		{
			/* Always activate within view */
			instance_activate_region(view_left, view_top, view_width, view_height, true);
		}
	}
}
