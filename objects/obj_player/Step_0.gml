/* Platformer Player Part 1 */

#region /* Only update audio listener position and velocity when the player is moving */
if (speed > 0)
{
	audio_listener_position(x, y, 0);
	audio_listener_velocity(abs(hspeed), abs(vspeed), 0);
}
#endregion /* Only update audio listener position and velocity when the player is moving END */

scr_player_move_save_whole_level_as_screenshot();
scr_start_intro_animations();
scr_player_move_restart();
scr_player_move_quit();

if (global.music_boss != noone) /* If there is boss music loaded */
{
	var current_music_playing = global.music_boss; /* Then play the boss music */
}
else
{
	var current_music_playing = global.music; /* Otherwise play the regular music */
}

#region /* Music Pitch */
if (global.time_countdown < 100 && global.enable_time_countdown)
{
	if (current_music_playing != noone)
	{
		audio_sound_pitch(current_music_playing, music_pitch + 0.3);
	}
	if (global.music_underwater != noone)
	{
		audio_sound_pitch(global.music_underwater, music_pitch + 0.3);
	}
}
else
{
	if (current_music_playing != noone)
	{
		audio_sound_pitch(current_music_playing, music_pitch);
	}
	if (global.music_underwater != noone)
	{
		audio_sound_pitch(global.music_underwater, music_pitch);
	}
}
#endregion /* Music Pitch END */

#region /* Winning the level and transitioning to the next area */
if (goal && global.time_countdown_bonus <= 0 && instance_exists(obj_camera) && obj_camera.iris_xscale < 3)
{
	if (obj_camera.iris_xscale <= 0.01 && obj_camera.iris_yscale <= 0.001)
	{
		audio_stop_all();
		global.checkpoint_x = 0;
		global.checkpoint_y = 0;
		global.checkpoint_millisecond = 0;
		global.checkpoint_second = 0;
		global.checkpoint_minute = 0;
		global.checkpoint_realmillisecond = 0;
		global.lives_until_assist = 0;
		scr_save_level(); /* Important that you save all level information here, before going back to the map screen, but after setting level_clear_rate to clear */

		/* If certain player is no longer playing, make them dissapear from the game until they manually join the game again */
		for(var i = 1; i <= global.max_players; i += 1)
		{
			if (!instance_exists(obj_camera.player[i]))
			{
				global.player_can_play[i] = false;
			}
			if (os_type == os_switch)
			{
				switch_controller_vibrate_hd(global.player_slot[player], 0, 0, 0, 0, 0);
			}
			else
			{
				gamepad_set_vibration(global.player_slot[player], 0, 0);
			}
		}

		if (!global.actually_play_edited_level && global.play_edited_level && global.character_select_in_this_menu == "level_editor")
		{
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			room_restart(); /* Reset the room if you complete custom level in playtest mode */
		}
		else
		if (global.actually_play_edited_level && global.play_edited_level && global.character_select_in_this_menu == "level_editor")
		{
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			room_goto(rm_title); /* Go back to title screen after completing a custom level normally */
		}
		else
		if (obj_camera.after_goal_go_to_this_level >= 0 && !loading_assets)
		{
			global.select_level_index = obj_camera.after_goal_go_to_this_level;
			scr_update_all_backgrounds();
			global.part_limit = 0; /* How many objects are currently placed in the level editor */
			global.part_limit_entity = 0; /* How many entities are currently placed in the level editor */
			loading_assets = true;
			room_goto(rm_leveleditor); /* Go to another level if you're supposed to go to other levels after completion */
		}
		else
		if (!loading_assets)
		{
			/* Go back to title screen if doing character clear check, otherwise go back to world map when playing normally */
			if (global.doing_clear_check_character)
			{
				room_goto(rm_title); /* Go back to title screen if finishing the level and doing character clear check */
			}
			else
			{
				room_goto(rm_world); /* Go back to world map if finishing the level and playing normally */
			}
		}
	}
}
else
if (intro_animation == "")
{
	if (can_clamp_inside_view > 3)
	{
		var view_x = camera_get_view_x(view_camera[view_current]);
		var view_y = camera_get_view_y(view_camera[view_current]);
		var view_width = camera_get_view_width(view_camera[view_current]);
		var view_height = camera_get_view_height(view_camera[view_current]);
		var x_min = view_x;
		var x_max = view_x + view_width;
		var y_min = view_y - 64;
		var y_max = view_y + view_height + 232;
		x = clamp(x, x_min, x_max);
		y = clamp(y, y_min, y_max);
	}
	else
	{
		can_clamp_inside_view++;
	}
}
#endregion /* Winning the level and transitioning to the next area END */

if (hspeed != 0)
{
	hspeed_dir = sign(hspeed);
}

#region /* Assist Always Above 1 HP */
/* This assist feature allows players to experience the feeling of gaining and losing HP */
/* However, when enabled, it prevents the player from being defeated at 0 HP */
/* Players still feel the tension of taking damage without the frustration of dying */
/* This helps players who struggle with platformers while keeping the game engaging */
/* The feature is optional and can be disabled for those who prefer a challenge */
/* Designed to make the game more approachable for a wider audience */
if (global.assist_enable
&& global.assist_above_1_hp
&& hp < 1)
{
	hp = 1;
}
#endregion /* Assist Always Above 1 HP END */

#region /* Assist Hover When Holding Jump */
if (key_jump_hold)
&& (global.assist_hover_when_holding_jump || assist_item)
{
	if (!on_ground)
	&& (!dive)
	&& (!ground_pound)
	&& (!crouch)
	&& (vspeed > 1)
	{
		vspeed = +1;
		crouch = false;
		can_ground_pound = false;
	}
}
#endregion /* Assist Hover When Holding Jump END */

#region /* Playtest Invincibility */
if (global.playtest_invincibility
|| global.assist_enable
&& global.assist_invincibility
|| assist_item)
{
	/* You can never get chain reactions when you have assist invincibility */
	chain_reaction = 0;
	invincible_timer = true;
	if (floor(random(10)) == 0)
	{
		effect_create_above(
			ef_star,
			random_range(bbox_left - 8, bbox_right + 8),
			random_range(bbox_top - 8, bbox_bottom + 8),
			0,
			saturated_player_color
		);
	}
}
#endregion /* Playtest Invincibility END */

scr_player_move_customizable_controls(); /* Sets up what the buttons do */

#region /* Save to variable when on ground */
if (place_meeting(x, y + 1, obj_wall)) /* If there is wall underneath */
|| (collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_semisolid_platform, false, true)) /* If there is semisolid platform underneath */
&& (vspeed >= 0) /* You shouldn't be on ground when jumping up trough a semisolid platform, only when falling down or standing still */
{
	on_ground = true;
}
else
{
	on_ground = false;
}

if (global.assist_enable)
&& (global.assist_floor_over_bottomless_pit && bbox_bottom >= room_height)
{
	on_ground = true;
	if (vspeed >= 0 && !dive)
	{
		vspeed = 0;
	}
	if (sprite_exists(mask_index))
	{
		if (!crouch)
		{
			y = room_height - sprite_get_height(mask_index) * 0.5 - 5;
		}
		else
		{
			y = room_height - sprite_get_height(mask_index) * 0.5 + 5;
		}
	}
	if (key_dive_pressed && allow_dive && can_dive)
	{
		y -= 5; /* When diving, push player upward a bit so you don't get stuck in the bottomless pit. Need to run this code last */
	}
}
#endregion /* Save to variable when on ground */

