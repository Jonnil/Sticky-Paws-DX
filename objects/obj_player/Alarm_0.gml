#region /* Initialize Custom character */

if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1])) + "/data/character_config.ini"))
{
	character_folder = "characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1]));
}
else
{
	character_folder = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1]));
}

if (file_exists(string(character_folder) + "/sprites/skin" + string(selected_skin) + "/mask.png"))
{
	skin_folder = "/skin" + string(selected_skin) + "/";
}
else
{
	skin_folder = "/";
}

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

/* The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config.ini file. This also means that x should be after y */

#region /* Allow abilities */
allow_crawl = scr_initialize_custom_character_abilities(player - 1, "allow_crawl", true);
allow_crouch = scr_initialize_custom_character_abilities(player - 1, "allow_crouch", true);
allow_dive = scr_initialize_custom_character_abilities(player - 1, "allow_dive", true);
allow_dive_ground_boost = scr_initialize_custom_character_abilities(player - 1, "allow_dive_ground_boost", true);
allow_drowning = scr_initialize_custom_character_abilities(player - 1, "allow_drowning", true);
allow_ground_pound = scr_initialize_custom_character_abilities(player - 1, "allow_ground_pound", true);
allow_ground_pound_jump = scr_initialize_custom_character_abilities(player - 1, "allow_ground_pound_jump", true);
allow_homing_attack = scr_initialize_custom_character_abilities(player - 1, "allow_homing_attack", false);
allow_ledge_grab = scr_initialize_custom_character_abilities(player - 1, "allow_ledge_grab", false);
allow_overflow_hp = scr_initialize_custom_character_abilities(player - 1, "allow_overflow_hp", true);
allow_roll = scr_initialize_custom_character_abilities(player - 1, "allow_roll", false);
allow_run = scr_initialize_custom_character_abilities(player - 1, "allow_run", true);
allow_stop_after_landing_triple_jump = scr_initialize_custom_character_abilities(player - 1, "allow_stop_after_landing_triple_jump", false);
allow_survive_lava = scr_initialize_custom_character_abilities(player - 1, "allow_survive_lava", false);
allow_tongue = scr_initialize_custom_character_abilities(player - 1, "allow_tongue", false);
allow_wall_climb = scr_initialize_custom_character_abilities(player - 1, "allow_wall_climb", true);
allow_wall_jump = scr_initialize_custom_character_abilities(player - 1, "allow_wall_jump", true);
allow_glide = scr_initialize_custom_character_abilities(player - 1, "allow_glide", false);
#endregion /* Allow abilities END */

#region /* Play as Custom character */

#region /* Origin points */
if (file_exists(string(character_folder) + "/data/sprite_origin_point.ini"))
{
	ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
}

#region /* x and y origin points */
if (ini_key_exists("sprite origin points", "climb_under_y_offset"))
{
	climb_under_y_offset = ini_read_real("sprite origin points", "climb_under_y_offset", 10);
}
else
{
	if (can_save_to_character_config)
	&& (ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1]) != undefined)
	{
		ini_write_real("sprite origin points", "climb_under_y_offset", 10);
	}
	climb_under_y_offset = 10;
}
#endregion /* x and y origin points END */

ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
#endregion /* Origin points END */

