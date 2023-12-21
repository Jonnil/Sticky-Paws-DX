var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);
var view_x = camera_get_view_x(view_camera[view_current]);
var view_y = camera_get_view_y(view_camera[view_current]);
var view_width = camera_get_view_width(view_camera[view_current]);
var view_height = camera_get_view_height(view_camera[view_current]);

scr_player_move_save_whole_level_as_screenshot();

scr_toggle_fullscreen();
scr_set_controls_used_to_navigate();
scr_resize_application_surface();

#region /* Only update audio listener position and velocity when the player is moving */
if (speed > 0)
{
	audio_listener_position(x, y, 0);
	audio_listener_velocity(abs(hspeed), abs(vspeed), 0);
}
#endregion /* Only update audio listener position and velocity when the player is moving END */

#region /* Quit Game */
if (global.quit_level)
{
	
	#region /* Save Player Position */
	if (speed == 0)
	{
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	#endregion /* Save Player Position END */
	
	global.quit_level = false;
	room_persistent = false; /* Turn OFF Room Persistency. Whenever you quit the game, you need to turn off room persistent */
	room_goto(rm_title);
}
#endregion /* Quit Game END */

#region /* Make sure level music and sound effects stops playing, and play the map screen music */
audio_stop_sound(snd_skidding);
audio_stop_sound(snd_skidding_ice);
audio_stop_sound(snd_music_boss);
audio_stop_sound(global.music);
audio_stop_sound(global.music_underwater);
audio_stop_sound(global.ambience);
audio_stop_sound(global.ambience_underwater);
global.music = noone;
global.music_underwater = noone;
global.ambience = noone;
global.ambience_underwater = noone;
scr_audio_play(music_map, volume_source.music); /* Play the map screen music */
#endregion /* Make sure level music stops playing, and play the map screen music END */

scr_menu_navigation_initialization();

#region /* Lerp the player position and scale to make the player move smoothly */
xx = lerp(xx, x, 0.2);
yy = lerp(yy, y, 0.2);
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
#endregion /* Lerp the player position and scale to make the player move smoothly END */

#region /* Pause */
if (keyboard_check_pressed(vk_escape) ||
	gamepad_button_check_pressed(global.player_slot[1], gp_select) ||
	gamepad_button_check_pressed(global.player_slot[1], gp_start) ||
	gamepad_button_check_pressed(global.player_slot[2], gp_select) ||
	gamepad_button_check_pressed(global.player_slot[2], gp_start) ||
	gamepad_button_check_pressed(global.player_slot[3], gp_select) ||
	gamepad_button_check_pressed(global.player_slot[3], gp_start) ||
	gamepad_button_check_pressed(global.player_slot[4], gp_select) ||
	gamepad_button_check_pressed(global.player_slot[4], gp_start) ||
	(!window_has_focus() && global.automatically_pause_when_window_is_unfocused)
	)
{
	var pause_player = 0;
	if (gamepad_button_check_pressed(global.player_slot[2], gp_select) || gamepad_button_check_pressed(global.player_slot[2], gp_start))
		pause_player = 1;
	else if (gamepad_button_check_pressed(global.player_slot[3], gp_select) || gamepad_button_check_pressed(global.player_slot[3], gp_start))
		pause_player = 2;
	else if (gamepad_button_check_pressed(global.player_slot[4], gp_select) || gamepad_button_check_pressed(global.player_slot[4], gp_start))
		pause_player = 3;
	
	global.pause_player = pause_player;
	global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 0, 0, 0);
	room_persistent = true; /* Turn ON Room Persistency */
	global.pause_room = room;
	audio_pause_all();
	room_goto(rm_pause);
}
#endregion /* Pause END */