if (gamepad_is_connected(global.player_slot[player]))
{
	controller_connected = true; /* If controller gets disconnected during gameplay, pause the game */
}

#region /* If player is allowed to move */
if (can_move)
{
	scr_player_move_pause();
	scr_player_move_go_left();
	scr_player_move_go_right();
}
#endregion /* If player is allowed to move END */

#region /* If player has finished the level, make the player run off to the right off screen, and disable player control */
if (goal && global.time_countdown_bonus <= 0)
{
	hspeed += 0.3;
	if (hspeed > 0)
	{
		image_xscale = +1;
	}
}
#endregion /* If player has finished the level, make the player run off to the right off screen, and disable player control END */

scr_player_move_run();

scr_player_move_double_tap_direction_to_run();

scr_player_move_double_tap_direction_to_dive();

#region /* Set the friction */
if (on_ground && !horizontal_rope_climb)
{
	if (speed > 0)
	{
		if (place_meeting(x, y + 1, obj_ice_block))
		{
			if (key_left_hold)
			|| (key_right_hold)
			|| (goal)
			{
				friction = 0.01;
			}
			else
			{
				friction = 0.02;
			}
		}
		else
		{
			if (key_left_hold)
			|| (key_right_hold)
			|| (goal)
			{
				friction = 0.1;
			}
			else
			{
				friction = 0.2;
			}
		}
	}
}
else
if (!horizontal_rope_climb)
{
	friction = 0;
}
#endregion /* Set the friction END */

scr_player_move_jumping();

scr_player_move_triple_jump();

scr_player_move_mid_air_jump();

#region /* Do a small jump when releasing the jump button */
if (key_jump_released && !spring)
{
	if (vspeed < 0) /* When still traveling up */
	{
		vspeed /= 2; /* Divide the vertical speed by half */
	}
}
#endregion /* Do a small jump when releasing the jump button END */

#region /* Fall faster */
if (vspeed > 0)
{
	vspeed += 0.4;
}
#endregion /* Fall faster END */

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (!on_ground)
&& (!climb)
&& (!horizontal_rope_climb)
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

#region /* Limits the horizontal speed */
if (abs(hspeed) > speed_max)
{
	hspeed -= 0.4 * sign(hspeed);
}
#endregion /* Limits the horizontal speed END */

#region /* Limits the vertical speed */
if (vspeed > 8 && collision_rectangle(x, bbox_bottom + 1, x, bbox_bottom + 32, obj_semisolid_platform, false, true))
{
	if (vspeed > 8)
	{
		vspeed = +8;
	}
}
else
{
	if (ground_pound == 1)
	{
		if (vspeed > 30)
		{
			vspeed = +30;
		}
	}
	else
	if (key_jump_hold)
	{
		if (vspeed > 17)
		{
			vspeed = +17;
		}
	}
	else
	{
		if (vspeed > 20)
		{
			vspeed = +20;
		}
	}
}
#endregion /* Limits the vertical speed END */

#region /* If you touch spikes, take damage */
if (collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, obj_spikes, false, true))
|| (collision_rectangle(bbox_left - 1, bbox_bottom - 1, bbox_right + 1, bbox_bottom + 1, obj_spikes_emerge, false, true) && instance_nearest(x, bbox_bottom, obj_spikes_emerge).image_angle == 0 && instance_nearest(x, bbox_bottom, obj_spikes_emerge).sprite_index == spr_spikes_emerge)
|| (collision_rectangle(bbox_right - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, obj_spikes_emerge, false, true) && instance_nearest(x, bbox_bottom, obj_spikes_emerge).image_angle == 90 && instance_nearest(x, bbox_bottom, obj_spikes_emerge).sprite_index == spr_spikes_emerge)
|| (collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_top + 1, obj_spikes_emerge, false, true) && instance_nearest(x, bbox_bottom, obj_spikes_emerge).image_angle == 180 && instance_nearest(x, bbox_bottom, obj_spikes_emerge).sprite_index == spr_spikes_emerge)
|| (collision_rectangle(bbox_right - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, obj_spikes_emerge, false, true) && instance_nearest(x, bbox_bottom, obj_spikes_emerge).image_angle == 270 && instance_nearest(x, bbox_bottom, obj_spikes_emerge).sprite_index == spr_spikes_emerge)
{
	scr_player_move_take_damage()
}
#endregion /* If you touch spikes, take damage END */

#region /* ________________________________MORE MOVES________________________________ */

scr_player_move_crouch();

scr_player_move_tongue();

scr_player_move_roll_when_landing();

#region /* Chain Reaction Reset */
if (on_ground)
{
	if (invincible_timer == 0)
	{
		chain_reaction = 0;
	}
}
#endregion /* Chain Reaction Reset END */

scr_player_move_wall_jump_and_wall_climb();

scr_player_move_ground_pound();

scr_player_move_dive();

scr_player_move_throw_items_in_hands();

#region /* Can Attack After Dive On Ground */
if (on_ground && can_attack_after_dive_on_ground > 0)
{
	can_attack_after_dive_on_ground--;
	if (key_jump)
	{
		can_attack_after_dive_on_ground = false;
	}
}
#endregion /* Can Attack After Dive On Ground END */

scr_player_move_dive_ground_boost();

scr_player_move_ledge_grab();

#region /* Put sprite angle at right angle */
if (angle <- 360)
{
	angle += 16;
}
else
if (angle >+ 360)
{
	angle -= 16;
}
else
if (ground_pound == 1)
{
	angle = lerp(angle, 0, 0.2);
}
else
{
	if (!on_ground && vspeed > 0)
	{
		if (key_left_hold && !key_right_hold)
		{
			angle = lerp(angle, +10, 0.1);
		}
		else
		if (key_right_hold && !key_left_hold)
		{
			angle = lerp(angle, -10, 0.1);
		}
		else
		{
			angle = lerp(angle, 0, 0.1);
		}
	}
	else
	{
		angle = lerp(angle, 0, 0.1);
	}
}
#endregion /* Put sprite angle at right angle */

if (invincible_timer <= 2)
{
	if (in_water)
	{
		if (global.music_underwater != noone)
		{
			if (current_music_playing != noone)
			{
				audio_sound_gain(current_music_playing, 0, 0);
			}
			audio_sound_gain(global.music_underwater, global.volume_music * global.volume_main, 0);
		}
		else
		if (current_music_playing != noone)
		{
			audio_sound_gain(current_music_playing, global.volume_music * global.volume_main, 0);
			if (global.music_underwater != noone)
			{
				audio_sound_gain(global.music_underwater, 0, 0);
			}
		}
		if (global.ambience_underwater != noone)
		{
			if (global.ambience != noone)
			{
				audio_sound_gain(global.ambience, 0, 0);
			}
			audio_sound_gain(global.ambience_underwater, global.volume_ambient * global.volume_main, 0);
		}
		else
		if (global.ambience != noone)
		{
			audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
			if (global.ambience_underwater != noone)
			{
				audio_sound_gain(global.ambience_underwater, 0, 0);
			}
		}
	}
	else
	{
		if (current_music_playing != noone)
		{
			audio_sound_gain(current_music_playing, global.volume_music * global.volume_main, 0);
			if (global.music_underwater != noone)
			{
				audio_sound_gain(global.music_underwater, 0, 0);
			}
		}
		if (global.ambience != noone)
		{
			audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
			if (global.ambience_underwater != noone)
			{
				audio_sound_gain(global.ambience_underwater, 0, 0);
			}
		}
	}
}

