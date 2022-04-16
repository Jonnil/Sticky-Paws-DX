if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
{
	var uppercase_level_name;
	uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, level)), 1));
	uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, level)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, level))) - 1);
	var level_name = string(uppercase_level_name);
	
	#region /*Level Load*/
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	
	clear_rate = ini_read_string(level_name, "clear_rate", "closed");
	number_of_deaths = ini_read_real(level_name, "number_of_deaths", 0);
	number_of_clears = ini_read_real(level_name, "number_of_clears", 0);
	big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
	big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
	big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
	big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
	big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);
	lives_until_assist = ini_read_real(level_name, "lives_until_assist", 0);
	x_checkpoint = ini_read_real(level_name, "x_checkpoint", 0);
	y_checkpoint = ini_read_real(level_name, "y_checkpoint", 0);
	checkpoint_millisecond = ini_read_real(level_name, "checkpoint_millisecond", 0);
	checkpoint_second = ini_read_real(level_name, "checkpoint_second", 0);
	checkpoint_minute = ini_read_real(level_name, "checkpoint_minute", 0);
	checkpoint_realmillisecond = ini_read_real(level_name, "checkpoint_realmillisecond", 0);
	timeattack_millisecond = ini_read_real(level_name, "timeattack_millisecond", 0);
	timeattack_second = ini_read_real(level_name, "timeattack_second", 0);
	timeattack_minute = ini_read_real(level_name, "timeattack_minute", 0);
	timeattack_realmillisecond = ini_read_real(level_name, "timeattack_realmillisecond", 999999999);
	level_score = ini_read_real(level_name, "level_score", 0);
	
	ini_close();
	#endregion /*Level Load END*/
		
}
else
{
	clear_rate = "closed";
	number_of_deaths = 0;
	number_of_clears = 0;
	big_collectible1 = false;
	big_collectible2 = false;
	big_collectible3 = false;
	big_collectible4 = false;
	big_collectible5 = false;
	lives_until_assist = 0;
	x_checkpoint = false;
	y_checkpoint = false;
	checkpoint_millisecond = 0;
	checkpoint_second = 0;
	checkpoint_minute = 0;
	checkpoint_realmillisecond = 0;
	timeattack_millisecond = 0;
	timeattack_second = 0;
	timeattack_minute = 0;
	timeattack_realmillisecond = 999999999;
	level_score = 0;
}

if (always_open = true)
and (clear_rate = "closed")
{
	clear_rate = "enter";
}