#region /* Sprite variables */
sprite_against_wall = scr_initialize_custom_character_sprite("against_wall", sprite_against_wall);
sprite_against_wall = scr_initialize_custom_character_sprite("againstwall", sprite_against_wall);
sprite_against_wall_start = scr_initialize_custom_character_sprite("against_wall_start", sprite_against_wall_start);
sprite_against_wall_start = scr_initialize_custom_character_sprite("againstwall_start", sprite_against_wall_start);
sprite_burnt = scr_initialize_custom_character_sprite("burnt", sprite_burnt);
sprite_checkpoint_activated = scr_initialize_custom_character_sprite("checkpoint_activated", sprite_checkpoint_activated);
sprite_climb_under = scr_initialize_custom_character_sprite("climb_under", sprite_climb_under);
sprite_climb_under = scr_initialize_custom_character_sprite("climbunder", sprite_climb_under);
sprite_climb_under_look_up = scr_initialize_custom_character_sprite("climb_under_look_up", sprite_climb_under_look_up);
sprite_climb_under_look_up = scr_initialize_custom_character_sprite("climbunder_lookup", sprite_climb_under_look_up);
sprite_climb_under_spin = scr_initialize_custom_character_sprite("climb_under_spin", sprite_climb_under_spin);
sprite_climb_under_spin = scr_initialize_custom_character_sprite("climbunder_spin", sprite_climb_under_spin);
sprite_climb_under_spin_fast = scr_initialize_custom_character_sprite("climb_under_spin_fast", sprite_climb_under_spin_fast);
sprite_climb_under_spin_fast = scr_initialize_custom_character_sprite("climbunder_spin_fast", sprite_climb_under_spin_fast);
sprite_climb_under_still = scr_initialize_custom_character_sprite("climb_under_still", sprite_climb_under_still);
sprite_climb_under_still = scr_initialize_custom_character_sprite("climbunder_still", sprite_climb_under_still);
sprite_crouch = scr_initialize_custom_character_sprite("crouch", sprite_crouch);
sprite_crouch = scr_initialize_custom_character_sprite("squat", sprite_crouch);
sprite_crouch_crawl = scr_initialize_custom_character_sprite("crawl", sprite_crouch_crawl);
sprite_crouch_crawl = scr_initialize_custom_character_sprite("crouch_crawl", sprite_crouch_crawl);
sprite_crouch_crawl = scr_initialize_custom_character_sprite("squat_crawl", sprite_crouch_crawl);
sprite_crouch_fall = scr_initialize_custom_character_sprite("crouch_fall", sprite_crouch_fall);
sprite_crouch_fall = scr_initialize_custom_character_sprite("squat_fall", sprite_crouch_fall);
sprite_crouch_jump = scr_initialize_custom_character_sprite("crouch_jump", sprite_crouch_jump);
sprite_crouch_jump = scr_initialize_custom_character_sprite("squat_jump", sprite_crouch_jump);
sprite_die = scr_initialize_custom_character_sprite("die", sprite_die);
sprite_dive = scr_initialize_custom_character_sprite("dive", sprite_dive);
sprite_double_jump = scr_initialize_custom_character_sprite("double_jump", sprite_double_jump);
sprite_double_jump = scr_initialize_custom_character_sprite("doublejump", sprite_double_jump);
sprite_fall = scr_initialize_custom_character_sprite("fall", sprite_fall);
sprite_fall_slower = scr_initialize_custom_character_sprite("fall_slow", sprite_fall_slower);
sprite_fall_slower = scr_initialize_custom_character_sprite("fall_slower", sprite_fall_slower);
sprite_fall_slower = scr_initialize_custom_character_sprite("fallslow", sprite_fall_slower);
sprite_fall_slower = scr_initialize_custom_character_sprite("fallslower", sprite_fall_slower);
sprite_game_over_character_portrait = scr_initialize_custom_character_sprite("game_over_character_portrait", sprite_game_over_character_portrait);
sprite_ground_pound = scr_initialize_custom_character_sprite("ground_pound", sprite_ground_pound);
sprite_ground_pound = scr_initialize_custom_character_sprite("groundpound", sprite_ground_pound);
sprite_ground_pound_get_up = scr_initialize_custom_character_sprite("ground_pound_get_up", sprite_ground_pound_get_up);
sprite_ground_pound_get_up = scr_initialize_custom_character_sprite("groundpound_getup", sprite_ground_pound_get_up);
sprite_jump = scr_initialize_custom_character_sprite("jump", sprite_jump);
sprite_jump_transition_to_fall = scr_initialize_custom_character_sprite("jump_transition_to_fall", sprite_jump_transition_to_fall);
sprite_crouch_jump_transition_to_fall = scr_initialize_custom_character_sprite("crouch_jump_transition_to_fall", sprite_crouch_jump_transition_to_fall);
sprite_ledge_grab = scr_initialize_custom_character_sprite("ledge_grab", sprite_ledge_grab);
sprite_look_up = scr_initialize_custom_character_sprite("look_up", sprite_look_up);
sprite_look_up = scr_initialize_custom_character_sprite("lookup", sprite_look_up);
sprite_look_up_start = scr_initialize_custom_character_sprite("look_up_start", sprite_look_up_start);
sprite_mask = scr_initialize_custom_character_sprite("mask", sprite_mask); /* Standing Mask */
sprite_mask_crouch = scr_initialize_custom_character_sprite("mask_crouch", sprite_mask_crouch); /* Crouching Mask */
sprite_panting = scr_initialize_custom_character_sprite("panting", sprite_panting);
sprite_run2 = scr_initialize_custom_character_sprite("dash2", sprite_run2);
sprite_run2 = scr_initialize_custom_character_sprite("run2", sprite_run2);
sprite_run3 = scr_initialize_custom_character_sprite("dash3", sprite_run3);
sprite_run3 = scr_initialize_custom_character_sprite("run3", sprite_run3);
sprite_run4 = scr_initialize_custom_character_sprite("dash4", sprite_run4);
sprite_run4 = scr_initialize_custom_character_sprite("run4", sprite_run4);
sprite_run = scr_initialize_custom_character_sprite("dash", sprite_run);
sprite_run = scr_initialize_custom_character_sprite("run", sprite_run);
sprite_sitting_down_to_eat = scr_initialize_custom_character_sprite("sitting_down_to_eat", sprite_sitting_down_to_eat); /* Cutscene Specific Sprite */
sprite_sitting_eat_closed_mouth = scr_initialize_custom_character_sprite("sitting_eat_closed_mouth", sprite_sitting_eat_closed_mouth); /* Cutscene Specific Sprite */
sprite_sitting_eat_open_mouth = scr_initialize_custom_character_sprite("sitting_eat_open_mouth", sprite_sitting_eat_open_mouth); /* Cutscene Specific Sprite */
sprite_sitting_eat_open_mouth_open_eye = scr_initialize_custom_character_sprite("sitting_eat_open_mouth_open_eye", sprite_sitting_eat_open_mouth_open_eye); /* Cutscene Specific Sprite */
sprite_sitting_eat_surprised = scr_initialize_custom_character_sprite("sitting_eat_surprised", sprite_sitting_eat_surprised); /* Cutscene Specific Sprite */
sprite_sitting_eating = scr_initialize_custom_character_sprite("sitting_eating", sprite_sitting_eating); /* Cutscene Specific Sprite */
sprite_skidding = scr_initialize_custom_character_sprite("skidding", sprite_skidding);
sprite_skidding = scr_initialize_custom_character_sprite("slip", sprite_skidding);
sprite_skidding_ice = scr_initialize_custom_character_sprite("skidding_ice", sprite_skidding_ice);
sprite_spring_down = scr_initialize_custom_character_sprite("spring_down", sprite_spring_down);
sprite_spring_transition = scr_initialize_custom_character_sprite("spring_transition", sprite_spring_transition);
sprite_spring_up = scr_initialize_custom_character_sprite("spring_up", sprite_spring_up);
sprite_stand = scr_initialize_custom_character_sprite("idle", sprite_stand);
sprite_stand = scr_initialize_custom_character_sprite("stand", sprite_stand);
sprite_stand_blink = scr_initialize_custom_character_sprite("stand_blink", sprite_stand_blink);
sprite_idle_animation1 = scr_initialize_custom_character_sprite("idle_animation1", sprite_idle_animation1);
sprite_idle_animation2 = scr_initialize_custom_character_sprite("idle_animation2", sprite_idle_animation2);
sprite_idle_animation3 = scr_initialize_custom_character_sprite("idle_animation3", sprite_idle_animation3);
sprite_idle_animation4 = scr_initialize_custom_character_sprite("idle_animation4", sprite_idle_animation4);
sprite_idle_animation5 = scr_initialize_custom_character_sprite("idle_animation5", sprite_idle_animation5);
sprite_idle_animation6 = scr_initialize_custom_character_sprite("idle_animation6", sprite_idle_animation6);
sprite_idle_animation7 = scr_initialize_custom_character_sprite("idle_animation7", sprite_idle_animation7);
sprite_idle_animation8 = scr_initialize_custom_character_sprite("idle_animation8", sprite_idle_animation8);
sprite_idle_animation9 = scr_initialize_custom_character_sprite("idle_animation9", sprite_idle_animation9);
sprite_stand_cold = scr_initialize_custom_character_sprite("cold", sprite_stand_cold);
sprite_stand_cold = scr_initialize_custom_character_sprite("stand_cold", sprite_stand_cold);
sprite_standing_on_something = scr_initialize_custom_character_sprite("standing_on_something", sprite_standing_on_something);
sprite_standing_on_something = scr_initialize_custom_character_sprite("stand_on_bump", sprite_standing_on_something);
sprite_standing_with_item_in_front = scr_initialize_custom_character_sprite("standing_with_item_in_front", sprite_standing_with_item_in_front);
sprite_stomp_spin = scr_initialize_custom_character_sprite("stomp_spin", sprite_stomp_spin);
sprite_stomp_spin = scr_initialize_custom_character_sprite("stompspin", sprite_stomp_spin);
sprite_stomp_spin = scr_initialize_custom_character_sprite("spin", sprite_stomp_spin);
sprite_swim = scr_initialize_custom_character_sprite("swim", sprite_swim);
sprite_swim_fall = scr_initialize_custom_character_sprite("swim_fall", sprite_swim_fall);
sprite_swim_fall = scr_initialize_custom_character_sprite("swim_falling", sprite_swim_fall);
sprite_swim_stand = scr_initialize_custom_character_sprite("swim_stand", sprite_swim_stand);
sprite_tongue_swing = scr_initialize_custom_character_sprite("tongue_swing", sprite_tongue_swing);
sprite_tongue_swing_still = scr_initialize_custom_character_sprite("tongue_swing_still", sprite_tongue_swing_still);
sprite_triple_jump = scr_initialize_custom_character_sprite("triple_jump", sprite_triple_jump);
sprite_triple_jump = scr_initialize_custom_character_sprite("triplejump", sprite_triple_jump);
sprite_vine_climb = scr_initialize_custom_character_sprite("vine_climb", sprite_vine_climb);
sprite_vine_stay = scr_initialize_custom_character_sprite("vine_stay", sprite_vine_stay);
sprite_walk = scr_initialize_custom_character_sprite("walk", sprite_walk);
sprite_walking_with_item_in_front = scr_initialize_custom_character_sprite("walking_with_item_in_front", sprite_walking_with_item_in_front);
sprite_wall_slide = scr_initialize_custom_character_sprite("wall_slide", sprite_wall_slide);
sprite_wall_slide = scr_initialize_custom_character_sprite("wallslide", sprite_wall_slide);
sprite_wall_slide_down = scr_initialize_custom_character_sprite("wall_slide_down", sprite_wall_slide_down);
sprite_wall_slide_down = scr_initialize_custom_character_sprite("wallslide_down", sprite_wall_slide_down);
sprite_wall_slide_up = scr_initialize_custom_character_sprite("wall_slide_up", sprite_wall_slide_up);
sprite_wall_slide_up = scr_initialize_custom_character_sprite("wallslide_up", sprite_wall_slide_up);
sprite_glide_down = scr_initialize_custom_character_sprite("glide_down", sprite_glide_down);
#endregion /* Sprite variables END */

