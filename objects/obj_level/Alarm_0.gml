if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
{
	
	#region /*Level Load*/
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	if (ini_section_exists(ds_list_find_value(global.all_loaded_main_levels, level)))
	{
		clear_rate = ini_read_string(ds_list_find_value(global.all_loaded_main_levels, level), "clear_rate", "closed");
		number_of_deaths = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "number_of_deaths", 0);
		number_of_clears = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "number_of_clears", 0);
		big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "big_collectible1", 0);
		big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "big_collectible2", 0);
		big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "big_collectible3", 0);
		big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "big_collectible4", 0);
		big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "big_collectible5", 0);
		lives_until_assist = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "lives_until_assist", 0);
		x_checkpoint = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "x_checkpoint", 0);
		y_checkpoint = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "y_checkpoint", 0);
		checkpoint_millisecond = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "checkpoint_millisecond", 0);
		checkpoint_second = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "checkpoint_second", 0);
		checkpoint_minute = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "checkpoint_minute", 0);
		checkpoint_realmillisecond = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "checkpoint_realmillisecond", 0);
		timeattack_millisecond = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "timeattack_millisecond", 0);
		timeattack_second = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "timeattack_second", 0);
		timeattack_minute = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "timeattack_minute", 0);
		timeattack_realmillisecond = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "timeattack_realmillisecond", 0);
		level_score = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, level), "level_score", 0);
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
	
	scr_unlock_next_level();
	
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

if (clear_rate != "closed")
and (clear_rate != "enter")
and (clear_rate != "clear")
{
	clear_rate = "closed";
}

if (always_open = true)
and (clear_rate = "closed")
{
	clear_rate = "enter";
}