#region /* Movement */
if (can_move)
&& (show_demo_over_message == false)
&& (!global.pause)
&& (global.quit_level == false)
{
	if (allow_free_movement)
	{
		
		#region /* Free Movement */
		if (key_up)
		&& (point_distance(xx, yy, x, y) < 4)
		&& (move_delay > 10)
		{
			if (y > view_y + 64)
			{
				if (!position_meeting(x, y - 32, obj_wall))
				&& (!position_meeting(x, y - 64, obj_wall))
				{
					y -= 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (!audio_is_playing(snd_bump))
					{
						draw_xscale = 1.5;
						draw_yscale = 0.5;
						yy -= 32;
						scr_audio_play(snd_bump, volume_source.sound);
					}
				}
			}
		}
		if (key_left)
		&& (point_distance(xx, yy, x, y) < 4)
		&& (move_delay > 10)
		{
			if (x > view_x + 64)
			{
				if (!position_meeting(x - 32, y, obj_wall))
				&& (!position_meeting(x - 64, y, obj_wall))
				{
					x -= 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (!audio_is_playing(snd_bump))
					{
						draw_xscale = 0.5;
						draw_yscale = 1.5;
						xx -= 32;
						scr_audio_play(snd_bump, volume_source.sound);
					}
				}
			}
		}
		if (key_right)
		&& (point_distance(xx, yy, x, y) < 4)
		&& (move_delay > 10)
		{
			if (x < view_x + view_width - 64)
			{
				if (!position_meeting(x + 32, y, obj_wall))
				&& (!position_meeting(x + 64, y, obj_wall))
				{
					x += 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (!audio_is_playing(snd_bump))
					{
						draw_xscale = 0.5;
						draw_yscale = 1.5;
						xx += 32;
						scr_audio_play(snd_bump, volume_source.sound);
					}
				}
			}
		}
		if (key_down)
		&& (point_distance(xx, yy, x, y) < 4)
		&& (move_delay > 10)
		{
			if (y < view_y + view_height - 64)
			{
				if (!position_meeting(x, y + 32, obj_wall))
				&& (!position_meeting(x, y + 64, obj_wall))
				{
					y += 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (!audio_is_playing(snd_bump))
					{
						draw_xscale = 1.5;
						draw_yscale = 0.5;
						yy += 32;
						scr_audio_play(snd_bump, volume_source.sound);
					}
				}
			}
		}
		#endregion /* Free Movement END */
		
	}
	else
	{
		
		#region /* Movement on paths */
		if (move_delay > 10) {
			if (key_up && speed == 0) {
				if (y > view_y + 64 && !position_meeting(x, y - 32, obj_wall)) {
					vspeed -= move_speed;
					move_delay = 0;
					transfer_data = false;
				} else if (!audio_is_playing(snd_bump)) {
					draw_xscale = 1.5;
					draw_yscale = 0.5;
					yy -= 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			} else if (key_left && speed == 0) {
				if (x > view_x + 64 && !position_meeting(x - 32, y, obj_wall)) {
					hspeed -= move_speed;
					move_delay = 0;
					transfer_data = false;
				} else if (!audio_is_playing(snd_bump)) {
					draw_xscale = 0.5;
					draw_yscale = 1.5;
					xx -= 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			} else if (key_right && speed == 0) {
				if (x < view_x + view_width - 64 && !position_meeting(x + 32, y, obj_wall)) {
					hspeed += move_speed;
					move_delay = 0;
					transfer_data = false;
				} else if (!audio_is_playing(snd_bump)) {
					draw_xscale = 0.5;
					draw_yscale = 1.5;
					xx += 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			} else if (key_down && speed == 0) {
				if (y < view_y + view_height - 64 && !position_meeting(x, y + 32, obj_wall)) {
					vspeed += move_speed;
					move_delay = 0;
					transfer_data = false;
				} else if (!audio_is_playing(snd_bump)) {
					draw_xscale = 1.5;
					draw_yscale = 0.5;
					yy += 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			}
		}
		#endregion /* Movement on paths END */

		#region /* Show controls for where you can go */
		if (move_delay > 10)
		&& (speed == 0)
		{
			if (!place_meeting(x + 4, y, obj_wall))
			&& (speed == 0)
			{
				
				#region /* Key Right */
				if (gamepad_is_connected(global.player_slot[1]))
				&& (global.controls_used_for_menu_navigation == "gamepad")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(gp_padr, x + 64, y, 0.5, c_white, 1);
				}
				else
				if (global.player_can_play[1])
				{
					if (global.player_[inp.key][1][1][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][1][2][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				else
				if (global.player_can_play[2])
				{
					if (global.player_[inp.key][2][1][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][2][2][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				else
				if (global.player_can_play[3])
				{
					if (global.player_[inp.key][3][1][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][3][2][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				else
				if (global.player_can_play[4])
				{
					if (global.player_[inp.key][4][1][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player_[inp.key][4][2][action.right] > noone)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.right], x + 64, y, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key Right END */
				
			}
			if (!place_meeting(x - 4, y, obj_wall))
			&& (speed == 0)
			{
				
				#region /* Key Left */
				if (gamepad_is_connected(global.player_slot[1]))
				&& (global.controls_used_for_menu_navigation == "gamepad")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(gp_padl, x - 64, y, 0.5, c_white, 1);
				}
				else
				
				{
					if (global.player_can_play[1])
					{
						if (global.player_[inp.key][1][1][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player_[inp.key][1][2][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player_can_play[2])
					{
						if (global.player_[inp.key][2][1][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player_[inp.key][2][2][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player_can_play[3])
					{
						if (global.player_[inp.key][3][1][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player_[inp.key][3][2][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player_can_play[4])
					{
						if (global.player_[inp.key][4][1][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player_[inp.key][4][2][action.left] > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.left], x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /* Key Left END */
				
			}
			if (!place_meeting(x, y + 4, obj_wall))
			&& (speed == 0)
			{
				
				#region /* Key Down */
				if (gamepad_is_connected(global.player_slot[1]))
				&& (global.controls_used_for_menu_navigation == "gamepad")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(gp_padd, x, y + 64, 0.5, c_white, 1);
				}
				else
				if (global.player_can_play[1])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.down], x, y + 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_can_play[2])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.down], x, y + 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_can_play[3])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.down], x, y + 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_can_play[4])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.down], x, y + 64, 0.5, 0.5, 0, c_white, 1);
				}
				#endregion /* Key Down END */
				
			}
			if (!place_meeting(x, y - 4, obj_wall))
			&& (speed == 0)
			{
				
				#region /* Key Up */
				if (gamepad_is_connected(global.player_slot[1]))
				&& (global.controls_used_for_menu_navigation == "gamepad")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(gp_padu, x, y - 64, 0.5, c_white, 1);
				}
				else
				if (global.player_can_play[1])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.up], x, y - 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_can_play[2])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.up], x, y - 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_can_play[3])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.up], x, y - 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (global.player_can_play[4])
				{
					draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.up], x, y - 64, 0.5, 0.5, 0, c_white, 1);
				}
				#endregion /* Key Up END */
				
			}
		}
		#endregion /* Show controls for where you can go END */
		
	}
}
#endregion /* Movement END */

#region /* Stop player when touching level */
if (place_meeting(x, y, obj_level))
&& (stop_at_level == false)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	stop_at_level = true;
	x = instance_nearest(x, y, obj_level).x;
	y = instance_nearest(x, y, obj_level).y;
	global.current_level_clear_rate = instance_nearest(x, y, obj_level).clear_rate; /* Set the level clear rate to global current clear rate variable for use inside levels, like if a into animation should play or not. Put this code as the last step before closing bracket */
}
if (!place_meeting(x, y, obj_level))
{
	stop_at_level = false;
}
#endregion /* Stop player when touching level END */

#region /* Delay countup */
if (!can_move && delay < 100) {
	delay++;
}

if (move_delay < 50) {
	move_delay++;
}

if (can_enter_level < 30) {
	can_enter_level++;
}
#endregion /* Delay countup END */

#region /* Set selected level index to the level closest to you */
if (instance_exists(obj_level))
{
	global.select_level_index = instance_nearest(x, y, obj_level).level;
}
#endregion /* Set selected level index to the level closest to you END */

#region /* After pressing enter level, the iris should shrink and then start the level */
if (can_move == false)
&& (entering_level)
&& (delay >= 60)
&& (iris_yscale <= 0.001)
&& (global.quit_level == false)
&& (loading_assets == false)
{
	global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)); /* Set the level name to the level you're entering */
	
	room_persistent = false; /* Turn OFF Room Persistency. Whenever you enter a level, you need to turn off room persistent */
	/* Otherwise when trying to win or quit a level, you'll get back to a world map that saved when you were entering a level, making you loop to enter a level over and over again */
	
	/* Don't set entering_level to false, or can_move to true here */
	/* Create Event will take care of that when you enter the world map again */
	/* Doing this code here will make the iris zoom out a bit before properly entering the level */
	audio_stop_sound(music_map); /* Stop any world map music when playing a level */
	audio_stop_all(); /* Stop all sound from playing so nothing is playing at the loading screen first */
	if (global.loading_music > 0)
	{
		if (!audio_is_playing(global.loading_music)) /* Then after stopping all sound, play the loading music */
		{
			audio_play_sound(global.loading_music, 0, true, global.volume_melody * global.volume_main);
		}
	}
	global.trigger_demo_ending = 0;
	global.pause = false;
	global.quit_level = false;
	
	scr_update_all_backgrounds();
	
	global.actually_play_edited_level = true;
	global.play_edited_level = true;
	global.part_limit = 0; /* How many objects are currently placed in the level editor */
	global.part_limit_entity = 0; /* How many entities are currently placed in the level editor */
	
	var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function(){
		audio_stop_sound(music_map); /* Stop any world map music when playing a level */
		room_goto(rm_leveleditor); /* Start the level from world map */
	}, [], 1);
	time_source_start(time_source);
	
	loading_assets = true;
}
#endregion /* After pressing enter level, the iris should shrink and then start the level END */

#region /* Set what sprite player should use */
if (entering_level)
{
	if (sprite_map_enter_level > noone)
	{
		sprite_index = sprite_map_enter_level;
	}
	else
	if (sprite_map > noone)
	{
		sprite_index = sprite_map;
	}
	else
	if (sprite_stand > noone)
	{
		sprite_index = sprite_stand;
	}
	else
	if (sprite_walk > noone)
	{
		sprite_index = sprite_walk;
	}
}
else
{
	if (sprite_map > noone)
	{
		sprite_index = sprite_map;
	}
	else
	if (sprite_walk > noone)
	&& (point_distance(xx, yy, x, y) > 2)
	{
		sprite_index = sprite_walk;
	}
	else
	if (sprite_stand > noone)
	{
		sprite_index = sprite_stand;
	}
	else
	if (sprite_walk > noone)
	{
		sprite_index = sprite_walk;
	}
}
#endregion /* Set what sprite player should use END */

#region /* Set a bunch of global variables to default when you're not on a selected level */
if (distance_to_object(instance_nearest(xx, yy, obj_level)) > 32)
if (iris_xscale >= 1)
{
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;
	global.timeattack_realmillisecond = 999999999;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
	global.lives_until_assist = 0;
	can_move = true;
	delay = 0;
	transfer_data = false;
}
#endregion /* Set a bunch of global variables to default when you're not on a selected level END */

#region /* Give the player lives if they get a game over */
if (lives <= 0)
{
	if (global.playergame <= 0)
	{
		lives = 5;
	}
	else
	if (global.playergame == 1)
	{
		lives = 10;
	}
	else
	if (global.playergame == 2)
	{
		lives = 15;
	}
	else
	if (global.playergame >= 3)
	{
		lives = 20;
	}
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		ini_write_real("Player", "lives", lives);
		ini_close();
	}
}
#endregion /* Give the player lives if they get a game over END */

#region /* Zoom In and Out */

#region /* Zoom In */
if (entering_level)
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

#endregion /* Zoom In and Out END */

#region /* Enter Level */
if (can_enter_level_automatically)
&& (brand_new_file)
&& (can_move)
&& (show_demo_over_message == false)
&& (instance_exists(obj_level)) /* Must check if obj_level exists or not */

|| (key_a_pressed)
&& (global.demo == false)
&& (can_move)
&& (show_demo_over_message == false)
&& (can_enter_level >= 30)
&& (instance_exists(obj_level)) /* Must check if obj_level exists or not */
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (speed == 0)

|| (key_a_pressed)
&& (global.demo)
&& (instance_nearest(x, y, obj_level).level <= global.demo_max_levels)
&& (can_move)
&& (show_demo_over_message == false)
&& (can_enter_level >= 30)
&& (instance_exists(obj_level)) /* Must check if obj_level exists or not */
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (speed == 0)
{
	if (instance_nearest(x, y, obj_level).clear_rate == "enter")
	|| (instance_nearest(x, y, obj_level).clear_rate == "clear")
	{
		if (brand_new_file)
		{
			audio_sound_gain(music_map, 0, 0);
			audio_stop_all(); /* Stop all sound from playing whenever a brand new file is loaded, so nothing is playing at the loading screen first */
			if (global.loading_music > 0)
			{
				if (!audio_is_playing(global.loading_music)) /* Then after stopping all sound, play the loading music */
				{
					audio_play_sound(global.loading_music, 0, true, global.volume_melody * global.volume_main);
				}
			}
		}
		
		#region /* Save Player Position */
		x = instance_nearest(x, y, obj_level).x;
		y = instance_nearest(x, y, obj_level).y;
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_write_real("Player", "brand_new_file", false);
		
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
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
			|| (checkpoint_y > 0)
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
if (global.demo)
&& (instance_nearest(x, y, obj_level).level > global.demo_max_levels)
&& (key_a_pressed)
&& (can_move)
&& (show_demo_over_message == false)
&& (menu_delay == 0 && menu_joystick_delay == 0)
&& (can_enter_level >= 30)
&& (instance_exists(obj_level))
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (speed == 0)
&& (show_demo_over_message == false)
{
	menu_delay = 3;
	menu = "purchase_now";
	show_demo_over_message = true;
}
#endregion /* Enter Level END */

#region /* Clear Level in debug */
if (key_b_pressed)
&& (global.debug_screen)
&& (can_move)
&& (can_enter_level >= 30)
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (speed == 0)
&& (instance_nearest(x, y, obj_level).clear_rate = "enter")
&& (!global.pause)
{
	with (instance_nearest(x, y, obj_level))
	{
		clear_rate = "clear";
		alarm_set(1, 1)
	}
	
	#region /* Save Player Position */
	x = instance_nearest(x, y, obj_level).x;
	y = instance_nearest(x, y, obj_level).y;
	ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
	ini_write_real("Player", "player_x", x);
	ini_write_real("Player", "player_y", y);
	ini_write_real("Player", "brand_new_file", false);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* Save Player Position END */
	
	if (global.character_select_in_this_menu == "main_game")
	{
		var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
		
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		ini_write_string(level_name, "clear_rate", "clear"); /* Make the level clear after checking number of levels cleared */
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
}
#endregion /* Clear Level in debug END */

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay --;
}

if (menu == "purchase_now")
{
	if (key_a_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 64, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 64 + 42))
	&& (mouse_check_button_released(mb_left))
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		url_open(string(global.link_to_steam_page));
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_down)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu = "continue_playing";
		menu_delay = 3;
	}
}
else
if (menu == "continue_playing")
{
	if (key_a_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 106, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 106 + 42))
	&& (mouse_check_button_released(mb_left))
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_up)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu = "purchase_now";
		menu_delay = 3;
	}
}

if (global.goal_active)
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
if (place_meeting(x, y, obj_map_path_turn))
&& (instance_nearest(x, y, obj_map_path_turn).turn == 0) /* Right Down = 0 */
{
	if (abs(hspeed) > 0)
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
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
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
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
if (place_meeting(x, y, obj_map_path_turn))
&& (instance_nearest(x, y, obj_map_path_turn).turn == 1) /* Up Right = 1 */
{
	if (abs(hspeed) > 0)
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = -move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y - move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
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
if (place_meeting(x, y, obj_map_path_turn))
&& (instance_nearest(x, y, obj_map_path_turn).turn = 2) /* Up Left = 2 */
{
	if (abs(hspeed) > 0)
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = -move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y - move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
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
if (place_meeting(x, y, obj_map_path_turn))
&& (instance_nearest(x, y, obj_map_path_turn).turn = 3) /* Left Down = 3 */
{
	if (abs(hspeed) > 0)
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
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
	&& (instance_nearest(x, y, obj_map_path_turn).delay == 0)
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

scr_deactivate_objects_outside_view(); /* This function needs to be at the very end of the step event */