#region /* Voices */

#region /* Define a function to reduce code duplication */
function getVoice(sound_names)
{
	var character_name = string(global.all_loaded_characters[| global.character_index[player - 1]]);
	var sound_dir = "sound/voicepack" + string(selected_voice_pack);
	var custom_sound_dir = working_directory + "custom_characters/" + character_name + "/" + sound_dir;
	
	var voice = noone;
	for(var i = 0, len = array_length(sound_names); i < len && voice == noone; i++)
	{
		var file_path = "characters/" + character_name + "/" + sound_dir + "/" + sound_names[i];
		if (file_exists(file_path))
		{
			voice = audio_create_stream(file_path);
		}
		else if (file_exists(custom_sound_dir + "/" + sound_names[i]))
		{
			voice = audio_create_stream(custom_sound_dir + "/" + sound_names[i]);
		}
	}
	
	return voice;
}
#endregion /* Define a function to reduce code duplication END */

#region /* Get voices for wall jumps 1 through 20 */
voice_wall_jump_1 = getVoice(["wall_jump.ogg", "wall_jump_1.ogg", "wall_jump1.ogg", "walljump.ogg", "walljump_1.ogg", "walljump1.ogg", "wall_kick.ogg", "wall_kick_1.ogg", "wall_kick1.ogg", "wallkick.ogg", "wallkick_1.ogg"]);
voice_wall_jump_2 = getVoice(["wall_jump_2.ogg", "wall_jump2.ogg", "walljump_2.ogg", "walljump2.ogg", "wall_kick_2.ogg", "wall_kick2.ogg", "wallkick_2.ogg"]);
voice_wall_jump_3 = getVoice(["wall_jump_3.ogg", "wall_jump3.ogg", "walljump_3.ogg", "walljump3.ogg", "wall_kick_3.ogg", "wall_kick3.ogg", "wallkick_3.ogg"]);
voice_wall_jump_4 = getVoice(["wall_jump_4.ogg", "wall_jump4.ogg", "walljump_4.ogg", "walljump4.ogg", "wall_kick_4.ogg", "wall_kick4.ogg", "wallkick_4.ogg"]);
voice_wall_jump_5 = getVoice(["wall_jump_5.ogg", "wall_jump5.ogg", "walljump_5.ogg", "walljump5.ogg", "wall_kick_5.ogg", "wall_kick5.ogg", "wallkick_5.ogg"]);
voice_wall_jump_6 = getVoice(["wall_jump_6.ogg", "wall_jump6.ogg", "walljump_6.ogg", "walljump6.ogg", "wall_kick_6.ogg", "wall_kick6.ogg", "wallkick_6.ogg"]);
voice_wall_jump_7 = getVoice(["wall_jump_7.ogg", "wall_jump7.ogg", "walljump_7.ogg", "walljump7.ogg", "wall_kick_7.ogg", "wall_kick7.ogg", "wallkick_7.ogg"]);
voice_wall_jump_8 = getVoice(["wall_jump_8.ogg", "wall_jump8.ogg", "walljump_8.ogg", "walljump8.ogg", "wall_kick_8.ogg", "wall_kick8.ogg", "wallkick_8.ogg"]);
voice_wall_jump_9 = getVoice(["wall_jump_9.ogg", "wall_jump9.ogg", "walljump_9.ogg", "walljump9.ogg", "wall_kick_9.ogg", "wall_kick9.ogg", "wallkick_9.ogg"]);
voice_wall_jump_10 = getVoice(["wall_jump_10.ogg", "wall_jump10.ogg", "walljump_10.ogg", "walljump10.ogg", "wall_kick_10.ogg", "wall_kick10.ogg", "wallkick_10.ogg"]);
voice_wall_jump_11 = getVoice(["wall_jump_11.ogg", "wall_jump11.ogg", "walljump_11.ogg", "walljump11.ogg", "wall_kick_11.ogg", "wall_kick11.ogg", "wallkick_11.ogg"]);
voice_wall_jump_12 = getVoice(["wall_jump_12.ogg", "wall_jump12.ogg", "walljump_12.ogg", "walljump12.ogg", "wall_kick_12.ogg", "wall_kick12.ogg", "wallkick_12.ogg"]);
voice_wall_jump_13 = getVoice(["wall_jump_13.ogg", "wall_jump13.ogg", "walljump_13.ogg", "walljump13.ogg", "wall_kick_13.ogg", "wall_kick13.ogg", "wallkick_13.ogg"]);
voice_wall_jump_14 = getVoice(["wall_jump_14.ogg", "wall_jump14.ogg", "walljump_14.ogg", "walljump14.ogg", "wall_kick_14.ogg", "wall_kick14.ogg", "wallkick_14.ogg"]);
voice_wall_jump_15 = getVoice(["wall_jump_15.ogg", "wall_jump15.ogg", "walljump_15.ogg", "walljump15.ogg", "wall_kick_15.ogg", "wall_kick15.ogg", "wallkick_15.ogg"]);
voice_wall_jump_16 = getVoice(["wall_jump_16.ogg", "wall_jump16.ogg", "walljump_16.ogg", "walljump16.ogg", "wall_kick_16.ogg", "wall_kick16.ogg", "wallkick_16.ogg"]);
voice_wall_jump_17 = getVoice(["wall_jump_17.ogg", "wall_jump17.ogg", "walljump_17.ogg", "walljump17.ogg", "wall_kick_17.ogg", "wall_kick17.ogg", "wallkick_17.ogg"]);
voice_wall_jump_18 = getVoice(["wall_jump_18.ogg", "wall_jump18.ogg", "walljump_18.ogg", "walljump18.ogg", "wall_kick_18.ogg", "wall_kick18.ogg", "wallkick_18.ogg"]);
voice_wall_jump_19 = getVoice(["wall_jump_19.ogg", "wall_jump19.ogg", "walljump_19.ogg", "walljump19.ogg", "wall_kick_19.ogg", "wall_kick19.ogg", "wallkick_19.ogg"]);
voice_wall_jump_20 = getVoice(["wall_jump_20.ogg", "wall_jump20.ogg", "walljump_20.ogg", "walljump20.ogg", "wall_kick_20.ogg", "wall_kick20.ogg", "wallkick_20.ogg"]);
#endregion /* Get voices for wall jumps 1 through 20 END */

