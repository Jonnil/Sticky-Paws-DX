#region /* Initialize Custom character */

scr_set_character_folder();

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

/* The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config file. This also means that x should be after y */

ini_open(character_folder + "/data/character_config.ini"); /* First open the character folder ini before initializing custom character abilities */

#region /* Allow abilities */
allow_crawl = scr_initialize_character_abilities(player - 1, "allow_crawl", true);
allow_crouch = scr_initialize_character_abilities(player - 1, "allow_crouch", true);
allow_dive = scr_initialize_character_abilities(player - 1, "allow_dive", true);
allow_dive_ground_boost = scr_initialize_character_abilities(player - 1, "allow_dive_ground_boost", true);
allow_drowning = scr_initialize_character_abilities(player - 1, "allow_drowning", true);
allow_ground_pound = scr_initialize_character_abilities(player - 1, "allow_ground_pound", true);
allow_ground_pound_jump = scr_initialize_character_abilities(player - 1, "allow_ground_pound_jump", true);
allow_homing_attack = scr_initialize_character_abilities(player - 1, "allow_homing_attack", false);
allow_ledge_grab = scr_initialize_character_abilities(player - 1, "allow_ledge_grab", false);
allow_overflow_hp = scr_initialize_character_abilities(player - 1, "allow_overflow_hp", true);
allow_roll = scr_initialize_character_abilities(player - 1, "allow_roll", false);
allow_run = scr_initialize_character_abilities(player - 1, "allow_run", true);
allow_stop_after_landing_triple_jump = scr_initialize_character_abilities(player - 1, "allow_stop_after_landing_triple_jump", false);
allow_survive_lava = scr_initialize_character_abilities(player - 1, "allow_survive_lava", false);
allow_tongue = scr_initialize_character_abilities(player - 1, "allow_tongue", false);
allow_wall_climb = scr_initialize_character_abilities(player - 1, "allow_wall_climb", true);
allow_wall_jump = scr_initialize_character_abilities(player - 1, "allow_wall_jump", true);
allow_glide = scr_initialize_character_abilities(player - 1, "allow_glide", false);
#endregion /* Allow abilities END */

#region /* Character Values Handeling */
default_xscale = scr_initialize_character_abilities(player - 1, "default_xscale", 1, "values"); /* Default xscale and yscale for sprites */
default_yscale = scr_initialize_character_abilities(player - 1, "default_yscale", 1, "values");
acceleration_on_ground = scr_initialize_character_abilities(player - 1, "acceleration_on_ground", 30, "values"); /* Acceleration on ground */
acceleration_in_air = scr_initialize_character_abilities(player - 1, "acceleration_in_air", 30, "values"); /* Acceleration in air */
acceleration_on_ice = scr_initialize_character_abilities(player - 1, "acceleration_on_ice", 5, "values"); /* Acceleration on ice */
can_attack_after_dive_on_ground_max_value = scr_initialize_character_abilities(player - 1, "can_attack_after_dive_on_ground_max_value", 20, "values"); /* Can Attack After Dive On Ground Max Value */
number_of_jumps = scr_initialize_character_abilities(player - 1, "number_of_jumps", 1, "values"); /* Number of jumps */
midair_jumps_left = scr_initialize_character_abilities(player - 1, "midair_jumps_left", 1, "values"); /* Mid-air jumps left */
midair_jump_flip_animation = scr_initialize_character_abilities(player - 1, "midair_jump_flip_animation", 2, "values"); /* Mid-air Flip Animation counter */
max_hp = scr_initialize_character_abilities(player - 1, "max_hp", 1, "values"); /* Starting HP and Max HP */
hp = scr_initialize_character_abilities(player - 1, "hp", 1, "values");

/* On Linux version, you can't read decimal numbers for some reason, but this code will try and make it possible for you to write in decimal too */
if (acceleration_on_ground >= 1)
{
	acceleration_on_ground = acceleration_on_ground * 0.01;
}
if (acceleration_in_air >= 1)
{
	acceleration_in_air = acceleration_in_air * 0.01;
}
if (acceleration_on_ice >= 1)
{
	acceleration_on_ice = acceleration_on_ice * 0.01;
}
#endregion /* Character Values Handeling END */

ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

#region /* Play as Custom character */

