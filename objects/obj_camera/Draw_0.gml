scr_set_screen_size();

scr_zoom_camera_controls();

//draw_text_outlined(x, y- 228, "P1: " +string(player1), global.default_text_size, c_white, c_black, 1);
//draw_text_outlined(x, y - 128, "P2: " +string(player2), global.default_text_size, c_white, c_black, 1);

#region /*Set what controls are used to navigate the menus*/

#region /*Get distance from fake mouse to real mouse*/
var mouse_moving = point_distance(mouse_x_position, mouse_y_position, window_mouse_get_x(), window_mouse_get_y());
#endregion /*Get distance from fake mouse to real mouse END*/

#region /*update positions of fake mouse*/
mouse_x_position = window_mouse_get_x();
mouse_y_position = window_mouse_get_y();
#endregion /*update positions of fake mouse*/

if (keyboard_check(vk_anykey))
or(mouse_check_button(mb_any))
or(mouse_wheel_down())
or(mouse_wheel_up())
or(mouse_moving)
{
	show_controller_input_change_prompt = 0;
	if (global.controls_used_for_menu_navigation = "controller")
	{
		show_keyboard_and_mouse_input_change_prompt = 100;
	}
}

if (keyboard_check(vk_anykey))
{
	global.controls_used_for_menu_navigation = "keyboard";
}

if (mouse_check_button(mb_any))
or(mouse_wheel_down())
or(mouse_wheel_up())
or(mouse_moving)
{
	global.controls_used_for_menu_navigation = "mouse";
}

if (gamepad_button_check(0, gp_face1))
or(gamepad_button_check(0, gp_face2))
or(gamepad_button_check(0, gp_face3))
or(gamepad_button_check(0, gp_face4))
or(gamepad_button_check(0, gp_padd))
or(gamepad_button_check(0, gp_padl))
or(gamepad_button_check(0, gp_padr))
or(gamepad_button_check(0, gp_padu))
or(gamepad_button_check(0, gp_select))
or(gamepad_button_check(0, gp_shoulderl))
or(gamepad_button_check(0, gp_shoulderlb))
or(gamepad_button_check(0, gp_shoulderr))
or(gamepad_button_check(0, gp_shoulderrb))
or(gamepad_button_check(0, gp_start))
or(gamepad_button_check(0, gp_stickl))
or(gamepad_button_check(0, gp_stickr))
or(gamepad_axis_value(0, gp_axislh)<> 0)
or(gamepad_axis_value(0, gp_axislv)<> 0)
or(gamepad_axis_value(0, gp_axisrh)<> 0)
or(gamepad_axis_value(0, gp_axisrv)<> 0)
{
	show_keyboard_and_mouse_input_change_prompt = 0;
	if (global.controls_used_for_menu_navigation != "controller")
	{
		global.controls_used_for_menu_navigation = "controller";
		show_controller_input_change_prompt = 100;
	}
}
#endregion /*Set what controls are used to navigate the menus END*/

if (room = room_leveleditor)
{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
}

#region /*Make background visible*/
if (room = room_leveleditor)
{
	if (global.custom_background1> noone)
	and (global.enable_background_layer1 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background")), false)
	}

	if (global.custom_background2> noone)
	and (global.enable_background_layer2 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), false)
	}

	if (global.custom_background3> noone)
	and (global.enable_background_layer3 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), false)
	}

	if (global.custom_background4> noone)
	and (global.enable_background_layer4 = true)
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), true)
	}
	else
	{
		layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), false)
	}
}
#endregion /*Make background visible END*/

