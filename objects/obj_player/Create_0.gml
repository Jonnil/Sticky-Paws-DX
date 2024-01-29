/* ________________________________Create Event________________________________ */

#region /* Debug toggles */
can_create_speed_lines = true;
can_create_follow_mouse = true;
can_collide_with_wall = true; /* For debug purposes, you can disable collision with walls */
#endregion /* Debug toggles END */

room_speed = global.max_fps; /* Room Speed */
/*direction = point_direction(scr_x_to_gui(x), scr_y_to_gui(y), device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));*/

#region /* Create object that always follows mouse */
if (can_create_follow_mouse)
&& (!instance_exists(obj_follow_mouse))
{
	instance_create_depth(mouse_x, mouse_y, 0, obj_follow_mouse);
}
#endregion /* Create object that always follows mouse END */

audio_listener_orientation(0, 0, 1, 0, -1, 0);
audio_listener_position(x, y, 0); /* Audio listener should start on top of the player */

can_save_to_character_config = false; /* Only turn true when playing as custom character */
loading_assets = false;

#region /* What custom character to use, change the character sprites and voice */
var fixed_player = 1;
player = fixed_player;
custom_character = global.character_for_player[fixed_player];
selected_voice_pack = global.voicepack_for_player[fixed_player];
selected_skin = global.skin_for_player[fixed_player];
alarm[0] = 1; /* Initialize custom character timer. This code needs to be initialized later than create event, but not in step event, so only initialize in alarm */
#endregion /* What custom character to use, change the character sprites and voice END */

scr_player_initialize_custom_character();

/* ________________________________ */

#region /* Don't change these variables */
full_level_map_screenshot_timer = 0;

#region /* Intro Animation Variables */
intro_animation = ""; /* This determines the intro animation to play when you first enter a level */
cutscene_time = 0; /* Timer that determines what will happen in the intro animation */
intro_animation_sprite = noone; /* When there is a intro animation, the sprites for the into animation gets stored here, and the normal sprites for gameplay are hidden so the into sprites can play out correctly */
intro_animation_image_index = 0; /* Image index of intro animation */
#endregion /* Intro Animation Variables END */

can_clamp_inside_view = 0; /* There should be a 3 frame delay before the player clamps inside view, so that the player always starts where the camera object spawns */
assist_invincible = false;
buffer_jump = 0; /* Jump buffer timer, set to 0 */
coyote_jump = 0; /* Cayote jump timer, set to 0 so you can't jump mid-air when starting level. The player still has the ability to jump after walking off a ledge for a few frames */
can_attack_after_dive_on_ground = 0; /* When landing on ground after dive, you should be able to still kill enemies for some frames, otherwise it feels unfair if you miss your dive a pixel away */
can_attack_after_dive_on_ground_max_value = 20; /* This is the value that the can_attack_after_dive_on_ground variable gets set to when landing on ground */
can_climb_horizontal_rope_cooldown = 0;
can_dive = true;
can_ground_pound = true; /* When you are able to ground pound or not */
can_ledge_grab = true;
can_mid_air_jump = 0; /* When 0, you can mid air jump. Counts down when above 0 */
can_tongue = true;
tongue_move_player_toward_wall = false; /* If the player flies toward the tongue or not */
tongue_move_player_toward_wall_timer = 0; /* If enought time has passed, then cancel the fly toward the tongue move */
can_wall_jump = true;
dive = false;
dive_on_ground = 0;
double_jump_depleted_blink = 0;
ground_pound = false; /* If you are currently ground pounding or not */
ground_pound_cooldown = 0; /* Cooldown for when you are able to press ground pound button again */
hold_item_in_hands = ""; /* If the character is holding any items in their hands or not */
hold_item_in_hands_x = 0; /* Held item x position */
hold_item_number_of_times_stomped = 0; /* Save how many times the held item / held enemy have been stomped, so you don't reset that number when throwing the item */
hspeed_dir = 1;
invincible_blinking = 0;
joystick_can_ground_pound = true;
ledge_grab = false;
ledge_grab_jump = false;
ledge_grab_delay = 0; /* Delay before you can grab another ledge */
look_up_start_animation = true;
on_ground = false;
pressing_opposite_direction_to_drop_off_from_wall = 0;
roll = false;
star_image_index = 0;
stick_to_wall = false;
wall_climb_slippy = 0; /* How much you slip off Ice Blocks when you climb them */
wall_jump = false;
wall_jump_setting = 1;
wall_jump_time = 10;
glide = false;
can_glide = 0;
idle_animtaion = 0; /* If player should play blinking animation or not */
against_wall_animation = 0; /* First play sprite_against_wall_start, then transition into sprite_against_wall */
draw_arrow_outside_view_up_alpha = 0;
draw_arrow_outside_view_down_alpha = 0;
#endregion /* Don't change these variables END */

#region /* Rope Swing Variables */
grapple_x = x;
grapple_y = y;
rope_angle = point_direction(grapple_x, grapple_y, x, y);
rope_angle_velocity = 0;
rope_length = point_distance(grapple_x, grapple_y, x, y);
rope_swing = false;
rope_x = 0;
rope_y = 0;
#endregion /* Rope Swing Variables END */

speed_max = 4; /* Default max speed is 4, this value is what changes and determines the max speed */
double_tap_left = false;
double_tap_right = false;
double_tap_run_timer = 0;
double_tap_dive = false; /* If you are currently diving by double tapping direction */
double_tap_dive_timer = 0;
double_tap_left_dive = false;
double_tap_right_dive = false;

have_heart_balloon = false; /* If you have the heart balloon upgrade or not. You start without it */