#region /* Climb under y offset origin points */
ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
if (ini_key_exists("sprite origin points", "climb_under_y_offset"))
{
	climb_under_y_offset = ini_read_real("sprite origin points", "climb_under_y_offset", 10);
}
else
{
	if (can_save_to_character_config
	&& ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1]) != undefined)
	{
		ini_write_real("sprite origin points", "climb_under_y_offset", 10);
	}
	climb_under_y_offset = 10;
}
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
#endregion /* Climb under y offset origin points END */

#region /* Sprite variables */
ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
sprite_idle = scr_initialize_character_sprite("idle", sprite_idle); /* If sprites aren't found, it will usually default to idle sprite */
sprite_idle = scr_initialize_character_sprite("stand", sprite_idle); /* If sprites aren't found, it will usually default to idle sprite */

sprite_against_wall = scr_initialize_character_sprite("against_wall", sprite_against_wall);
sprite_against_wall = scr_initialize_character_sprite("againstwall", sprite_against_wall);
sprite_against_wall_start = scr_initialize_character_sprite("against_wall_start", sprite_against_wall_start);
sprite_against_wall_start = scr_initialize_character_sprite("againstwall_start", sprite_against_wall_start);
sprite_burnt = scr_initialize_character_sprite("burnt", sprite_burnt);
sprite_checkpoint_activated = scr_initialize_character_sprite("checkpoint_activated", sprite_checkpoint_activated);
sprite_climb_under = scr_initialize_character_sprite("climb_under", sprite_climb_under);
sprite_climb_under = scr_initialize_character_sprite("climbunder", sprite_climb_under);
sprite_climb_under_look_up = scr_initialize_character_sprite("climb_under_look_up", sprite_climb_under_look_up);
sprite_climb_under_look_up = scr_initialize_character_sprite("climbunder_lookup", sprite_climb_under_look_up);
sprite_climb_under_spin = scr_initialize_character_sprite("climb_under_spin", sprite_climb_under_spin);
sprite_climb_under_spin = scr_initialize_character_sprite("climbunder_spin", sprite_climb_under_spin);
sprite_climb_under_spin_fast = scr_initialize_character_sprite("climb_under_spin_fast", sprite_climb_under_spin_fast);
sprite_climb_under_spin_fast = scr_initialize_character_sprite("climbunder_spin_fast", sprite_climb_under_spin_fast);
sprite_climb_under_still = scr_initialize_character_sprite("climb_under_still", sprite_climb_under_still);
sprite_climb_under_still = scr_initialize_character_sprite("climbunder_still", sprite_climb_under_still);
sprite_crouch = scr_initialize_character_sprite("crouch", sprite_crouch);
sprite_crouch = scr_initialize_character_sprite("squat", sprite_crouch);
sprite_crouch_crawl = scr_initialize_character_sprite("crawl", sprite_crouch_crawl);
sprite_crouch_crawl = scr_initialize_character_sprite("crouch_crawl", sprite_crouch_crawl);
sprite_crouch_crawl = scr_initialize_character_sprite("squat_crawl", sprite_crouch_crawl);
sprite_crouch_fall = scr_initialize_character_sprite("crouch_fall", sprite_crouch_fall);
sprite_crouch_fall = scr_initialize_character_sprite("squat_fall", sprite_crouch_fall);
sprite_crouch_jump = scr_initialize_character_sprite("crouch_jump", sprite_crouch_jump);
sprite_crouch_jump = scr_initialize_character_sprite("squat_jump", sprite_crouch_jump);
sprite_die = scr_initialize_character_sprite("die", sprite_die);
sprite_dive = scr_initialize_character_sprite("dive", sprite_dive);
sprite_double_jump = scr_initialize_character_sprite("double_jump", sprite_double_jump);
sprite_double_jump = scr_initialize_character_sprite("doublejump", sprite_double_jump);
sprite_fall = scr_initialize_character_sprite("fall", sprite_fall);
sprite_fall_slower = scr_initialize_character_sprite("fall_slow", sprite_fall_slower);
sprite_fall_slower = scr_initialize_character_sprite("fall_slower", sprite_fall_slower);
sprite_fall_slower = scr_initialize_character_sprite("fallslow", sprite_fall_slower);
sprite_fall_slower = scr_initialize_character_sprite("fallslower", sprite_fall_slower);
sprite_game_over_character_portrait = scr_initialize_character_sprite("game_over_character_portrait", sprite_game_over_character_portrait);
sprite_ground_pound = scr_initialize_character_sprite("ground_pound", sprite_ground_pound);
sprite_ground_pound = scr_initialize_character_sprite("groundpound", sprite_ground_pound);
sprite_ground_pound_get_up = scr_initialize_character_sprite("ground_pound_get_up", sprite_ground_pound_get_up);
sprite_ground_pound_get_up = scr_initialize_character_sprite("groundpound_getup", sprite_ground_pound_get_up);
sprite_jump = scr_initialize_character_sprite("jump", sprite_jump);
sprite_jump_transition_to_fall = scr_initialize_character_sprite("jump_transition_to_fall", sprite_jump_transition_to_fall);
sprite_crouch_jump_transition_to_fall = scr_initialize_character_sprite("crouch_jump_transition_to_fall", sprite_crouch_jump_transition_to_fall);
sprite_ledge_grab = scr_initialize_character_sprite("ledge_grab", sprite_ledge_grab);
sprite_look_up = scr_initialize_character_sprite("look_up", sprite_look_up);
sprite_look_up = scr_initialize_character_sprite("lookup", sprite_look_up);
sprite_look_up_start = scr_initialize_character_sprite("look_up_start", sprite_look_up_start);
sprite_panting = scr_initialize_character_sprite("panting", sprite_panting);
sprite_run_two = scr_initialize_character_sprite("dash_two", sprite_run_two);
sprite_run_two = scr_initialize_character_sprite("run_two", sprite_run_two);
sprite_run_three = scr_initialize_character_sprite("dash_three", sprite_run_three);
sprite_run_three = scr_initialize_character_sprite("run_three", sprite_run_three);
sprite_run_four = scr_initialize_character_sprite("dash_four", sprite_run_four);
sprite_run_four = scr_initialize_character_sprite("run_four", sprite_run_four);
sprite_run = scr_initialize_character_sprite("dash", sprite_run);
sprite_run = scr_initialize_character_sprite("run", sprite_run);
sprite_sitting_down_to_eat = scr_initialize_character_sprite("sitting_down_to_eat", sprite_sitting_down_to_eat); /* Cutscene Specific Sprite */
sprite_sitting_eat_closed_mouth = scr_initialize_character_sprite("sitting_eat_closed_mouth", sprite_sitting_eat_closed_mouth); /* Cutscene Specific Sprite */
sprite_sitting_eat_open_mouth = scr_initialize_character_sprite("sitting_eat_open_mouth", sprite_sitting_eat_open_mouth); /* Cutscene Specific Sprite */
sprite_sitting_eat_open_mouth_open_eye = scr_initialize_character_sprite("sitting_eat_open_mouth_open_eye", sprite_sitting_eat_open_mouth_open_eye); /* Cutscene Specific Sprite */
sprite_sitting_eat_surprised = scr_initialize_character_sprite("sitting_eat_surprised", sprite_sitting_eat_surprised); /* Cutscene Specific Sprite */
sprite_sitting_eating = scr_initialize_character_sprite("sitting_eating", sprite_sitting_eating); /* Cutscene Specific Sprite */
sprite_skidding = scr_initialize_character_sprite("skidding", sprite_skidding);
sprite_skidding = scr_initialize_character_sprite("slip", sprite_skidding);
sprite_skidding_ice = scr_initialize_character_sprite("skidding_ice", sprite_skidding_ice);
sprite_spring_down = scr_initialize_character_sprite("spring_down", sprite_spring_down);
sprite_spring_transition = scr_initialize_character_sprite("spring_transition", sprite_spring_transition);
sprite_spring_up = scr_initialize_character_sprite("spring_up", sprite_spring_up);
sprite_idle_blink = scr_initialize_character_sprite("stand_blink", sprite_idle_blink);
sprite_idle_animation_one = scr_initialize_character_sprite("idle_animation", sprite_idle_animation_one);
sprite_idle_animation_one = scr_initialize_character_sprite("idle_animation_one", sprite_idle_animation_one);
sprite_idle_animation_two = scr_initialize_character_sprite("idle_animation_two", sprite_idle_animation_two);
sprite_idle_animation_three = scr_initialize_character_sprite("idle_animation_three", sprite_idle_animation_three);
sprite_idle_animation_four = scr_initialize_character_sprite("idle_animation_four", sprite_idle_animation_four);
sprite_idle_animation_five = scr_initialize_character_sprite("idle_animation_five", sprite_idle_animation_five);
sprite_idle_animation_six = scr_initialize_character_sprite("idle_animation_six", sprite_idle_animation_six);
sprite_idle_animation_seven = scr_initialize_character_sprite("idle_animation_seven", sprite_idle_animation_seven);
sprite_idle_animation_eight = scr_initialize_character_sprite("idle_animation_eight", sprite_idle_animation_eight);
sprite_idle_animation_nine = scr_initialize_character_sprite("idle_animation_nine", sprite_idle_animation_nine);
sprite_idle_cold = scr_initialize_character_sprite("cold", sprite_idle_cold);
sprite_idle_cold = scr_initialize_character_sprite("idle_cold", sprite_idle_cold);
sprite_idle_cold = scr_initialize_character_sprite("stand_cold", sprite_idle_cold);
sprite_idleing_on_something = scr_initialize_character_sprite("standing_on_something", sprite_idleing_on_something);
sprite_idleing_on_something = scr_initialize_character_sprite("stand_on_bump", sprite_idleing_on_something);
sprite_idleing_on_something = scr_initialize_character_sprite("idleing_on_something", sprite_idleing_on_something);
sprite_idleing_with_item_in_front = scr_initialize_character_sprite("standing_with_item_in_front", sprite_idleing_with_item_in_front);
sprite_idleing_with_item_in_front = scr_initialize_character_sprite("idleing_with_item_in_front", sprite_idleing_with_item_in_front);
sprite_stomp_spin = scr_initialize_character_sprite("stomp_spin", sprite_stomp_spin);
sprite_stomp_spin = scr_initialize_character_sprite("stompspin", sprite_stomp_spin);
sprite_stomp_spin = scr_initialize_character_sprite("spin", sprite_stomp_spin);
sprite_swim = scr_initialize_character_sprite("swim", sprite_swim);
sprite_swim_fall = scr_initialize_character_sprite("swim_fall", sprite_swim_fall);
sprite_swim_fall = scr_initialize_character_sprite("swim_falling", sprite_swim_fall);
sprite_swim_stand = scr_initialize_character_sprite("swim_stand", sprite_swim_stand);
sprite_tongue_swing = scr_initialize_character_sprite("tongue_swing", sprite_tongue_swing);
sprite_tongue_swing_still = scr_initialize_character_sprite("tongue_swing_still", sprite_tongue_swing_still);
sprite_triple_jump = scr_initialize_character_sprite("triple_jump", sprite_triple_jump);
sprite_triple_jump = scr_initialize_character_sprite("triplejump", sprite_triple_jump);
sprite_vine_climb = scr_initialize_character_sprite("vine_climb", sprite_vine_climb);
sprite_vine_stay = scr_initialize_character_sprite("vine_stay", sprite_vine_stay);
sprite_walk = scr_initialize_character_sprite("walk", sprite_walk);
sprite_walking_with_item_in_front = scr_initialize_character_sprite("walking_with_item_in_front", sprite_walking_with_item_in_front);
sprite_wall_slide = scr_initialize_character_sprite("wall_slide", sprite_wall_slide);
sprite_wall_slide = scr_initialize_character_sprite("wallslide", sprite_wall_slide);
sprite_wall_slide_down = scr_initialize_character_sprite("wall_slide_down", sprite_wall_slide_down);
sprite_wall_slide_down = scr_initialize_character_sprite("wallslide_down", sprite_wall_slide_down);
sprite_wall_slide_up = scr_initialize_character_sprite("wall_slide_up", sprite_wall_slide_up);
sprite_wall_slide_up = scr_initialize_character_sprite("wallslide_up", sprite_wall_slide_up);
sprite_glide_down = scr_initialize_character_sprite("glide_down", sprite_glide_down);

