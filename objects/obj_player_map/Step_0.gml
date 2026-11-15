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

/* Quit Game */
if (global.quit_level)
{
	if (speed == 0)
	{
		scr_save_ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
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
var pause_from_unfocus = global.automatically_pause_when_window_is_unfocused && !window_has_focus();
var pause_condition_met = keyboard_check_pressed(vk_escape) ||
pause_from_unfocus ||
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
	scr_delete_sprite_properly(global.pause_screenshot);
	global.pause_screenshot = noone;

	if (!pause_from_unfocus && surface_exists(application_surface))
	{
		var pause_width = surface_get_width(application_surface);
		var pause_height = surface_get_height(application_surface);

		if (pause_width > 0 && pause_height > 0)
		{
			global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, pause_width, pause_height, 0, 0, 0, 0);
		}
	}

	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	room_goto(rm_pause);
}

#region /* Stop player when touching level */
if (!place_meeting(x, y, obj_level))
{
	stop_at_level = false;
}
#endregion /* Stop player when touching level END */

if (instance_exists(obj_level))
{
	nearest_level = instance_nearest(x, y, obj_level);
}

big_collectible_entry_visible = false;
big_collectible_entry_pointer = false;
big_collectible_entry_consumed = false;
big_collectible_info_ready = false;
big_collectible_info_target = noone;
big_collectible_info_source_key = "";
big_collectible_info_context_key = "";
big_collectible_info_lines = [];
big_collectible_info_badge = noone;
if (instance_exists(nearest_level)) distance_to_level = point_distance(x, y, nearest_level.x, nearest_level.y);

