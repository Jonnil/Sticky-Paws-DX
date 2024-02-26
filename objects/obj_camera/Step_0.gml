/* Script functions */
scr_set_screen_size();
scr_set_controls_used_to_navigate();
scr_zoom_camera_controls();
scr_toggle_fullscreen();
scr_resize_application_surface();

if (!have_set_numbers) { /* Have to set numbers in step event like this for it to work in every case */
	have_set_numbers = true;
	
	#region /* Set big collectible numbers for every big collectible */
	for(set_all_big_collectible = 0; set_all_big_collectible < instance_number(obj_big_collectible_number) + 1; set_all_big_collectible += 1) {
		if (instance_number(obj_big_collectible_number) >= set_all_big_collectible) {
			with (instance_nth_nearest(global.level_player_start_x[1], global.level_player_start_y[1], obj_big_collectible_number, set_all_big_collectible)) {
				big_collectible = obj_camera.set_all_big_collectible;
			}
		}
	}
	#endregion /* Set big collectible numbers for every big collectible END */
	
	#region /* Set checkpoint numbers for every checkpoint */
	for(checkpoint_number = 0;checkpoint_number < instance_number(obj_checkpoint) + 1;checkpoint_number += 1) {
		if (instance_number(obj_checkpoint) >= checkpoint_number) {
			with (instance_nth_nearest(global.level_player_start_x[1], global.level_player_start_y[1], obj_checkpoint, checkpoint_number)) {
				checkpoint_number = obj_camera.checkpoint_number;
			}
		}
	}
	#endregion /* Set checkpoint numbers for every checkpoint END */
	
}

global.appear_block_timer ++;
if (global.appear_block_timer > 60 * 5) {
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
if (!global.pause && !global.goal_active) {
	time_second++;
	if (time_second > get_room_speed) {
		time_second = 0;
		global.time_countdown_bonus--;
		if (global.enable_time_countdown) {
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
if (global.effect_rain && part_system_exists(part_system_rain)) {
	part_emitter_region(part_system_rain, 0, camera_get_view_x(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - 32, camera_get_view_y(view_camera[view_current]) - 32, ps_shape_rectangle, ps_distr_linear);
}
#endregion /* Rain Effect END */

#region /* Snow Effect */
if (global.effect_snow && part_system_exists(part_system_snow)) {
	part_emitter_region(part_system_snow, 0, camera_get_view_x(view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), camera_get_view_y(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]), ps_shape_rectangle, ps_distr_linear);
	if (irandom(9) == 0) { /* Reduce the frequency of snowflakes. irandom generates a random integer between 0 and 9 */
		effect_create_below(ef_snow, x, y, 2, c_white);
	}
}
#endregion /* Snow Effect END */

for(var i = 1; i <= global.max_players; i += 1) {
	
	#region /* Player Show Controls HUD timer */
	if (player[i] >= 1)
	&& (instance_exists(player[i]))
	&& (iris_xscale >= 10) {
		if (global.player_show_controls[i] == 0)
		|| (!player[i].can_move)
		|| (global.goal_active) {
			player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 0, 0.2);
		}
		else
		if (global.player_show_controls[i] >= 1)
		&& (global.player_show_controls[i] <= 9) {
			if (player_show_controls_timer[i] >= 1) {
				player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 0, 0.2);
				player_show_controls_timer[i] --;
			}
			if (player_show_controls_timer[i] <= 0)
			&& (player[i].speed == 0) {
				player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 1, 0.1);
			}
		}
		else
		if (global.player_show_controls[i] == 10) {
			player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 1, 0.1);
		}
		if (player[i].speed > 0)
		|| (player[i].intro_animation != "") {
			player_show_controls_timer[i] = get_room_speed * global.player_show_controls[i];
		}
	}
	else
	if (global.player_can_play[i]) {
		player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 1, 0.1);
	}
	else {
		player_show_controls_alpha[i] = lerp(player_show_controls_alpha[i], 0, 0.2);
		player_show_controls_timer[i] = get_room_speed * global.player_show_controls[i];
	}
	#endregion /* Player Show Controls HUD timer */
	
	#region /* Stop gamepad vibration for player */
	if (is_array(player_vibration_active)) {
		if (player_vibration_active[i] <= 0) {
			player_motor_speed[i] = lerp(player_motor_speed[i], 0, 0.1);
		}
		else {
			player_vibration_active[i] --;
		}
	}
	else {
		player_motor_speed[i] = lerp(player_motor_speed[i], 0, 0.1);
	}
	gamepad_set_vibration(i - 1, player_motor_speed[i], player_motor_speed[i]);
	#endregion /* Stop gamepad vibration for player END */
	
}

