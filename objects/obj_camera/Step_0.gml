/* Script functions */
scr_set_screen_size();
scr_set_controls_used_to_navigate();
scr_zoom_camera_controls();
scr_toggle_fullscreen();
scr_resize_application_surface();

if (!have_set_numbers) /* Have to set numbers in step event like this for it to work in every case */
{
	have_set_numbers = true;
	
	#region /* Set big collectible numbers for every big collectible */
	instance_activate_object(obj_big_collectible_number);
	for(set_all_big_collectible = 0; set_all_big_collectible < instance_number(obj_big_collectible_number) + 1; set_all_big_collectible += 1)
	{
		if (instance_number(obj_big_collectible_number) >= set_all_big_collectible)
		{
			with (instance_nth_nearest(global.level_player_start_x[1], global.level_player_start_y[1], obj_big_collectible_number, set_all_big_collectible))
			{
				big_collectible = obj_camera.set_all_big_collectible;
			}
		}
	}
	#endregion /* Set big collectible numbers for every big collectible END */
	
	#region /* Set checkpoint numbers for every checkpoint */
	instance_activate_object(obj_checkpoint);
	for(checkpoint_number = 0;checkpoint_number < instance_number(obj_checkpoint) + 1;checkpoint_number += 1)
	{
		if (instance_number(obj_checkpoint) >= checkpoint_number)
		{
			with (instance_nth_nearest(global.level_player_start_x[1], global.level_player_start_y[1], obj_checkpoint, checkpoint_number))
			{
				checkpoint_number = obj_camera.checkpoint_number;
			}
		}
	}
	#endregion /* Set checkpoint numbers for every checkpoint END */
	
}

global.appear_block_timer ++;
if (global.appear_block_timer > 60 * 5)
{
	global.appear_block_timer = 0;
}

global.collectible_image_index = image_index; /* Make all the collectibles animate in sync */

var get_room_speed = 60;

/* Timer Countup */
if (!global.goal_active && !global.pause) {
    global.timeattack_millisecond++;
    global.timeattack_realmillisecond++;
    if (global.timeattack_millisecond > 60) {
        global.timeattack_millisecond = 0;
        global.timeattack_second++;
        if (global.timeattack_second > 59) {
            global.timeattack_second = 0;
            global.timeattack_minute++;
        }
    }
}
else if (!global.pause) {
    if (!global.goal_active) {
        global.timeattack_millisecond++;
        global.timeattack_realmillisecond++;
        if (global.timeattack_millisecond > 60) {
            global.timeattack_millisecond = 0;
            global.timeattack_second++;
            if (global.timeattack_second > 59) {
                global.timeattack_second = 0;
                global.timeattack_minute++;
            }
        }
    }
}

/* Time Countdown */
if (!global.pause && !global.goal_active)
{
	time_second++;
	if (time_second > get_room_speed)
	{
		time_second = 0;
		global.time_countdown_bonus--;
		if (global.enable_time_countdown)
		{
			global.time_countdown--;
		}
	}
}

/* global.spikes_emerge_time increment */
global.spikes_emerge_time++;
if (global.spikes_emerge_time >= get_room_speed * 4) {
    global.spikes_emerge_time = 0;
}

#region /* Rain Effect */
if (global.effect_rain)
{
	if (!part_system_exists(part_system_rain))
	{
		part_system_rain = part_system_create(par_rain_level);
	}
	else
	{
		if (!audio_is_playing(snd_rain))
		{
			scr_audio_play(snd_rain, volume_source.ambient); /* Play rain sound */
		}
		part_emitter_region(part_system_rain, 0, camera_get_view_x(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - 32, camera_get_view_y(view_camera[view_current]) - 32, ps_shape_rectangle, ps_distr_linear);
	}
}
#endregion /* Rain Effect END */

#region /* Snow Effect */
if (global.effect_snow)
{
	if (!part_system_exists(part_system_snow))
	{
		part_system_snow = part_system_create(par_snow);
	}
	else
	{
		//if (!audio_is_playing(snd_snow))
		//{
		//	scr_audio_play(snd_snow, volume_source.ambient); /* Play snow sound */
		//}
		part_emitter_region(part_system_snow, 0, camera_get_view_x(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]), ps_shape_rectangle, ps_distr_linear);
	}
	
	if (irandom(9) == 0) /* Reduce the frequency of snowflakes. irandom generates a random integer between 0 and 9 */
	{
		effect_create_below(ef_snow, x, y, 2, c_white);
	}
}
#endregion /* Snow Effect END */