/* One current target supplies both the card and its collectible rows. */
if (big_collectible_info_can_show(nearest_level))
{
	var tier_official_id = scr_normalize_official_level_id(string(ds_list_find_value(global.all_loaded_main_levels, nearest_level.level)));
	scr_big_collectible_entry_cache_refresh(big_collectible_entry_cache,
		scr_get_official_level_file_path(tier_official_id, "data", "level_information.ini"),
		scr_get_official_level_file_path(tier_official_id, "data", "object_placement_all.json"), true, tier_official_id);
	big_collectible_entry_visible = scr_big_collectible_entry_has_rows(big_collectible_entry_cache.model);
	var tier_has_best_time = nearest_level.timeattack_realmillisecond < 999999999 && nearest_level.timeattack_realmillisecond > 0;
	var tier_has_defeats = global.show_defeats_counter && nearest_level.number_of_defeats > 0;
	if (nearest_level.zero_defeats != 0) big_collectible_info_badge = nearest_level.zero_defeats == 1 ? spr_icon_zero_defeats : spr_icon_zero_hits;
	big_collectible_info_ready = big_collectible_entry_visible || tier_has_best_time || tier_has_defeats
		|| nearest_level.level_score > 0 || nearest_level.number_of_clears > 0 || big_collectible_info_badge != noone;
	if (big_collectible_info_ready)
	{
		big_collectible_info_target = nearest_level;
		big_collectible_info_source_key = big_collectible_entry_cache.source_key;
		big_collectible_info_context_key = game_save_id + "|" + string(global.file) + "|" + string(global.difficulty) + "|" + string(nearest_level.level);
		if (tier_has_best_time)
		{
			var time_minute = nearest_level.timeattack_minute;
			var time_second = string_replace_all(string_format(nearest_level.timeattack_second, 2, 0), " ", "0");
			var time_millisecond = string_replace_all(string_format(nearest_level.timeattack_millisecond, 2, 0), " ", "0");
			best_time_text = l10n_text("Best Time") + ": " + string(time_minute) + ":" + time_second + "." + time_millisecond;
			array_push(big_collectible_info_lines, best_time_text);
		}
		array_push(big_collectible_info_lines, l10n_text("Best Score") + ": " + string(nearest_level.level_score));
		array_push(big_collectible_info_lines, l10n_text("Times Passed") + ": " + string(nearest_level.number_of_clears));
		if (tier_has_defeats) array_push(big_collectible_info_lines, l10n_text("Total Defeats") + ": " + string(nearest_level.number_of_defeats));
		var tier_badge_width = big_collectible_info_badge != noone ? sprite_get_width(big_collectible_info_badge) + 8 : 0;
		var tier_badge_height = big_collectible_info_badge != noone ? sprite_get_height(big_collectible_info_badge) : 0;
		var tier_header_reserve = max(big_collectible_entry_visible ? 32 : 0, tier_badge_height);
		var tier_header_gap = tier_header_reserve > 0 ? 8 : 0;
		big_collectible_entry_top = 64;
		big_collectible_info_line_height = min(32, max(12, floor((display_get_gui_height() - 56 - big_collectible_entry_top
			- tier_header_reserve - tier_header_gap - 8) / max(1, array_length(big_collectible_info_lines)))));
		big_collectible_info_text_scale = global.default_text_size;
		var tier_stats_width = 0;
		if (big_collectible_info_line_height < 32)
		{
			var tier_font_height = 1;
			for (var line_index = 0; line_index < array_length(big_collectible_info_lines); line_index++)
			{
				tier_font_height = max(tier_font_height, string_height(big_collectible_info_lines[line_index]));
			}
			big_collectible_info_text_scale = min(global.default_text_size, max(1, big_collectible_info_line_height - 2) / tier_font_height);
		}
		for (var line_index = 0; line_index < array_length(big_collectible_info_lines); line_index++)
		{
			tier_stats_width = max(tier_stats_width, string_width(big_collectible_info_lines[line_index]) * big_collectible_info_text_scale + 4);
		}
		var tier_card_inner_width = max(64, display_get_gui_width() - 56);
		big_collectible_entry_left = 28;
		big_collectible_entry_width = max(24, min(304, tier_card_inner_width - tier_badge_width));
		big_collectible_entry_height = max(24, display_get_gui_height() - 56 - big_collectible_entry_top
			- array_length(big_collectible_info_lines) * big_collectible_info_line_height - 16);
		var tier_rows_width = 0;
		var tier_rows_bottom = big_collectible_entry_top;
		if (big_collectible_entry_visible)
		{
			var tier_layout = scr_big_collectible_selector_layout(big_collectible_entry_cache.model,
				big_collectible_entry_left, big_collectible_entry_top, big_collectible_entry_width, big_collectible_entry_height,
				big_collectible_entry_cache.state.scroll, big_collectible_entry_scale);
			tier_rows_width = tier_layout.width;
			tier_rows_bottom = tier_layout.footer_bottom;
		}
		tier_card_inner_width = min(tier_card_inner_width, max(tier_stats_width, tier_rows_width + tier_badge_width));
		big_collectible_info_right = 28 + tier_card_inner_width + 8;
		big_collectible_info_center = 28 + tier_card_inner_width * 0.5;
		big_collectible_info_stats_top = max(tier_rows_bottom, big_collectible_entry_top + tier_badge_height);
		if (big_collectible_entry_visible || tier_badge_height > 0) big_collectible_info_stats_top += 8;
		big_collectible_info_bottom = big_collectible_info_stats_top + array_length(big_collectible_info_lines) * big_collectible_info_line_height + 8;
		if (big_collectible_entry_visible)
		{
			/* Center the fitted group in the space left by the badge. */
			big_collectible_entry_left = 28 + max(0, (tier_card_inner_width - tier_badge_width - tier_rows_width) * 0.5);
			var tier_choice = scr_big_collectible_selector_step(big_collectible_entry_cache.state, big_collectible_entry_cache.model,
				big_collectible_entry_left, big_collectible_entry_top, big_collectible_entry_width, big_collectible_entry_height, player, true, big_collectible_entry_scale);
			if (tier_choice >= 0 && scr_big_collectible_preview_choose(big_collectible_entry_cache.model, tier_choice))
			{
				menu_delay = 3;
				big_collectible_entry_consumed = true;
			}
		}
		big_collectible_entry_pointer = point_in_rectangle(mouse_get_x, mouse_get_y, 20, 56, big_collectible_info_right, big_collectible_info_bottom);
	}
}
else big_collectible_entry_cache.source_key = "";

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
if (!can_move
&& entering_level
&& delay >= 60
&& iris_yscale <= 0.001
&& !global.quit_level
&& !loading_assets)
{
	scr_prepare_official_level_load();
	room_persistent = false;
	
	if (global.music != noone)
	{
		audio_sound_gain(global.music, 0, 0);
		audio_stop_sound(global.music);
	}
	
	audio_stop_sound(global.music_boss);
	global.music_boss = noone;
	
	/* Don't "audio stop all" here, otherwise the loading music will play twice during loading screen */
	if (global.loading_music > 0
	&& !audio_is_playing(global.loading_music))
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
		
		audio_stop_sound(global.music_boss);
		global.music_boss = noone;
		
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
		var mouse_not_on_pause_button = !big_collectible_entry_pointer && !point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 185, 0, display_get_gui_width(), 42);

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
