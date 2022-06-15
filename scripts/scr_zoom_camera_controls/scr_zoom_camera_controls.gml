function scr_zoom_camera_controls()
{
	/*This script uses normal draw functions so only use it in normal draw event (Not draw GUI)*/
	if(gamepad_axis_value(0, gp_axisrv) < 0)
	or(gamepad_axis_value(0, gp_axisrv) < 0)
	{
		var zoom_speed = abs(gamepad_axis_value(0, gp_axisrv)) * 0.015;
	}
	else
	if(gamepad_axis_value(1, gp_axisrv) < 0)
	or(gamepad_axis_value(1, gp_axisrv) < 0)
	{
		var zoom_speed = abs(gamepad_axis_value(1, gp_axisrv)) * 0.015;
	}
	else
	if(gamepad_axis_value(2, gp_axisrv) < 0)
	or(gamepad_axis_value(2, gp_axisrv) < 0)
	{
		var zoom_speed = abs(gamepad_axis_value(2, gp_axisrv)) * 0.015;
	}
	else
	if(gamepad_axis_value(3, gp_axisrv) < 0)
	or(gamepad_axis_value(3, gp_axisrv) < 0)
	{
		var zoom_speed = abs(gamepad_axis_value(3, gp_axisrv)) * 0.015;
	}
	else
	{
		var zoom_speed = 0.015;
	}
	if (room = room_title)
	{
		zoom_lerp = 1; /*In create event, have this: zoom_lerp = 1;*/
	}
	else
	if (room = room_world_map)
	{
		zoom_lerp = lerp(zoom_lerp, global.zoom_world_map, 0.1); /*In create event, have this: zoom_lerp = global.zoom_world_map;*/
		global.zoom_world_map = clamp(global.zoom_world_map, 0.2, 1);
	}
	else
	{
		zoom_lerp = lerp(zoom_lerp, global.zoom_level, 0.1); /*In create event, have this: zoom_lerp = global.zoom_level;*/
		global.zoom_level = clamp(global.zoom_level, 0.2, 1);
	}
	zoom_border_lerp = lerp(zoom_border_lerp, 0, 0.1); /*In create event, have this: zoom_border_lerp = 0;*/
	camera_set_view_size(view_camera[view_current], camera_get_view_width(view_camera[view_current]) * zoom_lerp, camera_get_view_height(view_camera[view_current]) * zoom_lerp);
	
	if (room != room_title)
	{
		if (keyboard_check(global.player1_key_zoom_in))
		and (!keyboard_check(global.player1_key_zoom_out))
		or (keyboard_check(global.player2_key_zoom_in))
		and (!keyboard_check(global.player2_key_zoom_out))
		or (keyboard_check(global.player3_key_zoom_in))
		and (!keyboard_check(global.player3_key_zoom_out))
		or (keyboard_check(global.player4_key_zoom_in))
		and (!keyboard_check(global.player4_key_zoom_out))
		or (keyboard_check(global.player1_key2_zoom_in))
		and (!keyboard_check(global.player1_key2_zoom_out))
		or (keyboard_check(global.player2_key2_zoom_in))
		and (!keyboard_check(global.player2_key2_zoom_out))
		or (keyboard_check(global.player3_key2_zoom_in))
		and (!keyboard_check(global.player3_key2_zoom_out))
		or (keyboard_check(global.player4_key2_zoom_in))
		and (!keyboard_check(global.player4_key2_zoom_out))
		
		or (gamepad_button_check(0, global.player1_gamepad_button_zoom_in))
		and (!gamepad_button_check(0, global.player1_gamepad_button_zoom_out))
		or (gamepad_button_check(1, global.player2_gamepad_button_zoom_in))
		and (!gamepad_button_check(1, global.player2_gamepad_button_zoom_out))
		or (gamepad_button_check(2, global.player3_gamepad_button_zoom_in))
		and (!gamepad_button_check(2, global.player3_gamepad_button_zoom_out))
		or (gamepad_button_check(3, global.player4_gamepad_button_zoom_in))
		and (!gamepad_button_check(3, global.player4_gamepad_button_zoom_out))
		or (gamepad_button_check(0, global.player1_gamepad_button2_zoom_in))
		and (!gamepad_button_check(0, global.player1_gamepad_button2_zoom_out))
		or (gamepad_button_check(1, global.player2_gamepad_button2_zoom_in))
		and (!gamepad_button_check(1, global.player2_gamepad_button2_zoom_out))
		or (gamepad_button_check(2, global.player3_gamepad_button2_zoom_in))
		and (!gamepad_button_check(2, global.player3_gamepad_button2_zoom_out))
		or (gamepad_button_check(3, global.player4_gamepad_button2_zoom_in))
		and (!gamepad_button_check(3, global.player4_gamepad_button2_zoom_out))
		
		or(mouse_wheel_up())
		and (!mouse_wheel_down())
		or(gamepad_axis_value(0, gp_axisrv) < 0)
		or(gamepad_axis_value(1, gp_axisrv) < 0)
		or(gamepad_axis_value(2, gp_axisrv) < 0)
		or(gamepad_axis_value(3, gp_axisrv) < 0)
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
		if (keyboard_check(global.player1_key_zoom_out))
		and (!keyboard_check(global.player1_key_zoom_in))
		or (keyboard_check(global.player2_key_zoom_out))
		and (!keyboard_check(global.player2_key_zoom_in))
		or (keyboard_check(global.player3_key_zoom_out))
		and (!keyboard_check(global.player3_key_zoom_in))
		or (keyboard_check(global.player4_key_zoom_out))
		and (!keyboard_check(global.player4_key_zoom_in))
		or (keyboard_check(global.player1_key2_zoom_out))
		and (!keyboard_check(global.player1_key2_zoom_in))
		or (keyboard_check(global.player2_key2_zoom_out))
		and (!keyboard_check(global.player2_key2_zoom_in))
		or (keyboard_check(global.player3_key2_zoom_out))
		and (!keyboard_check(global.player3_key2_zoom_in))
		or (keyboard_check(global.player4_key2_zoom_out))
		and (!keyboard_check(global.player4_key2_zoom_in))
		
		or (gamepad_button_check(0, global.player1_gamepad_button_zoom_out))
		and (!gamepad_button_check(0, global.player1_gamepad_button_zoom_in))
		or (gamepad_button_check(1, global.player2_gamepad_button_zoom_out))
		and (!gamepad_button_check(1, global.player2_gamepad_button_zoom_in))
		or (gamepad_button_check(2, global.player3_gamepad_button_zoom_out))
		and (!gamepad_button_check(2, global.player3_gamepad_button_zoom_in))
		or (gamepad_button_check(3, global.player4_gamepad_button_zoom_out))
		and (!gamepad_button_check(3, global.player4_gamepad_button_zoom_in))
		or (gamepad_button_check(0, global.player1_gamepad_button2_zoom_out))
		and (!gamepad_button_check(0, global.player1_gamepad_button2_zoom_in))
		or (gamepad_button_check(1, global.player2_gamepad_button2_zoom_out))
		and (!gamepad_button_check(1, global.player2_gamepad_button2_zoom_in))
		or (gamepad_button_check(2, global.player3_gamepad_button2_zoom_out))
		and (!gamepad_button_check(2, global.player3_gamepad_button2_zoom_in))
		or (gamepad_button_check(3, global.player4_gamepad_button2_zoom_out))
		and (!gamepad_button_check(3, global.player4_gamepad_button2_zoom_in))
		
		or(mouse_wheel_down())
		and (!mouse_wheel_up())
		or(gamepad_axis_value(0, gp_axisrv) > 0)
		or(gamepad_axis_value(1, gp_axisrv) > 0)
		or(gamepad_axis_value(2, gp_axisrv) > 0)
		or(gamepad_axis_value(3, gp_axisrv) > 0)
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
				zoom_border_lerp = 1;
			}
		}
	}
	if (zoom_lerp < 0.5)
	{
		draw_set_alpha(zoom_border_lerp);
		draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + 2, camera_get_view_x(view_camera[view_current]) + 1, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 3, c_red, c_red, c_red, c_red, false); /*Left*/
		draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 2, 0, room_width*2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 3, c_red, c_red, c_red, c_red, false); /*Right*/
		draw_rectangle_color(2, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 3, camera_get_view_y(view_camera[view_current]) + 1, c_red, c_red, c_red, c_red, false); /*Top*/
		draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 2, room_width*2, room_height*2, c_red, c_red, c_red, c_red, false); /*Bottom*/
		draw_set_alpha(1);
	}
	else
	{
		draw_set_alpha(zoom_border_lerp);
		draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + 9, camera_get_view_x(view_camera[view_current]) + 8, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 9, c_red, c_red, c_red, c_red, false); /*Left*/
		draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 8, 0, room_width*2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 9, c_red, c_red, c_red, c_red, false); /*Right*/
		draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 9, camera_get_view_y(view_camera[view_current]) + 8, c_red, c_red, c_red, c_red, false); /*Top*/
		draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 8, room_width*2, room_height*2, c_red, c_red, c_red, c_red, false); /*Bottom*/
		draw_set_alpha(1);
	}
}