#region /* Wind Effect */
if (global.effect_wind)
{
	if (!layer_exists("WindEffectLayer"))
	{
		layer_create(-100, "WindEffectLayer");
		var _fx_wind = fx_create("_effect_windblown_particles");
		fx_set_parameter(_fx_wind, "param_num_particles", 30);
		fx_set_parameter(_fx_wind, "param_particle_spawn_all_at_start", false);
		fx_set_parameter(_fx_wind, "param_particle_initial_velocity_range_x_min", -50);
		fx_set_parameter(_fx_wind, "param_particle_initial_velocity_range_y_min", -50);
		fx_set_parameter(_fx_wind, "param_trails_only", true);
		fx_set_parameter(_fx_wind, "param_trail_chance", 100);
		fx_set_parameter(_fx_wind, "param_blower_force_min", 2);
		fx_set_parameter(_fx_wind, "param_blower_force_max", 7);
		fx_set_parameter(_fx_wind, "param_grav_accel", 150);
		layer_set_fx("WindEffectLayer", _fx_wind);
	}
}
else
if (layer_exists("WindEffectLayer"))
{
	layer_destroy("WindEffectLayer")
}
#endregion /* Wind Effect END */

#region /* Multiplayer - Has pressed keys */

#region /* Player 1 Show Controls HUD timer */
if (player[1] >= 1)
&& (instance_exists(player[1]))
&& (iris_xscale >= 10)
{
	if (global.player_show_controls[1] == 0)
	|| (!player[1].can_move)
	|| (global.goal_active)
	{
		player_show_controls_alpha[1] = lerp(player_show_controls_alpha[1], 0, 0.2);
	}
	else
	if (global.player_show_controls[1] >= 1)
	&& (global.player_show_controls[1] <= 9)
	{
		if (player_show_controls_timer[1] >= 1)
		{
			player_show_controls_alpha[1] = lerp(player_show_controls_alpha[1], 0, 0.2);
			player_show_controls_timer[1] --;
		}
		if (player_show_controls_timer[1] <= 0)
		&& (player[1].speed == 0)
		{
			player_show_controls_alpha[1] = lerp(player_show_controls_alpha[1], 1, 0.1);
		}
	}
	else
	if (global.player_show_controls[1] == 10)
	{
		player_show_controls_alpha[1] = lerp(player_show_controls_alpha[1], 1, 0.1);
	}
	
	if (player[1].speed > 0)
	{
		player_show_controls_timer[1] = get_room_speed * global.player_show_controls[1];
	}
}
else
if (global.player_can_play[1])
{
	player_show_controls_alpha[1] = lerp(player_show_controls_alpha[1], 1, 0.1);
}
else
{
	player_show_controls_alpha[1] = lerp(player_show_controls_alpha[1], 0, 0.2);
	player_show_controls_timer[1] = get_room_speed * global.player_show_controls[1];
}
#endregion /* Player 1 Show Controls HUD timer */

#region /* Player 2 Show Controls HUD timer */
if (player[2] >= 1)
&& (instance_exists(player[2]))
&& (iris_xscale >= 10)
{
	if (global.player_show_controls[2] == 0)
	|| (!player[2].can_move)
	|| (global.goal_active)
	{
		player_show_controls_alpha[2] = lerp(player_show_controls_alpha[2], 0, 0.2);
	}
	else
	if (global.player_show_controls[2] >= 1)
	&& (global.player_show_controls[2] <= 9)
	{
		if (player_show_controls_timer[2] >= 1)
		{
			player_show_controls_alpha[2] = lerp(player_show_controls_alpha[2], 0, 0.2);
			player_show_controls_timer[2] --;
		}
		if (player_show_controls_timer[2] <= 0)
		&& (player[2].speed == 0)
		{
			player_show_controls_alpha[2] = lerp(player_show_controls_alpha[2], 1, 0.1);
		}
	}
	else
	if (global.player_show_controls[2] == 10)
	{
		player_show_controls_alpha[2] = lerp(player_show_controls_alpha[2], 1, 0.1);
	}
	
	if (player[2].speed > 0)
	{
		player_show_controls_timer[2] = get_room_speed * global.player_show_controls[2];
	}
}
else
if (global.player_can_play[2])
{
	player_show_controls_alpha[2] = lerp(player_show_controls_alpha[2], 1, 0.1);
}
else
{
	player_show_controls_alpha[2] = lerp(player_show_controls_alpha[2], 0, 0.2);
	player_show_controls_timer[2] = get_room_speed * global.player_show_controls[2];
}
#endregion /* Player 2 Show Controls HUD timer */

