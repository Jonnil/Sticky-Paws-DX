if (initialize_level_timer < 2)
{
	initialize_level_timer += 1;
}

if (initialize_level_timer = 1)
{
	if (file_exists("File" + string(global.file) + ".ini"))
	{
	ini_open("File" + string(global.file) + ".ini");

	#region /*Level Load*/
	if (ini_section_exists("Level" + string(level)))
	{
		clear_rate = ini_read_string("Level" + string(level), "clear_rate", "closed");
		number_of_clears = ini_read_real("Level" + string(level), "number_of_clears", 0);
		big_collectible1 = ini_read_real("Level" + string(level), "big_collectible1", 0);
		big_collectible2 = ini_read_real("Level" + string(level), "big_collectible2", 0);
		big_collectible3 = ini_read_real("Level" + string(level), "big_collectible3", 0);
		big_collectible4 = ini_read_real("Level" + string(level), "big_collectible4", 0);
		big_collectible5 = ini_read_real("Level" + string(level), "big_collectible5", 0);
		lives_until_assist = ini_read_real("Level" + string(level), "lives_until_assist", 0);
		x_checkpoint = ini_read_real("Level" + string(level), "x_checkpoint", 0);
		y_checkpoint = ini_read_real("Level" + string(level), "y_checkpoint", 0);
		checkpoint_millisecond = ini_read_real("Level" + string(level), "checkpoint_millisecond", 0);
		checkpoint_second = ini_read_real("Level" + string(level), "checkpoint_second", 0);
		checkpoint_minute = ini_read_real("Level" + string(level), "checkpoint_minute", 0);
		checkpoint_realmillisecond = ini_read_real("Level" + string(level), "checkpoint_realmillisecond", 0);
		timeattack_millisecond = ini_read_real("Level" + string(level), "timeattack_millisecond", 0);
		timeattack_second = ini_read_real("Level" + string(level), "timeattack_second", 0);
		timeattack_minute = ini_read_real("Level" + string(level), "timeattack_minute", 0);
		timeattack_realmillisecond = ini_read_real("Level" + string(level), "timeattack_realmillisecond", 0);
		level_score = ini_read_real("Level" + string(level), "level_score", 0);
	}
	else
	{
		//ini_open("File" + string(global.file) + ".ini");
		ini_write_string("Level" + string(level), "clear_rate", "closed");
		clear_rate = "closed";
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
	
	#region /*Make next level enterable if you have cleared this level*/
	if (clear_rate = "closed")
	and(level = 1+string(ini_read_real("Player","number_of_levels_cleared",0))) /*Fix this*/
	{
		clear_rate = "enter";
	}
	#endregion /*Make next level enterable if you have cleared this level END*/
	
	ini_close();
	#endregion /*Level Load END*/
	
}

else
{
	ini_open("File" + string(global.file) + ".ini");
	ini_write_string("Level" + string(level), "clear_rate", "closed");
	clear_rate = "closed";
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
}