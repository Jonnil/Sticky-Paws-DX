function scr_zoom_camera_controls()
{
	/* This script uses normal draw functions so only use it in normal draw event (Not draw GUI) */
	
	key_player1_zoom_in_hold = scr_key_initialize(key_player1_zoom_in_hold, 0, 1, global.player1_key_zoom_in, global.player1_key2_zoom_in, global.player1_gamepad_button_zoom_in, global.player1_gamepad_button2_zoom_in);
	key_player2_zoom_in_hold = scr_key_initialize(key_player2_zoom_in_hold, 0, 2, global.player2_key_zoom_in, global.player2_key2_zoom_in, global.player2_gamepad_button_zoom_in, global.player2_gamepad_button2_zoom_in);
	key_player3_zoom_in_hold = scr_key_initialize(key_player3_zoom_in_hold, 0, 3, global.player3_key_zoom_in, global.player3_key2_zoom_in, global.player3_gamepad_button_zoom_in, global.player3_gamepad_button2_zoom_in);
	key_player4_zoom_in_hold = scr_key_initialize(key_player4_zoom_in_hold, 0, 4, global.player4_key_zoom_in, global.player4_key2_zoom_in, global.player4_gamepad_button_zoom_in, global.player4_gamepad_button2_zoom_in);
	
	key_player1_zoom_out_hold = scr_key_initialize(key_player1_zoom_out_hold, 0, 1, global.player1_key_zoom_out, global.player1_key2_zoom_out, global.player1_gamepad_button_zoom_out, global.player1_gamepad_button2_zoom_out);
	key_player2_zoom_out_hold = scr_key_initialize(key_player2_zoom_out_hold, 0, 2, global.player2_key_zoom_out, global.player2_key2_zoom_out, global.player2_gamepad_button_zoom_out, global.player2_gamepad_button2_zoom_out);
	key_player3_zoom_out_hold = scr_key_initialize(key_player3_zoom_out_hold, 0, 3, global.player3_key_zoom_out, global.player3_key2_zoom_out, global.player3_gamepad_button_zoom_out, global.player3_gamepad_button2_zoom_out);
	key_player4_zoom_out_hold = scr_key_initialize(key_player4_zoom_out_hold, 0, 4, global.player4_key_zoom_out, global.player4_key2_zoom_out, global.player4_gamepad_button_zoom_out, global.player4_gamepad_button2_zoom_out);
	
	#region /* Zoom with joystick */
	//if (gamepad_axis_value(0, gp_axisrv) < 0)
	//or (gamepad_axis_value(0, gp_axisrv) < 0)
	//{
	//	var zoom_speed = abs(gamepad_axis_value(0, gp_axisrv)) * 0.015;
	//}
	//else
	//if (gamepad_axis_value(1, gp_axisrv) < 0)
	//or (gamepad_axis_value(1, gp_axisrv) < 0)
	//{
	//	var zoom_speed = abs(gamepad_axis_value(1, gp_axisrv)) * 0.015;
	//}
	//else
	//if (gamepad_axis_value(2, gp_axisrv) < 0)
	//or (gamepad_axis_value(2, gp_axisrv) < 0)
	//{
	//	var zoom_speed = abs(gamepad_axis_value(2, gp_axisrv)) * 0.015;
	//}
	//else
	//if (gamepad_axis_value(3, gp_axisrv) < 0)
	//or (gamepad_axis_value(3, gp_axisrv) < 0)
	//{
	//	var zoom_speed = abs(gamepad_axis_value(3, gp_axisrv)) * 0.015;
	//}
	#endregion /* Zoom with joystick END */
	
	//else
	//{
		var zoom_speed = 0.015;
	//}
	
	if (room = room_title)
	{
		zoom_lerp = 1; /* In create event, have this: zoom_lerp = 1; */
	}
	else
	if (room = room_world_map)
	{
		zoom_lerp = lerp(zoom_lerp, global.zoom_world_map, 0.1); /* In create event, have this: zoom_lerp = global.zoom_world_map; */
		global.zoom_world_map = clamp(global.zoom_world_map, 0.2, 1);
	}
	else
	{
		zoom_lerp = lerp(zoom_lerp, global.zoom_level, 0.1); /* In create event, have this: zoom_lerp = global.zoom_level; */
		global.zoom_level = clamp(global.zoom_level, 0.2, 1);
	}
	zoom_border_lerp = lerp(zoom_border_lerp, 0, 0.1); /* In create event, have this: zoom_border_lerp = 0; */
	
	if (variable_instance_exists(self, "camera"))
	{
		camera_set_view_size(camera, camera_get_view_width(camera) * zoom_lerp, camera_get_view_height(camera) * zoom_lerp);
	}
	
	if (room != room_title)
	{
		if (key_player1_zoom_in_hold)
		and (!key_player1_zoom_out_hold)
		
		or (key_player2_zoom_in_hold)
		and (!key_player2_zoom_out_hold)
		
		or (key_player3_zoom_in_hold)
		and (!key_player3_zoom_out_hold)
		
		or (key_player4_zoom_in_hold)
		and (!key_player4_zoom_out_hold)
		
		//or (gamepad_axis_value(0, gp_axisrv) < 0)
		//or (gamepad_axis_value(1, gp_axisrv) < 0)
		//or (gamepad_axis_value(2, gp_axisrv) < 0)
		//or (gamepad_axis_value(3, gp_axisrv) < 0)
		{
			if (zoom_lerp > 0.2)
			{
				if (room = room_world_map)
				{
					global.zoom_world_map -= zoom_speed;
					ini_open("config.ini");
					ini_write_real("config", "zoom_world_map", global.zoom_world_map);
					ini_close();
				}
				else
				{
					global.zoom_level -= zoom_speed;
					ini_open("config.ini");
					ini_write_real("config", "zoom_level", global.zoom_level);
					ini_close();
				}
			}
			else
			{
				zoom_border_lerp = 1;
			}
		}
		if (key_player1_zoom_out_hold)
		and (!key_player1_zoom_in_hold)
		
		or (key_player2_zoom_out_hold)
		and (!key_player2_zoom_in_hold)
		
		or (key_player3_zoom_out_hold)
		and (!key_player3_zoom_in_hold)
		
		or (key_player4_zoom_out_hold)
		and (!key_player4_zoom_in_hold)
		
		//or (gamepad_axis_value(0, gp_axisrv) > 0)
		//or (gamepad_axis_value(1, gp_axisrv) > 0)
		//or (gamepad_axis_value(2, gp_axisrv) > 0)
		//or (gamepad_axis_value(3, gp_axisrv) > 0)
		{
			if (zoom_lerp < 1)
			{
				if (room = room_world_map)
				{
					global.zoom_world_map += zoom_speed;
					ini_open("config.ini");
					ini_write_real("config", "zoom_world_map", global.zoom_world_map);
					ini_close();
				}
				else
				{
					global.zoom_level += zoom_speed;
					ini_open("config.ini");
					ini_write_real("config", "zoom_level", global.zoom_level);
					ini_close();
				}
			}
			else
			{
				zoom_border_lerp = lerp(zoom_border_lerp, 0, 0.1);
			}
		}
	}
}