/* Load the mask sprites last */
sprite_mask = scr_initialize_character_sprite("mask", sprite_mask); /* Standing Mask */
sprite_mask_crouch = scr_initialize_character_sprite("mask_crouch", sprite_mask_crouch); /* Crouching Mask */

ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
#endregion /* Sprite variables END */

#region /* Voices */

#region /* Set each voice variable */

#region /* Get voices for wall jumps 1 through 20 */
voice_wall_jump_1 = scr_get_voice("walljump.ogg");
voice_wall_jump_2 = scr_get_voice("walljump2.ogg");
voice_wall_jump_3 = scr_get_voice("walljump3.ogg");
voice_wall_jump_4 = scr_get_voice("walljump4.ogg");
voice_wall_jump_5 = scr_get_voice("walljump5.ogg");
voice_wall_jump_6 = scr_get_voice("walljump6.ogg");
voice_wall_jump_7 = scr_get_voice("walljump7.ogg");
voice_wall_jump_8 = scr_get_voice("walljump8.ogg");
voice_wall_jump_9 = scr_get_voice("walljump9.ogg");
voice_wall_jump_10 = scr_get_voice("walljump10.ogg");
voice_wall_jump_11 = scr_get_voice("walljump11.ogg");
voice_wall_jump_12 = scr_get_voice("walljump12.ogg");
voice_wall_jump_13 = scr_get_voice("walljump13.ogg");
voice_wall_jump_14 = scr_get_voice("walljump14.ogg");
voice_wall_jump_15 = scr_get_voice("walljump15.ogg");
voice_wall_jump_16 = scr_get_voice("walljump16.ogg");
voice_wall_jump_17 = scr_get_voice("walljump17.ogg");
voice_wall_jump_18 = scr_get_voice("walljump18.ogg");
voice_wall_jump_19 = scr_get_voice("walljump19.ogg");
voice_wall_jump_20 = scr_get_voice("walljump20.ogg");
#endregion /* Get voices for wall jumps 1 through 20 END */

