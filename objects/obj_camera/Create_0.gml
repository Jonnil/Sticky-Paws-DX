#region /* Debug toggles */
can_spawn_players = true;
#endregion /* Debug toggles END */

selected_voicepack = noone;
time_fill_color = c_white;
time_fill_color_blink = c_white;

#region /* Set Backgrounds */
layer_background_sprite(layer_background_get_id(layer_get_id("Background_1")), global.custom_background1);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
#endregion /* Set Backgrounds END */

scr_make_background_visible();

room_speed = global.max_fps; /* Room Speed is max fps */

scr_initialize_camera();

global.player_has_entered_goal = false;
global.spikes_emerge_time = 0;
global.zero_hits = true; /* Save if player has gotten hit during the level or not */

invincibility_key = ord("I");
invincibility_button = gp_shoulderl;
moonjump_key = ord("M");
moonjump_button = gp_shoulderlb;
show_playtest_buttons = false;

if (global.character_select_in_this_menu == "main_game")
{
	pause_x = -999;
	playtest_invincibility_x = 32;
	playtest_moonjump_x = 96;
}
else
{
	pause_x = 32;
	playtest_invincibility_x = 96;
	playtest_moonjump_x = 160;
}

prev_display_width = display_get_gui_width();
prev_display_height = display_get_gui_height();
mouse_x_position = device_mouse_x_to_gui(0);
mouse_y_position = device_mouse_y_to_gui(0);

black_screen_gui_alpha = 1;
pause_playtest = false;

reset_game_if_no_interactivity = 0;
reset_game_if_no_interactivity_second_countdown_timer = 0;
reset_game_if_no_interactivity_second_countdown = 60;

can_save_to_character_config = false; /* Only turn true when playing as custom character */

display_xscale = 1.5
display_yscale = 1.5
display_xoffset = 0
display_yoffset = 0

depth = -9000;

sprite_index = global.resource_pack_sprite_basic_collectible;
image_speed = 0.25;

global.pause_room = noone;

show_controller_input_change_prompt = 0;
show_keyboard_and_mouse_input_change_prompt = 0;
show_controller_input_change_prompt_y = 0;
show_keyboard_and_mouse_input_change_prompt_y = 0;

delay = 0;
menu_delay = 0; /* When playing level, set menu delay to 0 */
menu_joystick_delay = 0;
menu_cursor_index = 0;
menu = "";
open_dropdown = false;
can_click_on_pause_key = false;
global.deactivate_timer = 999;
global.appear_block_timer = 0;

