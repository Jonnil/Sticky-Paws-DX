scr_zoom_camera_controls();

#region /* Arcade Credit Increase */
if (mouse_wheel_up())
{
	global.arcade_credit += 1;
}
#endregion /* Arcade Credit Increase END */

#region /* Stop gamepad vibration for different players */

#region /* Stop gamepad vibration for player 1 */
if (player1_vibration_active = false)
{
	player1_motor_speed = lerp(player1_motor_speed, 0, 0.1);
}
gamepad_set_vibration(0, player1_motor_speed, player1_motor_speed);
#endregion /* Stop gamepad vibration for player 1 END */

#region /* Stop gamepad vibration for player 2 */
if (player2_vibration_active = false)
{
	player2_motor_speed = lerp(player2_motor_speed, 0, 0.1);
}
gamepad_set_vibration(1, player2_motor_speed, player2_motor_speed);
#endregion /* Stop gamepad vibration for player 2 END */

#region /* Stop gamepad vibration for player 3 */
if (player3_vibration_active = false)
{
	player3_motor_speed = lerp(player3_motor_speed, 0, 0.1);
}
gamepad_set_vibration(2, player3_motor_speed, player3_motor_speed);
#endregion /* Stop gamepad vibration for player 3 END */

#region /* Stop gamepad vibration for player 4 */
if (player4_vibration_active = false)
{
	player4_motor_speed = lerp(player4_motor_speed, 0, 0.1);
}
gamepad_set_vibration(3, player4_motor_speed, player4_motor_speed);
#endregion /* Stop gamepad vibration for player 4 END */

#endregion /* Stop gamepad vibration for different players END */

view_x_center = camera_get_view_x(view_camera[view_current]) + (camera_get_view_width(view_camera[view_current]) / 2);
view_y_center = camera_get_view_y(view_camera[view_current]) + (camera_get_view_height(view_camera[view_current]) / 2);

#region /* Deactivate instances outside view */
if (delay = 2)
{
	instance_activate_all();
	if (global.deactivate_objects_outsiede_view == true) /* This global variable is for debug purposes, and should always be set to true when playing the game normally */
	{
		instance_deactivate_region(view_x_center - 1000, view_y_center - 1000, 2000, 2000, false, true);
	}
}
else
{
	delay += 1;
}
#endregion /* Deactivate instances outside view END */

