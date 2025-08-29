/* Create an indicator for a touch */
for(var i = 0; i < 10; i += 1)
{
	if (device_mouse_check_button_pressed(i, mb_any))
	{
		with (instance_create_depth(device_mouse_x(i), device_mouse_y(i), 0, obj_finger_indicator))
		{
			my_touch = i;
		}
	}
}

if (instance_exists(obj_finger_indicator))
{
	temp_joystick = instance_nearest(x, y, obj_finger_indicator).my_touch;
}

base_size = 150 * (camera_get_view_width(view_camera[view_current]));
stick_size = base_size * 0.5;

x = camera_get_view_x(view_camera[view_current]) + (base_size * 2);
y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - (base_size * 2);

if (mouse_check_button(mb_any))
{

	var temp_dir = point_direction(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick));
	var_direction = temp_dir;

	#region /* Direction */
	if (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) < (base_size * 2) * var_screen_size)
	{
		var_joystick_active = true;
		var_direction = temp_dir;
		var_x_dir = device_mouse_x(temp_joystick) - x;
		var_y_dir = device_mouse_y(temp_joystick) - y;
		var_x_dir_gui = device_mouse_x(temp_joystick) - x;
		var_y_dir_gui = device_mouse_y(temp_joystick) - y;
	}
	#endregion /* Direction END */

	#region /* Move in Level */
	if (var_joystick_active)
	&& (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) > 10)
	&& (instance_exists(obj_player))
	{

		#region /* Left */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x - 9000, y - 9000, x - 9000, y + 9000))
		{
			obj_player.active_left = true;
		}
		else
		{
			obj_player.active_left = false;
		}
		#endregion /* Left END */

		#region /* Right */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x + 9000, y - 9000, x + 9000, y + 9000))
		{
			obj_player.active_right = true;
		}
		else
		{
			obj_player.active_right = false;
		}
		#endregion /* Right END */

		#region /* Up */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x - 9000, y - 9000, x + 9000, y - 9000))
		{
			obj_player.active_up = true;
		}
		else
		{
			obj_player.active_up = false;
		}
		#endregion /* Up END */

		#region /* Down */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x - 9000, y + 9000, x + 9000, y + 9000))
		{
			obj_player.active_down = true;
		}
		else
		{
			obj_player.active_down = false;
		}
		#endregion /* Down END */

	}
	else
	if (instance_exists(obj_player))
	{
		obj_player.active_left = false;
		obj_player.active_right = false;
		obj_player.active_up = false;
		obj_player.active_down = false;
	}
	#endregion /* Move in Level END */

	#region /* Move in Map */
	if (var_joystick_active)
	&& (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) > 10)
	&& (instance_exists(obj_player_map))
	{

		#region /* Left */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x - 9000, y - 9000, x - 9000, y + 9000))
		{
			obj_player_map.active_left = true;
		}
		else
		{
			obj_player_map.active_left = false;
		}
		#endregion /* Left END */

		#region /* Right */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x + 9000, y - 9000, x + 9000, y + 9000))
		{
			obj_player_map.active_right = true;
		}
		else
		{
			obj_player_map.active_right = false;
		}
		#endregion /* Right END */

		#region /* Up */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x - 9000, y - 9000, x + 9000, y - 9000))
		{
			obj_player_map.active_up = true;
		}
		else
		{
			obj_player_map.active_up = false;
		}
		#endregion /* Up END */

		#region /* Down */
		if (point_in_triangle(device_mouse_x(temp_joystick), device_mouse_y(temp_joystick), x, y, x - 9000, y + 9000, x + 9000, y + 9000))
		{
			obj_player_map.active_down = true;
		}
		else
		{
			obj_player_map.active_down = false;
		}
		#endregion /* Down END */

	}
	else
	if (instance_exists(obj_player_map))
	{
		obj_player_map.active_left = false;
		obj_player_map.active_right = false;
		obj_player_map.active_up = false;
		obj_player_map.active_down = false;
	}
	#endregion /* Move in Map END */

	if (var_joystick_active)
	&& (point_distance(x, y, device_mouse_x(temp_joystick), device_mouse_y(temp_joystick)) > base_size * var_screen_size)
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