if (global.character_select_in_this_menu == "main_game")
&& (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
{
	var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
	
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	timeattack_record_millisecond = ini_read_real(level_name, "timeattack_millisecond", 0);
	timeattack_record_second = ini_read_real(level_name, "timeattack_second", 0);
	timeattack_record_minute = ini_read_real(level_name, "timeattack_minute", 0);
	timeattack_record_realmillisecond = ini_read_real(level_name, "timeattack_realmillisecond", 999999999);
	level_score_record = ini_read_real(level_name, "level_score", 0);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
{
	timeattack_record_millisecond = 0;
	timeattack_record_second = 0;
	timeattack_record_minute = 0;
	timeattack_record_realmillisecond = 999999999;
	level_score_record = 0;
}

if (global.character_select_in_this_menu == "main_game")
&& (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
|| (file_exists(global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
	}
	else
	{
		ini_open(global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	}
	
	if (ini_key_exists("info", "make_every_tileset_into_default_tileset"))
	{
		global.make_every_tileset_into_default_tileset = ini_read_real("info", "make_every_tileset_into_default_tileset", false);
	}
	else
	{
		global.make_every_tileset_into_default_tileset = false;
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
{
	global.make_every_tileset_into_default_tileset = false;
}

#region /* Lives Icon */
var fixed_player = 1;
camera_player = fixed_player;
camera_selected_skin = global.skin_for_player[fixed_player];

for(var i = 1; i <= global.max_players; i += 1)
{
	if (global.player_can_play[i])
	{
		camera_player = i;
		camera_selected_skin = global.skin_for_player[i];
		break; /* Exit the loop once a player is found */
	}
}

sprite_lives_icon = spr_1up;

have_set_numbers = false;

alarm[0] = 1; /* Initialize custom character timer. This code needs to be initialized later than create event, but not in step event, so only initialize in alarm */
#endregion /* Lives Icon END */

save_level_as_png = false;
checkpoint_number = 0;

#region /* Hud Variables */
hud_show_lives_y = -64;
hud_show_lives_timer = global.hud_hide_time * 60;
hud_show_defeats_y = -64;
hud_show_defeats_timer = global.hud_hide_time * 60;
hud_show_basic_collectibles_y = -64;
hud_show_basic_collectibles_timer = 0;
hud_show_big_collectibles_y = -64;
hud_show_big_collectibles_timer = 0;
hud_show_score_y = -128;
hud_show_score_timer = 0;
hud_show_key_fragment_y = -64;
hud_show_key_fragment_timer = 0;
time_countup_y = 32; /* What y position the countup timer should be at */
hurry_up_message_timer = 0; /* How long the hurry up message should stay on screen */
set_all_big_collectible = 0;
set_all_key_fragment = 0;
key_fragment_total = 0; /* The total amount of key fragments you have collected */
for (var i = 1; i <= 99; i++)
{
	hud_show_big_collectible_blink[i] = 0;
}
for (var i = 1; i <= 99; i++)
{
	hud_show_key_fragment_blink[i] = 0;
}
#endregion /* Hud Variables END */

#region /* Checkpoint */
if (global.actually_play_edited_level)
&& (global.play_edited_level)
&& (!global.doing_clear_check_character)
&& (!global.doing_clear_check_level)
{
	if (global.checkpoint_x > 0)
	|| (global.checkpoint_y > 0)
	{
		camera_set_view_pos(view_camera[view_current], global.checkpoint_x, global.checkpoint_y); /* Set camera position to be on the last used checkpoint position */
		if (instance_exists(obj_player))
		{
			obj_player.x = global.checkpoint_x;
			obj_player.y = global.checkpoint_y;
		}
		x = global.checkpoint_x;
		y = global.checkpoint_y;
		xx = global.checkpoint_x;
		yy = global.checkpoint_y;
	}
	else
	{
		camera_set_view_pos(view_camera[view_current], x, y); /* Spawn the camera position on this object's x and y positon when this object is created */
	}
}
else
{
	camera_set_view_pos(view_camera[view_current], x, y); /* Spawn the camera position on this object's x and y positon when this object is created */
}
#endregion /* Checkpoint END */

scr_initialize_level_information_ini();

#region /* Spawn Players */
if (can_spawn_players)
{
	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (global.player_can_play[i])
		{
			if (i == 1)
			{
				var object_level_start = obj_level_player1_start;
			}
			else
			if (i == 2)
			{
				var object_level_start = obj_level_player2_start;
			}
			else
			if (i == 3)
			{
				var object_level_start = obj_level_player3_start;
			}
			else
			if (i == 4)
			{
				var object_level_start = obj_level_player4_start;
			}
			else
			{
				var object_level_start = obj_level_player1_start;
			}
			var start_x, start_y;
			if (global.checkpoint_x > 0 && global.checkpoint_y > 0 && global.actually_play_edited_level)
			{
				start_x = global.checkpoint_x;
				start_y = global.checkpoint_y;
			}
			else
			if (global.actually_play_edited_level && instance_exists(object_level_start))
			{
				start_x = object_level_start.x;
				start_y = object_level_start.y;
			}
			else
			{
				start_x = x; /* Default start position if no specific conditions are met */
				start_y = y;
			}
			player[i] = instance_create_depth(start_x, start_y, 0, obj_player);
			with (player[i])
			{
				custom_character = global.character_for_player[i];
				selected_voicepack = global.voicepack_for_player[i];
				selected_skin = global.skin_for_player[i];
				intro_animation = instance_nearest(start_x, start_y, obj_camera).intro_animation;
				player = i;
			}
		}
		else
		{
			player[i] = noone;
		}
	}
	if (room == rm_leveleditor)
	&& (global.actually_play_edited_level)
	{
		player_has_spawned = true;
	}
	else
	{
		player_has_spawned = false;
	}
}
else
{
	for(var i = 1; i <= global.max_players; i += 1)
	{
		player[i] = noone;
	}
	player_has_spawned = false;
}
#endregion /* Spawn Players END */

#region /* HUD Show Controls keys that have been pressed */
for(var i = 1; i <= global.max_players; i += 1)
{
	can_spawn_player[i] = true;
	show_player_controls_y[i] = +32;
	key_player_run_toggle_pressed[i] = noone;
	key_player_zoom_in_hold[i] = noone;
	key_player_zoom_out_hold[i] = noone;
	key_player_zoom_in_release[i] = noone;
	key_player_zoom_out_release[i] = noone;
	player_motor_speed[i] = 0;
	player_vibration_active[i] = 0;
	scr_set_show_controls_x(i);
	player_show_controls_timer[i] = 0;
	player_show_controls_alpha[i] = -10;
	show_run_toggle_for_player[i] = 0;
}
#endregion /* HUD Show Controls keys that have been pressed END */

xx = x;
yy = y;
letterbox_top_y = 0;
letterbox_bottom_y = room_height;
show_letterbox = 0;
iris_xscale = 0;
iris_yscale = 0;
allow_iris = true;
iris_zoom = 0;
timer_blinking_alpha = 0;
current_file = global.file;

scr_update_all_music();

shake = false;

#region /* Assist Item */
if (global.assist_enable)
&& (global.assist_item_appear < 10)
&& (!instance_exists(obj_assist_item))
&& (instance_exists(obj_player))
{
	if (global.lives_until_assist >= global.assist_item_appear)
	|| (global.assist_item_appear <= 0)
	{
		with(instance_nearest(x, y, obj_player))
		{
			instance_create_depth(x - 32, y - 128, 0, obj_assist_item);
		}
	}
}
#endregion /* Assist Item END */

#region /* Start Timer */
time_second = 0;
if (!global.trigger_ending)
{
	if (global.actually_play_edited_level)
	&& (global.play_edited_level)
	&& (global.checkpoint_x > 0 || global.checkpoint_y > 0)
	{
		global.timeattack_realmillisecond = global.checkpoint_realmillisecond;
		global.timeattack_millisecond = global.checkpoint_millisecond;
		global.timeattack_second = global.checkpoint_second;
		global.timeattack_minute = global.checkpoint_minute;
	}
	else
	{
		global.timeattack_realmillisecond = 0;
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute = 0;
	}
}
#endregion /* Start Timer END */

#region /* Limit the number of sound channels, should be on 128 for best performance as default, but let the player change this in Audio Settings. From 32 to 256, 128 is default */
switch(global.number_of_audio_channels)
{
	case 0: audio_channel_num(32);break;
	case 1: audio_channel_num(64);break;
	case 2: audio_channel_num(96);break;
	case 3: audio_channel_num(128);break;
	case 4: audio_channel_num(160);break;
	case 5: audio_channel_num(192);break;
	case 6: audio_channel_num(224);break;
	case 7: audio_channel_num(256);break;
}
#endregion /* Limit the number of sound channels, should be on 128 for best performance as default, but let the player change this in Audio Settings. From 32 to 256, 128 is default END */

zoom_lerp = global.zoom_level;
zoom_border_lerp = 0;

#region /* Set Particle System */
part_system_rain = noone;
part_system_snow = noone;
#endregion /* Set Particle System END */

set_controller_sprites_to_use();

if (timeattack_record_minute > 0)
{
	var timeattack_record_minute_text = string(timeattack_record_minute) + ":";
}
else
{
	var timeattack_record_minute_text = "";
}
best_time_text = l10n_text("Best") + ": " + string(timeattack_record_minute_text)
										  + string_replace_all(string_format(timeattack_record_second, 2, 0), " ", "0") + "."
										  + string_replace_all(string_format(timeattack_record_millisecond, 2, 0), " ", "0");

scr_initialize_effects();

/* Show when you are in Test Mode */
if (!global.actually_play_edited_level)
{
	with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
	{
		above_gui = true;
		above_gui_y = 64;
		score_up = "Test Mode";
	}
}

if (autoscroll_speed_x <> 0)
{
	is_autoscrolling_horizontal = true;
}
else
{
	is_autoscrolling_horizontal = false;
}

if (autoscroll_speed_y <> 0)
{
	is_autoscrolling_vertical = true;
}
else
{
	is_autoscrolling_vertical = false;
}