#region /* Player 3 Show Controls HUD timer */
if (player[3] >= 1)
&& (instance_exists(player[3]))
&& (iris_xscale >= 10)
{
	if (global.player_show_controls[3] == 0)
	|| (!player[3].can_move)
	|| (global.goal_active)
	{
		player_show_controls_alpha[3] = lerp(player_show_controls_alpha[3], 0, 0.2);
	}
	else
	if (global.player_show_controls[3] >= 1)
	&& (global.player_show_controls[3] <= 9)
	{
		if (player_show_controls_timer[3] >= 1)
		{
			player_show_controls_alpha[3] = lerp(player_show_controls_alpha[3], 0, 0.2);
			player_show_controls_timer[3] --;
		}
		if (player_show_controls_timer[3] <= 0)
		&& (player[3].speed == 0)
		{
			player_show_controls_alpha[3] = lerp(player_show_controls_alpha[3], 1, 0.1);
		}
	}
	else
	if (global.player_show_controls[3] == 10)
	{
		player_show_controls_alpha[3] = lerp(player_show_controls_alpha[3], 1, 0.2);
	}
	
	if (player[3].speed > 0)
	{
		player_show_controls_timer[3] = get_room_speed * global.player_show_controls[3];
	}
}
else
if (global.player_can_play[3])
{
	player_show_controls_alpha[3] = lerp(player_show_controls_alpha[3], 1, 0.1);
}
else
{
	player_show_controls_alpha[3] = lerp(player_show_controls_alpha[3], 0, 0.2);
	player_show_controls_timer[3] = get_room_speed * global.player_show_controls[3];
}
#endregion /* Player 3 Show Controls HUD timer */

#region /* Player 4 Show Controls HUD timer */
if (player[4] >= 1)
&& (instance_exists(player[4]))
&& (iris_xscale >= 10)
{
	if (global.player_show_controls[4] == 0)
	|| (!player4.can_move)
	|| (global.goal_active)
	{
		player_show_controls_alpha[4] = lerp(player_show_controls_alpha[4], 0, 0.2);
	}
	else
	if (global.player_show_controls[4] >= 1)
	&& (global.player_show_controls[4] <= 9)
	{
		if (player_show_controls_timer[4] >= 1)
		{
			player_show_controls_alpha[4] = lerp(player_show_controls_alpha[4], 0, 0.2);
			player_show_controls_timer[4] --;
		}
		if (player_show_controls_timer[4] <= 0)
		&& (player4.speed == 0)
		{
			player_show_controls_alpha[4] = lerp(player_show_controls_alpha[4], 1, 0.1);
		}
	}
	else
	if (global.player_show_controls[4] == 10)
	{
		player_show_controls_alpha[4] = lerp(player_show_controls_alpha[4], 1, 0.1);
	}
	
	if (player4.speed > 0)
	{
		player_show_controls_timer[4] = get_room_speed * global.player_show_controls[4];
	}
}
else
if (global.player_can_play[4])
{
	player_show_controls_alpha[4] = lerp(player_show_controls_alpha[4], 1, 0.1);
}
else
{
	player_show_controls_alpha[4] = lerp(player_show_controls_alpha[4], 0, 0.2);
	player_show_controls_timer[4] = get_room_speed * global.player_show_controls[4];
}
#endregion /* Player 4 Show Controls HUD timer */

#endregion /* Multiplayer - Has pressed keys END */

#region /* Stop gamepad vibration for player */
for (var i = 1; i <= global.max_players; i += 1)
{
	if (!player_vibration_active[i])
	{
		player_motor_speed[i] = lerp(player_motor_speed[i], 0, 0.1);
	}
	gamepad_set_vibration(global.player_slot[i], player_motor_speed[i], player_motor_speed[i]);
}
#endregion /* Stop gamepad vibration for player END */