#region /* Get voices for start running 1 through 10 */
voice_start_running_1 = getVoice(["start_running.ogg", "start_running_1.ogg", "start_running1.ogg"]);
voice_start_running_2 = getVoice(["start_running_2.ogg", "start_running2.ogg"]);
voice_start_running_3 = getVoice(["start_running_3.ogg", "start_running3.ogg"]);
voice_start_running_4 = getVoice(["start_running_4.ogg", "start_running4.ogg"]);
voice_start_running_5 = getVoice(["start_running_5.ogg", "start_running5.ogg"]);
voice_start_running_6 = getVoice(["start_running_6.ogg", "start_running6.ogg"]);
voice_start_running_7 = getVoice(["start_running_7.ogg", "start_running7.ogg"]);
voice_start_running_8 = getVoice(["start_running_8.ogg", "start_running8.ogg"]);
voice_start_running_9 = getVoice(["start_running_9.ogg", "start_running9.ogg"]);
voice_start_running_10 = getVoice(["start_running_10.ogg", "start_running10.ogg"]);
#endregion /* Get voices for start running 1 through 10 END */

#region /* Get voices for rope catch 1 through 10 */
voice_rope_catch_1 = getVoice(["rope_catch.ogg", "rope_catch_1.ogg", "rope_catch1.ogg"]);
voice_rope_catch_2 = getVoice(["rope_catch_2.ogg", "rope_catch2.ogg"]);
voice_rope_catch_3 = getVoice(["rope_catch_3.ogg", "rope_catch3.ogg"]);
voice_rope_catch_4 = getVoice(["rope_catch_4.ogg", "rope_catch4.ogg"]);
voice_rope_catch_5 = getVoice(["rope_catch_5.ogg", "rope_catch5.ogg"]);
voice_rope_catch_6 = getVoice(["rope_catch_6.ogg", "rope_catch6.ogg"]);
voice_rope_catch_7 = getVoice(["rope_catch_7.ogg", "rope_catch7.ogg"]);
voice_rope_catch_8 = getVoice(["rope_catch_8.ogg", "rope_catch8.ogg"]);
voice_rope_catch_9 = getVoice(["rope_catch_9.ogg", "rope_catch9.ogg"]);
voice_rope_catch_10 = getVoice(["rope_catch_10.ogg", "rope_catch10.ogg"]);
#endregion /* Get voices for rope catch 1 through 10 END */