#region /* Get voices for start dash 1 through 10 (This plays when you go from walking speed to start running speed) */
voice_start_running_1 = scr_get_voice("startdash.ogg");
voice_start_running_2 = scr_get_voice("startdash2.ogg");
voice_start_running_3 = scr_get_voice("startdash3.ogg");
voice_start_running_4 = scr_get_voice("startdash4.ogg");
voice_start_running_5 = scr_get_voice("startdash5.ogg");
voice_start_running_6 = scr_get_voice("startdash6.ogg");
voice_start_running_7 = scr_get_voice("startdash7.ogg");
voice_start_running_8 = scr_get_voice("startdash8.ogg");
voice_start_running_9 = scr_get_voice("startdash9.ogg");
voice_start_running_10 = scr_get_voice("startdash10.ogg");
#endregion /* Get voices for start dash 1 through 10 END */

#region /* Get voices for rope catch 1 through 10 */
voice_rope_catch_1 = scr_get_voice("ropecatch.ogg");
voice_rope_catch_2 = scr_get_voice("ropecatch2.ogg");
voice_rope_catch_3 = scr_get_voice("ropecatch3.ogg");
voice_rope_catch_4 = scr_get_voice("ropecatch4.ogg");
voice_rope_catch_5 = scr_get_voice("ropecatch5.ogg");
voice_rope_catch_6 = scr_get_voice("ropecatch6.ogg");
voice_rope_catch_7 = scr_get_voice("ropecatch7.ogg");
voice_rope_catch_8 = scr_get_voice("ropecatch8.ogg");
voice_rope_catch_9 = scr_get_voice("ropecatch9.ogg");
voice_rope_catch_10 = scr_get_voice("ropecatch10.ogg");
#endregion /* Get voices for rope catch 1 through 10 END */