#region /* Spawn Players in multiplayer */
if (!global.pause)
&& (!global.goal_active)
&& (instance_exists(obj_player))
{
	if (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]) && gamepad_is_connected(global.player_slot[1]))
	|| (keyboard_check_pressed(global.player_[inp.key][1][1][action.jump]))
	|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.jump]))
	{
		if (player[1] <= 0)
		&& (can_spawn_player[1])
		&& (lives > 0)
		{
			if (!global.player_can_play[1])
			{
				global.player_can_play[1] = true;
			}
			if (instance_exists(obj_player))
			{
				player[1] = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player);
			}
			else
			{
				player[1] = instance_create_depth(x, y, 0, obj_player);
			}
			with(player[1])
			{
				custom_character = global.character_for_player[1];
				selected_voice_pack = global.voicepack_for_player[1];
				selected_skin = global.skin_for_player[1];
				player = 1;
			}
		}
		else
		if (lives <= 0)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]) && gamepad_is_connected(global.player_slot[2]))
	|| (keyboard_check_pressed(global.player_[inp.key][2][1][action.jump]))
	|| (keyboard_check_pressed(global.player_[inp.key][2][2][action.jump]))
	{
		if (player[2] <= 0)
		&& (can_spawn_player[2])
		&& (lives > 0)
		{
			if (!global.player_can_play[2])
			{
				global.player_can_play[2] = true;
			}
			if (instance_exists(obj_player))
			{
				player[2] = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player);
			}
			else
			{
				player[2] = instance_create_depth(x, y, 0, obj_player);
			}
			with(player[2])
			{
				custom_character = global.character_for_player[2];
				selected_voice_pack = global.voicepack_for_player[2];
				selected_skin = global.skin_for_player[2];
				player = 2;
			}
		}
		else
		if (lives <= 0)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]) && gamepad_is_connected(global.player_slot[3]))
	|| (keyboard_check_pressed(global.player_[inp.key][3][1][action.jump]))
	|| (keyboard_check_pressed(global.player_[inp.key][3][2][action.jump]))
	{
		if (player[3] <= 0)
		&& (can_spawn_player[3])
		&& (lives > 0)
		{
			if (!global.player_can_play[3])
			{
				global.player_can_play[3] = true;
			}
			if (instance_exists(obj_player))
			{
				player[3] = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player);
			}
			else
			{
				player[3] = instance_create_depth(x, y, 0, obj_player);
			}
			with(player[3])
			{
				custom_character = global.character_for_player[3];
				selected_voice_pack = global.voicepack_for_player[3];
				selected_skin = global.skin_for_player[3];
				player = 3;
			}
		}
		else
		if (lives <= 0)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
	}
	if (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]) && gamepad_is_connected(global.player_slot[4]))
	|| (keyboard_check_pressed(global.player_[inp.key][4][1][action.jump]))
	|| (keyboard_check_pressed(global.player_[inp.key][4][2][action.jump]))
	{
		if (player[4] <= 0)
		&& (can_spawn_player[4])
		&& (lives > 0)
		{
			if (!global.player_can_play[4])
			{
				global.player_can_play[4] = true;
			}
			if (instance_exists(obj_player))
			{
				player[4] = instance_create_depth(obj_player.x, obj_player.y, 0, obj_player);
			}
			else
			{
				player[4] = instance_create_depth(x, y, 0, obj_player);
			}
			with(player[4])
			{
				custom_character = global.character_for_player[4];
				selected_voice_pack = global.voicepack_for_player[4];
				selected_skin = global.skin_for_player[4];
				player = 4;
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

if (!save_level_as_png)
{
	if (shake > 0)
	{
		x = x + random_range(-shake, +shake);
		y = y + random_range(-shake, +shake);
		shake = lerp(shake, 0, 0.1);
	}
	
	x = lerp(x, xx, 0.1);
	y = lerp(y, yy, 0.15);
	
	#region /* Boss Battle Camera */
	if (instance_exists(obj_boss))
	&& (instance_exists(obj_player))
	&& (distance_to_object(obj_boss) < 400)
	{
		view_wview_lerp = lerp(0, 0, 0.05);
		view_hview_lerp = lerp(0, 0, 0.05);
		
		if (player[1] > 0)
		{
			xx = mean(player[1].x, obj_boss.x);
			yy = mean(player[1].y, obj_boss.y);
		}
		else
		if (player[2] > 0)
		{
			xx = mean(player[2].x, obj_boss.x);
			yy = mean(player[2].y, obj_boss.y);
		}
		else
		if (player[3] > 0)
		{
			xx = mean(player[3].x, obj_boss.x);
			yy = mean(player[3].y, obj_boss.y);
		}
		else
		if (player[4] > 0)
		{
			xx = mean(player4.x, obj_boss.x);
			yy = mean(player4.y, obj_boss.y);
		}
	}
	#endregion /* Boss Battle Camera END */
	
	else
	
	#region /* MULTIPLAYER CAMERA */
	if (instance_number(obj_player) > 1) /* If there are 2 or more players (>1) then use multiplayer camera */
	{
		
		#region /* Camera should follow multiple players */
		
		/* 1, 2, 3, 4 */
		if (player[1] > 0)
		&& (player[2] > 0)
		&& (player[3] > 0)
		&& (player[4] > 0)
		{
			xx = mean(player[1].x, player[2].x, player[3].x, player4.x);
			yy = mean(player[1].y, player[2].y, player[3].y, player4.y);
		}
		
		else
		
		/* 1, 2, 3 */
		if (player[1] > 0)
		&& (player[2] > 0)
		&& (player[3] > 0)
		{
			xx = mean(player[1].x, player[2].x, player[3].x);
			yy = mean(player[1].y, player[2].y, player[3].y);
		}
		
		else
		
		/* 1, 2 */
		if (player[1] > 0)
		&& (player[2] > 0)
		{
			xx = mean(player[1].x, player[2].x);
			yy = mean(player[1].y, player[2].y);
		}
		
		else
		
		/* 1, 3 */
		if (player[1] > 0)
		&& (player[3] > 0)
		{
			xx = mean(player[1].x, player[3].x);
			yy = mean(player[1].y, player[3].y);
		}
		
		else
		
		/* 1, 4 */
		if (player[1] > 0)
		&& (player[4] > 0)
		{
			xx = mean(player[1].x, player4.x);
			yy = mean(player[1].y, player4.y);
		}
		
		else
		
		/* 2, 3 */
		if (player[2] > 0)
		&& (player[3] > 0)
		{
			xx = mean(player[2].x, player[3].x);
			yy = mean(player[2].y, player[3].y);
		}
		
		else
		
		/* 2, 4 */
		if (player[1] > 0)
		&& (player[4] > 0)
		{
			xx = mean(player[2].x, player4.x);
			yy = mean(player[2].y, player4.y);
		}
		
		else
		
		/* 3, 4 */
		if (player[3] > 0)
		&& (player[4] > 0)
		{
			xx = mean(player[3].x, player4.x);
			yy = mean(player[3].y, player4.y);
		}
		#endregion /* Camera should follow multiple players END */
		
	}
	#endregion /* MULTIPLAYER CAMERA */
	
	else
	
	#region /* SINGLEPLAYER CAMERA */
	if (instance_number(obj_player) == 1) /* If there are only 1 player (==1) then use singleplayer camera */
	{
		
		#region /* Follow one player. In case something goes wrong, camera will always follow one player */
		/* 1 */
		if (player[1] >= 1)
		&& (instance_exists(player[1]))
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player[1].x + player[1].hspeed * 15;
			if (player[1].on_ground)
			&& (player[1].vspeed >= 0)
			{
				yy = player[1].y
			}
			else
			if (player[1].y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player[1].vspeed);
			}
			if (player[1].wall_jump)
			|| (player[1].climb)
			{
				yy = player[1].y
			}
			if (player[1].y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player[1].y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player[1].in_water)
			|| (player[1].stick_to_wall)
			|| (player[1].spring)
			|| (player[1].climb)
			|| (player[1].horizontal_rope_climb)
			{
				if (player[1].y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
				{
					yy = player[1].y;
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 2 */
		if (player[2] >= 1)
		&& (instance_exists(player[2]))
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player[2].x + player[2].hspeed * 15;
			if (player[2].on_ground)
			&& (player[2].vspeed >= 0)
			{
				yy = player[2].y
			}
			else
			if (player[2].y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player[2].vspeed);
			}
			if (player[2].wall_jump)
			|| (player[2].climb)
			{
				yy = player[2].y
			}
			if (player[2].y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player[2].y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player[2].in_water)
			|| (player[2].stick_to_wall)
			|| (player[2].spring)
			|| (player[2].climb)
			|| (player[2].horizontal_rope_climb)
			{
				if (player[2].y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
				{
					yy = player[2].y;
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 3 */
		if (player[3] >= 1)
		&& (instance_exists(player[3]))
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player[3].x + player[3].hspeed * 15;
			if (player[3].on_ground)
			&& (player[3].vspeed >= 0)
			{
				yy = player[3].y
			}
			else
			if (player[3].y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player[3].vspeed);
			}
			if (player[3].wall_jump)
			|| (player[3].climb)
			{
				yy = player[3].y
			}
			if (player[3].y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player[3].y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player[3].in_water)
			|| (player[3].stick_to_wall)
			|| (player[3].spring)
			|| (player[3].climb)
			|| (player[3].horizontal_rope_climb)
			{
				if (player[3].y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
				{
					yy = player[3].y;
				}
			}
			#endregion /* Follow Player in y position when doing specific things END */
			
			view_wview_lerp = lerp(view_wview_lerp, 0, 0.1);
			view_hview_lerp = lerp(view_hview_lerp, 0, 0.1);
			#endregion /* ONE PLAYER CAMERA END */
			
		}
		
		else
		
		/* 4 */
		if (player[4] >= 1)
		&& (instance_exists(player[4]))
		{
			
			#region /* ONE PLAYER CAMERA */
			
			#region /* Tries to be a bit ahead of player */
			xx = player4.x + player4.hspeed * 15;
			if (player4.on_ground)
			&& (player4.vspeed >= 0)
			{
				yy = player4.y
			}
			else
			if (player4.y < camera_get_view_y(view_camera[view_current]) + 128)
			{
				yy -= abs(player4.vspeed);
			}
			if (player4.wall_jump)
			|| (player4.climb)
			{
				yy = player4.y
			}
			if (player4.y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
			{
				yy = player4.y;
			}
			#endregion /* Tries to be a bit ahead of player END */
			
			#region /* Follow Player in y position when doing specific things */
			if (player4.in_water)
			|| (player4.stick_to_wall)
			|| (player4.spring)
			|| (player4.climb)
			|| (player4.horizontal_rope_climb)
			{
				if (player4.y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
				{
					yy = player4.y;
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
		
	}
	#endregion /* SINGLEPLAYER CAMERA */
	
	#region /* Iris */
	if (allow_iris)
	{
		
		#region /* Zoom In */
		if (global.player_has_entered_goal)
		&& (global.time_countdown_bonus <= 0)
		
		|| (global.iris_zoom_in) /* Zoom In Global Switch */
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
		#endregion /* Zoom In END */
		
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

#region /* Step Run Toggling */
key_player_run_toggle_pressed[1] = scr_key_initialize(key_player_run_toggle_pressed[1], 1, 1, action.run_toggle);
key_player_run_toggle_pressed[2] = scr_key_initialize(key_player_run_toggle_pressed[2], 1, 2, action.run_toggle);
key_player_run_toggle_pressed[3] = scr_key_initialize(key_player_run_toggle_pressed[3], 1, 3, action.run_toggle);
key_player_run_toggle_pressed[4] = scr_key_initialize(key_player_run_toggle_pressed[4], 1, 4, action.run_toggle);

if (key_player_run_toggle_pressed[1])
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player[1] = 100;
	show_run_toggle_for_player[2] = 0;
	show_run_toggle_for_player[3] = 0;
	show_run_toggle_for_player[4] = 0;
	if (!global.player_run_toggle[1])
	{
		global.player_run_toggle[1] = true;
	}
	else
	{
		global.player_run_toggle[1] = false;
	}
}
if (key_player_run_toggle_pressed[2])
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player[1] = 0;
	show_run_toggle_for_player[2] = 100;
	show_run_toggle_for_player[3] = 0;
	show_run_toggle_for_player[4] = 0;
	if (!global.player_run_toggle[2])
	{
		global.player_run_toggle[2] = true;
	}
	else
	{
		global.player_run_toggle[2] = false;
	}
}
if (key_player_run_toggle_pressed[3])
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player[1] = 0;
	show_run_toggle_for_player[2] = 0;
	show_run_toggle_for_player[3] = 100;
	show_run_toggle_for_player[4] = 0;
	if (!global.player_run_toggle[3])
	{
		global.player_run_toggle[3] = true;
	}
	else
	{
		global.player_run_toggle[3] = false;
	}
}
if (key_player_run_toggle_pressed[4])
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player[1] = 0;
	show_run_toggle_for_player[2] = 0;
	show_run_toggle_for_player[3] = 0;
	show_run_toggle_for_player[4] = 100;
	if (!global.player_run_toggle[4])
	{
		global.player_run_toggle[4] = true;
	}
	else
	{
		global.player_run_toggle[4] = false;
	}
}
#endregion /* Step Run Toggling END */

#region /* Show HUD timers */

#region /* If HUD show timer is set to always hide */
if (global.hud_hide_time <= 0)
{
	hud_show_lives_timer = 0;
	hud_show_defeats_timer = 0;
	hud_show_basic_collectibles_timer = 0;
	hud_show_big_collectibles_timer = 0;
	hud_show_score_timer = 0;
}
else
if (show_letterbox > 0)
{
	/* Even when there is letterbox, like after you lose, you should still be able to see how many lives you have */
	hud_show_basic_collectibles_timer = 0;
	hud_show_big_collectibles_timer = 0;
	hud_show_score_timer = 0;
}
#endregion /* If HUD show timer is set to always hide */

#region /* If HUD show timer is set to never hide */
if (global.hud_hide_time >= 10)
{
	hud_show_lives_timer = global.hud_hide_time * 60;
	if (global.show_defeats_counter)
	{
		hud_show_defeats_timer = global.hud_hide_time * 60;
	}
	hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
	hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	hud_show_score_timer = global.hud_hide_time * 60;
}
#endregion /* If HUD show timer is set to never hide */

if (global.hud_hide_time >= 10)
{
	if (global.show_defeats_counter)
	{
		hud_show_defeats_timer = global.hud_hide_time * 60;
	}
	hud_show_lives_timer = global.hud_hide_time * 60;
	hud_show_defeats_timer = global.hud_hide_time * 60;
	hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
	hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	hud_show_score_timer = global.hud_hide_time * 60;
}
else
{
	if (hud_show_lives_timer > 0)
	{
		hud_show_lives_timer --;
	}
	if (hud_show_defeats_timer > 0)
	{
		hud_show_defeats_timer --;
	}
	if (hud_show_big_collectibles_timer > 0)
	{
		hud_show_big_collectibles_timer --;
	}
	if (hud_show_score_timer > 0)
	{
		hud_show_score_timer --;
	}
}

#region /* Y position of all HUD should be lerping onto screen when it's relevant */
if (global.hud_hide_time > 0)
{
	/*
	Show these in right order:
	Lives
	Defeats
	Big Collectibles
	Basic Collectibles
	*/
	
	#region /* Show Lives y position */
	if (room == rm_world_map)
	{
		hud_show_lives_y = 32;
	}
	else
	{
		if (hud_show_lives_timer > 0)
		{
			hud_show_lives_y = lerp(hud_show_lives_y, 32, 0.1);
		}
		else
		{
			hud_show_lives_y = lerp(hud_show_lives_y, -64, 0.1);
		}
	}
	#endregion /* Show Lives y position END */
	
	#region /* Show Defeats y position */
	if (hud_show_defeats_timer > 0)
	&& (global.show_defeats_counter)
	{
		if (hud_show_lives_y > 0)
		{
			hud_show_defeats_y = lerp(hud_show_defeats_y, 70, 0.1);
		}
		else
		{
			hud_show_defeats_y = lerp(hud_show_defeats_y, 32, 0.1);
		}
	}
	else
	{
		hud_show_defeats_y = lerp(hud_show_defeats_y, -64, 0.1);
	}
	#endregion /* Show Defeats y position END */
	
	#region /* Show Big Collectibles y position */
	if (hud_show_big_collectibles_timer > 0) /* Make sure it says BIG collectibles */
	{
		if (hud_show_lives_y > 0)
		&& (hud_show_defeats_y > 0)
		{
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 110, 0.1);
		}
		else
		if (hud_show_lives_y > 0)
		{
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 70, 0.1);
		}
		else
		{
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 30, 0.1);
		}
	}
	else
	{
		hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, -64, 0.1);
	}
	#endregion /* Show Big Collectibles y position END */
	
	#region /* Show Basic Collectible y position */
	if (hud_show_basic_collectibles_timer > 0) /* Make sure it says BASIC collectibles */
	{
		hud_show_basic_collectibles_timer --;
		
		if (hud_show_lives_y > 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y > 0)
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 150, 0.1);
		}
		else
		if (hud_show_lives_y < 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y > 0)
		or(hud_show_lives_y > 0)
		&& (hud_show_defeats_y < 0)
		&& (hud_show_big_collectibles_y > 0)
		or(hud_show_lives_y > 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y < 0)
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 110, 0.1);
		}
		else
		if (hud_show_lives_y > 0)
		&& (hud_show_defeats_y < 0)
		&& (hud_show_big_collectibles_y < 0)
		or(hud_show_lives_y < 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y < 0)
		or(hud_show_lives_y < 0)
		&& (hud_show_defeats_y < 0)
		&& (hud_show_big_collectibles_y > 0)
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 64, 0.1);
		}
		else
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 32, 0.1);
		}
	}
	else
	{
		hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, -64, 0.1);
	}
	#endregion /* Show Basic Collectible y position END */
	
	#region /* Show Score y position */
	if (hud_show_score_timer > 0)
	{
		if (global.controls_used_for_navigation == "mouse")
		{
			hud_show_score_y = lerp(hud_show_score_y, 32 + 42, 0.1);
		}
		else
		{
			hud_show_score_y = lerp(hud_show_score_y, 32, 0.1);
		}
	}
	else
	{
		hud_show_score_y = lerp(hud_show_score_y, -128, 0.1);
	}
	#endregion /* Show Score y position END */
	
}
#endregion /* Y position of all HUD should be lerping onto screen when it's relevant END */

