#region /*Initialize Custom Character*/

/*The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config.ini file. This also means that x should be after y*/

#region /*Play as Custom Character*/

if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
or(file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	}
	
	#region /*Default Xscale*/
	if (ini_key_exists("values", "default_xscale"))
	{
		default_xscale = ini_read_real("values", "default_xscale", 1);
	}
	else
	{
		default_xscale = 1;
	}
	#endregion /*Default Xscale END*/
	
	#region /*Default Yscale*/
	if (ini_key_exists("values", "default_yscale"))
	{
		default_yscale = ini_read_real("values", "default_yscale", 1);
	}
	else
	{
		default_yscale = 1;
	}
	#endregion /*Default Yscale END*/
	
}

#region /*Sprite origin point variables*/

if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/sprite_origin_point.ini"))
or(file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/sprite_origin_point.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/sprite_origin_point.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/sprite_origin_point.ini");
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/sprite_origin_point.ini");
	}
	
	#region /*Sprite map x and y origin points*/
	#region /*Sprite map x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_xorig"))
	{
		sprite_map_xorig = ini_read_real("sprite origin points", "sprite_map_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_xorig", 0);
		sprite_map_xorig = 0;
	}
	#endregion /*Sprite map x origin point END*/

	#region /*Sprite map y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_yorig"))
	{
		sprite_map_yorig = ini_read_real("sprite origin points", "sprite_map_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_yorig", 0);
		sprite_map_yorig = 0;
	}
	#endregion /*Sprite map y origin point END*/
	#endregion /*Sprite map x and y origin points END*/
	
	#region /*Sprite map enter level x and y origin points*/
	#region /*Sprite map enter level x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_enter_level_xorig"))
	{
		sprite_map_enter_level_xorig = ini_read_real("sprite origin points", "sprite_map_enter_level_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_enter_level_xorig", 0);
		sprite_map_enter_level_xorig = 0;
	}
	#endregion /*Sprite map enter level x origin point END*/

	#region /*Sprite map enter level y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_enter_level_yorig"))
	{
		sprite_map_enter_level_yorig = ini_read_real("sprite origin points", "sprite_map_enter_level_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_enter_level_yorig", 0);
		sprite_map_enter_level_yorig = 0;
	}
	#endregion /*Sprite map enter level y origin point END*/
	#endregion /*Sprite map enter level x and y origin points END*/
	
	#region /*Sprite stand x and y origin points*/
	#region /*Sprite stand x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
	{
		sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_stand_xorig", 0);
		sprite_stand_xorig = 0;
	}
	#endregion /*Sprite stand x origin point END*/

	#region /*Sprite stand y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
	{
		sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_stand_yorig", 0);
		sprite_stand_yorig = 0;
	}
	#endregion /*Sprite stand y origin point END*/
	#endregion /*Sprite stand x and y origin points END*/
	
	ini_close();
}

#region /*If there is no config.ini file, then make every xorig and yorig variable zero*/
else
{
	sprite_map_xorig = 0;
	sprite_map_yorig = 0;
	sprite_map_enter_level_xorig = 0;
	sprite_map_enter_level_yorig = 0;
	sprite_stand_xorig = 0;
	sprite_stand_yorig = 0;
}
#endregion /*If there is no config.ini file, then make every xorig and yorig variable zero END*/

#endregion /*Sprite origin point variables END*/

#region /*Sprite variables*/

sprite_map = scr_initialize_custom_character_sprite("map", sprite_map, sprite_map_xorig, sprite_map_yorig);
sprite_map_enter_level = scr_initialize_custom_character_sprite("map_enter_level", sprite_map_enter_level, sprite_map_enter_level_xorig, sprite_map_enter_level_yorig);
sprite_map_enter_level = scr_initialize_custom_character_sprite("map_enter", sprite_map_enter_level, sprite_map_enter_level_xorig, sprite_map_enter_level_yorig);
sprite_stand = scr_initialize_custom_character_sprite("stand", sprite_stand, sprite_stand_xorig, sprite_stand_yorig);

#endregion /*Sprite variables END*/

#endregion /*Play as Custom Character END*/

if (sprite_map > noone)
{
	sprite_index = sprite_map;
}
else
if (sprite_stand > noone)
{
	sprite_index = sprite_stand;
}
#endregion /*Initialize Custom Character END*/