#region /* Spawn Players in multiplayer */
if (!global.pause)
&& (!global.goal_active)
&& (instance_exists(obj_player)) {
	for(var i = 1; i <= global.max_players; i += 1) {
		if (gamepad_button_check_pressed(global.player_slot[i], global.player_[inp.gp][i][1][action.accept]) && gamepad_is_connected(global.player_slot[i]))
		|| (keyboard_check_pressed(global.player_[inp.key][i][1][action.accept]))
		|| (keyboard_check_pressed(global.player_[inp.key][i][2][action.accept])) {
			if (player[i] <= 0)
			&& (can_spawn_player[i])
			&& (lives >= 1) {
				if (!global.player_can_play[i]) {
					global.player_can_play[i] = true;
				}
				player[i] = instance_create_depth(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 0, obj_player);
				with(player[i]) {
					custom_character = global.character_for_player[i];
					selected_voicepack = global.voicepack_for_player[i];
					selected_skin = global.skin_for_player[i];
					player = i;
				}
			}
			else
			if (lives <= 0) {
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
	}
}
#endregion /* Spawn Players in multiplayer END */

if (!save_level_as_png) {
	if (shake > 0) {
		x = x + random_range(-shake, +shake);
		y = y + random_range(-shake, +shake);
		shake = lerp(shake, 0, 0.1);
	}
	
	x = lerp(x, xx, 0.1);
	y = lerp(y, yy, 0.15);
	
	#region /* Boss Battle Camera */
	if (instance_exists(obj_boss))
	&& (instance_exists(obj_player))
	&& (distance_to_object(obj_boss) < 400) {
		for(var i = 1; i <= global.max_players; i += 1) {
		    if (player[i] > 0 && instance_exists(player[i])) {
		        xx = mean(player[i].x, obj_boss.x);
		        yy = mean(player[i].y, obj_boss.y);
		        break; /* exit the loop once a valid player is found */
		    }
		}
	}
	#endregion /* Boss Battle Camera END */
	
	else
	
	#region /* MULTIPLAYER CAMERA */
	if (instance_number(obj_player) >= 2) { /* If there are 2 or more players then use multiplayer camera */
		
		#region /* Camera should follow multiple players */
		/* 1, 2, 3, 4 */
		if (player[1] > 0)
		&& (player[2] > 0)
		&& (player[3] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[2]))
		&& (instance_exists(player[3]))
		&& (instance_exists(player[4])) {
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
		&& (instance_exists(player[3])) {
			xx = mean(player[1].x, player[2].x, player[3].x);
			yy = mean(player[1].y, player[2].y, player[3].y);
		}
		
		else
		
		/* 1, 2 */
		if (player[1] > 0)
		&& (player[2] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[2])) {
			xx = mean(player[1].x, player[2].x);
			yy = mean(player[1].y, player[2].y);
		}
		
		else
		
		/* 1, 3 */
		if (player[1] > 0)
		&& (player[3] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[3])) {
			xx = mean(player[1].x, player[3].x);
			yy = mean(player[1].y, player[3].y);
		}
		
		else
		
		/* 1, 4 */
		if (player[1] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[4])) {
			xx = mean(player[1].x, player[4].x);
			yy = mean(player[1].y, player[4].y);
		}
		
		else
		
		/* 2, 3 */
		if (player[2] > 0)
		&& (player[3] > 0)
		&& (instance_exists(player[2]))
		&& (instance_exists(player[3])) {
			xx = mean(player[2].x, player[3].x);
			yy = mean(player[2].y, player[3].y);
		}
		
		else
		
		/* 2, 4 */
		if (player[1] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[1]))
		&& (instance_exists(player[4])) {
			xx = mean(player[2].x, player[4].x);
			yy = mean(player[2].y, player[4].y);
		}
		
		else
		
		/* 3, 4 */
		if (player[3] > 0)
		&& (player[4] > 0)
		&& (instance_exists(player[3]))
		&& (instance_exists(player[4])) {
			xx = mean(player[3].x, player[4].x);
			yy = mean(player[3].y, player[4].y);
		}
		#endregion /* Camera should follow multiple players END */
		
	}
	#endregion /* MULTIPLAYER CAMERA */
	
	else
	
	#region /* SINGLEPLAYER CAMERA */
	if (instance_number(obj_player) == 1) { /* If there are only 1 player (==1) then use singleplayer camera */
		
		#region /* Follow one player. In case something goes wrong, camera will always follow one player */
		for(var i = 1; i <= global.max_players; i += 1) {
			if (player[i] >= 1 && instance_exists(player[i])) {
				
				#region /* Tries to be a bit ahead of player */
				xx = player[i].x + player[i].hspeed * 15;
				if (player[i].on_ground && player[i].vspeed >= 0) {
					yy = player[i].y
				}
				else
				if (player[i].y < camera_get_view_y(view_camera[view_current]) + 128) {
					yy -= abs(player[i].vspeed);
				}
				if (player[i].wall_jump || player[i].climb) {
					yy = player[i].y
				}
				if (player[i].y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5) {
					yy = player[i].y;
				}
				#endregion /* Tries to be a bit ahead of player END */
				
				#region /* Follow Player in y position when doing specific things */
				if (player[i].in_water)
				|| (player[i].stick_to_wall)
				|| (player[i].spring)
				|| (player[i].climb)
				|| (player[i].horizontal_rope_climb) {
					if (player[i].y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5) {
						yy = player[i].y;
					}
				}
				#endregion /* Follow Player in y position when doing specific things END */
				
			}
		}
		#endregion /* Follow one player. In case something goes wrong, camera will always follow one player END */
		
	}
	else {
		xx = x; /* Otherwise, just follow x */
		yy = y; /* Otherwise, just follow y */
	}
	#endregion /* SINGLEPLAYER CAMERA */
	
}

