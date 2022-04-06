move_snap(global.grid_hsnap, global.grid_vsnap);
delay += 1;
if (delay > 1)
{
	if (place_meeting(x, y, obj_level_player_1_start))
	or(place_meeting(x, y, obj_level_player_2_start))
	or(place_meeting(x, y, obj_level_player_3_start))
	or(place_meeting(x, y, obj_level_player_4_start))
	or(x < camera_get_view_x(view_camera[view_current]))
	or(x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	{
		instance_destroy();
	}
	else
	{
		if (fill_mode_type = "fill")
		{
			if (free_down = true)
			and (delay = 2)
			{
				with(instance_create_depth(x, y + 32, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "fill";
				}
			}
			else
			if (free_left = true)
			and (delay = 3)
			{
				with(instance_create_depth(x - 32, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "horizontal";
				}
			}
			else
			if (free_right = true)
			and (delay = 4)
			{
				with(instance_create_depth(x + 32, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "horizontal";
				}
			}
			else
			if (free_up = true)
			and (delay = 5)
			{
				with(instance_create_depth(x, y - 32, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "fill";
				}
			}
		}
		else
		if (fill_mode_type = "horizontal")
		{
			if (free_left = true)
			{
				with(instance_create_depth(x - 32, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "horizontal";
				}
			}
			if (free_right = true)
			{
				with(instance_create_depth(x + 32, y, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "horizontal";
				}
			}
		}
		else
		if (fill_mode_type = "vertical")
		{
			if (free_up = true)
			{
				with(instance_create_depth(x, y - 32, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "vertical";
				}
			}
			if (free_down = true)
			{
				with(instance_create_depth(x, y + 32, 0, obj_leveleditor_fill))
				{
					fill_mode_type = "vertical";
				}
			}
		}
		with(instance_create_depth(x, y, 0, obj_leveleditor_placed_object))
		{
			object = obj_leveleditor.place_object;
			obj.placed_for_the_first_time = false;
		}
		if (fill_mode_type = "fill")
		and (delay >= 5)
		{
			instance_destroy();
		}
		else
		if (fill_mode_type != "fill")
		and (delay >= 1)
		{
			instance_destroy();
		}
	}
}