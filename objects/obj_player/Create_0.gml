/* ________________________________Create Event________________________________ */

#region /* Debug toggles */
can_initialize_custom_character = true;
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

#region /* Initialize Custom character */

#region /* Allow */
allow_crawl = true;
allow_crouch = true;
allow_dive = true; /* Dive when you have speed or during a ground pound */
allow_dive_ground_boost = true;
allow_drowning = true;
allow_ground_pound = true; /* If you can ground pound or not */
allow_ground_pound_jump = true;
allow_homing_attack = false;
allow_ledge_grab = false; /* Needs fixing, the player should stick to the wall more, if there isn't a wall you should fall, if the wall moves you should move with it */
allow_overflow_hp = false;
allow_roll = false;
allow_run = true;
allow_stop_after_landing_triple_jump = false;
allow_survive_lava = true;
allow_tongue = false; /* A tongue that extends */
allow_wall_climb = true; /* If you can wall climb or not */
allow_wall_jump = true; /* If you can wall jump or not */
allow_glide = false;
#endregion /* Allow END */

#region /* Character Values Handeling */
acceleration_on_ground = 0.3; /* How much acceleration the character has on ground */
acceleration_in_air = 0.3; /* How much acceleration the character has in air */
acceleration_on_ice = 0.05; /* How much acceleration the character has on ice */
seconds_until_drowning = 10; /* How many seconds you can breathe underwater */
frames_until_drowning = seconds_until_drowning* 60 + 1;
drawn_frames_until_drowning = frames_until_drowning;
max_hp = 1; /* Starting Max HP */
hp = 1; /* Starting HP */
max_overflow_hp = 4; /* Starting Max Overflow HP */
number_of_jumps = 1; /* How many times you can jump. - 1 = infinite jumps, 0 = no jump, 1 = single jump, 2 = double jump */
midair_jumps_left = 1; /* How many mid-air jumps you have left to perform */
midair_jump_flip_animation = 2; /* How many flip animations the character do in mid-air, after you have jumped this many times, you stop doing the flip animation */
speed_max_walk = 4; /* Default speed_max_walk is 4. Top speed with simple walking */
speed_max_run = 8; /* Default speed_max_run is 8. Top speed with simple running */
triple_jump_height = 14.5;
normal_jump_height = 11.5;
higher_jump_height = 13;
double_jump_height = 11.5;
homing_attack_distance = 500;
#endregion /* Character Values Handeling END */

#region /* Play as Custom character */

climb_under_y_offset = 10;

#region /* Sprite variables */
sprite_mask = spr_player_stand; /* Mask Index END */
sprite_mask_crouch = spr_player_stand; /* Mask Crouch Index END */
sprite_against_wall = noone;
sprite_against_wall_start = noone;
sprite_burnt = noone;
sprite_checkpoint_activated = noone;
sprite_climb_under = noone;
sprite_climb_under_look_up = noone;
sprite_climb_under_spin = noone;
sprite_climb_under_spin_fast = noone;
sprite_climb_under_still = noone;
sprite_crouch = noone;
sprite_crouch_crawl = noone;
sprite_crouch_fall = noone;
sprite_crouch_jump = noone;
sprite_die = noone;
sprite_dive = noone;
sprite_double_jump = noone;
sprite_fall = noone;
sprite_fall_slower = noone;
sprite_game_over_character_portrait = noone;
sprite_ground_pound = noone;
sprite_ground_pound_get_up = noone;
sprite_jump = noone;
sprite_jump_transition_to_fall = noone;
sprite_crouch_jump_transition_to_fall = noone;
sprite_ledge_grab = noone;
sprite_look_up = noone;
sprite_look_up_start = noone;
sprite_panting = noone;
sprite_run2 = noone;
sprite_run3 = noone;
sprite_run4 = noone;
sprite_run = noone;
sprite_sitting_down_to_eat = noone;
sprite_sitting_eat_closed_mouth = noone;
sprite_sitting_eat_open_mouth = noone;
sprite_sitting_eat_open_mouth_open_eye = noone;
sprite_sitting_eat_surprised = noone;
sprite_sitting_eating = noone;
sprite_skidding = noone;
sprite_skidding_ice = noone;
sprite_skidding_stop = noone;
sprite_spring_down = noone;
sprite_spring_transition = noone;
sprite_spring_up = noone;
sprite_stand = noone;
sprite_stand_blink = noone;
sprite_idle_animation1 = noone;
sprite_idle_animation2 = noone;
sprite_idle_animation3 = noone;
sprite_idle_animation4 = noone;
sprite_idle_animation5 = noone;
sprite_idle_animation6 = noone;
sprite_idle_animation7 = noone;
sprite_idle_animation8 = noone;
sprite_idle_animation9 = noone;
sprite_stand_cold = noone;
sprite_standing_on_something = noone;
sprite_standing_with_item_in_front = noone;
sprite_stomp_spin = noone;
sprite_swim = noone;
sprite_swim_fall = noone;
sprite_swim_stand = noone;
sprite_tongue_swing = noone;
sprite_tongue_swing_still = noone;
sprite_triple_jump = noone;
sprite_vine_climb = noone;
sprite_vine_stay = noone;
sprite_walk = noone;
sprite_walking_with_item_in_front = noone;
sprite_wall_slide = noone;
sprite_wall_slide_down = noone;
sprite_wall_slide_up = noone;
sprite_glide_down = noone;
#endregion /* Sprite variables END */

