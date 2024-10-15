#region /* Debug toggles */
can_enter_level_automatically = true;
#endregion /* Debug toggles END */

max_total_big_collectibles = 50;

global.max_big_collectible = 5; /* Main game only have 5 big collectibles in each level */
full_level_map_screenshot_timer = 0;
can_show_arrows = 0;
show_arrows_alpha = 0;
at_least_one_big_collectible = false;

room_speed = global.max_fps;
character_folder = "";
skin_folder = "";
can_save_to_character_config = false;
loading_assets = false;

prev_display_width = display_get_gui_width();
prev_display_height = display_get_gui_height();

scr_delete_sprite_properly(global.custom_background1);
scr_delete_sprite_properly(global.custom_background2);
scr_delete_sprite_properly(global.custom_background3);
scr_delete_sprite_properly(global.custom_background4);
scr_delete_sprite_properly(global.custom_foreground1);
scr_delete_sprite_properly(global.custom_foreground1_5);
scr_delete_sprite_properly(global.custom_foreground2);
scr_delete_sprite_properly(global.custom_foreground_secret);

for(var i = 1; i <= global.max_players + 1; i += 1)
{
	gamepad_set_vibration(i - 1, 0, 0);
}

mouse_x_position = device_mouse_x_to_gui(0);
mouse_y_position = device_mouse_y_to_gui(0);
menu_joystick_delay = 0;

active_left = false;
active_right = false;
active_up = false;
active_down = false;

move_speed = 8;