#region /* Custom Music */
if (room != rm_title)
{
	
	#region /* Update Player Lose Melody */
	/* OGG small letter File */
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/lose_melody.ogg"))
	&& (global.character_select_in_this_menu == "main_game")
	|| (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/lose_melody.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	&& (global.create_level_from_template)
	{
		player_lose_melody = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/sound/lose_melody.ogg");
	}
	else
	/* OGG small letter File */
	if (file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/lose_melody.ogg"))
	&& (global.character_select_in_this_menu == "level_editor")
	{
		player_lose_melody = audio_create_stream(global.use_cache_or_working + "custom_levels/" + global.level_name + "/sound/lose_melody.ogg");
	}
	else
	if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/lose_melody.ogg"))
	{
		player_lose_melody = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/lose_melody.ogg");
	}
	else
	if (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/lose_melody.ogg"))
	{
		player_lose_melody = audio_create_stream(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/lose_melody.ogg");
	}
	else
	{
		player_lose_melody = noone;
	}
	#endregion /* Update Player Lose Melody END */
	
	if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_invincible.ogg"))
	{
		music_invincible = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_invincible.ogg");
	}
	else
	if (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_invincible.ogg"))
	{
		music_invincible = audio_create_stream(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/music_invincible.ogg");
	}
	else
	{
		music_invincible = noone;
	}
	
}
else
{
	player_lose_melody = noone;
	music_invincible = noone;
}
#endregion /* Custom Music END */

#region /* Heart balloon starting point */
xx_heart = x;
yy_heart = y;
#endregion /* Heart balloon starting point END */

aim_image_index = 0;
angle = 0;
basic_collectibles = 0;
burnt = false;
can_move = true;
chain_reaction = 0;
climb = false;
collision_mask_alpha = 1;
controller_connected = false;
crouch = false;
default_invincibility_duration_in_frames = 1200; /* By default invincibility duration should last 20 seconds. 60 (fps) * 20 */
default_voice_pitch = 1; /* Set the default pitch for the characters voice, by default it's 1 */
default_xscale = 1; /* Sprite default horizontal stretching, set to 1 */
default_yscale = 1; /* Sprite default vertical stretching, set to 1 */
die = false;
draw_xscale = 1; /* Sprite horizontal stretching, set to 1 */
draw_yscale = 1; /* Sprite vertical stretching, set to 1 */
drop_off_wall_climb = 0;
effect_speedspark_subimg = 11;
effect_turnaround_subimg = 11
goal = false;
just_hit_goal = false;
homing_attack_x = 0;
homing_attack_y = 0;
horizontal_rope_climb = false;
in_water = false; /* If the player is in water or not, instead of checking for the actual obj_water, check for this variable instead */
in_breathable_water = false; /* If the water is breathable or not */
invincible_timer = 0;
invincible_blend = c_white; /* When invincible, player should cycles through the colors of the rainbow, and the after images need to take from this variable */
jump = 0;
jump_transition_to_fall_animation = 0;
last_standing_x = x;
last_standing_y = y;
move_towards_spring_endpoint = false;
music_pitch = 1;
old_in_water = false; /* This just checks if water splash effect should be done or not, by checking if the actual in_water is different from the old_in_water */
overflow_hp = 0; /* Starting Overflow HP. Should be 0 by default */
power_meter_running_sound = false;
red_blink_timer = 0;
smooth_teleport = true;
speed_dash = false;
speedunit = 0;
spring = false;
spring_animation = 0;
spring_endpoint_x = 0;
spring_endpoint_y = 0;
spring_twist_sprite = false;
stomp_spin = false;
stuck_in_wall_counter = 0;
taken_damage = 0;
taken_damage_freezetime = 160; /* Only freeze for a moment when taking damage */
time = 600;
triplejumpdelay = 0;
voice = noone;
xx = x;
yy = y;
spark1_effect = false; /* Running spark effect 1 handler */
spark2_effect = false; /* Running spark effect 2 handler */

#region /* Initialize the controls */
key_dive_pressed = noone;
key_dive_hold = noone;
key_jump = noone;
key_jump_hold = noone;
key_jump_hold_temp = noone;
key_jump_released = noone;
key_jump_released_temp = noone;
key_jump_pressed_temp = noone;
key_double_jump = noone;
key_crouch_hold = noone;
key_crouch_hold_temp = noone;
key_crouch_pressed = noone;
key_crouch_pressed_temp = noone;
key_crouch_toggle = noone;
key_run = noone;
key_run_hold_temp = noone;
key_run_pressed = noone;
key_run_released = noone;
key_up = noone;
key_up_pressed = noone;
key_left_hold = noone;
key_left_pressed = noone;
key_right_hold = noone;
key_right_pressed = noone;
key_down = noone;
key_up_hold_temp = noone;
key_up_pressed_temp = noone;
key_up_released_temp = noone;
key_left_hold_temp = noone;
key_left_pressed_temp = noone;
key_right_hold_temp = noone;
key_right_pressed_temp = noone;
key_down_hold_temp = noone;
key_tongue = noone;
key_tongue_pressed = noone;
key_tongue_released = noone;

active_left = false;
active_right = false;
active_up = false;
active_down = false;
active_jump = false;
#endregion /* Initialize the controls END */

#region /* Load Checkpoint Direction */
spawned_from_checkpoint = false;
var level_name = global.level_name;
if (global.character_select_in_this_menu == "main_game")
{
	ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
}
else
{
	ini_open(working_directory + "save_file/custom_level_save.ini");
}
if (ini_key_exists(level_name, "checkpoint_direction"))
{
	spawned_from_checkpoint = true;
	image_xscale = ini_read_real(level_name, "checkpoint_direction", +1);
}
ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
#endregion /* Load Checkpoint Direction END */