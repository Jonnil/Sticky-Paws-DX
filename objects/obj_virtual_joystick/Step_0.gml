var temp_joystick;

temp_joystick = 0;

base_size = 150 * (camera_get_view_width(view_camera[view_current]) / global.default_view_width);
stick_size = base_size / 2;

x = camera_get_view_x(view_camera[view_current]) + (base_size * 1.5);
y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - (base_size * 1.5);

if (mouse_check_button(mb_left))
{
	var temp_dir = point_direction(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick));
	var_direction = temp_dir;
	
	#region /*Direction*/
	if (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) < base_size * var_screen_size)
	{
		var_joystick_active = true;
		var_direction = temp_dir;
		var_x_dir = device_mouse_x(temp_joystick) - x;
		var_y_dir = device_mouse_y(temp_joystick) - y;
		var_x_dir_gui = device_mouse_x(temp_joystick) - x;
		var_y_dir_gui = device_mouse_y(temp_joystick) - y;
	}
	#endregion /*Direction END*/
	
	#region /*Speed Level*/
	if (var_joystick_active = true)
	and (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) > stick_size * var_screen_size)
	and (instance_exists(obj_player))
	{
		if (device_mouse_x(temp_joystick) < x - stick_size)
		{
			obj_player.active_left = true;
		}
		else
		{
			obj_player.active_left = false;
		}
		if (device_mouse_x(temp_joystick) > x + stick_size)
		{
			obj_player.active_right = true;
		}
		else
		{
			obj_player.active_right = false;
		}
		if (device_mouse_y(temp_joystick) < y - stick_size)
		{
			obj_player.active_up = true;
		}
		else
		{
			obj_player.active_up = false;
		}
		if (device_mouse_y(temp_joystick) > y + stick_size)
		{
			obj_player.active_down = true;
		}
		else
		{
			obj_player.active_down = false;
		}
	}
	else
	if (instance_exists(obj_player))
	{
		obj_player.active_left = false;
		obj_player.active_right = false;
		obj_player.active_up = false;
		obj_player.active_down = false;
	}
	#endregion /*Speed Level END*/
	
	#region /*Speed Map*/
	if (var_joystick_active = true)
	and (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) > stick_size * var_screen_size)
	and (instance_exists(obj_player_map))
	{
		if (device_mouse_x(temp_joystick) < x - stick_size)
		{
			obj_player_map.active_left = true;
		}
		else
		{
			obj_player_map.active_left = false;
		}
		if (device_mouse_x(temp_joystick) > x + stick_size)
		{
			obj_player_map.active_right = true;
		}
		else
		{
			obj_player_map.active_right = false;
		}
		if (device_mouse_y(temp_joystick) < y - stick_size)
		{
			obj_player_map.active_up = true;
		}
		else
		{
			obj_player_map.active_up = false;
		}
		if (device_mouse_y(temp_joystick) > y + stick_size)
		{
			obj_player_map.active_down = true;
		}
		else
		{
			obj_player_map.active_down = false;
		}
	}
	else
	if (instance_exists(obj_player_map))
	{
		obj_player_map.active_left = false;
		obj_player_map.active_right = false;
		obj_player_map.active_up = false;
		obj_player_map.active_down = false;
	}
	#endregion /*Speed Map END*/
	
	if (var_joystick_active = true)
	and (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) > base_size * var_screen_size)
	{
		var_direction = temp_dir;
		var_x_dir = lengthdir_x(base_size * var_screen_size, temp_dir);
		var_y_dir = lengthdir_y(base_size * var_screen_size, temp_dir);
		var_x_dir_gui = lengthdir_x(base_size_gui * var_screen_size, temp_dir);
		var_y_dir_gui = lengthdir_y(base_size_gui * var_screen_size, temp_dir);
	}
}
else
{
	var_joystick_active = false;
	var_x_dir = 0;
	var_y_dir = 0;
	var_x_dir_gui = 0;
	var_y_dir_gui = 0;
	if (instance_exists(obj_player))
	{
		obj_player.active_left = false;
		obj_player.active_right = false;
		obj_player.active_up = false;
		obj_player.active_down = false;
	}
	if (instance_exists(obj_player_map))
	{
		obj_player_map.active_left = false;
		obj_player_map.active_right = false;
		obj_player_map.active_up = false;
		obj_player_map.active_down = false;
	}
}