#endregion /* Show HUD timers END */

#region /* Show Controls */
if (os_type != os_ios)
&& (os_type != os_android)
&& (!instance_exists(obj_pause))
{
	
	#region /* Show Multiplayer Controls */
	
	#region /* Y position of show controls for each player */
	if (player_show_controls_alpha[1] > 0)
	&& (player_show_controls_alpha[2] <= 0)
	&& (player_show_controls_alpha[3] <= 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], 32, 0.1);
		show_player_controls_y[2] = lerp(show_player_controls_y[2], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[3] = lerp(show_player_controls_y[3], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player_show_controls_alpha[1] <= 0)
	&& (player_show_controls_alpha[2] > 0)
	&& (player_show_controls_alpha[3] <= 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[2] = lerp(show_player_controls_y[2], 32, 0.1);
		show_player_controls_y[3] = lerp(show_player_controls_y[3], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player_show_controls_alpha[1] <= 0)
	&& (player_show_controls_alpha[2] <= 0)
	&& (player_show_controls_alpha[3] > 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[2] = lerp(show_player_controls_y[2], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[3] = lerp(show_player_controls_y[3], 32, 0.1);
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player_show_controls_alpha[1] <= 0)
	&& (player_show_controls_alpha[2] <= 0)
	&& (player_show_controls_alpha[3] <= 0)
	&& (player_show_controls_alpha[4] > 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[2] = lerp(show_player_controls_y[2], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[3] = lerp(show_player_controls_y[3], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[4] = lerp(show_player_controls_y[4], 32, 0.1);
	}
	else
	if (player_show_controls_alpha[1] > 0)
	&& (player_show_controls_alpha[2] > 0)
	&& (player_show_controls_alpha[3] <= 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], 74, 0.1);
		show_player_controls_y[2] = lerp(show_player_controls_y[2], 32, 0.1);
		show_player_controls_y[3] = lerp(show_player_controls_y[3], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player_show_controls_alpha[1] > 0)
	&& (player_show_controls_alpha[2] > 0)
	&& (player_show_controls_alpha[3] > 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], 116, 0.1);
		show_player_controls_y[2] = lerp(show_player_controls_y[2], 74, 0.1);
		show_player_controls_y[3] = lerp(show_player_controls_y[3], 32, 0.1);
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player_show_controls_alpha[1] > 0)
	&& (player_show_controls_alpha[2] <= 0)
	&& (player_show_controls_alpha[3] > 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], 74, 0.1);
		show_player_controls_y[2] = lerp(show_player_controls_y[2], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[3] = lerp(show_player_controls_y[3], 32, 0.1);
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player_show_controls_alpha[1] <= 0)
	&& (player_show_controls_alpha[2] > 0)
	&& (player_show_controls_alpha[3] > 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[2] = lerp(show_player_controls_y[2], 74, 0.1);
		show_player_controls_y[3] = lerp(show_player_controls_y[3], 32, 0.1);
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	if (player_show_controls_alpha[1] <= 0)
	&& (player_show_controls_alpha[2] <= 0)
	&& (player_show_controls_alpha[3] <= 0)
	&& (player_show_controls_alpha[4] <= 0)
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[2] = lerp(show_player_controls_y[2], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[3] = lerp(show_player_controls_y[3], + 32, 0.1); /* + 32 = don't show */
		show_player_controls_y[4] = lerp(show_player_controls_y[4], + 32, 0.1); /* + 32 = don't show */
	}
	else
	{
		show_player_controls_y[1] = lerp(show_player_controls_y[1], 158, 0.1);
		show_player_controls_y[2] = lerp(show_player_controls_y[2], 116, 0.1);
		show_player_controls_y[3] = lerp(show_player_controls_y[3], 74, 0.1);
		show_player_controls_y[4] = lerp(show_player_controls_y[4], 32, 0.1);
	}
	#endregion /* Y position of show controls for each player END */
	
	#endregion /* Show Multiplayer Controls END */
	
}
#endregion /* Show Controls END */

#region /* Show what input is used */
if (show_controller_input_change_prompt > 0)
{
	show_controller_input_change_prompt --;
	show_keyboard_and_mouse_input_change_prompt = 0;
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, -400, 0.1);
}
else
{
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, 0, 0.1);
}

