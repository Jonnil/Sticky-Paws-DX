/*Save Level Information like if you have cleared the level or if you have a checkpoint*/
function scr_savelevel()
{
	if (global.character_select_in_this_menu = "main_game")
	and (global.actually_play_edited_level)
	{
		var uppercase_level_name;
		uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
		uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
		var level_name = string(uppercase_level_name);
		
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		
		if (global.level_clear_rate = "clear")
		{
			ini_write_real(level_name, "number_of_clears", ini_read_real(level_name, "number_of_clears", 0) + 1); /*Increase how many times you've played this specific level*/
			if (global.increase_number_of_levels_cleared = true)
			and (ini_read_string(level_name, "clear_rate", "closed") != "clear")
			{
				ini_write_real("Player", "number_of_levels_cleared", ini_read_real("Player", "number_of_levels_cleared", 1) + 1); /*Increase how many levels in total you have cleared*/
			}
			ini_write_string(level_name, "clear_rate", "clear"); /*Make the level clear after checking number_of_levels_cleared*/
		}
		ini_write_real("Player", "current_month", current_month);
		ini_write_real("Player", "current_day", current_day);
		ini_write_real("Player", "current_year", current_year);
		ini_write_real("Player", "current_hour", current_hour);
		ini_write_real("Player", "current_minute", current_minute);
		ini_write_real("Player", "current_second", current_second);
		ini_write_real(level_name, "lives_until_assist", global.lives_until_assist);
		ini_write_real(level_name, "x_checkpoint", global.x_checkpoint);
		ini_write_real(level_name, "y_checkpoint", global.y_checkpoint);
		ini_write_real(level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
		ini_write_real(level_name, "checkpoint_second", global.checkpoint_second);
		ini_write_real(level_name, "checkpoint_minute", global.checkpoint_minute);
		ini_write_real(level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		if (global.timeattack_realmillisecond > 2)
		
		#region /*Save Fastest Time*/
		if (!ini_key_exists(level_name, "timeattack_realmillisecond"))
		or(global.timeattack_realmillisecond<ini_read_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond))
		{
			ini_write_real(level_name, "timeattack_millisecond", global.timeattack_millisecond);
			ini_write_real(level_name, "timeattack_second", global.timeattack_second);
			ini_write_real(level_name, "timeattack_minute", global.timeattack_minute);
			ini_write_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
		}
		#endregion /*Save Fastest Time END*/
		
		if (score > ini_read_real(level_name, "level_score", false))
		{
			ini_write_real(level_name, "level_score", score);
		}
		ini_close();
	}
	else
	if (global.character_select_in_this_menu = "level_editor")
	and (global.actually_play_edited_level)
	{
		var uppercase_level_name;
		uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
		uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
		var level_name = string(uppercase_level_name);
		
		ini_open(working_directory + "save_files/custom_level_save.ini");
		ini_write_real(level_name, "lives_until_assist", global.lives_until_assist);
		ini_write_real(level_name, "x_checkpoint", global.x_checkpoint);
		ini_write_real(level_name, "y_checkpoint", global.y_checkpoint);
		ini_write_real(level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
		ini_write_real(level_name, "checkpoint_second", global.checkpoint_second);
		ini_write_real(level_name, "checkpoint_minute", global.checkpoint_minute);
		ini_write_real(level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		if (global.timeattack_realmillisecond > 2)
		
		#region /*Save Fastest Time*/
		if (!ini_key_exists(level_name, "timeattack_realmillisecond"))
		or(global.timeattack_realmillisecond<ini_read_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond))
		{
			ini_write_real(level_name, "timeattack_millisecond", global.timeattack_millisecond);
			ini_write_real(level_name, "timeattack_second", global.timeattack_second);
			ini_write_real(level_name, "timeattack_minute", global.timeattack_minute);
			ini_write_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
		}
		#endregion /*Save Fastest Time END*/
		
		if (score > ini_read_real(level_name, "level_score", false))
		{
			ini_write_real(level_name, "level_score", score);
		}
		ini_close();
	}
}
