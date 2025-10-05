/* Reuse calculated values */
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

/* Run scripts */
scr_toggle_fullscreen();
scr_set_controls_used_to_navigate();
scr_resize_application_surface();
scr_menu_navigation_initialization();

/* Only update audio listener position and velocity when the player is moving */
if (speed > 0)
{
	audio_listener_position(x, y, 0);
	audio_listener_velocity(abs(hspeed), abs(vspeed), 0);
}

/* Check if "obj level" exists */
if (stop_at_level && nearest_level == noone) /* Only get info from levels when you stop at a level and nothing is stored in "nearest level" variable, so this code isn't running every frame */
{
	if (instance_exists(obj_level))
	{
		nearest_level = instance_nearest(x, y, obj_level);
		distance_to_level = distance_to_object(nearest_level);
		at_least_one_big_collectible = false;
		for(var i = 1; i <= global.max_big_collectible; i += 1)
		{
			if (nearest_level.big_collectible[i])
			{
				at_least_one_big_collectible = true;
				break; /* exit the loop if any big collectible is false */
			}
		}
		/* Best time text */
		var time_minute = nearest_level.timeattack_minute;
		var time_second = string_replace_all(string_format(nearest_level.timeattack_second, 2, 0), " ", "0");
		var time_millisecond = string_replace_all(string_format(nearest_level.timeattack_millisecond, 2, 0), " ", "0");
		best_time_text = l10n_text("Best Time") + ": " + string(time_minute) + ":" + time_second + "." + time_millisecond;

	}
	else
	{
		at_least_one_big_collectible = false;
	}
}

/* Quit Game */
if (global.quit_level)
{
	if (speed == 0)
	{
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	global.quit_level = false;
	room_persistent = false;
	room_goto(rm_title);
}

/* Lerp player position and scale */
xx = lerp(xx, x, 0.2);
yy = lerp(yy, y, 0.2);
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

/* Pause */
var pause_condition_met = keyboard_check_pressed(vk_escape) ||
(global.automatically_pause_when_window_is_unfocused && !window_has_focus()) ||
(global.controls_used_for_navigation == "mouse" && mouse_check_button_released(mb_left) && point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 185, 0, display_get_gui_width(), 42));

for (var i = 1; i <= global.max_players; i++)
{
	if (gamepad_button_check_pressed(global.player_slot[i], gp_select) || gamepad_button_check_pressed(global.player_slot[i], gp_start))
	{
		pause_condition_met = true;
		global.pause_player = i - 1;
		break;
	}
}

if (pause_condition_met)
{
	global.pause = true;
	global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 0, 0, 0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	room_goto(rm_pause);
}

#region /* Stop player when touching level */
if (!place_meeting(x, y, obj_level))
{
	stop_at_level = false;
	nearest_level = noone; /* Reset nearest level when */
}
#endregion /* Stop player when touching level END */

/* Delay countup */
if (!can_move)
&& (delay < 100)
{
	delay++;
}
if (move_delay < 50)
{
	move_delay++;
}
if (can_enter_level < 30)
{
	can_enter_level++;
}

/* Start level after pressing enter */
if (!can_move && entering_level && delay >= 60 && iris_yscale <= 0.001 && !global.quit_level && !loading_assets)
{
	global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
	room_persistent = false;
	if (global.music != noone)
	{
		audio_sound_gain(global.music, 0, 0);
		audio_stop_sound(global.music);
	}
	/* Don't "audio stop all" here, otherwise the loading music will play twice during loading screen */
	if (global.loading_music > 0 && !audio_is_playing(global.loading_music))
	{
		scr_audio_play(global.loading_music, volume_source.music);
	}
	global.pause = false;
	global.quit_level = false;
	scr_update_all_backgrounds();
	global.actually_play_edited_level = true;
	global.play_edited_level = true;
	global.part_limit = global.part_limit_entity = 0;
	var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
	{
		if (global.music != noone)
		{
			audio_sound_gain(global.music, 0, 0);
			audio_stop_sound(global.music);
		}
		room_goto(rm_leveleditor);
	}, [], 1);
	time_source_start(time_source);
	loading_assets = true;
}

/* Set sprite index */
if (entering_level)
{
	if (sprite_world_enter_level > noone) sprite_index = sprite_world_enter_level;
	else if (sprite_world > noone) sprite_index = sprite_world;
	else if (sprite_idle > noone) sprite_index = sprite_idle;
	else if (sprite_walk > noone) sprite_index = sprite_walk;
}
else
{
	if (sprite_world > noone) sprite_index = sprite_world;
	else if (sprite_walk > noone && speed > 0) sprite_index = sprite_walk;
	else if (sprite_idle > noone) sprite_index = sprite_idle;
	else if (sprite_walk > noone) sprite_index = sprite_walk;
}

#region /* Set a bunch of global variables to default when you're not on a selected level */
if (iris_xscale >= 1 && distance_to_object(instance_nearest(xx, yy, obj_level)) > 32)
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

#region /* Movement */
if (can_move && !global.quit_level)
{
	if (move_delay > 10 && speed == 0)
	{
		var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
		var mouse_dist = distance_to_point(mouse_x, mouse_y);
		var mouse_not_on_pause_button = !point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 185, 0, display_get_gui_width(), 42);

		if (key_up || mouse_check_button_released(mb_left) && mouse_dir > 45 && mouse_dir < 135 && mouse_dist > 16 && mouse_dist < 100 && mouse_not_on_pause_button)
		{
			if (!position_meeting(x, y - 32, obj_wall))
			{
				vspeed -= move_speed;
				move_delay = 0;
				transfer_data = false;
			}
			else
			if (!audio_is_playing(snd_bump))
			{
				draw_xscale = 1.5;
				draw_yscale = 0.5;
				yy -= 32;
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		else
		if (key_left || mouse_check_button_released(mb_left) && mouse_dir > 135 && mouse_dir < 225 && mouse_dist > 16 && mouse_dist < 100 && mouse_not_on_pause_button)
		{
			if (!position_meeting(x - 32, y, obj_wall))
			{
				hspeed -= move_speed;
				move_delay = 0;
				transfer_data = false;
			}
			else
			if (!audio_is_playing(snd_bump))
			{
				draw_xscale = 0.5;
				draw_yscale = 1.5;
				xx -= 32;
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		else
		if (key_right || mouse_check_button_released(mb_left) && (mouse_dir > 0 && mouse_dir < 45 || mouse_dir > 315 && mouse_dir < 361) && mouse_dist > 16 && mouse_dist < 100 && mouse_not_on_pause_button)
		{
			if (!position_meeting(x + 32, y, obj_wall))
			{
				hspeed += move_speed;
				move_delay = 0;
				transfer_data = false;
			}
			else
			if (!audio_is_playing(snd_bump))
			{
				draw_xscale = 0.5;
				draw_yscale = 1.5;
				xx += 32;
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		else
		if (key_down || mouse_check_button_released(mb_left) && mouse_dir > 225 && mouse_dir < 315 && mouse_dist > 16 && mouse_dist < 100 && mouse_not_on_pause_button)
		{
			if (!position_meeting(x, y + 32, obj_wall))
			{
				vspeed += move_speed;
				move_delay = 0;
				transfer_data = false;
			}
			else
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
#endregion /* Movement END */

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay--;
}

scr_deactivate_objects_outside_view(); /* This function needs to be at the very end of the step event */
global.deactivate_timer++;
