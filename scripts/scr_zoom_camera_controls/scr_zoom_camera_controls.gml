function scr_zoom_camera_controls()
{

	#region /* Initialize buttons */
	var key_in_hold = noone;
	var key_out_hold = noone;

	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (global.player_can_play[i])
		{
			key_in_hold = scr_key_initialize(key_player_zoom_in_hold[i], 0, i, action.zoom_in);
			key_out_hold = scr_key_initialize(key_player_zoom_out_hold[i], 0, i, action.zoom_out);
			break; /* Exit the loop if a player can play */
		}
	}
	#endregion /* Initialize buttons END */

	var zoom_speed = 0.015;
	var zoom_minimum = 0.5;
	var base_zoom_maximum = 1; /* Set base maximum zoom */
	var display_width = display_get_gui_width();
	var display_height = display_get_gui_height();
	var zoom_maximum = base_zoom_maximum; /* Use the base maximum zoom if both room width and height are equal to or greater than the screen resolution */

	if (room_width < display_width
	|| room_height < display_height) /* Check if either the room width or height is less than the screen resolution */
	{
		/* Calculate proportional maximum zoom based on both room width and height */
		var zoom_factor_width = room_width / display_width;
		var zoom_factor_height = room_height / display_height;

		var zoom_factor = min(zoom_factor_width, zoom_factor_height); /* Choose the minimum zoom factor to ensure the entire room fits within the screen */
		var dynamic_zoom_maximum = base_zoom_maximum * zoom_factor; /* Calculate dynamic maximum zoom */
		zoom_maximum = dynamic_zoom_maximum; /* Set the maximum zoom to the calculated value */
	}

	var zoom_variable = room == rm_world ? global.zoom_world : global.zoom_level;
	zoom_variable = clamp(zoom_variable, zoom_minimum, zoom_maximum);

	zoom_lerp = lerp(zoom_lerp, zoom_variable, 0.1);

	var new_width = min(camera_get_view_width(view_get_camera(view_current)) * zoom_lerp, room_width);
	var new_height = min(camera_get_view_height(view_get_camera(view_current)) * zoom_lerp, room_height);

	camera_set_view_size(view_get_camera(view_current), new_width, new_height);

	#region /* Zoom in and out controls */
	if (key_in_hold && !key_out_hold)
	{
		show_zoom_value = 60 * 3;
		global.deactivate_timer = 999; /* Force update deactivate region */
		if (zoom_variable > zoom_minimum)
		{
			if (room == rm_world)
			{
				global.zoom_world -= zoom_speed;
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
		show_zoom_value = 60 * 3;
		global.deactivate_timer = 999; /* Force update deactivate region */
		if (zoom_variable < zoom_maximum)
		{
			if (room == rm_world)
			{
				global.zoom_world += zoom_speed;
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
