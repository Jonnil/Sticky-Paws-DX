function scr_player_initialize_custom_character()
{
	
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
	sprite_run_two = noone;
	sprite_run_three = noone;
	sprite_run_four = noone;
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
	sprite_idle = noone;
	sprite_idle_blink = noone;
	sprite_idle_animation_one = noone;
	sprite_idle_animation_two = noone;
	sprite_idle_animation_three = noone;
	sprite_idle_animation_four = noone;
	sprite_idle_animation_five = noone;
	sprite_idle_animation_six = noone;
	sprite_idle_animation_seven = noone;
	sprite_idle_animation_eight = noone;
	sprite_idle_animation_nine = noone;
	sprite_idle_cold = noone;
	sprite_idleing_on_something = noone;
	sprite_idleing_with_item_in_front = noone;
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
	
}