scr_player_move_swimming_in_water();

scr_player_move_drowning();

#region /* Water Splash Effect */
if (in_water != old_in_water)
{

	#region /* Jump out of water */
	if (key_jump_hold && !in_water && vspeed > -normal_jump_height)
	{
		vspeed = -normal_jump_height;
		scr_audio_play(snd_jump, volume_source.sound); /* Jump sound effect */
		scr_audio_play(snd_swim, volume_source.sound); /* Swim sound effect */
	}
	#endregion /* Jump out of water END */

	old_in_water = in_water;

	instance_create_depth(x, y, 0, obj_water_splash);
	repeat(10)
	{
		with(instance_create_depth(x, bbox_top, 0, obj_water_splash_particle))
		{
			direction = random_range(0, 180);
			speed = random_range(2, 10);
		}
	}
}
#endregion /* Water Splash Effect END */

#region /* Speedup to Dashspeed */
if (power_meter_running_sound && invincible_timer >= 2 && abs(hspeed) > 7)
{
	speedunit += 2;
	if (speedunit > 100)
	{
		speedunit = 100;
		if (on_ground)
		{
			speed_dash = true;
		}
	}
}
else
{
	speedunit--;
	if (speedunit < 0)
	{
		speedunit = 0;
	}
	speed_dash = false;
}
#endregion /* Speedup to Dashspeed END */

#region /* Health Handeling */
if (taken_damage > 0)
{
	global.zero_hits = false;
	taken_damage--;
}

#region /* Make the player die if you have 0 HP */
if (hp <= 0 && !global.goal_active)
{
	die = true;
}
#endregion /* Make the player die if you have 0 HP END */

#endregion /* Health Handeling END */

#region /* Burnt */
if (burnt)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
	if (on_ground && !die)
	{
		scr_audio_play(voice_burned_running, volume_source.voice);
		burnt = 2;
		dive = false;
		ground_pound = false;
		crouch = false;
		speed_max = 8;
		vspeed = -7.5;
	}
}
else
if (burnt == 2)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
	if (on_ground)
	{
		burnt = false;
	}
}
#endregion /* Burnt END */

#region /* Invincible Music */
if (invincible_timer >= 1)
{
	invincible_timer--;
	if (invincible_timer >= 2)
	{
		if (!audio_is_playing(music_invincible))
		{
			scr_audio_play(music_invincible, volume_source.music);
		}
	}
}
else
{

	#region /* Handle Music Transitions */
	/* Check the state of invincibility music */
	if (invincible_timer <= 1)
	{
		if (audio_is_playing(music_invincible))
		{
			/* Debug message to confirm stopping invincible music */
			show_debug_message("Stopping invincible music.");
			audio_stop_sound(music_invincible);
		}
	}

	/* Check and handle loading music */
	if (audio_is_playing(global.loading_music))
	{
		/* Debug message to confirm that loading music is playing */
		show_debug_message("Loading music is playing.");

		/* Check if there is a valid level music to play */
		if (current_music_playing != noone)
		{
			/* Ensure level music starts before stopping loading music */
			if (!audio_is_playing(current_music_playing))
			{
				/* Debug message to confirm playing level music */
				show_debug_message("Playing current level music: " + string(current_music_playing));
				scr_audio_play(current_music_playing, volume_source.music);
			}
		}

		/* Stop the loading music regardless */
		show_debug_message("Stopping loading music.");
		audio_stop_sound(global.loading_music);
	}

	/* Handle underwater music priority */
	if (global.music_underwater != noone) /* Ensure underwater music is valid */
	{
		if (!audio_is_playing(global.music_underwater))
		{
			/* Debug message to confirm underwater music isn't playing */
			show_debug_message("Underwater music is not playing.");

			/* Check if hurry-up music is also not playing */
			if (!audio_is_playing(snd_hurry_up))
			{
				/* Debug message to confirm playing underwater music */
				show_debug_message("Playing underwater music: " + string(global.music_underwater));
				scr_audio_play(global.music_underwater, volume_source.music);

				/* Debug message to confirm stopping loading music, if applicable */
				if (audio_is_playing(global.loading_music))
				{
					show_debug_message("Stopping loading music for underwater music.");
					audio_stop_sound(global.loading_music);
				}
			}
		}
	}
	#endregion /* Handle Music Transitions END */

}
if (invincible_timer >= 50)
{
	if (invincible_timer == 60)
	{
		scr_audio_play(snd_star_bound, volume_source.sound, 3);
	}
	if (invincible_timer == 70)
	{
		scr_audio_play(snd_star_bound, volume_source.sound, 2);
	}
	if (invincible_timer == 80)
	{
		scr_audio_play(snd_star_bound, volume_source.sound);
	}
	/* Stop the main music so it can restart from beginning when invincibility wears off */
	audio_stop_sound(current_music_playing);
	audio_stop_sound(global.music_underwater);
}
#endregion /* Invincible Music END */

#region /* Time */
if (!goal)
{
	if (global.time_countdown == 0)
	&& (global.enable_time_countdown)
	&& (!global.player_has_entered_goal)
	&& (!global.goal_active)
	{
		die = true;
	}
	if (global.enable_time_countdown && instance_exists(obj_camera) && obj_camera.hurry_up_message_timer == 1)
	{
		if (!audio_is_playing(snd_hurry_up))
		{
			scr_audio_play(snd_hurry_up, volume_source.sound);
		}
		if (audio_is_playing(snd_hurry_up))
		{
			audio_stop_sound(current_music_playing);
			audio_stop_sound(global.music_underwater);
		}
	}
}
else
{
	if (global.time_countdown_bonus > 0)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
		}
		if (global.time_countdown_bonus > 3)
		{
			global.time_countdown_bonus -= 3;
			score += 150;
		}
		else
		{
			global.time_countdown_bonus--;
			score += 50;
		}
		if (!audio_is_playing(snd_beep))
		{
			scr_audio_play(snd_beep, volume_source.sound);
		}
	}
	if (global.time_countdown_bonus == 0)
	{
		if (audio_is_playing(snd_beep))
		{
			audio_stop_sound(snd_beep);
		}
	}
	with(obj_enemy)
	{
		instance_destroy();
	}
}
#endregion /* Time END */

scr_player_move_goal();

scr_player_move_homing_attack();

if (vspeed > 0)
{
	stomp_spin = false;
}

scr_player_move_spring();

