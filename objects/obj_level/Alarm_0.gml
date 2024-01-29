#region /* Level Load */
/* Loading the level data in Alarm Event works better than loading in Create Event */
/* Create Event isn't sure what level is set as */
/* So it doesn't know what level data to load there */
if (file_exists(working_directory + "save_file/file" + string(global.file) + ".ini"))
{
	var level_name = string(ds_list_find_value(global.all_loaded_main_levels, level));
	
	ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
	
	clear_rate = ini_read_string(level_name, "clear_rate", "closed");
	number_of_defeats = ini_read_real(level_name, "number_of_defeats", 0);
	number_of_clears = ini_read_real(level_name, "number_of_clears", 0);
	for(var i = 1; i <= global.max_big_collectible; i += 1)
	{
		big_collectible[i] = ini_read_real(level_name, "big_collectible" + string(i), 0);
	}
	lives_until_assist = ini_read_real(level_name, "lives_until_assist", 0);
	checkpoint_x = ini_read_real(level_name, "checkpoint_x", 0);
	checkpoint_y = ini_read_real(level_name, "checkpoint_y", 0);
	checkpoint_millisecond = ini_read_real(level_name, "checkpoint_millisecond", 0);
	checkpoint_second = ini_read_real(level_name, "checkpoint_second", 0);
	checkpoint_minute = ini_read_real(level_name, "checkpoint_minute", 0);
	checkpoint_realmillisecond = ini_read_real(level_name, "checkpoint_realmillisecond", 0);
	timeattack_millisecond = ini_read_real(level_name, "timeattack_millisecond", 0);
	timeattack_second = ini_read_real(level_name, "timeattack_second", 0);
	timeattack_minute = ini_read_real(level_name, "timeattack_minute", 0);
	timeattack_realmillisecond = ini_read_real(level_name, "timeattack_realmillisecond", 999999999);
	level_score = ini_read_real(level_name, "level_score", 0);
	
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	
}
else
{
	clear_rate = "closed";
	number_of_defeats = 0;
	number_of_clears = 0;
	for(var i = 1; i <= global.max_big_collectible; i += 1)
	{
		big_collectible[i] = false;
	}
	lives_until_assist = 0;
	checkpoint_x = false;
	checkpoint_y = false;
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
#endregion /* Level Load END */

if (always_open)
&& (clear_rate = "closed")
{
	clear_rate = "enter";
}

var all_big_collectibles = true;
for(var i = 1; i <= global.max_big_collectible; i += 1)
{
	if (!big_collectible[i])
	{
		all_big_collectibles = false;
		break; /* exit the loop if any big collectible is false */
	}
}
if (clear_rate == "clear")
{
	image_alpha = 1;
	if (all_big_collectibles) /* If every big collectibe has been collected, recognize that */
	{
		level_color = c_yellow;
		level_perfect = true;
	}
	else
	{
		level_color = c_blue;
	}
}
else
if (clear_rate = "closed")
{
	image_alpha = 0.1;
	level_color = c_black; /* Closed */
}