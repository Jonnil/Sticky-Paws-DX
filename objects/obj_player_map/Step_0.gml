#region /* Enter Level */
if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
and (brand_new_file == true)
and (can_move == true)
and (show_demo_over_message == false)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level)) /* Must check if obj_level exists or not */

or (key_a_pressed)
and (global.demo == false)
and (can_move == true)
and (show_demo_over_message == false)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level)) /* Must check if obj_level exists or not */
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed == 0)

or (key_a_pressed)
and (global.demo == true)
and (instance_nearest(x, y, obj_level).level <= global.demo_max_levels)
and (can_move == true)
and (show_demo_over_message == false)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level)) /* Must check if obj_level exists or not */
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed == 0)
{
	if (instance_nearest(x, y, obj_level).clear_rate == "enter")
	or (instance_nearest(x, y, obj_level).clear_rate == "clear")
	{
		
		#region /* Save Player Position */
		x = instance_nearest(x, y, obj_level).x;
		y = instance_nearest(x, y, obj_level).y;
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_write_real("Player", "brand_new_file", false)
		ini_close();
		#endregion /* Save Player Position END */
		
		can_move = false;
		entering_level = true;
		delay = 0;
		score = 0;
		global.spikes_emerge_time = 0;
		global.checkpoint_x = instance_nearest(x, y, obj_level).checkpoint_x;
		global.checkpoint_y = instance_nearest(x, y, obj_level).checkpoint_y;
		with(instance_nearest(x, y, obj_level))
		{
			if (checkpoint_x > 0)
			or(checkpoint_y > 0)
			{
				global.checkpoint_realmillisecond = checkpoint_realmillisecond;
				global.checkpoint_millisecond = checkpoint_millisecond;
				global.checkpoint_second = checkpoint_second;
				global.checkpoint_minute = checkpoint_minute;
			}
		}
		global.big_collectible1 = instance_nearest(x, y, obj_level).big_collectible1;
		global.big_collectible2 = instance_nearest(x, y, obj_level).big_collectible2;
		global.big_collectible3 = instance_nearest(x, y, obj_level).big_collectible3;
		global.big_collectible4 = instance_nearest(x, y, obj_level).big_collectible4;
		global.big_collectible5 = instance_nearest(x, y, obj_level).big_collectible5;
		global.lives_until_assist = instance_nearest(x, y, obj_level).lives_until_assist;
		global.increase_number_of_levels_cleared = instance_nearest(x, y, obj_level).increase_number_of_levels_cleared;
	}
}
else
if (global.demo == true)
and (instance_nearest(x, y, obj_level).level > global.demo_max_levels)
and (key_a_pressed)
and (can_move == true)
and (show_demo_over_message == false)
and (menu_delay == 0)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level))
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed == 0)
and (show_demo_over_message == false)
{
	menu_delay = 3;
	menu = "purchase_now";
	show_demo_over_message = true;
}
#endregion /* Enter Level END */

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay -= 1;
}

if (menu == "purchase_now")
{
	if (key_a_pressed)
	and (menu_delay == 0)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 64, window_get_width() / 2 - 185 + 370, window_get_height() / 2 + 64 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_steam_page));
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	and (menu_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_down)
	and (menu_delay == 0)
	{
		menu = "continue_playing";
		menu_delay = 3;
	}
}
else
if (menu == "continue_playing")
{
	if (key_a_pressed)
	and (menu_delay == 0)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 106, window_get_width() / 2 - 185 + 370, window_get_height() / 2 + 106 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	and (menu_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_up)
	and (menu_delay == 0)
	{
		menu = "purchase_now";
		menu_delay = 3;
	}
}

if (global.goal_active == true)
{
	global.goal_active = false;
}

#region /* Path Turning */

/* 
right down = 0
up right = 1
up left = 2
left down = 3
 */

#region /* Touch Map Turn Right Down */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn == 0) /* Right Down = 0 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = + move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y + move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = + move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x + move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Right Down END */

else

#region /* Touch Map Turn Up Right */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn == 1) /* Up Right = 1 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = - move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y - move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = + move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x + move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Up Right END */

else

#region /* Touch Map Turn Up Left */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 2) /* Up Left = 2 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = - move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y - move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = - move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x - move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Up Left END */

else

#region /* Touch Map Turn Left Down */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 3) /* Left Down = 3 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = + move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y + move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = - move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x - move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Left Down END */

#endregion /* Path Turning END */