#region /* Get voices for jump spring 1 through 10 */
voice_jump_spring_1 = scr_get_voice("jumpspring.ogg");
voice_jump_spring_2 = scr_get_voice("jumpspring2.ogg");
voice_jump_spring_3 = scr_get_voice("jumpspring3.ogg");
voice_jump_spring_4 = scr_get_voice("jumpspring4.ogg");
voice_jump_spring_5 = scr_get_voice("jumpspring5.ogg");
voice_jump_spring_6 = scr_get_voice("jumpspring6.ogg");
voice_jump_spring_7 = scr_get_voice("jumpspring7.ogg");
voice_jump_spring_8 = scr_get_voice("jumpspring8.ogg");
voice_jump_spring_9 = scr_get_voice("jumpspring9.ogg");
voice_jump_spring_10 = scr_get_voice("jumpspring10.ogg");
#endregion /* Get voices for jump spring 1 through 10 END */

#region /* Get voices for jump rope 1 through 10 */
voice_jump_rope_1 = scr_get_voice("jumprope.ogg");
voice_jump_rope_2 = scr_get_voice("jumprope2.ogg");
voice_jump_rope_3 = scr_get_voice("jumprope3.ogg");
voice_jump_rope_4 = scr_get_voice("jumprope4.ogg");
voice_jump_rope_5 = scr_get_voice("jumprope5.ogg");
voice_jump_rope_6 = scr_get_voice("jumprope6.ogg");
voice_jump_rope_7 = scr_get_voice("jumprope7.ogg");
voice_jump_rope_8 = scr_get_voice("jumprope8.ogg");
voice_jump_rope_9 = scr_get_voice("jumprope9.ogg");
voice_jump_rope_10 = scr_get_voice("jumprope10.ogg");
#endregion /* Get voices for jump rope 1 through 10 END */