#region /* Iris */
if (allow_iris && !save_level_as_png) {
		
	#region /* Zoom In */
	if (global.player_has_entered_goal)
	&& (global.time_countdown_bonus <= 0)
	|| (global.iris_zoom_in) { /* Zoom In Global Switch */
		if (iris_zoom == 1) {
			iris_xscale = lerp(iris_xscale, 1, 0.15);
			iris_yscale = lerp(iris_yscale, 1, 0.15);
			if (iris_xscale <= 1.1) {
				iris_zoom = 0;
			}
		}
		else {
			iris_xscale = lerp(iris_xscale, 0, 0.15);
			iris_yscale = lerp(iris_yscale, 0, 0.15);
			if (iris_xscale <= 1.1) {
				iris_zoom = 0;
			}
		}
	}
	#endregion /* Zoom In END */
		
	else
		
	#region /* Zoom Out */
	if (iris_zoom == 0) {
		iris_xscale = lerp(iris_xscale, 1, 0.15);
		iris_yscale = lerp(iris_yscale, 1, 0.15);
		if (iris_xscale >= 0.99) {
			iris_zoom = 1;
		}
	}
	else {
		iris_xscale = lerp(iris_xscale, 32, 0.015);
		iris_yscale = lerp(iris_yscale, 32, 0.015);
		if (iris_xscale >= 0.99) {
			iris_zoom = 1;
		}
	}
	#endregion /* Zoom Out END */
		
}
#endregion /* Iris END */