#region /* Get voices for jump spring 1 through 10 */
voice_jump_spring_1 = getVoice(["jump_spring.ogg", "jump_spring_1.ogg", "jump_spring1.ogg", "jump_off_something.ogg", "jump_off_something_1.ogg", "jump_off_something1.ogg"]);
voice_jump_spring_2 = getVoice(["jump_spring_2.ogg", "jump_spring2.ogg", "jump_off_something_2.ogg", "jump_off_something2.ogg"]);
voice_jump_spring_3 = getVoice(["jump_spring_3.ogg", "jump_spring3.ogg", "jump_off_something_3.ogg", "jump_off_something3.ogg"]);
voice_jump_spring_4 = getVoice(["jump_spring_4.ogg", "jump_spring4.ogg", "jump_off_something_4.ogg", "jump_off_something4.ogg"]);
voice_jump_spring_5 = getVoice(["jump_spring_5.ogg", "jump_spring5.ogg", "jump_off_something_5.ogg", "jump_off_something5.ogg"]);
voice_jump_spring_6 = getVoice(["jump_spring_6.ogg", "jump_spring6.ogg", "jump_off_something_6.ogg", "jump_off_something6.ogg"]);
voice_jump_spring_7 = getVoice(["jump_spring_7.ogg", "jump_spring7.ogg", "jump_off_something_7.ogg", "jump_off_something7.ogg"]);
voice_jump_spring_8 = getVoice(["jump_spring_8.ogg", "jump_spring8.ogg", "jump_off_something_8.ogg", "jump_off_something8.ogg"]);
voice_jump_spring_9 = getVoice(["jump_spring_9.ogg", "jump_spring9.ogg", "jump_off_something_9.ogg", "jump_off_something9.ogg"]);
voice_jump_spring_10 = getVoice(["jump_spring_10.ogg", "jump_spring10.ogg", "jump_off_something_10.ogg", "jump_off_something10.ogg"]);
#endregion /* Get voices for jump spring 1 through 10 END */

#region /* Get voices for jump rope 1 through 10 */
voice_jump_rope_1 = getVoice(["jump_rope.ogg", "jump_rope_1.ogg", "jump_rope1.ogg", "jump_off_something.ogg", "jump_off_something_1.ogg", "jump_off_something1.ogg"]);
voice_jump_rope_2 = getVoice(["jump_rope_2.ogg", "jump_rope2.ogg", "jump_off_something_2.ogg", "jump_off_something2.ogg"]);
voice_jump_rope_3 = getVoice(["jump_rope_3.ogg", "jump_rope3.ogg", "jump_off_something_3.ogg", "jump_off_something3.ogg"]);
voice_jump_rope_4 = getVoice(["jump_rope_4.ogg", "jump_rope4.ogg", "jump_off_something_4.ogg", "jump_off_something4.ogg"]);
voice_jump_rope_5 = getVoice(["jump_rope_5.ogg", "jump_rope5.ogg", "jump_off_something_5.ogg", "jump_off_something5.ogg"]);
voice_jump_rope_6 = getVoice(["jump_rope_6.ogg", "jump_rope6.ogg", "jump_off_something_6.ogg", "jump_off_something6.ogg"]);
voice_jump_rope_7 = getVoice(["jump_rope_7.ogg", "jump_rope7.ogg", "jump_off_something_7.ogg", "jump_off_something7.ogg"]);
voice_jump_rope_8 = getVoice(["jump_rope_8.ogg", "jump_rope8.ogg", "jump_off_something_8.ogg", "jump_off_something8.ogg"]);
voice_jump_rope_9 = getVoice(["jump_rope_9.ogg", "jump_rope9.ogg", "jump_off_something_9.ogg", "jump_off_something9.ogg"]);
voice_jump_rope_10 = getVoice(["jump_rope_10.ogg", "jump_rope10.ogg", "jump_off_something_10.ogg", "jump_off_something10.ogg"]);
#endregion /* Get voices for jump rope 1 through 10 END */

#region /* Get voices for jump 1 through 10 */
voice_jump_1 = getVoice(["jump.ogg", "jump_1.ogg", "jump1.ogg"]);
voice_jump_2 = getVoice(["jump_2.ogg", "jump2.ogg"]);
voice_jump_3 = getVoice(["jump_3.ogg", "jump3.ogg"]);
voice_jump_4 = getVoice(["jump_4.ogg", "jump4.ogg"]);
voice_jump_5 = getVoice(["jump_5.ogg", "jump5.ogg"]);
voice_jump_6 = getVoice(["jump_6.ogg", "jump6.ogg"]);
voice_jump_7 = getVoice(["jump_7.ogg", "jump7.ogg"]);
voice_jump_8 = getVoice(["jump_8.ogg", "jump8.ogg"]);
voice_jump_9 = getVoice(["jump_9.ogg", "jump9.ogg"]);
voice_jump_10 = getVoice(["jump_10.ogg", "jump10.ogg"]);
#endregion /* Get voices for jump 1 through 10 END */