#region /* Heart above head */
if (have_heart_balloon)
{
	var heart_y_offset = -64;
	if (horizontal_rope_climb && key_up && !key_down && (!collision_rectangle(bbox_left, bbox_top - 64, bbox_right, bbox_bottom, obj_wall, false, true)))
	{
		var heart_y_offset = -1;
	}
	xx_heart = lerp(xx_heart, x, 0.1);
	yy_heart = lerp(yy_heart, y + heart_y_offset, 0.1);
}
#endregion /* Heart above head END */

#endregion /* ________________________________MORE MOVES________________________________ */





















/* Platformer Player Part 2 */
#region /* ________________________________ Handling the sprites and sounds in the step event ________________________________ */
draw_xscale = lerp(draw_xscale, 1, 0.2); /* Make horizontal stretching slowly reset back to 1 */
draw_yscale = lerp(draw_yscale, 1, 0.2); /* Make vertical stretching slowly reset back to 1 */

if (sprite_index == sprite_jump)
|| (sprite_index == sprite_idle)
|| (sprite_index == sprite_run)
|| (sprite_index == sprite_run_two)
|| (sprite_index == sprite_run_three)
|| (sprite_index == sprite_run_four)
{
	jump_transition_to_fall_animation = 0;
}

#region /* A bump sound effect if a player walks into a wall to let them know that they they hit a wall */

#region /* Left */
if (key_left_hold)
&& (!key_right_hold)
&& (on_ground)
&& (!climb)
&& (!stick_to_wall)
&& (place_meeting(x - 1, y, obj_wall))
{
	if (!audio_is_playing(snd_bump))
	{
		scr_audio_play(snd_bump, volume_source.sound);
	}
}
#endregion /* Left END */

else

#region /* Right */
if (key_right_hold)
&& (!key_left_hold)
&& (on_ground)
&& (!climb)
&& (!stick_to_wall)
&& (place_meeting(x + 1, y, obj_wall))
{
	if (!audio_is_playing(snd_bump))
	{
		scr_audio_play(snd_bump, volume_source.sound);
	}
}
#endregion /* Right END */

#endregion /* A bump sound effect if a player walks into a wall to let them know that they they hit a wall END */

if (climb)
&& (!place_meeting(x, y, obj_vine))
{
	climb = false;
}

scr_player_move_horizontal_rope(); /* Climb Horizontal Rope */