#region /* Get voices for jump 1 through 10 */
voice_jump_1 = scr_get_voice("jump.ogg");
voice_jump_2 = scr_get_voice("jump2.ogg");
voice_jump_3 = scr_get_voice("jump3.ogg");
voice_jump_4 = scr_get_voice("jump4.ogg");
voice_jump_5 = scr_get_voice("jump5.ogg");
voice_jump_6 = scr_get_voice("jump6.ogg");
voice_jump_7 = scr_get_voice("jump7.ogg");
voice_jump_8 = scr_get_voice("jump8.ogg");
voice_jump_9 = scr_get_voice("jump9.ogg");
voice_jump_10 = scr_get_voice("jump10.ogg");
#endregion /* Get voices for jump 1 through 10 END */

#region /* Get voices for jump 2nd 1 through 10 */
voice_jump_2nd_1 = scr_get_voice("jump2nd.ogg");
voice_jump_2nd_2 = scr_get_voice("jump2nd2.ogg");
voice_jump_2nd_3 = scr_get_voice("jump2nd3.ogg");
voice_jump_2nd_4 = scr_get_voice("jump2nd4.ogg");
voice_jump_2nd_5 = scr_get_voice("jump2nd5.ogg");
voice_jump_2nd_6 = scr_get_voice("jump2nd6.ogg");
voice_jump_2nd_7 = scr_get_voice("jump2nd7.ogg");
voice_jump_2nd_8 = scr_get_voice("jump2nd8.ogg");
voice_jump_2nd_9 = scr_get_voice("jump2nd9.ogg");
voice_jump_2nd_10 = scr_get_voice("jump2nd10.ogg");
#endregion /* Get voices for jump 2nd 1 through 10 END */

#region /* Get voices for jump 3rd 1 through 10 */
voice_jump_3rd_1 = scr_get_voice("jump3rd.ogg");
voice_jump_3rd_2 = scr_get_voice("jump3rd2.ogg");
voice_jump_3rd_3 = scr_get_voice("jump3rd3.ogg");
voice_jump_3rd_4 = scr_get_voice("jump3rd4.ogg");
voice_jump_3rd_5 = scr_get_voice("jump3rd5.ogg");
voice_jump_3rd_6 = scr_get_voice("jump3rd6.ogg");
voice_jump_3rd_7 = scr_get_voice("jump3rd7.ogg");
voice_jump_3rd_8 = scr_get_voice("jump3rd8.ogg");
voice_jump_3rd_9 = scr_get_voice("jump3rd9.ogg");
voice_jump_3rd_10 = scr_get_voice("jump3rd10.ogg");
#endregion /* Get voices for jump 3rd 1 through 10 END */