#region /* Sound variables */

#region /* Voices */

#region /* Voice Wall Jump */
voice_wall_jump_1 = noone; /* Voice Wall Jump 1 */
voice_wall_jump_2 = noone; /* Voice Wall Jump 2 */
voice_wall_jump_3 = noone; /* Voice Wall Jump 3 */
voice_wall_jump_4 = noone; /* Voice Wall Jump 4 */
voice_wall_jump_5 = noone; /* Voice Wall Jump 5 */
voice_wall_jump_6 = noone; /* Voice Wall Jump 6 */
voice_wall_jump_7 = noone; /* Voice Wall Jump 7 */
voice_wall_jump_8 = noone; /* Voice Wall Jump 8 */
voice_wall_jump_9 = noone; /* Voice Wall Jump 9 */
voice_wall_jump_10 = noone; /* Voice Wall Jump 10 */
voice_wall_jump_11 = noone; /* Voice Wall Jump 11 */
voice_wall_jump_12 = noone; /* Voice Wall Jump 12 */
voice_wall_jump_13 = noone; /* Voice Wall Jump 13 */
voice_wall_jump_14 = noone; /* Voice Wall Jump 14 */
voice_wall_jump_15 = noone; /* Voice Wall Jump 15 */
voice_wall_jump_16 = noone; /* Voice Wall Jump 16 */
voice_wall_jump_17 = noone; /* Voice Wall Jump 17 */
voice_wall_jump_18 = noone; /* Voice Wall Jump 18 */
voice_wall_jump_19 = noone; /* Voice Wall Jump 19 */
voice_wall_jump_20 = noone; /* Voice Wall Jump 20 */
#endregion /* Voice Wall Jump END */

#region /* Voice Start Running */
voice_start_running_1 = noone; /* Voice Start Running 1 */
voice_start_running_2 = noone; /* Voice Start Running 2 */
voice_start_running_3 = noone; /* Voice Start Running 3 */
voice_start_running_4 = noone; /* Voice Start Running 4 */
voice_start_running_5 = noone; /* Voice Start Running 5 */
voice_start_running_6 = noone; /* Voice Start Running 6 */
voice_start_running_7 = noone; /* Voice Start Running 7 */
voice_start_running_8 = noone; /* Voice Start Running 8 */
voice_start_running_9 = noone; /* Voice Start Running 9 */
voice_start_running_10 = noone; /* Voice Start Running 10 */
#endregion /* Voice Start Running END */