#region /* Step Run Toggling */
for(var i = 1; i <= global.max_players; i += 1) {
	key_player_run_toggle_pressed[i] = scr_key_initialize(key_player_run_toggle_pressed[i], 1, i, action.run_toggle);
	
	if (key_player_run_toggle_pressed[i]) {
		show_run_toggle_for_player[i] = 100;
		/* Reset other player toggles */
	    for(var j = 1; j <= global.max_players; j += 1) {
	        if (j != i) {
	            show_run_toggle_for_player[j] = 0;
	        }
	    }
		global.player_run_toggle[i] = !global.player_run_toggle[i];
	}
}
#endregion /* Step Run Toggling END */

#region /* Show HUD timers */

#region /* If HUD show timer is set to always hide */
if (global.hud_hide_time <= 0) {
	hud_show_lives_timer = 0;
	hud_show_defeats_timer = 0;
	hud_show_basic_collectibles_timer = 0;
	hud_show_big_collectibles_timer = 0;
	hud_show_score_timer = 0;
}
else
if (show_letterbox > 0) {
	/* Even when there is letterbox, like after you lose, you should still be able to see how many lives you have */
	hud_show_basic_collectibles_timer = 0;
	hud_show_big_collectibles_timer = 0;
	hud_show_score_timer = 0;
}
#endregion /* If HUD show timer is set to always hide */

#region /* If HUD show timer is set to never hide */
if (global.hud_hide_time >= 10) {
	hud_show_lives_timer = global.hud_hide_time * 60;
	if (global.show_defeats_counter) {
		hud_show_defeats_timer = global.hud_hide_time * 60;
	}
	hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
	hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	hud_show_score_timer = global.hud_hide_time * 60;
}
#endregion /* If HUD show timer is set to never hide */

if (global.hud_hide_time >= 10) {
	if (global.show_defeats_counter) {
		hud_show_defeats_timer = global.hud_hide_time * 60;
	}
	hud_show_lives_timer = global.hud_hide_time * 60;
	hud_show_defeats_timer = global.hud_hide_time * 60;
	hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
	hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	hud_show_score_timer = global.hud_hide_time * 60;
}
else {
	if (hud_show_lives_timer > 0) {
		hud_show_lives_timer --;
	}
	if (hud_show_defeats_timer > 0) {
		hud_show_defeats_timer --;
	}
	if (hud_show_big_collectibles_timer > 0) {
		hud_show_big_collectibles_timer --;
	}
	if (hud_show_score_timer > 0) {
		hud_show_score_timer --;
	}
}