if (show_keyboard_and_mouse_input_change_prompt > 0)
{
	show_keyboard_and_mouse_input_change_prompt --;
	show_controller_input_change_prompt = 0;
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, -400, 0.1);
}
else
{
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, 0, 0.1);
}
#endregion /* Show what input is used END */

#region /* Letterboxing during cutscenes (when the player object is absent) */
if (!instance_exists(obj_player))
|| (instance_exists(obj_player))
&& (!obj_player.can_move)
{
	letterbox_top_y = lerp(letterbox_top_y, + 64, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, display_get_gui_height() - 64, 0.1);
	show_letterbox = 60;
}
else
{
	letterbox_top_y = lerp(letterbox_top_y, 0, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, display_get_gui_height(), 0.1);
	if (show_letterbox > 0)
	{
		show_letterbox --;
	}
}
#endregion /* Letterboxing during cutscenes (when the player object is absent) END */

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (iris_xscale <= 1)
&& (iris_zoom != 0)
&& (delay <= 1)
|| (instance_exists(obj_player_lose))
&& (obj_player_lose.iris_xscale <= 1)
&& (obj_player_lose.iris_zoom != 0)
&& (delay <= 1)
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 1, 0.1);
}
else
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 0, 0.1);
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */

scr_deactivate_objects_outside_view(); /* This function needs to be at the very end of the step event */