#region /* Get voices for get incincibility 1 through 10 */
voice_get_invincibility_1 = scr_get_voice("getinvincibility.ogg");
voice_get_invincibility_2 = scr_get_voice("getinvincibility2.ogg");
voice_get_invincibility_3 = scr_get_voice("getinvincibility3.ogg");
voice_get_invincibility_4 = scr_get_voice("getinvincibility4.ogg");
voice_get_invincibility_5 = scr_get_voice("getinvincibility5.ogg");
voice_get_invincibility_6 = scr_get_voice("getinvincibility6.ogg");
voice_get_invincibility_7 = scr_get_voice("getinvincibility7.ogg");
voice_get_invincibility_8 = scr_get_voice("getinvincibility8.ogg");
voice_get_invincibility_9 = scr_get_voice("getinvincibility9.ogg");
voice_get_invincibility_10 = scr_get_voice("getinvincibility10.ogg");
#endregion /* Get voices for get invincibility 1 through 10 END */

#region /* Get voices for enter goal 1 through 10 */
voice_enter_goal_1 = scr_get_voice("entergoal.ogg");
voice_enter_goal_2 = scr_get_voice("entergoal2.ogg");
voice_enter_goal_3 = scr_get_voice("entergoal3.ogg");
voice_enter_goal_4 = scr_get_voice("entergoal4.ogg");
voice_enter_goal_5 = scr_get_voice("entergoal5.ogg");
voice_enter_goal_6 = scr_get_voice("entergoal6.ogg");
voice_enter_goal_7 = scr_get_voice("entergoal7.ogg");
voice_enter_goal_8 = scr_get_voice("entergoal8.ogg");
voice_enter_goal_9 = scr_get_voice("entergoal9.ogg");
voice_enter_goal_10 = scr_get_voice("entergoal10.ogg");
#endregion /* Get voices for enter goal 1 through 10 END */

#region /* Get voices for dive 1 through 20 */
voice_dive_1 = scr_get_voice("dive.ogg");
voice_dive_2 = scr_get_voice("dive2.ogg");
voice_dive_3 = scr_get_voice("dive3.ogg");
voice_dive_4 = scr_get_voice("dive4.ogg");
voice_dive_5 = scr_get_voice("dive5.ogg");
voice_dive_6 = scr_get_voice("dive6.ogg");
voice_dive_7 = scr_get_voice("dive7.ogg");
voice_dive_8 = scr_get_voice("dive8.ogg");
voice_dive_9 = scr_get_voice("dive9.ogg");
voice_dive_10 = scr_get_voice("dive10.ogg");
voice_dive_11 = scr_get_voice("dive11.ogg");
voice_dive_12 = scr_get_voice("dive12.ogg");
voice_dive_13 = scr_get_voice("dive13.ogg");
voice_dive_14 = scr_get_voice("dive14.ogg");
voice_dive_15 = scr_get_voice("dive15.ogg");
voice_dive_16 = scr_get_voice("dive16.ogg");
voice_dive_17 = scr_get_voice("dive17.ogg");
voice_dive_18 = scr_get_voice("dive18.ogg");
voice_dive_19 = scr_get_voice("dive19.ogg");
voice_dive_20 = scr_get_voice("dive20.ogg");
#endregion /* Get voices for dive 1 through 20 END */

#region /* Get voices for damage 1 through 10 */
voice_damage_1 = scr_get_voice("ow.ogg");
voice_damage_2 = scr_get_voice("ow2.ogg");
voice_damage_3 = scr_get_voice("ow3.ogg");
voice_damage_4 = scr_get_voice("ow4.ogg");
voice_damage_5 = scr_get_voice("ow5.ogg");
voice_damage_6 = scr_get_voice("ow6.ogg");
voice_damage_7 = scr_get_voice("ow7.ogg");
voice_damage_8 = scr_get_voice("ow8.ogg");
voice_damage_9 = scr_get_voice("ow9.ogg");
voice_damage_10 = scr_get_voice("ow10.ogg");
#endregion /* Get voices for damage 1 through 10 END */

#region /* Get voices for burned running 1 through 10 */
voice_burned_running_1 = scr_get_voice("burnedrunning.ogg");
voice_burned_running_2 = scr_get_voice("burnedrunning2.ogg");
voice_burned_running_3 = scr_get_voice("burnedrunning3.ogg");
voice_burned_running_4 = scr_get_voice("burnedrunning4.ogg");
voice_burned_running_5 = scr_get_voice("burnedrunning5.ogg");
voice_burned_running_6 = scr_get_voice("burnedrunning6.ogg");
voice_burned_running_7 = scr_get_voice("burnedrunning7.ogg");
voice_burned_running_8 = scr_get_voice("burnedrunning8.ogg");
voice_burned_running_9 = scr_get_voice("burnedrunning9.ogg");
voice_burned_running_10 = scr_get_voice("burnedrunning10.ogg");
#endregion /* Get voices for burned running 1 through 10 END */