#region /* Climb Vine / Ladder */
if (place_meeting(x, y, obj_vine))
{
	if (key_up)
	&& (vspeed >= 0)
	&& (hold_item_in_hands == "")
	|| (key_up_pressed)
	&& (hold_item_in_hands == "")
	{
		if (!climb)
		{
			climb = true;
			horizontal_rope_climb = false;
			jump = 0;
			stick_to_wall = false;
			scr_audio_play(snd_catch_ivy, volume_source.sound); /* Make a sound effect that you have started cimbing */
			scr_audio_play(voice_rope_catch, volume_source.voice);
		}
	}
	if (climb)
	{
		gravity = 0;
		hspeed = 0;
		vspeed = 0;
		last_standing_x = x;
		last_standing_y = y;
		speed_max = 4;
		ledge_grab_jump = false;
		ground_pound = false;
		dive = false;
		can_ground_pound = false;
		can_dive = true;
		stomp_spin = false;
		midair_jumps_left = number_of_jumps;
		spring = false;
		chain_reaction = 0;

		if (key_up)
		&& (!key_down)
		&& (place_meeting(x, bbox_top - 1, obj_vine))
		&& (taken_damage <= taken_damage_freezetime)
		|| (key_down)
		&& (!key_up)
		&& (taken_damage <= taken_damage_freezetime)
		{
			var nearest_vine = instance_nearest(x, y, obj_vine);
			if (x < nearest_vine.x)
			{
				x += 4;
			}
			if (x > nearest_vine.x)
			{
				x -= 4;
			}
		}

		if (key_up)
		&& (!key_down)
		&& (place_meeting(x, bbox_top - 1, obj_vine))
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (!position_meeting(x, bbox_top - 1, obj_wall))
			{
				if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
				if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
				if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				if (key_run)
				{
					y -= 4;
					image_speed = 0.4;
				}
				else
				{
					y -= 2;
					image_speed = 0.2;
				}
				if (!audio_is_playing(snd_move_ivy))
				{
					scr_audio_play(snd_move_ivy, volume_source.sound);
				}
			}
			else
			{
				if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
				if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
		}
		else
		if (key_down)
		&& (!key_up)
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}

			if (!on_ground)
			{
				if (key_run)
				{
					y += 5;
					image_speed = -0.4;
				}
				else
				{
					y += 3;
					image_speed = -0.2;
				}
				if (!audio_is_playing(snd_move_ivy))
				{
					scr_audio_play(snd_move_ivy, volume_source.sound);
				}
			}

			if (on_ground)
			{
				climb = false;
			}
		}
		else
		if (key_left_hold)
		&& (!key_right_hold)
		&& (!key_up)
		&& (!key_down)
		&& (!position_meeting(bbox_left - 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			image_xscale = -1;
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (key_run)
			{
				x -= 4;
				image_speed = 0.4;
			}
			else
			{
				x -= 2;
				image_speed = 0.2;
			}
			if (!audio_is_playing(snd_move_ivy))
			{
				scr_audio_play(snd_move_ivy, volume_source.sound);
			}
		}
		else
		if (key_left_hold)
		&& (!key_right_hold)
		&& (!key_up)
		&& (!key_down)
		&& (position_meeting(bbox_left - 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0;
			image_xscale = -1;
			if (!audio_is_playing(snd_bump))
			{
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		else
		if (key_right_hold)
		&& (!key_left_hold)
		&& (!key_up)
		&& (!key_down)
		&& (!position_meeting(bbox_right + 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			image_xscale = +1;
			if (sprite_vine_climb> noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (key_run)
			{
				x += 4;
				image_speed = 0.4;
			}
			else
			{
				x += 2;
				image_speed = 0.2;
			}
			if (!audio_is_playing(snd_move_ivy))
			{
				scr_audio_play(snd_move_ivy, volume_source.sound);
			}
		}
		else
		if (key_right_hold)
		&& (!key_left_hold)
		&& (!key_up)
		&& (!key_down)
		&& (position_meeting(bbox_right + 1, y, obj_wall))
		&& (taken_damage <= taken_damage_freezetime)
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0;
			image_xscale = +1;
			if (!audio_is_playing(snd_bump))
			{
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		else
		{
			if (sprite_vine_stay > noone){sprite_index = sprite_vine_stay;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			image_speed = 0.2;
		}
		if (key_jump)
		{
			if (!key_down)
			{
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				vspeed = -11.5;
			}
			climb = false;
			stomp_spin = false;
			scr_audio_play(snd_jump, volume_source.sound);
		}
	}
}
#endregion /* Climb Vine / Ladder END */

#region /* In Water Animations */
if (in_water && !climb)
{
	can_ground_pound = false;
	chain_reaction = 0;

	if (on_ground && !crouch)
	{

		#region /* Skidding */
		if (hspeed < 0)
		&& (key_right_hold)
		|| (hspeed > 0)
		&& (key_left_hold)
		{
			if (!audio_is_playing(snd_skidding))
			{
				scr_audio_play(snd_skidding, volume_source.sound);
			}
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
			if (image_index > image_number - 1)
			{
				image_speed = 0;
			}
			else
			{
				image_speed = 0.5;
			}
		}
		#endregion /* Skidding END */

		else

		#region /* Run in Water */
		if (hspeed <+ 0.1)
		|| (hspeed >- 0.1)
		{
			if (hold_item_in_hands != "")
			{
				if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
				if (sprite_idleing_with_item_in_front > noone){sprite_index = sprite_idleing_with_item_in_front;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			if (speed_dash)
			{
				if (sprite_swim > noone){sprite_index = sprite_swim;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			if (abs(speed) >= 6)
			{
				if (sprite_swim > noone){sprite_index = sprite_swim;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			/* Against Wall */
			else
			{
				if (place_meeting(x - 1, y, obj_wall))
				|| (place_meeting(x + 1, y, obj_wall))
				{
					if (sprite_swim > noone){sprite_index = sprite_swim;}else
					if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
				/* Walk */
				else
				{
					if (sprite_swim > noone){sprite_index = sprite_swim;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}else
					if (sprite_run > noone){sprite_index = sprite_run;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
				}
			}
			image_speed = speed / 13.5 +0.1;
		}
		#endregion /* Run in Water END */

		else

		#region /* Stand Underwater */
		if (hspeed == 0)
		&& (!key_left_hold)
		&& (!key_right_hold)
		{
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = 0;}
			image_speed = 0.1;
		}
		#endregion /* Stand Underwater END */

		#region /* Mask */
		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
		#endregion /* Mask END */

	}
	else

	#region /* Swimming Sprites */
	if (!on_ground
	&& !crouch)
	{
		/* Don't have skidding animations underwater */

		/* Single Swim */
		if (key_jump)
		{
			image_index = 0;
		}

		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.3;
		}

		if (vspeed > 0)
		{
			if (sprite_swim_fall > noone){sprite_index = sprite_swim_fall;}else
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		else
		{
			if (sprite_swim > noone){sprite_index = sprite_swim;}else
			if (sprite_swim_stand > noone){sprite_index = sprite_swim_stand;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}

		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
	}
	#endregion /* Swimming Sprites END */

}
#endregion /* In Water Animations END */

else
{
	if (ground_pound == 1)
	{
		if (sprite_ground_pound > noone){sprite_index = sprite_ground_pound;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_jump > noone){sprite_index = sprite_jump;}else
		if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
	}
	else
	if (ground_pound == 2)
	{
		if (sprite_ground_pound_get_up > noone){sprite_index = sprite_ground_pound_get_up;}else
		{
			if (image_index > 0)
			{
				image_speed = 0;
				ground_pound = false;
			}
		}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
			ground_pound = false;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	else
	if (ground_pound == 3)
	{
		if (sprite_stomp_spin > noone){sprite_index = sprite_stomp_spin;}else
		if (sprite_jump > noone){sprite_index = sprite_jump;}else
		if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
		if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
	}
	else
	if (on_ground && !crouch)
	&& (vspeed == 0)
	{

		#region /* Skidding */
		if (hspeed < 0)
		&& (key_right_hold)
		|| (hspeed > 0)
		&& (key_left_hold)
		{
			if (place_meeting(x, y + 1, obj_ice_block))
			{
				if (!audio_is_playing(snd_skidding_ice))
				{
					scr_audio_play(snd_skidding_ice, volume_source.sound);
				}
			}
			else
			{
				if (!audio_is_playing(snd_skidding))
				{
					scr_audio_play(snd_skidding, volume_source.sound);
				}
			}
			if (place_meeting(x, y + 1, obj_ice_block))
			{
				if (hold_item_in_hands != "")
				{
					if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
					if (sprite_idleing_with_item_in_front > noone){sprite_index = sprite_idleing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
					if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
					if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle; image_speed = 0.5;}
				}
				else
				if (sprite_skidding_ice > noone){sprite_index = sprite_skidding_ice; image_speed = 0.5;}else
				if (sprite_skidding> noone){sprite_index = sprite_skidding; image_speed = 0.5;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk > noone) && (hspeed <> 0){sprite_index = sprite_walk;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			{
				if (hold_item_in_hands != "")
				{
					if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
					if (sprite_idleing_with_item_in_front > noone){sprite_index = sprite_idleing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
					if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
					if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle; image_speed = 0.5;}
				}
				else
				if (sprite_skidding> noone){sprite_index = sprite_skidding; image_speed = 0.5;}else
				if (abs(hspeed) > 20) && (sprite_run_four > noone){sprite_index = sprite_run_four;}else
				if (abs(hspeed) > 15) && (sprite_run_three > noone){sprite_index = sprite_run_three;}else
				if (abs(hspeed) > 10) && (sprite_run_two > noone){sprite_index = sprite_run_two;}else
				if (abs(hspeed) > 5) && (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk >  noone) && (hspeed <> 0){sprite_index = sprite_walk;}else
				if (sprite_run > noone) && (hspeed <> 0){sprite_index = sprite_run;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
		}
		#endregion /* Skidding END */

		else

		#region /* Skidding Stop */
		if (hspeed < 0)
		&& (!key_left_hold)
		|| (hspeed > 0)
		&& (!key_right_hold)
		{
			if (hold_item_in_hands != "")
			{
				if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_idleing_with_item_in_front > noone){sprite_index = sprite_idleing_with_item_in_front; image_speed = speed / 10 + 0.1;}else
				if (sprite_walk > noone){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle; image_speed = 0.5;}
			}
			else
			if (sprite_skidding_stop > noone){sprite_index = sprite_skidding_stop; image_speed = 0.5;}else
			if (abs(hspeed) > 20) && (sprite_run_four > noone){sprite_index = sprite_run_four; image_speed = speed / 10 + 0.1;}else
			if (abs(hspeed) > 15) && (sprite_run_three > noone){sprite_index = sprite_run_three; image_speed = speed / 10 + 0.1;}else
			if (abs(hspeed) > 10) && (sprite_run_two > noone){sprite_index = sprite_run_two; image_speed = speed / 10 + 0.1;}else
			if (abs(hspeed) > 5) && (sprite_run > noone){sprite_index = sprite_run; image_speed = speed / 10 + 0.1;}else
			if (sprite_walk > noone) && (hspeed <> 0){sprite_index = sprite_walk; image_speed = speed / 10 + 0.1;}else
			if (sprite_run > noone) && (hspeed <> 0){sprite_index = sprite_run; image_speed = speed / 10 + 0.1;}else
			if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle; image_speed = 0.5;}
		}
		#endregion /* Skidding Stop END */

		else

		#region /* Look Up */
		if (hspeed == 0)
		&& (key_up)
		&& (!key_down)
		&& (intro_animation == "")
		{
			if (look_up_start_animation)
			{
				if (sprite_look_up_start> noone){sprite_index = sprite_look_up_start;}else
				if (sprite_look_up > noone){sprite_index = sprite_look_up;}else
				if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			{
				if (sprite_look_up > noone){sprite_index = sprite_look_up;}else
				if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			if (image_index > image_number - 1)
			&& (look_up_start_animation)
			{
				image_index = 1;
				look_up_start_animation = false;
			}
			image_speed = 0.3;
			if (sprite_mask >= 0)
			{
				mask_index = sprite_mask;
			}
			else
			{
				mask_index = spr_player_stand;
			}
		}
		#endregion /* Look Up END */

		else

		#region /* Run */
		if (abs(hspeed) > 0)
		{
			look_up_start_animation = true;
			against_wall_animation = 0;
			if (hold_item_in_hands != "")
			{
				if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
				if (sprite_idleing_with_item_in_front > noone){sprite_index = sprite_idleing_with_item_in_front;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			if (abs(hspeed) >= 20)
			{
				if (sprite_run_four > noone){sprite_index = sprite_run_four;}else
				if (sprite_run_three > noone){sprite_index = sprite_run_three;}else
				if (sprite_run_two > noone){sprite_index = sprite_run_two;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			if (abs(hspeed) >= 15)
			{
				if (sprite_run_three > noone){sprite_index = sprite_run_three;}else
				if (sprite_run_two > noone){sprite_index = sprite_run_two;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			if (abs(hspeed) >= 10)
			{
				if (sprite_run_two > noone){sprite_index = sprite_run_two;}else
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			if (abs(hspeed) >= 5)
			{
				if (sprite_run > noone){sprite_index = sprite_run;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			else
			{
				if (sprite_walk > noone){sprite_index = sprite_walk;} /* Walk */ else
				if (sprite_run > noone){sprite_index = sprite_run;} /* If no walk sprite, use run sprite */ else
				if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
			}
			if (place_meeting(x, y + 1, obj_ice_block))
			{
				image_speed = 0.5;
			}
			else
			{
				image_speed = speed / 10 + 0.1;
			}
		}
		#endregion /* Run END */

		else

		#region /* Against Wall */
		if (place_meeting(x - 1, y, obj_wall))
		&& (on_ground)
		&& (key_left_hold)
		|| (place_meeting(x + 1, y, obj_wall))
		&& (on_ground)
		&& (key_right_hold)
		{
			if (!crouch)
			{
				if (against_wall_animation == 0)
				{
					image_index = 0;
					if (sprite_against_wall_start > noone){sprite_index = sprite_against_wall_start; image_speed = 0.5;}else
					if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
					against_wall_animation = 1;
				}
				else
				if (against_wall_animation == 1)
				{
					if (sprite_against_wall_start > noone){sprite_index = sprite_against_wall_start; image_speed = 0.5;}else
					if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
					if (image_index >= image_number - 1)
					{
						against_wall_animation = 2;
					}
				}
				else
				if (against_wall_animation = 2)
				{
					if (sprite_against_wall > noone){sprite_index = sprite_against_wall; image_speed = 0.5;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
			}
			if (!audio_is_playing(snd_bump))
			{
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		#endregion /* Against Wall END */

		else

		#region /* Stand */
		if (hspeed == 0)
		&& (!key_left_hold)
		&& (!key_right_hold)
		&& (!climb)
		&& (intro_animation == "")
		{
			look_up_start_animation = true;
			against_wall_animation = 0;
			if (place_meeting(x, y + 1, obj_bump_in_ground))
			&& (sprite_idleing_on_something > noone)
			{
				sprite_index = sprite_idleing_on_something;
			}
			else
			if (!have_heart_balloon)
			&& (hp <= 1)
			&& (max_hp >= 2)
			&& (invincible_timer == 0)
			&& (sprite_panting > noone)
			{
				sprite_index = sprite_panting;
				image_speed = 0.3;
			}
			else
			if (global.effect_rain || global.effect_snow)
			&& (sprite_idle_cold > noone)
			{
				sprite_index = sprite_idle_cold;
				image_speed = 1;
			}
			else
			{
				if (image_index >= image_number - 1)
				{
					image_index = 0;
					idle_animtaion = choose(0, 0, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
				}
				if (idle_animtaion == 1)
				&& (sprite_idle_blink > noone)
				{
					sprite_index = sprite_idle_blink;
				}
				else
				if (idle_animtaion = 2)
				&& (sprite_idle_animation_one > noone)
				{
					sprite_index = sprite_idle_animation_one;
				}
				else
				if (idle_animtaion = 3)
				&& (sprite_idle_animation_two > noone)
				{
					sprite_index = sprite_idle_animation_two;
				}
				else
				if (idle_animtaion = 4)
				&& (sprite_idle_animation_three > noone)
				{
					sprite_index = sprite_idle_animation_three;
				}
				else
				if (idle_animtaion == 5)
				&& (sprite_idle_animation_four > noone)
				{
					sprite_index = sprite_idle_animation_four;
				}
				else
				if (idle_animtaion == 6)
				&& (sprite_idle_animation_five > noone)
				{
					sprite_index = sprite_idle_animation_five;
				}
				else
				if (idle_animtaion == 7)
				&& (sprite_idle_animation_six > noone)
				{
					sprite_index = sprite_idle_animation_six;
				}
				else
				if (idle_animtaion == 8)
				&& (sprite_idle_animation_seven > noone)
				{
					sprite_index = sprite_idle_animation_seven;
				}
				else
				if (idle_animtaion = 9)
				&& (sprite_idle_animation_eight > noone)
				{
					sprite_index = sprite_idle_animation_eight;
				}
				else
				if (idle_animtaion = 10)
				&& (sprite_idle_animation_nine > noone)
				{
					sprite_index = sprite_idle_animation_nine;
				}
				else
				if (sprite_idle > noone)
				{
					sprite_index = sprite_idle;
				}

				#region /* If there isn't any stand or idle animation existing, then just use walk sprite */
				else
				if (sprite_walk > noone)
				{
					sprite_index = sprite_walk;
					image_speed = 0;
				}
				#endregion /* If there isn't any stand or idle animation existing, then just use walk sprite END */

				image_speed = 0.3;
			}
		}
		else
		{
			idle_animtaion = 0;
		}
		#endregion /* Stand END */

		#region /* Mask */
		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
		#endregion /* Maske END */

	}
	else

	#region /* Jumping Sprites */
	if (!on_ground && !crouch)
	{
		if (burnt > 0)
		{
			if (sprite_burnt > noone){sprite_index = sprite_burnt;}else
			if (sprite_die > noone){sprite_index = sprite_die;}else
			if (sprite_jump > noone) && (vspeed <= 0){sprite_index = sprite_jump;}else
			if (sprite_fall_slower > noone) && (vspeed > 0) && (key_jump_hold){sprite_index = sprite_fall_slower;}else
			if (sprite_fall > noone) && (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_jump > noone){sprite_index = sprite_jump;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		else
		if (dive)
		{
			if (sprite_dive > noone){sprite_index = sprite_dive;if (image_index > image_number - 1){image_speed = 0;}else{image_speed = 0.5;}}else
			if (sprite_jump > noone) && (vspeed <= 0){sprite_index = sprite_jump;}else
			if (sprite_fall_slower > noone) && (vspeed > 0) && (key_jump_hold){sprite_index = sprite_fall_slower;}else
			if (sprite_fall > noone) && (vspeed > 0){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_jump > noone){sprite_index = sprite_jump;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		else

		#region /* Wall slide down */
		if (stick_to_wall)
		&& (vspeed >= 0)
		{
			if (!crouch)
			&& (!ground_pound)
			&& (!ledge_grab)
			{
				if (vspeed > 0)
				{
					if (sprite_wall_slide_down > noone){sprite_index = sprite_wall_slide_down;}else
					if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
				else
				{
					if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
				image_speed = 0.5;
			}
		}
		#endregion /* Wall slide down END */

		else
		if (vspeed < 0)
		{
			if (stomp_spin)
			{
				if (sprite_stomp_spin > noone){sprite_index = sprite_stomp_spin;if (image_index > image_number - 1){image_speed = 0;}else{image_speed = 0.5;}}else
				if (sprite_jump > noone){sprite_index = sprite_jump;}else
				if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
				if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			if (spring >= 2)
			{
				sprite_index = sprite_stomp_spin;
				if (image_index > image_number - 1)
				{
					image_speed = 0;
				}
				else
				{
					image_speed = 0.5;
				}
			}
			else
			/* Make it look natural when climbing wall */
			/* Run up wall / wall_slide up */
			if (stick_to_wall)
			{
				if (!crouch)
				&& (!ground_pound)
				&& (!ledge_grab)
				{
					if (sprite_wall_slide_up > noone){sprite_index = sprite_wall_slide_up;}else
					if (sprite_wall_slide > noone){sprite_index = sprite_wall_slide;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
					image_speed = 0.5;
				}
			}
			else

			#region /* Jump sprites */
			if (!horizontal_rope_climb)
			{

				#region /* Single Jump */
				if (jump <= 1)
				{
					if (!spring)
					{
						if (sprite_jump > noone){sprite_index = sprite_jump;}else
						if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
						if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
						if (sprite_walk > noone){sprite_index = sprite_walk;}
					}
				}
				#endregion /* Single Jump END */

				else

				#region /* Double Jump */
				if (jump == 2)
				{
					if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
					if (sprite_jump > noone){sprite_index = sprite_jump;}else
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
					image_speed = 0.5;
				}
				#endregion /* Double Jump END */

				else

				#region /* Triple Jump */
				if (jump >= 3)
				{
					if (sprite_triple_jump > noone){sprite_index = sprite_triple_jump;}else
					if (sprite_jump > noone){sprite_index = sprite_jump;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
				#endregion /* Triple Jump */

				if (image_index > image_number - 1)
				{
					image_speed = 0;
				}
				else
				{
					image_speed = 0.5;
				}
			}
			#endregion /* Jump sprites END */

		}
		else
		if (vspeed > 0)
		&& (!stick_to_wall)
		&& (!spring)
		{

			#region /* Fall sprites */
			if (jump_transition_to_fall_animation == 0)
			{
				image_index = 0;
				jump_transition_to_fall_animation = 1
			}
			if (jump_transition_to_fall_animation == 1)
			{
				image_speed = 0.5;
				if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}else
				{jump_transition_to_fall_animation = 2;}
				if (image_index > image_number - 1)
				{
					image_index = 0;
					jump_transition_to_fall_animation = 2;
				}
			}
			if (jump_transition_to_fall_animation == 2)
			{
				if (key_jump_hold)
				{
					if (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; image_index = image_number - 1;}else
					if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
				else
				{
					if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
					if (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
					if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; image_index = image_number - 1;}else
					if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
					if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
					if (sprite_walk > noone){sprite_index = sprite_walk;}
				}
			}
			#endregion /* Fall sprites END */

		}
		if (sprite_mask >= 0)
		{
			mask_index = sprite_mask;
		}
		else
		{
			mask_index = spr_player_stand;
		}
	}
	#endregion /* Jumping Sprites END */

}

#region/* Stop skidding ice sound */
if (!crouch)
{
	if (speed < 2)
	|| (hspeed > 0)
	&& (key_right_hold)
	|| (hspeed < 0)
	&& (key_left_hold)
	|| (!key_left_hold)
	&& (!key_right_hold)
	|| (!place_meeting(x, y + 1, obj_ice_block))
	{
		if (audio_is_playing(snd_skidding_ice))
		{
			audio_stop_sound(snd_skidding_ice);
		}
	}
}
else
if (!place_meeting(x, y + 1, obj_ice_block))
|| (speed < 1)
{
	if (audio_is_playing(snd_skidding_ice))
	{
		audio_stop_sound(snd_skidding_ice);
	}
}
#endregion /* Stop skidding ice sound END */

#region /* Stop skidding sound */
if (!crouch)
{
	if (speed < 2)
	|| (hspeed > 0)
	&& (key_right_hold)
	|| (hspeed < 0)
	&& (key_left_hold)
	|| (!key_left_hold)
	&& (!key_right_hold)
	|| (!place_meeting(x, y + 1, obj_wall))
	{
		if (audio_is_playing(snd_skidding))
		{
			audio_stop_sound(snd_skidding);
		}
	}
}
else
if (!place_meeting(x, y + 1, obj_wall))
|| (speed < 1)
{
	if (audio_is_playing(snd_skidding))
	{
		audio_stop_sound(snd_skidding);
	}
}
#endregion /* Stop skidding sound END */

#region /* Footstep sounds */
if (on_ground && speed > 0 && !crouch)
{
	if (hspeed < 0 && !key_right_hold || hspeed > 0 && !key_left_hold)
	{
		if (instance_exists(obj_ground))
		{
			var ground = instance_nearest(x, bbox_bottom, obj_ground);
			var ground_surface = ground.ground_surface;
			var ground_meeting = place_meeting(x, y + 1, obj_ground);
		}
		else
		{
			var ground = false;
			var ground_surface = false;
			var ground_meeting = false;
		}

		if (image_index < 1)
		{
			switch (ground_surface)
			{
				case 1: /* Dirt Footstep Left */
					if (ground_meeting && ground_surface == 1 && !audio_is_playing(snd_footstep_dirt_left))
						scr_audio_play(snd_footstep_dirt_left, volume_source.footstep);
					break;
				case 2: /* Glass Footstep Left */
					if (ground_meeting && ground_surface == 2 && !audio_is_playing(snd_footstep_glass_left))
						scr_audio_play(snd_footstep_glass_left, volume_source.footstep);
					break;
				case 3: /* Grass Footstep Left */
					if (ground_meeting && ground_surface == 3 && !audio_is_playing(snd_footstep_grass_left))
						scr_audio_play(snd_footstep_grass_left, volume_source.footstep);
					break;
				case 4: /* Gravel Footstep Left */
					if (ground_meeting && ground_surface == 4 && !audio_is_playing(snd_footstep_gravel_left))
						scr_audio_play(snd_footstep_gravel_left, volume_source.footstep);
					break;
				case 5: /* Metal Footstep Left */
					if (ground_meeting && ground_surface == 5 && !audio_is_playing(snd_footstep_metal_left))
						scr_audio_play(snd_footstep_metal_left, volume_source.footstep);
					break;
				case 6: /* Stone Footstep Left */
					if (ground_meeting && ground_surface == 6 && !audio_is_playing(snd_footstep_stone_left))
						scr_audio_play(snd_footstep_stone_left, volume_source.footstep);
					break;
				case 7: /* Wood Footstep Left */
					if (ground_meeting && ground_surface == 7 && !audio_is_playing(snd_footstep_wood_left))
						scr_audio_play(snd_footstep_wood_left, volume_source.footstep);
					break;
				default: /* Default Footstep Left */
					if (!audio_is_playing(snd_footstep_default_left))
						scr_audio_play(snd_footstep_default_left, volume_source.footstep);
					break;
			}
		}
		else if (image_index > image_number * 0.5 - 1 && image_index < image_number * 0.5 + 1)
		{
			switch (ground_surface)
			{
				case 1: /* Dirt Footstep Right */
					if (ground_meeting && ground_surface == 1 && !audio_is_playing(snd_footstep_dirt_right))
						scr_audio_play(snd_footstep_dirt_right, volume_source.footstep);
					break;
				case 2: /* Glass Footstep Right */
					if (ground_meeting && ground_surface == 2 && !audio_is_playing(snd_footstep_glass_right))
						scr_audio_play(snd_footstep_glass_right, volume_source.footstep);
					break;
				case 3: /* Grass Footstep Right */
					if (ground_meeting && ground_surface == 3 && !audio_is_playing(snd_footstep_grass_right))
						scr_audio_play(snd_footstep_grass_right, volume_source.footstep);
					break;
				case 4: /* Gravel Footstep Right */
					if (ground_meeting && ground_surface == 4 && !audio_is_playing(snd_footstep_gravel_right))
						scr_audio_play(snd_footstep_gravel_right, volume_source.footstep);
					break;
				case 5: /* Metal Footstep Right */
					if (ground_meeting && ground_surface == 5 && !audio_is_playing(snd_footstep_metal_right))
						scr_audio_play(snd_footstep_metal_right, volume_source.footstep);
					break;
				case 6: /* Stone Footstep Right */
					if (ground_meeting && ground_surface == 6 && !audio_is_playing(snd_footstep_stone_right))
						scr_audio_play(snd_footstep_stone_right, volume_source.footstep);
					break;
				case 7: /* Wood Footstep Right */
					if (ground_meeting && ground_surface == 7 && !audio_is_playing(snd_footstep_wood_right))
						scr_audio_play(snd_footstep_wood_right, volume_source.footstep);
					break;
				default: /* Default Footstep Right */
					if (!audio_is_playing(snd_footstep_default_right))
						scr_audio_play(snd_footstep_default_right, volume_source.footstep);
					break;
			}
		}
	}
}
#endregion /* Footstep sounds END */

#region /* Running Sparks Effect */
if (on_ground)
&& (abs(hspeed) >= speed_max_walk)
{
	if (abs(hspeed) > speed_max_walk + 1)
	{
		if (!spark1_effect)
		{
			if (abs(hspeed) < 7)
			&& (key_run)
			&& (!stick_to_wall)
			&& (wall_jump == 0)
			{
				scr_audio_play(voice_startdash, volume_source.voice);
			}
			effect_speedspark_subimg = 0; /* Start speedspark animation */
			spark1_effect = true;
		}
	}
	else
	{
		spark1_effect = false;
	}
	if (abs(hspeed) > 7)
	{
		if (!spark2_effect)
		{
			if (abs(hspeed) < 7.5)
			&& (key_run)
			&& (!stick_to_wall)
			&& (wall_jump == 0)
			{
				scr_audio_play(snd_speed_dash, volume_source.sound);
			}
			effect_speedspark_subimg = 0; /* Start speedspark animation */
			spark2_effect = true;
		}
	}
	else
	{
		spark2_effect = false;
	}
}
else
{
	if (abs(hspeed) < speed_max_walk)
	{
		spark1_effect = false;
	}
	spark2_effect = false;
}
#endregion /* Running Sparks Effect END */

if (on_ground)
{
	can_dive = true;
}

#region /* Sprite standing with item in front */
if (hold_item_in_hands != "")
&& (speed > 0)
&& (!crouch)
&& (sprite_index != sprite_vine_climb)
&& (sprite_index != sprite_vine_stay)
{
	if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front;}else
	if (sprite_idleing_with_item_in_front > noone){sprite_index = sprite_idleing_with_item_in_front;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}else
	if (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}
}
else
if (hold_item_in_hands != "")
&& (!crouch)
&& (sprite_index != sprite_vine_climb)
&& (sprite_index != sprite_vine_stay)
{
	if (sprite_idleing_with_item_in_front > noone){sprite_index = sprite_idleing_with_item_in_front;}else
	if (sprite_walking_with_item_in_front > noone){sprite_index = sprite_walking_with_item_in_front; image_index = 0; image_speed = 0;}else
	if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
}
#endregion /* Sprite standing with item in front END */

if (rope_swing)
{
	if (speed > 10)
	{
		if (sprite_tongue_swing > noone){sprite_index = sprite_tongue_swing;}else
		if (sprite_tongue_swing_still > noone){sprite_index = sprite_tongue_swing_still;}
	}
	else
	{
		if (sprite_tongue_swing_still > noone){sprite_index = sprite_tongue_swing_still;}else
		if (sprite_tongue_swing > noone){sprite_index = sprite_tongue_swing;}
	}
	angle = point_direction(grapple_x, grapple_y, x, y) + 90;
}

#region /* Glide */
if (allow_glide)
{
	if (can_glide > 0)
	{
		can_glide--;
	}
	if (!on_ground)
	&& (!place_meeting(x, y + 32, obj_wall))
	&& (key_jump)
	&& (!rope_swing)
	&& (!stick_to_wall)
	&& (!climb)
	&& (!horizontal_rope_climb)
	&& (!ledge_grab)
	&& (can_glide == 0)
	{
		glide = true;
		ground_pound = false;
		can_glide = 3;
	}
	if (on_ground)
	|| (rope_swing)
	|| (stick_to_wall)
	|| (climb)
	|| (horizontal_rope_climb)
	{
		can_glide = 3;
	}
	if (key_crouch_pressed)
	{
		can_glide = 20;
	}
}
if (glide)
{
	speed_max = speed_max_run;
	dive = false;
	gravity = 0.1;
	if (vspeed > 1)
	{
		vspeed = 1;
	}
	if (sprite_glide_down > noone){sprite_index = sprite_glide_down;}else
	if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
	if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
	if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
	if (sprite_jump > noone){sprite_index = sprite_jump;}else
	if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
	if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
	if (sprite_walk > noone){sprite_index = sprite_walk;}
	if (key_run_pressed)
	|| (key_crouch_pressed)
	|| (on_ground)
	&& (vspeed >= 0)
	|| (rope_swing)
	|| (stick_to_wall)
	|| (climb)
	|| (horizontal_rope_climb)
	|| (ground_pound == 1)
	{
		glide = false;
		can_glide = 3;
	}
}
#endregion /* Glide END */

#endregion /* ________________________________ Handling the sprites and sounds in the step event ________________________________END */

scr_player_move_lose(); /* Have the losing script at the end of Step Event */