#region /* Voice Rope Catch */
voice_rope_catch_1 = noone; /* Voice Rope Catch 1 */
voice_rope_catch_2 = noone; /* Voice Rope Catch 2 */
voice_rope_catch_3 = noone; /* Voice Rope Catch 3 */
voice_rope_catch_4 = noone; /* Voice Rope Catch 4 */
voice_rope_catch_5 = noone; /* Voice Rope Catch 5 */
voice_rope_catch_6 = noone; /* Voice Rope Catch 6 */
voice_rope_catch_7 = noone; /* Voice Rope Catch 7 */
voice_rope_catch_8 = noone; /* Voice Rope Catch 8 */
voice_rope_catch_9 = noone; /* Voice Rope Catch 9 */
voice_rope_catch_10 = noone; /* Voice Rope Catch 10 */
#endregion /* Voice Rope Catch END */

#region /* Voice Jump Spring */
voice_jump_spring_1 = noone; /* Voice Jump Spring 1 */
voice_jump_spring_2 = noone; /* Voice Jump Spring 2 */
voice_jump_spring_3 = noone; /* Voice Jump Spring 3 */
voice_jump_spring_4 = noone; /* Voice Jump Spring 4 */
voice_jump_spring_5 = noone; /* Voice Jump Spring 5 */
voice_jump_spring_6 = noone; /* Voice Jump Spring 6 */
voice_jump_spring_7 = noone; /* Voice Jump Spring 7 */
voice_jump_spring_8 = noone; /* Voice Jump Spring 8 */
voice_jump_spring_9 = noone; /* Voice Jump Spring 9 */
voice_jump_spring_10 = noone; /* Voice Jump Spring 10 */
#endregion /* Voice Jump Spring END */

#region /* Voice Jump Rope */
voice_jump_rope_1 = noone; /* Voice Jump Rope 1 */
voice_jump_rope_2 = noone; /* Voice Jump Rope 2 */
voice_jump_rope_3 = noone; /* Voice Jump Rope 3 */
voice_jump_rope_4 = noone; /* Voice Jump Rope 4 */
voice_jump_rope_5 = noone; /* Voice Jump Rope 5 */
voice_jump_rope_6 = noone; /* Voice Jump Rope 6 */
voice_jump_rope_7 = noone; /* Voice Jump Rope 7 */
voice_jump_rope_8 = noone; /* Voice Jump Rope 8 */
voice_jump_rope_9 = noone; /* Voice Jump Rope 9 */
voice_jump_rope_10 = noone; /* Voice Jump Rope 10 */
#endregion /* Voice Jump Rope END */

#region /* Voice Jump */
voice_jump_1 = noone; /* Voice Jump 1 */
voice_jump_2 = noone; /* Voice Jump 2 */
voice_jump_3 = noone; /* Voice Jump 3 */
voice_jump_4 = noone; /* Voice Jump 4 */
voice_jump_5 = noone; /* Voice Jump 5 */
voice_jump_6 = noone; /* Voice Jump 6 */
voice_jump_7 = noone; /* Voice Jump 7 */
voice_jump_8 = noone; /* Voice Jump 8 */
voice_jump_9 = noone; /* Voice Jump 9 */
voice_jump_10 = noone; /* Voice Jump 10 */
#endregion /* Voice Jump END */

#region /* Voice Jump 3rd */
voice_jump_3rd_1 = noone; /* Voice Jump 3rd 1 */
voice_jump_3rd_2 = noone; /* Voice Jump 3rd 2 */
voice_jump_3rd_3 = noone; /* Voice Jump 3rd 3 */
voice_jump_3rd_4 = noone; /* Voice Jump 3rd 4 */
voice_jump_3rd_5 = noone; /* Voice Jump 3rd 5 */
voice_jump_3rd_6 = noone; /* Voice Jump 3rd 6 */
voice_jump_3rd_7 = noone; /* Voice Jump 3rd 7 */
voice_jump_3rd_8 = noone; /* Voice Jump 3rd 8 */
voice_jump_3rd_9 = noone; /* Voice Jump 3rd 9 */
voice_jump_3rd_10 = noone; /* Voice Jump 3rd 10 */
#endregion /* Voice Jump 3rd END */

