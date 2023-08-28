function scr_zoom_camera_controls()
{
	var key_in_hold_player1 = noone;
	var key_out_hold_player1 = noone;
	var key_in_hold_player2 = noone;
	var key_out_hold_player2 = noone;
	var key_in_hold_player3 = noone;
	var key_out_hold_player3 = noone;
	var key_in_hold_player4 = noone;
	var key_out_hold_player4 = noone;
	
	if (room != rm_world_map)
	{
		if (player1 > 0)
		{
			var key_in_hold_player1 = scr_key_initialize(key_player1_zoom_in_hold, 0, 1, action.zoom_in);
			var key_out_hold_player1 = scr_key_initialize(key_player1_zoom_out_hold, 0, 1, action.zoom_out);
		}
		if (player2 > 0)
		{
			var key_in_hold_player2 = scr_key_initialize(key_player2_zoom_in_hold, 0, 2, action.zoom_in);
			var key_out_hold_player2 = scr_key_initialize(key_player2_zoom_out_hold, 0, 2, action.zoom_out);
		}
		if (player3 > 0)
		{
			var key_in_hold_player3 = scr_key_initialize(key_player3_zoom_in_hold, 0, 3, action.zoom_in);
			var key_out_hold_player3 = scr_key_initialize(key_player3_zoom_out_hold, 0, 3, action.zoom_out);
		}
		if (player4 > 0)
		{
			var key_in_hold_player4 = scr_key_initialize(key_player4_zoom_in_hold, 0, 4, action.zoom_in);
			var key_out_hold_player4 = scr_key_initialize(key_player4_zoom_out_hold, 0, 4, action.zoom_out);
		}
	}
	else
	{
		if (global.player1_can_play == true)
		{
			var key_in_hold_player1 = scr_key_initialize(key_player1_zoom_in_hold, 0, 1, action.zoom_in);
			var key_out_hold_player1 = scr_key_initialize(key_player1_zoom_out_hold, 0, 1, action.zoom_out);
		}
		else
		if (global.player2_can_play == true)
		{
			var key_in_hold_player2 = scr_key_initialize(key_player2_zoom_in_hold, 0, 2, action.zoom_in);
			var key_out_hold_player2 = scr_key_initialize(key_player2_zoom_out_hold, 0, 2, action.zoom_out);
		}
		else
		if (global.player3_can_play == true)
		{
			var key_in_hold_player3 = scr_key_initialize(key_player3_zoom_in_hold, 0, 3, action.zoom_in);
			var key_out_hold_player3 = scr_key_initialize(key_player3_zoom_out_hold, 0, 3, action.zoom_out);
		}
		else
		if (global.player4_can_play == true)
		{
			var key_in_hold_player4 = scr_key_initialize(key_player4_zoom_in_hold, 0, 4, action.zoom_in);
			var key_out_hold_player4 = scr_key_initialize(key_player4_zoom_out_hold, 0, 4, action.zoom_out);
		}
	}
	
	var key_in_hold = [
		key_in_hold_player1,
		key_in_hold_player2,
		key_in_hold_player3,
		key_in_hold_player4
	];
	
	var key_out_hold = [
		key_out_hold_player1,
		key_out_hold_player2,
		key_out_hold_player3,
		key_out_hold_player4
	];
	
	var zoom_speed = 0.015;
	var zoom_minimum = 0.5;
	var zoom_maximum = 1.0;
	
	var zoom_variable = room == rm_world_map ? global.zoom_world_map : global.zoom_level;
	
	zoom_lerp = room == rm_title ? 1 : lerp(zoom_lerp, zoom_variable, 0.1);
	zoom_variable = clamp(zoom_variable, zoom_minimum, zoom_maximum);
	
	zoom_border_lerp = lerp(zoom_border_lerp, 0, 0.1);
	
	var new_width = camera_get_view_width(view_camera[view_current]) * zoom_lerp;
	var new_height = camera_get_view_height(view_camera[view_current]) * zoom_lerp;
	
	if (new_width > room_width && new_height > room_height)
	{
		camera_set_view_size(view_camera[view_current], room_width, room_height);
	}
	else if (new_width > room_width)
	{
		camera_set_view_size(view_camera[view_current], room_width, new_height);
	}
	else if (new_height > room_height)
	{
		camera_set_view_size(view_camera[view_current], new_width, room_height);
	}
	else
	{
		camera_set_view_size(view_camera[view_current], new_width, new_height);
	}
	
	if (room != rm_title)
	{
		if (
			(key_in_hold[0] && !key_out_hold[0]) ||
			(key_in_hold[1] && !key_out_hold[1]) ||
			(key_in_hold[2] && !key_out_hold[2]) ||
			(key_in_hold[3] && !key_out_hold[3])
		)
		{
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
		
		if (
			(key_out_hold[0] && !key_in_hold[0]) ||
			(key_out_hold[1] && !key_in_hold[1]) ||
			(key_out_hold[2] && !key_in_hold[2]) ||
			(key_out_hold[3] && !key_in_hold[3])
		)
		{
			if (
				zoom_variable < zoom_maximum &&
				new_width < room_width &&
				new_height < room_height
			)
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
	}
}