#region /* Get voices for jump 2nd 1 through 10 */
voice_jump_2nd_1 = getVoice(["jump_2nd.ogg", "jump_2nd_1.ogg", "jump_2nd1.ogg", "jump2nd.ogg", "jump2nd_1.ogg", "jump2nd1.ogg"]);
voice_jump_2nd_2 = getVoice(["jump_2nd_2.ogg", "jump_2nd2.ogg", "jump2nd_2.ogg", "jump2nd2.ogg"]);
voice_jump_2nd_3 = getVoice(["jump_2nd_3.ogg", "jump_2nd3.ogg", "jump2nd_3.ogg", "jump2nd3.ogg"]);
voice_jump_2nd_4 = getVoice(["jump_2nd_4.ogg", "jump_2nd4.ogg", "jump2nd_4.ogg", "jump2nd4.ogg"]);
voice_jump_2nd_5 = getVoice(["jump_2nd_5.ogg", "jump_2nd5.ogg", "jump2nd_5.ogg", "jump2nd5.ogg"]);
voice_jump_2nd_6 = getVoice(["jump_2nd_6.ogg", "jump_2nd6.ogg", "jump2nd_6.ogg", "jump2nd6.ogg"]);
voice_jump_2nd_7 = getVoice(["jump_2nd_7.ogg", "jump_2nd7.ogg", "jump2nd_7.ogg", "jump2nd7.ogg"]);
voice_jump_2nd_8 = getVoice(["jump_2nd_8.ogg", "jump_2nd8.ogg", "jump2nd_8.ogg", "jump2nd8.ogg"]);
voice_jump_2nd_9 = getVoice(["jump_2nd_9.ogg", "jump_2nd9.ogg", "jump2nd_9.ogg", "jump2nd9.ogg"]);
voice_jump_2nd_10 = getVoice(["jump_2nd_10.ogg", "jump_2nd10.ogg", "jump2nd_10.ogg", "jump2nd10.ogg"]);
#endregion /* Get voices for jump 2nd 1 through 10 END */

#region /* Get voices for jump 3rd 1 through 10 */
voice_jump_3rd_1 = getVoice(["jump_3rd.ogg", "jump_3rd_1.ogg", "jump_3rd1.ogg", "jump3rd.ogg", "jump3rd_1.ogg", "jump3rd1.ogg"]);
voice_jump_3rd_2 = getVoice(["jump_3rd_2.ogg", "jump_3rd2.ogg", "jump3rd_2.ogg", "jump3rd2.ogg"]);
voice_jump_3rd_3 = getVoice(["jump_3rd_3.ogg", "jump_3rd3.ogg", "jump3rd_3.ogg", "jump3rd3.ogg"]);
voice_jump_3rd_4 = getVoice(["jump_3rd_4.ogg", "jump_3rd4.ogg", "jump3rd_4.ogg", "jump3rd4.ogg"]);
voice_jump_3rd_5 = getVoice(["jump_3rd_5.ogg", "jump_3rd5.ogg", "jump3rd_5.ogg", "jump3rd5.ogg"]);
voice_jump_3rd_6 = getVoice(["jump_3rd_6.ogg", "jump_3rd6.ogg", "jump3rd_6.ogg", "jump3rd6.ogg"]);
voice_jump_3rd_7 = getVoice(["jump_3rd_7.ogg", "jump_3rd7.ogg", "jump3rd_7.ogg", "jump3rd7.ogg"]);
voice_jump_3rd_8 = getVoice(["jump_3rd_8.ogg", "jump_3rd8.ogg", "jump3rd_8.ogg", "jump3rd8.ogg"]);
voice_jump_3rd_9 = getVoice(["jump_3rd_9.ogg", "jump_3rd9.ogg", "jump3rd_9.ogg", "jump3rd9.ogg"]);
voice_jump_3rd_10 = getVoice(["jump_3rd_10.ogg", "jump_3rd10.ogg", "jump3rd_10.ogg", "jump3rd10.ogg"]);
#endregion /* Get voices for jump 3rd 1 through 10 END */

#region /* Get voices for get incincibility 1 through 10 */
voice_get_invincibility_1 = getVoice(["get_invincibility.ogg", "get_invincibility_1.ogg", "get_invincibility1.ogg", "get_star.ogg", "get_star_1.ogg", "get_star1.ogg"]);
voice_get_invincibility_2 = getVoice(["get_invincibility_2.ogg", "get_invincibility2.ogg", "get_star_2.ogg", "get_star2.ogg"]);
voice_get_invincibility_3 = getVoice(["get_invincibility_3.ogg", "get_invincibility3.ogg", "get_star_3.ogg", "get_star3.ogg"]);
voice_get_invincibility_4 = getVoice(["get_invincibility_4.ogg", "get_invincibility4.ogg", "get_star_4.ogg", "get_star4.ogg"]);
voice_get_invincibility_5 = getVoice(["get_invincibility_5.ogg", "get_invincibility5.ogg", "get_star_5.ogg", "get_star5.ogg"]);
voice_get_invincibility_6 = getVoice(["get_invincibility_6.ogg", "get_invincibility6.ogg", "get_star_6.ogg", "get_star6.ogg"]);
voice_get_invincibility_7 = getVoice(["get_invincibility_7.ogg", "get_invincibility7.ogg", "get_star_7.ogg", "get_star7.ogg"]);
voice_get_invincibility_8 = getVoice(["get_invincibility_8.ogg", "get_invincibility8.ogg", "get_star_8.ogg", "get_star8.ogg"]);
voice_get_invincibility_9 = getVoice(["get_invincibility_9.ogg", "get_invincibility9.ogg", "get_star_9.ogg", "get_star9.ogg"]);
voice_get_invincibility_10 = getVoice(["get_invincibility_10.ogg", "get_invincibility10.ogg", "get_star_10.ogg", "get_star10.ogg"]);
#endregion /* Get voices for get invincibility 1 through 10 END */

#region /* Get voices for enter goal 1 through 10 */
voice_enter_goal_1 = getVoice(["enter_goal.ogg", "enter_goal_1.ogg", "enter_goal1.ogg"]);
voice_enter_goal_2 = getVoice(["enter_goal_2.ogg", "enter_goal2.ogg"]);
voice_enter_goal_3 = getVoice(["enter_goal_3.ogg", "enter_goal3.ogg"]);
voice_enter_goal_4 = getVoice(["enter_goal_4.ogg", "enter_goal4.ogg"]);
voice_enter_goal_5 = getVoice(["enter_goal_5.ogg", "enter_goal5.ogg"]);
voice_enter_goal_6 = getVoice(["enter_goal_6.ogg", "enter_goal6.ogg"]);
voice_enter_goal_7 = getVoice(["enter_goal_7.ogg", "enter_goal7.ogg"]);
voice_enter_goal_8 = getVoice(["enter_goal_8.ogg", "enter_goal8.ogg"]);
voice_enter_goal_9 = getVoice(["enter_goal_9.ogg", "enter_goal9.ogg"]);
voice_enter_goal_10 = getVoice(["enter_goal_10.ogg", "enter_goal10.ogg"]);
#endregion /* Get voices for enter goal 1 through 10 END */

