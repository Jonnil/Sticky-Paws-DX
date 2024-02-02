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

for(var i = 1; i <= global.max_players; i += 1)
{
	
	#region /* Player Show Controls HUD timer */
	if (player[i] >= 1)
	&& (instance_exists(player[i]))
	&& (iris_xscale >= 10)
	{
		if (global.player_show_controls[i] == 0)
		|| (!player[i].can_move)
		|| (global.goal_active)
		{
			player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 0, 0.2);
		}
		else
		if (global.player_show_controls[i] >= 1)
		&& (global.player_show_controls[i] <= 9)
		{
			if (player_show_controls_timer[i] >= 1)
			{
				player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 0, 0.2);
				player_show_controls_timer[i] --;
			}
			if (player_show_controls_timer[i] <= 0)
			&& (player[i].speed == 0)
			{
				player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 1, 0.1);
			}
		}
		else
		if (global.player_show_controls[i] == 10)
		{
			player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 1, 0.1);
		}
	
		if (player[i].speed > 0)
		|| (player[i].intro_animation != "")
		{
			player_show_controls_timer[i] = get_room_speed * global.player_show_controls[i];
		}
	}
	else
	if (global.player_can_play[i])
	{
		player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 1, 0.1);
	}
	else
	{
		player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 0, 0.2);
		player_show_controls_timer[i] = get_room_speed * global.player_show_controls[i];
	}
	#endregion /* Player Show Controls HUD timer */
	
	#region /* Stop gamepad vibration for player */
	if (is_array(player_vibration_active))
	{
		if (player_vibration_active[i] <= 0)
		{
			player_motor_speed[i] = lerp(player_motor_speed[i], 0, 0.1);
		}
		else
		{
			player_vibration_active[i] --;
		}
	}
	else
	{
		player_motor_speed[i] = lerp(player_motor_speed[i], 0, 0.1);
	}
	gamepad_set_vibration(i - 1, player_motor_speed[i], player_motor_speed[i]);
	#endregion /* Stop gamepad vibration for player END */
	
}

