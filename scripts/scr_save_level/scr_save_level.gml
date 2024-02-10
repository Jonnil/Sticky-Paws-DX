/* Save Level Information like if you have cleared the level or if you have a checkpoint */
function scr_save_level()
{
	var level_id = "";
	
	#region /* If doing a character clear check, and winning the level, then add in character config that you have done a clear check */
	if (global.level_clear_rate == "clear" && global.doing_clear_check_character) {
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
		ini_write_real("info", "clear_check_character", true);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		global.go_to_menu_when_going_back_to_title = "upload_yes_character";
	}
	#endregion /* If doing a character clear check, and winning the level, then add in charcter config that you have done a clear check END */
	
	if (global.character_select_in_this_menu == "main_game" && global.actually_play_edited_level) {
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		
		if (global.level_clear_rate == "clear" && !global.doing_clear_check_character) {
			ini_write_real(global.level_name, "number_of_clears", ini_read_real(global.level_name, "number_of_clears", 0) + 1); /* Increase how many times you've played this specific level */
			if (global.increase_number_of_levels_cleared && ini_key_exists(global.level_name, "clear_rate") && ini_read_string(global.level_name, "clear_rate", "closed") != "clear") {
				ini_write_real("Player", "number_of_levels_cleared", ini_read_real("Player", "number_of_levels_cleared", 1) + 1); /* Increase how many levels in total you have cleared */
			}
			ini_write_string(global.level_name, "clear_rate", "clear"); /* Make the level clear after checking number of levels cleared */
		}
		ini_write_real("Player", "current_month", current_month);
		ini_write_real("Player", "current_day", current_day);
		ini_write_real("Player", "current_year", current_year);
		ini_write_real("Player", "current_hour", current_hour);
		ini_write_real("Player", "current_minute", current_minute);
		ini_write_real("Player", "current_second", current_second);
		ini_write_real("Player", "brand_new_file", false); /* Make absolutely sure that the game knows you're not starting on a brand new file if you hit checkpoints or goals */
		ini_write_real(global.level_name, "lives_until_assist", global.lives_until_assist);
		ini_write_real(global.level_name, "checkpoint_x", global.checkpoint_x);
		ini_write_real(global.level_name, "checkpoint_y", global.checkpoint_y);
		ini_write_real(global.level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
		ini_write_real(global.level_name, "checkpoint_second", global.checkpoint_second);
		ini_write_real(global.level_name, "checkpoint_minute", global.checkpoint_minute);
		ini_write_real(global.level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		
		#region /* Save Fastest Time */
		if (global.timeattack_realmillisecond > 2) {
			if (!ini_key_exists(global.level_name, "timeattack_realmillisecond"))
			|| (global.timeattack_realmillisecond < ini_read_real(global.level_name, "timeattack_realmillisecond", 999999999)) {
				ini_write_real(global.level_name, "timeattack_millisecond", global.timeattack_millisecond);
				ini_write_real(global.level_name, "timeattack_second", global.timeattack_second);
				ini_write_real(global.level_name, "timeattack_minute", global.timeattack_minute);
				ini_write_real(global.level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
			}
		}
		#endregion /* Save Fastest Time END */
		
		if (score > ini_read_real(global.level_name, "level_score", false)) {
			ini_write_real(global.level_name, "level_score", score);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	else
	if (global.character_select_in_this_menu == "level_editor" && global.actually_play_edited_level) {
		
		#region /* Update ranking highscore to actual custom level */
		ini_open(global.use_cache_or_working + "custom_levels/" + global.level_name + "/data/level_information.ini");
		
		var level_id = ini_read_string("info", "level_id", "");
		
		if (global.level_clear_rate == "clear" && global.doing_clear_check_level) {
			ini_write_real("info", "clear_check", true); /* If doing a level clear check, and winning the level, then add in level information that you have done a clear check */
			global.go_to_menu_when_going_back_to_title = "upload_edit_name";
		}
		
		#region /* Save Fastest Time */
		if (global.timeattack_realmillisecond > 2) {
			if (!ini_key_exists("rank", "rank_timeattack_realmillisecond"))
			|| (global.timeattack_realmillisecond < ini_read_real("rank", "rank_timeattack_realmillisecond", global.timeattack_realmillisecond)) {
				ini_write_real("rank", "rank_timeattack_millisecond", global.timeattack_millisecond);
				ini_write_real("rank", "rank_timeattack_second", global.timeattack_second);
				ini_write_real("rank", "rank_timeattack_minute", global.timeattack_minute);
				ini_write_real("rank", "rank_timeattack_realmillisecond", global.timeattack_realmillisecond);
			}
		}
		#endregion /* Save Fastest Time END */
		
		if (score > ini_read_real("rank", "rank_level_score", false)) {
			ini_write_real("rank", "rank_level_score", score);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		#endregion /* Update ranking highscore to actual custom level END */
		
		#region /* Save to custom level save file */
		ini_open(working_directory + "save_file/custom_level_save.ini");
		
		/* Update a list of downloaded levels that you have finished */
		if (level_id != "" && ini_read_real("finished_downloaded_level", string(level_id), 0) < 2 && !global.doing_clear_check_character) {
			if (global.level_clear_rate == "clear") {
				ini_write_real("finished_downloaded_level", string(level_id), 2); /* Played and finished */
			}
			else {
				ini_write_real("finished_downloaded_level", string(level_id), 1); /* Only played, but not finished */
			}
		}
		
		ini_write_real(global.level_name, "lives_until_assist", global.lives_until_assist);
		ini_write_real(global.level_name, "checkpoint_x", global.checkpoint_x);
		ini_write_real(global.level_name, "checkpoint_y", global.checkpoint_y);
		ini_write_real(global.level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
		ini_write_real(global.level_name, "checkpoint_second", global.checkpoint_second);
		ini_write_real(global.level_name, "checkpoint_minute", global.checkpoint_minute);
		ini_write_real(global.level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		if (global.timeattack_realmillisecond > 2) {
			
			#region /* Save Fastest Time */
			if (!ini_key_exists(global.level_name, "timeattack_realmillisecond"))
			|| (global.timeattack_realmillisecond < ini_read_real(global.level_name, "timeattack_realmillisecond", 999999999)) {
				ini_write_real(global.level_name, "timeattack_millisecond", global.timeattack_millisecond);
				ini_write_real(global.level_name, "timeattack_second", global.timeattack_second);
				ini_write_real(global.level_name, "timeattack_minute", global.timeattack_minute);
				ini_write_real(global.level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
			}
			#endregion /* Save Fastest Time END */
			
		}
		if (score > ini_read_real(global.level_name, "level_score", false)) {
			ini_write_real(global.level_name, "level_score", score);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		#endregion /* Save to custom level save file END */
		
	}
	
	for(var i = 1; i <= global.max_big_collectible; i += 1)
	{
		global.big_collectible_already_collected[i] = false;
	}
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;
	global.level_clear_rate = noone;
	score = 0;
	
	ini_open(working_directory + "save_file/config.ini")
	ini_write_real("config", "zoom_level", global.zoom_level);
	ini_write_real("config", "zoom_world_map", global.zoom_world_map);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
