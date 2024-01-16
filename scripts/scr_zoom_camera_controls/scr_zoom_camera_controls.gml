function scr_zoom_camera_controls()
{
	
	#region /* Initialize buttons */
	var key_in_hold = noone;
	var key_out_hold = noone;
	
	if (global.player_can_play[1])
	{
		var key_in_hold = scr_key_initialize(key_player_zoom_in_hold[1], 0, 1, action.zoom_in);
		var key_out_hold = scr_key_initialize(key_player_zoom_out_hold[1], 0, 1, action.zoom_out);
	}
	else
	if (global.player_can_play[2])
	{
		var key_in_hold = scr_key_initialize(key_player_zoom_in_hold[2], 0, 2, action.zoom_in);
		var key_out_hold = scr_key_initialize(key_player_zoom_out_hold[2], 0, 2, action.zoom_out);
	}
	else
	if (global.player_can_play[3])
	{
		var key_in_hold = scr_key_initialize(key_player_zoom_in_hold[3], 0, 3, action.zoom_in);
		var key_out_hold = scr_key_initialize(key_player_zoom_out_hold[3], 0, 3, action.zoom_out);
	}
	else
	if (global.player_can_play[4])
	{
		var key_in_hold = scr_key_initialize(key_player_zoom_in_hold[4], 0, 4, action.zoom_in);
		var key_out_hold = scr_key_initialize(key_player_zoom_out_hold[4], 0, 4, action.zoom_out);
	}
	#endregion /* Initialize buttons END */
	
	var zoom_speed = 0.015;
	var zoom_minimum = 0.5;
	var base_zoom_maximum = 1.0; /* Set base maximum zoom */
	var display_width = display_get_gui_width();
	var display_height = display_get_gui_height();
	
	if (room_width < display_width || room_height < display_height) /* Check if either the room width or height is less than the screen resolution */
	{
		/* Calculate proportional maximum zoom based on both room width and height */
		var zoom_factor_width = room_width / display_width;
		var zoom_factor_height = room_height / display_height;
		
		var zoom_factor = min(zoom_factor_width, zoom_factor_height); /* Choose the minimum zoom factor to ensure the entire room fits within the screen */
		var dynamic_zoom_maximum = base_zoom_maximum * zoom_factor; /* Calculate dynamic maximum zoom */
		var zoom_maximum = dynamic_zoom_maximum; /* Set the maximum zoom to the calculated value */
	}
	else
	{
		var zoom_maximum = base_zoom_maximum; /* Use the base maximum zoom if both room width and height are equal to or greater than the screen resolution */
	}
	
	var zoom_variable = room == rm_world_map ? global.zoom_world_map : global.zoom_level;
	zoom_variable = clamp(zoom_variable, zoom_minimum, zoom_maximum);
	
	zoom_lerp = lerp(zoom_lerp, zoom_variable, 0.1);
	
	var new_width = min(camera_get_view_width(view_camera[view_current]) * zoom_lerp, room_width);
	var new_height = min(camera_get_view_height(view_camera[view_current]) * zoom_lerp, room_height);
	
	camera_set_view_size(view_camera[view_current], new_width, new_height);
	
	#region /* Zoom in and out controls */
	if (key_in_hold && !key_out_hold)
	{
		global.deactivate_timer = 999; /* Force update deactivate region */
		if (zoom_variable > zoom_minimum)
		{
			if (room == rm_world_map)
			{
				global.zoom_world_map -= zoom_speed;
			}
			else
			{
				global.zoom_level -= zoom_speed;
			}
		}
		else
		{
			zoom_border_lerp = 1;
		}
	}
	else
	if (key_out_hold && !key_in_hold)
	{
		global.deactivate_timer = 999; /* Force update deactivate region */
		if (zoom_variable < zoom_maximum)
		{
			if (room == rm_world_map)
			{
				global.zoom_world_map += zoom_speed;
			}
			else
			{
				global.zoom_level += zoom_speed;
			}
		}
		else
		{
			zoom_border_lerp = 1;
		}
	}
	#endregion /* Zoom in and out controls END */
	
}