#region /* Activate objects that always should be active */
if (asset_get_type("obj_level_player_1_start") == asset_object)
{
	instance_activate_object(obj_level_player_1_start);
}
if (asset_get_type("obj_level_player_2_start") == asset_object)
{
	instance_activate_object(obj_level_player_2_start);
}
if (asset_get_type("obj_level_player_3_start") == asset_object)
{
	instance_activate_object(obj_level_player_3_start);
}
if (asset_get_type("obj_level_player_4_start") == asset_object)
{
	instance_activate_object(obj_level_player_4_start);
}
if (asset_get_type("obj_player") == asset_object)
{
	instance_activate_object(obj_player);
}
if (asset_get_type("obj_player_map") == asset_object)
{
	instance_activate_object(obj_player_map);
}
if (asset_get_type("obj_player_die") == asset_object)
{
	instance_activate_object(obj_player_die);
}
if (asset_get_type("obj_foreground1") == asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground_above_static_objects") == asset_object)
{
	instance_activate_object(obj_foreground_above_static_objects);
}
if (asset_get_type("obj_foreground2") == asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_foreground_secret") == asset_object)
{
	instance_activate_object(obj_foreground_secret);
}
if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
{
	instance_activate_object(obj_background_brightness_gameplay);
}
if (asset_get_type("obj_water_level") == asset_object)
{
	instance_activate_object(obj_water_level);
}
if (asset_get_type("obj_level_height") == asset_object)
{
	instance_activate_object(obj_level_height);
}
if (asset_get_type("obj_level_width") == asset_object)
{
	instance_activate_object(obj_level_width);
}
if (asset_get_type("obj_credits") == asset_object)
{
	instance_activate_object(obj_credits);
}
if (asset_get_type("obj_title") == asset_object)
{
	instance_activate_object(obj_title);
}
#endregion /* Activate objects that always should be active END */

#region /* Make sure the lives counter never goes below 0 */
if (lives < 0)
{
	lives = 0;
}
#endregion /* Make sure the lives counter never goes below 0 END */

#region /* Spawn Players in multiplayer */
if (instance_exists(obj_player))
and (global.pause == false)
and (global.goal_active = false)
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	if (gamepad_button_check_pressed(0, gp_face1))
	or (keyboard_check_pressed(global.player1_key_jump))
	or (keyboard_check_pressed(global.player1_key2_jump))
	{
		if (player1 <= 0)
		and (can_spawn_player1 == true)
		and (lives > 0)
		{
			if (global.player1_can_play == false)
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
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(1, gp_face1))
	or (keyboard_check_pressed(global.player2_key_jump))
	or (keyboard_check_pressed(global.player2_key2_jump))
	{
		if (player2 <= 0)
		and (can_spawn_player2 == true)
		and (lives > 0)
		{
			if (global.player2_can_play == false)
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
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(2, gp_face1))
	or (keyboard_check_pressed(global.player3_key_jump))
	or (keyboard_check_pressed(global.player3_key2_jump))
	{
		if (player3 <= 0)
		and (can_spawn_player3 == true)
		and (lives > 0)
		{
			if (global.player3_can_play == false)
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
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(3, gp_face1))
	or (keyboard_check_pressed(global.player4_key_jump))
	or (keyboard_check_pressed(global.player4_key2_jump))
	{
		if (player4 <= 0)
		and (can_spawn_player4 == true)
		and (lives > 0)
		{
			if (global.player4_can_play == false)
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
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
}
#endregion /* Spawn Players in multiplayer END */

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
	
	#region /* World Map Camera */
	if (asset_get_type("obj_player_map") == asset_object)
	and (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_player_map))
	{
		xx = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player_map).x;
		yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player_map).y;
	}
	#endregion /* World Map Camera END */
	
	else
	
	#region /* Boss Battle Camera */
	if (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_boss") == asset_object)
	and (instance_exists(obj_player))
	and (instance_exists(obj_boss))
	and (distance_to_object(obj_boss) < 500)
	and (global.player_has_entered_goal == false)
	{
		
		view_wview_lerp = lerp(0, 0, 0.05);
		view_hview_lerp = lerp(0, 0, 0.05);
		
		if (player1 > 0)
		and (instance_exists(player1))
		{
			if (player1.partner_character = false)
			{
				xx = mean(player1.x, obj_boss.x);
				yy = mean(player1.y, obj_boss.y);
			}
		}
		else
		if (player2 > 0)
		and (instance_exists(player2))
		{
			if (player2.partner_character = false)
			{
				xx = mean(player2.x, obj_boss.x);
				yy = mean(player2.y, obj_boss.y);
			}
		}
		else
		if (player3 > 0)
		and (instance_exists(player3))
		{
			if (player3.partner_character = false)
			{
				xx = mean(player3.x, obj_boss.x);
				yy = mean(player3.y, obj_boss.y);
			}
		}
		else
		if (player4 > 0)
		and (instance_exists(player4))
		{
			if (player4.partner_character = false)
			{
				xx = mean(player4.x, obj_boss.x);
				yy = mean(player4.y, obj_boss.y);
			}
		}
	}
	#endregion /* Boss Battle Camera END */
	
	else
	
	#region /* MULTIPLAYER CAMERA */
	if (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_camera") == asset_object)
	and (instance_number(obj_player) >= 1)
	and (global.player_has_entered_goal == false)
	{
		
		#region /* Camera should follow multiple players */
		
		/* 1, 2, 3, 4 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player1.x, player2.x, player3.x, player4.x);
			yy = mean(player1.y, player2.y, player3.y, player4.y);
		}
		
		else
		
		/* 1, 2, 3 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			xx = mean(player1.x, player2.x, player3.x);
			yy = mean(player1.y, player2.y, player3.y);
		}
		
		else
		
		/* 1, 2 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		{
			xx = mean(player1.x, player2.x);
			yy = mean(player1.y, player2.y);
		}
		
		else
		
		/* 1, 3 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			xx = mean(player1.x, player3.x);
			yy = mean(player1.y, player3.y);
		}
		
		else
		
		/* 1, 4 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player1.x, player4.x);
			yy = mean(player1.y, player4.y);
		}
		
		else
		
		/* 2, 3 */
		if (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			xx = mean(player2.x, player3.x);
			yy = mean(player2.y, player3.y);
		}
		
		else
		
		/* 2, 4 */
		if (player1 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player2.x, player4.x);
			yy = mean(player2.y, player4.y);
		}
		
		else
		
		/* 3, 4 */
		if (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		and (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			xx = mean(player3.x, player4.x);
			yy = mean(player3.y, player4.y);
		}
		#endregion /* Camera should follow multiple players END */
		
		else
		
		#region /* Follow one player. In case something goes wrong, camera will always follow one player */
		/* 1 */
		if (player1 > 0)
		and (instance_exists(player1))
		and (player1.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player1.x + player1.hspeed * 15;
			if (player1.on_ground == true)
			and (player1.vspeed >= 0)
			{
				yy = player1.y
			}
			else
			if (player1.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player1.vspeed);
			}
			if (player1.wall_jump == true)
			or (player1.climb == true)
			{
				yy = player1.y
			}
			if (player1.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
			{
				yy = player1.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player1.in_water == true)
			or (player1.stick_to_wall == true)
			or (player1.spring == true)
			or (player1.climb == true)
			or (player1.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player1.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						yy = player1.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 2 */
		if (player2 > 0)
		and (instance_exists(player2))
		and (player2.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player2.x + player2.hspeed * 15;
			if (player2.on_ground == true)
			and (player2.vspeed >= 0)
			{
				yy = player2.y
			}
			else
			if (player2.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player2.vspeed);
			}
			if (player2.wall_jump == true)
			or (player2.climb == true)
			{
				yy = player2.y
			}
			if (player2.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
			{
				yy = player2.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player2.in_water == true)
			or (player2.stick_to_wall == true)
			or (player2.spring == true)
			or (player2.climb == true)
			or (player2.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player2.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						yy = player2.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 3 */
		if (player3 > 0)
		and (instance_exists(player3))
		and (player3.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player3.x + player3.hspeed * 15;
			if (player3.on_ground == true)
			and (player3.vspeed >= 0)
			{
				yy = player3.y
			}
			else
			if (player3.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player3.vspeed);
			}
			if (player3.wall_jump == true)
			or (player3.climb == true)
			{
				yy = player3.y
			}
			if (player3.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
			{
				yy = player3.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player3.in_water == true)
			or (player3.stick_to_wall == true)
			or (player3.spring == true)
			or (player3.climb == true)
			or (player3.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player3.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						yy = player3.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 4 */
		if (player4 > 0)
		and (instance_exists(player4))
		and (player4.partner_character = false)
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player4.x + player4.hspeed * 15;
			if (player4.on_ground == true)
			and (player4.vspeed >= 0)
			{
				yy = player4.y
			}
			else
			if (player4.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player4.vspeed);
			}
			if (player4.wall_jump == true)
			or (player4.climb == true)
			{
				yy = player4.y
			}
			if (player4.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
			{
				yy = player4.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player4.in_water == true)
			or (player4.stick_to_wall == true)
			or (player4.spring == true)
			or (player4.climb == true)
			or (player4.horizontal_rope_climb == true)
			{
				if (asset_get_type("obj_camera") == asset_object)
				{
					if (player4.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2)
					{
						yy = player4.y;
					}
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* nothing */
		{
			xx = x;
			yy = y;
		}
		#endregion /* Follow one player. In case something goes wrong, camera will always follow one player END */
		
		#region /* Zoom out the view when players are going outside view */
		if (instance_nearest(x, 0, obj_player).y < camera_get_view_y(view_camera[view_current]) + 32)
		and (fps >= global.max_fps)
		or (instance_nearest(x, room_height, obj_player).y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32)
		and (fps >= global.max_fps)
		or (instance_nearest(0, room_height / 2, obj_player).x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 - 320)
		and (instance_nearest(room_width, room_height / 2, obj_player).x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + 320)
		and (fps >= global.max_fps)
		or (instance_nearest(room_width / 2, 0, obj_player).y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 - 320)
		and (instance_nearest(room_width / 2, room_height, obj_player).y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 320)
		and (fps >= global.max_fps)
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
		}
		#endregion /* Zoom out the view when players are going outside view END */
		
	}
	#endregion /* MULTIPLAYER CAMERA */
	
	else
	
	#region /* Camera when you win level */
	if (global.player_has_entered_goal == true)
	and (asset_get_type("obj_goal") == asset_object)
	and (instance_exists(obj_goal))
	and (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	{
		xx = mean(instance_nearest(obj_goal.x, obj_goal.y, obj_player).x, obj_goal.x);
		yy = mean(instance_nearest(obj_goal.x, obj_goal.y, obj_player).y, obj_goal.y);
	}
	#endregion /* Camera when you win level END */
	
	#region /* Iris */
	if (allow_iris == true)
	and (asset_get_type("obj_player_map") == asset_object)
	and (!instance_exists(obj_player_map))
	{
		
		#region /* Zoom In Player Goal */
		if (asset_get_type("obj_player") == asset_object)
		and (asset_get_type("obj_goal") == asset_object)
		and (instance_exists(obj_player))
		and (instance_exists(obj_goal))
		and (instance_nearest(room_width, y, obj_player).goal == true)
		and (global.time_countdown_bonus <= 0)
		{
			if (iris_zoom == 1)
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
		#endregion /* Zoom In Player Goal END */

		#region /* Zoom In Player Map */
		else
		if (asset_get_type("obj_player_map") == asset_object)
		and (instance_exists(obj_player_map))
		and (obj_player_map.entering_level == true)
		{
			if (iris_zoom == 1)
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
		#endregion /* Zoom In Player Map END */
		
		else
		
		#region /* Zoom Out */
		if (iris_zoom == 0)
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
		#endregion /* Zoom Out END */

	}
	#endregion /* Iris END */
	
}