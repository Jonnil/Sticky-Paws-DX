#region /*Initialize Custom character*/

/*The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config.ini file. This also means that x should be after y*/

#region /*Allow abilities*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
or(file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	}
	else
	if(file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	}

	#region /*Allow roll*/
	if (ini_key_exists("allow abilities", "allow_roll"))
	{
		allow_roll = ini_read_real("allow abilities", "allow_roll", false);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_roll", false);
		allow_roll = false;
	}
	#endregion /*Allow roll*/

	#region /*Allow ledge grab*/
	if (ini_key_exists("allow abilities", "allow_ledge_grab"))
	{
		allow_ledge_grab = ini_read_real("allow abilities", "allow_ledge_grab", false);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_ledge_grab", false);
		allow_ledge_grab = false;
	}
	#endregion /*Allow ledge grab*/

	#region /*Allow ground pound*/
	if (ini_key_exists("allow abilities", "allow_ground_pound"))
	{
		allow_ground_pound = ini_read_real("allow abilities", "allow_ground_pound", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_ground_pound", true);
		allow_ground_pound = true;
	}
	#endregion /*Allow ground pound*/

	#region /*Allow ground pound jump*/
	if (ini_key_exists("allow abilities", "allow_ground_pound_jump"))
	{
		allow_ground_poundjump = ini_read_real("allow abilities", "allow_ground_pound_jump", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_ground_pound_jump", true);
		allow_ground_poundjump = true;
	}
	#endregion /*Allow ground pound jump*/

	#region /*Allow wall jump*/
	if (ini_key_exists("allow abilities", "allow_wall_jump"))
	{
		allow_wall_jump = ini_read_real("allow abilities", "allow_wall_jump", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_wall_jump", true);
		allow_wall_jump = true;
	}
	#endregion /*Allow wall jump*/

	#region /*Allow wall climb*/
	if (ini_key_exists("allow abilities", "allow_wall_climb"))
	{
		allow_wall_climb = ini_read_real("allow abilities", "allow_wall_climb", false);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_wall_climb", false);
		allow_wall_climb = false;
	}
	#endregion /*Allow wall climb*/

	#region /*Allow dive*/
	if (ini_key_exists("allow abilities", "allow_dive"))
	{
		allow_dive = ini_read_real("allow abilities", "allow_dive", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_dive", true);
		allow_dive = true;
	}
	#endregion /*Allow dive*/

	#region /*Allow dive ground boost*/
	if (ini_key_exists("allow abilities", "allow_dive_ground_boost"))
	{
		allow_dive_ground_boost = ini_read_real("allow abilities", "allow_dive_ground_boost", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_dive_ground_boost", true);
		allow_dive_ground_boost = true;
	}
	#endregion /*Allow dive ground boost*/

	#region /*Allow survive lava*/
	if (ini_key_exists("allow abilities", "allow_survive_lava"))
	{
		allow_survive_lava = ini_read_real("allow abilities", "allow_survive_lava", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_survive_lava", true);
		allow_survive_lava = true;
	}
	#endregion /*Allow survive lava*/

	#region /*Allow run*/
	if (ini_key_exists("allow abilities", "allow_run"))
	{
		allow_run = ini_read_real("allow abilities", "allow_run", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_run", true);
		allow_run = true;
	}
	#endregion /*Allow run*/

	#region /*Allow homing attack*/
	if (ini_key_exists("allow abilities", "allow_homing_tongue"))
	{
		allow_homing_tongue = ini_read_real("allow abilities", "allow_homing_tongue", false);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_homing_tongue", false);
		allow_homing_tongue = false;
	}
	#endregion /*Allow homing attack*/
	
	#region /*Allow crawl*/
	if (ini_key_exists("allow abilities", "allow_crawl"))
	{
		allow_crawl = ini_read_real("allow abilities", "allow_crawl", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_crawl", true);
		allow_crawl = true;
	}
	#endregion /*Allow crawl*/
	
	#region /*Allow crouch*/
	if (ini_key_exists("allow abilities", "allow_crouch"))
	{
		allow_crouch = ini_read_real("allow abilities", "allow_crouch", true);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_crouch", true);
		allow_crouch = true;
	}
	#endregion /*Allow crouch*/
	
	#region /*Allow tongue*/
	if (ini_key_exists("allow abilities", "allow_tongue"))
	{
		allow_tongue = ini_read_real("allow abilities", "allow_tongue", false);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_tongue", false);
		allow_tongue = false;
	}
	#endregion /*Allow tongue*/

	#region /*Allow overflow HP*/
	if (ini_key_exists("allow abilities", "allow_overflow_hp"))
	{
		allow_overflow_hp = ini_read_real("allow abilities", "allow_overflow_hp", false);
	}
	else
	{
		//ini_write_real("allow abilities", "allow_overflow_hp", false);
		allow_overflow_hp = false;
	}
	#endregion /*Allow tongue*/

	ini_close();
}
else
{
	
	#region /*Default abilities values*/
	allow_roll = false;
	allow_ledge_grab = false; /*Needs fixing, the player should stick to the wall more, if there isn't a wall you should fall, if the wall moves you should move with it*/
	allow_ground_pound = true; /*Allow Ground Pound*/
	allow_ground_poundjump = true;
	allow_wall_jump = true; /*Allow Wall Jump*/
	allow_wall_climb = false; /*Allow Wall Climb*/
	allow_dive = true; /*Dive when you have speed or during a ground_pound*/
	allow_dive_ground_boost = true;
	allow_survive_lava = true;
	allow_run = true;
	allow_homing_tongue = false;
	allow_crawl = true;
	allow_crouch = true;
	allow_tongue = false; /*A tongue that extends*/
	allow_overflow_hp = false;
	//ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	//if(!ini_key_exists("allow abilities", "allow_wall_jump")){ini_write_real("allow abilities", "allow_wall_jump", true);}
	//if(!ini_key_exists("allow abilities", "allow_wall_climb")){ini_write_real("allow abilities", "allow_wall_climb", false);}
	//if(!ini_key_exists("allow abilities", "allow_tongue")){ini_write_real("allow abilities", "allow_tongue", true);}
	//if(!ini_key_exists("allow abilities", "allow_survive_lava")){ini_write_real("allow abilities", "allow_survive_lava", true);}
	//if(!ini_key_exists("allow abilities", "allow_run")){ini_write_real("allow abilities", "allow_run", true);}
	//if(!ini_key_exists("allow abilities", "allow_roll")){ini_write_real("allow abilities", "allow_roll", false);}
	//if(!ini_key_exists("allow abilities", "allow_ledge_grab")){ini_write_real("allow abilities", "allow_ledge_grab", false);}
	//if(!ini_key_exists("allow abilities", "allow_homing_tongue")){ini_write_real("allow abilities", "allow_homing_tongue", false);}
	//if(!ini_key_exists("allow abilities", "allow_ground_pound_jump")){ini_write_real("allow abilities", "allow_ground_pound_jump", true);}
	//if(!ini_key_exists("allow abilities", "allow_ground_pound")){ini_write_real("allow abilities", "allow_ground_pound", true);}
	//if(!ini_key_exists("allow abilities", "allow_dive_ground_boost")){ini_write_real("allow abilities", "allow_dive_ground_boost", true);}
	//if(!ini_key_exists("allow abilities", "allow_dive")){ini_write_real("allow abilities", "allow_dive", true);}
	//if(!ini_key_exists("allow abilities", "allow_crawl")){ini_write_real("allow abilities", "allow_crawl", true);}
	//if(!ini_key_exists("allow abilities", "allow_crouch")){ini_write_real("allow abilities", "allow_crouch", true);}
	//if(!ini_key_exists("allow abilities", "allow_tongue")){ini_write_real("allow abilities", "allow_tongue", false);}
	//if(!ini_key_exists("allow abilities", "allow_overflow_hp")){ini_write_real("allow abilities", "allow_overflow_hp", false);}
	//ini_close();
	#endregion /*Default abilities values END*/
	
}
#endregion /*Allow abilities*/

allow_timeup = true;
allow_timeattack = true;
simple_controls = false; /*Simple Controls, used for testing if a level can be completed with limitations. All levels should be able to be finished, not 100% completed, with this option set to true. This option should be false by default when creating executable*/
stop_screen_from_scrolling_left = false; /*Stop the screen from being able to screoll left*/

#region /*Play as Custom character*/

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
	
	#region /*Mask x and y origin points*/
	#region /*Mask y origin point*/
	if (ini_key_exists("mask origin points", "mask_yorig"))
	{
		mask_yorig = ini_read_real("mask origin points", "mask_yorig", 0);
	}
	else
	{
		//ini_write_real("mask origin points", "mask_yorig", 0);
		mask_yorig = 0;
	}
	#endregion /*Mask y origin point END*/

	#region /*Mask x origin point*/
	if (ini_key_exists("mask origin points", "mask_xorig"))
	{
		mask_xorig = ini_read_real("mask origin points", "mask_xorig", 0);
	}
	else
	{
		//ini_write_real("mask origin points", "mask_xorig", 0);
		mask_xorig = 0;
	}
	#endregion /*Mask x origin point END*/
	#endregion /*Mask x and y origin points END*/

	#region /*Mask crouch x and y origin points*/
	#region /*Mask crouch y origin point*/
	if (ini_key_exists("mask origin points", "mask_crouch_yorig"))
	{
		mask_crouch_yorig = ini_read_real("mask origin points", "mask_crouch_yorig", 0);
	}
	else
	{
		//ini_write_real("mask origin points", "mask_crouch_yorig", 0);
		mask_crouch_yorig = 0;
	}
	#endregion /*Mask crouch y origin point END*/

	#region /*Mask crouch x origin point*/
	if (ini_key_exists("mask origin points", "mask_crouch_xorig"))
	{
		mask_crouch_xorig = ini_read_real("mask origin points", "mask_crouch_xorig", 0);
	}
	else
	{
		//ini_write_real("mask origin points", "mask_crouch_xorig", 0);
		mask_crouch_xorig = 0;
	}
	#endregion /*Mask crouch x origin point END*/
	#endregion /*Mask crouch x and y origin points END*/

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

	#region /*Sprite stand cold x and y origin points*/
	#region /*Sprite stand cold x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_cold_xorig"))
	{
		sprite_stand_cold_xorig = ini_read_real("sprite origin points", "sprite_stand_cold_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_stand_cold_xorig", 0);
		sprite_stand_cold_xorig = 0;
	}
	#endregion /*Sprite stand cold x origin point END*/

	#region /*Sprite stand cold y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_cold_yorig"))
	{
		sprite_stand_cold_yorig = ini_read_real("sprite origin points", "sprite_stand_cold_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_stand_cold_yorig", 0);
		sprite_stand_cold_yorig = 0;
	}
	#endregion /*Sprite stand cold y origin point END*/
	#endregion /*Sprite stand cold x and y origin points END*/

	#region /*Sprite standing on something x and y origin points*/
	#region /*Sprite standing on something x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_standing_on_something_xorig"))
	{
		sprite_standing_on_something_xorig = ini_read_real("sprite origin points", "sprite_standing_on_something_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_standing_on_something_xorig", 0);
		sprite_standing_on_something_xorig = 0;
	}
	#endregion /*Sprite stand x origin point END*/

	#region /*Sprite stand y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_standing_on_something_yorig"))
	{
		sprite_standing_on_something_yorig = ini_read_real("sprite origin points", "sprite_standing_on_something_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_standing_on_something_yorig", 0);
		sprite_standing_on_something_yorig = 0;
	}
	#endregion /*Sprite standing on something y origin point END*/
	#endregion /*Sprite standing on something x and y origin points END*/

	#region /*Sprite look up x and y origin points*/
	#region /*Sprite look up x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_look_up_xorig"))
	{
		sprite_look_up_xorig = ini_read_real("sprite origin points", "sprite_look_up_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_look_up_xorig", 0);
		sprite_look_up_xorig = 0;
	}
	#endregion /*Sprite look up x origin point END*/

	#region /*Sprite look up y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_look_up_yorig"))
	{
		sprite_look_up_yorig = ini_read_real("sprite origin points", "sprite_look_up_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_look_up_yorig", 0);
		sprite_look_up_yorig = 0;
	}
	#endregion /*Sprite look up y origin point END*/
	#endregion /*Sprite look up x and y origin points END*/
	
	#region /*Sprite look up start x and y origin points*/
	#region /*Sprite look up start x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_look_up_start_xorig"))
	{
		sprite_look_up_start_xorig = ini_read_real("sprite origin points", "sprite_look_up_start_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_look_up_start_xorig", 0);
		sprite_look_up_start_xorig = 0;
	}
	#endregion /*Sprite look up start x origin point END*/
	
	#region /*Sprite look up start y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_look_up_start_yorig"))
	{
		sprite_look_up_start_yorig = ini_read_real("sprite origin points", "sprite_look_up_start_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_look_up_start_yorig", 0);
		sprite_look_up_start_yorig = 0;
	}
	#endregion /*Sprite look up start y origin point END*/
	#endregion /*Sprite look up start x and y origin points END*/
	
	#region /*Sprite crouch x and y origin points*/
	#region /*Sprite crouch x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crouch_xorig"))
	{
		sprite_crouch_xorig = ini_read_real("sprite origin points", "sprite_crouch_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crouch_xorig", 0);
		sprite_crouch_xorig = 0;
	}
	#endregion /*Sprite crouch x origin point END*/

	#region /*Sprite crouch y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crouch_yorig"))
	{
		sprite_crouch_yorig = ini_read_real("sprite origin points", "sprite_crouch_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crouch_yorig", 0);
		sprite_crouch_yorig = 0;
	}
	#endregion /*Sprite crouch y origin point END*/
	#endregion /*Sprite crouch x and y origin points END*/

	#region /*Sprite crawl x and y origin points*/
	#region /*Sprite crawl x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crawl_xorig"))
	{
		sprite_crawl_xorig = ini_read_real("sprite origin points", "sprite_crawl_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crawl_xorig", 0);
		sprite_crawl_xorig = 0;
	}
	#endregion /*Sprite crawl x origin point END*/

	#region /*Sprite crawl y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crawl_yorig"))
	{
		sprite_crawl_yorig = ini_read_real("sprite origin points", "sprite_crawl_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crawl_yorig", 0);
		sprite_crawl_yorig = 0;
	}
	#endregion /*Sprite crawl y origin point END*/
	#endregion /*Sprite crawl x and y origin points END*/

	#region /*Sprite crouch jump x and y origin points*/
	#region /*Sprite crouch jump x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crouch_jump_xorig"))
	{
		sprite_crouch_jump_xorig = ini_read_real("sprite origin points", "sprite_crouch_jump_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crouch_jump_xorig", 0);
		sprite_crouch_jump_xorig = 0;
	}
	#endregion /*Sprite crouch jump x origin point END*/

	#region /*Sprite crouch jump y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crouch_jump_yorig"))
	{
		sprite_crouch_jump_yorig = ini_read_real("sprite origin points", "sprite_crouch_jump_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crouch_jump_yorig", 0);
		sprite_crouch_jump_yorig = 0;
	}
	#endregion /*Sprite crouch jump y origin point END*/
	#endregion /*Sprite crouch jump x and y origin points END*/

	#region /*Sprite crouch fall x and y origin points*/
	#region /*Sprite crouch fall x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crouch_fall_xorig"))
	{
		sprite_crouch_fall_xorig = ini_read_real("sprite origin points", "sprite_crouch_fall_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crouch_fall_xorig", 0);
		sprite_crouch_fall_xorig = 0;
	}
	#endregion /*Sprite crouch fall x origin point END*/

	#region /*Sprite crouch fall y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_crouch_fall_yorig"))
	{
		sprite_crouch_fall_yorig = ini_read_real("sprite origin points", "sprite_crouch_fall_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_crouch_fall_yorig", 0);
		sprite_crouch_fall_yorig = 0;
	}
	#endregion /*Sprite crouch fall y origin point END*/
	#endregion /*Sprite crouch fall x and y origin points END*/

	#region /*Sprite skidding x and y origin points*/
	#region /*Sprite skidding x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_skidding_xorig"))
	{
		sprite_skidding_xorig = ini_read_real("sprite origin points", "sprite_skidding_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_skidding_xorig", 0);
		sprite_skidding_xorig = 0;
	}
	#endregion /*Sprite skidding x origin point END*/

	#region /*Sprite skidding y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_skidding_yorig"))
	{
		sprite_skidding_yorig = ini_read_real("sprite origin points", "sprite_skidding_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_skidding_yorig", 0);
		sprite_skidding_yorig = 0;
	}
	#endregion /*Sprite skidding y origin point END*/
	#endregion /*Sprite skidding x and y origin points END*/
	
	#region /*Sprite skidding ice x and y origin points*/
	#region /*Sprite skidding ice x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_skidding_ice_xorig"))
	{
		sprite_skidding_ice_xorig = ini_read_real("sprite origin points", "sprite_skidding_ice_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_skidding_ice_xorig", 0);
		sprite_skidding_ice_xorig = 0;
	}
	#endregion /*Sprite skidding ice x origin point END*/

	#region /*Sprite skidding ice y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_skidding_ice_yorig"))
	{
		sprite_skidding_ice_yorig = ini_read_real("sprite origin points", "sprite_skidding_ice_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_skidding_ice_yorig", 0);
		sprite_skidding_ice_yorig = 0;
	}
	#endregion /*Sprite skidding ice y origin point END*/
	#endregion /*Sprite skidding ice x and y origin points END*/
	
	#region /*Sprite swim x and y origin points*/
	#region /*Sprite swim x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_swim_xorig"))
	{
		sprite_swim_xorig = ini_read_real("sprite origin points", "sprite_swim_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_swim_xorig", 0);
		sprite_swim_xorig = 0;
	}
	#endregion /*Sprite swim x origin point END*/

	#region /*Sprite swim y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_swim_yorig"))
	{
		sprite_swim_yorig = ini_read_real("sprite origin points", "sprite_swim_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_swim_yorig", 0);
		sprite_swim_yorig = 0;
	}
	#endregion /*Sprite swim y origin point END*/
	#endregion /*Sprite swim x and y origin points END*/
	
	#region /*Sprite swim stand x and y origin points*/
	#region /*Sprite swim stand x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_swim_stand_xorig"))
	{
		sprite_swim_stand_xorig = ini_read_real("sprite origin points", "sprite_swim_stand_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_swim_stand_xorig", 0);
		sprite_swim_stand_xorig = 0;
	}
	#endregion /*Sprite swim stand x origin point END*/
	
	#region /*Sprite swim stand y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_swim_stand_yorig"))
	{
		sprite_swim_stand_yorig = ini_read_real("sprite origin points", "sprite_swim_stand_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_swim_stand_yorig", 0);
		sprite_swim_stand_yorig = 0;
	}
	#endregion /*Sprite swim stand y origin point END*/
	#endregion /*Sprite swim stand x and y origin points END*/
	
	#region /*Sprite swim fall x and y origin points*/
	#region /*Sprite swim fall x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_swim_fall_xorig"))
	{
		sprite_swim_fall_xorig = ini_read_real("sprite origin points", "sprite_swim_fall_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_swim_fall_xorig", 0);
		sprite_swim_fall_xorig = 0;
	}
	#endregion /*Sprite swim fall x origin point END*/

	#region /*Sprite swim fall y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_swim_fall_yorig"))
	{
		sprite_swim_fall_yorig = ini_read_real("sprite origin points", "sprite_swim_fall_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_swim_fall_yorig", 0);
		sprite_swim_fall_yorig = 0;
	}
	#endregion /*Sprite swim_fall y origin point END*/
	#endregion /*Sprite swim_fall x and y origin points END*/

	#region /*Sprite against wall x and y origin points*/
	#region /*Sprite against wall x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_against_wall_xorig"))
	{
		sprite_against_wall_xorig = ini_read_real("sprite origin points", "sprite_against_wall_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_against_wall_xorig", 0);
		sprite_against_wall_xorig = 0;
	}
	#endregion /*Sprite against wall x origin point END*/

	#region /*Sprite against wall y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_against_wall_yorig"))
	{
		sprite_against_wall_yorig = ini_read_real("sprite origin points", "sprite_against_wall_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_against_wall_yorig", 0);
		sprite_against_wall_yorig = 0;
	}
	#endregion /*Sprite against wall y origin point END*/
	#endregion /*Sprite against wall x and y origin points END*/

	#region /*Sprite walk x and y origin points*/
	#region /*Sprite walk x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_walk_xorig"))
	{
		sprite_walk_xorig = ini_read_real("sprite origin points", "sprite_walk_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_walk_xorig", 0);
		sprite_walk_xorig = 0;
	}
	#endregion /*Sprite walk x origin point END*/

	#region /*Sprite walk y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_walk_yorig"))
	{
		sprite_walk_yorig = ini_read_real("sprite origin points", "sprite_walk_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_walk_yorig", 0);
		sprite_walk_yorig = 0;
	}
	#endregion /*Sprite walk y origin point END*/
	#endregion /*Sprite walk x and y origin points END*/

	#region /*Sprite run x and y origin points*/
	#region /*Sprite run x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run_xorig"))
	{
		sprite_run_xorig = ini_read_real("sprite origin points", "sprite_run_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run_xorig", 0);
		sprite_run_xorig = 0;
	}
	#endregion /*Sprite run x origin point END*/

	#region /*Sprite run y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run_yorig"))
	{
		sprite_run_yorig = ini_read_real("sprite origin points", "sprite_run_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run_yorig", 0);
		sprite_run_yorig = 0;
	}
	#endregion /*Sprite run y origin point END*/
	#endregion /*Sprite run x and y origin points END*/
	
	#region /*Sprite run 2 x and y origin points*/
	#region /*Sprite run 2 x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run2_xorig"))
	{
		sprite_run2_xorig = ini_read_real("sprite origin points", "sprite_run2_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run2_xorig", 0);
		sprite_run2_xorig = 0;
	}
	#endregion /*Sprite run 2 x origin point END*/

	#region /*Sprite run 2 y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run2_yorig"))
	{
		sprite_run2_yorig = ini_read_real("sprite origin points", "sprite_run2_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run2_yorig", 0);
		sprite_run2_yorig = 0;
	}
	#endregion /*Sprite run 2 y origin point END*/
	#endregion /*Sprite run 2 x and y origin points END*/
	
	#region /*Sprite run 3 x and y origin points*/
	#region /*Sprite run 3 x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run3_xorig"))
	{
		sprite_run3_xorig = ini_read_real("sprite origin points", "sprite_run3_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run3_xorig", 0);
		sprite_run3_xorig = 0;
	}
	#endregion /*Sprite run 3 x origin point END*/

	#region /*Sprite run 3 y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run3_yorig"))
	{
		sprite_run3_yorig = ini_read_real("sprite origin points", "sprite_run3_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run3_yorig", 0);
		sprite_run3_yorig = 0;
	}
	#endregion /*Sprite run 3 y origin point END*/
	#endregion /*Sprite run 3 x and y origin points END*/
	
	#region /*Sprite run 4 x and y origin points*/
	#region /*Sprite run 4 x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run4_xorig"))
	{
		sprite_run4_xorig = ini_read_real("sprite origin points", "sprite_run4_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run4_xorig", 0);
		sprite_run4_xorig = 0;
	}
	#endregion /*Sprite run 4 x origin point END*/

	#region /*Sprite run 4 y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_run4_yorig"))
	{
		sprite_run4_yorig = ini_read_real("sprite origin points", "sprite_run4_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_run4_yorig", 0);
		sprite_run4_yorig = 0;
	}
	#endregion /*Sprite run 4 y origin point END*/
	#endregion /*Sprite run 4 x and y origin points END*/
	
	#region /*Sprite jump x and y origin points*/
	#region /*Sprite jump x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_jump_xorig"))
	{
		sprite_jump_xorig = ini_read_real("sprite origin points", "sprite_jump_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_jump_xorig", 0);
		sprite_jump_xorig = 0;
	}
	#endregion /*Sprite jump x origin point END*/

	#region /*Sprite jump y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_jump_yorig"))
	{
		sprite_jump_yorig = ini_read_real("sprite origin points", "sprite_jump_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_jump_yorig", 0);
		sprite_jump_yorig = 0;
	}
	#endregion /*Sprite jump y origin point END*/
	#endregion /*Sprite jump x and y origin points END*/

	#region /*Sprite double jump x and y origin points*/
	#region /*Sprite double jump x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_double_jump_xorig"))
	{
		sprite_double_jump_xorig = ini_read_real("sprite origin points", "sprite_double_jump_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_double_jump_xorig", 0);
		sprite_double_jump_xorig = 0;
	}
	#endregion /*Sprite double jump x origin point END*/

	#region /*Sprite double jump y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_double_jump_yorig"))
	{
		sprite_double_jump_yorig = ini_read_real("sprite origin points", "sprite_double_jump_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_double_jump_yorig", 0);
		sprite_double_jump_yorig = 0;
	}
	#endregion /*Sprite double jump y origin point END*/
	#endregion /*Sprite double jump x and y origin points END*/
	
	#region /*Sprite triple jump x and y origin points*/
	#region /*Sprite triple jump x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_triple_jump_xorig"))
	{
		sprite_triple_jump_xorig = ini_read_real("sprite origin points", "sprite_triple_jump_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_triple_jump_xorig", 0);
		sprite_triple_jump_xorig = 0;
	}
	#endregion /*Sprite triple jump x origin point END*/

	#region /*Sprite triple jump y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_triple_jump_yorig"))
	{
		sprite_triple_jump_yorig = ini_read_real("sprite origin points", "sprite_triple_jump_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_triple_jump_yorig", 0);
		sprite_triple_jump_yorig = 0;
	}
	#endregion /*Sprite triple jump y origin point END*/
	#endregion /*Sprite triple jump x and y origin points END*/
	
	#region /*Sprite fall x and y origin points*/
	#region /*Sprite fall x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_fall_xorig"))
	{
		sprite_fall_xorig = ini_read_real("sprite origin points", "sprite_fall_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_fall_xorig", 0);
		sprite_fall_xorig = 0;
	}
	#endregion /*Sprite fall x origin point END*/

	#region /*Sprite fall y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_fall_yorig"))
	{
		sprite_fall_yorig = ini_read_real("sprite origin points", "sprite_fall_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_fall_yorig", 0);
		sprite_fall_yorig = 0;
	}
	#endregion /*Sprite fall y origin point END*/
	#endregion /*Sprite fall x and y origin points END*/

	#region /*Sprite fall slower x and y origin points*/
	#region /*Sprite fall slower x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_fall_slower_xorig"))
	{
		sprite_fall_slower_xorig = ini_read_real("sprite origin points", "sprite_fall_slower_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_fall_slower_xorig", 0);
		sprite_fall_slower_xorig = 0;
	}
	#endregion /*Sprite fall slower x origin point END*/

	#region /*Sprite fall slower y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_fall_slower_yorig"))
	{
		sprite_fall_slower_yorig = ini_read_real("sprite origin points", "sprite_fall_slower_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_fall_slower_yorig", 0);
		sprite_fall_slower_yorig = 0;
	}
	#endregion /*Sprite fall slower y origin point END*/
	#endregion /*Sprite fall slower x and y origin points END*/
	
	#region /*Climb under y offset*/
	if (ini_key_exists("sprite origin points", "climb_under_y_offset"))
	{
		climb_under_y_offset = ini_read_real("sprite origin points", "climb_under_y_offset", 0);
	}
	else
	{
		climb_under_y_offset = 0;
	}
	#endregion /*Climb under y offset END*/
	
	#region /*Sprite climb under still x and y origin points*/
	#region /*Sprite climb under still x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_still_xorig"))
	{
		sprite_climb_under_still_xorig = ini_read_real("sprite origin points", "sprite_climb_under_still_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_still_xorig", 0);
		sprite_climb_under_still_xorig = 0;
	}
	#endregion /*Sprite climb under still x origin point END*/

	#region /*Sprite climb under still y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_still_yorig"))
	{
		sprite_climb_under_still_yorig = ini_read_real("sprite origin points", "sprite_climb_under_still_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_still_yorig", 0);
		sprite_climb_under_still_yorig = 0;
	}
	#endregion /*Sprite climb under still y origin point END*/
	#endregion /*Sprite climb under still x and y origin points END*/

	#region /*Sprite climb under x and y origin points*/
	#region /*Sprite climb under x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_xorig"))
	{
		sprite_climb_under_xorig = ini_read_real("sprite origin points", "sprite_climb_under_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_xorig", 0);
		sprite_climb_under_xorig = 0;
	}
	#endregion /*Sprite climb under x origin point END*/

	#region /*Sprite climb under y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_yorig"))
	{
		sprite_climb_under_yorig = ini_read_real("sprite origin points", "sprite_climb_under_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_yorig", 0);
		sprite_climb_under_yorig = 0;
	}
	#endregion /*Sprite climb under y origin point END*/
	#endregion /*Sprite climb under x and y origin points END*/

	#region /*Sprite climb under look up x and y origin points*/
	#region /*Sprite climb under look up x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_look_up_xorig"))
	{
		sprite_climb_under_look_up_xorig = ini_read_real("sprite origin points", "sprite_climb_under_look_up_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_look_up_xorig", 0);
		sprite_climb_under_look_up_xorig = 0;
	}
	#endregion /*Sprite climb under look up x origin point END*/

	#region /*Sprite climb under look up y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_look_up_yorig"))
	{
		sprite_climb_under_look_up_yorig = ini_read_real("sprite origin points", "sprite_climb_under_look_up_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_look_up_yorig", 0);
		sprite_climb_under_look_up_yorig = 0;
	}
	#endregion /*Sprite climb under look up y origin point END*/
	#endregion /*Sprite climb under look up x and y origin points END*/

	#region /*Sprite climb under spin x and y origin points*/
	#region /*Sprite climb under spin x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_spin_xorig"))
	{
		sprite_climb_under_spin_xorig = ini_read_real("sprite origin points", "sprite_climb_under_spin_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_spin_xorigrite_stand_xorig", 0);
		sprite_climb_under_spin_xorig = 0;
	}
	#endregion /*Sprite climb under spin x origin point END*/

	#region /*Sprite climb under spin y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_spin_yorig"))
	{
		sprite_climb_under_spin_yorig = ini_read_real("sprite origin points", "sprite_climb_under_spin_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_spin_yorig", 0);
		sprite_climb_under_spin_yorig = 0;
	}
	#endregion /*Sprite climb under spin y origin point END*/
	#endregion /*Sprite climb under spin x and y origin points END*/

	#region /*Sprite climb under spin fast x and y origin points*/
	#region /*Sprite climb under spin fast x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_spin_fast_xorig"))
	{
		sprite_climb_under_spin_fast_xorig = ini_read_real("sprite origin points", "sprite_climb_under_spin_fast_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_spin_fast_xorig", 0);
		sprite_climb_under_spin_fast_xorig = 0;
	}
	#endregion /*Sprite climb under spin fast x origin point END*/

	#region /*Sprite climb under spin fast y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_climb_under_spin_fast_yorig"))
	{
		sprite_climb_under_spin_fast_yorig = ini_read_real("sprite origin points", "sprite_climb_under_spin_fast_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_climb_under_spin_fast_yorig", 0);
		sprite_climb_under_spin_fast_yorig = 0;
	}
	#endregion /*Sprite climb under spin fast y origin point END*/
	#endregion /*Sprite climb under spin fast x and y origin points END*/

	#region /*Sprite ground pound x and y origin points*/
	#region /*Sprite ground pound x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_ground_pound_xorig"))
	{
		sprite_ground_pound_xorig = ini_read_real("sprite origin points", "sprite_ground_pound_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_ground_pound_xorig", 0);
		sprite_ground_pound_xorig = 0;
	}
	#endregion /*Sprite ground pound x origin point END*/

	#region /*Sprite ground pound y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_ground_pound_yorig"))
	{
		sprite_ground_pound_yorig = ini_read_real("sprite origin points", "sprite_ground_pound_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_ground_pound_yorig", 0);
		sprite_ground_pound_yorig = 0;
	}
	#endregion /*Sprite ground pound y origin point END*/
	#endregion /*Sprite ground pound x and y origin points END*/

	#region /*Sprite ground pound get up x and y origin points*/
	#region /*Sprite ground pound get up x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_ground_pound_get_up_xorig"))
	{
		sprite_ground_pound_get_up_xorig = ini_read_real("sprite origin points", "sprite_ground_pound_get_up_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_ground_pound_get_up_xorig", 0);
		sprite_ground_pound_get_up_xorig = 0;
	}
	#endregion /*Sprite ground pound get up x origin point END*/

	#region /*Sprite ground pound get up y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_ground_pound_get_up_yorig"))
	{
		sprite_ground_pound_get_up_yorig = ini_read_real("sprite origin points", "sprite_ground_pound_get_up_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_ground_pound_get_up_yorig", 0);
		sprite_ground_pound_get_up_yorig = 0;
	}
	#endregion /*Sprite ground pound get up y origin point END*/
	#endregion /*Sprite ground pound get up x and y origin points END*/

	#region /*Sprite stomp spin x and y origin points*/
	#region /*Sprite stomp spin x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stomp_spin_xorig"))
	{
		sprite_stomp_spin_xorig = ini_read_real("sprite origin points", "sprite_stomp_spin_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_stomp_spin_xorig", 0);
		sprite_stomp_spin_xorig = 0;
	}
	#endregion /*Sprite stomp spin x origin point END*/

	#region /*Sprite stomp spin y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stomp_spin_yorig"))
	{
		sprite_stomp_spin_yorig = ini_read_real("sprite origin points", "sprite_stomp_spin_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_stomp_spin_yorig", 0);
		sprite_stomp_spin_yorig = 0;
	}
	#endregion /*Sprite stomp spin y origin point END*/
	#endregion /*Sprite stomp spin x and y origin points END*/
	
	#region /*Sprite spring up x and y origin points*/
	#region /*Sprite spring up x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_spring_up_xorig"))
	{
		sprite_spring_up_xorig = ini_read_real("sprite origin points", "sprite_spring_up_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_spring_up_xorig", 0);
		sprite_spring_up_xorig = 0;
	}
	#endregion /*Sprite spring up x origin point END*/

	#region /*Sprite spring up y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_spring_up_yorig"))
	{
		sprite_spring_up_yorig = ini_read_real("sprite origin points", "sprite_spring_up_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_spring_up_yorig", 0);
		sprite_spring_up_yorig = 0;
	}
	#endregion /*Sprite spring up y origin point END*/
	#endregion /*Sprite spring up x and y origin points END*/
	
	#region /*Sprite spring transition x and y origin points*/
	#region /*Sprite spring transition x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_spring_transition_xorig"))
	{
		sprite_spring_transition_xorig = ini_read_real("sprite origin points", "sprite_spring_transition_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_spring_transition_xorig", 0);
		sprite_spring_transition_xorig = 0;
	}
	#endregion /*Sprite spring transition x origin point END*/

	#region /*Sprite spring transition y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_spring_transition_yorig"))
	{
		sprite_spring_transition_yorig = ini_read_real("sprite origin points", "sprite_spring_transition_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_spring_transition_yorig", 0);
		sprite_spring_transition_yorig = 0;
	}
	#endregion /*Sprite spring transition y origin point END*/
	#endregion /*Sprite spring transition x and y origin points END*/
	
	#region /*Sprite spring down x and y origin points*/
	#region /*Sprite spring down x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_spring_down_xorig"))
	{
		sprite_spring_down_xorig = ini_read_real("sprite origin points", "sprite_spring_down_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_spring_down_xorig", 0);
		sprite_spring_down_xorig = 0;
	}
	#endregion /*Sprite spring down x origin point END*/

	#region /*Sprite spring down y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_spring_down_yorig"))
	{
		sprite_spring_down_yorig = ini_read_real("sprite origin points", "sprite_spring_down_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_spring_down_yorig", 0);
		sprite_spring_down_yorig = 0;
	}
	#endregion /*Sprite spring down y origin point END*/
	#endregion /*Sprite spring down x and y origin points END*/
	
	#region /*Sprite wall slide x and y origin points*/
	#region /*Sprite wall slide x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_wall_slide_xorig"))
	{
		sprite_wall_slide_xorig = ini_read_real("sprite origin points", "sprite_wall_slide_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_wall_slide_xorig", 0);
		sprite_wall_slide_xorig = 0;
	}
	#endregion /*Sprite wall slide x origin point END*/

	#region /*Sprite wall slide y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_wall_slide_yorig"))
	{
		sprite_wall_slide_yorig = ini_read_real("sprite origin points", "sprite_wall_slide_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_wall_slide_yorig", 0);
		sprite_wall_slide_yorig = 0;
	}
	#endregion /*Sprite wall slide y origin point END*/
	#endregion /*Sprite wall slide x and y origin points END*/

	#region /*Sprite wall slide up x and y origin points*/
	#region /*Sprite wall slide up x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_wall_slide_up_xorig"))
	{
		sprite_wall_slide_up_xorig = ini_read_real("sprite origin points", "sprite_wall_slide_up_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_wall_slide_up_xorig", 0);
		sprite_wall_slide_up_xorig = 0;
	}
	#endregion /*Sprite wall slide up x origin point END*/

	#region /*Sprite wall slide up y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_wall_slide_up_yorig"))
	{
		sprite_wall_slide_up_yorig = ini_read_real("sprite origin points", "sprite_wall_slide_up_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_wall_slide_up_yorig", 0);
		sprite_wall_slide_up_yorig = 0;
	}
	#endregion /*Sprite wall slide up y origin point END*/
	#endregion /*Sprite wall slide up x and y origin points END*/

	#region /*Sprite wall slide down x and y origin points*/
	#region /*Sprite wall slide down x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_wall_slide_down_xorig"))
	{
		sprite_wall_slide_down_xorig = ini_read_real("sprite origin points", "sprite_wall_slide_down_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_wall_slide_down_xorig", 0);
		sprite_wall_slide_down_xorig = 0;
	}
	#endregion /*Sprite wall slide down x origin point END*/

	#region /*Sprite wall slide down y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_wall_slide_down_yorig"))
	{
		sprite_wall_slide_down_yorig = ini_read_real("sprite origin points", "sprite_wall_slide_down_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_wall_slide_down_yorig", 0);
		sprite_wall_slide_down_yorig = 0;
	}
	#endregion /*Sprite wall slide down y origin point END*/
	#endregion /*Sprite wall slide down x and y origin points END*/

	#region /*Sprite dive x and y origin points*/
	#region /*Sprite dive x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_dive_xorig"))
	{
		sprite_dive_xorig = ini_read_real("sprite origin points", "sprite_dive_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_dive_xorig", 0);
		sprite_dive_xorig = 0;
	}
	#endregion /*Sprite dive x origin point END*/

	#region /*Sprite dive y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_dive_yorig"))
	{
		sprite_dive_yorig = ini_read_real("sprite origin points", "sprite_dive_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_dive_yorig", 0);
		sprite_dive_yorig = 0;
	}
	#endregion /*Sprite dive y origin point END*/
	#endregion /*Sprite dive x and y origin points END*/

	#region /*Sprite die x and y origin points*/
	#region /*Sprite die x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_die_xorig"))
	{
		sprite_die_xorig = ini_read_real("sprite origin points", "sprite_die_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_die_xorig", 0);
		sprite_die_xorig = 0;
	}
	#endregion /*Sprite die x origin point END*/
	
	#region /*Sprite die y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_die_yorig"))
	{
		sprite_die_yorig = ini_read_real("sprite origin points", "sprite_die_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_die_yorig", 0);
		sprite_die_yorig = 0;
	}
	#endregion /*Sprite die y origin point END*/
	#endregion /*Sprite die x and y origin points END*/
	
	#region /*Sprite game over character portrait x and y origin points*/
	#region /*Sprite game over character portrait x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_game_over_character_portrait_xorig"))
	{
		sprite_game_over_character_portrait_xorig = ini_read_real("sprite origin points", "sprite_game_over_character_portrait_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_game_over_character_portrait_xorig", 0);
		sprite_game_over_character_portrait_xorig = 0;
	}
	#endregion /*Sprite game over character portrait x origin point END*/

	#region /*Sprite game over character portrait y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_game_over_character_portrait_yorig"))
	{
		sprite_game_over_character_portrait_yorig = ini_read_real("sprite origin points", "sprite_game_over_character_portrait_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_game_over_character_portrait_yorig", 0);
		sprite_game_over_character_portrait_yorig = 0;
	}
	#endregion /*Sprite game over character portrait y origin point END*/
	#endregion /*Sprite game over character portrait x and y origin points END*/
	
	#region /*Sprite vine climb x and y origin points*/
	#region /*Sprite vine climb x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_vine_climb_xorig"))
	{
		sprite_vine_climb_xorig = ini_read_real("sprite origin points", "sprite_vine_climb_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_vine_climb_xorig", 0);
		sprite_vine_climb_xorig = 0;
	}
	#endregion /*Sprite vine climb x origin point END*/

	#region /*Sprite vine climb y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_vine_climb_yorig"))
	{
		sprite_vine_climb_yorig = ini_read_real("sprite origin points", "sprite_vine_climb_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_vine_climb_yorig", 0);
		sprite_vine_climb_yorig = 0;
	}
	#endregion /*Sprite vine climb y origin point END*/
	#endregion /*Sprite vine climb x and y origin points END*/

	#region /*Sprite vine stay x and y origin points*/
	#region /*Sprite vine stay x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_vine_stay_xorig"))
	{
		sprite_vine_stay_xorig = ini_read_real("sprite origin points", "sprite_vine_stay_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_vine_stay_xorig", 0);
		sprite_vine_stay_xorig = 0;
	}
	#endregion /*Sprite vine stay x origin point END*/

	#region /*Sprite vine stay y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_vine_stay_yorig"))
	{
		sprite_vine_stay_yorig = ini_read_real("sprite origin points", "sprite_vine_stay_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_vine_stay_yorig", 0);
		sprite_vine_stay_yorig = 0;
	}
	#endregion /*Sprite vine stay y origin point END*/
	#endregion /*Sprite vine stay x and y origin points END*/
	
	#region /*Cutscene specific origin points*/
	
	#region /*Sprite sitting down to eat x and y origin points*/
	#region /*Sprite sitting down to eat x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_down_to_eat_xorig"))
	{
		sprite_sitting_down_to_eat_xorig = ini_read_real("sprite origin points", "sprite_sitting_down_to_eat_xorig", 0);
	}
	else
	{
		sprite_sitting_down_to_eat_xorig = 0;
	}
	#endregion /*Sprite sitting down to eat x origin point END*/
	
	#region /*Sprite sitting down to eat y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_down_to_eat_yorig"))
	{
		sprite_sitting_down_to_eat_yorig = ini_read_real("sprite origin points", "sprite_sitting_down_to_eat_yorig", 0);
	}
	else
	{
		sprite_sitting_down_to_eat_yorig = 0;
	}
	#endregion /*Sprite sitting down to eat y origin point END*/
	#endregion /*Sprite sitting down to eat x and y origin points END*/
	
	#region /*Sprite sitting eat closed mouth x and y origin points*/
	#region /*Sprite sitting eat closed mouth x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_closed_mouth_xorig"))
	{
		sprite_sitting_eat_closed_mouth_xorig = ini_read_real("sprite origin points", "sprite_sitting_eat_closed_mouth_xorig", 0);
	}
	else
	{
		sprite_sitting_eat_closed_mouth_xorig = 0;
	}
	#endregion /*Sprite sitting eat closed mouth x origin point END*/
	
	#region /*Sprite sitting eat closed mouth y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_closed_mouth_yorig"))
	{
		sprite_sitting_eat_closed_mouth_yorig = ini_read_real("sprite origin points", "sprite_sitting_eat_closed_mouth_yorig", 0);
	}
	else
	{
		sprite_sitting_eat_closed_mouth_yorig = 0;
	}
	#endregion /*Sprite sitting eat closed mouth y origin point END*/
	#endregion /*Sprite sitting eat closed mouth x and y origin points END*/
	
	#region /*Sprite sitting eat open mouth x and y origin points*/
	#region /*Sprite sitting eat open mouth x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_open_mouth_xorig"))
	{
		sprite_sitting_eat_open_mouth_xorig = ini_read_real("sprite origin points", "sprite_sitting_eat_open_mouth_xorig", 0);
	}
	else
	{
		sprite_sitting_eat_open_mouth_xorig = 0;
	}
	#endregion /*Sprite sitting eat open mouth x origin point END*/
	
	#region /*Sprite sitting eat open mouth y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_open_mouth_yorig"))
	{
		sprite_sitting_eat_open_mouth_yorig = ini_read_real("sprite origin points", "sprite_sitting_eat_open_mouth_yorig", 0);
	}
	else
	{
		sprite_sitting_eat_open_mouth_yorig = 0;
	}
	#endregion /*Sprite sitting eat open mouth y origin point END*/
	#endregion /*Sprite sitting eat open mouth x and y origin points END*/
	
	#region /*Sprite sitting eat open mouth open eye x and y origin points*/
	#region /*Sprite sitting eat open mouth open eye x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_open_mouth_open_eye_xorig"))
	{
		sprite_sitting_eat_open_mouth_open_eye_xorig = ini_read_real("sprite origin points", "sprite_sitting_eat_open_mouth_open_eye_xorig", 0);
	}
	else
	{
		sprite_sitting_eat_open_mouth_open_eye_xorig = 0;
	}
	#endregion /*Sprite sitting eat open mouth open eye x origin point END*/
	
	#region /*Sprite sitting eat open mouth open eye y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_open_mouth_open_eye_yorig"))
	{
		sprite_sitting_eat_open_mouth_open_eye_yorig = ini_read_real("sprite origin points", "sprite_sitting_eat_open_mouth_open_eye_yorig", 0);
	}
	else
	{
		sprite_sitting_eat_open_mouth_open_eye_yorig = 0;
	}
	#endregion /*Sprite sitting eat open mouth open eye y origin point END*/
	#endregion /*Sprite sitting eat open mouth open eye x and y origin points END*/
	
	#region /*Sprite sitting eat surprised x and y origin points*/
	#region /*Sprite sitting eat surprised x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_surprised_xorig"))
	{
		sprite_sitting_eat_surprised_xorig = ini_read_real("sprite origin points", "sprite_sitting_eat_surprised_xorig", 0);
	}
	else
	{
		sprite_sitting_eat_surprised_xorig = 0;
	}
	#endregion /*Sprite sitting eat surprised x origin point END*/
	
	#region /*Sprite sitting eat surprised y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eat_surprised_yorig"))
	{
		sprite_sitting_eat_surprised_yorig = ini_read_real("sprite origin points", "sprite_sitting_eat_surprised_yorig", 0);
	}
	else
	{
		sprite_sitting_eat_surprised_yorig = 0;
	}
	#endregion /*Sprite sitting eat surprised y origin point END*/
	#endregion /*Sprite sitting eat surprised x and y origin points END*/
	
	#region /*Sprite sitting eating x and y origin points*/
	#region /*Sprite sitting eating x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eating_xorig"))
	{
		sprite_sitting_eating_xorig = ini_read_real("sprite origin points", "sprite_sitting_eating_xorig", 0);
	}
	else
	{
		sprite_sitting_eating_xorig = 0;
	}
	#endregion /*Sprite sitting eating x origin point END*/
	
	#region /*Sprite sitting eating y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_sitting_eating_yorig"))
	{
		sprite_sitting_eating_yorig = ini_read_real("sprite origin points", "sprite_sitting_eating_yorig", 0);
	}
	else
	{
		sprite_sitting_eating_yorig = 0;
	}
	#endregion /*Sprite sitting eating y origin point END*/
	#endregion /*Sprite sitting eating x and y origin points END*/
	
	#endregion /*Cutscene specific origin points END*/
	
	ini_close();
}
else

#region /*If there is no config.ini file, then make every xorig and yorig variable zero*/
{
	mask_xorig = 0;
	mask_yorig = 0;
	mask_crouch_xorig = 0;
	mask_crouch_yorig = 0;

	sprite_against_wall_xorig = 0;
	sprite_against_wall_yorig = 0;
	sprite_climb_under_look_up_xorig = 0;
	sprite_climb_under_look_up_yorig = 0;
	sprite_climb_under_spin_fast_xorig = 0;
	sprite_climb_under_spin_fast_yorig = 0;
	sprite_climb_under_spin_xorig = 0;
	sprite_climb_under_spin_yorig = 0;
	sprite_climb_under_still_xorig = 0;
	sprite_climb_under_still_yorig = 0;
	sprite_climb_under_xorig = 0;
	sprite_climb_under_yorig = 0;
	sprite_crawl_xorig = 0;
	sprite_crawl_yorig = 0;
	sprite_crouch_fall_xorig = 0;
	sprite_crouch_fall_yorig = 0;
	sprite_crouch_jump_xorig = 0;
	sprite_crouch_jump_yorig = 0;
	sprite_crouch_xorig = 0;
	sprite_crouch_yorig = 0;
	sprite_die_xorig = 0;
	sprite_die_yorig = 0;
	sprite_game_over_character_portrait_xorig = 0;
	sprite_game_over_character_portrait_yorig = 0;
	sprite_dive_xorig = 0;
	sprite_dive_yorig = 0;
	sprite_double_jump_xorig = 0;
	sprite_double_jump_yorig = 0;
	sprite_triple_jump_xorig = 0;
	sprite_triple_jump_yorig = 0;
	sprite_fall_slower_xorig = 0;
	sprite_fall_slower_yorig = 0;
	sprite_fall_xorig = 0;
	sprite_fall_yorig = 0;
	sprite_ground_pound_get_up_xorig = 0;
	sprite_ground_pound_get_up_yorig = 0;
	sprite_ground_pound_xorig = 0;
	sprite_ground_pound_yorig = 0;
	sprite_jump_xorig = 0;
	sprite_jump_yorig = 0;
	sprite_look_up_xorig = 0;
	sprite_look_up_yorig = 0;
	sprite_look_up_start_xorig = 0;
	sprite_look_up_start_yorig = 0;
	sprite_run_xorig = 0;
	sprite_run_yorig = 0;
	sprite_run2_xorig = 0;
	sprite_run2_yorig = 0;
	sprite_run3_xorig = 0;
	sprite_run3_yorig = 0;
	sprite_run4_xorig = 0;
	sprite_run4_yorig = 0;
	sprite_skidding_xorig = 0;
	sprite_skidding_yorig = 0;
	sprite_skidding_ice_xorig = 0;
	sprite_skidding_ice_yorig = 0;
	sprite_stand_cold_xorig = 0;
	sprite_stand_cold_yorig = 0;
	sprite_stand_xorig = 0;
	sprite_stand_yorig = 0;
	sprite_standing_on_something_xorig = 0;
	sprite_standing_on_something_yorig = 0;
	sprite_stomp_spin_xorig = 0;
	sprite_stomp_spin_yorig = 0;
	sprite_swim_fall_xorig = 0;
	sprite_swim_fall_yorig = 0;
	sprite_swim_xorig = 0;
	sprite_swim_yorig = 0;
	sprite_swim_stand_xorig = 0;
	sprite_swim_stand_yorig = 0;
	sprite_vine_climb_xorig = 0;
	sprite_vine_climb_yorig = 0;
	sprite_vine_stay_xorig = 0;
	sprite_vine_stay_yorig = 0;
	sprite_walk_xorig = 0;
	sprite_walk_yorig = 0;
	sprite_wall_slide_down_xorig = 0;
	sprite_wall_slide_down_yorig = 0;
	sprite_wall_slide_up_xorig = 0;
	sprite_wall_slide_up_yorig = 0;
	sprite_wall_slide_xorig = 0;
	sprite_wall_slide_yorig = 0;
	sprite_sitting_down_to_eat_xorig = 0;
	sprite_sitting_down_to_eat_yorig = 0;
	sprite_sitting_eat_closed_mouth_xorig = 0;
	sprite_sitting_eat_closed_mouth_yorig = 0;
	sprite_sitting_eat_open_mouth_xorig = 0;
	sprite_sitting_eat_open_mouth_yorig = 0;
	sprite_sitting_eat_open_mouth_open_eye_xorig = 0;
	sprite_sitting_eat_open_mouth_open_eye_yorig = 0;
	sprite_sitting_eat_surprised_xorig = 0;
	sprite_sitting_eat_surprised_yorig = 0;
	sprite_sitting_eating_xorig = 0;
	sprite_sitting_eating_yorig = 0;
}
#endregion /*If there is no config.ini file, then make every xorig and yorig variable zero END*/

#endregion /*Sprite origin point variables END*/

sprite_mask = scr_initialize_custom_character_sprite("mask", sprite_mask, mask_xorig, mask_yorig);
sprite_mask_crouch = scr_initialize_custom_character_sprite("mask_crouch", sprite_mask, mask_crouch_xorig, mask_crouch_yorig);

#region /*Sprite variables*/

sprite_stand = scr_initialize_custom_character_sprite("stand", sprite_stand, sprite_stand_xorig, sprite_stand_yorig);
sprite_stand_cold = scr_initialize_custom_character_sprite("stand_cold", sprite_stand_cold, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
sprite_stand_cold = scr_initialize_custom_character_sprite("cold", sprite_stand_cold, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
sprite_standing_on_something = scr_initialize_custom_character_sprite("standing_on_something", sprite_standing_on_something, sprite_standing_on_something_xorig, sprite_standing_on_something_yorig);
sprite_look_up = scr_initialize_custom_character_sprite("look_up", sprite_look_up, sprite_look_up_xorig, sprite_look_up_yorig);
sprite_look_up = scr_initialize_custom_character_sprite("lookup", sprite_look_up, sprite_look_up_xorig, sprite_look_up_yorig);
sprite_look_up_start = scr_initialize_custom_character_sprite("look_up_start", sprite_look_up_start, sprite_look_up_start_xorig, sprite_look_up_start_yorig);
sprite_crouch = scr_initialize_custom_character_sprite("crouch", sprite_crouch, sprite_crouch_xorig, sprite_crouch_yorig);
sprite_crouch = scr_initialize_custom_character_sprite("squat", sprite_crouch, sprite_crouch_xorig, sprite_crouch_yorig);
sprite_crouch_crawl = scr_initialize_custom_character_sprite("crawl", sprite_crouch_crawl, sprite_crawl_xorig, sprite_crawl_yorig);
sprite_crouch_crawl = scr_initialize_custom_character_sprite("crouch_crawl", sprite_crouch_crawl, sprite_crawl_xorig, sprite_crawl_yorig);
sprite_crouch_crawl = scr_initialize_custom_character_sprite("squat_crawl", sprite_crouch_crawl, sprite_crawl_xorig, sprite_crawl_yorig);
sprite_crouch_jump = scr_initialize_custom_character_sprite("crouch_jump", sprite_crouch_jump, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
sprite_crouch_jump = scr_initialize_custom_character_sprite("squat_jump", sprite_crouch_jump, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
sprite_crouch_fall = scr_initialize_custom_character_sprite("crouch_fall", sprite_crouch_fall, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
sprite_crouch_fall = scr_initialize_custom_character_sprite("squat_fall", sprite_crouch_fall, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
sprite_skidding = scr_initialize_custom_character_sprite("skidding", sprite_skidding, sprite_skidding_xorig, sprite_skidding_yorig);
sprite_skidding = scr_initialize_custom_character_sprite("slip", sprite_skidding, sprite_skidding_xorig, sprite_skidding_yorig);
sprite_skidding = scr_initialize_custom_character_sprite("slip", sprite_skidding, sprite_skidding_xorig, sprite_skidding_yorig);
sprite_skidding_ice = scr_initialize_custom_character_sprite("skidding_ice", sprite_skidding_ice, sprite_skidding_ice_xorig, sprite_skidding_ice_yorig);
sprite_swim_stand = scr_initialize_custom_character_sprite("swim_stand", sprite_swim_stand, sprite_swim_stand_xorig, sprite_swim_stand_yorig);
sprite_swim_stand = scr_initialize_custom_character_sprite("swim_stand", sprite_swim_stand, sprite_swim_stand_xorig, sprite_swim_stand_yorig);
sprite_swim = scr_initialize_custom_character_sprite("swim", sprite_swim, sprite_swim_xorig, sprite_swim_yorig);
sprite_swim_fall = scr_initialize_custom_character_sprite("swim_fall", sprite_swim_fall, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
sprite_swim_fall = scr_initialize_custom_character_sprite("swim_falling", sprite_swim_fall, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
sprite_against_wall = scr_initialize_custom_character_sprite("against_wall", sprite_against_wall, sprite_against_wall_xorig, sprite_against_wall_yorig);
sprite_against_wall = scr_initialize_custom_character_sprite("againstwall", sprite_against_wall, sprite_against_wall_xorig, sprite_against_wall_yorig);
sprite_walk = scr_initialize_custom_character_sprite("walk", sprite_walk, sprite_walk_xorig, sprite_walk_yorig);
sprite_run = scr_initialize_custom_character_sprite("run", sprite_run, sprite_run_xorig, sprite_run_yorig);
sprite_run = scr_initialize_custom_character_sprite("dash", sprite_run, sprite_run_xorig, sprite_run_yorig);
sprite_run2 = scr_initialize_custom_character_sprite("run2", sprite_run2, sprite_run2_xorig, sprite_run2_yorig);
sprite_run2 = scr_initialize_custom_character_sprite("dash2", sprite_run2, sprite_run2_xorig, sprite_run2_yorig);
sprite_run3 = scr_initialize_custom_character_sprite("run3", sprite_run3, sprite_run3_xorig, sprite_run3_yorig);
sprite_run3 = scr_initialize_custom_character_sprite("dash3", sprite_run3, sprite_run3_xorig, sprite_run3_yorig);
sprite_run4 = scr_initialize_custom_character_sprite("run4", sprite_run4, sprite_run4_xorig, sprite_run4_yorig);
sprite_run4 = scr_initialize_custom_character_sprite("dash4", sprite_run4, sprite_run4_xorig, sprite_run4_yorig);
sprite_jump = scr_initialize_custom_character_sprite("jump", sprite_jump, sprite_jump_xorig, sprite_jump_yorig);
sprite_double_jump = scr_initialize_custom_character_sprite("double_jump", sprite_double_jump, sprite_double_jump_xorig, sprite_double_jump_yorig);
sprite_double_jump = scr_initialize_custom_character_sprite("doublejump", sprite_double_jump, sprite_double_jump_xorig, sprite_double_jump_yorig);
sprite_triple_jump = scr_initialize_custom_character_sprite("triple_jump", sprite_triple_jump, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
sprite_triple_jump = scr_initialize_custom_character_sprite("triplejump", sprite_triple_jump, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
sprite_fall = scr_initialize_custom_character_sprite("fall", sprite_fall, sprite_fall_xorig, sprite_fall_yorig);
sprite_fall_slower = scr_initialize_custom_character_sprite("fall_slower", sprite_fall_slower, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
sprite_fall_slower = scr_initialize_custom_character_sprite("fallslower", sprite_fall_slower, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
sprite_climb_under_still = scr_initialize_custom_character_sprite("climb_under_still", sprite_climb_under_still, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
sprite_climb_under_still = scr_initialize_custom_character_sprite("climbunder_still", sprite_climb_under_still, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
sprite_climb_under = scr_initialize_custom_character_sprite("climb_under", sprite_climb_under, sprite_climb_under_xorig, sprite_climb_under_yorig);
sprite_climb_under = scr_initialize_custom_character_sprite("climbunder", sprite_climb_under, sprite_climb_under_xorig, sprite_climb_under_yorig);
sprite_climb_under_look_up = scr_initialize_custom_character_sprite("climb_under_look_up", sprite_climb_under_look_up, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
sprite_climb_under_look_up = scr_initialize_custom_character_sprite("climbunder_lookup", sprite_climb_under_look_up, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
sprite_climb_under_spin = scr_initialize_custom_character_sprite("climb_under_spin", sprite_climb_under_spin, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
sprite_climb_under_spin = scr_initialize_custom_character_sprite("climbunder_spin", sprite_climb_under_spin, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
sprite_climb_under_spin_fast = scr_initialize_custom_character_sprite("climb_under_spin_fast", sprite_climb_under_spin_fast, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
sprite_climb_under_spin_fast = scr_initialize_custom_character_sprite("climbunder_spin_fast", sprite_climb_under_spin_fast, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
sprite_ground_pound = scr_initialize_custom_character_sprite("ground_pound", sprite_ground_pound, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
sprite_ground_pound = scr_initialize_custom_character_sprite("groundpound", sprite_ground_pound, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
sprite_ground_pound_get_up = scr_initialize_custom_character_sprite("ground_pound_get_up", sprite_ground_pound_get_up, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
sprite_ground_pound_get_up = scr_initialize_custom_character_sprite("groundpound_getup", sprite_ground_pound_get_up, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
sprite_stomp_spin = scr_initialize_custom_character_sprite("stomp_spin", sprite_stomp_spin, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
sprite_stomp_spin = scr_initialize_custom_character_sprite("stompspin", sprite_stomp_spin, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
sprite_spring_up = scr_initialize_custom_character_sprite("spring_up", sprite_spring_up, sprite_spring_up_xorig, sprite_spring_up_yorig);
sprite_spring_transition = scr_initialize_custom_character_sprite("spring_transition", sprite_spring_transition, sprite_spring_transition_xorig, sprite_spring_transition_yorig);
sprite_spring_down = scr_initialize_custom_character_sprite("spring_down", sprite_spring_down, sprite_spring_down_xorig, sprite_spring_down_yorig);
sprite_wall_slide = scr_initialize_custom_character_sprite("wall_slide", sprite_wall_slide, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
sprite_wall_slide = scr_initialize_custom_character_sprite("wallslide", sprite_wall_slide, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
sprite_wall_slide_up = scr_initialize_custom_character_sprite("wall_slide_up", sprite_wall_slide_up, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
sprite_wall_slide_up = scr_initialize_custom_character_sprite("wallslide_up", sprite_wall_slide_up, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
sprite_wall_slide_down = scr_initialize_custom_character_sprite("wall_slide_down", sprite_wall_slide_down, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
sprite_wall_slide_down = scr_initialize_custom_character_sprite("wallslide_down", sprite_wall_slide_down, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
sprite_dive = scr_initialize_custom_character_sprite("dive", sprite_dive, sprite_dive_xorig, sprite_dive_yorig);
sprite_die = scr_initialize_custom_character_sprite("die", sprite_die, sprite_die_xorig, sprite_die_yorig);
sprite_game_over_character_portrait = scr_initialize_custom_character_sprite("game_over_character_portrait", sprite_game_over_character_portrait, sprite_game_over_character_portrait_xorig, sprite_game_over_character_portrait_yorig);
sprite_vine_climb = scr_initialize_custom_character_sprite("vine_climb", sprite_vine_climb, sprite_vine_climb_xorig, sprite_vine_climb_yorig);
sprite_vine_stay = scr_initialize_custom_character_sprite("vine_stay", sprite_vine_stay, sprite_vine_stay_xorig, sprite_vine_stay_yorig);

#region /*Cutscene Specific Sprites*/
sprite_sitting_down_to_eat = scr_initialize_custom_character_sprite("sitting_down_to_eat", sprite_sitting_down_to_eat, sprite_sitting_down_to_eat_xorig, sprite_sitting_down_to_eat_yorig);
sprite_sitting_eat_closed_mouth = scr_initialize_custom_character_sprite("sitting_eat_closed_mouth", sprite_sitting_eat_closed_mouth, sprite_sitting_eat_closed_mouth_xorig, sprite_sitting_eat_closed_mouth_yorig);
sprite_sitting_eat_open_mouth = scr_initialize_custom_character_sprite("sitting_eat_open_mouth", sprite_sitting_eat_open_mouth, sprite_sitting_eat_open_mouth_xorig, sprite_sitting_eat_open_mouth_yorig);
sprite_sitting_eat_open_mouth_open_eye = scr_initialize_custom_character_sprite("sitting_eat_open_mouth_open_eye", sprite_sitting_eat_open_mouth_open_eye, sprite_sitting_eat_open_mouth_open_eye_xorig, sprite_sitting_eat_open_mouth_open_eye_yorig);
sprite_sitting_eat_surprised = scr_initialize_custom_character_sprite("sitting_eat_surprised", sprite_sitting_eat_surprised, sprite_sitting_eat_surprised_xorig, sprite_sitting_eat_surprised_yorig);
sprite_sitting_eating = scr_initialize_custom_character_sprite("sitting_eating", sprite_sitting_eating, sprite_sitting_eating_xorig, sprite_sitting_eating_yorig);
#region /*Cutscene Specific Sprites*/

#endregion /*Sprite variables END*/

#region /*Sound variables*/

#region /*Voices*/

#region /*Voice Wall Jump*/

#region /*Voice Wall Jump 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick1.ogg");
}
else
{
	voice_wall_jump_1 = noone;
}
#endregion /*Voice Wall Jump 1 END*/

#region /*Voice Wall Jump 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick2.ogg");
}
else
{
	voice_wall_jump_2 = noone;
}
#endregion /*Voice Wall Jump 2 END*/

#region /*Voice Wall Jump 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick3.ogg");
}
else
{
	voice_wall_jump_3 = noone;
}
#endregion /*Voice Wall Jump 3 END*/

#region /*Voice Wall Jump 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick4.ogg");
}
else
{
	voice_wall_jump_4 = noone;
}
#endregion /*Voice Wall Jump 4 END*/

#region /*Voice Wall Jump 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick5.ogg");
}
else
{
	voice_wall_jump_5 = noone;
}
#endregion /*Voice Wall Jump 5 END*/

#region /*Voice Wall Jump 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick6.ogg");
}
else
{
	voice_wall_jump_6 = noone;
}
#endregion /*Voice Wall Jump 6 END*/

#region /*Voice Wall Jump 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick7.ogg");
}
else
{
	voice_wall_jump_7 = noone;
}
#endregion /*Voice Wall Jump 7 END*/

#region /*Voice Wall Jump 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick8.ogg");
}
else
{
	voice_wall_jump_8 = noone;
}
#endregion /*Voice Wall Jump 8 END*/

#region /*Voice Wall Jump 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick9.ogg");
}
else
{
	voice_wall_jump_9 = noone;
}
#endregion /*Voice Wall Jump 9 END*/

#region /*Voice Wall Jump 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_jump10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/walljump10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wall_kick10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/wallkick10.ogg");
}
else
{
	voice_wall_jump_10 = noone;
}
#endregion /*Voice Wall Jump 10 END*/

#endregion /*Voice Wall Jump END*/

#region /*Voice Start Running*/

#region /*Voice Start Running 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_dash1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startdash.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/startrunning1.ogg");
}
else
{
	voice_start_running_1 = noone;
}
#endregion /*Voice Start Running 1 END*/

#region /*Voice Start Running 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_2.ogg"))
{
	voice_start_running_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running2.ogg"))
{
	voice_start_running_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_2.ogg"))
{
	voice_start_running_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running2.ogg"))
{
	voice_start_running_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running2.ogg");
}
else
{
	voice_start_running_2 = noone;
}
#endregion /*Voice Start Running 2 END*/

#region /*Voice Start Running 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_3.ogg"))
{
	voice_start_running_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running3.ogg"))
{
	voice_start_running_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_3.ogg"))
{
	voice_start_running_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running3.ogg"))
{
	voice_start_running_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running3.ogg");
}
else
{
	voice_start_running_3 = noone;
}
#endregion /*Voice Start Running 3 END*/

#region /*Voice Start Running 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_4.ogg"))
{
	voice_start_running_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running4.ogg"))
{
	voice_start_running_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_4.ogg"))
{
	voice_start_running_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running4.ogg"))
{
	voice_start_running_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running4.ogg");
}
else
{
	voice_start_running_4 = noone;
}
#endregion /*Voice Start Running 4 END*/

#region /*Voice Start Running 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_5.ogg"))
{
	voice_start_running_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running5.ogg"))
{
	voice_start_running_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_5.ogg"))
{
	voice_start_running_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running5.ogg"))
{
	voice_start_running_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running5.ogg");
}
else
{
	voice_start_running_5 = noone;
}
#endregion /*Voice Start Running 5 END*/

#region /*Voice Start Running 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_6.ogg"))
{
	voice_start_running_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running6.ogg"))
{
	voice_start_running_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_6.ogg"))
{
	voice_start_running_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running6.ogg"))
{
	voice_start_running_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running6.ogg");
}
else
{
	voice_start_running_6 = noone;
}
#endregion /*Voice Start Running 6 END*/

#region /*Voice Start Running 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_7.ogg"))
{
	voice_start_running_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running7.ogg"))
{
	voice_start_running_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_7.ogg"))
{
	voice_start_running_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running7.ogg"))
{
	voice_start_running_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running7.ogg");
}
else
{
	voice_start_running_7 = noone;
}
#endregion /*Voice Start Running 7 END*/

#region /*Voice Start Running 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_8.ogg"))
{
	voice_start_running_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running8.ogg"))
{
	voice_start_running_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_8.ogg"))
{
	voice_start_running_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running8.ogg"))
{
	voice_start_running_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running8.ogg");
}
else
{
	voice_start_running_8 = noone;
}
#endregion /*Voice Start Running 8 END*/

#region /*Voice Start Running 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_9.ogg"))
{
	voice_start_running_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running9.ogg"))
{
	voice_start_running_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_9.ogg"))
{
	voice_start_running_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running9.ogg"))
{
	voice_start_running_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running9.ogg");
}
else
{
	voice_start_running_9 = noone;
}
#endregion /*Voice Start Running 9 END*/

#region /*Voice Start Running 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_10.ogg"))
{
	voice_start_running_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running10.ogg"))
{
	voice_start_running_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_10.ogg"))
{
	voice_start_running_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running10.ogg"))
{
	voice_start_running_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/start_running10.ogg");
}
else
{
	voice_start_running_10 = noone;
}
#endregion /*Voice Start Running 10 END*/

#endregion /*Voice Start Running END*/

#region /*Voice Rope Catch*/

#region /*Voice Rope Catch 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch.ogg"))
{
	voice_rope_catch_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch.ogg"))
{
	voice_rope_catch_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch1.ogg");
}
else
{
	voice_rope_catch_1 = noone;
}
#endregion /*Voice Rope Catch 1 END*/

#region /*Voice Rope Catch 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch2.ogg");
}
else
{
	voice_rope_catch_2 = noone;
}
#endregion /*Voice Rope Catch 2 END*/

#region /*Voice Rope Catch 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch3.ogg");
}
else
{
	voice_rope_catch_3 = noone;
}
#endregion /*Voice Rope Catch 3 END*/

#region /*Voice Rope Catch 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch4.ogg");
}
else
{
	voice_rope_catch_4 = noone;
}
#endregion /*Voice Rope Catch 4 END*/

#region /*Voice Rope Catch 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch5.ogg");
}
else
{
	voice_rope_catch_5 = noone;
}
#endregion /*Voice Rope Catch 5 END*/

#region /*Voice Rope Catch 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch6.ogg");
}
else
{
	voice_rope_catch_6 = noone;
}
#endregion /*Voice Rope Catch 6 END*/

#region /*Voice Rope Catch 7*/
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch7.ogg");
}
else
{
	voice_rope_catch_7 = noone;
}
#endregion /*Voice Rope Catch 7 END*/

#region /*Voice Rope Catch 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch8.ogg");
}
else
{
	voice_rope_catch_8 = noone;
}
#endregion /*Voice Rope Catch 8 END*/

#region /*Voice Rope Catch 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch9.ogg");
}
else
{
	voice_rope_catch_9 = noone;
}
#endregion /*Voice Rope Catch 9 END*/

#region /*Voice Rope Catch 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/rope_catch10.ogg");
}
else
{
	voice_rope_catch_10 = noone;
}
#endregion /*Voice Rope Catch 10 END*/

#endregion /*Voice Rope Catch END*/

#region /*Voice Jump Spring*/

#region /*Voice Jump Spring 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring.ogg"))
{
	voice_jump_spring_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring.ogg"))
{
	voice_jump_spring_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring1.ogg");
}
else
{
	voice_jump_spring_1 = noone;
}
#endregion /*Voice Jump Spring 1 END*/

#region /*Voice Jump Spring 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring2.ogg");
}
else
{
	voice_jump_spring_2 = noone;
}
#endregion /*Voice Jump Spring 2 END*/

#region /*Voice Jump Spring 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring3.ogg");
}
else
{
	voice_jump_spring_3 = noone;
}
#endregion /*Voice Jump Spring 3 END*/

#region /*Voice Jump Spring 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring4.ogg");
}
else
{
	voice_jump_spring_4 = noone;
}
#endregion /*Voice Jump Spring 4 END*/

#region /*Voice Jump Spring 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring5.ogg");
}
else
{
	voice_jump_spring_5 = noone;
}
#endregion /*Voice Jump Spring 5 END*/

#region /*Voice Jump Spring 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring6.ogg");
}
else
{
	voice_jump_spring_6 = noone;
}
#endregion /*Voice Jump Spring 6 END*/

#region /*Voice Jump Spring 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring7.ogg");
}
else
{
	voice_jump_spring_7 = noone;
}
#endregion /*Voice Jump Spring 7 END*/

#region /*Voice Jump Spring 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring8.ogg");
}
else
{
	voice_jump_spring_8 = noone;
}
#endregion /*Voice Jump Spring 8 END*/

#region /*Voice Jump Spring 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring9.ogg");
}
else
{
	voice_jump_spring_9 = noone;
}
#endregion /*Voice Jump Spring 9 END*/

#region /*Voice Jump Spring 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_spring10.ogg");
}
else
{
	voice_jump_spring_10 = noone;
}
#endregion /*Voice Jump Spring 10 END*/

#endregion /*Voice Jump Spring END*/

#region /*Voice Jump Rope*/

#region /*Voice Jump Rope 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope.ogg"))
{
	voice_jump_rope_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope.ogg"))
{
	voice_jump_rope_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope1.ogg");
}
else
{
	voice_jump_rope_1 = noone;
}
#endregion /*Voice Jump Rope 1 END*/

#region /*Voice Jump Rope 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope2.ogg");
}
else
{
	voice_jump_rope_2 = noone;
}
#endregion /*Voice Jump Rope 2 END*/

#region /*Voice Jump Rope 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope3.ogg");
}
else
{
	voice_jump_rope_3 = noone;
}
#endregion /*Voice Jump Rope 3 END*/

#region /*Voice Jump Rope 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope4.ogg");
}
else
{
	voice_jump_rope_4 = noone;
}
#endregion /*Voice Jump Rope 4 END*/

#region /*Voice Jump Rope 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope5.ogg");
}
else
{
	voice_jump_rope_5 = noone;
}
#endregion /*Voice Jump Rope 5 END*/

#region /*Voice Jump Rope 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope6.ogg");
}
else
{
	voice_jump_rope_6 = noone;
}
#endregion /*Voice Jump Rope 6 END*/

#region /*Voice Jump Rope 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope7.ogg");
}
else
{
	voice_jump_rope_7 = noone;
}
#endregion /*Voice Jump Rope 7 END*/

#region /*Voice Jump Rope 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope8.ogg");
}
else
{
	voice_jump_rope_8 = noone;
}
#endregion /*Voice Jump Rope 8 END*/

#region /*Voice Jump Rope 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope9.ogg");
}
else
{
	voice_jump_rope_9 = noone;
}
#endregion /*Voice Jump Rope 9 END*/

#region /*Voice Jump Rope 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_rope10.ogg");
}
else
{
	voice_jump_rope_10 = noone;
}
#endregion /*Voice Jump Rope 10 END*/

#endregion /*Voice Jump Rope END*/

#region /*Voice Jump*/

#region /*Voice Jump 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump.ogg"))
{
	voice_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_1.ogg"))
{
	voice_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump1.ogg"))
{
	voice_jump_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump.ogg"))
{
	voice_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_1.ogg"))
{
	voice_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump1.ogg"))
{
	voice_jump_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump1.ogg");
}
else
{
	voice_jump_1 = noone;
}
#endregion /*Voice Jump 1 END*/

#region /*Voice Jump 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2.ogg"))
{
	voice_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2.ogg"))
{
	voice_jump_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2.ogg"))
{
	voice_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2.ogg"))
{
	voice_jump_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2.ogg");
}
else
{
	voice_jump_2 = noone;
}
#endregion /*Voice Jump 2 END*/

#region /*Voice Jump 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3.ogg"))
{
	voice_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3.ogg"))
{
	voice_jump_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3.ogg"))
{
	voice_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3.ogg"))
{
	voice_jump_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3.ogg");
}
else
{
	voice_jump_3 = noone;
}
#endregion /*Voice Jump 3 END*/

#region /*Voice Jump 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_4.ogg"))
{
	voice_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump4.ogg"))
{
	voice_jump_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_4.ogg"))
{
	voice_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump4.ogg"))
{
	voice_jump_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump4.ogg");
}
else
{
	voice_jump_4 = noone;
}
#endregion /*Voice Jump 4 END*/

#region /*Voice Jump 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_5.ogg"))
{
	voice_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump5.ogg"))
{
	voice_jump_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_5.ogg"))
{
	voice_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump5.ogg"))
{
	voice_jump_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump5.ogg");
}
else
{
	voice_jump_5 = noone;
}
#endregion /*Voice Jump 5 END*/

#region /*Voice Jump 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_6.ogg"))
{
	voice_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump6.ogg"))
{
	voice_jump_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_6.ogg"))
{
	voice_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump6.ogg"))
{
	voice_jump_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump6.ogg");
}
else
{
	voice_jump_6 = noone;
}
#endregion /*Voice Jump 6 END*/

#region /*Voice Jump 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_7.ogg"))
{
	voice_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump7.ogg"))
{
	voice_jump_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_7.ogg"))
{
	voice_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump7.ogg"))
{
	voice_jump_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump7.ogg");
}
else
{
	voice_jump_7 = noone;
}
#endregion /*Voice Jump 7 END*/

#region /*Voice Jump 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_8.ogg"))
{
	voice_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump8.ogg"))
{
	voice_jump_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_8.ogg"))
{
	voice_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump8.ogg"))
{
	voice_jump_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump8.ogg");
}
else
{
	voice_jump_8 = noone;
}
#endregion /*Voice Jump 8 END*/

#region /*Voice Jump 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_9.ogg"))
{
	voice_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump9.ogg"))
{
	voice_jump_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_9.ogg"))
{
	voice_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump9.ogg"))
{
	voice_jump_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump9.ogg");
}
else
{
	voice_jump_9 = noone;
}
#endregion /*Voice Jump 9 END*/

#region /*Voice Jump 10*/
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump10.ogg");
}
else
{
	voice_jump_10 = noone;
}
#endregion /*Voice Jump 10 END*/

#endregion /*Voice Jump END*/

#region /*Voice Jump 3rd*/

#region /*Voice Jump 3rd 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd1.ogg");
}
else
{
	voice_jump_3rd_1 = noone;
}
#endregion /*Voice Jump 3rd 1 END*/

#region /*Voice Jump 3rd 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd2.ogg");
}
else
{
	voice_jump_3rd_2 = noone;
}
#endregion /*Voice Jump 3rd 2 END*/

#region /*Voice Jump 3rd 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/Voice Pack/jump_3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd3.ogg");
}
else
{
	voice_jump_3rd_3 = noone;
}
#endregion /*Voice Jump 3rd 3 END*/

#region /*Voice Jump 3rd 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd4.ogg");
}
else
{
	voice_jump_3rd_4 = noone;
}
#endregion /*Voice Jump 3rd 4 END*/

#region /*Voice Jump 3rd 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd5.ogg");
}
else
{
	voice_jump_3rd_5 = noone;
}
#endregion /*Voice Jump 3rd 5 END*/

#region /*Voice Jump 3rd 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd6.ogg");
}
else
{
	voice_jump_3rd_6 = noone;
}
#endregion /*Voice Jump 3rd 6 END*/

#region /*Voice Jump 3rd 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd7.ogg");
}
else
{
	voice_jump_3rd_7 = noone;
}
#endregion /*Voice Jump 3rd 7 END*/

#region /*Voice Jump 3rd 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd8.ogg");
}
else
{
	voice_jump_3rd_8 = noone;
}
#endregion /*Voice Jump 3rd 8 END*/

#region /*Voice Jump 3rd 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd9.ogg");
}
else
{
	voice_jump_3rd_9 = noone;
}
#endregion /*Voice Jump 3rd 9 END*/

#region /*Voice Jump 3rd 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_3rd10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump3rd10.ogg");
}
else
{
	voice_jump_3rd_10 = noone;
}
#endregion /*Voice Jump 3rd 10 END*/

#endregion /*Voice Jump 3rd END*/

#region /*Voice Jump 2nd*/

#region /*Voice Jump 2nd 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd1.ogg");
}
else
{
	voice_jump_2nd_1 = noone;
}
#endregion /*Voice Jump 2nd 1 END*/

#region /*Voice Jump 2nd 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd2.ogg");
}
else
{
	voice_jump_2nd_2 = noone;
}
#endregion /*Voice Jump 2nd 2 END*/

#region /*Voice Jump 2nd 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd3.ogg");
}
else
{
	voice_jump_2nd_3 = noone;
}
#endregion /*Voice Jump 2nd 3 END*/

#region /*Voice Jump 2nd 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd4.ogg");
}
else
{
	voice_jump_2nd_4 = noone;
}
#endregion /*Voice Jump 2nd 4 END*/

#region /*Voice Jump 2nd 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd5.ogg");
}
else
{
	voice_jump_2nd_5 = noone;
}
#endregion /*Voice Jump 2nd 5 END*/

#region /*Voice Jump 2nd 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd6.ogg");
}
else
{
	voice_jump_2nd_6 = noone;
}
#endregion /*Voice Jump 2nd 6 END*/

#region /*Voice Jump 2nd 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd7.ogg");
}
else
{
	voice_jump_2nd_7 = noone;
}
#endregion /*Voice Jump 2nd 7 END*/

#region /*Voice Jump 2nd 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd8.ogg");
}
else
{
	voice_jump_2nd_8 = noone;
}
#endregion /*Voice Jump 2nd 8 END*/

#region /*Voice Jump 2nd 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd9.ogg");
}
else
{
	voice_jump_2nd_9 = noone;
}
#endregion /*Voice Jump 2nd 9 END*/

#region /*Voice Jump 2nd 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump_2nd10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/jump2nd10.ogg");
}
else
{
	voice_jump_2nd_10 = noone;
}
#endregion /*Voice Jump 2nd 10 END*/

#endregion /*Voice Jump 2nd END*/

#region /*Voice Get Invincibility*/

#region /*Voice Get Invincibility 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star.ogg");
}
else
{
	voice_get_invincibility_1 = noone;
}
#endregion /*Voice Get Invincibility 1 END*/

#region /*Voice Get Invincibility 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star2.ogg");
}
else
{
	voice_get_invincibility_2 = noone;
}
#endregion /*Voice Get Invincibility 2 END*/

#region /*Voice Get Invincibility 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star3.ogg");
}
else
{
	voice_get_invincibility_3 = noone;
}
#endregion /*Voice Get Invincibility 3 END*/

#region /*Voice Get Invincibility 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star4.ogg");
}
else
{
	voice_get_invincibility_4 = noone;
}
#endregion /*Voice Get Invincibility 4 END*/

#region /*Voice Get Invincibility 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star5.ogg");
}
else
{
	voice_get_invincibility_5 = noone;
}
#endregion /*Voice Get Invincibility 5 END*/

#region /*Voice Get Invincibility 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star6.ogg");
}
else
{
	voice_get_invincibility_6 = noone;
}
#endregion /*Voice Get Invincibility 6 END*/

#region /*Voice Get Invincibility 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star7.ogg");
}
else
{
	voice_get_invincibility_7 = noone;
}
#endregion /*Voice Get Invincibility 7 END*/

#region /*Voice Get Invincibility 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star8.ogg");
}
else
{
	voice_get_invincibility_8 = noone;
}
#endregion /*Voice Get Invincibility 8 END*/

#region /*Voice Get Invincibility 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star9.ogg");
}
else
{
	voice_get_invincibility_9 = noone;
}
#endregion /*Voice Get Invincibility 9 END*/

#region /*Voice Get Invincibility 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_invincibility10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/get_star10.ogg");
}
else
{
	voice_get_invincibility_10 = noone;
}
#endregion /*Voice Get Invincibility 10 END*/

#endregion /*Voice Get Invincibility END*/

#region /*Voice Enter Goal*/

#region /*Voice Enter Goal 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal.ogg"))
{
	voice_enter_goal_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal.ogg"))
{
	voice_enter_goal_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal1.ogg");
}
else
{
	voice_enter_goal_1 = noone;
}
#endregion /*Voice Enter Goal 1 END*/

#region /*Voice Enter Goal 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal2.ogg");
}
else
{
	voice_enter_goal_2 = noone;
}
#endregion /*Voice Enter Goal 2 END*/

#region /*Voice Enter Goal 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal3.ogg");
}
else
{
	voice_enter_goal_3 = noone;
}
#endregion /*Voice Enter Goal 3 END*/

#region /*Voice Enter Goal 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal4.ogg");
}
else
{
	voice_enter_goal_4 = noone;
}
#endregion /*Voice Enter Goal 4 END*/

#region /*Voice Enter Goal 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal5.ogg");
}
else
{
	voice_enter_goal_5 = noone;
}
#endregion /*Voice Enter Goal 5 END*/

#region /*Voice Enter Goal 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal6.ogg");
}
else
{
	voice_enter_goal_6 = noone;
}
#endregion /*Voice Enter Goal 6 END*/

#region /*Voice Enter Goal 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal7.ogg");
}
else
{
	voice_enter_goal_7 = noone;
}
#endregion /*Voice Enter Goal 7 END*/

#region /*Voice Enter Goal 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal8.ogg");
}
else
{
	voice_enter_goal_8 = noone;
}
#endregion /*Voice Enter Goal 8 END*/

#region /*Voice Enter Goal 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal9.ogg");
}
else
{
	voice_enter_goal_9 = noone;
}
#endregion /*Voice Enter Goal 9 END*/

#region /*Voice Enter Goal 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/enter_goal10.ogg");
}
else
{
	voice_enter_goal_10 = noone;
}
#endregion /*Voice Enter Goal 10 END*/

#endregion /*Voice Enter Goal END*/

#region /*Voice Dive*/

#region /*Voice Dive 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive.ogg"))
{
	voice_dive_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_1.ogg"))
{
	voice_dive_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive1.ogg"))
{
	voice_dive_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive.ogg"))
{
	voice_dive_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_1.ogg"))
{
	voice_dive_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive1.ogg"))
{
	voice_dive_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive1.ogg");
}
else
{
	voice_dive_1 = noone;
}
#endregion /*Voice Dive 1 END*/

#region /*Voice Dive 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_2.ogg"))
{
	voice_dive_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive2.ogg"))
{
	voice_dive_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_2.ogg"))
{
	voice_dive_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive2.ogg"))
{
	voice_dive_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive2.ogg");
}
else
{
	voice_dive_2 = noone;
}
#endregion /*Voice Dive 2 END*/

#region /*Voice Dive 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_3.ogg"))
{
	voice_dive_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive3.ogg"))
{
	voice_dive_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_3.ogg"))
{
	voice_dive_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive3.ogg"))
{
	voice_dive_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive3.ogg");
}
else
{
	voice_dive_3 = noone;
}
#endregion /*Voice Dive 3 END*/

#region /*Voice Dive 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_4.ogg"))
{
	voice_dive_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive4.ogg"))
{
	voice_dive_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_4.ogg"))
{
	voice_dive_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive4.ogg"))
{
	voice_dive_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive4.ogg");
}
else
{
	voice_dive_4 = noone;
}
#endregion /*Voice Dive 4 END*/

#region /*Voice Dive 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_5.ogg"))
{
	voice_dive_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive5.ogg"))
{
	voice_dive_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_5.ogg"))
{
	voice_dive_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive5.ogg"))
{
	voice_dive_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive5.ogg");
}
else
{
	voice_dive_5 = noone;
}
#endregion /*Voice Dive 5 END*/

#region /*Voice Dive 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_6.ogg"))
{
	voice_dive_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive6.ogg"))
{
	voice_dive_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_6.ogg"))
{
	voice_dive_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive6.ogg"))
{
	voice_dive_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive6.ogg");
}
else
{
	voice_dive_6 = noone;
}
#endregion /*Voice Dive 6 END*/

#region /*Voice Dive 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_7.ogg"))
{
	voice_dive_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive7.ogg"))
{
	voice_dive_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_7.ogg"))
{
	voice_dive_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive7.ogg"))
{
	voice_dive_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive7.ogg");
}
else
{
	voice_dive_7 = noone;
}
#endregion /*Voice Dive 7 END*/

#region /*Voice Dive 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_8.ogg"))
{
	voice_dive_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive8.ogg"))
{
	voice_dive_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_8.ogg"))
{
	voice_dive_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive8.ogg"))
{
	voice_dive_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive8.ogg");
}
else
{
	voice_dive_8 = noone;
}
#endregion /*Voice Dive 8 END*/

#region /*Voice Dive 9*/
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive9.ogg");
}
else
{
	voice_dive_9 = noone;
}
#endregion /*Voice Dive 9 END*/

#region /*Voice Dive 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_10.ogg"))
{
	voice_dive_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive10.ogg"))
{
	voice_dive_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_10.ogg"))
{
	voice_dive_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive10.ogg"))
{
	voice_dive_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive10.ogg");
}
else
{
	voice_dive_10 = noone;
}
#endregion /*Voice Dive 10 END*/

#region /*Voice Dive 11*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_11.ogg"))
{
	voice_dive_11 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_11.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive11.ogg"))
{
	voice_dive_11 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive11.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_11.ogg"))
{
	voice_dive_11 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_11.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive11.ogg"))
{
	voice_dive_11 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive11.ogg");
}
else
{
	voice_dive_11 = noone;
}
#endregion /*Voice Dive 11 END*/

#region /*Voice Dive 12*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_12.ogg"))
{
	voice_dive_12 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_12.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive12.ogg"))
{
	voice_dive_12 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive12.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_12.ogg"))
{
	voice_dive_12 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_12.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive12.ogg"))
{
	voice_dive_12 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive12.ogg");
}
else
{
	voice_dive_12 = noone;
}
#endregion /*Voice Dive 12 END*/

#region /*Voice Dive 13*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_13.ogg"))
{
	voice_dive_13 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_13.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive13.ogg"))
{
	voice_dive_13 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive13.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_13.ogg"))
{
	voice_dive_13 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_13.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive13.ogg"))
{
	voice_dive_13 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive13.ogg");
}
else
{
	voice_dive_13 = noone;
}
#endregion /*Voice Dive 13 END*/

#region /*Voice Dive 14*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_14.ogg"))
{
	voice_dive_14 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_14.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive14.ogg"))
{
	voice_dive_14 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive14.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_14.ogg"))
{
	voice_dive_14 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_14.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive14.ogg"))
{
	voice_dive_14 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive14.ogg");
}
else
{
	voice_dive_14 = noone;
}
#endregion /*Voice Dive 14 END*/

#region /*Voice Dive 15*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_15.ogg"))
{
	voice_dive_15 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_15.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive15.ogg"))
{
	voice_dive_15 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive15.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_15.ogg"))
{
	voice_dive_15 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_15.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive15.ogg"))
{
	voice_dive_15 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive15.ogg");
}
else
{
	voice_dive_15 = noone;
}
#endregion /*Voice Dive 15 END*/

#region /*Voice Dive 16*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_16.ogg"))
{
	voice_dive_16 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_16.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive16.ogg"))
{
	voice_dive_16 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive16.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_16.ogg"))
{
	voice_dive_16 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_16.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive16.ogg"))
{
	voice_dive_16 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive16.ogg");
}
else
{
	voice_dive_16 = noone;
}
#endregion /*Voice Dive 16 END*/

#region /*Voice Dive 17*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_17.ogg"))
{
	voice_dive_17 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_17.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive17.ogg"))
{
	voice_dive_17 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive17.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_17.ogg"))
{
	voice_dive_17 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_17.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive17.ogg"))
{
	voice_dive_17 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive17.ogg");
}
else
{
	voice_dive_17 = noone;
}
#endregion /*Voice Dive 17 END*/

#region /*Voice Dive 18*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_18.ogg"))
{
	voice_dive_18 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_18.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive18.ogg"))
{
	voice_dive_18 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive18.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_18.ogg"))
{
	voice_dive_18 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_18.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive18.ogg"))
{
	voice_dive_18 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive18.ogg");
}
else
{
	voice_dive_18 = noone;
}
#endregion /*Voice Dive 18 END*/

#region /*Voice Dive 19*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_19.ogg"))
{
	voice_dive_19 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_19.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive19.ogg"))
{
	voice_dive_19 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive19.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_19.ogg"))
{
	voice_dive_19 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_19.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive19.ogg"))
{
	voice_dive_19 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive19.ogg");
}
else
{
	voice_dive_19 = noone;
}
#endregion /*Voice Dive 19 END*/

#region /*Voice Dive 20*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_20.ogg"))
{
	voice_dive_20 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_20.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive20.ogg"))
{
	voice_dive_20 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive20.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_20.ogg"))
{
	voice_dive_20 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive_20.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive20.ogg"))
{
	voice_dive_20 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/dive20.ogg");
}
else
{
	voice_dive_20 = noone;
}
#endregion /*Voice Dive 20 END*/

#endregion /*Voice Dive END*/

#region /*Voice Damage*/

#region /*Voice Damage 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage.ogg"))
{
	voice_damage_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_1.ogg"))
{
	voice_damage_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage1.ogg"))
{
	voice_damage_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage.ogg"))
{
	voice_damage_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_1.ogg"))
{
	voice_damage_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage1.ogg"))
{
	voice_damage_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage1.ogg");
}
else
{
	voice_damage_1 = noone;
}
#endregion /*Voice Damage 1 END*/

#region /*Voice Damage 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_2.ogg"))
{
	voice_damage_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage2.ogg"))
{
	voice_damage_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_2.ogg"))
{
	voice_damage_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage2.ogg"))
{
	voice_damage_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage2.ogg");
}
else
{
	voice_damage_2 = noone;
}
#endregion /*Voice Damage 2 END*/

#region /*Voice Damage 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_3.ogg"))
{
	voice_damage_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage3.ogg"))
{
	voice_damage_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_3.ogg"))
{
	voice_damage_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage3.ogg"))
{
	voice_damage_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage3.ogg");
}
else
{
	voice_damage_3 = noone;
}
#endregion /*Voice Damage 3 END*/

#region /*Voice Damage 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_4.ogg"))
{
	voice_damage_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage4.ogg"))
{
	voice_damage_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_4.ogg"))
{
	voice_damage_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage4.ogg"))
{
	voice_damage_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage4.ogg");
}
else
{
	voice_damage_4 = noone;
}
#endregion /*Voice Damage 4 END*/

#region /*Voice Damage 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_5.ogg"))
{
	voice_damage_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage5.ogg"))
{
	voice_damage_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_5.ogg"))
{
	voice_damage_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage5.ogg"))
{
	voice_damage_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage5.ogg");
}
else
{
	voice_damage_5 = noone;
}
#endregion /*Voice Damage 5 END*/

#region /*Voice Damage 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_6.ogg"))
{
	voice_damage_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage6.ogg"))
{
	voice_damage_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_6.ogg"))
{
	voice_damage_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage6.ogg"))
{
	voice_damage_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage6.ogg");
}
else
{
	voice_damage_6 = noone;
}
#endregion /*Voice Damage 6 END*/

#region /*Voice Damage 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_7.ogg"))
{
	voice_damage_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage7.ogg"))
{
	voice_damage_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_7.ogg"))
{
	voice_damage_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage7.ogg"))
{
	voice_damage_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage7.ogg");
}
else
{
	voice_damage_7 = noone;
}
#endregion /*Voice Damage 7 END*/

#region /*Voice Damage 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_8.ogg"))
{
	voice_damage_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage8.ogg"))
{
	voice_damage_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_8.ogg"))
{
	voice_damage_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage8.ogg"))
{
	voice_damage_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage8.ogg");
}
else
{
	voice_damage_8 = noone;
}
#endregion /*Voice Damage 8 END*/

#region /*Voice Damage 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_9.ogg"))
{
	voice_damage_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage9.ogg"))
{
	voice_damage_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_9.ogg"))
{
	voice_damage_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage9.ogg"))
{
	voice_damage_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage9.ogg");
}
else
{
	voice_damage_9 = noone;
}
#endregion /*Voice Damage 9 END*/

#region /*Voice Damage 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_10.ogg"))
{
	voice_damage_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage10.ogg"))
{
	voice_damage_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_10.ogg"))
{
	voice_damage_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage10.ogg"))
{
	voice_damage_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/damage10.ogg");
}
else
{
	voice_damage_10 = noone;
}
#endregion /*Voice Damage 10 END*/

#endregion /*Voice Damage END*/

#region /*Voice Burned Running*/

#region /*Voice Burned Running 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running.ogg"))
{
	voice_burned_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_1.ogg"))
{
	voice_burned_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running1.ogg"))
{
	voice_burned_running_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running.ogg"))
{
	voice_burned_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_1.ogg"))
{
	voice_burned_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running1.ogg"))
{
	voice_burned_running_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running1.ogg");
}
else
{
	voice_burned_running_1 = noone;
}
#endregion /*Voice Burned Running 1 END*/

#region /*Voice Burned Running 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_2.ogg"))
{
	voice_burned_running_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running2.ogg"))
{
	voice_burned_running_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_2.ogg"))
{
	voice_burned_running_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running2.ogg"))
{
	voice_burned_running_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running2.ogg");
}
else
{
	voice_burned_running_2 = noone;
}
#endregion /*Voice Burned Running 2 END*/

#region /*Voice Burned Running 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_3.ogg"))
{
	voice_burned_running_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running3.ogg"))
{
	voice_burned_running_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_3.ogg"))
{
	voice_burned_running_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running3.ogg"))
{
	voice_burned_running_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running3.ogg");
}
else
{
	voice_burned_running_3 = noone;
}
#endregion /*Voice Burned Running 3 END*/

#region /*Voice Burned Running 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_4.ogg"))
{
	voice_burned_running_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running4.ogg"))
{
	voice_burned_running_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_4.ogg"))
{
	voice_burned_running_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running4.ogg"))
{
	voice_burned_running_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running4.ogg");
}
else
{
	voice_burned_running_4 = noone;
}
#endregion /*Voice Burned Running 4 END*/

#region /*Voice Burned Running 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_5.ogg"))
{
	voice_burned_running_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running5.ogg"))
{
	voice_burned_running_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_5.ogg"))
{
	voice_burned_running_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running5.ogg"))
{
	voice_burned_running_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running5.ogg");
}
else
{
	voice_burned_running_5 = noone;
}
#endregion /*Voice Burned Running 5 END*/

#region /*Voice Burned Running 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_6.ogg"))
{
	voice_burned_running_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running6.ogg"))
{
	voice_burned_running_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_6.ogg"))
{
	voice_burned_running_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running6.ogg"))
{
	voice_burned_running_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running6.ogg");
}
else
{
	voice_burned_running_6 = noone;
}
#endregion /*Voice Burned Running 6 END*/

#region /*Voice Burned Running 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_7.ogg"))
{
	voice_burned_running_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running7.ogg"))
{
	voice_burned_running_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_7.ogg"))
{
	voice_burned_running_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running7.ogg"))
{
	voice_burned_running_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running7.ogg");
}
else
{
	voice_burned_running_7 = noone;
}
#endregion /*Voice Burned Running 7 END*/

#region /*Voice Burned Running 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_8.ogg"))
{
	voice_burned_running_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running8.ogg"))
{
	voice_burned_running_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_8.ogg"))
{
	voice_burned_running_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running8.ogg"))
{
	voice_burned_running_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running8.ogg");
}
else
{
	voice_burned_running_8 = noone;
}
#endregion /*Voice Burned Running 8 END*/

#region /*Voice Burned Running 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_9.ogg"))
{
	voice_burned_running_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running9.ogg"))
{
	voice_burned_running_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_9.ogg"))
{
	voice_burned_running_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running9.ogg"))
{
	voice_burned_running_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running9.ogg");
}
else
{
	voice_burned_running_9 = noone;
}
#endregion /*Voice Burned Running 9 END*/

#region /*Voice Burned Running 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_10.ogg"))
{
	voice_burned_running_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running10.ogg"))
{
	voice_burned_running_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_10.ogg"))
{
	voice_burned_running_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running10.ogg"))
{
	voice_burned_running_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_running10.ogg");
}
else
{
	voice_burned_running_10 = noone;
}
#endregion /*Voice Burned Running 10 END*/

#endregion /*Voice Burned Running END*/

#region /*Voice Burned*/

#region /*Voice Burned 1*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned.ogg"))
{
	voice_burned_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_1.ogg"))
{
	voice_burned_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_1.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned1.ogg"))
{
	voice_burned_1 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned.ogg"))
{
	voice_burned_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_1.ogg"))
{
	voice_burned_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_1.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned1.ogg"))
{
	voice_burned_1 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned1.ogg");
}
else
{
	voice_burned_1 = noone;
}
#endregion /*Voice Burned 1 END*/

#region /*Voice Burned 2*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_2.ogg"))
{
	voice_burned_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_2.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned2.ogg"))
{
	voice_burned_2 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_2.ogg"))
{
	voice_burned_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_2.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned2.ogg"))
{
	voice_burned_2 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned2.ogg");
}
else
{
	voice_burned_2 = noone;
}
#endregion /*Voice Burned 2 END*/

#region /*Voice Burned 3*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_3.ogg"))
{
	voice_burned_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_3.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned3.ogg"))
{
	voice_burned_3 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_3.ogg"))
{
	voice_burned_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_3.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned3.ogg"))
{
	voice_burned_3 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned3.ogg");
}
else
{
	voice_burned_3 = noone;
}
#endregion /*Voice Burned 3 END*/

#region /*Voice Burned 4*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_4.ogg"))
{
	voice_burned_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_4.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned4.ogg"))
{
	voice_burned_4 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_4.ogg"))
{
	voice_burned_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_4.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned4.ogg"))
{
	voice_burned_4 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned4.ogg");
}
else
{
	voice_burned_4 = noone;
}
#endregion /*Voice Burned 4 END*/

#region /*Voice Burned 5*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_5.ogg"))
{
	voice_burned_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_5.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned5.ogg"))
{
	voice_burned_5 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_5.ogg"))
{
	voice_burned_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_5.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned5.ogg"))
{
	voice_burned_5 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned5.ogg");
}
else
{
	voice_burned_5 = noone;
}
#endregion /*Voice Burned 5 END*/

#region /*Voice Burned 6*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_6.ogg"))
{
	voice_burned_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_6.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned6.ogg"))
{
	voice_burned_6 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_6.ogg"))
{
	voice_burned_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_6.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned6.ogg"))
{
	voice_burned_6 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned6.ogg");
}
else
{
	voice_burned_6 = noone;
}
#endregion /*Voice Burned 6 END*/

#region /*Voice Burned 7*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_7.ogg"))
{
	voice_burned_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_7.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned7.ogg"))
{
	voice_burned_7 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_7.ogg"))
{
	voice_burned_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_7.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned7.ogg"))
{
	voice_burned_7 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned7.ogg");
}
else
{
	voice_burned_7 = noone;
}
#endregion /*Voice Burned 7 END*/

#region /*Voice Burned 8*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_8.ogg"))
{
	voice_burned_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_8.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned8.ogg"))
{
	voice_burned_8 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_8.ogg"))
{
	voice_burned_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_8.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned8.ogg"))
{
	voice_burned_8 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned8.ogg");
}
else
{
	voice_burned_8 = noone;
}
#endregion /*Voice Burned 8 END*/

#region /*Voice Burned 9*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_9.ogg"))
{
	voice_burned_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_9.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned9.ogg"))
{
	voice_burned_9 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_9.ogg"))
{
	voice_burned_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_9.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned9.ogg"))
{
	voice_burned_9 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned9.ogg");
}
else
{
	voice_burned_9 = noone;
}
#endregion /*Voice Burned 9 END*/

#region /*Voice Burned 10*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_10.ogg"))
{
	voice_burned_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_10.ogg");
}
else
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned10.ogg"))
{
	voice_burned_10 = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_10.ogg"))
{
	voice_burned_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned_10.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned10.ogg"))
{
	voice_burned_10 = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/burned10.ogg");
}
else
{
	voice_burned_10 = noone;
}
#endregion /*Voice Burned 10 END*/

#endregion /*Voice Burned END*/

#region /*Voice Open Mouth*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/open_mouth.ogg"))
{
	voice_open_mouth = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/open_mouth.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/open_mouth.ogg"))
{
	voice_open_mouth = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/open_mouth.ogg");
}
else
{
	voice_open_mouth = noone;
}
#endregion /*Voice Open Mouth END*/

#region /*Voice Notice*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/notice.ogg"))
{
	voice_notice = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/notice.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/notice.ogg"))
{
	voice_notice = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/notice.ogg");
}
else
{
	voice_notice = noone;
}
#endregion /*Voice Notice END*/

#region /*Voice Scream*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/scream.ogg"))
{
	voice_scream = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/scream.ogg");
}
else
if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/scream.ogg"))
{
	voice_scream = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/sounds/voicepack" + string(selected_voice_pack) + "/scream.ogg");
}
else
{
	voice_scream = noone;
}
#endregion /*Voice Scream END*/

#endregion /*Voices END*/

voice_wallkick = noone;
voice_startdash = noone;
voice_rope_catch = noone;
voice_jump_spring = noone;
voice_jump_rope = noone;
voice_jump = noone;
voice_jump3rd = noone;
voice_jump2nd = noone;
voice_get_star = noone;
voice_enter_goal = noone;
voice_dive = noone;
voice_damage = noone;
voice_burned_running = noone;
voice_burned = noone;

#endregion /*Sound variables END*/

#endregion /*Play as Custom character END*/

#region /*Character Values Handeling*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
or(file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	}
	else
	if(file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	}

	#region /*Acceleration on ground*/
	if (ini_key_exists("values", "acceleration_on_ground"))
	{
		acceleration_on_ground = ini_read_real("values", "acceleration_on_ground", 0.3);
	}
	else
	{
		//ini_write_real("values", "acceleration_on_ground", 0.3);
		acceleration_on_ground = 0.3;
	}
	#endregion /*Acceleration on ground END*/

	#region /*Acceleration in air*/
	if (ini_key_exists("values", "acceleration_in_air"))
	{
		acceleration_in_air = ini_read_real("values", "acceleration_in_air", 0.3);
	}
	else
	{
		//ini_write_real("values", "acceleration_in_air", 0.3);
		acceleration_in_air = 0.3;
	}
	#endregion /*Acceleration in air END*/

	#region /*Acceleration on ice*/
	if (ini_key_exists("values", "acceleration_on_ice"))
	{
		acceleration_on_ice = ini_read_real("values", "acceleration_on_ice", 0.05);
	}
	else
	{
		//ini_write_real("values", "acceleration_on_ice", 0.05);
		acceleration_on_ice = 0.05;
	}
	#endregion /*Acceleration on ice END*/
	
	#region /*Can Attack After Dive On Ground Max Value*/
	if (ini_key_exists("values", "can_tongue_after_dive_on_ground_max_value"))
	{
		can_tongue_after_dive_on_ground_max_value = ini_read_real("values", "can_tongue_after_dive_on_ground_max_value", 20);
	}
	else
	{
		//ini_write_real("values", "number_of_jumps", 1);
		can_tongue_after_dive_on_ground_max_value = 20;
	}
	#endregion /*Can Attack After Dive On Ground Max Value END*/
	
	#region /*Number of jumps*/
	if (ini_key_exists("values", "number_of_jumps"))
	{
		number_of_jumps = ini_read_real("values", "number_of_jumps", 1);
	}
	else
	{
		//ini_write_real("values", "number_of_jumps", 1);
		number_of_jumps = 1;
	}
	#endregion /*Number of jumps END*/
	
	#region /*Mid-air jumps left*/
	if (ini_key_exists("values", "number_of_jumps"))
	{
		midair_jumps_left = ini_read_real("values", "number_of_jumps", 1);
	}
	else
	{
		//ini_write_real("values", "number_of_jumps", 1);
		midair_jumps_left = 1;
	}
	#endregion /*Mid-air jumps left END*/
	
	#region /*Mid-air Flip Animation counter*/
	if (ini_key_exists("values", "midair_jump_flip_animation"))
	{
		midair_jump_flip_animation = ini_read_real("values", "midair_jump_flip_animation", 2);
	}
	else
	{
		midair_jump_flip_animation = 2;
	}
	#endregion /*Mid-air Flip Animation counter END*/
	
	if (global.assist_enable = false)
	{
		
		#region /*Starting HP*/
		if (ini_key_exists("values", "hp"))
		{
			hp = ini_read_real("values", "hp", 1);
		}
		else
		{
			hp = 1;
		}
		#endregion /*Starting HP END*/

		#region /*Starting Max HP*/
		if (ini_key_exists("values", "max_hp"))
		{
			max_hp = ini_read_real("values", "max_hp", 1);
		}
		else
		{
			max_hp = 1;
		}
		#endregion /*Starting Max HP END*/
		
	}
	else
	{
		
		#region /*Starting HP + Extra Assist HP*/
		if (ini_key_exists("values", "hp"))
		{
			hp = ini_read_real("values", "hp", 1) + global.assist_extra_hp;
		}
		else
		{
			hp = 1 + global.assist_extra_hp;
		}
		#endregion /*Starting HP + Extra Assist HP END*/

		#region /*Starting Max HP + Extra Assist HP*/
		if (ini_key_exists("values", "max_hp"))
		{
			max_hp = ini_read_real("values", "max_hp", 1) + global.assist_extra_hp;
		}
		else
		{
			max_hp = 1 + global.assist_extra_hp;
		}
		#endregion /*Starting Max HP + Extra Assist HP END*/
		
	}
	
	#region /*Starting Max Overflow HP*/
	if (ini_key_exists("values", "max_overflow_hp"))
	{
		max_overflow_hp = ini_read_real("values", "max_overflow_hp", 4);
	}
	else
	{
		//ini_write_real("values", "max_overflow_hp", 4);
		max_overflow_hp = 4;
	}
	#endregion /*Starting Max Overflow HP END*/
	
	#region /*Speed max walk*/
	if (ini_key_exists("values", "speed_max_walk"))
	{
		speed_max_walk = ini_read_real("values", "speed_max_walk", 4);
	}
	else
	{
		//ini_write_real("values", "speed_max_walk", 4);
		speed_max_walk = 4;
	}
	#endregion /*Speed max walk END*/

	#region /*Speed max run*/
	if (ini_key_exists("values", "speed_max_run"))
	{
		speed_max_run = ini_read_real("values", "speed_max_run", 8);
	}
	else
	{
		//ini_write_real("values", "speed_max_run", 8);
		speed_max_run = 8;
	}
	#endregion /*Speed max run END*/

	#region /*Jump Heights*/

	#region /*Triple jump height*/
	if (ini_key_exists("values", "triple_jump_height"))
	{
		triple_jump_height = ini_read_real("values", "triple_jump_height", 14.5);
	}
	else
	{
		//ini_write_real("values", "triple_jump_height", 14.5);
		triple_jump_height = 14.5;
	}
	#endregion /*Triple jump height END*/

	#region /*Normal jump height*/
	if (ini_key_exists("values", "normal_jump_height"))
	{
		normal_jump_height = ini_read_real("values", "normal_jump_height", 11.5);
	}
	else
	{
		//ini_write_real("values", "normal_jump_height", 11.5);
		normal_jump_height = 11.5;
	}
	#endregion /*Normal jump height END*/

	#region /*Higher jump height*/
	if (ini_key_exists("values", "higher_jump_height"))
	{
		higher_jump_height = ini_read_real("values", "higher_jump_height", 13);
	}
	else
	{
		//ini_write_real("values", "higher_jump_height", 13);
		higher_jump_height = 13;
	}
	#endregion /*Higher jump height END*/
	
	#region /*Double jump height*/
	if (ini_key_exists("values", "double_jump_height"))
	{
		double_jump_height = ini_read_real("values", "double_jump_height", 11.5);
	}
	else
	{
		//ini_write_real("values", "double_jump_height", 11.5);
		double_jump_height = 11.5;
	}
	#endregion /*Double jump height END*/
	
	#endregion /*Jump Heights END*/
	
	#region /*Homing attack distance*/
	if (ini_key_exists("values", "homing_tongue_distance"))
	{
		hoverstomp_distance = ini_read_real("values", "homing_tongue_distance", 500);
	}
	else
	{
		//ini_write_real("values", "homing_tongue_distance", 500);
		hoverstomp_distance = 500;
	}
	#endregion /*Homing attack distance END*/
	
	#region /*Wall Jump Time*/
	if (ini_key_exists("values", "wall_jump_time"))
	{
		wall_jump_time = ini_read_real("values", "wall_jump_time", 10);
	}
	else
	{
		wall_jump_time = 10;
	}
	#endregion /*Wall Jump Time END*/
	
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
	
	#region /*Default Voice Pitch*/
	if (ini_key_exists("values", "default_voice_pitch"))
	{
		default_voice_pitch = ini_read_real("values", "default_voice_pitch", 1);
	}
	else
	{
		default_voice_pitch = 1;
	}
	#endregion /*Default Voice Pitch END*/
	
	ini_close();
}
else
{
	acceleration_on_ground = 0.3; /*How much acceleration the character has on ground*/
	acceleration_in_air = 0.3; /*How much acceleration the character has in air*/
	acceleration_on_ice = 0.05; /*How much acceleration the character has on ice*/
	hp = 1 + global.assist_extra_hp; /*Starting HP*/
	max_hp = 1 + global.assist_extra_hp; /*Starting Max HP*/
	max_overflow_hp = 4; /*Starting Max Overflow HP*/
	number_of_jumps = 1; /*How many times you can jump. -1 = infinite jumps, 0 = no jump, 1 = single jump, 2 = double jump*/
	speed_max_walk = 4; /*Default speed_max_walk is 4. Top speed with simple walking*/
	speed_max_run = 8; /*Default speed_max_run is 8. Top speed with simple running*/
	triple_jump_height = 14.5;
	normal_jump_height = 11.5;
	higher_jump_height = 13;
	double_jump_height = 11.5;
	hoverstomp_distance = 500;
	//ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[player-1])) + "/data/character_config.ini");
	//if (!ini_key_exists("values", "acceleration_on_ground")){ini_write_real("values", "acceleration_on_ground", 0.3);}
	//if (!ini_key_exists("values", "acceleration_in_air")){ini_write_real("values", "acceleration_in_air", 0.3);}
	//if (!ini_key_exists("values", "acceleration_on_ice")){ini_write_real("values", "acceleration_on_ice", 0.05);}
	//if (!ini_key_exists("values", "hp")){ini_write_real("values", "hp", 1);}
	//if (!ini_key_exists("values", "max_hp")){ini_write_real("values", "max_hp", 1);}
	//if (!ini_key_exists("values", "max_overflow_hp")){ini_write_real("values", "max_overflow_hp", 4);}
	//if (!ini_key_exists("values", "number_of_jumps")){ini_write_real("values", "number_of_jumps", 1);}
	//if (!ini_key_exists("values", "speed_max_walk")){ini_write_real("values", "speed_max_walk", 4);}
	//if (!ini_key_exists("values", "speed_max_run")){ini_write_real("values", "speed_max_run", 8);}
	//if (!ini_key_exists("values", "double_jump_height")){ini_write_real("values", "double_jump_height", 11.5);}
	//if (!ini_key_exists("values", "triple_jump_height")){ini_write_real("values", "triple_jump_height", 14.5);}
	//if (!ini_key_exists("values", "normal_jump_height")){ini_write_real("values", "normal_jump_height", 11.5);}
	//if (!ini_key_exists("values", "higher_jump_height")){ini_write_real("values", "higher_jump_height", 13);}
	//if (!ini_key_exists("values", "homing_tongue_distance")){ini_write_real("values", "homing_tongue_distance", 500);}
	//ini_close();
}
#endregion /*Character Values Handeling END*/

#endregion /*Initialize Custom Character END*/