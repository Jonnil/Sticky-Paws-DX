/* Save Level Information like if you have cleared the level or if you have a checkpoint */
function scr_save_level()
{
	if (global.character_select_in_this_menu == "main_game")
	and (global.actually_play_edited_level == true)
	{
		var uppercase_level_name;
		uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
		uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
		var level_name = string(uppercase_level_name);
		
		ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
		
		if (global.level_clear_rate == "clear")
		{
			ini_write_real(level_name, "number_of_clears", ini_read_real(level_name, "number_of_clears", 0) + 1); /* Increase how many times you've played this specific level */
			if (global.increase_number_of_levels_cleared == true)
			and (ini_key_exists(level_name, "clear_rate"))
			and (ini_read_string(level_name, "clear_rate", "closed") != "clear")
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
			or (global.timeattack_realmillisecond < ini_read_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond))
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
		ini_close();
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	and (global.actually_play_edited_level == true)
	{
		var uppercase_level_name;
		uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
		uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
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
			or (global.timeattack_realmillisecond < ini_read_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond))
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
		ini_close();
		#endregion /* Save to custom level save file END */
		
		#region /* Update ranking highscore to actual custom level */
		if (global.character_select_in_this_menu == "level_editor")
		and (global.select_level_index <= 0)
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
		or (global.character_select_in_this_menu == "level_editor")
		and (global.create_level_from_template >= 2)
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
		or (global.character_select_in_this_menu == "level_editor")
		and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
		{
			if (global.character_select_in_this_menu == "level_editor")
			and (global.select_level_index <= 0)
			or (global.character_select_in_this_menu == "level_editor")
			and (global.create_level_from_template >= 2)
			{
				ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			}
			else
			if (global.character_select_in_this_menu == "level_editor")
			{
				ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
			}
			
			#region /* If doing a clear check, and winning the level, then add in level information that you have done a clear check */
			if (global.level_clear_rate == "clear")
			and (global.doing_clear_check == true)
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
				or (global.timeattack_realmillisecond < ini_read_real("rank", "rank_timeattack_realmillisecond", global.timeattack_realmillisecond))
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
			
			ini_close();
			#endregion /* Update ranking highscore to actual custom level END */
		
		}
	}
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;
	global.timeattack_realmillisecond = 0;
	score = 0;
}
