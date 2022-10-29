function scr_player_move_choose_voice_clips()
{
	
	#region /* Choose to play voice clips randomly */
	
	if (random(5) <= 2)
	{
		voice_wallkick = scr_choose_sound_variation(voice_wallkick, voice_wall_jump_1, voice_wall_jump_2, voice_wall_jump_3, voice_wall_jump_4, voice_wall_jump_5,
		voice_wall_jump_6, voice_wall_jump_7, voice_wall_jump_8, voice_wall_jump_9, voice_wall_jump_10,
		voice_wall_jump_11, voice_wall_jump_12, voice_wall_jump_13, voice_wall_jump_14, voice_wall_jump_15); /* Wall jump voice variation */
	}
	else
	{
		voice_wallkick = scr_choose_sound_variation(voice_wallkick, voice_wall_jump_16, voice_wall_jump_17, voice_wall_jump_18, voice_wall_jump_19, voice_wall_jump_20); /* Wall jump voice variation */
	}
	
	voice_startdash = scr_choose_sound_variation(voice_startdash, voice_start_running_1, voice_start_running_2, voice_start_running_3, voice_start_running_4, voice_start_running_5,
	voice_start_running_6, voice_start_running_7, voice_start_running_8, voice_start_running_9, voice_start_running_10); /* Start running voice variation */
	
	voice_rope_catch = scr_choose_sound_variation(voice_rope_catch, voice_rope_catch_1, voice_rope_catch_2, voice_rope_catch_3, voice_rope_catch_4, voice_rope_catch_5,
	voice_rope_catch_6, voice_rope_catch_7, voice_rope_catch_8, voice_rope_catch_9, voice_rope_catch_10); /* Rope catch voice variation */
	
	voice_jump_spring = scr_choose_sound_variation(voice_jump_spring, voice_jump_spring_1, voice_jump_spring_2, voice_jump_spring_3, voice_jump_spring_4, voice_jump_spring_5,
	voice_jump_spring_6, voice_jump_spring_7, voice_jump_spring_8, voice_jump_spring_9, voice_jump_spring_10); /* Jump spring voice variation */
	
	voice_jump_rope = scr_choose_sound_variation(voice_jump_rope, voice_jump_rope_1, voice_jump_rope_2, voice_jump_rope_3, voice_jump_rope_4, voice_jump_rope_5,
	voice_jump_rope_6, voice_jump_rope_7, voice_jump_rope_8, voice_jump_rope_9, voice_jump_rope_10); /* Jump rope voice variation */
	
	voice_jump = scr_choose_sound_variation(voice_jump, voice_jump_1, voice_jump_2, voice_jump_3, voice_jump_4, voice_jump_5,
	voice_jump_6, voice_jump_7, voice_jump_8, voice_jump_9, voice_jump_10); /* Jump voice variation */
	
	voice_jump2nd = scr_choose_sound_variation(voice_jump2nd, voice_jump_2nd_1, voice_jump_2nd_2, voice_jump_2nd_3, voice_jump_2nd_4, voice_jump_2nd_5,
	voice_jump_2nd_6, voice_jump_2nd_7, voice_jump_2nd_8, voice_jump_2nd_9, voice_jump_2nd_10); /* Jump 2nd voice variation */
	
	voice_jump3rd = scr_choose_sound_variation(voice_jump3rd, voice_jump_3rd_1, voice_jump_3rd_2, voice_jump_3rd_3, voice_jump_3rd_4, voice_jump_3rd_5,
	voice_jump_3rd_6, voice_jump_3rd_7, voice_jump_3rd_8, voice_jump_3rd_9, voice_jump_3rd_10); /* Jump 3rd voice variation */
	
	voice_get_star = scr_choose_sound_variation(voice_get_star, voice_get_invincibility_1, voice_get_invincibility_2, voice_get_invincibility_3, voice_get_invincibility_4, voice_get_invincibility_5,
	voice_get_invincibility_6, voice_get_invincibility_7, voice_get_invincibility_8, voice_get_invincibility_9, voice_get_invincibility_10); /* Get invincibility voice variation */
	
	voice_enter_goal = scr_choose_sound_variation(voice_enter_goal, voice_enter_goal_1, voice_enter_goal_2, voice_enter_goal_3, voice_enter_goal_4, voice_enter_goal_5,
	voice_enter_goal_6, voice_enter_goal_7, voice_enter_goal_8, voice_enter_goal_9, voice_enter_goal_10); /* Enter goal voice variation */
	
	if (random(5) <= 2)
	{
		voice_dive = scr_choose_sound_variation(voice_dive, voice_dive_1, voice_dive_2, voice_dive_3, voice_dive_4, voice_dive_5,
		voice_dive_6, voice_dive_7, voice_dive_8, voice_dive_9, voice_dive_10,
		voice_dive_11, voice_dive_12, voice_dive_13, voice_dive_14, voice_dive_15); /* Dive voice variation */
	}
	else
	{
		voice_wallkick = scr_choose_sound_variation(voice_dive, voice_dive_16, voice_dive_17, voice_dive_18, voice_dive_19, voice_dive_20); /* Dive voice variation */
	}
	
	voice_damage = scr_choose_sound_variation(voice_damage, voice_damage_1, voice_damage_2, voice_damage_3, voice_damage_4, voice_damage_5,
	voice_damage_6, voice_damage_7, voice_damage_8, voice_damage_9, voice_damage_10); /* Damage voice variation */
	
	voice_burned_running = scr_choose_sound_variation(voice_burned_running, voice_burned_running_1, voice_burned_running_2, voice_burned_running_3, voice_burned_running_4, voice_burned_running_5,
	voice_burned_running_6, voice_burned_running_7, voice_burned_running_8, voice_burned_running_9, voice_burned_running_10); /* Burned running voice variation */
	
	voice_burned = scr_choose_sound_variation(voice_burned, voice_burned_1, voice_burned_2, voice_burned_3, voice_burned_4, voice_burned_5,
	voice_burned_6, voice_burned_7, voice_burned_8, voice_burned_9, voice_burned_10); /* Burned voice variation */
	
	voice_scream = scr_choose_sound_variation(voice_scream, voice_scream_1, voice_scream_2, voice_scream_3, voice_scream_4, voice_scream_5,
	voice_scream_6, voice_scream_7, voice_scream_8, voice_scream_9, voice_scream_10); /* Scream voice variation */
	
	#endregion /* Choose to play voice clips randomly END */
	
}