#region /* Get voices for dive 1 through 20 */
voice_dive_1 = getVoice(["dive.ogg", "dive_1.ogg", "dive1.ogg"]);
voice_dive_2 = getVoice(["dive_2.ogg", "dive2.ogg"]);
voice_dive_3 = getVoice(["dive_3.ogg", "dive3.ogg"]);
voice_dive_4 = getVoice(["dive_4.ogg", "dive4.ogg"]);
voice_dive_5 = getVoice(["dive_5.ogg", "dive5.ogg"]);
voice_dive_6 = getVoice(["dive_6.ogg", "dive6.ogg"]);
voice_dive_7 = getVoice(["dive_7.ogg", "dive7.ogg"]);
voice_dive_8 = getVoice(["dive_8.ogg", "dive8.ogg"]);
voice_dive_9 = getVoice(["dive_9.ogg", "dive9.ogg"]);
voice_dive_10 = getVoice(["dive_10.ogg", "dive10.ogg"]);
voice_dive_11 = getVoice(["dive_11.ogg", "dive11.ogg"]);
voice_dive_12 = getVoice(["dive_12.ogg", "dive12.ogg"]);
voice_dive_13 = getVoice(["dive_13.ogg", "dive13.ogg"]);
voice_dive_14 = getVoice(["dive_14.ogg", "dive14.ogg"]);
voice_dive_15 = getVoice(["dive_15.ogg", "dive15.ogg"]);
voice_dive_16 = getVoice(["dive_16.ogg", "dive16.ogg"]);
voice_dive_17 = getVoice(["dive_17.ogg", "dive17.ogg"]);
voice_dive_18 = getVoice(["dive_18.ogg", "dive18.ogg"]);
voice_dive_19 = getVoice(["dive_19.ogg", "dive19.ogg"]);
voice_dive_20 = getVoice(["dive_20.ogg", "dive20.ogg"]);
#endregion /* Get voices for dive 1 through 20 END */

#region /* Get voices for damage 1 through 10 */
voice_damage_1 = getVoice(["damage.ogg", "damage_1.ogg", "damage1.ogg", "ow.ogg", "ow_1.ogg", "ow1.ogg"]);
voice_damage_2 = getVoice(["damage_2.ogg", "damage2.ogg", "ow_2.ogg", "ow2.ogg"]);
voice_damage_3 = getVoice(["damage_3.ogg", "damage3.ogg", "ow_3.ogg", "ow3.ogg"]);
voice_damage_4 = getVoice(["damage_4.ogg", "damage4.ogg", "ow_4.ogg", "ow4.ogg"]);
voice_damage_5 = getVoice(["damage_5.ogg", "damage5.ogg", "ow_5.ogg", "ow5.ogg"]);
voice_damage_6 = getVoice(["damage_6.ogg", "damage6.ogg", "ow_6.ogg", "ow6.ogg"]);
voice_damage_7 = getVoice(["damage_7.ogg", "damage7.ogg", "ow_7.ogg", "ow7.ogg"]);
voice_damage_8 = getVoice(["damage_8.ogg", "damage8.ogg", "ow_8.ogg", "ow8.ogg"]);
voice_damage_9 = getVoice(["damage_9.ogg", "damage9.ogg", "ow_9.ogg", "ow9.ogg"]);
voice_damage_10 = getVoice(["damage_10.ogg", "damage10.ogg", "ow_10.ogg", "ow10.ogg"]);
#endregion /* Get voices for damage 1 through 10 END */

#region /* Get voices for burned running 1 through 10 */
voice_burned_running_1 = getVoice(["burned_running.ogg", "burned_running_1.ogg", "burned_running1.ogg"]);
voice_burned_running_2 = getVoice(["burned_running_2.ogg", "burned_running2.ogg"]);
voice_burned_running_3 = getVoice(["burned_running_3.ogg", "burned_running3.ogg"]);
voice_burned_running_4 = getVoice(["burned_running_4.ogg", "burned_running4.ogg"]);
voice_burned_running_5 = getVoice(["burned_running_5.ogg", "burned_running5.ogg"]);
voice_burned_running_6 = getVoice(["burned_running_6.ogg", "burned_running6.ogg"]);
voice_burned_running_7 = getVoice(["burned_running_7.ogg", "burned_running7.ogg"]);
voice_burned_running_8 = getVoice(["burned_running_8.ogg", "burned_running8.ogg"]);
voice_burned_running_9 = getVoice(["burned_running_9.ogg", "burned_running9.ogg"]);
voice_burned_running_10 = getVoice(["burned_running_10.ogg", "burned_running10.ogg"]);
#endregion /* Get voices for burned running 1 through 10 END */

#region /* Get voices for burned 1 through 10 */
voice_burned_1 = getVoice(["burned.ogg", "burned_1.ogg", "burned1.ogg"]);
voice_burned_2 = getVoice(["burned_2.ogg", "burned2.ogg"]);
voice_burned_3 = getVoice(["burned_3.ogg", "burned3.ogg"]);
voice_burned_4 = getVoice(["burned_4.ogg", "burned4.ogg"]);
voice_burned_5 = getVoice(["burned_5.ogg", "burned5.ogg"]);
voice_burned_6 = getVoice(["burned_6.ogg", "burned6.ogg"]);
voice_burned_7 = getVoice(["burned_7.ogg", "burned7.ogg"]);
voice_burned_8 = getVoice(["burned_8.ogg", "burned8.ogg"]);
voice_burned_9 = getVoice(["burned_9.ogg", "burned9.ogg"]);
voice_burned_10 = getVoice(["burned_10.ogg", "burned10.ogg"]);
#endregion /* Get voices for burned 1 through 10 END */