#region /*Spawn Players in multiplayer*/
if (instance_exists(obj_player))
and (global.pause = false)
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	with(obj_player)
	{
		if (!place_meeting(x, y, obj_wall))
		and (!place_meeting(x, y - 16, obj_wall))
		{
			obj_camera.can_spawn_player = true;
		}
		else
		{
			obj_camera.can_spawn_player = false;
		}
	}
	if (gamepad_button_check_pressed(0, gp_face1))
	or(keyboard_check_pressed(global.player1_key_jump))
	or(keyboard_check_pressed(global.player1_key2_jump))
	{
		if (player1 <= 0)
		and (can_spawn_player = true)
		and (can_spawn_player1 = true)
		and (lives > 0)
		{
			if (global.player1_can_play = false)
			{
				global.player1_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player1 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player);
				with(player1)
				{
					custom_character = global.character_for_player_1;
					selected_voice_pack = global.voicepack_for_player_1;
					selected_skin = global.skin_for_player_1;
					player = 1;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(1, gp_face1))
	or(keyboard_check_pressed(global.player2_key_jump))
	or(keyboard_check_pressed(global.player2_key2_jump))
	{
		if (player2 <= 0)
		and (can_spawn_player = true)
		and (can_spawn_player2 = true)
		and (lives > 0)
		{
			if (global.player2_can_play = false)
			{
				global.player2_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player2 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player2)
				{
					custom_character = global.character_for_player_2;
					selected_voice_pack = global.voicepack_for_player_2;
					selected_skin = global.skin_for_player_2;
					player = 2;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(2, gp_face1))
	or(keyboard_check_pressed(global.player3_key_jump))
	or(keyboard_check_pressed(global.player3_key2_jump))
	{
		if (player3 <= 0)
		and (can_spawn_player = true)
		and (can_spawn_player3 = true)
		and (lives > 0)
		{
			if (global.player3_can_play = false)
			{
				global.player3_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player3 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player3)
				{
					custom_character = global.character_for_player_3;
					selected_voice_pack = global.voicepack_for_player_3;
					selected_skin = global.skin_for_player_3;
					player = 3;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(3, gp_face1))
	or(keyboard_check_pressed(global.player4_key_jump))
	or(keyboard_check_pressed(global.player4_key2_jump))
	{
		if (player4 <= 0)
		and (can_spawn_player = true)
		and (can_spawn_player4 = true)
		and (lives > 0)
		{
			if (global.player4_can_play = false)
			{
				global.player4_can_play = true;
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				player4 = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player)
				with(player4)
				{
					custom_character = global.character_for_player_4;
					selected_voice_pack = global.voicepack_for_player_4;
					selected_skin = global.skin_for_player_4;
					player = 4;
				}
			}
		}
		else
		if (lives <= 0)
		{
			global.hud_show_lives = true;
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
}
#endregion /*Spawn Players in multiplayer END*/

#region /*Timer Countup*/
if (asset_get_type("obj_goal") == asset_object)
and (instance_exists(obj_goal))
and (obj_goal.goal = false)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.allow_timeattack = true)
and (global.pause = false)
{
	if (instance_exists(obj_player))
	{
		global.timeattack_millisecond += 1;
	}

	global.timeattack_realmillisecond += 1;
	if (global.timeattack_millisecond > 60)
	{
		global.timeattack_millisecond = 0;
		global.timeattack_second += 1;
	}
	if (global.timeattack_second > 59)
	{
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute += 1;
	}
}
else
if (asset_get_type("obj_goal") == asset_object)
and (global.pause = false)
{
	if (instance_exists(obj_goal))
	and (obj_goal.goal = false)
	or(!instance_exists(obj_goal))
	{
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (obj_player.allow_timeattack = true)
		{
			if (instance_exists(obj_player))
			{
				global.timeattack_millisecond += 1;
			}
			global.timeattack_realmillisecond += 1;
			if (global.timeattack_millisecond > 60)
			{
				global.timeattack_millisecond = 0;
				global.timeattack_second += 1;
			}
			if (global.timeattack_second > 59)
			{
				global.timeattack_millisecond = 0;
				global.timeattack_second = 0;
				global.timeattack_minute += 1;
			}
		}
	}
}
#endregion /*Timer Countup*/

#region /*Time Countdown*/
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (global.pause = false)
{
	if (asset_get_type("obj_goal") == asset_object)
	{
		if (instance_exists(obj_goal))
		and (obj_goal.goal = false)
		or(!instance_exists(obj_goal))
		{
			time_second += 1;
			if (time_second > room_speed)
			{
				time_second = 0;
				global.time_countdown_bonus -= 1;
				if (obj_player.allow_timeup = true)
				{
					global.time_countdown -= 1;
				}
			}
		}
	}
}
#endregion /*Time Countdown END*/

room_speed = global.max_fps; /*Room Speed is max fps*/
global.spikes_emerge_time += 1;
if (global.spikes_emerge_time >= room_speed * 6)
{
	global.spikes_emerge_time = 0;
}

/*Stop the screen from scrolling left if scrolling left isn't allowed*/
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.stop_screen_from_scrolling_left = true)
{
	if (x > scrolling_left)
	{
		scrolling_left = x;
	}
	if (x < scrolling_left)
	{
		x = scrolling_left;
	}
}

#region /*Fullscreen Toggle. Default: F11*/
if (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle. Default: F11 END*/

if (save_level_as_png = false)
{
	if (shake > 0)
	{
		x = x + random_range(-shake, + shake);
		y = y + random_range(-shake, + shake);
		shake = lerp(shake, 0, 0.1);
	}

	x = lerp(x, xx, 0.1);
	y = lerp(y, yy, 0.1);

	#region /*Boss Battle Camera*/
	if (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_boss") == asset_object)
	and (instance_exists(obj_player))
	and (instance_exists(obj_boss))
	and (distance_to_object(obj_boss) < 500)
	and (global.player_has_entered_goal = false)
	{

		view_wview_lerp = lerp(0, 0, 0.05);
		view_hview_lerp = lerp(0, 0, 0.05);

		if (instance_exists(player1))
		{
			xx = mean(player1.x, obj_boss.x);
			yy = mean(player1.y, obj_boss.y);
		}
		else
		if (instance_exists(player2))
		{
			xx = mean(player2.x, obj_boss.x);
			yy = mean(player2.y, obj_boss.y);
		}
		else
		if (instance_exists(player3))
		{
			xx = mean(player3.x, obj_boss.x);
			yy = mean(player3.y, obj_boss.y);
		}
		else
		if (instance_exists(player4))
		{
			xx = mean(player4.x, obj_boss.x);
			yy = mean(player4.y, obj_boss.y);
		}
	}
	#endregion /*Boss Battle Camera END*/
	
	else
	
	#region /*ONE PLAYER CAMERA*/
	if (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_camera") == asset_object)
	and (instance_number(obj_player) = 1)
	and (global.player_has_entered_goal = false)
	{
		
		/*Tries to be a bit ahead of player*/
		obj_camera.xx = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).x + instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).hspeed * 15;
		with(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player))
		{
			if (place_meeting(x, y + 1, obj_wall))
			or(asset_get_type("obj_semisolid_platform") == asset_object)
			and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			and (vspeed >= 0)
			{
				obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y
			}
			else
			if (y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				obj_camera.yy -= abs(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).vspeed);
			}
		}
		if (instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).wall_jump = true) or(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).climb = true)
		{
			obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y
		}
		if (instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
		{
			obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y;
		}

		#region /*Follow Player in y position when doing specific things*/
		
		#region /*When Player is in water*/
		with(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player))
		{
			if (instance_nearest(x, y, obj_player).in_water = true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y;
					}
				}
			}
		}
		#endregion /*When Player is in water END*/
		
		#region /*When Player climbing up wall*/
		with(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player))
		{
			if (stick_to_wall = true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y;
					}
				}
			}
		}
		#endregion /*When Player climbing up wall END*/
		
		#region /*When Player is jumping on springs*/
		with(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player))
		{
			if (spring = true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y;
					}
				}
			}
		}
		#endregion /*When Player is jumping on springs END*/
		
		#region /*When Player is climbing*/
		with(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player))
		{
			if (climb = true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y;
					}
				}
			}
		}
		#endregion /*When Player is climbing END*/
		
		#region /*When Player is climbing horizontal rope*/
		with(instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player))
		{
			if (horizontal_rope_climb = true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						obj_camera.yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player).y;
					}
				}
			}
		}
		#endregion /*When Player is climbing horizontal rope END*/
		
		#endregion /*Follow Player in y position when doing specific things END*/

		view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
		view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
	}
	#endregion /*ONE PLAYER CAMERA END*/
	
	else
	
	#region /*MULTIPLAYER CAMERA*/
	if (asset_get_type("obj_player") == asset_object)
	and (instance_number(obj_player) >= 2)
	and (global.player_has_entered_goal = false)
	{
		
		#region /*Camera should follow multiple players*/
		
		/* 1, 2, 3, 4 */
		if (instance_exists(player1))
		and (instance_exists(player2))
		and (instance_exists(player3))
		and (instance_exists(player4))
		{
			xx = mean(player1.x, player2.x, player3.x, player4.x);
			yy = mean(player1.y, player2.y, player3.y, player4.y);
		}
		
		else
		
		/* 1, 2, 3*/
		if (instance_exists(player1))
		and (instance_exists(player2))
		and (instance_exists(player3))
		
		{
			xx = mean(player1.x, player2.x, player3.x);
			yy = mean(player1.y, player2.y, player3.y);
		}
		
		else
		
		/* 1, 2*/
		if (instance_exists(player1))
		and (instance_exists(player2))
		{
			xx = mean(player1.x, player2.x);
			yy = mean(player1.y, player2.y);
		}
		
		else
		
		/* 1, 3*/
		if (instance_exists(player1))
		and (instance_exists(player3))
		{
			xx = mean(player1.x, player3.x);
			yy = mean(player1.y, player3.y);
		}
		
		else
		
		/* 1, 4 */
		if (instance_exists(player1))
		and (instance_exists(player4))
		{
			xx = mean(player1.x, player4.x);
			yy = mean(player1.y, player4.y);
		}
		
		else
		
		/* 2, 3*/
		if (instance_exists(player2))
		and (instance_exists(player3))
		{
			xx = mean(player2.x, player3.x);
			yy = mean(player2.y, player3.y);
		}
		
		else
		
		/* 2, 4 */
		if (instance_exists(player2))
		and (instance_exists(player4))
		{
			xx = mean(player2.x, player4.x);
			yy = mean(player2.y, player4.y);
		}
		
		else
		
		/* 3, 4 */
		if (instance_exists(player3))
		and (instance_exists(player4))
		{
			xx = mean(player3.x, player4.x);
			yy = mean(player3.y, player4.y);
		}
		
		else
		
		#region /*Just in case something goes wrong, just follow one player*/
		/* 1*/
		if (instance_exists(player1))
		{
			xx = player1.x;
			yy = player1.y;
		}
		
		else
		
		/* 2*/
		if (instance_exists(player2))
		{
			xx = player2.x;
			yy = player2.y;
		}
		
		else
		
		/* 3*/
		if (instance_exists(player3))
		{
			xx = player3.x;
			yy = player3.y;
		}
		
		else
		
		/* 4 */
		if (instance_exists(player4))
		{
			xx = player4.x;
			yy = player4.y;
		}
		
		else
		
		/*nothing*/
		{
			xx = x;
			yy = y;
		}
		#endregion /*Just in case something goes wrong, just follow one player*/
		
		#endregion /*Camera should follow multiple players END*/
		
		#region /*Zoom out the view when players are going outside view*/
		/* if (instance_nearest(x, 0, obj_player).y < camera_get_view_y(view_camera[view_current]) + 32)
		and (fps_real >= global.max_fps)
		or(instance_nearest(x, room_height, obj_player).y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32)
		and (fps_real >= global.max_fps)
		or(instance_nearest(0, room_height / 2, obj_player).x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 - 320)
		and (instance_nearest(room_width, room_height / 2, obj_player).x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + 320)
		and (fps_real >= global.max_fps)
		or(instance_nearest(room_width / 2, 0, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 - 320)
		and (instance_nearest(room_width / 2, room_height, obj_player).y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 320)
		and (fps_real >= global.max_fps)
		{
			if (camera_get_view_height(view_camera[view_current]) < room_height)
			and (camera_get_view_width(view_camera[view_current]) < room_width)
			{
				view_wview_lerp = lerp(view_wview_lerp, 10, 0.005);
				view_hview_lerp = lerp(view_hview_lerp, 10, 0.005);
			}
			else
			{
				view_wview_lerp = lerp(view_wview_lerp, 0, 0.005);
				view_hview_lerp = lerp(view_hview_lerp, 0, 0.005);
			}
		}
		else
		{
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.005);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.005);
		}*/
		#endregion /*Zoom out the view when players are going outside view END*/
		
	}
	#endregion /*MULTIPLAYER CAMERA*/
	
	else
	
	#region /*Camera when you win level*/
	if (global.player_has_entered_goal = true)
	and (instance_exists(obj_goal))
	{
		xx = mean(instance_nearest(obj_goal.x, obj_goal.y, obj_player).x, obj_goal.x);
		yy = mean(instance_nearest(obj_goal.x, obj_goal.y, obj_player).y, obj_goal.y);
	}
	#endregion /*Camera when you win level END*/
	
	/* iris*/
	if (allow_iris = true)
	{
		if (delay <= 1)
		{
			/*Makes the screen black when starting a level so you don't see the level loading in. Also make sure this black rectangle is bigger than the level, in case the level is smaller than the view size*/
			draw_rectangle_color(0, 0, room_width* 3, room_height* 3, c_black, c_black, c_black, c_black, false);
		}

		#region /*Zoom In Player Goal*/
		if (asset_get_type("obj_player") == asset_object)
		and (asset_get_type("obj_goal") == asset_object)
		and (instance_exists(obj_player))
		and (instance_exists(obj_goal))
		and (instance_nearest(room_width, y, obj_player).goal = true)
		and (global.time_countdown_bonus <= 0)
		{
			if (iris_zoom = 1)
			{
				iris_xscale = lerp(iris_xscale, 1, 0.15);
				iris_yscale = lerp(iris_yscale, 1, 0.15);
				if (iris_xscale <= 1.1)
				{
					iris_zoom = 0;
				}
			}
			else
			{
				iris_xscale = lerp(iris_xscale, 0, 0.15);
				iris_yscale = lerp(iris_yscale, 0, 0.15);
				if (iris_xscale <= 1.1)
				{
					iris_zoom = 0;
				}
			}
		}
		#endregion /*Zoom In Player Goal END*/

		#region /*Zoom In Player Map*/
		else
		if (asset_get_type("obj_player_map") == asset_object)
		and (instance_exists(obj_player_map))
		and (obj_player_map.entering_level = true)
		{
			if (iris_zoom = 1)
			{
				iris_xscale = lerp(iris_xscale, 1, 0.15);
				iris_yscale = lerp(iris_yscale, 1, 0.15);
				if (iris_xscale <= 1.1)
				{
					iris_zoom = 0;
				}
			}
			else
			{
				iris_xscale = lerp(iris_xscale, 0, 0.15);
				iris_yscale = lerp(iris_yscale, 0, 0.15);
				if (iris_xscale <= 1.1)
				{
					iris_zoom = 0;
				}
			}
		}
		#endregion /*Zoom In Player Map END*/
		
		else
		
		#region /*Zoom Out*/
		if (iris_zoom = 0)
		{
			iris_xscale = lerp(iris_xscale, 1, 0.15);
			iris_yscale = lerp(iris_yscale, 1, 0.15);
			if (iris_xscale >= 0.99)
			{
				iris_zoom = 1;
			}
		}
		else
		{
			iris_xscale = lerp(iris_xscale, 32, 0.015);
			iris_yscale = lerp(iris_yscale, 32, 0.015);
			if (iris_xscale >= 0.99)
			{
				iris_zoom = 1;
			}
		}
		#endregion /*Zoom Out END*/

	}
}