if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_map.ogg"))
{
	music_map = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_map.ogg");
}
else
if (file_exists(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_map.ogg"))
{
	music_map = audio_create_stream(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_map.ogg");
}
else
{
	music_map = noone;
}

#region /* Play as custom character */

for(var i = 1; i <= global.max_players; i += 1)
{
	if (global.player_can_play[i])
	{
		player = i;
		custom_character = global.character_for_player[i];
		selected_voicepack = global.voicepack_for_player[i];
		selected_skin = global.skin_for_player[i];
		break; /* Exit the loop once a valid player is found */
	}
	else if (i == global.max_players)
	{
		/* If no valid player is found, default to player 1 */
		var fixed_player = 1;
		player = fixed_player;
		custom_character = global.character_for_player[fixed_player];
		selected_voicepack = global.voicepack_for_player[fixed_player];
		selected_skin = global.skin_for_player[fixed_player];
	}
}

alarm[0] = 1; /* Initialize custom character timer. This code needs to be initialized later than create event, but not in step event, so only initialize in alarm */
alarm[1] = 3; /* Spawn cake stealing enemy on world map */

global.pause_room = noone;
depth = -100;
layer_depth("WindParticles", -99);

mask_index = spr_wall; /* Mask index should be set to the size of a wall, only in Create Event */
global.player_has_entered_goal = false;
global.quit_level = false;
global.quit_to_map = false;

#region /* Reset timer back to zero */
global.timeattack_realmillisecond = 0;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
#endregion /* Reset timer back to zero END */

image_speed = 0.3;
current_file = global.file;
can_move = true;
entering_level = false;
delay = 0;
black_screen_at_start_delay = 0;
transfer_data = false;
move_delay = 0;
stop_at_level = false;
can_enter_level = 0;
draw_xscale = 1;
draw_yscale = 1;
default_xscale = 1;
default_yscale = 1;
menu = noone;
menu_cursor_index = 0;
menu_delay = 3;

brand_new_file = -1;
xx_heart = x;
yy_heart = y - 64;
have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */

#region /* Load Game */
if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini")) {
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	
	brand_new_file = ini_read_real("Player", "brand_new_file", true);
	total_big_collectibles = ini_read_real("Player", "total_big_collectibles", 0);
	
	#region /* Load Player Position */
	if (ini_read_real("Player", "player_x", 0) > 0)
	&& (ini_read_real("Player", "player_y", 0) > 0)
	{
		x = ini_read_real("Player", "player_x", 0);
		y = ini_read_real("Player", "player_y", 0);
		if (instance_exists(obj_level))
		&& (!position_meeting(x, y, obj_level))
		{
			x = instance_nearest(x, y, obj_level).x;
			y = instance_nearest(x, y, obj_level).y;
			xx = instance_nearest(x, y, obj_level).x;
			yy = instance_nearest(x, y, obj_level).y;
		}
	}
	#endregion /* Load Player Position END */
	
	xx_heart = x;
	yy_heart = y - 64;
	
	#region /* Have Heart Balloon */
	if (ini_key_exists("Player", "player" + string(player) + "_have_heart_balloon"))
	{
		have_heart_balloon = ini_read_real("Player", "player" + string(player) + "_have_heart_balloon", false); /* If you have the heart balloon upgrade or not */
	}
	else
	{
		ini_write_real("Player", "player" + string(player) + "_have_heart_balloon", false);
		have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */
	}
	#endregion /* Have Heart Balloon END */
	
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	move_snap(32, 32);
}
else
{
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	ini_write_real("Player", "brand_new_file", true);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	brand_new_file = true;
	total_big_collectibles = 0;
	xx_heart = x;
	yy_heart = y - 64;
	have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */
}
#endregion /* Load Game END */

#region /* Make absolutely sure that the big collectibles counter is correct */
scr_get_each_big_collectible_from_main_game();
if (total_big_collectibles < total_big_collectibles_add)
{
	total_big_collectibles = total_big_collectibles_add;
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	ini_write_real("Player", "total_big_collectibles", total_big_collectibles_add);
	ini_close();
	scr_set_stat_achievement("TOTAL_BIG_COLLECTIBLE", total_big_collectibles_add);
}
#endregion /* Make absolutely sure that the big collectibles counter is correct END */

xx = x;
yy = y;

/* Create the camera map after setting x and y positions */
if (!instance_exists(obj_camera_map)) {
	instance_create_depth(x, y, 0, obj_camera_map);
}

iris_xscale = 0;
iris_yscale = 0;
iris_zoom = 0;

index = 0;
sprite_map = noone;
sprite_map_enter_level = noone;
sprite_idle = noone;
sprite_walk = noone;
#endregion /* Play as custom character END */

scr_config_load(); /* Load Config only once in create event, or it will mess up the options menu navigation */

if (file_exists("localization.csv"))
{
	if (global.language_localization > ds_grid_width(global.language_local_data))
	|| (global.language_localization < 0)
	{
		scr_set_default_language();
	}
}

/* Make number of level cleared 1 because of the level intro */
ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
if (ini_read_real("Player", "number_of_levels_cleared", 1) < 1)
{
	ini_write_real("Player", "number_of_levels_cleared", 1)
}
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

#region /* Reset level zoom */
if (global.reset_level_zoom_when_going_back_to_map)
{
	global.zoom_level = global.default_zoom_level;
	ini_open("save_file/config.ini");
	ini_write_real("config", "zoom_level", global.default_zoom_level);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
#endregion /* Reset level zoom END */

#region /* Reset world map zoom */
if (global.reset_world_map_zoom_when_going_back_to_map)
{
	global.zoom_world_map = global.default_zoom_world_map;
	zoom_lerp = global.default_zoom_world_map;
	zoom_border_lerp = 0;
	ini_open("save_file/config.ini");
	ini_write_real("config", "zoom_world_map", global.default_zoom_world_map);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
#endregion /* Reset world map zoom END */

else
{
	zoom_lerp = global.zoom_world_map;
	zoom_border_lerp = 0;
}

#region /* Make sure camera map is always present on the map screen. Only run this code after doing the deactivate instances code */
if (!instance_exists(obj_camera_map))
{
	instance_create_depth(x, y, 0, obj_camera_map);
}
#endregion /* Make sure camera map is always present on the map screen. Only run this code after doing the deactivate instances code END */

audio_listener_orientation(0, 0, 1, 0, -1, 0);
audio_listener_position(x, y, 0); /* Audio listener should start on top of the player */

scr_audio_play(music_map, volume_source.music); /* Play the map screen music */

nearest_level = noone;
distance_to_level = 0;
best_time_text = "";

/* Stop audio */
audio_stop_sound(snd_skidding);
audio_stop_sound(snd_skidding_ice);
audio_stop_sound(global.music_boss);
audio_stop_sound(global.music);
audio_stop_sound(global.music_underwater);
audio_stop_sound(global.ambience);
audio_stop_sound(global.ambience_underwater);
global.music = noone;
global.music_underwater = noone;
global.ambience = noone;
global.ambience_underwater = noone;

global.goal_active = false;

/* Give player lives if they get a game over */
if (lives <= 0)
{
    lives = 5 * global.playergame;
    if (global.character_select_in_this_menu == "main_game")
	{
        ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
        ini_write_real("Player", "lives", lives);
        ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
    }
}