#region /* Voice Jump 2nd */
voice_jump_2nd_1 = noone; /* Voice Jump 2nd 1 */
voice_jump_2nd_2 = noone; /* Voice Jump 2nd 2 */
voice_jump_2nd_3 = noone; /* Voice Jump 2nd 3 */
voice_jump_2nd_4 = noone; /* Voice Jump 2nd 4 */
voice_jump_2nd_5 = noone; /* Voice Jump 2nd 5 */
voice_jump_2nd_6 = noone; /* Voice Jump 2nd 6 */
voice_jump_2nd_7 = noone; /* Voice Jump 2nd 7 */
voice_jump_2nd_8 = noone; /* Voice Jump 2nd 8 */
voice_jump_2nd_9 = noone; /* Voice Jump 2nd 9 */
voice_jump_2nd_10 = noone; /* Voice Jump 2nd 10 */
#endregion /* Voice Jump 2nd END */

#region /* Voice Get Invincibility */
voice_get_invincibility_1 = noone; /* Voice Get Invincibility 1 */
voice_get_invincibility_2 = noone; /* Voice Get Invincibility 2 */
voice_get_invincibility_3 = noone; /* Voice Get Invincibility 3 */
voice_get_invincibility_4 = noone; /* Voice Get Invincibility 4 */
voice_get_invincibility_5 = noone; /* Voice Get Invincibility 5 */
voice_get_invincibility_6 = noone; /* Voice Get Invincibility 6 */
voice_get_invincibility_7 = noone; /* Voice Get Invincibility 7 */
voice_get_invincibility_8 = noone; /* Voice Get Invincibility 8 */
voice_get_invincibility_9 = noone; /* Voice Get Invincibility 9 */
voice_get_invincibility_10 = noone; /* Voice Get Invincibility 10 */
#endregion /* Voice Get Invincibility END */

#region /* Voice Enter Goal */
voice_enter_goal_1 = noone; /* Voice Enter Goal 1 */
voice_enter_goal_2 = noone; /* Voice Enter Goal 2 */
voice_enter_goal_3 = noone; /* Voice Enter Goal 3 */
voice_enter_goal_4 = noone; /* Voice Enter Goal 4 */
voice_enter_goal_5 = noone; /* Voice Enter Goal 5 */
voice_enter_goal_6 = noone; /* Voice Enter Goal 6 */
voice_enter_goal_7 = noone; /* Voice Enter Goal 7 */
voice_enter_goal_8 = noone; /* Voice Enter Goal 8 */
voice_enter_goal_9 = noone; /* Voice Enter Goal 9 */
voice_enter_goal_10 = noone; /* Voice Enter Goal 10 */
#endregion /* Voice Enter Goal END */

#region /* Voice Dive */
voice_dive_1 = noone; /* Voice Dive 1 */
voice_dive_2 = noone; /* Voice Dive 2 */
voice_dive_3 = noone; /* Voice Dive 3 */
voice_dive_4 = noone; /* Voice Dive 4 */
voice_dive_5 = noone; /* Voice Dive 5 */
voice_dive_6 = noone; /* Voice Dive 6 */
voice_dive_7 = noone; /* Voice Dive 7 */
voice_dive_8 = noone; /* Voice Dive 8 */
voice_dive_9 = noone; /* Voice Dive 9 */
voice_dive_10 = noone; /* Voice Dive 10 */
voice_dive_11 = noone; /* Voice Dive 11 */
voice_dive_12 = noone; /* Voice Dive 12 */
voice_dive_13 = noone; /* Voice Dive 13 */
voice_dive_14 = noone; /* Voice Dive 14 */
voice_dive_15 = noone; /* Voice Dive 15 */
voice_dive_16 = noone; /* Voice Dive 16 */
voice_dive_17 = noone; /* Voice Dive 17 */
voice_dive_18 = noone; /* Voice Dive 18 */
voice_dive_19 = noone; /* Voice Dive 19 */
voice_dive_20 = noone; /* Voice Dive 20 */
#endregion /* Voice Dive END */

#region /* Voice Damage */
voice_damage_1 = noone; /* Voice Damage 1 */
voice_damage_2 = noone; /* Voice Damage 2 */
voice_damage_3 = noone; /* Voice Damage 3 */
voice_damage_4 = noone; /* Voice Damage 4 */
voice_damage_5 = noone; /* Voice Damage 5 */
voice_damage_6 = noone; /* Voice Damage 6 */
voice_damage_7 = noone; /* Voice Damage 7 */
voice_damage_8 = noone; /* Voice Damage 8 */
voice_damage_9 = noone; /* Voice Damage 9 */
voice_damage_10 = noone; /* Voice Damage 10 */
#endregion /* Voice Damage END */