#region /*Draw Iris Transitions*/
if (global.enable_transitions = true)
and (global.play_edited_level = false)
and (global.actually_play_edited_level = false)
or(global.enable_transitions = true)
and (global.play_edited_level = true)
and (global.actually_play_edited_level = true)
{
	if (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	and (asset_get_type("obj_title") == asset_object)
	and (!instance_exists(obj_title))
	and (iris_xscale < 31)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, 0, instance_nearest(room_width, y, obj_player).x, instance_nearest(room_width, y, obj_player).y, iris_xscale, iris_yscale, 0, c_black, 1);
		}
		draw_rectangle_color(0, 0, room_width, instance_nearest(room_width, y, obj_player).y - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, instance_nearest(room_width, y, obj_player).x - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(instance_nearest(room_width, y, obj_player).x + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, instance_nearest(room_width, y, obj_player).y + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
	}
	else
	if (iris_xscale < 15)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, iris_xscale, iris_yscale, 0, c_black, 1);
		}
		draw_rectangle_color(0, 0, room_width, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /*Draw Iris Transitions END*/
/* iris END*/

scr_parallax_scrolling_background();

#region /*Tongue aim should always be above everything, it represents the mouse cursor*/
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (player1 >= 1)
and (can_spawn_player1 = true)
{
	if (player1.allow_tongue = true)
	and (player1.can_tongue = true)
	and (player1.climb = false)
	and (player1.horizontal_rope_climb = false)
	{
		#region /*Draw aim cursor with lines*/
		draw_line_width_color(mouse_x - 10, mouse_y, mouse_x - 2, mouse_y, 2, c_red, c_red);
		draw_line_width_color(mouse_x + 2, mouse_y, mouse_x + 10, mouse_y, 2, c_red, c_red);
		draw_line_width_color(mouse_x, mouse_y - 10, mouse_x, mouse_y - 2, 2, c_red, c_red);
		draw_line_width_color(mouse_x, mouse_y + 2, mouse_x, mouse_y + 10, 2, c_red, c_red);
		#endregion /*Draw aim cursor with lines END*/
	}
	else
	if (player1.allow_tongue = true)
	{
		#region /*Draw aim cursor with lines but transparent*/
		draw_set_alpha(0.5);
		draw_line_width_color(mouse_x - 10, mouse_y, mouse_x - 2, mouse_y, 2, c_red, c_red);
		draw_line_width_color(mouse_x + 2, mouse_y, mouse_x + 10, mouse_y, 2, c_red, c_red);
		draw_line_width_color(mouse_x, mouse_y - 10, mouse_x, mouse_y - 2, 2, c_red, c_red);
		draw_line_width_color(mouse_x, mouse_y + 2, mouse_x, mouse_y + 10, 2, c_red, c_red);
		draw_set_alpha(1);
		#endregion /*Draw aim cursor with lines END*/
	}
}
#endregion /*Tongue aim should always be above everything, it represents the mouse cursor END*/

#region /*Rain Effect*/
if (rain = true)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
{
	if (floor(random(10 - 1)) = 0)
	{
		effect_create_above(ef_rain, x, y, 2, c_white);
	}
}
#endregion /*Rain Effect END*/

///Multiplayer - Has pressed keys

#region /*Player 1 Show Controls HUD timer*/
if (player1 >= 1)
and (can_spawn_player1 = true)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (iris_xscale >= 10)
{
	if (global.player1_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player1_show_controls >= 1)
	and (global.player1_show_controls <= 9)
	{
		if (player1_show_controls_timer >= 1)
		{
			player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
			player1_show_controls_timer -= 1;
		}
		if (player1_show_controls_timer <= 0)
		{
			player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player1_show_controls = 10)
	{
		player1_show_controls_alpha = lerp(player1_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player1_key_up))
	or(keyboard_check(global.player1_key2_up))
	or(gamepad_button_check(0, gp_padu))
	or(gamepad_axis_value(0, gp_axislv) < 0)
	or(keyboard_check(global.player1_key_left))
	or(keyboard_check(global.player1_key2_left))
	or(gamepad_button_check(0, gp_padl))
	or(gamepad_axis_value(0, gp_axislh) < 0)
	or(keyboard_check(global.player1_key_right))
	or(keyboard_check(global.player1_key2_right))
	or(gamepad_button_check(0, gp_padr))
	or(gamepad_axis_value(0, gp_axislh) > 0)
	or(keyboard_check(global.player1_key_down))
	or(keyboard_check(global.player1_key2_down))
	or(gamepad_button_check(0, gp_padd))
	or(gamepad_axis_value(0, gp_axislv) > 0)
	or(gamepad_button_check(0, gp_face1))
	or(gamepad_button_check(0, gp_face2))
	or(keyboard_check(global.player1_key_jump))
	or(keyboard_check(global.player1_key2_jump))
	or(gamepad_button_check(0, gp_face3))
	or(gamepad_button_check(0, gp_face4))
	or(keyboard_check(global.player1_key_sprint))
	or(keyboard_check(global.player1_key2_sprint))
	
	or(keyboard_check(global.player1_key_sprint_toggle))
	or(keyboard_check(global.player1_key2_sprint_toggle))
	or(keyboard_check(global.player1_key_crouch))
	or(keyboard_check(global.player1_key2_crouch))
	or(keyboard_check(global.player1_key_crouch_toggle))
	or(keyboard_check(global.player1_key2_crouch_toggle))
	or(keyboard_check(global.player1_key_dive))
	or(keyboard_check(global.player1_key2_dive))
	or(keyboard_check(global.player1_key_tongue))
	or(keyboard_check(global.player1_key2_tongue))
	{
		player1_show_controls_timer = room_speed * global.player1_show_controls;
	}
}
else
{
	player1_show_controls_alpha = lerp(player1_show_controls_alpha, 0, 0.2);
	player1_show_controls_timer = room_speed * global.player1_show_controls;
}
#endregion /*Player 1 Show Controls HUD timer*/

#region /*Player 2 Show Controls HUD timer*/
if (player2 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (iris_xscale >= 10)
{
	if (global.player2_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player2_show_controls >= 1)
	and (global.player2_show_controls <= 9)
	{
		if (player2_show_controls_timer >= 1)
		{
			player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
			player2_show_controls_timer -= 1;
		}
		if (player2_show_controls_timer <= 0)
		{
			player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player2_show_controls = 10)
	{
		player2_show_controls_alpha = lerp(player2_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player2_key_up))
	or(keyboard_check(global.player2_key2_up))
	or(gamepad_button_check(1, gp_padu))
	or(gamepad_axis_value(1, gp_axislv) < 0)
	or(keyboard_check(global.player2_key_left))
	or(keyboard_check(global.player2_key2_left))
	or(gamepad_button_check(1, gp_padl))
	or(gamepad_axis_value(1, gp_axislh) < 0)
	or(keyboard_check(global.player2_key_right))
	or(keyboard_check(global.player2_key2_right))
	or(gamepad_button_check(1, gp_padr))
	or(gamepad_axis_value(1, gp_axislh) > 0)
	or(keyboard_check(global.player2_key_down))
	or(keyboard_check(global.player2_key2_down))
	or(gamepad_button_check(1, gp_padd))
	or(gamepad_axis_value(1, gp_axislv) > 0)
	or(gamepad_button_check(1, gp_face1))
	or(gamepad_button_check(1, gp_face2))
	or(keyboard_check(global.player2_key_jump))
	or(keyboard_check(global.player2_key2_jump))
	or(gamepad_button_check(1, gp_face3))
	or(gamepad_button_check(1, gp_face4))
	or(keyboard_check(global.player2_key_sprint))
	or(keyboard_check(global.player2_key2_sprint))
	
	or(keyboard_check(global.player2_key_sprint_toggle))
	or(keyboard_check(global.player2_key2_sprint_toggle))
	or(keyboard_check(global.player2_key_crouch))
	or(keyboard_check(global.player2_key2_crouch))
	or(keyboard_check(global.player2_key_crouch_toggle))
	or(keyboard_check(global.player2_key2_crouch_toggle))
	or(keyboard_check(global.player2_key_dive))
	or(keyboard_check(global.player2_key2_dive))
	or(keyboard_check(global.player2_key_tongue))
	or(keyboard_check(global.player2_key2_tongue))
	{
		player2_show_controls_timer = room_speed * global.player2_show_controls;
	}
}
else
{
	player2_show_controls_alpha = lerp(player2_show_controls_alpha, 0, 0.2);
	player2_show_controls_timer = room_speed * global.player2_show_controls;
}
#endregion /*Player 2 Show Controls HUD timer*/

#region /*Player 3 Show Controls HUD timer*/
if (player3 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (iris_xscale >= 10)
{
	if (global.player3_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player3_show_controls >= 1)
	and (global.player3_show_controls <= 9)
	{
		if (player3_show_controls_timer >= 1)
		{
			player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
			player3_show_controls_timer -= 1;
		}
		if (player3_show_controls_timer <= 0)
		{
			player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player3_show_controls = 10)
	{
		player3_show_controls_alpha = lerp(player3_show_controls_alpha, 1, 0.2);
	}

	if (keyboard_check(global.player3_key_up))
	or(keyboard_check(global.player3_key2_up))
	or(gamepad_button_check(2, gp_padu))
	or(gamepad_axis_value(2, gp_axislv) < 0)
	or(keyboard_check(global.player3_key_left))
	or(keyboard_check(global.player3_key2_left))
	or(gamepad_button_check(2, gp_padl))
	or(gamepad_axis_value(2, gp_axislh) < 0)
	or(keyboard_check(global.player3_key_right))
	or(keyboard_check(global.player3_key2_right))
	or(gamepad_button_check(2, gp_padr))
	or(gamepad_axis_value(2, gp_axislh) > 0)
	or(keyboard_check(global.player3_key_down))
	or(keyboard_check(global.player3_key2_down))
	or(gamepad_button_check(2, gp_padd))
	or(gamepad_axis_value(2, gp_axislv) > 0)
	or(gamepad_button_check(2, gp_face1))
	or(gamepad_button_check(2, gp_face2))
	or(keyboard_check(global.player3_key_jump))
	or(keyboard_check(global.player3_key2_jump))
	or(gamepad_button_check(2, gp_face3))
	or(gamepad_button_check(2, gp_face4))
	or(keyboard_check(global.player3_key_sprint))
	or(keyboard_check(global.player3_key2_sprint))
	
	or(keyboard_check(global.player3_key_sprint_toggle))
	or(keyboard_check(global.player3_key2_sprint_toggle))
	or(keyboard_check(global.player3_key_crouch))
	or(keyboard_check(global.player3_key2_crouch))
	or(keyboard_check(global.player3_key_crouch_toggle))
	or(keyboard_check(global.player3_key2_crouch_toggle))
	or(keyboard_check(global.player3_key_dive))
	or(keyboard_check(global.player3_key2_dive))
	or(keyboard_check(global.player3_key_tongue))
	or(keyboard_check(global.player3_key2_tongue))
	{
		player3_show_controls_timer = room_speed * global.player3_show_controls;
	}
}
else
{
	player3_show_controls_alpha = lerp(player3_show_controls_alpha, 0, 0.2);
	player3_show_controls_timer = room_speed * global.player3_show_controls;
}
#endregion /*Player 3 Show Controls HUD timer*/

#region /*Player 4 Show Controls HUD timer*/
if (player4 >= 1)
and (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (iris_xscale >= 10)
{
	if (global.player4_show_controls = 0)
	or(obj_player.can_move = false)
	{
		player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
	}
	else
	if (global.player4_show_controls >= 1)
	and (global.player4_show_controls <= 9)
	{
		if (player4_show_controls_timer >= 1)
		{
			player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
			player4_show_controls_timer -= 1;
		}
		if (player4_show_controls_timer <= 0)
		{
			player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.1);
		}
	}
	else
	if (global.player4_show_controls = 10)
	{
		player4_show_controls_alpha = lerp(player4_show_controls_alpha, 1, 0.1);
	}

	if (keyboard_check(global.player4_key_up))
	or(keyboard_check(global.player4_key2_up))
	or(gamepad_button_check(3, gp_padu))
	or(gamepad_axis_value(3, gp_axislv) < 0)
	or(keyboard_check(global.player4_key_left))
	or(keyboard_check(global.player4_key2_left))
	or(gamepad_button_check(3, gp_padl))
	or(gamepad_axis_value(3, gp_axislh) < 0)
	or(keyboard_check(global.player4_key_right))
	or(keyboard_check(global.player4_key2_right))
	or(gamepad_button_check(3, gp_padr))
	or(gamepad_axis_value(3, gp_axislh) > 0)
	or(keyboard_check(global.player4_key_down))
	or(keyboard_check(global.player4_key2_down))
	or(gamepad_button_check(3, gp_padd))
	or(gamepad_axis_value(3, gp_axislv) > 0)
	or(gamepad_button_check(3, gp_face1))
	or(gamepad_button_check(3, gp_face2))
	or(keyboard_check(global.player4_key_jump))
	or(keyboard_check(global.player4_key2_jump))
	or(gamepad_button_check(3, gp_face3))
	or(gamepad_button_check(3, gp_face4))
	or(keyboard_check(global.player4_key_sprint))
	or(keyboard_check(global.player4_key2_sprint))
	
	or(keyboard_check(global.player4_key_sprint_toggle))
	or(keyboard_check(global.player4_key2_sprint_toggle))
	or(keyboard_check(global.player4_key_crouch))
	or(keyboard_check(global.player4_key2_crouch))
	or(keyboard_check(global.player4_key_crouch_toggle))
	or(keyboard_check(global.player4_key2_crouch_toggle))
	or(keyboard_check(global.player4_key_dive))
	or(keyboard_check(global.player4_key2_dive))
	or(keyboard_check(global.player4_key_tongue))
	or(keyboard_check(global.player4_key2_tongue))
	{
		player4_show_controls_timer = room_speed * global.player4_show_controls;
	}
}
else
{
	player4_show_controls_alpha = lerp(player4_show_controls_alpha, 0, 0.2);
	player4_show_controls_timer = room_speed * global.player4_show_controls;
}
#endregion /*Player 4 Show Controls HUD timer*/

#region /*Sprint Toggling*/
if (keyboard_check_pressed(global.player1_key_sprint_toggle))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 100;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player1_sprint_toggle = false)
	{
		global.player1_sprint_toggle = true;
	}
	else
	{
		global.player1_sprint_toggle = false;
	}
}
if (keyboard_check_pressed(global.player2_key_sprint_toggle))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 100;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player2_sprint_toggle = false)
	{
		global.player2_sprint_toggle = true;
	}
	else
	{
		global.player2_sprint_toggle = false;
	}
}
if (keyboard_check_pressed(global.player3_key_sprint_toggle))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 100;
	show_sprint_toggle_for_player4 = 0;
	if (global.player3_sprint_toggle = false)
	{
		global.player3_sprint_toggle = true;
	}
	else
	{
		global.player3_sprint_toggle = false;
	}
}
if (keyboard_check_pressed(global.player4_key_sprint_toggle))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 100;
	if (global.player4_sprint_toggle = false)
	{
		global.player4_sprint_toggle = true;
	}
	else
	{
		global.player4_sprint_toggle = false;
	}
}
draw_set_halign(fa_left);
draw_set_valign(fa_center);
if (show_sprint_toggle_for_player1> 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 -= 1;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player1_can_play = true)
	{
		if (global.player1_sprint_toggle = true)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Always Run: True", global.default_text_size, c_white, c_black, 1);
		}
		else
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Always Run: False", global.default_text_size, c_white, c_black, 1);
		}
	}
	else
	{
		if (global.player1_sprint_toggle = true)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 1 Always Run: True", global.default_text_size, c_white, c_black, 1);
		}
		else
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 1 Always Run: False", global.default_text_size, c_white, c_black, 1);
		}
	}
}
if (show_sprint_toggle_for_player2> 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 -= 1;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player2_sprint_toggle = true)
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 2 Always Run: True", global.default_text_size, c_white, c_black, 1);
	}
	else
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 2 Always Run: False", global.default_text_size, c_white, c_black, 1);
	}
}
if (show_sprint_toggle_for_player3> 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 -= 1;
	show_sprint_toggle_for_player4 = 0;
	if (global.player3_sprint_toggle = true)
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 3 Always Run: True", global.default_text_size, c_white, c_black, 1);
	}
	else
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 3 Always Run: False", global.default_text_size, c_white, c_black, 1);
	}
}
if (show_sprint_toggle_for_player4> 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 -= 1;
	if (global.player4_sprint_toggle = true)
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 4 Always Run: True", global.default_text_size, c_white, c_black, 1);
	}
	else
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, "Player 4 Always Run: False", global.default_text_size, c_white, c_black, 1);
	}
}
#endregion /*Sprint Toggling END*/