#region /* Y position of all HUD should be lerping onto screen when it's relevant */
if (global.hud_hide_time > 0) {
	/*
	Show these in right order:
	Lives
	Defeats
	Big Collectibles
	Basic Collectibles
	*/
	
	#region /* Show Lives y position */
	if (room == rm_world_map) {
		hud_show_lives_y = 32;
	}
	else {
		if (hud_show_lives_timer > 0) {
			hud_show_lives_y = lerp(hud_show_lives_y, 32, 0.1);
		}
		else {
			hud_show_lives_y = lerp(hud_show_lives_y, -64, 0.1);
		}
	}
	#endregion /* Show Lives y position END */
	
	#region /* Show Defeats y position */
	if (hud_show_defeats_timer > 0 && global.show_defeats_counter) {
		if (hud_show_lives_y > 0) {
			hud_show_defeats_y = lerp(hud_show_defeats_y, 70, 0.1);
		}
		else {
			hud_show_defeats_y = lerp(hud_show_defeats_y, 32, 0.1);
		}
	}
	else {
		hud_show_defeats_y = lerp(hud_show_defeats_y, -64, 0.1);
	}
	#endregion /* Show Defeats y position END */
	
	#region /* Show Big Collectibles y position */
	if (hud_show_big_collectibles_timer > 0) { /* Make sure it says BIG collectibles */
		if (hud_show_lives_y > 0 && hud_show_defeats_y > 0) {
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 110, 0.1);
		}
		else
		if (hud_show_lives_y > 0) {
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 70, 0.1);
		}
		else {
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 30, 0.1);
		}
	}
	else {
		hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, -64, 0.1);
	}
	#endregion /* Show Big Collectibles y position END */
	
	#region /* Show Basic Collectible y position */
	if (hud_show_basic_collectibles_timer > 0) { /* Make sure it says BASIC collectibles */
		hud_show_basic_collectibles_timer --;
		
		if (hud_show_lives_y > 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y > 0) {
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 150, 0.1);
		}
		else
		if (hud_show_lives_y < 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y > 0)
		|| (hud_show_lives_y > 0)
		&& (hud_show_defeats_y < 0)
		&& (hud_show_big_collectibles_y > 0)
		|| (hud_show_lives_y > 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y < 0) {
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 110, 0.1);
		}
		else
		if (hud_show_lives_y > 0)
		&& (hud_show_defeats_y < 0)
		&& (hud_show_big_collectibles_y < 0)
		|| (hud_show_lives_y < 0)
		&& (hud_show_defeats_y > 0)
		&& (hud_show_big_collectibles_y < 0)
		|| (hud_show_lives_y < 0)
		&& (hud_show_defeats_y < 0)
		&& (hud_show_big_collectibles_y > 0) {
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 64, 0.1);
		}
		else {
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 32, 0.1);
		}
	}
	else {
		hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, -64, 0.1);
	}
	#endregion /* Show Basic Collectible y position END */
	
	#region /* Show Score y position */
	if (hud_show_score_timer > 0) {
		hud_show_score_y = lerp(hud_show_score_y, 32, 0.1);
	}
	else {
		hud_show_score_y = lerp(hud_show_score_y, -128, 0.1);
	}
	#endregion /* Show Score y position END */
	
}
#endregion /* Y position of all HUD should be lerping onto screen when it's relevant END */

#endregion /* Show HUD timers END */

scr_set_show_controls_y();

#region /* Show what input is used */
if (show_controller_input_change_prompt > 0) {
	show_controller_input_change_prompt --;
	show_keyboard_and_mouse_input_change_prompt = 0;
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, -400, 0.1);
}
else {
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, 0, 0.1);
}

if (show_keyboard_and_mouse_input_change_prompt > 0) {
	show_keyboard_and_mouse_input_change_prompt --;
	show_controller_input_change_prompt = 0;
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, -400, 0.1);
}
else {
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, 0, 0.1);
}
#endregion /* Show what input is used END */