#region /* Voice Burned Running */
voice_burned_running_1 = noone; /* Voice Burned Running 1 */
voice_burned_running_2 = noone; /* Voice Burned Running 2 */
voice_burned_running_3 = noone; /* Voice Burned Running 3 */
voice_burned_running_4 = noone; /* Voice Burned Running 4 */
voice_burned_running_5 = noone; /* Voice Burned Running 5 */
voice_burned_running_6 = noone; /* Voice Burned Running 6 */
voice_burned_running_7 = noone; /* Voice Burned Running 7 */
voice_burned_running_8 = noone; /* Voice Burned Running 8 */
voice_burned_running_9 = noone; /* Voice Burned Running 9 */
voice_burned_running_10 = noone; /* Voice Burned Running 10 */
#endregion /* Voice Burned Running END */

#region /* Voice Burned */
voice_burned_1 = noone; /* Voice Burned 1 */
voice_burned_2 = noone; /* Voice Burned 2 */
voice_burned_3 = noone; /* Voice Burned 3 */
voice_burned_4 = noone; /* Voice Burned 4 */
voice_burned_5 = noone; /* Voice Burned 5 */
voice_burned_6 = noone; /* Voice Burned 6 */
voice_burned_7 = noone; /* Voice Burned 7 */
voice_burned_8 = noone; /* Voice Burned 8 */
voice_burned_9 = noone; /* Voice Burned 9 */
voice_burned_10 = noone; /* Voice Burned 10 */
#endregion /* Voice Burned END */

#region /* Voice Burned Die */
voice_burned_die_1 = noone; /* Voice Burned Die 1 */
voice_burned_die_2 = noone; /* Voice Burned Die 2 */
voice_burned_die_3 = noone; /* Voice Burned Die 3 */
voice_burned_die_4 = noone; /* Voice Burned Die 4 */
voice_burned_die_5 = noone; /* Voice Burned Die 5 */
voice_burned_die_6 = noone; /* Voice Burned Die 6 */
voice_burned_die_7 = noone; /* Voice Burned Die 7 */
voice_burned_die_8 = noone; /* Voice Burned Die 8 */
voice_burned_die_9 = noone; /* Voice Burned Die 9 */
voice_burned_die_10 = noone; /* Voice Burned Die 10 */
#endregion /* Voice Burned Die END */

#region /* Voice Scream */
voice_scream_1 = noone; /* Voice Scream 1 */
voice_scream_2 = noone; /* Voice Scream 2 */
voice_scream_3 = noone; /* Voice Scream 3 */
voice_scream_4 = noone; /* Voice Scream 4 */
voice_scream_5 = noone; /* Voice Scream 5 */
voice_scream_6 = noone; /* Voice Scream 6 */
voice_scream_7 = noone; /* Voice Scream 7 */
voice_scream_8 = noone; /* Voice Scream 8 */
voice_scream_9 = noone; /* Voice Scream 9 */
voice_scream_10 = noone; /* Voice Scream 10 */
#endregion /* Voice Scream END */

#endregion /* Voices END */

voice_wallkick = noone;
voice_startdash = noone;
voice_rope_catch = noone;
voice_jump_spring = noone;
voice_jump_rope = noone;
voice_jump = noone;
voice_jump3rd = noone;
voice_jump2nd = noone;
voice_get_star = noone;
voice_enter_goal = noone;
voice_dive = noone;
voice_damage = noone;
voice_burned_running = noone;
voice_burned = noone;
voice_burned_die = noone;

voice_open_mouth = noone;
voice_notice = noone;
voice_scream = noone;

#endregion /* Sound variables END */

#endregion /* Play as Custom Character END */

#endregion /* Initialize Custom Character END */

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
taken_damage_freezetime = 80;
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
ini_close();
#endregion /* Load Checkpoint Direction END */