#region /*Show Drowning*/

#region /*Show Drowning for Player 1*/
if (player1 > 0)
{
	if (player1.allow_drowning == true)
	&& (player1.drawn_frames_until_drowning <= player1.seconds_until_drowning* 60)
	{
		draw_circular_bar(player1.x + 2, player1.bbox_top - 54, player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		draw_circular_bar(player1.x, player1.bbox_top - 56, player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, make_color_hsv_transition(player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /*Show Drowning for Player 1 END*/

#region /*Show Drowning for Player 2*/
if (player2 > 0)
{
	if (player2.allow_drowning == true)
	&& (player2.drawn_frames_until_drowning <= player2.seconds_until_drowning* 60)
	{
		draw_circular_bar(player2.x + 2, player2.bbox_top - 54, player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		draw_circular_bar(player2.x, player2.bbox_top - 56, player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, make_color_hsv_transition(player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /*Show Drowning for Player 2 END*/

#region /*Show Drowning for Player 3*/
if (player3 > 0)
{
	if (player3.allow_drowning == true)
	&& (player3.drawn_frames_until_drowning <= player3.seconds_until_drowning* 60)
	{
		draw_circular_bar(player3.x + 2, player3.bbox_top - 54, player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		draw_circular_bar(player3.x, player3.bbox_top - 56, player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, make_color_hsv_transition(player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /*Show Drowning for Player 3 END*/

#region /*Show Drowning for Player 4 */
if (player4 > 0)
{
	if (player4.allow_drowning == true)
	&& (player4.drawn_frames_until_drowning <= player4.seconds_until_drowning* 60)
	{
		draw_circular_bar(player4.x + 2, player4.bbox_top - 54, player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		draw_circular_bar(player4.x, player4.bbox_top - 56, player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, make_color_hsv_transition(player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /*Show Drowning for Player 4 END*/

#endregion /*Show Drowning END*/