#region /* Get voices for burned die 1 through 10 */
voice_burned_die_1 = getVoice(["burned_die.ogg", "burned_die_1.ogg", "burned_die1.ogg"]);
voice_burned_die_2 = getVoice(["burned_die_2.ogg", "burned_die2.ogg"]);
voice_burned_die_3 = getVoice(["burned_die_3.ogg", "burned_die3.ogg"]);
voice_burned_die_4 = getVoice(["burned_die_4.ogg", "burned_die4.ogg"]);
voice_burned_die_5 = getVoice(["burned_die_5.ogg", "burned_die5.ogg"]);
voice_burned_die_6 = getVoice(["burned_die_6.ogg", "burned_die6.ogg"]);
voice_burned_die_7 = getVoice(["burned_die_7.ogg", "burned_die7.ogg"]);
voice_burned_die_8 = getVoice(["burned_die_8.ogg", "burned_die8.ogg"]);
voice_burned_die_9 = getVoice(["burned_die_9.ogg", "burned_die9.ogg"]);
voice_burned_die_10 = getVoice(["burned_die_10.ogg", "burned_die10.ogg"]);
#endregion /* Get voices for burned die 1 through 10 END */

voice_open_mouth = getVoice("open_mouth.ogg");
voice_notice = getVoice("notice.ogg");

#region /* Get voices for scream 1 through 10 */
voice_scream_1 = getVoice(["scream.ogg", "scream_1.ogg", "scream1.ogg"]);
voice_scream_2 = getVoice(["scream_2.ogg", "scream2.ogg"]);
voice_scream_3 = getVoice(["scream_3.ogg", "scream3.ogg"]);
voice_scream_4 = getVoice(["scream_4.ogg", "scream4.ogg"]);
voice_scream_5 = getVoice(["scream_5.ogg", "scream5.ogg"]);
voice_scream_6 = getVoice(["scream_6.ogg", "scream6.ogg"]);
voice_scream_7 = getVoice(["scream_7.ogg", "scream7.ogg"]);
voice_scream_8 = getVoice(["scream_8.ogg", "scream8.ogg"]);
voice_scream_9 = getVoice(["scream_9.ogg", "scream9.ogg"]);
voice_scream_10 = getVoice(["scream_10.ogg", "scream10.ogg"]);
#endregion /* Get voices for scream 1 through 10 END */

scr_player_move_choose_voice_clips(); /* Run this code in obj player alarm 0 event first, so every voice variable get assigned something at start */

#endregion /* Voices END */

#endregion /* Play as Custom character END */

#region /* Character Values Handeling */
/* Load the character config file */
var character = ds_list_find_value(global.all_loaded_characters, global.character_index[player - 1]);
var character_path = file_exists("characters/" + string(character) + "/data/character_config.ini") ?
"characters/" + string(character) + "/data/character_config.ini" :
working_directory + "custom_characters/" + string(character) + "/data/character_config.ini";
ini_open(character_path);

/* Default xscale and yscale for sprites */
default_xscale = ini_read_real("values", "default_xscale", 1);
default_yscale = ini_read_real("values", "default_yscale", 1);

/* Acceleration on ground */
acceleration_on_ground = ini_read_real("values", "acceleration_on_ground", 0.3) * 0.01;

/* Acceleration in air */
acceleration_in_air = ini_read_real("values", "acceleration_in_air", 0.3) * 0.01;

/* Acceleration on ice */
acceleration_on_ice = ini_read_real("values", "acceleration_on_ice", 0.05) * 0.01;

/* Can Attack After Dive On Ground Max Value */
can_attack_after_dive_on_ground_max_value = ini_read_real("values", "can_attack_after_dive_on_ground_max_value", 20);

/* Number of jumps */
number_of_jumps = ini_read_real("values", "number_of_jumps", 1);

/* Mid-air jumps left */
midair_jumps_left = ini_read_real("values", "midair_jumps_left", 1);

/* Mid-air Flip Animation counter */
midair_jump_flip_animation = ini_read_real("values", "midair_jump_flip_animation", 2);

/* Starting HP and Max HP */
var default_hp = 1;
max_hp = ini_read_real("values", "max_hp", default_hp);
hp = ini_read_real("values", "hp", default_hp);

if (global.assist_enable)
{
	max_hp += global.assist_extra_hp; /* Starting Max HP with assist extra hp */
	hp += global.assist_extra_hp; /* Starting HP with assist extra hp */
}

/* If the character config file doesn't exist, create it and write the default values */
if (can_save_to_character_config && character != undefined && !file_exists(character_path))
{
	ini_open(character_path);
	ini_write_real("values", "default_xscale", 1);
	ini_write_real("values", "default_yscale", 1);
	ini_write_real("values", "acceleration_on_ground", 30);
	ini_write_real("values", "acceleration_in_air", 30);
	ini_write_real("values", "acceleration_on_ice", 5);
	ini_write_real("values", "can_attack_after_dive_on_ground_max_value", 1);
	ini_write_real("values", "number_of_jumps", 1);
	ini_write_real("values", "midair_jumps_left", 1);
	ini_write_real("values", "midair_jump_flip_animation", 2);
	ini_write_real("values", "hp", default_hp);
	ini_write_real("values", "max_hp", default_hp);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}

/* Close the character config file */
ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
#endregion /* Character Values Handeling END */

#region /* Have Heart Balloon */
/* Check if the save file exists and read the value for the corresponding player */
if (global.character_select_in_this_menu == "main_game" && file_exists(working_directory + "save_file/file" + string(global.file) + ".ini"))
&& (!global.doing_clear_check_level)
&& (!global.doing_clear_check_character)
{
	ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
	have_heart_balloon = ini_read_real("Player", "player" + string(player) + "_have_heart_balloon", false);
	if (!ini_key_exists("Player", "player" + string(player) + "_have_heart_balloon"))
	{
		ini_write_real("Player", "player" + string(player) + "_have_heart_balloon", false);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
{
	have_heart_balloon = false;
}
#endregion /* Have Heart Balloon END */

custom_character = global.character_for_player[player];
selected_voice_pack = global.voicepack_for_player[player];
selected_skin = global.skin_for_player[player];

#endregion /* Initialize Custom Character END */