#region /* Spawn Players in multiplayer */
if (!global.pause)
&& (!global.goal_active)
&& (instance_exists(obj_player))
{
	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (gamepad_button_check_pressed(global.player_slot[i], global.player_[inp.gp][i][1][action.accept]) && gamepad_is_connected(global.player_slot[i]))
		|| (keyboard_check_pressed(global.player_[inp.key][i][1][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][i][2][action.accept]))
		{
			if (player[i] <= 0)
			&& (can_spawn_player[i])
			&& (lives >= 1)
			{
				if (!global.player_can_play[i]) {
					global.player_can_play[i] = true;
				}
				player[i] = instance_create_depth(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 0, obj_player);
				with(player[i])
				{
					custom_character = global.character_for_player[i];
					selected_voice_pack = global.voicepack_for_player[i];
					selected_skin = global.skin_for_player[i];
					player = i;
				}
			}
			else
			if (lives <= 0)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
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
		for(var i = 1; i <= global.max_players; i += 1)
		{
		    if (player[i] > 0 && instance_exists(player[i]))
		    {
		        xx = mean(player[i].x, obj_boss.x);
		        yy = mean(player[i].y, obj_boss.y);
		        break; /* exit the loop once a valid player is found */
		    }
		}
	}
	#endregion /* Boss Battle Camera END */
	
	else
	
	#region /* MULTIPLAYER CAMERA */
	if (instance_number(obj_player) >= 2) /* If there are 2 or more players then use multiplayer camera */
	{
		
		#region /* Camera should follow multiple players */
		/* 1, 2, 3, 4 */
		if (player[1] > 0)
		&& (player[2] > 0)
		&& (player[3] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[2]))
		&& (instance_exists(player[3]))
		&& (instance_exists(player[4]))
		{
			xx = mean(player[1].x, player[2].x, player[3].x, player[4].x);
			yy = mean(player[1].y, player[2].y, player[3].y, player[4].y);
		}
		
		else
		
		/* 1, 2, 3 */
		if (player[1] > 0)
		&& (player[2] > 0)
		&& (player[3] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[2]))
		&& (instance_exists(player[3]))
		{
			xx = mean(player[1].x, player[2].x, player[3].x);
			yy = mean(player[1].y, player[2].y, player[3].y);
		}
		
		else
		
		/* 1, 2 */
		if (player[1] > 0)
		&& (player[2] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[2]))
		{
			xx = mean(player[1].x, player[2].x);
			yy = mean(player[1].y, player[2].y);
		}
		
		else
		
		/* 1, 3 */
		if (player[1] > 0)
		&& (player[3] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[3]))
		{
			xx = mean(player[1].x, player[3].x);
			yy = mean(player[1].y, player[3].y);
		}
		
		else
		
		/* 1, 4 */
		if (player[1] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[4]))
		{
			xx = mean(player[1].x, player[4].x);
			yy = mean(player[1].y, player[4].y);
		}
		
		else
		
		/* 2, 3 */
		if (player[2] > 0)
		&& (player[3] > 0)
		&& (instance_exists(player[2]))
		&& (instance_exists(player[3]))
		{
			xx = mean(player[2].x, player[3].x);
			yy = mean(player[2].y, player[3].y);
		}
		
		else
		
		/* 2, 4 */
		if (player[1] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[4]))
		{
			xx = mean(player[2].x, player[4].x);
			yy = mean(player[2].y, player[4].y);
		}
		
		else
		
		/* 3, 4 */
		if (player[3] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[3]))
		&& (instance_exists(player[4]))
		{
			xx = mean(player[3].x, player[4].x);
			yy = mean(player[3].y, player[4].y);
		}
		#endregion /* Camera should follow multiple players END */
		
	}
	#endregion /* MULTIPLAYER CAMERA */
	
	else
	
	#region /* SINGLEPLAYER CAMERA */
	if (instance_number(obj_player) == 1) /* If there are only 1 player (==1) then use singleplayer camera */
	{
		
		#region /* Follow one player. In case something goes wrong, camera will always follow one player */
		for(var i = 1; i <= global.max_players; i += 1)
		{
			if (player[i] >= 1)
			&& (instance_exists(player[i]))
			{
				
				#region /* Tries to be a bit ahead of player */
				xx = player[i].x + player[i].hspeed * 15;
				if (player[i].on_ground)
				&& (player[i].vspeed >= 0)
				{
					yy = player[i].y
				}
				else
				if (player[i].y < camera_get_view_y(view_camera[view_current]) + 128)
				{
					yy -= abs(player[i].vspeed);
				}
				if (player[i].wall_jump)
				|| (player[i].climb)
				{
					yy = player[i].y
				}
				if (player[i].y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
				{
					yy = player[i].y;
				}
				#endregion /* Tries to be a bit ahead of player END */
			
				#region /* Follow Player in y position when doing specific things */
				if (player[i].in_water)
				|| (player[i].stick_to_wall)
				|| (player[i].spring)
				|| (player[i].climb)
				|| (player[i].horizontal_rope_climb)
				{
					if (player[i].y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5)
					{
						yy = player[i].y;
					}
				}
				#endregion /* Follow Player in y position when doing specific things END */
				
			}
		}
		#endregion /* Follow one player. In case something goes wrong, camera will always follow one player END */
		
	}
	else
	{
		xx = x; /* Otherwise, just follow x */
		yy = y; /* Otherwise, just follow y */
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
for(var i = 1; i <= global.max_players; i += 1)
{
	key_player_run_toggle_pressed[i] = scr_key_initialize(key_player_run_toggle_pressed[i], 1, i, action.run_toggle);
	
	if (key_player_run_toggle_pressed[i])
	{
		show_run_toggle_for_player[i] = 100;
		/* Reset other player toggles */
	    for(var j = 1; j <= global.max_players; j += 1)
	    {
	        if (j != i)
	        {
	            show_run_toggle_for_player[j] = 0;
	        }
	    }
		global.player_run_toggle[i] = !global.player_run_toggle[i];
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

#region /* Show Multiplayer Controls. Y position of show controls for each player */
if (os_type != os_ios)
&& (os_type != os_android)
{
	var how_many_players_are_playing = 0;
	
	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (player_show_controls_alpha[i] > 0 && global.player_show_controls[i] > 0 && global.player_can_play[i]) {
			how_many_players_are_playing += 1;
		}
	}
    
	var controls_hud_y = 32 + (42 * how_many_players_are_playing); /* Initialize controls_hud_y to the maximum value, based on max amount of players */
	
	for(var i = 1; i <= global.max_players; i += 1) {
		if (player_show_controls_alpha[i] > 0) /* If player show controls alpha is more than 0, then change the y position to correct position */
		{
			/* Set the controls_hud_y to be decending, from first player to last player */
			controls_hud_y -= 42; /* If player show controls alpha is more than 0, decrease controls_hud_y by 42 */
			show_player_controls_y[i] = lerp(show_player_controls_y[i], controls_hud_y, 0.1);
		}
		else /* If player show controls alpha is not more than 0, then hide the hud by setting it to +34 */
		{
			show_player_controls_y[i] = lerp(show_player_controls_y[i], +34, 0.1); /* + 34 = don't show */
		}
	}
}
#endregion /* Show Multiplayer Controls. Y position of show controls for each player END */

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