#region /* Letterboxing during cutscenes (when the player object is absent) */
if (!instance_exists(obj_player))
|| (instance_exists(obj_player))
&& (!obj_player.can_move) {
	letterbox_top_y = lerp(letterbox_top_y, + 64, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, display_get_gui_height() - 64, 0.1);
	show_letterbox = 60;
}
else {
	letterbox_top_y = lerp(letterbox_top_y, 0, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, display_get_gui_height(), 0.1);
	if (show_letterbox > 0) {
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
&& (delay <= 1) {
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 1, 0.1);
}
else {
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 0, 0.1);
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */

if (global.character_select_in_this_menu == "level_editor")
&& (global.play_edited_level) /* When playtesting the level */
&& (!global.actually_play_edited_level) /* But not actually playing the level */
&& (!global.doing_clear_check_level)
&& (!global.doing_clear_check_character)
|| (global.character_select_in_this_menu == "main_game")
&& (global.debug_screen)
&& (!global.doing_clear_check_level)
&& (!global.doing_clear_check_character) {
	
	show_playtest_buttons = true;
	
	#region /* Press Pause button */
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), pause_x - 32 + 1, display_get_gui_height() - 64, pause_x + 32, display_get_gui_height() + 64 - 1)
	|| gamepad_button_check_pressed(global.player_slot[1], gp_select))
	&& (pause_x > 0) {
		if (mouse_check_button_pressed(mb_left)) {
			can_click_on_pause_key = true;
		}
		if (mouse_check_button_released(mb_left))
		&& (can_click_on_pause_key)
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), pause_x - 32 + 1, display_get_gui_height() - 64, pause_x + 32, display_get_gui_height() + 64 - 1))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_select)) {
			scr_gamepad_vibration(0, 0, 0); /* Reset gamepad vibration when exiting playtest */
			scr_gamepad_vibration(1, 0, 0);
			scr_gamepad_vibration(2, 0, 0);
			scr_gamepad_vibration(3, 0, 0);
			scr_gamepad_vibration(4, 0, 0);
			pause_playtest = true;
			black_screen_gui_alpha = 1;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			score = 0;
			
			#region /* Save Level Information when in level editor */
			if (global.level_name != "" && !global.actually_play_edited_level) {
				ini_open(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* Save Level Information when in level editor END */
			
			var time_source = time_source_create(time_source_game, 1, time_source_units_frames, function() {
				room_restart();
			}
			, [], 1);
			time_source_start(time_source);
		}
	}
	else
	if (mouse_check_button_released(mb_left) && can_click_on_pause_key) {
		can_click_on_pause_key = false;
	}
	#endregion /* Press Pause button END */
	
	/* Press Invincibility button */
	if (mouse_check_button_released(mb_left))
	&& (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), playtest_invincibility_x - 32, display_get_gui_height() - 64, playtest_invincibility_x + 32, display_get_gui_height() + 64 - 1))
	|| (keyboard_check_pressed(invincibility_key))
	|| (gamepad_button_check_pressed(global.player_slot[1], invincibility_button)) {
		global.playtest_invincibility = !global.playtest_invincibility;
	}
	
	/* Press Moonjump button */
	if (mouse_check_button_released(mb_left))
	&& (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), playtest_moonjump_x - 32, display_get_gui_height() - 64, playtest_moonjump_x + 32, display_get_gui_height() + 64 - 1))
	|| (keyboard_check_pressed(moonjump_key))
	|| (gamepad_button_check_pressed(global.player_slot[1], moonjump_button)) {
		global.playtest_moonjump = !global.playtest_moonjump;
	}
	
}
else {
	show_playtest_buttons = false;
}

/* Prevent cheating with playtest tools when playing actual level or doing clear check */
if (global.actually_play_edited_level && !global.debug_screen)
|| (global.doing_clear_check_level)
|| (global.doing_clear_check_character) {
	global.playtest_invincibility = false;
	global.playtest_moonjump = false;
}

#region /* Time Countdown */
if (global.enable_time_countdown) {
	if (global.controls_used_for_navigation == "mouse") {
		time_countup_y = 94 + 42;
	}
	else {
		time_countup_y = 94;
	}
	
	#region /* Show the Time Countdown */
	if (global.hud_hide_time > 0 && global.time_countdown >= 0) {
		if (global.controls_used_for_navigation == "mouse") {
			time_countdown_y = 42 + 42;
		}
		else {
			time_countdown_y = 42;
		}
		if (!global.player_has_entered_goal) {
			if (global.time_countdown == 0) {
				time_fill_color = c_red;
				time_fill_color_blink = c_red;
			}
			else {
				if (global.time_countdown >= 100) {
					time_fill_color = c_yellow;
					time_fill_color_blink = c_orange;
				}
				else {
					time_fill_color = c_orange;
					time_fill_color_blink = c_red;
				}
			}
			if (global.timeattack_millisecond < 60 * 0.5) {
				timer_blinking_alpha = lerp(timer_blinking_alpha, 1, 0.2);
			}
			else {
				timer_blinking_alpha = lerp(timer_blinking_alpha, 0, 0.2);
			}
		}
		else {
			time_fill_color = c_white;
			time_fill_color_blink = c_white;
		}
	}
	#endregion /* Show the Time Countdown END */
	
}
#endregion /* Time Countdown END */

scr_deactivate_objects_outside_view(); /* This function needs to be at the very end of the step event */