/* Save Level Information like if you have cleared the level or if you have a checkpoint */
function scr_save_level()
{
	//buffer_async_group_begin("save_files");
	//buffer_async_group_option("savepadindex", 0); /* The number you pass in is the pad number of the user who is saving/loading. */
	//buffer_async_group_option("showdialog", 0);    /* Stop platform dialogues appearing for this auto-save (if you do this your player won't be able to select a slot manually) */
	//buffer_async_group_option("slottitle", "SaveForMyGame"); /* Set the title of the slot we're going to save into */
	//buffer_async_group_option("subtitle", "Save file for my awesome game"); /* Set a subtitle that's visible in the UI */
	//global.savebuff = buffer_create(1, buffer_grow, 1);
	//ini_open_from_string("");
	
	
	
	
	if (global.character_select_in_this_menu == "main_game")
	&& (global.actually_play_edited_level)
	{
		var uppercase_level_name;
		uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
		uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
		var level_name = string(uppercase_level_name);
		
		ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
		
		if (global.level_clear_rate == "clear")
		{
			ini_write_real(level_name, "number_of_clears", ini_read_real(level_name, "number_of_clears", 0) + 1); /* Increase how many times you've played this specific level */
			if (global.increase_number_of_levels_cleared)
			&& (ini_key_exists(level_name, "clear_rate"))
			&& (ini_read_string(level_name, "clear_rate", "closed") != "clear")
			{
				ini_write_real("Player", "number_of_levels_cleared", ini_read_real("Player", "number_of_levels_cleared", 1) + 1); /* Increase how many levels in total you have cleared */
			}
			ini_write_string(level_name, "clear_rate", "clear"); /* Make the level clear after checking number of levels cleared */
			global.level_clear_rate = noone;
		}
		else
		{
			global.level_clear_rate = noone;
		}
		ini_write_real("Player", "current_month", current_month);
		ini_write_real("Player", "current_day", current_day);
		ini_write_real("Player", "current_year", current_year);
		ini_write_real("Player", "current_hour", current_hour);
		ini_write_real("Player", "current_minute", current_minute);
		ini_write_real("Player", "current_second", current_second);
		ini_write_real("Player", "brand_new_file", false); /* Make absolutely sure that the game knows you're not starting on a brand new file if you hit checkpoints or goals */
		ini_write_real(level_name, "lives_until_assist", global.lives_until_assist);
		ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
		ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
		ini_write_real(level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
		ini_write_real(level_name, "checkpoint_second", global.checkpoint_second);
		ini_write_real(level_name, "checkpoint_minute", global.checkpoint_minute);
		ini_write_real(level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		if (global.timeattack_realmillisecond > 2)
		{
			
			#region /* Save Fastest Time */
			if (!ini_key_exists(level_name, "timeattack_realmillisecond"))
			|| (global.timeattack_realmillisecond < ini_read_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond))
			{
				ini_write_real(level_name, "timeattack_millisecond", global.timeattack_millisecond);
				ini_write_real(level_name, "timeattack_second", global.timeattack_second);
				ini_write_real(level_name, "timeattack_minute", global.timeattack_minute);
				ini_write_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
			}
			#endregion /* Save Fastest Time END */
			
		}
		if (score > ini_read_real(level_name, "level_score", false))
		{
			ini_write_real(level_name, "level_score", score);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	&& (global.actually_play_edited_level)
	{
		var uppercase_level_name;
		uppercase_level_name = string_upper(string_char_at(string(global.level_name), 1));
		uppercase_level_name += string_copy(string(global.level_name), 2, string_length(string(global.level_name)) - 1);
		var level_name = string(uppercase_level_name);
		
		#region /* Save to custom level save file */
		ini_open(working_directory + "/save_files/custom_level_save.ini");
		ini_write_real(level_name, "lives_until_assist", global.lives_until_assist);
		ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
		ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
		ini_write_real(level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
		ini_write_real(level_name, "checkpoint_second", global.checkpoint_second);
		ini_write_real(level_name, "checkpoint_minute", global.checkpoint_minute);
		ini_write_real(level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		if (global.timeattack_realmillisecond > 2)
		{
			
			#region /* Save Fastest Time */
			if (!ini_key_exists(level_name, "timeattack_realmillisecond"))
			|| (global.timeattack_realmillisecond < ini_read_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond))
			{
				ini_write_real(level_name, "timeattack_millisecond", global.timeattack_millisecond);
				ini_write_real(level_name, "timeattack_second", global.timeattack_second);
				ini_write_real(level_name, "timeattack_minute", global.timeattack_minute);
				ini_write_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
			}
			#endregion /* Save Fastest Time END */
			
		}
		if (score > ini_read_real(level_name, "level_score", false))
		{
			ini_write_real(level_name, "level_score", score);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		#endregion /* Save to custom level save file END */
		
		#region /* Update ranking highscore to actual custom level */
		if (global.character_select_in_this_menu == "level_editor")
		&& (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		{
			if (global.character_select_in_this_menu == "level_editor")
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			}
			
			#region /* If doing a clear check, and winning the level, then add in level information that you have done a clear check */
			if (global.level_clear_rate == "clear")
			&& (global.doing_clear_check)
			{
				ini_write_real("info", "clear_check", true);
				global.go_to_menu_after_loading_custom_levels = "upload_edit_name";
				global.level_clear_rate = noone;
			}
			#endregion /* If doing a clear check, and winning the level, then add in level information that you have done a clear check END */
			
			#region /* Save Fastest Time */
			if (global.timeattack_realmillisecond > 2)
			{
				if (!ini_key_exists("rank", "rank_timeattack_realmillisecond"))
				|| (global.timeattack_realmillisecond < ini_read_real("rank", "rank_timeattack_realmillisecond", global.timeattack_realmillisecond))
				{
					ini_write_real("rank", "rank_timeattack_millisecond", global.timeattack_millisecond);
					ini_write_real("rank", "rank_timeattack_second", global.timeattack_second);
					ini_write_real("rank", "rank_timeattack_minute", global.timeattack_minute);
					ini_write_real("rank", "rank_timeattack_realmillisecond", global.timeattack_realmillisecond);
				}
			}
			#endregion /* Save Fastest Time END */
			
			if (score > ini_read_real("rank", "rank_level_score", false))
			{
				ini_write_real("rank", "rank_level_score", score);
			}
			
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			#endregion /* Update ranking highscore to actual custom level END */
			
		}
	}
	global.big_collectible1_already_collected = false;
	global.big_collectible2_already_collected = false;
	global.big_collectible3_already_collected = false;
	global.big_collectible4_already_collected = false;
	global.big_collectible5_already_collected = false;
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;
	global.timeattack_realmillisecond = 0;
	score = 0;
	
	ini_open(working_directory + "/config.ini")
	ini_write_real("config", "zoom_level", global.zoom_level);
	ini_write_real("config", "zoom_world_map", global.zoom_world_map);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	
	//var inistring = ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	//buffer_write(global.savebuff, buffer_string, inistring);
	//buffer_save_async(global.savebuff, "file" + string(global.file) + ".ini", 0, buffer_get_size(global.savebuff)); /* Pass the data to be saved */
	//global.saveid = buffer_async_group_end(); /* Start the save process */
}