#region /* Get voices for burned 1 through 10 */
voice_burned_1 = scr_get_voice("burned.ogg");
voice_burned_2 = scr_get_voice("burned2.ogg");
voice_burned_3 = scr_get_voice("burned3.ogg");
voice_burned_4 = scr_get_voice("burned4.ogg");
voice_burned_5 = scr_get_voice("burned5.ogg");
voice_burned_6 = scr_get_voice("burned6.ogg");
voice_burned_7 = scr_get_voice("burned7.ogg");
voice_burned_8 = scr_get_voice("burned8.ogg");
voice_burned_9 = scr_get_voice("burned9.ogg");
voice_burned_10 = scr_get_voice("burned10.ogg");
#endregion /* Get voices for burned 1 through 10 END */

#region /* Get voices for burned die 1 through 10 */
voice_burned_die_1 = scr_get_voice("burneddie.ogg");
voice_burned_die_2 = scr_get_voice("burneddie2.ogg");
voice_burned_die_3 = scr_get_voice("burneddie3.ogg");
voice_burned_die_4 = scr_get_voice("burneddie4.ogg");
voice_burned_die_5 = scr_get_voice("burneddie5.ogg");
voice_burned_die_6 = scr_get_voice("burneddie6.ogg");
voice_burned_die_7 = scr_get_voice("burneddie7.ogg");
voice_burned_die_8 = scr_get_voice("burneddie8.ogg");
voice_burned_die_9 = scr_get_voice("burneddie9.ogg");
voice_burned_die_10 = scr_get_voice("burneddie10.ogg");
#endregion /* Get voices for burned die 1 through 10 END */

voice_open_mouth = scr_get_voice("open_mouth.ogg");
voice_notice = scr_get_voice("notice.ogg");

#region /* Get voices for scream 1 through 10 */
voice_scream_1 = scr_get_voice("scream.ogg");
voice_scream_2 = scr_get_voice("scream2.ogg");
voice_scream_3 = scr_get_voice("scream3.ogg");
voice_scream_4 = scr_get_voice("scream4.ogg");
voice_scream_5 = scr_get_voice("scream5.ogg");
voice_scream_6 = scr_get_voice("scream6.ogg");
voice_scream_7 = scr_get_voice("scream7.ogg");
voice_scream_8 = scr_get_voice("scream8.ogg");
voice_scream_9 = scr_get_voice("scream9.ogg");
voice_scream_10 = scr_get_voice("scream10.ogg");
#endregion /* Get voices for scream 1 through 10 END */

#endregion /* Set each voice variable END */

scr_player_move_choose_voice_clips(); /* Run this code in obj player alarm 0 event first, so every voice variable get assigned something at start */

#endregion /* Voices END */

#endregion /* Play as Custom character END */

if (global.assist_enable)
{
	max_hp += global.assist_extra_hp; /* Starting Max HP with assist extra hp */
	hp += global.assist_extra_hp; /* Starting HP with assist extra hp */
}

#region /* Have Heart Balloon */
/* Check if the save file exists and read the value for the corresponding player */
if (global.character_select_in_this_menu == "main_game"
&& !global.doing_clear_check_level
&& !global.doing_clear_check_character)
{
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	have_heart_balloon = ini_read_real("Player", "player" + string(player) + "_have_heart_balloon", false);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
else
{
	have_heart_balloon = false;
}
#endregion /* Have Heart Balloon END */

custom_character = global.character_for_player[player];
selected_voicepack = global.voicepack_for_player[player];
selected_skin = global.skin_for_player[player];

#endregion /* Initialize Custom Character END */

/* Get the original player color from your global array */
var orig_color = global.player_color[player];

/* Extract the RGB components */
var r = color_get_red(orig_color);
var g = color_get_green(orig_color);
var b = color_get_blue(orig_color);

/* Convert the original color to HSV */
var hsv = rgb_to_hsv(r, g, b);
var h = hsv[0];

/* Create the new color with fixed saturation */
saturated_player_color = make_color_hsv(h, 64, 255);
