///Platformer Player Part 1

#region /*Save whole level as screenshot png file*/
if (keyboard_check(vk_control))
and (keyboard_check_pressed(ord("P")))
{
	instance_activate_all();
	//global.deactivate_objects_outsiede_view = false;
	//global.show_tutorial_signs = false;
	
	global.full_level_map_screenshot = true;
	
	#region /*Delete some objects so it doesn't show up in the screenshot*/
	if (asset_get_type("obj_camera")==asset_object)
	and (instance_exists(obj_camera))
	{
		instance_destroy(obj_camera);
	}
	#endregion /*Delete some objects so it doesn't show up in the screenshot END*/
	
	camera_set_view_border(view_camera[view_current], room_width, room_height); /*View Border*/
	camera_set_view_pos(view_camera[view_current], 0, 0);
	camera_set_view_size(view_camera[view_current], room_width, room_height);
	display_set_gui_size(room_width, room_height);
	surface_resize(application_surface, room_width, room_height);
	window_set_rectangle(0, 0, room_width, room_height);
	full_level_map_screenshot_timer = 1;
}

if (full_level_map_screenshot_timer >= 1)
{
	full_level_map_screenshot_timer += 1;
}

if (full_level_map_screenshot_timer = 5)
{
	var custom_level_map_sprite;
	custom_level_map_sprite = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);
	sprite_save(custom_level_map_sprite, 0, working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Full Level Map.png");
	sprite_delete(custom_level_map_sprite);
}

if (full_level_map_screenshot_timer = 10)
{
	camera_set_view_border(view_camera[view_current], 1920, 1080); /*View Border*/
	camera_set_view_pos(view_camera[view_current], x, y);
	camera_set_view_size(view_camera[view_current], 1920, 1080);
	display_set_gui_size(1920, 1080);
	surface_resize(application_surface, 1920, 1080);
	window_set_rectangle(0, 0, 1920, 1080);
	scr_set_screen_size();
	global.full_level_map_screenshot = false;
	full_level_map_screenshot_timer = 0;
}
#endregion /*Save whole level as screenshot png file END*/

#region /*Initialize Custom character*/
if (initialize_custom_character_timer < 2)
{
	initialize_custom_character_timer += 1;
}

if (initialize_custom_character_timer = 1)
{
/*The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config.ini file. This also means that x should be after y*/

#region /*Allow abilities*/
if (file_exists("Characters/Character "+string(custom_character)+"/Data/character_config.ini"))
or(file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini"))
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Data/character_config.ini"))
	{
		ini_open("Characters/Character "+string(custom_character)+"/Data/character_config.ini");
	}
	else
	if(file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini"))
	{
		ini_open(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini");
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
	allow_tongue = false; /*A tongue that extends*/
	allow_overflow_hp = false;
	//ini_open(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini");
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
if (file_exists("Characters/Character "+string(custom_character)+"/Data/sprite_origin_point.ini"))
or(file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Data/sprite_origin_point.ini"))
	{
		ini_open("Characters/Character "+string(custom_character)+"/Data/sprite_origin_point.ini");
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
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
}
#endregion /*If there is no config.ini file, then make every xorig and yorig variable zero END*/

#endregion /*Sprite origin point variables END*/

#region /*Mask Index*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/mask.png"))
{
	sprite_mask = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/mask.png", 0, false, false, mask_xorig, mask_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/mask.png"))
{
	sprite_mask = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/mask.png", 0, false, false, mask_xorig, mask_yorig);
}
else
if (asset_get_type("spr_player_mask") == asset_sprite)
{
	sprite_mask = spr_player_mask;
}
else
if (asset_get_type("spr_player_stand") == asset_sprite)
{
	sprite_mask = spr_player_stand;
}
else
{
	sprite_mask = sprite_index;
}
#endregion /*Mask Index END*/

#region /*Mask Crouch Index*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/mask_crouch.png"))
{
	sprite_mask_crouch = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/mask_crouch.png", 0, false, false, mask_crouch_xorig, mask_crouch_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/mask_crouch.png"))
{
	sprite_mask_crouch = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/mask_crouch.png", 0, false, false, mask_crouch_xorig, mask_crouch_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/mask.png"))
{
	sprite_mask_crouch = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/mask.png", 0, false, false, mask_xorig, mask_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/mask.png"))
{
	sprite_mask_crouch = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/mask.png", 0, false, false, mask_xorig, mask_yorig);
}
else
if (asset_get_type("spr_player_mask_crouch") == asset_sprite)
{
	sprite_mask_crouch = spr_player_mask_crouch;
}
else
if (asset_get_type("spr_player_stand") == asset_sprite)
{
	sprite_mask_crouch = spr_player_stand;
}
else
{
	sprite_mask_crouch = sprite_index;
}
#endregion /*Mask Crouch Index END*/

#region /*Sprite variables*/

#region /*Stand sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stand_strip"+string(index)+".png"))
	{
		sprite_stand = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stand_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand_strip"+string(index)+".png"))
	{
		sprite_stand = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stand.png"))
{
	sprite_stand = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stand.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand.png"))
{
	sprite_stand = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
#endregion /*Stand sprite END*/

#region /*Stand cold sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stand_cold_strip"+string(index)+".png"))
	{
		sprite_stand_cold = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stand_cold_strip"+string(index)+".png", index, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand_cold_strip"+string(index)+".png"))
	{
		sprite_stand_cold = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand_cold_strip"+string(index)+".png", index, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/cold_strip"+string(index)+".png"))
	{
		sprite_stand_cold = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/cold_strip"+string(index)+".png", index, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/cold_strip"+string(index)+".png"))
	{
		sprite_stand_cold = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/cold_strip"+string(index)+".png", index, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stand_cold.png"))
{
	sprite_stand_cold = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stand_cold.png", 1, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand_cold.png"))
{
	sprite_stand_cold = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stand_cold.png", 1, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/cold.png"))
{
	sprite_stand_cold = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/cold.png", 1, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/cold.png"))
{
	sprite_stand_cold = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/cold.png", 1, false, false, sprite_stand_cold_xorig, sprite_stand_cold_yorig);
}
#endregion /*Stand cold sprite END*/

#region /*Standing on something sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/standing_on_something_strip"+string(index)+".png"))
	{
		sprite_standing_on_something = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/standing_on_something_strip"+string(index)+".png", index, false, false, sprite_standing_on_something_xorig, sprite_standing_on_something_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/standing_on_something_strip"+string(index)+".png"))
	{
		sprite_standing_on_something = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/standing_on_something_strip"+string(index)+".png", index, false, false, sprite_standing_on_something_xorig, sprite_standing_on_something_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/standing_on_something.png"))
{
	sprite_standing_on_something = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/standing_on_something.png", 1, false, false, sprite_standing_on_something_xorig, sprite_standing_on_something_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/standing_on_something.png"))
{
	sprite_standing_on_something = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/standing_on_something.png", 1, false, false, sprite_standing_on_something_xorig, sprite_standing_on_something_yorig);
}
#endregion /*Standing on something sprite END*/

#region /*Look up sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/look_up_strip"+string(index)+".png"))
	{
		sprite_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/look_up_strip"+string(index)+".png", index, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/lookup_strip"+string(index)+".png"))
	{
		sprite_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/lookup_strip"+string(index)+".png", index, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up_strip"+string(index)+".png"))
	{
		sprite_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up_strip"+string(index)+".png", index, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/lookup_strip"+string(index)+".png"))
	{
		sprite_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/lookup_strip"+string(index)+".png", index, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/look_up.png"))
{
	sprite_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/look_up.png", 1, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/lookup.png"))
{
	sprite_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/lookup.png", 1, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up.png"))
{
	sprite_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up.png", 1, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/lookup.png"))
{
	sprite_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/lookup.png", 1, false, false, sprite_look_up_xorig, sprite_look_up_yorig);
}
#endregion /*Look up sprite END*/

#region /*Look up start sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/look_up_start_strip"+string(index)+".png"))
	{
		sprite_look_up_start = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/look_up_start_strip"+string(index)+".png", index, false, false, sprite_look_up_start_xorig, sprite_look_up_start_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up_start_strip"+string(index)+".png"))
	{
		sprite_look_up_start = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up_start_strip"+string(index)+".png", index, false, false, sprite_look_up_start_xorig, sprite_look_up_start_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/look_up_start.png"))
{
	sprite_look_up_start = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/look_up_start.png", 1, false, false, sprite_look_up_start_xorig, sprite_look_up_start_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up_start.png"))
{
	sprite_look_up_start = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/look_up_start.png", 1, false, false, sprite_look_up_start_xorig, sprite_look_up_start_yorig);
}
#endregion /*Look up start sprite END*/

#region /*Crouch sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crouch_strip"+string(index)+".png"))
	{
		sprite_crouch = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crouch_strip"+string(index)+".png", index, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat_strip"+string(index)+".png"))
	{
		sprite_crouch = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat_strip"+string(index)+".png", index, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_strip"+string(index)+".png"))
	{
		sprite_crouch = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_strip"+string(index)+".png", index, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_strip"+string(index)+".png"))
	{
		sprite_crouch = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_strip"+string(index)+".png", index, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crouch.png"))
{
	sprite_crouch = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crouch.png", 1, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat.png"))
{
	sprite_crouch = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat.png", 1, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch.png"))
{
	sprite_crouch = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch.png", 1, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat.png"))
{
	sprite_crouch = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat.png", 1, false, false, sprite_crouch_xorig, sprite_crouch_yorig);
}
#endregion /*Crouch sprite END*/

#region /*Crawl sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crawl_strip"+string(index)+".png"))
	{
		sprite_crouch_crawl = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crawl_strip"+string(index)+".png", index, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat_crawl_strip"+string(index)+".png"))
	{
		sprite_crouch_crawl = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat_crawl_strip"+string(index)+".png", index, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crawl_strip"+string(index)+".png"))
	{
		sprite_crouch_crawl = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crawl_strip"+string(index)+".png", index, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_crawl_strip"+string(index)+".png"))
	{
		sprite_crouch_crawl = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_crawl_strip"+string(index)+".png", index, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crawl.png"))
{
	sprite_crouch_crawl = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crawl.png", 1, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat_crawl.png"))
{
	sprite_crouch_crawl = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat_crawl.png", 1, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crawl.png"))
{
	sprite_crouch_crawl = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crawl.png", 1, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_crawl.png"))
{
	sprite_crouch_crawl = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_crawl.png", 1, false, false, sprite_crawl_xorig, sprite_crawl_yorig);
}
#endregion /*Crawl sprite END*/

#region /*Crouch jump sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crouch_jump_strip"+string(index)+".png"))
	{
		sprite_crouch_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crouch_jump_strip"+string(index)+".png", index, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat_jump_strip"+string(index)+".png"))
	{
		sprite_crouch_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat_jump_strip"+string(index)+".png", index, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_jump_strip"+string(index)+".png"))
	{
		sprite_crouch_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_jump_strip"+string(index)+".png", index, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_jump_strip"+string(index)+".png"))
	{
		sprite_crouch_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_jump_strip"+string(index)+".png", index, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crouch_jump.png"))
{
	sprite_crouch_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crouch_jump.png", 1, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat_jump.png"))
{
	sprite_crouch_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat_jump.png", 1, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_jump.png"))
{
	sprite_crouch_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_jump.png", 1, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_jump.png"))
{
	sprite_crouch_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_jump.png", 1, false, false, sprite_crouch_jump_xorig, sprite_crouch_jump_yorig);
}
#endregion /*Crouch jump sprite END*/

#region /*Crouch fall sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crouch_fall_strip"+string(index)+".png"))
	{
		sprite_crouch_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crouch_fall_strip"+string(index)+".png", index, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat_fall_strip"+string(index)+".png"))
	{
		sprite_crouch_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat_fall_strip"+string(index)+".png", index, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_fall_strip"+string(index)+".png"))
	{
		sprite_crouch_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_fall_strip"+string(index)+".png", index, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_fall_strip"+string(index)+".png"))
	{
		sprite_crouch_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_fall_strip"+string(index)+".png", index, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/crouch_fall.png"))
{
	sprite_crouch_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/crouch_fall.png", 1, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/squat_fall.png"))
{
	sprite_crouch_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/squat_fall.png", 1, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_fall.png"))
{
	sprite_crouch_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/crouch_fall.png", 1, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_fall.png"))
{
	sprite_crouch_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/squat_fall.png", 1, false, false, sprite_crouch_fall_xorig, sprite_crouch_fall_yorig);
}
#endregion /*Crouch fall sprite END*/

#region /*Skidding sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/skidding_strip"+string(index)+".png"))
	{
		sprite_skidding = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/skidding_strip"+string(index)+".png", index, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/slip_strip"+string(index)+".png"))
	{
		sprite_skidding = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/slip_strip"+string(index)+".png", index, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding_strip"+string(index)+".png"))
	{
		sprite_skidding = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding_strip"+string(index)+".png", index, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/slip_strip"+string(index)+".png"))
	{
		sprite_skidding = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/slip_strip"+string(index)+".png", index, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/skidding.png"))
{
	sprite_skidding = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/skidding.png", 1, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/slip.png"))
{
	sprite_skidding = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/slip.png", 1, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding.png"))
{
	sprite_skidding = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding.png", 1, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/slip.png"))
{
	sprite_skidding = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/slip.png", 1, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
}
#endregion /*Skidding sprite END*/

#region /*Skidding Ice sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/skidding_ice_strip"+string(index)+".png"))
	{
		sprite_skidding_ice = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/skidding_ice_strip"+string(index)+".png", index, false, false, sprite_skidding_ice_xorig, sprite_skidding_ice_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding_ice_strip"+string(index)+".png"))
	{
		sprite_skidding_ice = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding_ice_strip"+string(index)+".png", index, false, false, sprite_skidding_ice_xorig, sprite_skidding_ice_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/skidding_ice.png"))
{
	sprite_skidding_ice = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/skidding_ice.png", 1, false, false, sprite_skidding_ice_xorig, sprite_skidding_ice_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding_ice.png"))
{
	sprite_skidding_ice = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/skidding_ice.png", 1, false, false, sprite_skidding_xorig, sprite_skidding_yorig);
}
#endregion /*Skidding Ice sprite END*/

#region /*Swim sprite*/
if(sprite_swim_xorig > 0)
or(sprite_swim_yorig > 0)
{
	index=0
	repeat(50)
	{
		if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_strip"+string(index)+".png"))
		{
			sprite_swim = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_strip"+string(index)+".png", index, false, false, sprite_swim_xorig, sprite_swim_yorig);
		}
		else
		if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_strip"+string(index)+".png"))
		{
			sprite_swim = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_strip"+string(index)+".png", index, false, false, sprite_swim_xorig, sprite_swim_yorig);
		}
		index+=1
	}
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim.png"))
	{
		sprite_swim = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim.png", 1, false, false, sprite_swim_xorig, sprite_swim_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim.png"))
	{
		sprite_swim = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim.png", 1, false, false, sprite_swim_xorig, sprite_swim_yorig);
	}
}
else
{
	index=0
	repeat(50)
	{
		if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_strip"+string(index)+".png"))
		{
			sprite_swim = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
		}
		else
		if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_strip"+string(index)+".png"))
		{
			sprite_swim = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
		}
		index+=1
	}
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim.png"))
	{
		sprite_swim = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim.png"))
	{
		sprite_swim = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
}
#endregion /*Swim sprite END*/

#region /*Swim fall sprite*/
if(sprite_swim_fall_xorig > 0)
or(sprite_swim_fall_yorig > 0)
{
	index=0
	repeat(50)
	{
		if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_fall_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_fall_strip"+string(index)+".png", index, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
		}
		else
		if (file_exists("Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall_strip"+string(index)+".png", index, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
		}
		else
		if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_falling_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_falling_strip"+string(index)+".png", index, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
		}
		else
		if (file_exists("Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling_strip"+string(index)+".png", index, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
		}
		index+=1
	}
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_fall.png"))
	{
		sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_fall.png", 1, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall.png"))
	{
		sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall.png", 1, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_falling.png"))
	{
		sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_falling.png", 1, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling.png"))
	{
		sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling.png", 1, false, false, sprite_swim_fall_xorig, sprite_swim_fall_yorig);
	}
}
else
{
	index=0
	repeat(50)
	{
		if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_fall_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_fall_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
		}
		else
		if (file_exists("Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
		}
		else
		if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_falling_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_falling_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
		}
		else
		if (file_exists("Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling_strip"+string(index)+".png"))
		{
			sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling_strip"+string(index)+".png", index, false, false, sprite_stand_xorig, sprite_stand_yorig);
		}
		index+=1
	}
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_fall.png"))
	{
		sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_fall.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall.png"))
	{
		sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_fall.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/swim_falling.png"))
	{
		sprite_swim_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/swim_falling.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling.png"))
	{
		sprite_swim_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/swim_falling.png", 1, false, false, sprite_stand_xorig, sprite_stand_yorig);
	}
}
#endregion /*Swim fall sprite END*/

#region /*Against wall sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/against_wall_strip"+string(index)+".png"))
	{
		sprite_against_wall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/against_wall_strip"+string(index)+".png", index, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/againstwall_strip"+string(index)+".png"))
	{
		sprite_against_wall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/againstwall_strip"+string(index)+".png", index, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/against_wall_strip"+string(index)+".png"))
	{
		sprite_against_wall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/against_wall_strip"+string(index)+".png", index, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/againstwall_strip"+string(index)+".png"))
	{
		sprite_against_wall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/againstwall_strip"+string(index)+".png", index, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/against_wall.png"))
{
	sprite_against_wall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/against_wall.png", 1, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/againstwall.png"))
{
	sprite_against_wall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/againstwall.png", 1, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/against_wall.png"))
{
	sprite_against_wall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/against_wall.png", 1, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/againstwall.png"))
{
	sprite_against_wall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/againstwall.png", 1, false, false, sprite_against_wall_xorig, sprite_against_wall_yorig);
}
#endregion /*Against wall sprite END*/

#region /*Walk sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/walk_strip"+string(index)+".png"))
	{
		sprite_walk = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/walk_strip"+string(index)+".png", index, false, false, sprite_walk_xorig, sprite_walk_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/walk_strip"+string(index)+".png"))
	{
		sprite_walk = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/walk_strip"+string(index)+".png", index, false, false, sprite_walk_xorig, sprite_walk_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/walk.png"))
{
	sprite_walk = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/walk.png", 1, false, false, sprite_walk_xorig, sprite_walk_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/walk.png"))
{
	sprite_walk = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/walk.png", 1, false, false, sprite_walk_xorig, sprite_walk_yorig);
}
#endregion /*Walk sprite END*/

#region /*Run sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run_strip"+string(index)+".png"))
	{
		sprite_run = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run_strip"+string(index)+".png", index, false, false, sprite_run_xorig, sprite_run_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash_strip"+string(index)+".png"))
	{
		sprite_run = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash_strip"+string(index)+".png", index, false, false, sprite_run_xorig, sprite_run_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run_strip"+string(index)+".png"))
	{
		sprite_run = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run_strip"+string(index)+".png", index, false, false, sprite_run_xorig, sprite_run_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash_strip"+string(index)+".png"))
	{
		sprite_run = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash_strip"+string(index)+".png", index, false, false, sprite_run_xorig, sprite_run_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run.png"))
{
	sprite_run = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run.png", 1, false, false, sprite_run_xorig, sprite_run_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash.png"))
{
	sprite_run = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash.png", 1, false, false, sprite_run_xorig, sprite_run_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run.png"))
{
	sprite_run = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run.png", 1, false, false, sprite_run_xorig, sprite_run_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash.png"))
{
	sprite_run = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash.png", 1, false, false, sprite_run_xorig, sprite_run_yorig);
}
#endregion /*Run sprite END*/

#region /*Run 2 sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run2_strip"+string(index)+".png"))
	{
		sprite_run2 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run2_strip"+string(index)+".png", index, false, false, sprite_run2_xorig, sprite_run2_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash2_strip"+string(index)+".png"))
	{
		sprite_run2 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash2_strip"+string(index)+".png", index, false, false, sprite_run2_xorig, sprite_run2_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run2_strip"+string(index)+".png"))
	{
		sprite_run2 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run2_strip"+string(index)+".png", index, false, false, sprite_run2_xorig, sprite_run2_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash2_strip"+string(index)+".png"))
	{
		sprite_run2 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash2_strip"+string(index)+".png", index, false, false, sprite_run2_xorig, sprite_run2_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run2.png"))
{
	sprite_run2 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run2.png", 1, false, false, sprite_run2_xorig, sprite_run2_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash2.png"))
{
	sprite_run2 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash2.png", 1, false, false, sprite_run2_xorig, sprite_run2_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run2.png"))
{
	sprite_run2 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run2.png", 1, false, false, sprite_run2_xorig, sprite_run2_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash2.png"))
{
	sprite_run2 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash2.png", 1, false, false, sprite_run2_xorig, sprite_run2_yorig);
}
#endregion /*Run 2 sprite END*/

#region /*Run 3 sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run3_strip"+string(index)+".png"))
	{
		sprite_run3 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run3_strip"+string(index)+".png", index, false, false, sprite_run3_xorig, sprite_run3_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash3_strip"+string(index)+".png"))
	{
		sprite_run3 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash3_strip"+string(index)+".png", index, false, false, sprite_run3_xorig, sprite_run3_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run3_strip"+string(index)+".png"))
	{
		sprite_run3 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run3_strip"+string(index)+".png", index, false, false, sprite_run3_xorig, sprite_run3_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash3_strip"+string(index)+".png"))
	{
		sprite_run3 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash3_strip"+string(index)+".png", index, false, false, sprite_run3_xorig, sprite_run3_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run3.png"))
{
	sprite_run3 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run3.png", 1, false, false, sprite_run3_xorig, sprite_run3_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash3.png"))
{
	sprite_run3 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash3.png", 1, false, false, sprite_run3_xorig, sprite_run3_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run3.png"))
{
	sprite_run3 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run3.png", 1, false, false, sprite_run3_xorig, sprite_run3_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash3.png"))
{
	sprite_run3 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash3.png", 1, false, false, sprite_run3_xorig, sprite_run3_yorig);
}
#endregion /*Run 3 sprite END*/

#region /*Run 4 sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run4_strip"+string(index)+".png"))
	{
		sprite_run4 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run4_strip"+string(index)+".png", index, false, false, sprite_run4_xorig, sprite_run4_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash4_strip"+string(index)+".png"))
	{
		sprite_run4 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash4_strip"+string(index)+".png", index, false, false, sprite_run4_xorig, sprite_run4_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run4_strip"+string(index)+".png"))
	{
		sprite_run4 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run4_strip"+string(index)+".png", index, false, false, sprite_run4_xorig, sprite_run4_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash4_strip"+string(index)+".png"))
	{
		sprite_run4 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash4_strip"+string(index)+".png", index, false, false, sprite_run4_xorig, sprite_run4_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/run4.png"))
{
	sprite_run4 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/run4.png", 1, false, false, sprite_run4_xorig, sprite_run4_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dash4.png"))
{
	sprite_run4 = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dash4.png", 1, false, false, sprite_run4_xorig, sprite_run4_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run4.png"))
{
	sprite_run4 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/run4.png", 1, false, false, sprite_run4_xorig, sprite_run4_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash4.png"))
{
	sprite_run4 = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dash4.png", 1, false, false, sprite_run4_xorig, sprite_run4_yorig);
}
#endregion /*Run 4 sprite END*/

#region /*Jump sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/jump_strip"+string(index)+".png"))
	{
		sprite_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/jump_strip"+string(index)+".png", index, false, false, sprite_jump_xorig, sprite_jump_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/jump_strip"+string(index)+".png"))
	{
		sprite_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/jump_strip"+string(index)+".png", index, false, false, sprite_jump_xorig, sprite_jump_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/jump.png"))
{
	sprite_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/jump.png", 1, false, false, sprite_jump_xorig, sprite_jump_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/jump.png"))
{
	sprite_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/jump.png", 1, false, false, sprite_jump_xorig, sprite_jump_yorig);
}
#endregion /*Jump sprite END*/

#region /*Double Jump sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/double_jump_strip"+string(index)+".png"))
	{
		sprite_double_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/double_jump_strip"+string(index)+".png", index, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/doublejump_strip"+string(index)+".png"))
	{
		sprite_double_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/doublejump_strip"+string(index)+".png", index, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/double_jump_strip"+string(index)+".png"))
	{
		sprite_double_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/double_jump_strip"+string(index)+".png", index, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/doublejump_strip"+string(index)+".png"))
	{
		sprite_double_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/doublejump_strip"+string(index)+".png", index, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/double_jump.png"))
{
	sprite_double_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/double_jump.png", 1, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/doublejump.png"))
{
	sprite_double_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/doublejump.png", 1, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/double_jump.png"))
{
	sprite_double_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/double_jump.png", 1, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/doublejump.png"))
{
	sprite_double_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/doublejump.png", 1, false, false, sprite_double_jump_xorig, sprite_double_jump_yorig);
}
#endregion /*Double Jump sprite END*/

#region /*Triple Jump sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/triple_jump_strip"+string(index)+".png"))
	{
		sprite_triple_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/triple_jump_strip"+string(index)+".png", index, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/triplejump_strip"+string(index)+".png"))
	{
		sprite_triple_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/triplejump_strip"+string(index)+".png", index, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triple_jump_strip"+string(index)+".png"))
	{
		sprite_triple_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triple_jump_strip"+string(index)+".png", index, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triplejump_strip"+string(index)+".png"))
	{
		sprite_triple_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triplejump_strip"+string(index)+".png", index, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/triple_jump.png"))
{
	sprite_triple_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/triple_jump.png", 1, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/triplejump.png"))
{
	sprite_triple_jump = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/triplejump.png", 1, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triple_jump.png"))
{
	sprite_triple_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triple_jump.png", 1, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triplejump.png"))
{
	sprite_triple_jump = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/triplejump.png", 1, false, false, sprite_triple_jump_xorig, sprite_triple_jump_yorig);
}
#endregion /*Triple Jump sprite END*/

#region /*Fall sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/fall_strip"+string(index)+".png"))
	{
		sprite_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/fall_strip"+string(index)+".png", index, false, false, sprite_fall_xorig, sprite_fall_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall_strip"+string(index)+".png"))
	{
		sprite_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall_strip"+string(index)+".png", index, false, false, sprite_fall_xorig, sprite_fall_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/fall.png"))
{
	sprite_fall = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/fall.png", 1, false, false, sprite_fall_xorig, sprite_fall_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall.png"))
{
	sprite_fall = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall.png", 1, false, false, sprite_fall_xorig, sprite_fall_yorig);
}
#endregion /*Fall sprite END*/

#region /*Fall slower sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/fall_slower_strip"+string(index)+".png"))
	{
		sprite_fall_slower = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/fall_slower_strip"+string(index)+".png", index, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/fallslower_strip"+string(index)+".png"))
	{
		sprite_fall_slower = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/fallslower_strip"+string(index)+".png", index, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall_slower_strip"+string(index)+".png"))
	{
		sprite_fall_slower = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall_slower_strip"+string(index)+".png", index, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fallslower_strip"+string(index)+".png"))
	{
		sprite_fall_slower = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fallslower_strip"+string(index)+".png", index, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/fall_slower.png"))
{
	sprite_fall_slower = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/fall_slower.png", 1, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/fallslower.png"))
{
	sprite_fall_slower = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/fallslower.png", 1, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall_slower.png"))
{
	sprite_fall_slower = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fall_slower.png", 1, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fallslower.png"))
{
	sprite_fall_slower = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/fallslower.png", 1, false, false, sprite_fall_slower_xorig, sprite_fall_slower_yorig);
}
#endregion /*Fall slower sprite END*/

#region /*Climb under still sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_still_strip"+string(index)+".png"))
	{
		sprite_climb_under_still = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_still_strip"+string(index)+".png", index, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_still_strip"+string(index)+".png"))
	{
		sprite_climb_under_still = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_still_strip"+string(index)+".png", index, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_still_strip"+string(index)+".png"))
	{
		sprite_climb_under_still = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_still_strip"+string(index)+".png", index, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_still_strip"+string(index)+".png"))
	{
		sprite_climb_under_still = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_still_strip"+string(index)+".png", index, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_still.png"))
{
	sprite_climb_under_still = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_still.png", 1, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_still.png"))
{
	sprite_climb_under_still = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_still.png", 1, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_still.png"))
{
	sprite_climb_under_still = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_still.png", 1, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_still.png"))
{
	sprite_climb_under_still = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_still.png", 1, false, false, sprite_climb_under_still_xorig, sprite_climb_under_still_yorig);
}
#endregion /*Climb under still sprite END*/

#region /*Climb under sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_strip"+string(index)+".png"))
	{
		sprite_climb_under = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_strip"+string(index)+".png", index, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_strip"+string(index)+".png"))
	{
		sprite_climb_under = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_strip"+string(index)+".png", index, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_strip"+string(index)+".png"))
	{
		sprite_climb_under = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_strip"+string(index)+".png", index, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_strip"+string(index)+".png"))
	{
		sprite_climb_under = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_strip"+string(index)+".png", index, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under.png"))
{
	sprite_climb_under = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under.png", 1, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder.png"))
{
	sprite_climb_under = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder.png", 1, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under.png"))
{
	sprite_climb_under = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under.png", 1, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder.png"))
{
	sprite_climb_under = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder.png", 1, false, false, sprite_climb_under_xorig, sprite_climb_under_yorig);
}
#endregion /*Climb under sprite END*/

#region /*Climb under look up sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_look_up_strip"+string(index)+".png"))
	{
		sprite_climb_under_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_look_up_strip"+string(index)+".png", index, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_lookup_strip"+string(index)+".png"))
	{
		sprite_climb_under_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_lookup_strip"+string(index)+".png", index, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_look_up_strip"+string(index)+".png"))
	{
		sprite_climb_under_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_look_up_strip"+string(index)+".png", index, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_lookup_strip"+string(index)+".png"))
	{
		sprite_climb_under_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_lookup_strip"+string(index)+".png", index, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_look_up.png"))
{
	sprite_climb_under_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_look_up.png", 1, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_lookup.png"))
{
	sprite_climb_under_look_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_lookup.png", 1, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_look_up.png"))
{
	sprite_climb_under_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_look_up.png", 1, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_lookup.png"))
{
	sprite_climb_under_look_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_lookup.png", 1, false, false, sprite_climb_under_look_up_xorig, sprite_climb_under_look_up_yorig);
}
#endregion /*Climb under look up sprite END*/

#region /*Climb under spin sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin.png"))
{
	sprite_climb_under_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin.png", 1, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin.png"))
{
	sprite_climb_under_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin.png", 1, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin.png"))
{
	sprite_climb_under_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin.png", 1, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin.png"))
{
	sprite_climb_under_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin.png", 1, false, false, sprite_climb_under_spin_xorig, sprite_climb_under_spin_yorig);
}
#endregion /*Climb under spin sprite END*/

#region /*Climb under spin fast sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin_fast_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin_fast = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin_fast_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin_fast_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin_fast = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin_fast_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin_fast_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin_fast = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin_fast_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin_fast_strip"+string(index)+".png"))
	{
		sprite_climb_under_spin_fast = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin_fast_strip"+string(index)+".png", index, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin_fast.png"))
{
	sprite_climb_under_spin_fast = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climb_under_spin_fast.png", 1, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin_fast.png"))
{
	sprite_climb_under_spin_fast = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/climbunder_spin_fast.png", 1, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin_fast.png"))
{
	sprite_climb_under_spin_fast = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climb_under_spin_fast.png", 1, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin_fast.png"))
{
	sprite_climb_under_spin_fast = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/climbunder_spin_fast.png", 1, false, false, sprite_climb_under_spin_fast_xorig, sprite_climb_under_spin_fast_yorig);
}
#endregion /*Climb under spin fast sprite END*/

#region /*Ground pound sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/ground_pound_strip"+string(index)+".png"))
	{
		sprite_ground_pound = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/ground_pound_strip"+string(index)+".png", index, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/groundpound_strip"+string(index)+".png"))
	{
		sprite_ground_pound = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/groundpound_strip"+string(index)+".png", index, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound_strip"+string(index)+".png"))
	{
		sprite_ground_pound = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound_strip"+string(index)+".png", index, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound_strip"+string(index)+".png"))
	{
		sprite_ground_pound = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound_strip"+string(index)+".png", index, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/ground_pound.png"))
{
	sprite_ground_pound = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/ground_pound.png", 1, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/groundpound.png"))
{
	sprite_ground_pound = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/groundpound.png", 1, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound.png"))
{
	sprite_ground_pound = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound.png", 1, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound.png"))
{
	sprite_ground_pound = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound.png", 1, false, false, sprite_ground_pound_xorig, sprite_ground_pound_yorig);
}
#endregion /*Ground pound sprite END*/

#region /*Ground pound get up sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/ground_pound_get_up_strip"+string(index)+".png"))
	{
		sprite_ground_pound_get_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/ground_pound_get_up_strip"+string(index)+".png", index, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/groundpound_getup_strip"+string(index)+".png"))
	{
		sprite_ground_pound_get_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/groundpound_getup_strip"+string(index)+".png", index, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound_get_up_strip"+string(index)+".png"))
	{
		sprite_ground_pound_get_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound_get_up_strip"+string(index)+".png", index, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound_getup_strip"+string(index)+".png"))
	{
		sprite_ground_pound_get_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound_getup_strip"+string(index)+".png", index, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/ground_pound_get_up.png"))
{
	sprite_ground_pound_get_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/ground_pound_get_up.png", 1, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/groundpound_getup.png"))
{
	sprite_ground_pound_get_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/groundpound_getup.png", 1, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound_get_up.png"))
{
	sprite_ground_pound_get_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/ground_pound_get_up.png", 1, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound_getup.png"))
{
	sprite_ground_pound_get_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/groundpound_getup.png", 1, false, false, sprite_ground_pound_get_up_xorig, sprite_ground_pound_get_up_yorig);
}
#endregion /*Ground pound get up sprite END*/

#region /*Stomp spin sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stomp_spin_strip"+string(index)+".png"))
	{
		sprite_stomp_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stomp_spin_strip"+string(index)+".png", index, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stompspin_strip"+string(index)+".png"))
	{
		sprite_stomp_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stompspin_strip"+string(index)+".png", index, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stomp_spin_strip"+string(index)+".png"))
	{
		sprite_stomp_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stomp_spin_strip"+string(index)+".png", index, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stompspin_strip"+string(index)+".png"))
	{
		sprite_stomp_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stompspin_strip"+string(index)+".png", index, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stomp_spin.png"))
{
	sprite_stomp_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stomp_spin.png", 1, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/stompspin.png"))
{
	sprite_stomp_spin = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/stompspin.png", 1, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stomp_spin.png"))
{
	sprite_stomp_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stomp_spin.png", 1, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stompspin.png"))
{
	sprite_stomp_spin = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/stompspin.png", 1, false, false, sprite_stomp_spin_xorig, sprite_stomp_spin_yorig);
}
#endregion /*Stomp spin sprite END*/

#region /*Spring up sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/spring_up_strip"+string(index)+".png"))
	{
		sprite_spring_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/spring_up_strip"+string(index)+".png", index, false, false, sprite_spring_up_xorig, sprite_spring_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_up_strip"+string(index)+".png"))
	{
		sprite_spring_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_up_strip"+string(index)+".png", index, false, false, sprite_spring_up_xorig, sprite_spring_up_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/spring_up.png"))
{
	sprite_spring_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/spring_up.png", 1, false, false, sprite_spring_up_xorig, sprite_spring_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_up.png"))
{
	sprite_spring_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_up.png", 1, false, false, sprite_spring_up_xorig, sprite_spring_up_yorig);
}
#endregion /*Spring up sprite END*/

#region /*Spring transition sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/spring_transition_strip"+string(index)+".png"))
	{
		sprite_spring_transition = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/spring_transition_strip"+string(index)+".png", index, false, false, sprite_spring_transition_xorig, sprite_spring_transition_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_transition_strip"+string(index)+".png"))
	{
		sprite_spring_transition = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_transition_strip"+string(index)+".png", index, false, false, sprite_spring_transition_xorig, sprite_spring_transition_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/spring_transition.png"))
{
	sprite_spring_transition = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/spring_transition.png", 1, false, false, sprite_spring_transition_xorig, sprite_spring_transition_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_transition.png"))
{
	sprite_spring_transition = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_transition.png", 1, false, false, sprite_spring_transition_xorig, sprite_spring_transition_yorig);
}
#endregion /*Spring transition sprite END*/

#region /*Spring down sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/spring_down_strip"+string(index)+".png"))
	{
		sprite_spring_down = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/spring_down_strip"+string(index)+".png", index, false, false, sprite_spring_down_xorig, sprite_spring_down_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_down_strip"+string(index)+".png"))
	{
		sprite_spring_down = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_down_strip"+string(index)+".png", index, false, false, sprite_spring_down_xorig, sprite_spring_down_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/spring_down.png"))
{
	sprite_spring_down = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/spring_down.png", 1, false, false, sprite_spring_down_xorig, sprite_spring_down_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_down.png"))
{
	sprite_spring_down = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/spring_down.png", 1, false, false, sprite_spring_down_xorig, sprite_spring_down_yorig);
}
#endregion /*Spring down sprite END*/

#region /*Wall slide sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_strip"+string(index)+".png"))
	{
		sprite_wall_slide = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_strip"+string(index)+".png", index, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wallslide_strip"+string(index)+".png"))
	{
		sprite_wall_slide = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wallslide_strip"+string(index)+".png", index, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_strip"+string(index)+".png"))
	{
		sprite_wall_slide = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_strip"+string(index)+".png", index, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_strip"+string(index)+".png"))
	{
		sprite_wall_slide = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_strip"+string(index)+".png", index, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wall_slide.png"))
{
	sprite_wall_slide = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wall_slide.png", 1, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wallslide.png"))
{
	sprite_wall_slide = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wallslide.png", 1, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide.png"))
{
	sprite_wall_slide = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide.png", 1, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide.png"))
{
	sprite_wall_slide = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide.png", 1, false, false, sprite_wall_slide_xorig, sprite_wall_slide_yorig);
}
#endregion /*Wall slide sprite END*/

#region /*Wall slide up sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_up_strip"+string(index)+".png"))
	{
		sprite_wall_slide_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_up_strip"+string(index)+".png", index, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wallslide_up_strip"+string(index)+".png"))
	{
		sprite_wall_slide_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wallslide_up_strip"+string(index)+".png", index, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_up_strip"+string(index)+".png"))
	{
		sprite_wall_slide_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_up_strip"+string(index)+".png", index, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_up_strip"+string(index)+".png"))
	{
		sprite_wall_slide_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_up_strip"+string(index)+".png", index, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_up.png"))
{
	sprite_wall_slide_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_up.png", 1, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wallslide_up.png"))
{
	sprite_wall_slide_up = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wallslide_up.png", 1, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_up.png"))
{
	sprite_wall_slide_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_up.png", 1, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_up.png"))
{
	sprite_wall_slide_up = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_up.png", 1, false, false, sprite_wall_slide_up_xorig, sprite_wall_slide_up_yorig);
}
#endregion /*Wall slide up sprite END*/

#region /*Wall slide down sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_down_strip"+string(index)+".png"))
	{
		sprite_wall_slide_down = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_down_strip"+string(index)+".png", index, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
	}
	else
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wallslide_down_strip"+string(index)+".png"))
	{
		sprite_wall_slide_down = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wallslide_down_strip"+string(index)+".png", index, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_down_strip"+string(index)+".png"))
	{
		sprite_wall_slide_down = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_down_strip"+string(index)+".png", index, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_down_strip"+string(index)+".png"))
	{
		sprite_wall_slide_down = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_down_strip"+string(index)+".png", index, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_down.png"))
{
	sprite_wall_slide_down = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wall_slide_down.png", 1, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/wallslide_down.png"))
{
	sprite_wall_slide_down = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/wallslide_down.png", 1, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_down.png"))
{
	sprite_wall_slide_down = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wall_slide_down.png", 1, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_down.png"))
{
	sprite_wall_slide_down = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/wallslide_down.png", 1, false, false, sprite_wall_slide_down_xorig, sprite_wall_slide_down_yorig);
}
#endregion /*Wall slide down sprite END*/

#region /*Dive sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dive_strip"+string(index)+".png"))
	{
		sprite_dive = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dive_strip"+string(index)+".png", index, false, false, sprite_dive_xorig, sprite_dive_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dive_strip"+string(index)+".png"))
	{
		sprite_dive = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dive_strip"+string(index)+".png", index, false, false, sprite_dive_xorig, sprite_dive_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/dive.png"))
{
	sprite_dive = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/dive.png", 1, false, false, sprite_dive_xorig, sprite_dive_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dive.png"))
{
	sprite_dive = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/dive.png", 1, false, false, sprite_dive_xorig, sprite_dive_yorig);
}
#endregion /*Dive sprite END*/

#region /*Die sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/die_strip"+string(index)+".png"))
	{
		sprite_die = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/die_strip"+string(index)+".png", index, false, false, sprite_die_xorig, sprite_die_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/die_strip"+string(index)+".png"))
	{
		sprite_die = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/die_strip"+string(index)+".png", index, false, false, sprite_die_xorig, sprite_die_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/die.png"))
{
	sprite_die = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/die.png", 1, false, false, sprite_die_xorig, sprite_die_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/die.png"))
{
	sprite_die = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/die.png", 1, false, false, sprite_die_xorig, sprite_die_yorig);
}
#endregion /*Die sprite END*/

#region /*Vine climb sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/vine_climb_strip"+string(index)+".png"))
	{
		sprite_vine_climb = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/vine_climb_strip"+string(index)+".png", index, false, false, sprite_vine_climb_xorig, sprite_vine_climb_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_climb_strip"+string(index)+".png"))
	{
		sprite_vine_climb = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_climb_strip"+string(index)+".png", index, false, false, sprite_vine_climb_xorig, sprite_vine_climb_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/vine_climb.png"))
{
	sprite_vine_climb = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/vine_climb.png", 1, false, false, sprite_vine_climb_xorig, sprite_vine_climb_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_climb.png"))
{
	sprite_vine_climb = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_climb.png", 1, false, false, sprite_vine_climb_xorig, sprite_vine_climb_yorig);
}
#endregion /*Vine climb sprite END*/

#region /*Vine stay sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/vine_stay_strip"+string(index)+".png"))
	{
		sprite_vine_stay = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/vine_stay_strip"+string(index)+".png", index, false, false, sprite_vine_stay_xorig, sprite_vine_stay_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_stay_strip"+string(index)+".png"))
	{
		sprite_vine_stay = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_stay_strip"+string(index)+".png", index, false, false, sprite_vine_stay_xorig, sprite_vine_stay_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/vine_stay.png"))
{
	sprite_vine_stay = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/vine_stay.png", 1, false, false, sprite_vine_stay_xorig, sprite_vine_stay_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_stay.png"))
{
	sprite_vine_stay = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/vine_stay.png", 1, false, false, sprite_vine_stay_xorig, sprite_vine_stay_yorig);
}
#endregion /*Vine stay sprite END*/

#endregion /*Sprite variables END*/

#region /*Sound variables*/

#region /*Voices*/

#region /*Voice Wall Jump*/

#region /*Voice Wall Jump 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick1.ogg"))
{
	voice_wall_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick1.ogg");
}
else
{
	voice_wall_jump_1 = noone;
}
#endregion /*Voice Wall Jump 1 END*/

#region /*Voice Wall Jump 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick2.ogg"))
{
	voice_wall_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick2.ogg");
}
else
{
	voice_wall_jump_2 = noone;
}
#endregion /*Voice Wall Jump 2 END*/

#region /*Voice Wall Jump 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick3.ogg"))
{
	voice_wall_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick3.ogg");
}
else
{
	voice_wall_jump_3 = noone;
}
#endregion /*Voice Wall Jump 3 END*/

#region /*Voice Wall Jump 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick4.ogg"))
{
	voice_wall_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick4.ogg");
}
else
{
	voice_wall_jump_4 = noone;
}
#endregion /*Voice Wall Jump 4 END*/

#region /*Voice Wall Jump 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick5.ogg"))
{
	voice_wall_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick5.ogg");
}
else
{
	voice_wall_jump_5 = noone;
}
#endregion /*Voice Wall Jump 5 END*/

#region /*Voice Wall Jump 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick6.ogg"))
{
	voice_wall_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick6.ogg");
}
else
{
	voice_wall_jump_6 = noone;
}
#endregion /*Voice Wall Jump 6 END*/

#region /*Voice Wall Jump 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick7.ogg"))
{
	voice_wall_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick7.ogg");
}
else
{
	voice_wall_jump_7 = noone;
}
#endregion /*Voice Wall Jump 7 END*/

#region /*Voice Wall Jump 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick8.ogg"))
{
	voice_wall_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick8.ogg");
}
else
{
	voice_wall_jump_8 = noone;
}
#endregion /*Voice Wall Jump 8 END*/

#region /*Voice Wall Jump 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick9.ogg"))
{
	voice_wall_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick9.ogg");
}
else
{
	voice_wall_jump_9 = noone;
}
#endregion /*Voice Wall Jump 9 END*/

#region /*Voice Wall Jump 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_jump10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/walljump10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wall_kick10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick10.ogg"))
{
	voice_wall_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/wallkick10.ogg");
}
else
{
	voice_wall_jump_10 = noone;
}
#endregion /*Voice Wall Jump 10 END*/

#endregion /*Voice Wall Jump END*/

#region /*Voice Start Running*/

#region /*Voice Start Running 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_dash1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash_1.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startdash.ogg"))
{
	voice_start_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/startrunning1.ogg");
}
else
{
	voice_start_running_1 = noone;
}
#endregion /*Voice Start Running 1 END*/

#region /*Voice Start Running 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_2.ogg"))
{
	voice_start_running_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running2.ogg"))
{
	voice_start_running_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_2.ogg"))
{
	voice_start_running_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running2.ogg"))
{
	voice_start_running_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running2.ogg");
}
else
{
	voice_start_running_2 = noone;
}
#endregion /*Voice Start Running 2 END*/

#region /*Voice Start Running 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_3.ogg"))
{
	voice_start_running_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running3.ogg"))
{
	voice_start_running_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_3.ogg"))
{
	voice_start_running_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running3.ogg"))
{
	voice_start_running_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running3.ogg");
}
else
{
	voice_start_running_3 = noone;
}
#endregion /*Voice Start Running 3 END*/

#region /*Voice Start Running 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_4.ogg"))
{
	voice_start_running_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running4.ogg"))
{
	voice_start_running_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_4.ogg"))
{
	voice_start_running_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running4.ogg"))
{
	voice_start_running_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running4.ogg");
}
else
{
	voice_start_running_4 = noone;
}
#endregion /*Voice Start Running 4 END*/

#region /*Voice Start Running 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_5.ogg"))
{
	voice_start_running_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running5.ogg"))
{
	voice_start_running_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_5.ogg"))
{
	voice_start_running_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running5.ogg"))
{
	voice_start_running_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running5.ogg");
}
else
{
	voice_start_running_5 = noone;
}
#endregion /*Voice Start Running 5 END*/

#region /*Voice Start Running 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_6.ogg"))
{
	voice_start_running_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running6.ogg"))
{
	voice_start_running_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_6.ogg"))
{
	voice_start_running_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running6.ogg"))
{
	voice_start_running_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running6.ogg");
}
else
{
	voice_start_running_6 = noone;
}
#endregion /*Voice Start Running 6 END*/

#region /*Voice Start Running 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_7.ogg"))
{
	voice_start_running_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running7.ogg"))
{
	voice_start_running_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_7.ogg"))
{
	voice_start_running_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running7.ogg"))
{
	voice_start_running_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running7.ogg");
}
else
{
	voice_start_running_7 = noone;
}
#endregion /*Voice Start Running 7 END*/

#region /*Voice Start Running 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_8.ogg"))
{
	voice_start_running_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running8.ogg"))
{
	voice_start_running_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_8.ogg"))
{
	voice_start_running_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running8.ogg"))
{
	voice_start_running_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running8.ogg");
}
else
{
	voice_start_running_8 = noone;
}
#endregion /*Voice Start Running 8 END*/

#region /*Voice Start Running 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_9.ogg"))
{
	voice_start_running_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running9.ogg"))
{
	voice_start_running_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_9.ogg"))
{
	voice_start_running_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running9.ogg"))
{
	voice_start_running_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running9.ogg");
}
else
{
	voice_start_running_9 = noone;
}
#endregion /*Voice Start Running 9 END*/

#region /*Voice Start Running 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_10.ogg"))
{
	voice_start_running_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running10.ogg"))
{
	voice_start_running_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_10.ogg"))
{
	voice_start_running_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running10.ogg"))
{
	voice_start_running_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/start_running10.ogg");
}
else
{
	voice_start_running_10 = noone;
}
#endregion /*Voice Start Running 10 END*/

#endregion /*Voice Start Running END*/

#region /*Voice Rope Catch*/

#region /*Voice Rope Catch 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch.ogg"))
{
	voice_rope_catch_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch.ogg"))
{
	voice_rope_catch_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch1.ogg"))
{
	voice_rope_catch_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch1.ogg");
}
else
{
	voice_rope_catch_1 = noone;
}
#endregion /*Voice Rope Catch 1 END*/

#region /*Voice Rope Catch 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch2.ogg"))
{
	voice_rope_catch_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch2.ogg");
}
else
{
	voice_rope_catch_2 = noone;
}
#endregion /*Voice Rope Catch 2 END*/

#region /*Voice Rope Catch 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch3.ogg"))
{
	voice_rope_catch_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch3.ogg");
}
else
{
	voice_rope_catch_3 = noone;
}
#endregion /*Voice Rope Catch 3 END*/

#region /*Voice Rope Catch 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch4.ogg"))
{
	voice_rope_catch_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch4.ogg");
}
else
{
	voice_rope_catch_4 = noone;
}
#endregion /*Voice Rope Catch 4 END*/

#region /*Voice Rope Catch 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch5.ogg"))
{
	voice_rope_catch_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch5.ogg");
}
else
{
	voice_rope_catch_5 = noone;
}
#endregion /*Voice Rope Catch 5 END*/

#region /*Voice Rope Catch 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch6.ogg"))
{
	voice_rope_catch_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch6.ogg");
}
else
{
	voice_rope_catch_6 = noone;
}
#endregion /*Voice Rope Catch 6 END*/

#region /*Voice Rope Catch 7*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch7.ogg"))
{
	voice_rope_catch_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch7.ogg");
}
else
{
	voice_rope_catch_7 = noone;
}
#endregion /*Voice Rope Catch 7 END*/

#region /*Voice Rope Catch 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch8.ogg"))
{
	voice_rope_catch_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch8.ogg");
}
else
{
	voice_rope_catch_8 = noone;
}
#endregion /*Voice Rope Catch 8 END*/

#region /*Voice Rope Catch 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch9.ogg"))
{
	voice_rope_catch_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch9.ogg");
}
else
{
	voice_rope_catch_9 = noone;
}
#endregion /*Voice Rope Catch 9 END*/

#region /*Voice Rope Catch 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch10.ogg"))
{
	voice_rope_catch_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/rope_catch10.ogg");
}
else
{
	voice_rope_catch_10 = noone;
}
#endregion /*Voice Rope Catch 10 END*/

#endregion /*Voice Rope Catch END*/

#region /*Voice Jump Spring*/

#region /*Voice Jump Spring 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring.ogg"))
{
	voice_jump_spring_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring.ogg"))
{
	voice_jump_spring_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring1.ogg"))
{
	voice_jump_spring_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring1.ogg");
}
else
{
	voice_jump_spring_1 = noone;
}
#endregion /*Voice Jump Spring 1 END*/

#region /*Voice Jump Spring 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring2.ogg"))
{
	voice_jump_spring_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring2.ogg");
}
else
{
	voice_jump_spring_2 = noone;
}
#endregion /*Voice Jump Spring 2 END*/

#region /*Voice Jump Spring 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring3.ogg"))
{
	voice_jump_spring_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring3.ogg");
}
else
{
	voice_jump_spring_3 = noone;
}
#endregion /*Voice Jump Spring 3 END*/

#region /*Voice Jump Spring 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring4.ogg"))
{
	voice_jump_spring_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring4.ogg");
}
else
{
	voice_jump_spring_4 = noone;
}
#endregion /*Voice Jump Spring 4 END*/

#region /*Voice Jump Spring 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring5.ogg"))
{
	voice_jump_spring_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring5.ogg");
}
else
{
	voice_jump_spring_5 = noone;
}
#endregion /*Voice Jump Spring 5 END*/

#region /*Voice Jump Spring 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring6.ogg"))
{
	voice_jump_spring_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring6.ogg");
}
else
{
	voice_jump_spring_6 = noone;
}
#endregion /*Voice Jump Spring 6 END*/

#region /*Voice Jump Spring 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring7.ogg"))
{
	voice_jump_spring_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring7.ogg");
}
else
{
	voice_jump_spring_7 = noone;
}
#endregion /*Voice Jump Spring 7 END*/

#region /*Voice Jump Spring 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring8.ogg"))
{
	voice_jump_spring_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring8.ogg");
}
else
{
	voice_jump_spring_8 = noone;
}
#endregion /*Voice Jump Spring 8 END*/

#region /*Voice Jump Spring 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring9.ogg"))
{
	voice_jump_spring_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring9.ogg");
}
else
{
	voice_jump_spring_9 = noone;
}
#endregion /*Voice Jump Spring 9 END*/

#region /*Voice Jump Spring 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring10.ogg"))
{
	voice_jump_spring_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_spring10.ogg");
}
else
{
	voice_jump_spring_10 = noone;
}
#endregion /*Voice Jump Spring 10 END*/

#endregion /*Voice Jump Spring END*/

#region /*Voice Jump Rope*/

#region /*Voice Jump Rope 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope.ogg"))
{
	voice_jump_rope_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope.ogg"))
{
	voice_jump_rope_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope1.ogg"))
{
	voice_jump_rope_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope1.ogg");
}
else
{
	voice_jump_rope_1 = noone;
}
#endregion /*Voice Jump Rope 1 END*/

#region /*Voice Jump Rope 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope2.ogg"))
{
	voice_jump_rope_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope2.ogg");
}
else
{
	voice_jump_rope_2 = noone;
}
#endregion /*Voice Jump Rope 2 END*/

#region /*Voice Jump Rope 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope3.ogg"))
{
	voice_jump_rope_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope3.ogg");
}
else
{
	voice_jump_rope_3 = noone;
}
#endregion /*Voice Jump Rope 3 END*/

#region /*Voice Jump Rope 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope4.ogg"))
{
	voice_jump_rope_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope4.ogg");
}
else
{
	voice_jump_rope_4 = noone;
}
#endregion /*Voice Jump Rope 4 END*/

#region /*Voice Jump Rope 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope5.ogg"))
{
	voice_jump_rope_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope5.ogg");
}
else
{
	voice_jump_rope_5 = noone;
}
#endregion /*Voice Jump Rope 5 END*/

#region /*Voice Jump Rope 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope6.ogg"))
{
	voice_jump_rope_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope6.ogg");
}
else
{
	voice_jump_rope_6 = noone;
}
#endregion /*Voice Jump Rope 6 END*/

#region /*Voice Jump Rope 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope7.ogg"))
{
	voice_jump_rope_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope7.ogg");
}
else
{
	voice_jump_rope_7 = noone;
}
#endregion /*Voice Jump Rope 7 END*/

#region /*Voice Jump Rope 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope8.ogg"))
{
	voice_jump_rope_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope8.ogg");
}
else
{
	voice_jump_rope_8 = noone;
}
#endregion /*Voice Jump Rope 8 END*/

#region /*Voice Jump Rope 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope9.ogg"))
{
	voice_jump_rope_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope9.ogg");
}
else
{
	voice_jump_rope_9 = noone;
}
#endregion /*Voice Jump Rope 9 END*/

#region /*Voice Jump Rope 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope10.ogg"))
{
	voice_jump_rope_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_rope10.ogg");
}
else
{
	voice_jump_rope_10 = noone;
}
#endregion /*Voice Jump Rope 10 END*/

#endregion /*Voice Jump Rope END*/

#region /*Voice Jump*/

#region /*Voice Jump 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump.ogg"))
{
	voice_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_1.ogg"))
{
	voice_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump1.ogg"))
{
	voice_jump_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump.ogg"))
{
	voice_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_1.ogg"))
{
	voice_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump1.ogg"))
{
	voice_jump_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump1.ogg");
}
else
{
	voice_jump_1 = noone;
}
#endregion /*Voice Jump 1 END*/

#region /*Voice Jump 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2.ogg"))
{
	voice_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2.ogg"))
{
	voice_jump_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2.ogg"))
{
	voice_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2.ogg"))
{
	voice_jump_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2.ogg");
}
else
{
	voice_jump_2 = noone;
}
#endregion /*Voice Jump 2 END*/

#region /*Voice Jump 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3.ogg"))
{
	voice_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3.ogg"))
{
	voice_jump_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3.ogg"))
{
	voice_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3.ogg"))
{
	voice_jump_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3.ogg");
}
else
{
	voice_jump_3 = noone;
}
#endregion /*Voice Jump 3 END*/

#region /*Voice Jump 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_4.ogg"))
{
	voice_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump4.ogg"))
{
	voice_jump_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_4.ogg"))
{
	voice_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump4.ogg"))
{
	voice_jump_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump4.ogg");
}
else
{
	voice_jump_4 = noone;
}
#endregion /*Voice Jump 4 END*/

#region /*Voice Jump 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_5.ogg"))
{
	voice_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump5.ogg"))
{
	voice_jump_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_5.ogg"))
{
	voice_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump5.ogg"))
{
	voice_jump_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump5.ogg");
}
else
{
	voice_jump_5 = noone;
}
#endregion /*Voice Jump 5 END*/

#region /*Voice Jump 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_6.ogg"))
{
	voice_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump6.ogg"))
{
	voice_jump_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_6.ogg"))
{
	voice_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump6.ogg"))
{
	voice_jump_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump6.ogg");
}
else
{
	voice_jump_6 = noone;
}
#endregion /*Voice Jump 6 END*/

#region /*Voice Jump 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_7.ogg"))
{
	voice_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump7.ogg"))
{
	voice_jump_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_7.ogg"))
{
	voice_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump7.ogg"))
{
	voice_jump_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump7.ogg");
}
else
{
	voice_jump_7 = noone;
}
#endregion /*Voice Jump 7 END*/

#region /*Voice Jump 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_8.ogg"))
{
	voice_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump8.ogg"))
{
	voice_jump_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_8.ogg"))
{
	voice_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump8.ogg"))
{
	voice_jump_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump8.ogg");
}
else
{
	voice_jump_8 = noone;
}
#endregion /*Voice Jump 8 END*/

#region /*Voice Jump 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_9.ogg"))
{
	voice_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump9.ogg"))
{
	voice_jump_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_9.ogg"))
{
	voice_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump9.ogg"))
{
	voice_jump_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump9.ogg");
}
else
{
	voice_jump_9 = noone;
}
#endregion /*Voice Jump 9 END*/

#region /*Voice Jump 10*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump10.ogg"))
{
	voice_jump_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump10.ogg");
}
else
{
	voice_jump_10 = noone;
}
#endregion /*Voice Jump 10 END*/

#endregion /*Voice Jump END*/

#region /*Voice Jump 3rd*/

#region /*Voice Jump 3rd 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd1.ogg"))
{
	voice_jump_3rd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd1.ogg");
}
else
{
	voice_jump_3rd_1 = noone;
}
#endregion /*Voice Jump 3rd 1 END*/

#region /*Voice Jump 3rd 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd2.ogg"))
{
	voice_jump_3rd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd2.ogg");
}
else
{
	voice_jump_3rd_2 = noone;
}
#endregion /*Voice Jump 3rd 2 END*/

#region /*Voice Jump 3rd 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/Voice Pack/jump_3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd3.ogg"))
{
	voice_jump_3rd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd3.ogg");
}
else
{
	voice_jump_3rd_3 = noone;
}
#endregion /*Voice Jump 3rd 3 END*/

#region /*Voice Jump 3rd 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd4.ogg"))
{
	voice_jump_3rd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd4.ogg");
}
else
{
	voice_jump_3rd_4 = noone;
}
#endregion /*Voice Jump 3rd 4 END*/

#region /*Voice Jump 3rd 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd5.ogg"))
{
	voice_jump_3rd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd5.ogg");
}
else
{
	voice_jump_3rd_5 = noone;
}
#endregion /*Voice Jump 3rd 5 END*/

#region /*Voice Jump 3rd 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd6.ogg"))
{
	voice_jump_3rd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd6.ogg");
}
else
{
	voice_jump_3rd_6 = noone;
}
#endregion /*Voice Jump 3rd 6 END*/

#region /*Voice Jump 3rd 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd7.ogg"))
{
	voice_jump_3rd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd7.ogg");
}
else
{
	voice_jump_3rd_7 = noone;
}
#endregion /*Voice Jump 3rd 7 END*/

#region /*Voice Jump 3rd 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd8.ogg"))
{
	voice_jump_3rd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd8.ogg");
}
else
{
	voice_jump_3rd_8 = noone;
}
#endregion /*Voice Jump 3rd 8 END*/

#region /*Voice Jump 3rd 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd9.ogg"))
{
	voice_jump_3rd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd9.ogg");
}
else
{
	voice_jump_3rd_9 = noone;
}
#endregion /*Voice Jump 3rd 9 END*/

#region /*Voice Jump 3rd 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_3rd10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd10.ogg"))
{
	voice_jump_3rd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump3rd10.ogg");
}
else
{
	voice_jump_3rd_10 = noone;
}
#endregion /*Voice Jump 3rd 10 END*/

#endregion /*Voice Jump 3rd END*/

#region /*Voice Jump 2nd*/

#region /*Voice Jump 2nd 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd1.ogg"))
{
	voice_jump_2nd_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd1.ogg");
}
else
{
	voice_jump_2nd_1 = noone;
}
#endregion /*Voice Jump 2nd 1 END*/

#region /*Voice Jump 2nd 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd2.ogg"))
{
	voice_jump_2nd_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd2.ogg");
}
else
{
	voice_jump_2nd_2 = noone;
}
#endregion /*Voice Jump 2nd 2 END*/

#region /*Voice Jump 2nd 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd3.ogg"))
{
	voice_jump_2nd_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd3.ogg");
}
else
{
	voice_jump_2nd_3 = noone;
}
#endregion /*Voice Jump 2nd 3 END*/

#region /*Voice Jump 2nd 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd4.ogg"))
{
	voice_jump_2nd_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd4.ogg");
}
else
{
	voice_jump_2nd_4 = noone;
}
#endregion /*Voice Jump 2nd 4 END*/

#region /*Voice Jump 2nd 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd5.ogg"))
{
	voice_jump_2nd_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd5.ogg");
}
else
{
	voice_jump_2nd_5 = noone;
}
#endregion /*Voice Jump 2nd 5 END*/

#region /*Voice Jump 2nd 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd6.ogg"))
{
	voice_jump_2nd_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd6.ogg");
}
else
{
	voice_jump_2nd_6 = noone;
}
#endregion /*Voice Jump 2nd 6 END*/

#region /*Voice Jump 2nd 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd7.ogg"))
{
	voice_jump_2nd_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd7.ogg");
}
else
{
	voice_jump_2nd_7 = noone;
}
#endregion /*Voice Jump 2nd 7 END*/

#region /*Voice Jump 2nd 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd8.ogg"))
{
	voice_jump_2nd_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd8.ogg");
}
else
{
	voice_jump_2nd_8 = noone;
}
#endregion /*Voice Jump 2nd 8 END*/

#region /*Voice Jump 2nd 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd9.ogg"))
{
	voice_jump_2nd_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd9.ogg");
}
else
{
	voice_jump_2nd_9 = noone;
}
#endregion /*Voice Jump 2nd 9 END*/

#region /*Voice Jump 2nd 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump_2nd10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd10.ogg"))
{
	voice_jump_2nd_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/jump2nd10.ogg");
}
else
{
	voice_jump_2nd_10 = noone;
}
#endregion /*Voice Jump 2nd 10 END*/

#endregion /*Voice Jump 2nd END*/

#region /*Voice Get Invincibility*/

#region /*Voice Get Invincibility 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_1.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg"))
{
	voice_get_invincibility_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star.ogg");
}
else
{
	voice_get_invincibility_1 = noone;
}
#endregion /*Voice Get Invincibility 1 END*/

#region /*Voice Get Invincibility 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star2.ogg"))
{
	voice_get_invincibility_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star2.ogg");
}
else
{
	voice_get_invincibility_2 = noone;
}
#endregion /*Voice Get Invincibility 2 END*/

#region /*Voice Get Invincibility 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star3.ogg"))
{
	voice_get_invincibility_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star3.ogg");
}
else
{
	voice_get_invincibility_3 = noone;
}
#endregion /*Voice Get Invincibility 3 END*/

#region /*Voice Get Invincibility 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star4.ogg"))
{
	voice_get_invincibility_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star4.ogg");
}
else
{
	voice_get_invincibility_4 = noone;
}
#endregion /*Voice Get Invincibility 4 END*/

#region /*Voice Get Invincibility 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star5.ogg"))
{
	voice_get_invincibility_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star5.ogg");
}
else
{
	voice_get_invincibility_5 = noone;
}
#endregion /*Voice Get Invincibility 5 END*/

#region /*Voice Get Invincibility 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star6.ogg"))
{
	voice_get_invincibility_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star6.ogg");
}
else
{
	voice_get_invincibility_6 = noone;
}
#endregion /*Voice Get Invincibility 6 END*/

#region /*Voice Get Invincibility 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star7.ogg"))
{
	voice_get_invincibility_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star7.ogg");
}
else
{
	voice_get_invincibility_7 = noone;
}
#endregion /*Voice Get Invincibility 7 END*/

#region /*Voice Get Invincibility 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star8.ogg"))
{
	voice_get_invincibility_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star8.ogg");
}
else
{
	voice_get_invincibility_8 = noone;
}
#endregion /*Voice Get Invincibility 8 END*/

#region /*Voice Get Invincibility 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star9.ogg"))
{
	voice_get_invincibility_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star9.ogg");
}
else
{
	voice_get_invincibility_9 = noone;
}
#endregion /*Voice Get Invincibility 9 END*/

#region /*Voice Get Invincibility 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_invincibility10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star10.ogg"))
{
	voice_get_invincibility_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/get_star10.ogg");
}
else
{
	voice_get_invincibility_10 = noone;
}
#endregion /*Voice Get Invincibility 10 END*/

#endregion /*Voice Get Invincibility END*/

#region /*Voice Enter Goal*/

#region /*Voice Enter Goal 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal.ogg"))
{
	voice_enter_goal_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal.ogg"))
{
	voice_enter_goal_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal1.ogg"))
{
	voice_enter_goal_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal1.ogg");
}
else
{
	voice_enter_goal_1 = noone;
}
#endregion /*Voice Enter Goal 1 END*/

#region /*Voice Enter Goal 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal2.ogg"))
{
	voice_enter_goal_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal2.ogg");
}
else
{
	voice_enter_goal_2 = noone;
}
#endregion /*Voice Enter Goal 2 END*/

#region /*Voice Enter Goal 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal3.ogg"))
{
	voice_enter_goal_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal3.ogg");
}
else
{
	voice_enter_goal_3 = noone;
}
#endregion /*Voice Enter Goal 3 END*/

#region /*Voice Enter Goal 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal4.ogg"))
{
	voice_enter_goal_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal4.ogg");
}
else
{
	voice_enter_goal_4 = noone;
}
#endregion /*Voice Enter Goal 4 END*/

#region /*Voice Enter Goal 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal5.ogg"))
{
	voice_enter_goal_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal5.ogg");
}
else
{
	voice_enter_goal_5 = noone;
}
#endregion /*Voice Enter Goal 5 END*/

#region /*Voice Enter Goal 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal6.ogg"))
{
	voice_enter_goal_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal6.ogg");
}
else
{
	voice_enter_goal_6 = noone;
}
#endregion /*Voice Enter Goal 6 END*/

#region /*Voice Enter Goal 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal7.ogg"))
{
	voice_enter_goal_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal7.ogg");
}
else
{
	voice_enter_goal_7 = noone;
}
#endregion /*Voice Enter Goal 7 END*/

#region /*Voice Enter Goal 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal8.ogg"))
{
	voice_enter_goal_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal8.ogg");
}
else
{
	voice_enter_goal_8 = noone;
}
#endregion /*Voice Enter Goal 8 END*/

#region /*Voice Enter Goal 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal9.ogg"))
{
	voice_enter_goal_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal9.ogg");
}
else
{
	voice_enter_goal_9 = noone;
}
#endregion /*Voice Enter Goal 9 END*/

#region /*Voice Enter Goal 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal10.ogg"))
{
	voice_enter_goal_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/enter_goal10.ogg");
}
else
{
	voice_enter_goal_10 = noone;
}
#endregion /*Voice Enter Goal 10 END*/

#endregion /*Voice Enter Goal END*/

#region /*Voice Dive*/

#region /*Voice Dive 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive.ogg"))
{
	voice_dive_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_1.ogg"))
{
	voice_dive_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive1.ogg"))
{
	voice_dive_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive.ogg"))
{
	voice_dive_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_1.ogg"))
{
	voice_dive_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive1.ogg"))
{
	voice_dive_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive1.ogg");
}
else
{
	voice_dive_1 = noone;
}
#endregion /*Voice Dive 1 END*/

#region /*Voice Dive 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_2.ogg"))
{
	voice_dive_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive2.ogg"))
{
	voice_dive_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_2.ogg"))
{
	voice_dive_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive2.ogg"))
{
	voice_dive_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive2.ogg");
}
else
{
	voice_dive_2 = noone;
}
#endregion /*Voice Dive 2 END*/

#region /*Voice Dive 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_3.ogg"))
{
	voice_dive_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive3.ogg"))
{
	voice_dive_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_3.ogg"))
{
	voice_dive_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive3.ogg"))
{
	voice_dive_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive3.ogg");
}
else
{
	voice_dive_3 = noone;
}
#endregion /*Voice Dive 3 END*/

#region /*Voice Dive 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_4.ogg"))
{
	voice_dive_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive4.ogg"))
{
	voice_dive_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_4.ogg"))
{
	voice_dive_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive4.ogg"))
{
	voice_dive_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive4.ogg");
}
else
{
	voice_dive_4 = noone;
}
#endregion /*Voice Dive 4 END*/

#region /*Voice Dive 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_5.ogg"))
{
	voice_dive_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive5.ogg"))
{
	voice_dive_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_5.ogg"))
{
	voice_dive_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive5.ogg"))
{
	voice_dive_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive5.ogg");
}
else
{
	voice_dive_5 = noone;
}
#endregion /*Voice Dive 5 END*/

#region /*Voice Dive 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_6.ogg"))
{
	voice_dive_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive6.ogg"))
{
	voice_dive_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_6.ogg"))
{
	voice_dive_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive6.ogg"))
{
	voice_dive_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive6.ogg");
}
else
{
	voice_dive_6 = noone;
}
#endregion /*Voice Dive 6 END*/

#region /*Voice Dive 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_7.ogg"))
{
	voice_dive_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive7.ogg"))
{
	voice_dive_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_7.ogg"))
{
	voice_dive_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive7.ogg"))
{
	voice_dive_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive7.ogg");
}
else
{
	voice_dive_7 = noone;
}
#endregion /*Voice Dive 7 END*/

#region /*Voice Dive 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_8.ogg"))
{
	voice_dive_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive8.ogg"))
{
	voice_dive_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_8.ogg"))
{
	voice_dive_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive8.ogg"))
{
	voice_dive_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive8.ogg");
}
else
{
	voice_dive_8 = noone;
}
#endregion /*Voice Dive 8 END*/

#region /*Voice Dive 9*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive9.ogg"))
{
	voice_dive_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive9.ogg");
}
else
{
	voice_dive_9 = noone;
}
#endregion /*Voice Dive 9 END*/

#region /*Voice Dive 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_10.ogg"))
{
	voice_dive_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive10.ogg"))
{
	voice_dive_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_10.ogg"))
{
	voice_dive_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive10.ogg"))
{
	voice_dive_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive10.ogg");
}
else
{
	voice_dive_10 = noone;
}
#endregion /*Voice Dive 10 END*/

#region /*Voice Dive 11*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_11.ogg"))
{
	voice_dive_11 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_11.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive11.ogg"))
{
	voice_dive_11 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive11.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_11.ogg"))
{
	voice_dive_11 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_11.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive11.ogg"))
{
	voice_dive_11 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive11.ogg");
}
else
{
	voice_dive_11 = noone;
}
#endregion /*Voice Dive 11 END*/

#region /*Voice Dive 12*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_12.ogg"))
{
	voice_dive_12 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_12.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive12.ogg"))
{
	voice_dive_12 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive12.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_12.ogg"))
{
	voice_dive_12 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_12.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive12.ogg"))
{
	voice_dive_12 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive12.ogg");
}
else
{
	voice_dive_12 = noone;
}
#endregion /*Voice Dive 12 END*/

#region /*Voice Dive 13*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_13.ogg"))
{
	voice_dive_13 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_13.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive13.ogg"))
{
	voice_dive_13 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive13.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_13.ogg"))
{
	voice_dive_13 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_13.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive13.ogg"))
{
	voice_dive_13 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive13.ogg");
}
else
{
	voice_dive_13 = noone;
}
#endregion /*Voice Dive 13 END*/

#region /*Voice Dive 14*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_14.ogg"))
{
	voice_dive_14 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_14.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive14.ogg"))
{
	voice_dive_14 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive14.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_14.ogg"))
{
	voice_dive_14 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_14.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive14.ogg"))
{
	voice_dive_14 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive14.ogg");
}
else
{
	voice_dive_14 = noone;
}
#endregion /*Voice Dive 14 END*/

#region /*Voice Dive 15*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_15.ogg"))
{
	voice_dive_15 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_15.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive15.ogg"))
{
	voice_dive_15 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive15.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_15.ogg"))
{
	voice_dive_15 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_15.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive15.ogg"))
{
	voice_dive_15 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive15.ogg");
}
else
{
	voice_dive_15 = noone;
}
#endregion /*Voice Dive 15 END*/

#region /*Voice Dive 16*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_16.ogg"))
{
	voice_dive_16 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_16.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive16.ogg"))
{
	voice_dive_16 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive16.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_16.ogg"))
{
	voice_dive_16 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_16.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive16.ogg"))
{
	voice_dive_16 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive16.ogg");
}
else
{
	voice_dive_16 = noone;
}
#endregion /*Voice Dive 16 END*/

#region /*Voice Dive 17*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_17.ogg"))
{
	voice_dive_17 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_17.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive17.ogg"))
{
	voice_dive_17 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive17.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_17.ogg"))
{
	voice_dive_17 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_17.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive17.ogg"))
{
	voice_dive_17 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive17.ogg");
}
else
{
	voice_dive_17 = noone;
}
#endregion /*Voice Dive 17 END*/

#region /*Voice Dive 18*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_18.ogg"))
{
	voice_dive_18 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_18.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive18.ogg"))
{
	voice_dive_18 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive18.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_18.ogg"))
{
	voice_dive_18 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_18.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive18.ogg"))
{
	voice_dive_18 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive18.ogg");
}
else
{
	voice_dive_18 = noone;
}
#endregion /*Voice Dive 18 END*/

#region /*Voice Dive 19*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_19.ogg"))
{
	voice_dive_19 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_19.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive19.ogg"))
{
	voice_dive_19 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive19.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_19.ogg"))
{
	voice_dive_19 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_19.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive19.ogg"))
{
	voice_dive_19 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive19.ogg");
}
else
{
	voice_dive_19 = noone;
}
#endregion /*Voice Dive 19 END*/

#region /*Voice Dive 20*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_20.ogg"))
{
	voice_dive_20 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_20.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive20.ogg"))
{
	voice_dive_20 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive20.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_20.ogg"))
{
	voice_dive_20 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive_20.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive20.ogg"))
{
	voice_dive_20 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/dive20.ogg");
}
else
{
	voice_dive_20 = noone;
}
#endregion /*Voice Dive 20 END*/

#endregion /*Voice Dive END*/

#region /*Voice Damage*/

#region /*Voice Damage 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage.ogg"))
{
	voice_damage_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_1.ogg"))
{
	voice_damage_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage1.ogg"))
{
	voice_damage_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage.ogg"))
{
	voice_damage_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_1.ogg"))
{
	voice_damage_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage1.ogg"))
{
	voice_damage_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage1.ogg");
}
else
{
	voice_damage_1 = noone;
}
#endregion /*Voice Damage 1 END*/

#region /*Voice Damage 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_2.ogg"))
{
	voice_damage_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage2.ogg"))
{
	voice_damage_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_2.ogg"))
{
	voice_damage_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage2.ogg"))
{
	voice_damage_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage2.ogg");
}
else
{
	voice_damage_2 = noone;
}
#endregion /*Voice Damage 2 END*/

#region /*Voice Damage 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_3.ogg"))
{
	voice_damage_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage3.ogg"))
{
	voice_damage_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_3.ogg"))
{
	voice_damage_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage3.ogg"))
{
	voice_damage_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage3.ogg");
}
else
{
	voice_damage_3 = noone;
}
#endregion /*Voice Damage 3 END*/

#region /*Voice Damage 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_4.ogg"))
{
	voice_damage_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage4.ogg"))
{
	voice_damage_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_4.ogg"))
{
	voice_damage_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage4.ogg"))
{
	voice_damage_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage4.ogg");
}
else
{
	voice_damage_4 = noone;
}
#endregion /*Voice Damage 4 END*/

#region /*Voice Damage 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_5.ogg"))
{
	voice_damage_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage5.ogg"))
{
	voice_damage_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_5.ogg"))
{
	voice_damage_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage5.ogg"))
{
	voice_damage_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage5.ogg");
}
else
{
	voice_damage_5 = noone;
}
#endregion /*Voice Damage 5 END*/

#region /*Voice Damage 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_6.ogg"))
{
	voice_damage_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage6.ogg"))
{
	voice_damage_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_6.ogg"))
{
	voice_damage_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage6.ogg"))
{
	voice_damage_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage6.ogg");
}
else
{
	voice_damage_6 = noone;
}
#endregion /*Voice Damage 6 END*/

#region /*Voice Damage 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_7.ogg"))
{
	voice_damage_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage7.ogg"))
{
	voice_damage_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_7.ogg"))
{
	voice_damage_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage7.ogg"))
{
	voice_damage_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage7.ogg");
}
else
{
	voice_damage_7 = noone;
}
#endregion /*Voice Damage 7 END*/

#region /*Voice Damage 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_8.ogg"))
{
	voice_damage_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage8.ogg"))
{
	voice_damage_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_8.ogg"))
{
	voice_damage_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage8.ogg"))
{
	voice_damage_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage8.ogg");
}
else
{
	voice_damage_8 = noone;
}
#endregion /*Voice Damage 8 END*/

#region /*Voice Damage 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_9.ogg"))
{
	voice_damage_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage9.ogg"))
{
	voice_damage_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_9.ogg"))
{
	voice_damage_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage9.ogg"))
{
	voice_damage_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage9.ogg");
}
else
{
	voice_damage_9 = noone;
}
#endregion /*Voice Damage 9 END*/

#region /*Voice Damage 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_10.ogg"))
{
	voice_damage_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage10.ogg"))
{
	voice_damage_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_10.ogg"))
{
	voice_damage_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage10.ogg"))
{
	voice_damage_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/damage10.ogg");
}
else
{
	voice_damage_10 = noone;
}
#endregion /*Voice Damage 10 END*/

#endregion /*Voice Damage END*/

#region /*Voice Burned Running*/

#region /*Voice Burned Running 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running.ogg"))
{
	voice_burned_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_1.ogg"))
{
	voice_burned_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running1.ogg"))
{
	voice_burned_running_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running.ogg"))
{
	voice_burned_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_1.ogg"))
{
	voice_burned_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running1.ogg"))
{
	voice_burned_running_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running1.ogg");
}
else
{
	voice_burned_running_1 = noone;
}
#endregion /*Voice Burned Running 1 END*/

#region /*Voice Burned Running 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_2.ogg"))
{
	voice_burned_running_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running2.ogg"))
{
	voice_burned_running_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_2.ogg"))
{
	voice_burned_running_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running2.ogg"))
{
	voice_burned_running_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running2.ogg");
}
else
{
	voice_burned_running_2 = noone;
}
#endregion /*Voice Burned Running 2 END*/

#region /*Voice Burned Running 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_3.ogg"))
{
	voice_burned_running_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running3.ogg"))
{
	voice_burned_running_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_3.ogg"))
{
	voice_burned_running_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running3.ogg"))
{
	voice_burned_running_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running3.ogg");
}
else
{
	voice_burned_running_3 = noone;
}
#endregion /*Voice Burned Running 3 END*/

#region /*Voice Burned Running 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_4.ogg"))
{
	voice_burned_running_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running4.ogg"))
{
	voice_burned_running_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_4.ogg"))
{
	voice_burned_running_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running4.ogg"))
{
	voice_burned_running_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running4.ogg");
}
else
{
	voice_burned_running_4 = noone;
}
#endregion /*Voice Burned Running 4 END*/

#region /*Voice Burned Running 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_5.ogg"))
{
	voice_burned_running_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running5.ogg"))
{
	voice_burned_running_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_5.ogg"))
{
	voice_burned_running_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running5.ogg"))
{
	voice_burned_running_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running5.ogg");
}
else
{
	voice_burned_running_5 = noone;
}
#endregion /*Voice Burned Running 5 END*/

#region /*Voice Burned Running 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_6.ogg"))
{
	voice_burned_running_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running6.ogg"))
{
	voice_burned_running_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_6.ogg"))
{
	voice_burned_running_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running6.ogg"))
{
	voice_burned_running_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running6.ogg");
}
else
{
	voice_burned_running_6 = noone;
}
#endregion /*Voice Burned Running 6 END*/

#region /*Voice Burned Running 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_7.ogg"))
{
	voice_burned_running_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running7.ogg"))
{
	voice_burned_running_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_7.ogg"))
{
	voice_burned_running_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running7.ogg"))
{
	voice_burned_running_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running7.ogg");
}
else
{
	voice_burned_running_7 = noone;
}
#endregion /*Voice Burned Running 7 END*/

#region /*Voice Burned Running 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_8.ogg"))
{
	voice_burned_running_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running8.ogg"))
{
	voice_burned_running_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_8.ogg"))
{
	voice_burned_running_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running8.ogg"))
{
	voice_burned_running_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running8.ogg");
}
else
{
	voice_burned_running_8 = noone;
}
#endregion /*Voice Burned Running 8 END*/

#region /*Voice Burned Running 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_9.ogg"))
{
	voice_burned_running_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running9.ogg"))
{
	voice_burned_running_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_9.ogg"))
{
	voice_burned_running_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running9.ogg"))
{
	voice_burned_running_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running9.ogg");
}
else
{
	voice_burned_running_9 = noone;
}
#endregion /*Voice Burned Running 9 END*/

#region /*Voice Burned Running 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_10.ogg"))
{
	voice_burned_running_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running10.ogg"))
{
	voice_burned_running_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_10.ogg"))
{
	voice_burned_running_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running10.ogg"))
{
	voice_burned_running_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_running10.ogg");
}
else
{
	voice_burned_running_10 = noone;
}
#endregion /*Voice Burned Running 10 END*/

#endregion /*Voice Burned Running END*/

#region /*Voice Burned*/

#region /*Voice Burned 1*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned.ogg"))
{
	voice_burned_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_1.ogg"))
{
	voice_burned_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_1.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned1.ogg"))
{
	voice_burned_1 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned.ogg"))
{
	voice_burned_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_1.ogg"))
{
	voice_burned_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_1.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned1.ogg"))
{
	voice_burned_1 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned1.ogg");
}
else
{
	voice_burned_1 = noone;
}
#endregion /*Voice Burned 1 END*/

#region /*Voice Burned 2*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_2.ogg"))
{
	voice_burned_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_2.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned2.ogg"))
{
	voice_burned_2 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_2.ogg"))
{
	voice_burned_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_2.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned2.ogg"))
{
	voice_burned_2 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned2.ogg");
}
else
{
	voice_burned_2 = noone;
}
#endregion /*Voice Burned 2 END*/

#region /*Voice Burned 3*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_3.ogg"))
{
	voice_burned_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_3.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned3.ogg"))
{
	voice_burned_3 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_3.ogg"))
{
	voice_burned_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_3.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned3.ogg"))
{
	voice_burned_3 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned3.ogg");
}
else
{
	voice_burned_3 = noone;
}
#endregion /*Voice Burned 3 END*/

#region /*Voice Burned 4*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_4.ogg"))
{
	voice_burned_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_4.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned4.ogg"))
{
	voice_burned_4 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_4.ogg"))
{
	voice_burned_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_4.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned4.ogg"))
{
	voice_burned_4 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned4.ogg");
}
else
{
	voice_burned_4 = noone;
}
#endregion /*Voice Burned 4 END*/

#region /*Voice Burned 5*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_5.ogg"))
{
	voice_burned_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_5.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned5.ogg"))
{
	voice_burned_5 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_5.ogg"))
{
	voice_burned_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_5.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned5.ogg"))
{
	voice_burned_5 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned5.ogg");
}
else
{
	voice_burned_5 = noone;
}
#endregion /*Voice Burned 5 END*/

#region /*Voice Burned 6*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_6.ogg"))
{
	voice_burned_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_6.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned6.ogg"))
{
	voice_burned_6 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_6.ogg"))
{
	voice_burned_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_6.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned6.ogg"))
{
	voice_burned_6 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned6.ogg");
}
else
{
	voice_burned_6 = noone;
}
#endregion /*Voice Burned 6 END*/

#region /*Voice Burned 7*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_7.ogg"))
{
	voice_burned_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_7.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned7.ogg"))
{
	voice_burned_7 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_7.ogg"))
{
	voice_burned_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_7.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned7.ogg"))
{
	voice_burned_7 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned7.ogg");
}
else
{
	voice_burned_7 = noone;
}
#endregion /*Voice Burned 7 END*/

#region /*Voice Burned 8*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_8.ogg"))
{
	voice_burned_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_8.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned8.ogg"))
{
	voice_burned_8 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_8.ogg"))
{
	voice_burned_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_8.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned8.ogg"))
{
	voice_burned_8 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned8.ogg");
}
else
{
	voice_burned_8 = noone;
}
#endregion /*Voice Burned 8 END*/

#region /*Voice Burned 9*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_9.ogg"))
{
	voice_burned_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_9.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned9.ogg"))
{
	voice_burned_9 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_9.ogg"))
{
	voice_burned_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_9.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned9.ogg"))
{
	voice_burned_9 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned9.ogg");
}
else
{
	voice_burned_9 = noone;
}
#endregion /*Voice Burned 9 END*/

#region /*Voice Burned 10*/
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_10.ogg"))
{
	voice_burned_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_10.ogg");
}
else
if (file_exists("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned10.ogg"))
{
	voice_burned_10 = audio_create_stream("Characters/Character "+string(custom_character)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_10.ogg"))
{
	voice_burned_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned_10.ogg");
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned10.ogg"))
{
	voice_burned_10 = audio_create_stream(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sounds/voicepack"+string(selected_voice_pack)+"/burned10.ogg");
}
else
{
	voice_burned_10 = noone;
}
#endregion /*Voice Burned 10 END*/

#endregion /*Voice Burned END*/

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

#endregion /*Play as Custom characterEND*/

#region /*characterValues Handeling*/

if (file_exists("Characters/Character "+string(custom_character)+"/Data/character_config.ini"))
or(file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini"))
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Data/character_config.ini"))
	{
		ini_open("Characters/Character "+string(custom_character)+"/Data/character_config.ini");
	}
	else
	if(file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini"))
	{
		ini_open(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini");
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
	//ini_open(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/character_config.ini");
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
#endregion /*CharacterValues Handeling END*/

}
#endregion /*Initialize Custom CharacterEND*/

#region /*Choose to play voice clips randomly*/

#region /*Wall jump sound variation*/
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2=noone)
and(voice_wall_jump_3=noone)
and(voice_wall_jump_4=noone)
and(voice_wall_jump_5=noone)
and(voice_wall_jump_6=noone)
and(voice_wall_jump_7=noone)
and(voice_wall_jump_8=noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=voice_wall_jump_1;
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3=noone)
and(voice_wall_jump_4=noone)
and(voice_wall_jump_5=noone)
and(voice_wall_jump_6=noone)
and(voice_wall_jump_7=noone)
and(voice_wall_jump_8=noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4=noone)
and(voice_wall_jump_5=noone)
and(voice_wall_jump_6=noone)
and(voice_wall_jump_7=noone)
and(voice_wall_jump_8=noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4>noone)
and(voice_wall_jump_5=noone)
and(voice_wall_jump_6=noone)
and(voice_wall_jump_7=noone)
and(voice_wall_jump_8=noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4>noone)
and(voice_wall_jump_5>noone)
and(voice_wall_jump_6=noone)
and(voice_wall_jump_7=noone)
and(voice_wall_jump_8=noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4>noone)
and(voice_wall_jump_5>noone)
and(voice_wall_jump_6>noone)
and(voice_wall_jump_7=noone)
and(voice_wall_jump_8=noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4>noone)
and(voice_wall_jump_5>noone)
and(voice_wall_jump_6>noone)
and(voice_wall_jump_7>noone)
and(voice_wall_jump_8=noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4>noone)
and(voice_wall_jump_5>noone)
and(voice_wall_jump_6>noone)
and(voice_wall_jump_7>noone)
and(voice_wall_jump_8>noone)
and(voice_wall_jump_9=noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4>noone)
and(voice_wall_jump_5>noone)
and(voice_wall_jump_6>noone)
and(voice_wall_jump_7>noone)
and(voice_wall_jump_8>noone)
and(voice_wall_jump_9>noone)
and(voice_wall_jump_10=noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9);
}
else
if (voice_wall_jump_1>noone)
and(voice_wall_jump_2>noone)
and(voice_wall_jump_3>noone)
and(voice_wall_jump_4>noone)
and(voice_wall_jump_5>noone)
and(voice_wall_jump_6>noone)
and(voice_wall_jump_7>noone)
and(voice_wall_jump_8>noone)
and(voice_wall_jump_9>noone)
and(voice_wall_jump_10>noone)
{
	voice_wallkick=choose(voice_wall_jump_1,
						voice_wall_jump_2,
						voice_wall_jump_3,
						voice_wall_jump_4,
						voice_wall_jump_5,
						voice_wall_jump_6,
						voice_wall_jump_7,
						voice_wall_jump_8,
						voice_wall_jump_9,
						voice_wall_jump_10);
}
#endregion /*Wall jump sound variation END*/

#region /*Start running sound variation*/
if (voice_start_running_1>noone)
and(voice_start_running_2=noone)
and(voice_start_running_3=noone)
and(voice_start_running_4=noone)
and(voice_start_running_5=noone)
and(voice_start_running_6=noone)
and(voice_start_running_7=noone)
and(voice_start_running_8=noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=voice_start_running_1;
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3=noone)
and(voice_start_running_4=noone)
and(voice_start_running_5=noone)
and(voice_start_running_6=noone)
and(voice_start_running_7=noone)
and(voice_start_running_8=noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4=noone)
and(voice_start_running_5=noone)
and(voice_start_running_6=noone)
and(voice_start_running_7=noone)
and(voice_start_running_8=noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4>noone)
and(voice_start_running_5=noone)
and(voice_start_running_6=noone)
and(voice_start_running_7=noone)
and(voice_start_running_8=noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4>noone)
and(voice_start_running_5>noone)
and(voice_start_running_6=noone)
and(voice_start_running_7=noone)
and(voice_start_running_8=noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4>noone)
and(voice_start_running_5>noone)
and(voice_start_running_6>noone)
and(voice_start_running_7=noone)
and(voice_start_running_8=noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4>noone)
and(voice_start_running_5>noone)
and(voice_start_running_6>noone)
and(voice_start_running_7>noone)
and(voice_start_running_8=noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4>noone)
and(voice_start_running_5>noone)
and(voice_start_running_6>noone)
and(voice_start_running_7>noone)
and(voice_start_running_8>noone)
and(voice_start_running_9=noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7,
						voice_start_running_8);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4>noone)
and(voice_start_running_5>noone)
and(voice_start_running_6>noone)
and(voice_start_running_7>noone)
and(voice_start_running_8>noone)
and(voice_start_running_9>noone)
and(voice_start_running_10=noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7,
						voice_start_running_8,
						voice_start_running_9);
}
else
if (voice_start_running_1>noone)
and(voice_start_running_2>noone)
and(voice_start_running_3>noone)
and(voice_start_running_4>noone)
and(voice_start_running_5>noone)
and(voice_start_running_6>noone)
and(voice_start_running_7>noone)
and(voice_start_running_8>noone)
and(voice_start_running_9>noone)
and(voice_start_running_10>noone)
{
	voice_startdash=choose(voice_start_running_1,
						voice_start_running_2,
						voice_start_running_3,
						voice_start_running_4,
						voice_start_running_5,
						voice_start_running_6,
						voice_start_running_7,
						voice_start_running_8,
						voice_start_running_9,
						voice_start_running_10);
}
#endregion /*Start running sound variation END*/

#region /*Rope catch sound variation*/
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2=noone)
and(voice_rope_catch_3=noone)
and(voice_rope_catch_4=noone)
and(voice_rope_catch_5=noone)
and(voice_rope_catch_6=noone)
and(voice_rope_catch_7=noone)
and(voice_rope_catch_8=noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=voice_rope_catch_1;
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3=noone)
and(voice_rope_catch_4=noone)
and(voice_rope_catch_5=noone)
and(voice_rope_catch_6=noone)
and(voice_rope_catch_7=noone)
and(voice_rope_catch_8=noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4=noone)
and(voice_rope_catch_5=noone)
and(voice_rope_catch_6=noone)
and(voice_rope_catch_7=noone)
and(voice_rope_catch_8=noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4>noone)
and(voice_rope_catch_5=noone)
and(voice_rope_catch_6=noone)
and(voice_rope_catch_7=noone)
and(voice_rope_catch_8=noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4>noone)
and(voice_rope_catch_5>noone)
and(voice_rope_catch_6=noone)
and(voice_rope_catch_7=noone)
and(voice_rope_catch_8=noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4>noone)
and(voice_rope_catch_5>noone)
and(voice_rope_catch_6>noone)
and(voice_rope_catch_7=noone)
and(voice_rope_catch_8=noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4>noone)
and(voice_rope_catch_5>noone)
and(voice_rope_catch_6>noone)
and(voice_rope_catch_7>noone)
and(voice_rope_catch_8=noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4>noone)
and(voice_rope_catch_5>noone)
and(voice_rope_catch_6>noone)
and(voice_rope_catch_7>noone)
and(voice_rope_catch_8>noone)
and(voice_rope_catch_9=noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7,
						voice_rope_catch_8);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4>noone)
and(voice_rope_catch_5>noone)
and(voice_rope_catch_6>noone)
and(voice_rope_catch_7>noone)
and(voice_rope_catch_8>noone)
and(voice_rope_catch_9>noone)
and(voice_rope_catch_10=noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7,
						voice_rope_catch_8,
						voice_rope_catch_9);
}
else
if (voice_rope_catch_1>noone)
and(voice_rope_catch_2>noone)
and(voice_rope_catch_3>noone)
and(voice_rope_catch_4>noone)
and(voice_rope_catch_5>noone)
and(voice_rope_catch_6>noone)
and(voice_rope_catch_7>noone)
and(voice_rope_catch_8>noone)
and(voice_rope_catch_9>noone)
and(voice_rope_catch_10>noone)
{
	voice_rope_catch=choose(voice_rope_catch_1,
						voice_rope_catch_2,
						voice_rope_catch_3,
						voice_rope_catch_4,
						voice_rope_catch_5,
						voice_rope_catch_6,
						voice_rope_catch_7,
						voice_rope_catch_8,
						voice_rope_catch_9,
						voice_rope_catch_10);
}
#endregion /*Rope catch sound variation END*/

#region /*Jump spring sound variation*/
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2=noone)
and(voice_jump_spring_3=noone)
and(voice_jump_spring_4=noone)
and(voice_jump_spring_5=noone)
and(voice_jump_spring_6=noone)
and(voice_jump_spring_7=noone)
and(voice_jump_spring_8=noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=voice_jump_spring_1;
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3=noone)
and(voice_jump_spring_4=noone)
and(voice_jump_spring_5=noone)
and(voice_jump_spring_6=noone)
and(voice_jump_spring_7=noone)
and(voice_jump_spring_8=noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4=noone)
and(voice_jump_spring_5=noone)
and(voice_jump_spring_6=noone)
and(voice_jump_spring_7=noone)
and(voice_jump_spring_8=noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4>noone)
and(voice_jump_spring_5=noone)
and(voice_jump_spring_6=noone)
and(voice_jump_spring_7=noone)
and(voice_jump_spring_8=noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4>noone)
and(voice_jump_spring_5>noone)
and(voice_jump_spring_6=noone)
and(voice_jump_spring_7=noone)
and(voice_jump_spring_8=noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4>noone)
and(voice_jump_spring_5>noone)
and(voice_jump_spring_6>noone)
and(voice_jump_spring_7=noone)
and(voice_jump_spring_8=noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4>noone)
and(voice_jump_spring_5>noone)
and(voice_jump_spring_6>noone)
and(voice_jump_spring_7>noone)
and(voice_jump_spring_8=noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4>noone)
and(voice_jump_spring_5>noone)
and(voice_jump_spring_6>noone)
and(voice_jump_spring_7>noone)
and(voice_jump_spring_8>noone)
and(voice_jump_spring_9=noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7,
						voice_jump_spring_8);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4>noone)
and(voice_jump_spring_5>noone)
and(voice_jump_spring_6>noone)
and(voice_jump_spring_7>noone)
and(voice_jump_spring_8>noone)
and(voice_jump_spring_9>noone)
and(voice_jump_spring_10=noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7,
						voice_jump_spring_8,
						voice_jump_spring_9);
}
else
if (voice_jump_spring_1>noone)
and(voice_jump_spring_2>noone)
and(voice_jump_spring_3>noone)
and(voice_jump_spring_4>noone)
and(voice_jump_spring_5>noone)
and(voice_jump_spring_6>noone)
and(voice_jump_spring_7>noone)
and(voice_jump_spring_8>noone)
and(voice_jump_spring_9>noone)
and(voice_jump_spring_10>noone)
{
	voice_jump_spring=choose(voice_jump_spring_1,
						voice_jump_spring_2,
						voice_jump_spring_3,
						voice_jump_spring_4,
						voice_jump_spring_5,
						voice_jump_spring_6,
						voice_jump_spring_7,
						voice_jump_spring_8,
						voice_jump_spring_9,
						voice_jump_spring_10);
}
#endregion /*Jump spring sound variation END*/

#region /*Jump rope sound variation*/
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2=noone)
and(voice_jump_rope_3=noone)
and(voice_jump_rope_4=noone)
and(voice_jump_rope_5=noone)
and(voice_jump_rope_6=noone)
and(voice_jump_rope_7=noone)
and(voice_jump_rope_8=noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=voice_jump_rope_1;
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3=noone)
and(voice_jump_rope_4=noone)
and(voice_jump_rope_5=noone)
and(voice_jump_rope_6=noone)
and(voice_jump_rope_7=noone)
and(voice_jump_rope_8=noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4=noone)
and(voice_jump_rope_5=noone)
and(voice_jump_rope_6=noone)
and(voice_jump_rope_7=noone)
and(voice_jump_rope_8=noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4>noone)
and(voice_jump_rope_5=noone)
and(voice_jump_rope_6=noone)
and(voice_jump_rope_7=noone)
and(voice_jump_rope_8=noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4>noone)
and(voice_jump_rope_5>noone)
and(voice_jump_rope_6=noone)
and(voice_jump_rope_7=noone)
and(voice_jump_rope_8=noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4>noone)
and(voice_jump_rope_5>noone)
and(voice_jump_rope_6>noone)
and(voice_jump_rope_7=noone)
and(voice_jump_rope_8=noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4>noone)
and(voice_jump_rope_5>noone)
and(voice_jump_rope_6>noone)
and(voice_jump_rope_7>noone)
and(voice_jump_rope_8=noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4>noone)
and(voice_jump_rope_5>noone)
and(voice_jump_rope_6>noone)
and(voice_jump_rope_7>noone)
and(voice_jump_rope_8>noone)
and(voice_jump_rope_9=noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7,
						voice_jump_rope_8);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4>noone)
and(voice_jump_rope_5>noone)
and(voice_jump_rope_6>noone)
and(voice_jump_rope_7>noone)
and(voice_jump_rope_8>noone)
and(voice_jump_rope_9>noone)
and(voice_jump_rope_10=noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7,
						voice_jump_rope_8,
						voice_jump_rope_9);
}
else
if (voice_jump_rope_1>noone)
and(voice_jump_rope_2>noone)
and(voice_jump_rope_3>noone)
and(voice_jump_rope_4>noone)
and(voice_jump_rope_5>noone)
and(voice_jump_rope_6>noone)
and(voice_jump_rope_7>noone)
and(voice_jump_rope_8>noone)
and(voice_jump_rope_9>noone)
and(voice_jump_rope_10>noone)
{
	voice_jump_rope=choose(voice_jump_rope_1,
						voice_jump_rope_2,
						voice_jump_rope_3,
						voice_jump_rope_4,
						voice_jump_rope_5,
						voice_jump_rope_6,
						voice_jump_rope_7,
						voice_jump_rope_8,
						voice_jump_rope_9,
						voice_jump_rope_10);
}
#endregion /*Jump rope sound variation END*/

#region /*Jump sound variation*/
if (voice_jump_1>noone)
and(voice_jump_2=noone)
and(voice_jump_3=noone)
and(voice_jump_4=noone)
and(voice_jump_5=noone)
and(voice_jump_6=noone)
and(voice_jump_7=noone)
and(voice_jump_8=noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=voice_jump_1;
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3=noone)
and(voice_jump_4=noone)
and(voice_jump_5=noone)
and(voice_jump_6=noone)
and(voice_jump_7=noone)
and(voice_jump_8=noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4=noone)
and(voice_jump_5=noone)
and(voice_jump_6=noone)
and(voice_jump_7=noone)
and(voice_jump_8=noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4>noone)
and(voice_jump_5=noone)
and(voice_jump_6=noone)
and(voice_jump_7=noone)
and(voice_jump_8=noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4>noone)
and(voice_jump_5>noone)
and(voice_jump_6=noone)
and(voice_jump_7=noone)
and(voice_jump_8=noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4>noone)
and(voice_jump_5>noone)
and(voice_jump_6>noone)
and(voice_jump_7=noone)
and(voice_jump_8=noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4>noone)
and(voice_jump_5>noone)
and(voice_jump_6>noone)
and(voice_jump_7>noone)
and(voice_jump_8=noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4>noone)
and(voice_jump_5>noone)
and(voice_jump_6>noone)
and(voice_jump_7>noone)
and(voice_jump_8>noone)
and(voice_jump_9=noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7,
						voice_jump_8);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4>noone)
and(voice_jump_5>noone)
and(voice_jump_6>noone)
and(voice_jump_7>noone)
and(voice_jump_8>noone)
and(voice_jump_9>noone)
and(voice_jump_10=noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7,
						voice_jump_8,
						voice_jump_9);
}
else
if (voice_jump_1>noone)
and(voice_jump_2>noone)
and(voice_jump_3>noone)
and(voice_jump_4>noone)
and(voice_jump_5>noone)
and(voice_jump_6>noone)
and(voice_jump_7>noone)
and(voice_jump_8>noone)
and(voice_jump_9>noone)
and(voice_jump_10>noone)
{
	voice_jump=choose(voice_jump_1,
						voice_jump_2,
						voice_jump_3,
						voice_jump_4,
						voice_jump_5,
						voice_jump_6,
						voice_jump_7,
						voice_jump_8,
						voice_jump_9,
						voice_jump_10);
}
#endregion /*Jump sound variation END*/

#region /*Jump 3rd sound variation*/
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2=noone)
and(voice_jump_3rd_3=noone)
and(voice_jump_3rd_4=noone)
and(voice_jump_3rd_5=noone)
and(voice_jump_3rd_6=noone)
and(voice_jump_3rd_7=noone)
and(voice_jump_3rd_8=noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=voice_jump_3rd_1;
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3=noone)
and(voice_jump_3rd_4=noone)
and(voice_jump_3rd_5=noone)
and(voice_jump_3rd_6=noone)
and(voice_jump_3rd_7=noone)
and(voice_jump_3rd_8=noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4=noone)
and(voice_jump_3rd_5=noone)
and(voice_jump_3rd_6=noone)
and(voice_jump_3rd_7=noone)
and(voice_jump_3rd_8=noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4>noone)
and(voice_jump_3rd_5=noone)
and(voice_jump_3rd_6=noone)
and(voice_jump_3rd_7=noone)
and(voice_jump_3rd_8=noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4>noone)
and(voice_jump_3rd_5>noone)
and(voice_jump_3rd_6=noone)
and(voice_jump_3rd_7=noone)
and(voice_jump_3rd_8=noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4>noone)
and(voice_jump_3rd_5>noone)
and(voice_jump_3rd_6>noone)
and(voice_jump_3rd_7=noone)
and(voice_jump_3rd_8=noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4>noone)
and(voice_jump_3rd_5>noone)
and(voice_jump_3rd_6>noone)
and(voice_jump_3rd_7>noone)
and(voice_jump_3rd_8=noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4>noone)
and(voice_jump_3rd_5>noone)
and(voice_jump_3rd_6>noone)
and(voice_jump_3rd_7>noone)
and(voice_jump_3rd_8>noone)
and(voice_jump_3rd_9=noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7,
						voice_jump_3rd_8);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4>noone)
and(voice_jump_3rd_5>noone)
and(voice_jump_3rd_6>noone)
and(voice_jump_3rd_7>noone)
and(voice_jump_3rd_8>noone)
and(voice_jump_3rd_9>noone)
and(voice_jump_3rd_10=noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7,
						voice_jump_3rd_8,
						voice_jump_3rd_9);
}
else
if (voice_jump_3rd_1>noone)
and(voice_jump_3rd_2>noone)
and(voice_jump_3rd_3>noone)
and(voice_jump_3rd_4>noone)
and(voice_jump_3rd_5>noone)
and(voice_jump_3rd_6>noone)
and(voice_jump_3rd_7>noone)
and(voice_jump_3rd_8>noone)
and(voice_jump_3rd_9>noone)
and(voice_jump_3rd_10>noone)
{
	voice_jump3rd=choose(voice_jump_3rd_1,
						voice_jump_3rd_2,
						voice_jump_3rd_3,
						voice_jump_3rd_4,
						voice_jump_3rd_5,
						voice_jump_3rd_6,
						voice_jump_3rd_7,
						voice_jump_3rd_8,
						voice_jump_3rd_9,
						voice_jump_3rd_10);
}
#endregion /*Jump 3rd sound variation END*/

#region /*Jump 2nd sound variation*/
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2=noone)
and(voice_jump_2nd_3=noone)
and(voice_jump_2nd_4=noone)
and(voice_jump_2nd_5=noone)
and(voice_jump_2nd_6=noone)
and(voice_jump_2nd_7=noone)
and(voice_jump_2nd_8=noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=voice_jump_2nd_1;
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3=noone)
and(voice_jump_2nd_4=noone)
and(voice_jump_2nd_5=noone)
and(voice_jump_2nd_6=noone)
and(voice_jump_2nd_7=noone)
and(voice_jump_2nd_8=noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4=noone)
and(voice_jump_2nd_5=noone)
and(voice_jump_2nd_6=noone)
and(voice_jump_2nd_7=noone)
and(voice_jump_2nd_8=noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4>noone)
and(voice_jump_2nd_5=noone)
and(voice_jump_2nd_6=noone)
and(voice_jump_2nd_7=noone)
and(voice_jump_2nd_8=noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4>noone)
and(voice_jump_2nd_5>noone)
and(voice_jump_2nd_6=noone)
and(voice_jump_2nd_7=noone)
and(voice_jump_2nd_8=noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4>noone)
and(voice_jump_2nd_5>noone)
and(voice_jump_2nd_6>noone)
and(voice_jump_2nd_7=noone)
and(voice_jump_2nd_8=noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4>noone)
and(voice_jump_2nd_5>noone)
and(voice_jump_2nd_6>noone)
and(voice_jump_2nd_7>noone)
and(voice_jump_2nd_8=noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4>noone)
and(voice_jump_2nd_5>noone)
and(voice_jump_2nd_6>noone)
and(voice_jump_2nd_7>noone)
and(voice_jump_2nd_8>noone)
and(voice_jump_2nd_9=noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7,
						voice_jump_2nd_8);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4>noone)
and(voice_jump_2nd_5>noone)
and(voice_jump_2nd_6>noone)
and(voice_jump_2nd_7>noone)
and(voice_jump_2nd_8>noone)
and(voice_jump_2nd_9>noone)
and(voice_jump_2nd_10=noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7,
						voice_jump_2nd_8,
						voice_jump_2nd_9);
}
else
if (voice_jump_2nd_1>noone)
and(voice_jump_2nd_2>noone)
and(voice_jump_2nd_3>noone)
and(voice_jump_2nd_4>noone)
and(voice_jump_2nd_5>noone)
and(voice_jump_2nd_6>noone)
and(voice_jump_2nd_7>noone)
and(voice_jump_2nd_8>noone)
and(voice_jump_2nd_9>noone)
and(voice_jump_2nd_10>noone)
{
	voice_jump2nd=choose(voice_jump_2nd_1,
						voice_jump_2nd_2,
						voice_jump_2nd_3,
						voice_jump_2nd_4,
						voice_jump_2nd_5,
						voice_jump_2nd_6,
						voice_jump_2nd_7,
						voice_jump_2nd_8,
						voice_jump_2nd_9,
						voice_jump_2nd_10);
}
#endregion /*Jump 2nd sound variation END*/

#region /*Get invincibility sound variation*/
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2=noone)
and(voice_get_invincibility_3=noone)
and(voice_get_invincibility_4=noone)
and(voice_get_invincibility_5=noone)
and(voice_get_invincibility_6=noone)
and(voice_get_invincibility_7=noone)
and(voice_get_invincibility_8=noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=voice_get_invincibility_1;
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3=noone)
and(voice_get_invincibility_4=noone)
and(voice_get_invincibility_5=noone)
and(voice_get_invincibility_6=noone)
and(voice_get_invincibility_7=noone)
and(voice_get_invincibility_8=noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4=noone)
and(voice_get_invincibility_5=noone)
and(voice_get_invincibility_6=noone)
and(voice_get_invincibility_7=noone)
and(voice_get_invincibility_8=noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4>noone)
and(voice_get_invincibility_5=noone)
and(voice_get_invincibility_6=noone)
and(voice_get_invincibility_7=noone)
and(voice_get_invincibility_8=noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4>noone)
and(voice_get_invincibility_5>noone)
and(voice_get_invincibility_6=noone)
and(voice_get_invincibility_7=noone)
and(voice_get_invincibility_8=noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4>noone)
and(voice_get_invincibility_5>noone)
and(voice_get_invincibility_6>noone)
and(voice_get_invincibility_7=noone)
and(voice_get_invincibility_8=noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4>noone)
and(voice_get_invincibility_5>noone)
and(voice_get_invincibility_6>noone)
and(voice_get_invincibility_7>noone)
and(voice_get_invincibility_8=noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4>noone)
and(voice_get_invincibility_5>noone)
and(voice_get_invincibility_6>noone)
and(voice_get_invincibility_7>noone)
and(voice_get_invincibility_8>noone)
and(voice_get_invincibility_9=noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7,
						voice_get_invincibility_8);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4>noone)
and(voice_get_invincibility_5>noone)
and(voice_get_invincibility_6>noone)
and(voice_get_invincibility_7>noone)
and(voice_get_invincibility_8>noone)
and(voice_get_invincibility_9>noone)
and(voice_get_invincibility_10=noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7,
						voice_get_invincibility_8,
						voice_get_invincibility_9);
}
else
if (voice_get_invincibility_1>noone)
and(voice_get_invincibility_2>noone)
and(voice_get_invincibility_3>noone)
and(voice_get_invincibility_4>noone)
and(voice_get_invincibility_5>noone)
and(voice_get_invincibility_6>noone)
and(voice_get_invincibility_7>noone)
and(voice_get_invincibility_8>noone)
and(voice_get_invincibility_9>noone)
and(voice_get_invincibility_10>noone)
{
	voice_get_star=choose(voice_get_invincibility_1,
						voice_get_invincibility_2,
						voice_get_invincibility_3,
						voice_get_invincibility_4,
						voice_get_invincibility_5,
						voice_get_invincibility_6,
						voice_get_invincibility_7,
						voice_get_invincibility_8,
						voice_get_invincibility_9,
						voice_get_invincibility_10);
}
#endregion /*Get invincibility sound variation END*/

#region /*Enter goal sound variation*/
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2=noone)
and(voice_enter_goal_3=noone)
and(voice_enter_goal_4=noone)
and(voice_enter_goal_5=noone)
and(voice_enter_goal_6=noone)
and(voice_enter_goal_7=noone)
and(voice_enter_goal_8=noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=voice_enter_goal_1;
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3=noone)
and(voice_enter_goal_4=noone)
and(voice_enter_goal_5=noone)
and(voice_enter_goal_6=noone)
and(voice_enter_goal_7=noone)
and(voice_enter_goal_8=noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4=noone)
and(voice_enter_goal_5=noone)
and(voice_enter_goal_6=noone)
and(voice_enter_goal_7=noone)
and(voice_enter_goal_8=noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4>noone)
and(voice_enter_goal_5=noone)
and(voice_enter_goal_6=noone)
and(voice_enter_goal_7=noone)
and(voice_enter_goal_8=noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4>noone)
and(voice_enter_goal_5>noone)
and(voice_enter_goal_6=noone)
and(voice_enter_goal_7=noone)
and(voice_enter_goal_8=noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4>noone)
and(voice_enter_goal_5>noone)
and(voice_enter_goal_6>noone)
and(voice_enter_goal_7=noone)
and(voice_enter_goal_8=noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4>noone)
and(voice_enter_goal_5>noone)
and(voice_enter_goal_6>noone)
and(voice_enter_goal_7>noone)
and(voice_enter_goal_8=noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4>noone)
and(voice_enter_goal_5>noone)
and(voice_enter_goal_6>noone)
and(voice_enter_goal_7>noone)
and(voice_enter_goal_8>noone)
and(voice_enter_goal_9=noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7,
						voice_enter_goal_8);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4>noone)
and(voice_enter_goal_5>noone)
and(voice_enter_goal_6>noone)
and(voice_enter_goal_7>noone)
and(voice_enter_goal_8>noone)
and(voice_enter_goal_9>noone)
and(voice_enter_goal_10=noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7,
						voice_enter_goal_8,
						voice_enter_goal_9);
}
else
if (voice_enter_goal_1>noone)
and(voice_enter_goal_2>noone)
and(voice_enter_goal_3>noone)
and(voice_enter_goal_4>noone)
and(voice_enter_goal_5>noone)
and(voice_enter_goal_6>noone)
and(voice_enter_goal_7>noone)
and(voice_enter_goal_8>noone)
and(voice_enter_goal_9>noone)
and(voice_enter_goal_10>noone)
{
	voice_enter_goal=choose(voice_enter_goal_1,
						voice_enter_goal_2,
						voice_enter_goal_3,
						voice_enter_goal_4,
						voice_enter_goal_5,
						voice_enter_goal_6,
						voice_enter_goal_7,
						voice_enter_goal_8,
						voice_enter_goal_9,
						voice_enter_goal_10);
}
#endregion /*Enter goal sound variation END*/

#region /*Dive sound variation*/
if (voice_dive_1>noone)
and(voice_dive_2=noone)
and(voice_dive_3=noone)
and(voice_dive_4=noone)
and(voice_dive_5=noone)
and(voice_dive_6=noone)
and(voice_dive_7=noone)
and(voice_dive_8=noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=voice_dive_1;
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3=noone)
and(voice_dive_4=noone)
and(voice_dive_5=noone)
and(voice_dive_6=noone)
and(voice_dive_7=noone)
and(voice_dive_8=noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4=noone)
and(voice_dive_5=noone)
and(voice_dive_6=noone)
and(voice_dive_7=noone)
and(voice_dive_8=noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4>noone)
and(voice_dive_5=noone)
and(voice_dive_6=noone)
and(voice_dive_7=noone)
and(voice_dive_8=noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4>noone)
and(voice_dive_5>noone)
and(voice_dive_6=noone)
and(voice_dive_7=noone)
and(voice_dive_8=noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4>noone)
and(voice_dive_5>noone)
and(voice_dive_6>noone)
and(voice_dive_7=noone)
and(voice_dive_8=noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4>noone)
and(voice_dive_5>noone)
and(voice_dive_6>noone)
and(voice_dive_7>noone)
and(voice_dive_8=noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4>noone)
and(voice_dive_5>noone)
and(voice_dive_6>noone)
and(voice_dive_7>noone)
and(voice_dive_8>noone)
and(voice_dive_9=noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4>noone)
and(voice_dive_5>noone)
and(voice_dive_6>noone)
and(voice_dive_7>noone)
and(voice_dive_8>noone)
and(voice_dive_9>noone)
and(voice_dive_10=noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9);
}
else
if (voice_dive_1>noone)
and(voice_dive_2>noone)
and(voice_dive_3>noone)
and(voice_dive_4>noone)
and(voice_dive_5>noone)
and(voice_dive_6>noone)
and(voice_dive_7>noone)
and(voice_dive_8>noone)
and(voice_dive_9>noone)
and(voice_dive_10>noone)
{
	voice_dive=choose(voice_dive_1,
						voice_dive_2,
						voice_dive_3,
						voice_dive_4,
						voice_dive_5,
						voice_dive_6,
						voice_dive_7,
						voice_dive_8,
						voice_dive_9,
						voice_dive_10);
}
#endregion /*Dive sound variation END*/

#region /*Damage sound variation*/
if (voice_damage_1>noone)
and(voice_damage_2=noone)
and(voice_damage_3=noone)
and(voice_damage_4=noone)
and(voice_damage_5=noone)
and(voice_damage_6=noone)
and(voice_damage_7=noone)
and(voice_damage_8=noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=voice_damage_1;
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3=noone)
and(voice_damage_4=noone)
and(voice_damage_5=noone)
and(voice_damage_6=noone)
and(voice_damage_7=noone)
and(voice_damage_8=noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4=noone)
and(voice_damage_5=noone)
and(voice_damage_6=noone)
and(voice_damage_7=noone)
and(voice_damage_8=noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4>noone)
and(voice_damage_5=noone)
and(voice_damage_6=noone)
and(voice_damage_7=noone)
and(voice_damage_8=noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4>noone)
and(voice_damage_5>noone)
and(voice_damage_6=noone)
and(voice_damage_7=noone)
and(voice_damage_8=noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4>noone)
and(voice_damage_5>noone)
and(voice_damage_6>noone)
and(voice_damage_7=noone)
and(voice_damage_8=noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4>noone)
and(voice_damage_5>noone)
and(voice_damage_6>noone)
and(voice_damage_7>noone)
and(voice_damage_8=noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4>noone)
and(voice_damage_5>noone)
and(voice_damage_6>noone)
and(voice_damage_7>noone)
and(voice_damage_8>noone)
and(voice_damage_9=noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7,
						voice_damage_8);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4>noone)
and(voice_damage_5>noone)
and(voice_damage_6>noone)
and(voice_damage_7>noone)
and(voice_damage_8>noone)
and(voice_damage_9>noone)
and(voice_damage_10=noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7,
						voice_damage_8,
						voice_damage_9);
}
else
if (voice_damage_1>noone)
and(voice_damage_2>noone)
and(voice_damage_3>noone)
and(voice_damage_4>noone)
and(voice_damage_5>noone)
and(voice_damage_6>noone)
and(voice_damage_7>noone)
and(voice_damage_8>noone)
and(voice_damage_9>noone)
and(voice_damage_10>noone)
{
	voice_damage=choose(voice_damage_1,
						voice_damage_2,
						voice_damage_3,
						voice_damage_4,
						voice_damage_5,
						voice_damage_6,
						voice_damage_7,
						voice_damage_8,
						voice_damage_9,
						voice_damage_10);
}
#endregion /*Damage sound variation END*/

#region /*Burned running sound variation*/
if (voice_burned_running_1>noone)
and(voice_burned_running_2=noone)
and(voice_burned_running_3=noone)
and(voice_burned_running_4=noone)
and(voice_burned_running_5=noone)
and(voice_burned_running_6=noone)
and(voice_burned_running_7=noone)
and(voice_burned_running_8=noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=voice_burned_running_1;
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3=noone)
and(voice_burned_running_4=noone)
and(voice_burned_running_5=noone)
and(voice_burned_running_6=noone)
and(voice_burned_running_7=noone)
and(voice_burned_running_8=noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4=noone)
and(voice_burned_running_5=noone)
and(voice_burned_running_6=noone)
and(voice_burned_running_7=noone)
and(voice_burned_running_8=noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4>noone)
and(voice_burned_running_5=noone)
and(voice_burned_running_6=noone)
and(voice_burned_running_7=noone)
and(voice_burned_running_8=noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4>noone)
and(voice_burned_running_5>noone)
and(voice_burned_running_6=noone)
and(voice_burned_running_7=noone)
and(voice_burned_running_8=noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4>noone)
and(voice_burned_running_5>noone)
and(voice_burned_running_6>noone)
and(voice_burned_running_7=noone)
and(voice_burned_running_8=noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4>noone)
and(voice_burned_running_5>noone)
and(voice_burned_running_6>noone)
and(voice_burned_running_7>noone)
and(voice_burned_running_8=noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4>noone)
and(voice_burned_running_5>noone)
and(voice_burned_running_6>noone)
and(voice_burned_running_7>noone)
and(voice_burned_running_8>noone)
and(voice_burned_running_9=noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7,
						voice_burned_running_8);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4>noone)
and(voice_burned_running_5>noone)
and(voice_burned_running_6>noone)
and(voice_burned_running_7>noone)
and(voice_burned_running_8>noone)
and(voice_burned_running_9>noone)
and(voice_burned_running_10=noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7,
						voice_burned_running_8,
						voice_burned_running_9);
}
else
if (voice_burned_running_1>noone)
and(voice_burned_running_2>noone)
and(voice_burned_running_3>noone)
and(voice_burned_running_4>noone)
and(voice_burned_running_5>noone)
and(voice_burned_running_6>noone)
and(voice_burned_running_7>noone)
and(voice_burned_running_8>noone)
and(voice_burned_running_9>noone)
and(voice_burned_running_10>noone)
{
	voice_burned_running=choose(voice_burned_running_1,
						voice_burned_running_2,
						voice_burned_running_3,
						voice_burned_running_4,
						voice_burned_running_5,
						voice_burned_running_6,
						voice_burned_running_7,
						voice_burned_running_8,
						voice_burned_running_9,
						voice_burned_running_10);
}
#endregion /*Burned running sound variation END*/

#region /*Burned sound variation*/
if (voice_burned_1>noone)
and(voice_burned_2=noone)
and(voice_burned_3=noone)
and(voice_burned_4=noone)
and(voice_burned_5=noone)
and(voice_burned_6=noone)
and(voice_burned_7=noone)
and(voice_burned_8=noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=voice_burned_1;
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3=noone)
and(voice_burned_4=noone)
and(voice_burned_5=noone)
and(voice_burned_6=noone)
and(voice_burned_7=noone)
and(voice_burned_8=noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4=noone)
and(voice_burned_5=noone)
and(voice_burned_6=noone)
and(voice_burned_7=noone)
and(voice_burned_8=noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4>noone)
and(voice_burned_5=noone)
and(voice_burned_6=noone)
and(voice_burned_7=noone)
and(voice_burned_8=noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4>noone)
and(voice_burned_5>noone)
and(voice_burned_6=noone)
and(voice_burned_7=noone)
and(voice_burned_8=noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4>noone)
and(voice_burned_5>noone)
and(voice_burned_6>noone)
and(voice_burned_7=noone)
and(voice_burned_8=noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4>noone)
and(voice_burned_5>noone)
and(voice_burned_6>noone)
and(voice_burned_7>noone)
and(voice_burned_8=noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4>noone)
and(voice_burned_5>noone)
and(voice_burned_6>noone)
and(voice_burned_7>noone)
and(voice_burned_8>noone)
and(voice_burned_9=noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7,
						voice_burned_8);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4>noone)
and(voice_burned_5>noone)
and(voice_burned_6>noone)
and(voice_burned_7>noone)
and(voice_burned_8>noone)
and(voice_burned_9>noone)
and(voice_burned_10=noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7,
						voice_burned_8,
						voice_burned_9);
}
else
if (voice_burned_1>noone)
and(voice_burned_2>noone)
and(voice_burned_3>noone)
and(voice_burned_4>noone)
and(voice_burned_5>noone)
and(voice_burned_6>noone)
and(voice_burned_7>noone)
and(voice_burned_8>noone)
and(voice_burned_9>noone)
and(voice_burned_10>noone)
{
	voice_burned=choose(voice_burned_1,
						voice_burned_2,
						voice_burned_3,
						voice_burned_4,
						voice_burned_5,
						voice_burned_6,
						voice_burned_7,
						voice_burned_8,
						voice_burned_9,
						voice_burned_10);
}
#endregion /*Burned sound variation END*/

#endregion /*Choose to play voice clips randomly END*/

room_speed=global.max_fps; /*Room Speed*/

#region /*Restart Level*/
if (global.restart_level = true)
{
	global.restart_level=false;
	global.quit_level=false;
	audio_stop_all();
	room_persistent=false;
	
	#region /*Reset timer back to zero*/
	global.timeattack_realmillisecond=0;
	global.timeattack_millisecond=0;
	global.timeattack_second=0;
	global.timeattack_minute=0;	
	#endregion /*Reset timer back to zero End*/
	
	score = 0;
	
	room_restart();
}
#endregion /*Restart Level END*/

#region /*Quit Level*/
if (global.quit_level=true)
{
	global.quit_level=false;
	audio_stop_all();
	room_persistent=false;
	
	#region /*Reset timer back to zero*/
	global.timeattack_realmillisecond=0;
	global.timeattack_millisecond=0;
	global.timeattack_second=0;
	global.timeattack_minute=0;	
	#endregion /*Reset timer back to zero End*/
	
	score = 0;
	
	global.level_clear_rate="enter";
	if (asset_get_type("scr_savelevel")==asset_script)
	{
		scr_savelevel();
	}
	if (global.quit_to_map = true)
	and(asset_get_type("room_level_select")==asset_room)
	{
		global.quit_to_map = false;
		room_goto(room_level_select);
	}
	else
	if (global.quit_to_title = true)
	and(asset_get_type("room_title")==asset_room)
	{
		global.quit_to_title = false;
		room_goto(room_title);
	}
	else
	{
		game_restart();
	}
}
#endregion /*Quit Level END*/

#region /*Invincible Music*/
if (asset_get_type("snd_music_invincible")==asset_sound)
{
	if (invincible<room_speed*10)
	and(assist_invincible=false)
	{
		invincible_pitch+=0.001;
		audio_sound_pitch(snd_music_invincible,invincible_pitch);
	}
	else
	{
		invincible_pitch=1;
		audio_sound_pitch(snd_music_invincible,1);
	}
	if (invincible=180)
	and(assist_invincible=false)
	{
		if (asset_get_type("snd_running_out")==asset_sound)
		{
			audio_play_sound(snd_running_out,0,0);
			audio_sound_gain(snd_running_out,global.sfx_volume,0);
		}
	}
	if (invincible>120)
	and(assist_invincible=false)
	{
		if (audio_is_playing(snd_music_invincible))
		{
			audio_sound_gain(global.music,0,100);
			audio_sound_gain(global.music_underwater,0,100);
		}
	}
	else
	{
		audio_stop_sound(snd_music_invincible);
		
		#region /*Play Music*/
		if (!audio_is_playing(global.music))
		{
			if (asset_get_type("snd_hurry_up")==asset_sound)
			and(!audio_is_playing(snd_hurry_up))
			{
				audio_play_sound(global.music,0,true);
				audio_sound_gain(global.music,global.music_volume,0);
			}
			else
			{
				audio_play_sound(global.music,0,true);
				audio_sound_gain(global.music,global.music_volume,0);
			}
		}
		#endregion /*Play Music END*/

		#region /*Play Underwater Music*/
		if (!audio_is_playing(global.music_underwater))
		{
			if (asset_get_type("snd_hurry_up")==asset_sound)
			and(!audio_is_playing(snd_hurry_up))
			{
				audio_play_sound(global.music_underwater,0,true);
				audio_sound_gain(global.music_underwater,0,0);
			}
			else
			{
				audio_play_sound(global.music_underwater,0,true);
				audio_sound_gain(global.music_underwater,0,0);
			}
		}
		#endregion /*Play Underwater Music END*/
		
		#region /*Shift from normal music to uderwater music*/
		if (in_water=true)
		{
			audio_sound_gain(global.music,0,1000);
			audio_sound_gain(global.music_underwater,global.music_volume,1000);
		}
		else
		{
			audio_sound_gain(global.music,global.music_volume,1000);
			audio_sound_gain(global.music_underwater,0,1000);
		}
		#endregion /*Shift from normal music to uderwater music END*/
		
	}
}
#endregion /*Invincible Music END*/

else
{
	
	#region /*Play Music*/
	if (!audio_is_playing(global.music))
	{
		audio_play_sound(global.music,0,true);
		audio_sound_gain(global.music,global.music_volume,0);
	}
	#endregion /*Play Music END*/

}

#region /*Music Pitch*/
if (global.time_countdown < 100)
and(global.time_countdown > noone)
and(allow_timeup=true)
{
	audio_sound_pitch(global.music,music_pitch+0.3);
	audio_sound_pitch(global.music_underwater,music_pitch+0.3);
	if (crouch = true)
	or(ground_pound=true)
	and(place_meeting(x,y+sprite_height,obj_wall))
	{
		music_pitch=lerp(music_pitch,0.95,0.001);
	}
	else
	{
		music_pitch=lerp(music_pitch,1,0.01);
	}
}
else
{
	audio_sound_pitch(global.music,music_pitch);
	audio_sound_pitch(global.music_underwater,music_pitch);
	if (crouch = true)
	or(ground_pound=true)
	and(place_meeting(x,y+sprite_height,obj_wall))
	{
		music_pitch=lerp(music_pitch,0.95,0.001);
	}
	else
	{
		music_pitch=lerp(music_pitch,1,0.01);
	}
}
#endregion /*Music Pitch END*/

#region /*Make sure the heart stays on the character if you spawn from a checkpoint*/
if (asset_get_type("obj_checkpoint")==asset_object)
and(asset_get_type("obj_camera")==asset_object)
{
	if (instance_exists(obj_checkpoint))
	and(place_meeting(x,y,obj_checkpoint))
	and(instance_exists(obj_camera))
	and(place_meeting(x,y,obj_camera))
	{
		if (obj_camera.iris_xscale<0.3)
		or(obj_camera.iris_yscale<0.3)
		{
			xx_heart=x;
			yy_heart=y;
		}
	}
}
#endregion /*Make sure the heart stays on the character if you spawn from a checkpoint END*/

#region /*Winning the level and transitioning to the next area*/
if (asset_get_type("obj_checkpoint")==asset_object)
and(asset_get_type("obj_camera")==asset_object)
and(!place_meeting(x,y,obj_checkpoint))
and(instance_exists(obj_camera))
and(obj_camera.iris_xscale<3)
{
	
	#region /*Don't go outside view boundary*/
	if (goal=true)
	and(global.time_countdown_bonus<=0)
	{
		if (instance_exists(obj_camera))
		and(obj_camera.iris_xscale<=0.01)
		{
			if (asset_get_type("snd_level_clear")==asset_sound)
			and(audio_is_playing(snd_level_clear))
			{
				audio_stop_sound(snd_level_clear);
			}
			if (room_next(room)<>-1)
			{
				if (obj_camera.iris_yscale<=0.001)
				{
					audio_stop_all();
					global.level_clear_rate="clear";
					global.x_checkpoint=false;
					global.y_checkpoint=false;
					global.checkpoint_millisecond=0;
					global.checkpoint_second=0;
					global.checkpoint_minute=0;
					global.checkpoint_realmillisecond=0;
					global.lives_until_assist=0;
					global.theme="ground";
					if (global.actually_play_edited_level=false)
					and(global.play_edited_level=true)
					and(global.character_select_in_this_menu="level_editor")
					{
						global.actually_play_edited_level=false;
						global.play_edited_level=false;
						room_restart();
					}
					else
					if (global.actually_play_edited_level=true)
					and(global.play_edited_level=true)
					and(global.character_select_in_this_menu="level_editor")
					and(asset_get_type("room_title")==asset_room)
					{						
						global.actually_play_edited_level=false;
						global.play_edited_level=false;
						room_goto(room_title);
					}
					else
					if (global.trigger_ending=true)
					and(asset_get_type("room_ending_cutscene")==asset_room)
					{
						if (asset_get_type("scr_savelevel")==asset_script)
						{
							scr_savelevel();
						}
						room_goto(room_ending_cutscene);
					}
					else
					if (asset_get_type("room_level_select")==asset_room)
					and(obj_camera.iris_yscale<=0.001)
					{
						if (asset_get_type("scr_savelevel")==asset_script)
						{
							scr_savelevel();
						}
						room_goto(room_level_select);
					}
				}
				else
				{
					if (x>room_width+sprite_width/2)
					{
						x = room_width+sprite_width/2;
						hspeed = 0;
						vspeed = 0;
					}
				}
			}
			else
			{
				#region /*Restart Level Editor when finishing level*/
				if (asset_get_type("room_level_select") == asset_room)
				and(room = room_leveleditor)
				and(global.character_select_in_this_menu = "level_editor")
				{
					global.play_edited_level=false;
					global.actually_play_edited_level=false;
					score=0;
					room_restart();
				}
				#endregion /*Restart Level Editor when finishing level End*/
				else
				{
					game_restart();
				}
			}
		}
	}
	#endregion /*Don't go outside view boundary END*/
	
	else
	{
		
		#region /*Don't go outside view*/
		if (x < camera_get_view_x(view_camera[view_current]))
		and (instance_number(obj_player)>=2)
		{
			x = camera_get_view_x(view_camera[view_current]);
		}
		if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (instance_number(obj_player)>=2)
		{
			x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		#endregion /*Don't go outside view END*/
		
		#region /*Don't go outside room*/
		if (x < 0)
		{
			x = 0;
		}
		if (x > room_width)
		{
			x = room_width;
		}
		if (y < -64)
		{
			y = -64;
		}
		#endregion /*Don't go outside room END*/
		
	}
}
else
{
	
	#region /*Don't go outside view boundary*/
	if (goal=true)
	and(global.time_countdown_bonus<=0)
	{
		if (asset_get_type("obj_camera")==asset_object)
		and(instance_exists(obj_camera))
		and(obj_camera.iris_xscale<=0.01)
		{
			if (asset_get_type("snd_level_clear")==asset_sound)
			and(audio_is_playing(snd_level_clear))
			{
				audio_stop_sound(snd_level_clear);
			}
			if (room_next(room)<>-1)
			{
				if (asset_get_type("room_level_select")==asset_room)
				and(obj_camera.iris_yscale<=0.001)
				{
					audio_stop_all();
					global.level_clear_rate="clear";
					global.x_checkpoint=false;
					global.y_checkpoint=false;
					global.checkpoint_millisecond=0;
					global.checkpoint_second=0;
					global.checkpoint_minute=0;
					global.checkpoint_realmillisecond=0;
					global.lives_until_assist=0;
					global.theme="ground";
					if (global.trigger_ending=true)
					and(asset_get_type("room_ending_cutscene")==asset_room)
					{
						if (asset_get_type("scr_savelevel")==asset_script)
						{
							scr_savelevel();
						}
						room_goto(room_ending_cutscene);
					}
					else
					if (asset_get_type("room_level_select")==asset_room)
					and(obj_camera.iris_yscale<=0.001)
					{
						if (asset_get_type("scr_savelevel")==asset_script)
						{
							scr_savelevel();
						}
						room_goto(room_level_select);
					}
				}
				else
				{
					if (x>room_width+sprite_width/2)
					{
						x=room_width+sprite_width/2;
						hspeed=0;
						vspeed =0;
					}
				}
			}
			else
			{
				#region /*Restart Level Editor when finishing level*/
				if (asset_get_type("room_level_select") == asset_room)
				and(room = room_leveleditor)
				and(global.character_select_in_this_menu = "level_editor")
				{
					global.play_edited_level=false;
					global.actually_play_edited_level=false;
					score=0;
					room_restart();
				}
				#endregion /*Restart Level Editor when finishing level End*/
				else
				{
					game_restart();
				}
			}
		}
	}
	#endregion /*Don't go outside view boundary END*/
	else
	{
		
		#region /*Don't go outside view*/
		if (x < camera_get_view_x(view_camera[view_current]))
		and (instance_number(obj_player)>=2)
		{
			x = camera_get_view_x(view_camera[view_current]);
		}
		if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (instance_number(obj_player)>=2)
		{
			x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		#endregion /*Don't go outside view END*/
		
		#region /*Don't go outside room*/
		if (x < 0)
		{
			x = 0;
		}
		if (x > room_width)
		{
			x = room_width;
		}
		if (y < -64)
		{
			y = -64;
		}
		#endregion /*Don't go outside room END*/
		
	}
}
#endregion /*Winning the level and transitioning to the next area END*/

#region /*Don't let the player outside the view too much when winning*/
if (goal=true)
{
	if (x<camera_get_view_x(view_camera[view_current])-32)
	{
		x=camera_get_view_x(view_camera[view_current])-32;
		if (hspeed<0)
		{
			hspeed=0;
		}
	}
	if (x>camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])+32)
	{
		x=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])+32;
		if (hspeed>0)
		{
			hspeed=0;
		}
	}
	if (y<-64)
	{
		y=-64;
	}
	if (y>camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])+32)
	{
		y=camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])+32;
		if (vspeed>0)
		{
			vspeed=0;
		}
		gravity = 0;
	}
}
#endregion /*Don't let the player outside the view too much when winning END*/

if (hspeed!=0)
{
	hspeed_dir=sign(hspeed);
}

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera")==asset_object)
and(!instance_exists(obj_camera))
and(keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("Config.ini");
	ini_write_real("Config","fullscreen_mode",window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/

#region /*Set values from the Input Settings*/

#region /*Up Key Is Jump Key*/
if (player=1)
{
	up_key_is_jump_key=global.player1_up_key_is_jump_key;
}
else
if (player=2)
{
	up_key_is_jump_key=global.player2_up_key_is_jump_key;
}
else
if (player=3)
{
	up_key_is_jump_key=global.player3_up_key_is_jump_key;
}
else
if (player=4)
{
	up_key_is_jump_key=global.player4_up_key_is_jump_key;
}
#endregion /*Up Key Is Jump Key END*/

#region /*Double tap direction to run*/
if (player=1)
{
	double_tap_to_run=global.player1_double_tap_to_run;
}
else
if (player=2)
{
	double_tap_to_run=global.player2_double_tap_to_run;
}
else
if (player=3)
{
	double_tap_to_run=global.player3_double_tap_to_run;
}
else
if (player=4)
{
	double_tap_to_run=global.player4_double_tap_to_run;
}
#endregion /*Double tap direction to run END*/

#region /*Cancel dive by pressing jump or dive button*/
if (player=1)
{
	cancel_dive_by_pressing_jump_or_dive_button=global.player1_cancel_dive_by_pressing_jump_or_dive_button;
}
else
if (player=2)
{
	cancel_dive_by_pressing_jump_or_dive_button=global.player2_cancel_dive_by_pressing_jump_or_dive_button;
}
else
if (player=3)
{
	cancel_dive_by_pressing_jump_or_dive_button=global.player3_cancel_dive_by_pressing_jump_or_dive_button;
}
else
if (player=4)
{
	cancel_dive_by_pressing_jump_or_dive_button=global.player4_cancel_dive_by_pressing_jump_or_dive_button;
}
#endregion /*Cancel dive by pressing jump or dive button END*/

#region /*Cancel dive by pressing opposite direction*/
if (player=1)
{
	cancel_dive_by_pressing_opposite_direction=global.player1_cancel_dive_by_pressing_opposite_direction;
}
else
if (player=2)
{
	cancel_dive_by_pressing_opposite_direction=global.player1_cancel_dive_by_pressing_opposite_direction;
}
else
if (player=3)
{
	cancel_dive_by_pressing_opposite_direction=global.player1_cancel_dive_by_pressing_opposite_direction;
}
else
if (player=4)
{
	cancel_dive_by_pressing_opposite_direction=global.player1_cancel_dive_by_pressing_opposite_direction;
}
#endregion /*Cancel dive by pressing opposite direction END*/

#region /*Hold Direction Wall jump*/
if (player=1)
{
	wall_jump_setting=global.player1_wall_jump_setting;
}
else
if (player=2)
{
	wall_jump_setting=global.player2_wall_jump_setting;
}
else
if (player=3)
{
	wall_jump_setting=global.player3_wall_jump_setting;
}
else
if (player=4)
{
	wall_jump_setting=global.player4_wall_jump_setting;
}
#endregion /*Hold Direction Wall jump END*/

#region /*Drop down form Horizontal Rope*/
if (player=1)
{
	drop_from_rope=global.player1_drop_from_rope;
}
else
if (player=2)
{
	drop_from_rope=global.player2_drop_from_rope;
}
else
if (player=3)
{
	drop_from_rope=global.player3_drop_from_rope;
}
else
if (player=4)
{
	drop_from_rope=global.player4_drop_from_rope;
}
#endregion /*Drop down form Horizontal Rope END*/

#endregion /*Set values from the Input Settings END*/

#region /*Assist Invincible*/
if (assist_invincible=true)
{
	if (hp<=0)
	{
		hp=1;
	}
	invincible=1000;
	audio_stop_sound(snd_music_invincible);
	if (key_jump_hold)
	{
		if (!place_meeting(x,y+1,obj_wall))
		and(dive=false)
		and(ground_pound=false)
		and(crouch=false)
		and(vspeed>1)
		{
			vspeed =+1;
			crouch=false;
			can_ground_pound = false;
		}
	}
}
#endregion /*Assist Invincible END*/

#region /*If Assist delault hp is invincible, stay invincible*/
if (global.assist_enable)
and (global.assist_invincible = true)
and(hp<max_hp)
{
	hp=max_hp;
}
#endregion /*If Assist delault hp is invincible, stay invincible END*/

#region /*Customisable Keyboard Array*/
if (player<=1)
{
	
	#region /*Crouch Toggling*/
	if(keyboard_check_pressed(global.player1_key_crouch_toggle))
	{
		if (global.player1_crouch_toggle = false)
		{
			global.player1_crouch_toggle = true;
		}
		else
		{
			global.player1_crouch_toggle = false;
		}
	}
	#endregion /*Crouch Toggling END*/
	
	gamepad_set_axis_deadzone(player-1,0.50);
	
	#region /*Player 1 Key Attack Hold*/
	key_tongue=
	(keyboard_check(global.player1_key_tongue))
	or(keyboard_check(global.player1_key2_tongue));
	#endregion /*Player 1 Key Attack Hold END*/
	
	#region /*Player 1 Key Attack Pressed*/
	key_tongue_pressed=
	(keyboard_check_pressed(global.player1_key_tongue))
	or(keyboard_check_pressed(global.player1_key2_tongue));
	#endregion /*Player 1 Key Attack Pressed END*/
	
	#region /*Player 1 Key Attack Released*/
	key_tongue_released=
	(keyboard_check_released(global.player1_key_tongue))
	or(keyboard_check_released(global.player1_key2_tongue));
	#endregion /*Player 1 Key Attack Released END*/
	
	#region /*Player 1 Key Dive Pressed*/
	key_dive_pressed=
	(keyboard_check_pressed(global.player1_key_dive))
	or(keyboard_check_pressed(global.player1_key2_dive))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 1 Key Dive Pressed END*/
	
	#region /*Player 1 Key Jump Pressed*/
	key_jump=
	(keyboard_check_pressed(global.player1_key_jump))
	or(keyboard_check_pressed(global.player1_key2_jump))
	or(up_key_is_jump_key=true)and(keyboard_check_pressed(global.player1_key_up))
	and!(keyboard_check_pressed(global.player1_key_down))
	and!(keyboard_check_pressed(global.player1_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check_pressed(global.player1_key2_up))
	and!(keyboard_check_pressed(global.player1_key_down))
	and!(keyboard_check_pressed(global.player1_key2_down))
	or(gamepad_button_check_pressed(player-1,gp_face1))
	or(gamepad_button_check_pressed(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_pressed(player-1,gp_padu))
	and!(gamepad_button_check_pressed(player-1,gp_padd));
	#endregion /*Player 1 Key Jump Pressed END*/
	
	#region /*Player 1 Key Jump Hold*/
	key_jump_hold=
	(keyboard_check(global.player1_key_jump))
	or(keyboard_check(global.player1_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player1_key_up))
	and(!keyboard_check(global.player1_key_down))
	and(!keyboard_check(global.player1_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player1_key2_up))
	and(!keyboard_check(global.player1_key_down))
	and(!keyboard_check(global.player1_key2_down))
	or(gamepad_button_check(player-1,gp_face1))
	or(gamepad_button_check(player-1,gp_face2))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd));
	#endregion /*Player 1 Key Jump Hold END*/
	
	#region /*Player 1 Key Jump Released*/
	key_jump_released=
	(keyboard_check_released(global.player1_key_jump))
	or(keyboard_check_released(global.player1_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player1_key_up))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player1_key2_up))
	or(gamepad_button_check_released(player-1,gp_face1))
	or(gamepad_button_check_released(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_released(player-1,gp_padu));
	#endregion /*Player 1 Key Jump Released END*/
	
	#region /*Player 1 Key Crouch Hold*/
	key_crouch=
	(keyboard_check(global.player1_key_crouch))
	or(keyboard_check(global.player1_key2_crouch))
	or(gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0)
	or(global.player1_crouch_toggle=true);
	#endregion /*Player 1 Key Crouch Hold END*/
	
	#region /*Player 1 Key Crouch Pressed*/
	key_crouch_pressed=
	(keyboard_check_pressed(global.player1_key_crouch))
	or(keyboard_check_pressed(global.player1_key2_crouch))
	or(gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 1 Key Crouch Pressed END*/
	
	#region /*Player 1 Key Sprint Hold*/
	key_sprint=
	(keyboard_check(global.player1_key_sprint))
	or(keyboard_check(global.player1_key2_sprint))
	or(gamepad_button_check(player-1,gp_face3))
	or(gamepad_button_check(player-1,gp_face4))
	or(global.player1_sprint_toggle);
	#endregion /*Player 1 Key Sprint Hold END*/
	
	#region /*Player 1 Key Sprint Pressed*/
	key_sprint_pressed=
	(keyboard_check_pressed(global.player1_key_sprint))
	or(keyboard_check_pressed(global.player1_key2_sprint))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 1 Key Sprint Pressed END*/
	
	#region /*Player 1 Key Sprint Released*/
	key_sprint_released=
	(keyboard_check_released(global.player1_key_sprint))
	or(keyboard_check_released(global.player1_key2_sprint))
	or(gamepad_button_check_released(player-1,gp_face3))
	or(gamepad_button_check_released(player-1,gp_face4));
	#endregion /*Player 1 Key Sprint Released END*/
	
	#region /*Player 1 Key Left Hold*/
	key_left=
	(keyboard_check(global.player1_key_left))
	and(!keyboard_check(global.player1_key_right))
	and(!keyboard_check(global.player1_key2_right))
	or(keyboard_check(global.player1_key2_left))
	and(!keyboard_check(global.player1_key_right))
	and(!keyboard_check(global.player1_key2_right))
	or(gamepad_button_check(player-1,gp_padl))
	and(!gamepad_button_check(player-1,gp_padr))
	or(gamepad_axis_value(player-1,gp_axislh)<0);
	#endregion /*Player 1 Key Left Hold END*/
	
	#region /*Player 1 Key Right Hold*/
	key_right=
	(keyboard_check(global.player1_key_right))
	and(!keyboard_check(global.player1_key_left))
	and(!keyboard_check(global.player1_key2_left))
	or(keyboard_check(global.player1_key2_right))
	and(!keyboard_check(global.player1_key_left))
	and(!keyboard_check(global.player1_key2_left))
	or(gamepad_button_check(player-1,gp_padr))
	and(!gamepad_button_check(player-1,gp_padl))
	or(gamepad_axis_value(player-1,gp_axislh)>0);
	#endregion /*Player 1 Key Right Hold END*/
	
	#region /*Player 1 Key Down Hold*/
	key_down=
	(keyboard_check(global.player1_key_down))
	and(!keyboard_check(global.player1_key_up))
	and(!keyboard_check(global.player1_key2_up))
	or(keyboard_check(global.player1_key2_down))
	and(!keyboard_check(global.player1_key_up))
	and(!keyboard_check(global.player1_key2_up))
	or(gamepad_button_check(player-1,gp_padd))
	and(!gamepad_button_check(player-1,gp_padu))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 1 Key Down Hold END*/
	
	#region /*Player 1 Key Up Hold*/
	key_up=
	(keyboard_check(global.player1_key_up))
	and(!keyboard_check(global.player1_key_down))
	and(!keyboard_check(global.player1_key2_down))
	or(keyboard_check(global.player1_key2_up))
	and(!keyboard_check(global.player1_key_down))
	and(!keyboard_check(global.player1_key2_down))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 1 Key Up Hold END*/
	
	#region /*Player 1 Key Up Pressed*/
	key_up_pressed=
	(keyboard_check_pressed(global.player1_key_up))
	or(keyboard_check_pressed(global.player1_key2_up))
	or(gamepad_button_check_pressed(player-1,gp_padu))
	and(!gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 1 Key Up Hold END*/
	
	#region /*Player 1 Key Spin Hold*/
	key_spin=
	(gamepad_button_check(player-1,gp_shoulderl))
	or(gamepad_button_check(player-1,gp_shoulderlb))
	or(gamepad_button_check(player-1,gp_shoulderr))
	or(gamepad_button_check(player-1,gp_shoulderrb));
	#endregion /*Player 1 Key Spin Hold*/
	
	#region /*Player 1 Key Spin Pressed*/
	key_spin_pressed=
	(gamepad_button_check_pressed(player-1,gp_shoulderl))
	or(gamepad_button_check_pressed(player-1,gp_shoulderlb))
	or(gamepad_button_check_pressed(player-1,gp_shoulderr))
	or(gamepad_button_check_pressed(player-1,gp_shoulderrb));
	#endregion /*Player 1 Key Spin Pressed END*/
	
}
else
if (player=2)
{
	
	#region /*Crouch Toggling*/
	if(keyboard_check_pressed(global.player2_key_crouch_toggle))
	{
		if (global.player2_crouch_toggle = false)
		{
			global.player2_crouch_toggle = true;
		}
		else
		{
			global.player2_crouch_toggle = false;
		}
	}
	#endregion /*Crouch Toggling END*/
	
	gamepad_set_axis_deadzone(player-1,0.50);
	
	#region /*Player 2 Key Attack Hold*/
	key_tongue=
	(keyboard_check(global.player2_key_tongue))
	or(keyboard_check(global.player2_key2_tongue));
	#endregion /*Player 2 Key Attack Hold END*/
	
	#region /*Player 2 Key Attack Pressed*/
	key_tongue_pressed=
	(keyboard_check_pressed(global.player2_key_tongue))
	or(keyboard_check_pressed(global.player2_key2_tongue));
	#endregion /*Player 2 Key Attack Pressed END*/
	
	#region /*Player 2 Key Attack Released*/
	key_tongue_released=
	(keyboard_check_released(global.player2_key_tongue))
	or(keyboard_check_released(global.player2_key2_tongue));
	#endregion /*Player 2 Key Attack Released END*/
	
	#region /*Player 2 Key Dive Pressed*/
	key_dive_pressed=
	(keyboard_check_pressed(global.player2_key_dive))
	or(keyboard_check_pressed(global.player2_key2_dive))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 2 Key Dive Pressed END*/
	
	#region /*Player 2 Key Jump Pressed*/
	key_jump=
	(keyboard_check_pressed(global.player2_key_jump))
	or(keyboard_check_pressed(global.player2_key2_jump))
	or(up_key_is_jump_key=true)and(keyboard_check_pressed(global.player2_key_up))
	and!(keyboard_check_pressed(global.player2_key_down))
	and!(keyboard_check_pressed(global.player2_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check_pressed(global.player2_key2_up))
	and!(keyboard_check_pressed(global.player2_key_down))
	and!(keyboard_check_pressed(global.player2_key2_down))
	or(gamepad_button_check_pressed(player-1,gp_face1))
	or(gamepad_button_check_pressed(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_pressed(player-1,gp_padu))
	and!(gamepad_button_check_pressed(player-1,gp_padd));
	#endregion /*Player 2 Key Jump Pressed END*/
	
	#region /*Player 2 Key Jump Hold*/
	key_jump_hold=
	(keyboard_check(global.player2_key_jump))
	or(keyboard_check(global.player2_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player2_key_up))
	and(!keyboard_check(global.player2_key_down))
	and(!keyboard_check(global.player2_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player2_key2_up))
	and(!keyboard_check(global.player2_key_down))
	and(!keyboard_check(global.player2_key2_down))
	or(gamepad_button_check(player-1,gp_face1))
	or(gamepad_button_check(player-1,gp_face2))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd));
	#endregion /*Player 2 Key Jump Hold END*/
	
	#region /*Player 2 Key Jump Released*/
	key_jump_released=
	(keyboard_check_released(global.player2_key_jump))
	or(keyboard_check_released(global.player2_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player2_key_up))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player2_key2_up))
	or(gamepad_button_check_released(player-1,gp_face1))
	or(gamepad_button_check_released(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_released(player-1,gp_padu));
	#endregion /*Player 2 Key Jump Released END*/
	
	#region /*Player 2 Key Crouch Hold*/
	key_crouch=
	(keyboard_check(global.player2_key_crouch))
	or(keyboard_check(global.player2_key2_crouch))
	or(gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0)
	or(global.player2_crouch_toggle=true);
	#endregion /*Player 2 Key Crouch Hold END*/
	
	#region /*Player 2 Key Crouch Pressed*/
	key_crouch_pressed=
	(keyboard_check_pressed(global.player2_key_crouch))
	or(keyboard_check_pressed(global.player2_key2_crouch))
	or(gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 2 Key Crouch Pressed END*/
	
	#region /*Player 2 Key Sprint Hold*/
	key_sprint=
	(keyboard_check(global.player2_key_sprint))
	or(keyboard_check(global.player2_key2_sprint))
	or(gamepad_button_check(player-1,gp_face3))
	or(gamepad_button_check(player-1,gp_face4))
	or(global.player2_sprint_toggle);
	#endregion /*Player 2 Key Sprint Hold END*/
	
	#region /*Player 2 Key Sprint Pressed*/
	key_sprint_pressed=
	(keyboard_check_pressed(global.player2_key_sprint))
	or(keyboard_check_pressed(global.player2_key2_sprint))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 2 Key Sprint Pressed END*/
	
	#region /*Player 2 Key Sprint Released*/
	key_sprint_released=
	(keyboard_check_released(global.player2_key_sprint))
	or(keyboard_check_released(global.player2_key2_sprint))
	or(gamepad_button_check_released(player-1,gp_face3))
	or(gamepad_button_check_released(player-1,gp_face4));
	#endregion /*Player 2 Key Sprint Released END*/
	
	#region /*Player 2 Key Left Hold*/
	key_left=
	(keyboard_check(global.player2_key_left))
	and(!keyboard_check(global.player2_key_right))
	and(!keyboard_check(global.player2_key2_right))
	or(keyboard_check(global.player2_key2_left))
	and(!keyboard_check(global.player2_key_right))
	and(!keyboard_check(global.player2_key2_right))
	or(gamepad_button_check(player-1,gp_padl))
	and(!gamepad_button_check(player-1,gp_padr))
	or(gamepad_axis_value(player-1,gp_axislh)<0);
	#endregion /*Player 2 Key Left Hold END*/
	
	#region /*Player 2 Key Right Hold*/
	key_right=
	(keyboard_check(global.player2_key_right))
	and(!keyboard_check(global.player2_key_left))
	and(!keyboard_check(global.player2_key2_left))
	or(keyboard_check(global.player2_key2_right))
	and(!keyboard_check(global.player2_key_left))
	and(!keyboard_check(global.player2_key2_left))
	or(gamepad_button_check(player-1,gp_padr))
	and(!gamepad_button_check(player-1,gp_padl))
	or(gamepad_axis_value(player-1,gp_axislh)>0);
	#endregion /*Player 2 Key Right Hold END*/
	
	#region /*Player 2 Key Down Hold*/
	key_down=
	(keyboard_check(global.player2_key_down))
	and(!keyboard_check(global.player2_key_up))
	and(!keyboard_check(global.player2_key2_up))
	or(keyboard_check(global.player2_key2_down))
	and(!keyboard_check(global.player2_key_up))
	and(!keyboard_check(global.player2_key2_up))
	or(gamepad_button_check(player-1,gp_padd))
	and(!gamepad_button_check(player-1,gp_padu))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 2 Key Down Hold END*/
	
	#region /*Player 2 Key Up Hold*/
	key_up=
	(keyboard_check(global.player2_key_up))
	and(!keyboard_check(global.player2_key_down))
	and(!keyboard_check(global.player2_key2_down))
	or(keyboard_check(global.player2_key2_up))
	and(!keyboard_check(global.player2_key_down))
	and(!keyboard_check(global.player2_key2_down))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 2 Key Up Hold END*/
	
	#region /*Player 2 Key Up Pressed*/
	key_up_pressed=
	(keyboard_check_pressed(global.player2_key_up))
	or(keyboard_check_pressed(global.player2_key2_up))
	or(gamepad_button_check_pressed(player-1,gp_padu))
	and(!gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 2 Key Up Hold END*/
	
	#region /*Player 2 Key Spin Hold*/
	key_spin=
	(gamepad_button_check(player-1,gp_shoulderl))
	or(gamepad_button_check(player-1,gp_shoulderlb))
	or(gamepad_button_check(player-1,gp_shoulderr))
	or(gamepad_button_check(player-1,gp_shoulderrb));
	#endregion /*Player 2 Key Spin Hold*/
	
	#region /*Player 2 Key Spin Pressed*/
	key_spin_pressed=
	(gamepad_button_check_pressed(player-1,gp_shoulderl))
	or(gamepad_button_check_pressed(player-1,gp_shoulderlb))
	or(gamepad_button_check_pressed(player-1,gp_shoulderr))
	or(gamepad_button_check_pressed(player-1,gp_shoulderrb));
	#endregion /*Player 2 Key Spin Pressed END*/
	
}
else
if (player=3)
{
	
	#region /*Crouch Toggling*/
	if(keyboard_check_pressed(global.player3_key_crouch_toggle))
	{
		if (global.player3_crouch_toggle = false)
		{
			global.player3_crouch_toggle = true;
		}
		else
		{
			global.player3_crouch_toggle = false;
		}
	}
	#endregion /*Crouch Toggling END*/
	
	gamepad_set_axis_deadzone(player-1,0.50);
	
	#region /*Player 3 Key Attack Hold*/
	key_tongue=
	(keyboard_check(global.player3_key_tongue))
	or(keyboard_check(global.player3_key2_tongue));
	#endregion /*Player 3 Key Attack Hold END*/
	
	#region /*Player 3 Key Attack Pressed*/
	key_tongue_pressed=
	(keyboard_check_pressed(global.player3_key_tongue))
	or(keyboard_check_pressed(global.player3_key2_tongue));
	#endregion /*Player 3 Key Attack Pressed END*/
	
	#region /*Player 3 Key Attack Released*/
	key_tongue_released=
	(keyboard_check_released(global.player3_key_tongue))
	or(keyboard_check_released(global.player3_key2_tongue));
	#endregion /*Player 3 Key Attack Released END*/
	
	#region /*Player 3 Key Dive Pressed*/
	key_dive_pressed=
	(keyboard_check_pressed(global.player3_key_dive))
	or(keyboard_check_pressed(global.player3_key2_dive))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 3 Key Dive Pressed END*/
	
	#region /*Player 3 Key Jump Pressed*/
	key_jump=
	(keyboard_check_pressed(global.player3_key_jump))
	or(keyboard_check_pressed(global.player3_key2_jump))
	or(up_key_is_jump_key=true)and(keyboard_check_pressed(global.player3_key_up))
	and!(keyboard_check_pressed(global.player3_key_down))
	and!(keyboard_check_pressed(global.player3_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check_pressed(global.player3_key2_up))
	and!(keyboard_check_pressed(global.player3_key_down))
	and!(keyboard_check_pressed(global.player3_key2_down))
	or(gamepad_button_check_pressed(player-1,gp_face1))
	or(gamepad_button_check_pressed(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_pressed(player-1,gp_padu))
	and!(gamepad_button_check_pressed(player-1,gp_padd));
	#endregion /*Player 3 Key Jump Pressed END*/
	
	#region /*Player 3 Key Jump Hold*/
	key_jump_hold=
	(keyboard_check(global.player3_key_jump))
	or(keyboard_check(global.player3_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player3_key_up))
	and(!keyboard_check(global.player3_key_down))
	and(!keyboard_check(global.player3_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player3_key2_up))
	and(!keyboard_check(global.player3_key_down))
	and(!keyboard_check(global.player3_key2_down))
	or(gamepad_button_check(player-1,gp_face1))
	or(gamepad_button_check(player-1,gp_face2))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd));
	#endregion /*Player 3 Key Jump Hold END*/
	
	#region /*Player 3 Key Jump Released*/
	key_jump_released=
	(keyboard_check_released(global.player3_key_jump))
	or(keyboard_check_released(global.player3_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player3_key_up))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player3_key2_up))
	or(gamepad_button_check_released(player-1,gp_face1))
	or(gamepad_button_check_released(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_released(player-1,gp_padu));
	#endregion /*Player 3 Key Jump Released END*/
	
	#region /*Player 3 Key Crouch Hold*/
	key_crouch=
	(keyboard_check(global.player3_key_crouch))
	or(keyboard_check(global.player3_key2_crouch))
	or(gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0)
	or(global.player3_crouch_toggle=true);
	#endregion /*Player 3 Key Crouch Hold END*/
	
	#region /*Player 3 Key Crouch Pressed*/
	key_crouch_pressed=
	(keyboard_check_pressed(global.player3_key_crouch))
	or(keyboard_check_pressed(global.player3_key2_crouch))
	or(gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 3 Key Crouch Pressed END*/
	
	#region /*Player 3 Key Sprint Hold*/
	key_sprint=
	(keyboard_check(global.player3_key_sprint))
	or(keyboard_check(global.player3_key2_sprint))
	or(gamepad_button_check(player-1,gp_face3))
	or(gamepad_button_check(player-1,gp_face4))
	or(global.player3_sprint_toggle);
	#endregion /*Player 3 Key Sprint Hold END*/
	
	#region /*Player 3 Key Sprint Pressed*/
	key_sprint_pressed=
	(keyboard_check_pressed(global.player3_key_sprint))
	or(keyboard_check_pressed(global.player3_key2_sprint))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 3 Key Sprint Pressed END*/
	
	#region /*Player 3 Key Sprint Released*/
	key_sprint_released=
	(keyboard_check_released(global.player3_key_sprint))
	or(keyboard_check_released(global.player3_key2_sprint))
	or(gamepad_button_check_released(player-1,gp_face3))
	or(gamepad_button_check_released(player-1,gp_face4));
	#endregion /*Player 3 Key Sprint Released END*/
	
	#region /*Player 3 Key Left Hold*/
	key_left=
	(keyboard_check(global.player3_key_left))
	and(!keyboard_check(global.player3_key_right))
	and(!keyboard_check(global.player3_key2_right))
	or(keyboard_check(global.player3_key2_left))
	and(!keyboard_check(global.player3_key_right))
	and(!keyboard_check(global.player3_key2_right))
	or(gamepad_button_check(player-1,gp_padl))
	and(!gamepad_button_check(player-1,gp_padr))
	or(gamepad_axis_value(player-1,gp_axislh)<0);
	#endregion /*Player 3 Key Left Hold END*/
	
	#region /*Player 3 Key Right Hold*/
	key_right=
	(keyboard_check(global.player3_key_right))
	and(!keyboard_check(global.player3_key_left))
	and(!keyboard_check(global.player3_key2_left))
	or(keyboard_check(global.player3_key2_right))
	and(!keyboard_check(global.player3_key_left))
	and(!keyboard_check(global.player3_key2_left))
	or(gamepad_button_check(player-1,gp_padr))
	and(!gamepad_button_check(player-1,gp_padl))
	or(gamepad_axis_value(player-1,gp_axislh)>0);
	#endregion /*Player 3 Key Right Hold END*/
	
	#region /*Player 3 Key Down Hold*/
	key_down=
	(keyboard_check(global.player3_key_down))
	and(!keyboard_check(global.player3_key_up))
	and(!keyboard_check(global.player3_key2_up))
	or(keyboard_check(global.player3_key2_down))
	and(!keyboard_check(global.player3_key_up))
	and(!keyboard_check(global.player3_key2_up))
	or(gamepad_button_check(player-1,gp_padd))
	and(!gamepad_button_check(player-1,gp_padu))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 3 Key Down Hold END*/
	
	#region /*Player 3 Key Up Hold*/
	key_up=
	(keyboard_check(global.player3_key_up))
	and(!keyboard_check(global.player3_key_down))
	and(!keyboard_check(global.player3_key2_down))
	or(keyboard_check(global.player3_key2_up))
	and(!keyboard_check(global.player3_key_down))
	and(!keyboard_check(global.player3_key2_down))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 3 Key Up Hold END*/
	
	#region /*Player 3 Key Up Pressed*/
	key_up_pressed=
	(keyboard_check_pressed(global.player3_key_up))
	or(keyboard_check_pressed(global.player3_key2_up))
	or(gamepad_button_check_pressed(player-1,gp_padu))
	and(!gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 3 Key Up Hold END*/
	
	#region /*Player 3 Key Spin Hold*/
	key_spin=
	(gamepad_button_check(player-1,gp_shoulderl))
	or(gamepad_button_check(player-1,gp_shoulderlb))
	or(gamepad_button_check(player-1,gp_shoulderr))
	or(gamepad_button_check(player-1,gp_shoulderrb));
	#endregion /*Player 3 Key Spin Hold*/
	
	#region /*Player 3 Key Spin Pressed*/
	key_spin_pressed=
	(gamepad_button_check_pressed(player-1,gp_shoulderl))
	or(gamepad_button_check_pressed(player-1,gp_shoulderlb))
	or(gamepad_button_check_pressed(player-1,gp_shoulderr))
	or(gamepad_button_check_pressed(player-1,gp_shoulderrb));
	#endregion /*Player 3 Key Spin Pressed END*/
	
}
else
if (player=4)
{
	
	#region /*Crouch Toggling*/
	if(keyboard_check_pressed(global.player4_key_crouch_toggle))
	{
		if (global.player4_crouch_toggle = false)
		{
			global.player4_crouch_toggle = true;
		}
		else
		{
			global.player4_crouch_toggle = false;
		}
	}
	#endregion /*Crouch Toggling END*/
	
	gamepad_set_axis_deadzone(player-1,0.50);
	
	#region /*Player 4 Key Attack Hold*/
	key_tongue=
	(keyboard_check(global.player4_key_tongue))
	or(keyboard_check(global.player4_key2_tongue));
	#endregion /*Player 4 Key Attack Hold END*/
	
	#region /*Player 4 Key Attack Pressed*/
	key_tongue_pressed=
	(keyboard_check_pressed(global.player4_key_tongue))
	or(keyboard_check_pressed(global.player4_key2_tongue));
	#endregion /*Player 4 Key Attack Pressed END*/
	
	#region /*Player 4 Key Attack Released*/
	key_tongue_released=
	(keyboard_check_released(global.player4_key_tongue))
	or(keyboard_check_released(global.player4_key2_tongue));
	#endregion /*Player 4 Key Attack Released END*/
	
	#region /*Player 4 Key Dive Pressed*/
	key_dive_pressed=
	(keyboard_check_pressed(global.player4_key_dive))
	or(keyboard_check_pressed(global.player4_key2_dive))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 4 Key Dive Pressed END*/
	
	#region /*Player 4 Key Jump Pressed*/
	key_jump=
	(keyboard_check_pressed(global.player4_key_jump))
	or(keyboard_check_pressed(global.player4_key2_jump))
	or(up_key_is_jump_key=true)and(keyboard_check_pressed(global.player4_key_up))
	and!(keyboard_check_pressed(global.player4_key_down))
	and!(keyboard_check_pressed(global.player4_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check_pressed(global.player4_key2_up))
	and!(keyboard_check_pressed(global.player4_key_down))
	and!(keyboard_check_pressed(global.player4_key2_down))
	or(gamepad_button_check_pressed(player-1,gp_face1))
	or(gamepad_button_check_pressed(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_pressed(player-1,gp_padu))
	and!(gamepad_button_check_pressed(player-1,gp_padd));
	#endregion /*Player 4 Key Jump Pressed END*/
	
	#region /*Player 4 Key Jump Hold*/
	key_jump_hold=
	(keyboard_check(global.player4_key_jump))
	or(keyboard_check(global.player4_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player4_key_up))
	and(!keyboard_check(global.player4_key_down))
	and(!keyboard_check(global.player4_key2_down))
	or(up_key_is_jump_key=true)
	and(keyboard_check(global.player4_key2_up))
	and(!keyboard_check(global.player4_key_down))
	and(!keyboard_check(global.player4_key2_down))
	or(gamepad_button_check(player-1,gp_face1))
	or(gamepad_button_check(player-1,gp_face2))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd));
	#endregion /*Player 4 Key Jump Hold END*/
	
	#region /*Player 4 Key Jump Released*/
	key_jump_released=
	(keyboard_check_released(global.player4_key_jump))
	or(keyboard_check_released(global.player4_key2_jump))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player4_key_up))
	or(up_key_is_jump_key=true)
	and(keyboard_check_released(global.player4_key2_up))
	or(gamepad_button_check_released(player-1,gp_face1))
	or(gamepad_button_check_released(player-1,gp_face2))
	or(up_key_is_jump_key=true)
	and(gamepad_button_check_released(player-1,gp_padu));
	#endregion /*Player 4 Key Jump Released END*/
	
	#region /*Player 4 Key Crouch Hold*/
	key_crouch=
	(keyboard_check(global.player4_key_crouch))
	or(keyboard_check(global.player4_key2_crouch))
	or(gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0)
	or(global.player4_crouch_toggle=true);
	#endregion /*Player 4 Key Crouch Hold END*/
	
	#region /*Player 4 Key Crouch Pressed*/
	key_crouch_pressed=
	(keyboard_check_pressed(global.player4_key_crouch))
	or(keyboard_check_pressed(global.player4_key2_crouch))
	or(gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 4 Key Crouch Pressed END*/
	
	#region /*Player 4 Key Sprint Hold*/
	key_sprint=
	(keyboard_check(global.player4_key_sprint))
	or(keyboard_check(global.player4_key2_sprint))
	or(gamepad_button_check(player-1,gp_face3))
	or(gamepad_button_check(player-1,gp_face4))
	or(global.player4_sprint_toggle);
	#endregion /*Player 4 Key Sprint Hold END*/
	
	#region /*Player 4 Key Sprint Pressed*/
	key_sprint_pressed=
	(keyboard_check_pressed(global.player4_key_sprint))
	or(keyboard_check_pressed(global.player4_key2_sprint))
	or(gamepad_button_check_pressed(player-1,gp_face3))
	or(gamepad_button_check_pressed(player-1,gp_face4));
	#endregion /*Player 4 Key Sprint Pressed END*/
	
	#region /*Player 4 Key Sprint Released*/
	key_sprint_released=
	(keyboard_check_released(global.player4_key_sprint))
	or(keyboard_check_released(global.player4_key2_sprint))
	or(gamepad_button_check_released(player-1,gp_face3))
	or(gamepad_button_check_released(player-1,gp_face4));
	#endregion /*Player 4 Key Sprint Released END*/
	
	#region /*Player 4 Key Left Hold*/
	key_left=
	(keyboard_check(global.player4_key_left))
	and(!keyboard_check(global.player4_key_right))
	and(!keyboard_check(global.player4_key2_right))
	or(keyboard_check(global.player4_key2_left))
	and(!keyboard_check(global.player4_key_right))
	and(!keyboard_check(global.player4_key2_right))
	or(gamepad_button_check(player-1,gp_padl))
	and(!gamepad_button_check(player-1,gp_padr))
	or(gamepad_axis_value(player-1,gp_axislh)<0);
	#endregion /*Player 4 Key Left Hold END*/
	
	#region /*Player 4 Key Right Hold*/
	key_right=
	(keyboard_check(global.player4_key_right))
	and(!keyboard_check(global.player4_key_left))
	and(!keyboard_check(global.player4_key2_left))
	or(keyboard_check(global.player4_key2_right))
	and(!keyboard_check(global.player4_key_left))
	and(!keyboard_check(global.player4_key2_left))
	or(gamepad_button_check(player-1,gp_padr))
	and(!gamepad_button_check(player-1,gp_padl))
	or(gamepad_axis_value(player-1,gp_axislh)>0);
	#endregion /*Player 4 Key Right Hold END*/
	
	#region /*Player 4 Key Down Hold*/
	key_down=
	(keyboard_check(global.player4_key_down))
	and(!keyboard_check(global.player4_key_up))
	and(!keyboard_check(global.player4_key2_up))
	or(keyboard_check(global.player4_key2_down))
	and(!keyboard_check(global.player4_key_up))
	and(!keyboard_check(global.player4_key2_up))
	or(gamepad_button_check(player-1,gp_padd))
	and(!gamepad_button_check(player-1,gp_padu))
	or(gamepad_axis_value(player-1,gp_axislv)>0);
	#endregion /*Player 4 Key Down Hold END*/
	
	#region /*Player 4 Key Up Hold*/
	key_up=
	(keyboard_check(global.player4_key_up))
	and(!keyboard_check(global.player4_key_down))
	and(!keyboard_check(global.player4_key2_down))
	or(keyboard_check(global.player4_key2_up))
	and(!keyboard_check(global.player4_key_down))
	and(!keyboard_check(global.player4_key2_down))
	or(gamepad_button_check(player-1,gp_padu))
	and(!gamepad_button_check(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 4 Key Up Hold END*/
	
	#region /*Player 4 Key Up Pressed*/
	key_up_pressed=
	(keyboard_check_pressed(global.player4_key_up))
	or(keyboard_check_pressed(global.player4_key2_up))
	or(gamepad_button_check_pressed(player-1,gp_padu))
	and(!gamepad_button_check_pressed(player-1,gp_padd))
	or(gamepad_axis_value(player-1,gp_axislv)<0);
	#endregion /*Player 4 Key Up Hold END*/
	
	#region /*Player 4 Key Spin Hold*/
	key_spin=
	(gamepad_button_check(player-1,gp_shoulderl))
	or(gamepad_button_check(player-1,gp_shoulderlb))
	or(gamepad_button_check(player-1,gp_shoulderr))
	or(gamepad_button_check(player-1,gp_shoulderrb));
	#endregion /*Player 4 Key Spin Hold*/
	
	#region /*Player 4 Key Spin Pressed*/
	key_spin_pressed=
	(gamepad_button_check_pressed(player-1,gp_shoulderl))
	or(gamepad_button_check_pressed(player-1,gp_shoulderlb))
	or(gamepad_button_check_pressed(player-1,gp_shoulderr))
	or(gamepad_button_check_pressed(player-1,gp_shoulderrb));
	#endregion /*Player 4 Key Spin Pressed END*/
	
}
#endregion /*Customisable Keyboard Array End*/

/*Sets up what the buttons do*/

#region /*If controller gets disconnected during gameplay, pause the game*/
if (player = 1)
and(gamepad_is_connected(0))
or(player = 2)
and(gamepad_is_connected(1))
or(player = 3)
and(gamepad_is_connected(2))
or(player = 4)
and(gamepad_is_connected(3))
{
	controller_connected = true;
}
#endregion /*If controller gets disconnected during gameplay, pause the game END*/

#region /*If player is allowed to move*/
if (can_move=true)
and(global.pause=false)
{
	
	#region /*Pause*/	
	if (keyboard_check_pressed(vk_escape))
	or(keyboard_check(vk_tab))
	and(keyboard_check(vk_lshift))
	or(gamepad_button_check_pressed(0,gp_start))
	or(gamepad_button_check_pressed(0,gp_select))
	or(player=1)
	and(!gamepad_is_connected(0))
	and(controller_connected=true)
	or(player=2)
	and(!gamepad_is_connected(1))
	and(controller_connected=true)
	or(player=3)
	and(!gamepad_is_connected(2))
	and(controller_connected=true)
	or(player=4)
	and(!gamepad_is_connected(3))
	and(controller_connected=true)
	or(global.actually_play_edited_level=true)
	and(!window_has_focus())
	and(global.automatically_pause_when_window_is_unfocused = true)
	{
	
	#region /*Show all HUD elements*/
	global.hud_show_lives=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_lives_timer=global.hud_hide_time;
		}
	}
	global.hud_show_basic_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_basic_collectibles_timer=global.hud_hide_time;
		}
	}
	global.hud_show_big_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_big_collectibles_timer=global.hud_hide_time;
		}
	}
	#endregion /*Show all HUD elements END*/

	controller_connected=false;
	if (global.play_edited_level=true)
	and(global.actually_play_edited_level=false)
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.play_edited_level=false;
		global.actually_play_edited_level=false;
		score=0;

	#region /*Save Level Information when in level editor*/
	if (global.level_editor_level>0)
	and (global.character_select_in_this_menu = "level_editor")
	{
		ini_open(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/level_information.ini");
		ini_write_real("Info","view_xview",camera_get_view_x(view_camera[view_current]));
		ini_write_real("Info","view_yview",camera_get_view_y(view_camera[view_current]));
		ini_close();
	}
	#endregion /*Save Level Information when in level editor END*/

	room_restart();
	}
	else
	{
		global.pause_player=0;
		if (global.goal_active=false)
		{
			if (asset_get_type("room_pause")==asset_room)
			{
				global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
				room_persistent = true;
				global.pause_room = room;
				audio_pause_all();
				room_goto(room_pause);
			}
			else
			{
				audio_pause_all();
				if (asset_get_type("obj_pause") == asset_object)
				and(!instance_exists(obj_pause))
				{
					global.pause=true;
					pause_hspeed = hspeed;
					pause_vspeed = vspeed;
					instance_create_depth(x,y,0,obj_pause); /*This pause objects creates, that handles the pause screen*/
				}
			}
		}
	}
}

else
if (gamepad_button_check_pressed(1,gp_start))
or(gamepad_button_check_pressed(1,gp_select))
{

	#region /*Show all HUD elements*/
	global.hud_show_lives=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_lives_timer=global.hud_hide_time;
		}
	}
	global.hud_show_basic_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_basic_collectibles_timer=global.hud_hide_time;
		}
	}
	global.hud_show_big_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_big_collectibles_timer=global.hud_hide_time;
		}
	}
	#endregion /*Show all HUD elements END*/

	if (global.play_edited_level=true)
	and(global.actually_play_edited_level=false)
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.play_edited_level=false;
		global.actually_play_edited_level=false;
		score=0;
		room_restart();
	}
	else
	{
		global.pause_player=1;
		if (global.goal_active=false)
		{
			if (asset_get_type("room_pause")==asset_room)
			{
				global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
				room_persistent = true;
				global.pause_room = room;
				audio_pause_all();
				room_goto(room_pause);
			}
			else
			{
				audio_pause_all();
				if (asset_get_type("obj_pause") == asset_object)
				and(!instance_exists(obj_pause))
				{
					global.pause=true;
					pause_hspeed = hspeed;
					pause_vspeed = vspeed;
					instance_create_depth(x,y,0,obj_pause); /*This pause objects creates, that handles the pause screen*/
				}
			}
		}
	}
}

else
if (gamepad_button_check_pressed(2,gp_start))
or(gamepad_button_check_pressed(2,gp_select))
{

	#region /*Show all HUD elements*/
	global.hud_show_lives=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_lives_timer=global.hud_hide_time;
		}
	}
	global.hud_show_basic_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_basic_collectibles_timer=global.hud_hide_time;
		}
	}
	global.hud_show_big_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_big_collectibles_timer=global.hud_hide_time;
		}
	}
	#endregion /*Show all HUD elements END*/

	if (global.play_edited_level=true)
	and(global.actually_play_edited_level=false)
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.play_edited_level=false;
		global.actually_play_edited_level=false;
		score=0;
		room_restart();
	}
	else
	{
		global.pause_player=2;
		if (global.goal_active=false)
		{
			if (asset_get_type("room_pause")==asset_room)
			{
				global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
				room_persistent = true;
				global.pause_room = room;
				audio_pause_all();
				room_goto(room_pause);
			}
			else
			{
				audio_pause_all();
				if (asset_get_type("obj_pause") == asset_object)
				and(!instance_exists(obj_pause))
				{
					global.pause=true;
					pause_hspeed = hspeed;
					pause_vspeed = vspeed;
					instance_create_depth(x,y,0,obj_pause); /*This pause objects creates, that handles the pause screen*/
				}
			}
		}
	}
}

else
if (gamepad_button_check_pressed(3,gp_start))
or(gamepad_button_check_pressed(3,gp_select))
{

	#region /*Show all HUD elements*/
	global.hud_show_lives=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_lives_timer=global.hud_hide_time;
		}
	}
	global.hud_show_basic_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_basic_collectibles_timer=global.hud_hide_time;
		}
	}
	global.hud_show_big_collectibles=true;
	if (asset_get_type("obj_camera")==asset_object)
	and(instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_big_collectibles_timer=global.hud_hide_time;
		}
	}
	#endregion /*Show all HUD elements END*/

	if (global.play_edited_level=true)
	and(global.actually_play_edited_level=false)
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.play_edited_level=false;
		global.actually_play_edited_level=false;
		score=0;
		room_restart();
	}
	else
	{
		global.pause_player=3;
		if (global.goal_active=false)
		{
			if (asset_get_type("room_pause")==asset_room)
			{
				global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
				room_persistent = true;
				global.pause_room = room;
				audio_pause_all();
				room_goto(room_pause);
			}
			else
			{
				audio_pause_all();
				if (asset_get_type("obj_pause") == asset_object)
				and(!instance_exists(obj_pause))
				{
					global.pause=true;
					pause_hspeed = hspeed;
					pause_vspeed = vspeed;
					instance_create_depth(x,y,0,obj_pause); /*This pause objects creates, that handles the pause screen*/
				}
			}
		}
	}
}
else
{
	room_persistent=false;
}
#endregion /*Pause End*/

#region /*Go Left*/
if (key_left)
and(!key_right)
and(can_move = true)
and(global.pause=false)
{
	if (wall_jump = 0)
	and(stick_to_wall = false)
	and(ledge_grab = false)
	and(climb = false)
	and(takendamage <= takendamage_freezetime)
	{
		if (dive = false)
		{
			if (image_xscale = +1)
			{
				image_xscale = -1;
				#region /*Turnaround Effect*/
				if (!place_meeting(x, y + 1, obj_wall))
				{
					effect_turnaround_subimg = 0;
				}
				#endregion /*Turnaround Effect End*/
			}
		}
		if (x > camera_get_view_x(view_camera[view_current]) + 8)
		{
			if (!place_meeting(x - 1, y, obj_wall))
			{
				if (asset_get_type("obj_ice_block") == asset_object)
				and(place_meeting(x, y + 1, obj_ice_block))
				{
					hspeed -= acceleration_on_ice;
				}
				else
				{
					if (place_meeting(x, y + 1, obj_wall))
					or(asset_get_type("obj_semisolid_platform") == asset_object)
					and(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
					{
						hspeed -= acceleration_on_ground;
					}
					else
					{
						hspeed -= acceleration_in_air;
					}
				}
			}
			else
			{
				if (!place_meeting(x - 2, y, obj_wall))
				and(!place_meeting(x, y - 2, obj_wall))
				{
					if (place_meeting(x, y + 1, obj_wall))
					or(asset_get_type("obj_semisolid_platform") == asset_object)
					and(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
					{
						hspeed -= acceleration_on_ground;
					}
					else
					{
						hspeed -= acceleration_in_air;
					}
					vspeed -= 1;
					x -= 1;
					y -= 1;
				}
			}
		}
	}
}
#endregion /*Go Left END*/

#region /*Go Right*/
if (key_right)
and(!key_left)
and(can_move = true)
and(global.pause=false)
{
	if (wall_jump = 0)
	and(stick_to_wall = false)
	and(ledge_grab = false)
	and(climb = false)
	and(takendamage <= takendamage_freezetime)
	{
		if (dive = false)
		{
			if (image_xscale = -1)
			{
				image_xscale = +1;
				#region /*Turnaround Effect*/
				if (!place_meeting(x, y + 1, obj_wall))
				{
					effect_turnaround_subimg = 0;
				}
				#endregion /*Turnaround Effect End*/
			}
		}
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 8)
		{
			if (!place_meeting(x + 1, y, obj_wall))
			{
				if (asset_get_type("obj_ice_block") == asset_object)
				and(place_meeting(x, y + 1, obj_ice_block))
				{
					hspeed += acceleration_on_ice;
				}
				else
				{
					if (place_meeting(x, y + 1, obj_wall))
					or(asset_get_type("obj_semisolid_platform") == asset_object)
					and(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
					{
						hspeed += acceleration_on_ground;
					}
					else
					{
						hspeed += acceleration_in_air;
					}
				}
			}
			else
			{
				if (!place_meeting(x + 2, y, obj_wall))
				and(!place_meeting(x, y - 2, obj_wall))
				{
					if (place_meeting(x, y + 1, obj_wall))
					or(asset_get_type("obj_semisolid_platform") == asset_object)
					and(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
					{
						hspeed += acceleration_on_ground;
					}
					else
					{
						hspeed += acceleration_in_air;
					}
					vspeed -= 1;
					x += 1;
					y -= 1;
				}
			}
		}
	}
}
#endregion /*Go Right END*/

}
#endregion /*If player is allowed to move END*/

#region /*If player has finished the level, make the player run off to the right off screen, and disable player control*/
if (goal=true)
and(global.time_countdown_bonus<=0)
{
	hspeed+=0.3;
	can_move=false;
	if (hspeed>0)
	{
		image_xscale=+1;
	}
}
#endregion /*If player has finished the level, make the player run off to the right off screen, and disable player control END*/

#region /*Sprint*/
if (goal = true)
and(global.time_countdown_bonus <= 0)
{
	speed_max = lerp(speed_max, speed_max_run, 0.1);
}
else
{
	if (crouch = true)
	and(asset_get_type("obj_wall") == asset_object)
	and(place_meeting(x, y + 1, obj_wall))
	or(crouch = true)
	and(asset_get_type("obj_semisolid_platform") == asset_object)
	and(place_meeting(x, y + 1, obj_semisolid_platform))
	{
		if (allow_crawl = true)
		{
			speed_max = lerp(speed_max, speed_max_walk / 2, 0.05);
		}
		else
		{
			speed_max = lerp(speed_max, 0, 0.05);
			hspeed = 0;
		}
	}
	else
	if (key_sprint)
	and(abs(hspeed) > speed_max_walk)
	and(allow_run = true)
	or(double_tap_left = 3)
	and(abs(hspeed) > speed_max_walk)
	and(allow_run = true)
	or(double_tap_right = 3)
	and(abs(hspeed) > speed_max_walk)
	and(allow_run = true)
	{
		if (key_left)
		or(key_right)
		{
			if (invincible > 0)
			and(assist_invincible = false)
			{
				speed_max = lerp(speed_max, 10, 0.1);
			}
			else
			{
				if (speed_max < speed_max_run)
				{
					speed_max = lerp(speed_max, speed_max_run, 0.1);
				}
			}
		}
	}
	else
	{
		if (asset_get_type("obj_wall") == asset_object)
		and(place_meeting(x, y + 1, obj_wall))
		or(asset_get_type("obj_semisolid_platform") == asset_object)
		and(place_meeting(x, y + 1, obj_semisolid_platform))
		{
			if (invincible > 0)
			and(assist_invincible = false)
			{
				speed_max = lerp(speed_max, 6, 0.05);
			}
			else
			{
				speed_max = lerp(speed_max, speed_max_walk, 0.05);
			}
		}
	}
}
#endregion /*Sprint END*/

#region /*Double tap direction to run*/
if (double_tap_to_run=true)
{
	if (!key_sprint)
	{
		
		#region /*Double tap left direction to run*/
		if (key_left)
		{
			if (double_tap_left=false)
			{
				double_tap_left=true;
				double_tap_right=false;
				double_tap_run_timer=15;
			}
			else
			if (double_tap_left=2)
			{
				double_tap_left=3;
				double_tap_run_timer=15;
			}
			else
			{
				double_tap_run_timer=15;
			}
		}
		#endregion /*Double tap left direction to run END*/
		
		#region /*Double tap right direction to run*/
		else
		if (key_right)
		{
			if (double_tap_right=false)
			{
				double_tap_right=true;
				double_tap_left=false;
				double_tap_run_timer=15;
			}
			else
			if (double_tap_right=2)
			{
				double_tap_right=3;
				double_tap_run_timer=15;
			}
			else
			{
				double_tap_run_timer=15;
			}
		}
		#endregion /*Double tap right direction to run END*/
		
		else
		if (!key_left)
		and(!key_right)
		{
			if (double_tap_left=true)
			and(double_tap_run_timer<=28)
			{
				double_tap_left=2;
			}
			else
			if (double_tap_right=true)
			and(double_tap_run_timer<=28)
			{
				double_tap_right=2;
			}
			double_tap_run_timer-=1;
		}
	}
	else
	{
		double_tap_left=false;
		double_tap_right=false;
		double_tap_run_timer=0;
	}
}
if (double_tap_run_timer<=0)
{
	double_tap_run_timer=0;
	double_tap_left=false;
	double_tap_right=false;
}
#endregion /*Double tap direction to run END*/

#region /*Set the friction*/
if (asset_get_type("obj_wall") == asset_object)
and(place_meeting(x, y + 1, obj_wall))
or(asset_get_type("obj_semisolid_platform") == asset_object)
and(place_meeting(x, y + 1, obj_semisolid_platform))
{
	if (speed > 0)
	{
		if (asset_get_type("obj_ice_block") == asset_object)
		and(place_meeting(x, y + 1, obj_ice_block))
		{
			if (key_left)
			or(key_right)
			or(goal = true)
			{
				friction = 0.01;
			}
			else
			{
				friction = 0.02;
			}
		}
		else
		{
			if (key_left)
			or(key_right)
			or(goal = true)
			{
				friction = 0.1;
			}
			else
			{
				friction = 0.2;
			}
		}
	}
}
else
{
	friction = 0;
}
#endregion /*Set the friction END*/

#region /*Jumping*/
if (key_jump)
and(number_of_jumps >= 1)
or(key_jump)
and(number_of_jumps <= -1)
{
	buffer_jump = 10;
}

if (buffer_jump > 0)
{
	buffer_jump -= 1;
}

#region /*If you're falling from a triple jump, reset the jump variable to 0*/
if (jump >= 3)
and(vspeed >= 0)
{
	jump = 0;
}
#endregion /*If you're falling from a triple jump, reset the jump variable to 0 END*/

if (buffer_jump > 0)
and(can_move = true)
and(global.pause=false)
and(key_jump_hold)
{
	
	#region /*Drop down below semisolid platform*/
	if (key_crouch)
	and(ground_pound=false)
	and(asset_get_type("obj_semisolid_platform") == asset_object)
	and(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and(asset_get_type("obj_wall") == asset_object)
	and(!place_meeting(x, y + 1, obj_wall))
	or(key_down)
	and(ground_pound=false)
	and(asset_get_type("obj_semisolid_platform") == asset_object)
	and(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and(asset_get_type("obj_wall") == asset_object)
	and(!place_meeting(x, y + 1, obj_wall))
	{
		vspeed = 0;
		y += 18;
		can_ground_pound = false;
	}
	#endregion /*Drop down below semisolid platform END*/
	
	else
	if (ground_pound = 0)
	{
		if (asset_get_type("obj_wall") == asset_object)
		and(place_meeting(x, y + 1, obj_wall))
		and(crouch = false)
		
		or(asset_get_type("obj_semisolid_platform") == asset_object)
		and(place_meeting(x, y + 1, obj_semisolid_platform))
		and(crouch = false)
		and(vspeed = 0)
		
		or(asset_get_type("obj_wall") == asset_object)
		and(place_meeting(x, y + 1, obj_wall))
		and!(place_meeting(x, y - 1, obj_wall))
		and(crouch = true)
		and(vspeed = 0)
		
		or(asset_get_type("obj_semisolid_platform") == asset_object)
		and(place_meeting(x, y + 1, obj_semisolid_platform))
		and!(place_meeting(x, y - 1, obj_semisolid_platform))
		and(crouch = true)
		and(vspeed = 0)
		{
			jump += 1;
			midair_jumps_left -= 1;
			buffer_jump = 0; /*Reset jump buffer timer back to 0 when jumping*/
			dive = false;
			triplejumpdelay = 12;
			if (abs(hspeed) > 3)
			and (!place_meeting(x,y-8,obj_wall))
			or (key_up)
			and (!place_meeting(x,y-8,obj_wall))
			{
				if (jump > 2)
				{
					vspeed = -triple_jump_height;
					if (image_xscale > 0)
					{
						angle = +720;
					}
					else
					{
						angle = -720;
					}
				}
				else
				{
					vspeed = -higher_jump_height;
				}
			}
			else
			if (!place_meeting(x,y-8,obj_wall))
			{
				vspeed = -normal_jump_height;
			}
			
			#region /*Smoke effect under player when jumping*/
			if (position_meeting(x - 16, bbox_bottom + 1, obj_wall))
			or(asset_get_type("obj_semisolid_platform") == asset_object)
			and(position_meeting(x - 16, bbox_bottom + 1, obj_semisolid_platform))
			{
				effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
			}
			if (position_meeting(x, bbox_bottom + 1, obj_wall))
			or(asset_get_type("obj_semisolid_platform") == asset_object)
			and(position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			{
				effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			}
			if (position_meeting(x + 16, bbox_bottom + 1, obj_wall))
			or(asset_get_type("obj_semisolid_platform") == asset_object)
			and(position_meeting(x + 16, bbox_bottom + 1, obj_semisolid_platform))
			{
				effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
			}
			#endregion /*Smoke effect under player when jumping END*/
			
			image_index = 0;
			
			#region /*Jump sound sfx*/
			if (jump = 3)
			{
				if (asset_get_type("snd_3rdjump") == asset_sound)
				{
					audio_play_sound(snd_3rdjump, 0, 0);
					audio_sound_gain(snd_3rdjump, global.sfx_volume, 0);
				}
			}
			else
			{
				if (asset_get_type("snd_jump") == asset_sound)
				{
					audio_play_sound(snd_jump, 0, 0);
					audio_sound_gain(snd_jump, global.sfx_volume, 0);
				}
			}
			if (jump < 2)
			//if (random(global.verbosity_slider*100) >= 100)
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_jump, 0, 0);
				audio_sound_gain(voice_jump, global.voices_volume, 0);
				audio_sound_pitch(voice_jump, default_voice_pitch);
			}
			if (jump = 2)
			//if (random(global.verbosity_slider*100) >= 100)
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_jump2nd, 0, 0);
				audio_sound_gain(voice_jump2nd, global.voices_volume, 0);
				audio_sound_pitch(voice_jump2nd, default_voice_pitch);
			}
			if (jump = 3)
			//if (random(global.verbosity_slider*100) >= 100)
			{
				audio_stop_sound(voice);
				voice = audio_play_sound(voice_jump3rd, 0, 0);
				audio_sound_gain(voice_jump3rd, global.voices_volume, 0);
				audio_sound_pitch(voice_jump3rd, default_voice_pitch);
			}
			#endregion /*Jump sound effect end*/
			draw_xscale = 0.75;
			draw_yscale = 1.25;
		}
	}
}
#endregion /*Jumping END*/

#region /*Mid-Air / Double Jumping*/
if (key_jump)
and (can_move = true)
and (global.pause = false)
and (global.equipped_upgrade_double_jump = true)
and (ground_pound = false)
and (climb = false)
and (horizontal_rope_climb = false)
and (stick_to_wall = false)
and (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y+1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!place_meeting(x, y+1, obj_semisolid_platform))
and (!place_meeting(x, bbox_bottom+1, obj_semisolid_platform))
and (in_water = false)
{
	if (spring = true)
	and (vspeed > -20)
	or (spring = false)
	{
		if (global.has_upgrade_double_jump = true)
		or (number_of_jumps >= 2)
		and (midair_jumps_left > 0)
		or (number_of_jumps <= -1)
		{
			buffer_jump = 0;
			dive = false;
			if (!place_meeting(x, y-double_jump_height, obj_wall))
			{
				vspeed = -double_jump_height;
			}
			else
			if (!place_meeting(x, y-4, obj_wall))
			{
				vspeed = -4;
			}
			else
			{
				vspeed = 0;
			}
			if (voice_jump > noone)
			{
				audio_stop_sound(voice);
			}
			voice = audio_play_sound(voice_jump, 0, 0);
			audio_sound_gain(voice_jump,global.voices_volume,0);
			audio_sound_pitch(voice_jump, default_voice_pitch);
			effect_create_above(ef_smoke,x-16,bbox_bottom,0,c_white);
			effect_create_above(ef_smoke,x,bbox_bottom,0,c_white);
			effect_create_above(ef_smoke,x+16,bbox_bottom,0,c_white);
			image_index=0;
		
			if (number_of_jumps > -1)
			and(midair_jumps_left != number_of_jumps)
			{
				midair_jumps_left -= 1;
			}
			else
			{
				midair_jumps_left -= 2;
			}
		
			#region /*Mid-air flip animation*/
			if (midair_jumps_left >= midair_jump_flip_animation)
			or (number_of_jumps = 2)
			and(midair_jump_flip_animation >= 2)
			{
				if (image_xscale>0)
				{
					angle=+360;
				}
				else
				{
					angle=-360;
				}
			}
			#endregion /*Mid-air flip animation END*/
		
		}
	}
}
#endregion /*Mid-Air / Double Jumping END*/

#region /*Recharge mid-air / double jump when landing on ground*/
if (asset_get_type("obj_wall")==asset_object)
and (place_meeting(x,y+1,obj_wall))
or (asset_get_type("obj_semisolid_platform")==asset_object)
and (position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
or (asset_get_type("obj_semisolid_platform")==asset_object)
and (position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
or (asset_get_type("obj_semisolid_platform")==asset_object)
and (position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
{
	if (vspeed >= 0)
	{
		midair_jumps_left = number_of_jumps;
	}
}
#endregion /*Recharge mid-air / double jump when landing on ground END*/

#region /*Do a small jump when releasing the jump button*/
if (key_jump_released)
and(!key_spin)
and(spring=false)
{
	if (vspeed<0) /*When still traveling up*/
	{
		vspeed/=2; /*Divide the vertical speed by half*/
	}
}
#endregion /*Do a small jump when releasing the jump button END*/

#region /*Fall faster*/
if (vspeed > 0)
{
	vspeed += 0.4;
}
#endregion /*Fall faster END*/

#region /*Set the gravity*/
gravity_direction = 270; /*Direction of the gravity*/
if (asset_get_type("obj_wall") == asset_object)
and(!place_meeting(x, y + 1, obj_wall))
and(climb = false)
and(horizontal_rope_climb = false)
{
	gravity = 0.5; /*The gravity*/
}
else
{
	gravity = 0;
}

if (asset_get_type("obj_semisolid_platform") == asset_object)
{
	if (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 4, obj_semisolid_platform))

	or(position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 4, obj_semisolid_platform))

	or(position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 4, obj_semisolid_platform))
	{
		gravity = 0;
	}
}
#endregion /*Set the gravity END*/

#region /*Limits the horizontal speed*/
if (abs(hspeed) > speed_max)
{
	hspeed -= 0.4 * sign(hspeed);
}
#endregion /*Limits the horizontal speed END*/

#region /*Limits the vertical speed*/
if (place_meeting(x,y+32,obj_semisolid_platform))
or(place_meeting(x,y+16,obj_semisolid_platform))
or(place_meeting(x,y+8,obj_semisolid_platform))
or(place_meeting(x,y+1,obj_semisolid_platform))
{
	if (vspeed>8)
	{
		vspeed =+8;
	}
}
else
{
	if (ground_pound=true)
	{
		if (vspeed>30)
		{
			vspeed =+30;
		}
	}
	else
	if (key_jump_hold)
	{
		if (vspeed>17)
		{
			vspeed =+17;
		}
	}
	else
	{
		if (vspeed>20)
		{
			vspeed =+20;
		}
	}
}
#endregion /*Limits the vertical speed END*/

#region /*Bottomless Pit*/
if (y>room_height+sprite_height)
{
	die=true;
}
#endregion /*Bottomless Pit End*/

#region /*Stuck inside a wall*/
if (position_meeting(x,y,obj_wall))
{
	stuck_in_wall_counter+=1;
	if (stuck_in_wall_counter>=2)
	{
		die=true;
	}
}
else
{
	if (stuck_in_wall_counter>0)
	{
		stuck_in_wall_counter-=1;
	}
}
#endregion /*Stuck inside a wall End*/

#region /*________________________________MORE MOVES________________________________*/

#region /*Tongue*/
if (can_move=true)
and (global.pause=false)
{
	if (asset_get_type("obj_tongue")==asset_object)
	{
		if (!instance_exists(obj_tongue))
		{
			can_tongue=true;
		}
	}
	if (allow_tongue=true)
	{
		if (can_tongue=true)
		and (climb=false)
		and (horizontal_rope_climb=false)
		{
			if (asset_get_type("obj_tongue")==asset_object)
			{
				
				#region /*Key Tongue Pressed*/
				if (key_tongue_pressed)
				or (mouse_check_button_pressed(mb_left))
				or (gamepad_axis_value(0,gp_axisrh)<-0.5)
				or (gamepad_axis_value(0,gp_axisrh)>+0.5)
				or (gamepad_axis_value(0,gp_axisrv)<-0.5)
				or (gamepad_axis_value(0,gp_axisrv)>+0.5)
				{
					can_tongue=false;
					tongue_obj=instance_create_depth(x,y,0,obj_tongue);
					if (mouse_check_button_pressed(mb_left))
					{
						with(tongue_obj)
						{
							motion_set(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y),16);
						}
					}
					else
					if (gamepad_axis_value(0,gp_axisrh)!=0)
					or (gamepad_axis_value(0,gp_axisrv)!=0)
					{
						with(tongue_obj)
						{
							motion_set(point_direction(0,0,gamepad_axis_value(0,gp_axisrh),gamepad_axis_value(0,gp_axisrv)),16);
						}
					}
					else
					if (gamepad_axis_value(0,gp_axislh)!=0)
					or (gamepad_axis_value(0,gp_axislv)!=0)
					{
						
						#region /*Key Sprint Pressed*/
						if (key_sprint_pressed)
						{
							with(tongue_obj)
							{
								motion_set(point_direction(0,0,gamepad_axis_value(0,gp_axislh),gamepad_axis_value(0,gp_axislv)),16);
							}
						}
						#endregion /*Key Sprint Pressed END*/
						
					}
					else
					
					#region /*Key Up*/
					if (key_up)
					{
						
						#region /*Key Left*/
						if (key_left)
						and(!place_meeting(x-1,y,obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(135,16);
							}
						}
						#endregion /*Key Left END*/
						
						else
						
						#region /*Key Right*/
						if (key_right)
						and (!place_meeting(x+1,y,obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(45,16);
							}
						}
						#endregion /*Key Right END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(90,16);
							}
						}
					}
					#endregion /*Key Up END*/
					
					else
					
					#region /*Key Left*/
					if (key_left)
					and (!place_meeting(x-1,y,obj_wall))
					{
						
						#region /*Key Up*/
						if (key_up)
						{
							with(tongue_obj)
							{
								motion_set(135,16);
							}
						}
						#region /*Key Up END*/
						
						else
						
						#region /*Key Down*/
						if (key_down)
						{
							with(tongue_obj)
							{
								motion_set(225,16);
							}
						}
						#region /*Key Down END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(180,16);
							}
						}
					}
					#endregion /*Key Left END*/
					
					else
					
					#region /*Key Right*/
					if (key_right)
					and (!place_meeting(x+1,y,obj_wall))
					{
						
						#region /*Key Up*/
						if (key_up)
						{
							with(tongue_obj)
							{
								motion_set(85,16);
							}
						}
						#endregion /*Key Up END*/
						
						else
						
						#region /*Key Down*/
						if (key_down)
						{
							with(tongue_obj)
							{
								motion_set(315,16);
							}
						}
						#endregion /*Key Down END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(0,16);
							}
						}
					}
					#endregion /*Key Right END*/
					
					else
					
					#region /*Key Down*/
					if (key_down)
					and (!place_meeting(x,y+1,obj_wall))
					{
						
						#region /*Key Left*/
						if (key_left)
						and (!place_meeting(x-1,y,obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(225,16);
							}
						}
						#endregion /*Key Left END*/
						
						else
						
						#region /*Key Right*/
						if (key_right)
						and (!place_meeting(x+1,y,obj_wall))
						{
							with(tongue_obj)
							{
								motion_set(315,16);
							}
						}
						#endregion /*Key Right END*/
						
						else
						{
							with(tongue_obj)
							{
								motion_set(270,16);
							}
						}
					}
					#endregion /*Key Down END*/
					
					else
					if (image_xscale<0)
					and (!place_meeting(x-1,y,obj_wall))
					{
						with(tongue_obj)
						{
							motion_set(180,16);
						}
					}
					else
					if (image_xscale>0)
					and (!place_meeting(x+1,y,obj_wall))
					{
						with(tongue_obj)
						{
							motion_set(0,16);
						}
					}
				}
				#endregion /*Key Tongue Pressed END*/
				
			}
		}
	}

	#region /*Rope Swing*/
	if (ropeswing=true)
	{
		can_ground_pound = false;
		ground_pound=false;
		gravity=0; /*No gravity when rope swinging*/
		if (asset_get_type("obj_tongue")==asset_object)
		and(instance_exists(obj_tongue))
		{
			grappleX=instance_nearest(x,y,obj_tongue).x;
			grappleY=instance_nearest(x,y,obj_tongue).y;
			ropeAngle=point_direction(grappleX,grappleY,x,y);
			ropeLength=point_distance(grappleX,grappleY,x,y);
			var rope_angle_acceleration=-0.4*dcos(ropeAngle);
			
			#region /*Key Right*/
			if (key_right)
			and(obj_tongue.y>y)
			and(obj_tongue.x>x-1)
			and(obj_tongue.x<x+1)
			and(!place_meeting(x+4,y,obj_wall))
			{
				rope_angle_acceleration-=0.08;
			}
			#endregion /*Key Right END*/
			
			else
			
			#region /*Key Left*/
			if (key_left)
			and(obj_tongue.y>y)
			and(obj_tongue.x>x-1)
			and(obj_tongue.x<x+1)
			and(!place_meeting(x-4,y,obj_wall))
			{
				rope_angle_acceleration+=0.08;
			}
			#endregion /*Key Left END*/
			
			else
			
			#region /*Key Left*/
			if (key_left)
			and(!place_meeting(x-4,y,obj_wall))
			{
				rope_angle_acceleration-=0.08;
			}
			#endregion /*Key Left END*/
			
			else
			
			#region /*Key Right*/
			if (key_right)
			and(!place_meeting(x+4,y,obj_wall))
			{
				rope_angle_acceleration+=0.08;
			}
			#endregion /*Key Right END*/
			
			#region /*Key Up or Down*/
			if (key_up)
			and(obj_tongue.y<y)
			or(key_down)
			and(obj_tongue.y>y)
			{
				if (ropeLength>5)
				and(!place_meeting(x,y-4,obj_wall))
				{
					ropeLength-=2;
				}
			}
			#endregion /*Key Up or Down*/
			
			else
			
			#region /*Key Down or Up*/
			if (key_down)
			and(obj_tongue.y<y)
			or(key_up)
			and(obj_tongue.y>y)
			{
				if (ropeLength<320)
				and(!place_meeting(x,y+4,obj_wall))
				{
					ropeLength+=2;
				}
			}
			#endregion /*Key Down or Up END*/
			
			if (ropeLength>320)
			{
				ropeLength-=1;
			}
			ropeLength=max(ropeLength,0);
			ropeAngleVelocity+=rope_angle_acceleration;
			ropeAngle+=ropeAngleVelocity;
			ropeAngleVelocity*=0.99;
			ropeX=grappleX+lengthdir_x(ropeLength,ropeAngle);
			ropeY=grappleY+lengthdir_y(ropeLength,ropeAngle);
			hspeed=ropeX-x;
			vspeed =ropeY-y;
		}

		if (instance_number(instance_nearest(x,y,obj_tongue))<1)
		{
			with(instance_nearest(x,y,obj_tongue))
			{
				move_towards_point(instance_nearest(x,y,obj_player).x,instance_nearest(x,y,obj_player).y,32);
			}
			ropeswing=false;
		}
		else
		
		#region /*Key Jump*/
		if (key_jump)
		{
			with(instance_nearest(x,y,obj_tongue))
			{
				timer=25;
				move_towards_point(instance_nearest(x,y,obj_player).x,instance_nearest(x,y,obj_player).y,32);
			}
			vspeed = -normal_jump_height+vspeed;
			ropeAngleVelocity=0;
			grappleX=x;
			grappleY=y;
			ropeAngle=point_direction(grappleX,grappleY,x,y);
			ropeLength=point_distance(grappleX,grappleY,x,y);
			ropeswing=false;
		}
		#endregion /*Key Jump END*/
		
	}
	#endregion /*Rope Swing END*/
	
}
else
{
	ropeswing=false;
	if (instance_exists(obj_tongue))
	{
		with(obj_tongue)
		{
			instance_destroy();
		}
	}
}
#endregion /*Tongue END*/

#region /*Roll when landing*/
if (allow_roll=true)
and(place_meeting(x,y+1,obj_wall))
{
	if (abs(hspeed)<1)
	{
		hspeed=0;
	}
	if (y>laststandingy+4)
	{
		if (hspeed>0)
		{
			angle=+360;
			roll=true;
		}
		else
		if (hspeed<0)
		{
			angle=-360;
			roll=true;
		}
	}
}
#endregion /*Roll when landing End*/

#region /*Go with Platform*/
if (place_meeting(x,y+4,obj_wall))
{
	if (instance_nearest(x,bbox_bottom,obj_wall).vspeed>0)
	{
		y=instance_nearest(x,bbox_bottom,obj_wall).bbox_top-37;
	}
	hspeed+=instance_nearest(x,bbox_bottom,obj_wall).hspeed;
}
#endregion /*Go with Platform END*/

#region /*Chain Reaction Reset*/
if (asset_get_type("obj_wall")==asset_object)
and(place_meeting(x,y+1,obj_wall))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
{
	if (invincible<1)
	{
		chain_reaction=0;
	}
}
if (assist_invincible=true)
{
	chain_reaction=0;
}
#endregion /*Chain Reaction Reset END*/

#region /*Triple Jump*/
if (asset_get_type("obj_wall")==asset_object)
and(place_meeting(x,y+1,obj_wall))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
{
	if (triplejumpdelay>0)
	{
		triplejumpdelay-=1;
	}
}
if (place_meeting(x,y+1,obj_wall))
and(speed<7) /*Player must be running at this speed to be able to triple jump*/
and(jump>1)
or(place_meeting(x,y+1,obj_wall))
and(triplejumpdelay<1)
or(jump>3)
or(place_meeting(x,y+1,obj_wall))
and(vspeed>=0)
and(jump=3)
{
	jump=0;
}
if (place_meeting(x,y+2,obj_wall))
and(jump>2)
and(vspeed>=0)
{
	jump=0;
	if (!key_left)
	and(!key_right)
	{
		hspeed=0;
	}
}
#endregion /*Triple Jump END*/

#region /*Wall Jump and Wall Climb*/
if (allow_wall_jump = true)
and(can_wall_jump = true)
and(can_move=true)
and(global.pause=false)
and(takendamage<=takendamage_freezetime)
and(wall_jump_setting>=1)
{
	if (asset_get_type("obj_wall")==asset_object)
	and(!place_meeting(x,y+1,obj_wall))
	and(!place_meeting(x,y+32,obj_wall))
	and(asset_get_type("obj_semisolid_platform")==asset_object)
	and(!position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
	{
		if (climb=false)
		and(horizontal_rope_climb=false)
		and(vspeed>=0)
		{
			if (key_left)
			and(!key_right)
			and(wall_jump_setting=2)
			and(place_meeting(x-1,y,obj_wall))
			or(!key_right)
			and(dive=false)
			and(wall_jump_setting=1)
			and(place_meeting(x-1,y,obj_wall))
			and(image_xscale<0)
			or(dive=true)
			and(wall_jump_setting=1)
			and(place_meeting(x-1,y,obj_wall))
			and(image_xscale<0)
			{
				if (crouch=false)
				and(ground_pound=false)
				and(ledge_grab=false)
				and(burnt=false)
				{
					angle=0;
					image_xscale=-1;
					jump=0;
					dive=false;
					dive_on_ground=false;
					stomp_spin=false;
					stick_to_wall = true;
					midair_jumps_left=number_of_jumps;
					chain_reaction=0;
					wall_jump = 0;
					ground_pound=false;
					spring=false;
					triplejumpdelay=0;
				}
			}
			else
			if (key_right)
			and(!key_left)
			and(wall_jump_setting=2)
			and(place_meeting(x+1,y,obj_wall))
			or(!key_left)
			and(dive=false)
			and(wall_jump_setting=1)
			and(place_meeting(x+1,y,obj_wall))
			and(image_xscale>0)
			or(dive=true)
			and(wall_jump_setting=1)
			and(place_meeting(x+1,y,obj_wall))
			and(image_xscale>0)
			{
				if (crouch=false)
				and(ground_pound=false)
				and(ledge_grab=false)
				and(burnt=false)
				{
					angle=0;
					image_xscale=+1;
					jump=0;
					dive=false;
					dive_on_ground=false;
					stomp_spin=false;
					stick_to_wall = true;
					midair_jumps_left=number_of_jumps;
					chain_reaction=0;
					wall_jump = 0;
					ground_pound=false;
					spring=false;
					triplejumpdelay=0;
				}
			}
		}
	}
	if (stick_to_wall = true)
	{
		
		#region /*Pressing opposite direction to drop off from wall*/
		if (key_left)
		and (!key_right)
		and (image_xscale = +1)
		or (key_right)
		and (!key_left)
		and (image_xscale = -1)
		{
			dive = false;
			pressing_opposite_direction_to_drop_off_from_wall += 1;
		}
		else
		if (pressing_opposite_direction_to_drop_off_from_wall > 0)
		{
			pressing_opposite_direction_to_drop_off_from_wall -= 1;
		}
		#endregion /*Pressing opposite direction to drop off from wall END*/
		
		#region /*If there is ground under you while trying to go down, then stop wall climbing*/
		if (asset_get_type("obj_wall")==asset_object)
		and(place_meeting(x,y+1,obj_wall))
		or(asset_get_type("obj_semisolid_platform")==asset_object)
		and(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
		{
			stick_to_wall = false;
		}
		#endregion /*If there is ground under you while trying to go down, then stop wall climbing END*/
		
		if (crouch=false)
		and(ground_pound=false)
		and(ledge_grab=false)
		{
			if (vspeed>0)
			and(position_meeting(x+18*image_xscale,bbox_top,obj_wall))
			{
				effect_create_above(ef_smoke,x+17*image_xscale,bbox_top,0,c_white);
				if (asset_get_type("snd_skiddingvertical")==asset_sound)
				{
					if (!audio_is_playing(snd_skiddingvertical))
					{
						audio_play_sound(snd_skiddingvertical,0,0);
						audio_sound_gain(snd_skiddingvertical,global.sfx_volume,0);
					}
				}
				angle=0;
			}
			else
			{
				if (asset_get_type("snd_skiddingvertical")==asset_sound)
				{
					if (audio_is_playing(snd_skiddingvertical))
					{
						audio_stop_sound(snd_skiddingvertical);
					}
				}
			}
			if (vspeed>=4)
			{
				vspeed =4;
			}
			if (!place_meeting(x-1,y,obj_wall))
			and(image_xscale<0)
			or(!place_meeting(x+1,y,obj_wall))
			and(image_xscale>0)
			or(place_meeting(x,y+1,obj_wall))
			{
				stick_to_wall=false;
				if (asset_get_type("snd_skiddingvertical")==asset_sound)
				{
					if (audio_is_playing(snd_skiddingvertical))
					{
						audio_stop_sound(snd_skiddingvertical);
					}
				}
			}
		}
		
		#region /*Wall Climb*/
		if (allow_wall_climb=true)
		{
			dive = false;
			laststandingy=y;
			if (key_down)
			and(!key_up)
			and(takendamage<=takendamage_freezetime)
			{
				if (asset_get_type("snd_move_ivy")==asset_sound)
				and(!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy,0,0);
					audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
				}
				can_ground_pound = false;
				ledge_grab_jump=false;
				vspeed =+4;
			}
			else
			if (key_up)
			and(!key_down)
			
			or(image_xscale<0)
			and(key_left)
			and(!key_right)
			
			or(image_xscale>0)
			and(key_right)
			and(!key_left)
			{
				if (bbox_bottom>0)
				and(takendamage<=takendamage_freezetime)
				{
					if (!place_meeting(x,y-16,obj_wall))
					{
						if (asset_get_type("snd_move_ivy")==asset_sound)
						and(!audio_is_playing(snd_move_ivy))
						{
							audio_play_sound(snd_move_ivy,0,0);
							audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
						}
						can_ground_pound = true;
						can_dive = true;
						ledge_grab_jump=true;
						vspeed = -4;
					}
					else
					{
						
						#region /*Stop climbing up if there is a wall above you*/
						if (asset_get_type("snd_bump")==asset_sound)
						and(!audio_is_playing(snd_bump))
						{
							audio_play_sound(snd_bump,0,0);
							audio_sound_gain(snd_bump,global.sfx_volume,0);
						}
						#endregion /*Stop climbing up if there is a wall above you END*/
					
					}
				}
				else
				{
					
					#region /*Stop climbing up if you're above the level and there is nothing above you*/
					if (asset_get_type("snd_bump")==asset_sound)
					and(!audio_is_playing(snd_bump))
					{
						audio_play_sound(snd_bump,0,0);
						audio_sound_gain(snd_bump,global.sfx_volume,0);
					}
					#endregion /*Stop climbing up if you're above the level and there is nothing above you END*/
					
				}
			}
			else
			if (vspeed>=0)
			{
				can_ground_pound = true;
				can_dive = true;
				ledge_grab_jump=false;
				vspeed =0;
				gravity=0;
			}
		}
		#endregion /*Wall Climb END*/

		#region /*When pressing the jump button and besides the wall, do the wall jump*/
		if (key_jump)
		and(place_meeting(x+1,y,obj_wall))
		
		or(key_jump)
		and(place_meeting(x-1,y,obj_wall))
		
		or(allow_dive=true)
		and(key_dive_pressed) /*Press dive to jump from wall using a dive*/
		and(key_left)
		and(!key_right)
		and(place_meeting(x+1,y,obj_wall))
		
		or(allow_dive=true)
		and(key_dive_pressed) /*Press dive to jump from wall using a dive*/
		and(key_right)
		and(!key_left)
		and(place_meeting(x-1,y,obj_wall))
		{
			if (crouch=false)
			and(ground_pound=false)
			and(ledge_grab=false)
			{
				spring=false;
				audio_stop_sound(voice);
				voice=audio_play_sound(voice_wallkick,0,0);
				audio_sound_gain(voice_wallkick,global.voices_volume,0);
				audio_sound_pitch(voice_wallkick, default_voice_pitch);
				if (asset_get_type("snd_wallkick")==asset_sound)
				{
					audio_play_sound(snd_wallkick,0,0);
					audio_sound_gain(snd_wallkick,global.sfx_volume,0);
				}
				angle=0;
				laststandingy=y;
				image_index=0;
				if (place_meeting(x+1,y,obj_wall))
				{
					image_xscale=-1;
					if (!place_meeting(x-6,y,obj_wall))
					{
						hspeed=-6;
					}
				}
				else
				if (place_meeting(x-1,y,obj_wall))
				{
					image_xscale=+1;
					if (!place_meeting(x+6,y,obj_wall))
					{
						hspeed=+6;
					}
				}
				jump=1;
				triplejumpdelay=50;
				wall_jump = wall_jump_time;
				crouch=false;
				stick_to_wall=false;
				ledge_grab_jump=false;
				speed_max=8;
				vspeed = -normal_jump_height;
				midair_jumps_left = number_of_jumps-1;
				image_index=0;
				effect_create_above(ef_smoke,x,bbox_bottom-8,0,c_white);
				effect_create_above(ef_smoke,x,bbox_top+8,0,c_white);
				if (asset_get_type("obj_wall_jumpspark")==asset_object)
				{
					instance_create_depth(x,y,0,obj_wall_jumpspark);
				}
			}
		}
		#endregion /*When pressing the jump button and besides the wall, do the wall jump END*/

	}
	else
	{
		pressing_opposite_direction_to_drop_off_from_wall = 0;
	}
	if (wall_jump > 0)
	{
		wall_jump -= 1;
		if (vspeed>=0)
		{
			stick_to_wall=false;
		}
		if (vspeed<0)
		{
		
			#region /*Change direction when diving*/
			if (key_dive_pressed)
			and(allow_dive=true)
			and(key_left)
			and(!key_right)
			{
				image_xscale=-1;
			}
			else
			if (key_dive_pressed)
			and(allow_dive=true)
			and(key_right)
			and(!key_left)
			{
				image_xscale=+1;
			}
			#endregion /*Change direction when diving END*/
		
			crouch=false;
			if (asset_get_type("obj_speedline")==asset_object)
			{
				instance_create_depth(x,y,0,obj_speedline);
			}
		}
	}

	#region /*When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall jump liding down state*/
	if (key_down)
	and(!key_left)
	and(!key_right)
	and(key_sprint_pressed)
	and(stick_to_wall = true)
	or (key_down)
	and(!key_left)
	and(!key_right)
	and(key_dive_pressed)
	and(stick_to_wall = true)
	or (pressing_opposite_direction_to_drop_off_from_wall >=10)
	{
		if (place_meeting(x-1,y,obj_wall))
		{
			x+=1;
		}
		if (place_meeting(x+1,y,obj_wall))
		{
			x-=1;
		}
		pressing_opposite_direction_to_drop_off_from_wall = 0;
		climb=false;
		horizontal_rope_climb=false;
		dive=false;
		drop_off_wall_climb=true; /*Drop down from wall climbing*/
		hspeed=0;
		vspeed = +1;
		midair_jumps_left -= 1;
		stick_to_wall=false;
		crouch=false;
	}
	else
	if (key_jump)
	and(key_right)
	and(!key_left)
	and(wall_jump_setting>=1)
	and(place_meeting(x+1,y,obj_wall))
	and(!place_meeting(x,y+16,obj_wall))
	
	or(key_jump)
	and(key_left)
	and(!key_right)
	and(wall_jump_setting>=1)
	and(place_meeting(x-1,y,obj_wall))
	and(!place_meeting(x,y+16,obj_wall))
	
	or(key_jump)
	and(wall_jump_setting=1)
	and(place_meeting(x+1,y,obj_wall))
	and(!place_meeting(x,y+16,obj_wall))
	
	or(key_jump)
	and(wall_jump_setting=1)
	and(place_meeting(x-1,y,obj_wall))
	and(!place_meeting(x,y+16,obj_wall))
	{
		if (crouch=false)
		and(ground_pound=false)
		and(ledge_grab=false)
		{
			spring=false;
			audio_stop_sound(voice);
			voice=audio_play_sound(choose(voice_wallkick,voice_jump),0,0);
			audio_sound_gain(voice_wallkick,global.voices_volume,0);
			audio_sound_pitch(voice_wallkick, default_voice_pitch);
			audio_sound_gain(voice_jump,global.voices_volume,0);
			audio_sound_pitch(voice_jump, default_voice_pitch);
			if (asset_get_type("snd_wallkick")==asset_sound)
			{
				audio_play_sound(snd_wallkick,0,0);
				audio_sound_gain(snd_wallkick,global.sfx_volume,0);
			}
			angle=0;
			laststandingy=y;
			image_index=0;
			if (place_meeting(x+1,y,obj_wall))
			{
				image_xscale=-1;
				if (!place_meeting(x-6,y,obj_wall))
				{
					hspeed=-6;
				}
			}
			else
			if (place_meeting(x-1,y,obj_wall))
			{
				image_xscale=+1;
				if (!place_meeting(x+6,y,obj_wall))
				{
					hspeed=+6;
				}
			}
			jump=1;
			triplejumpdelay=50;
			wall_jump = wall_jump_time;
			crouch=false;
			stick_to_wall=false;
			ledge_grab_jump=false;
			speed_max=8;
			vspeed = -normal_jump_height;
			image_index=0;
			effect_create_above(ef_smoke,x,bbox_bottom-8,0,c_white);
			effect_create_above(ef_smoke,x,bbox_top+8,0,c_white);
			if (asset_get_type("obj_wall_jumpspark")==asset_object)
			{
				instance_create_depth(x,y,0,obj_wall_jumpspark);
			}
		}
	}
	#endregion /*When pressing the jump button, a direction and besides the wall, do the wall jump even if you still haven't started the wall jump liding down state*/
	
}
else
stick_to_wall=false;
if (stick_to_wall=false)
{
	if (asset_get_type("snd_skiddingvertical")==asset_sound)
	and(audio_is_playing(snd_skiddingvertical))
	{
		audio_stop_sound(snd_skiddingvertical);
	}
}
if (drop_off_wall_climb>false)
{
	drop_off_wall_climb-=0.1;
}
#endregion /*Wall Jump and Wall Climb END*/

#region /*Ground Pound*/
if (allow_ground_pound=true)
and(can_move=true)
and(global.pause=false)
and(can_ground_pound=true)
and(takendamage<=takendamage_freezetime)
{
	if (dive = false)
	and(burnt = false)
	{
		if (key_crouch_pressed)
		{
			if (crouch=false)
			and(climb=false)
			and(horizontal_rope_climb=false)
			{
				if (asset_get_type("obj_wall")==asset_object)
				and(!place_meeting(x,y+8,obj_wall))
				and(asset_get_type("obj_semisolid_platform")==asset_object)
				and(!position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
				and(!position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
				and(!position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
				{
					if (ground_pound=false)
					{
						can_climb_horizontal_rope_cooldown = 20;
						ground_pound=true;
						stick_to_wall=false;
						move_towards_spring_endpoint = false;
						wall_jump = 0;
						if (image_xscale>0)
						{
							angle=+360;
						}
						else
						{
							angle=-360;
						}
						image_index=0;
						if (asset_get_type("snd_rolling")==asset_sound)
						{
							audio_play_sound(snd_rolling,0,0);
							audio_sound_gain(snd_rolling,global.sfx_volume,0);
						}
						hspeed=0;
						speed_max=1;
						if (image_index>image_number-1)
						{
							image_speed=0;
							vspeed =+16;
						}
						else
						{
							image_speed=0.5;
							vspeed = -4;
						}
					}
				}
			}
		}
		if (ground_pound=true)
		{
			if (asset_get_type("obj_speedline")==asset_object)
			{
				instance_create_depth(x,y,0,obj_speedline);
			}
			if (vspeed>8)
			{
				vspeed =+24;
			}
	
			#region /*If hitting a corner of a wall, move the player either left or right*/
			if (place_meeting(x,y+1,obj_wall))
			{
		
				#region /*Move left to avoid a left corner*/
				if (!position_meeting(bbox_left-1,bbox_bottom+1,obj_wall))
				and(position_meeting(bbox_right+1,bbox_bottom+1,obj_wall))
				{
					x-=1;
				}
				#endregion /*Move left to avoid a left corner END*/
		
				else
		
				#region /*Move right to avoid a right corner*/
				if (position_meeting(bbox_left-1,bbox_bottom+1,obj_wall))
				and(!position_meeting(bbox_right+1,bbox_bottom+1,obj_wall))
				{
					y+=1;
				}
				#endregion /*Move right to avoid a right corner END*/
		
			}
			#endregion /*If hitting a corner of a wall, move the player either left or right END*/

			#region /*If touching the ground when doing a ground pound*/
			if (position_meeting(bbox_left+1,bbox_bottom+1,obj_wall))
			or (position_meeting(x,bbox_bottom+1,obj_wall))
			or (position_meeting(bbox_right-1,bbox_bottom+1,obj_wall))
			or (position_meeting(bbox_left+1,bbox_bottom+1,obj_semisolid_platform))
			or (position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
			or (position_meeting(bbox_right-1,bbox_bottom+1,obj_semisolid_platform))
			{
				effect_create_above(ef_smoke,x,bbox_bottom,2,c_white);
				image_index=0;
				ground_pound=2;
				speed_max=4;
				if (asset_get_type("obj_camera")==asset_object)
				{
					with(instance_nearest(x,y,obj_camera))
					{
						shake=10;
					}
				}
				if (asset_get_type("snd_hipattack")==asset_sound)
				{
					audio_play_sound(snd_hipattack,0,0);
					audio_sound_gain(snd_hipattack,global.sfx_volume,0);
				}
			}
			#endregion /*If touching the ground when doing a ground pound END*/
	
			else
			if (key_up)
			and(vspeed>4)
			or (key_dive_pressed)
			and(vspeed>4)
			or(vspeed<-4)
			{
				image_index=0;
				ground_pound=false;
				speed_max=4;
				spring_animation=2;
			}
		}
		else
		if (ground_pound=2)
		{
			if (asset_get_type("obj_wall")==asset_object)
			and(place_meeting(x,y+1,obj_wall))
			or(asset_get_type("obj_semisolid_platform")==asset_object)
			and(place_meeting(x,y+1,obj_semisolid_platform))
			{
				speed_max=0;
				hspeed=0;
				if (allow_ground_poundjump=true)
				and(key_jump_hold)
				{
					can_ground_pound = false;
					effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
					ground_pound = 3;
					image_index = 0;
					midair_jumps_left -= 1;
					speed_max = 4;
					vspeed = -higher_jump_height;
					if (image_xscale>0)
					{
						angle=-360;
					}
					else
					{
						angle=+360;
					}
				}
			}
			if (image_index>image_number-1)
			{
				speed_max=4;
				ground_pound=false;
			}
		}
		else
		if (ground_pound=3)
		{
			if (key_sprint)
			{
				speed_max=8;
			}
			else
			{
				speed_max=4;
			}
			if (image_index>image_number-1)
			or(vspeed>0)
			{
				ground_pound=false;
			}
		}
	}
}
if (can_ground_pound=false)
and(!key_down)
{
	can_ground_pound = true;
}
#endregion /*Ground Pound END*/

#region /*Dive*/
if (allow_dive=true)
and(can_move=true)
and(global.pause=false)
{
	if (can_dive = true)
	and (drop_off_wall_climb = false)
	and (in_water = false)
	{
		if (dive=false)
		and(burnt=false)
		and(stick_to_wall=false)
		and(climb=false)
		and(horizontal_rope_climb=false)
		and(takendamage<=takendamage_freezetime)
		{
			if (key_dive_pressed)
			{
				if (allow_tongue=false)
				{
					if (speed_max<8)
					{
						speed_max=8;
					}
					if (!place_meeting(x, y-8, obj_wall))
					{
						vspeed = -6;
					}
					else
					{
						vspeed = 0;
					}
					
					#region /*Choose direction to dive*/
					if (key_left)
					and(!key_right)
					or(image_xscale<0)
					{
						if (hspeed>-10)
						{
							if (asset_get_type("obj_wall")==asset_object)
							and(!place_meeting(x-4,y,obj_wall))
							{
								hspeed=-10;
							}
						}
						image_xscale=-1;
					}
					else
					if (key_right)
					and(!key_left)
					or(image_xscale>0)
					{
						if (hspeed<+10)
						{
							if (asset_get_type("obj_wall")==asset_object)
							and(!place_meeting(x+4,y,obj_wall))
							{
								hspeed=+10;
							}
						}
						image_xscale=+1;
					}
					#endregion /*Choose direction to dive*/
					
					ground_pound=false;
					can_ground_pound = false;
					if (asset_get_type("snd_dive")==asset_sound)
					{
						audio_play_sound(snd_dive,0,0);
						audio_sound_gain(snd_dive,global.sfx_volume,0);
					}
					audio_stop_sound(voice);
					voice=audio_play_sound(voice_dive,0,0);
					audio_sound_gain(voice_dive,global.voices_volume,0);
					audio_sound_pitch(voice_dive, default_voice_pitch);
					dive=true;
					jump=0;
					spring=false;
					move_towards_spring_endpoint = false;
					if (asset_get_type("obj_wall")==asset_object)
					and(!place_meeting(x,y+1,obj_wall))
					and(asset_get_type("obj_semisolid_platform")==asset_object)
					and(!place_meeting(x,y+1,obj_semisolid_platform))
					{
						crouch=false;
					}
					image_index=0;
					angle=0;
				}
			}
		}
		else
		if (dive=true)
		{
			if (key_left)
			and(asset_get_type("obj_wall")==asset_object)
			and(place_meeting(x+1,y,obj_wall))
			or(key_right)
			and(asset_get_type("obj_wall")==asset_object)
			and(place_meeting(x-1,y,obj_wall))
			{
				hspeed=0;
			}
			
			#region /*Propel the player forward in the direction the player is facing*/
			if (image_xscale<0)
			{
				if (hspeed>-4)
				{
					if (asset_get_type("obj_wall")==asset_object)
					and(!place_meeting(x-4,y,obj_wall))
					{
						hspeed=-4;
					}
					else
					if (asset_get_type("obj_wall")==asset_object)
					and(!place_meeting(x-1,y,obj_wall))
					{
						hspeed=-1;
					}
				}
			}
			else
			if (image_xscale>0)
			{
				if (hspeed<+4)
				{
					if (asset_get_type("obj_wall")==asset_object)
					and(!place_meeting(x+4,y,obj_wall))
					{
						hspeed=+4;
					}
					else
					if (asset_get_type("obj_wall")==asset_object)
					and(!place_meeting(x+1,y,obj_wall))
					{
						hspeed=+1;
					}
				}
			}
			#endregion /*Propel the player forward in the direction the player is facing END*/
			
			#region /*If player lands on ground when diving, stop diving*/
			if (asset_get_type("obj_wall")==asset_object)
			and(place_meeting(x,y+1,obj_wall))
			and(vspeed>=0)
			or(asset_get_type("obj_semisolid_platform")==asset_object)
			and(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
			and(vspeed>=0)
			or(asset_get_type("obj_semisolid_platform")==asset_object)
			and(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
			and(vspeed>=0)
			or(asset_get_type("obj_semisolid_platform")==asset_object)
			and(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
			and(vspeed>=0)
			{
				dive = false;
				dive_on_ground = 10;
				can_tongue_after_dive_on_ground = can_tongue_after_dive_on_ground_max_value;
				ground_pound = false;
				can_ground_pound = false;
			}
			#endregion /*If player lands on ground when diving, stop diving END*/

			#region /*If player lands in water when diving, stop diving*/
			if (in_water=true)
			{
				dive = false;
				can_dive = true;
				crouch = false;
			}
			#endregion /*If player lands in water when diving, stop diving END*/
			
			#region /*Cancel dive (only when you have enabled dive canceling in settings)*/
			if (cancel_dive_by_pressing_jump_or_dive_button = true)
			{
				if (key_jump)
				or (key_dive_pressed)
				{
					dive = false;
					can_dive = false;
				}
			}
			if (cancel_dive_by_pressing_opposite_direction = true)
			{
				if (hspeed < 0)
				and (key_right)
				or (hspeed > 0)
				and (key_left)
				{
					dive = false;
					can_dive = false;
				}
			}
			#endregion /*Cancel dive (only when you have enabled dive canceling in settings) END*/
			
		}
	}
}
#endregion /*Dive END*/

#region /*Can Attack After Dive On Ground*/
if (can_tongue_after_dive_on_ground>0)
and(asset_get_type("obj_wall")==asset_object)
and(place_meeting(x,y+1,obj_wall))
or (can_tongue_after_dive_on_ground>0)
and(asset_get_type("obj_semisolid_platform")==asset_object)
and(place_meeting(x,y+1,obj_semisolid_platform))
{
	can_tongue_after_dive_on_ground -= 1;
	if (key_jump)
	{
		can_tongue_after_dive_on_ground = false;
	}
}
#endregion /*Can Attack After Dive On Ground END*/

#region /*Dive ground boost*/
if (allow_dive_ground_boost=true)
and(dive_on_ground>0)
and(asset_get_type("obj_wall")==asset_object)
and(place_meeting(x,y+1,obj_wall))
or(allow_dive_ground_boost=true)
and(dive_on_ground>0)
and(asset_get_type("obj_semisolid_platform")==asset_object)
and(place_meeting(x,y+1,obj_semisolid_platform))
{
	dive_on_ground -= 1;
	if (key_jump)
	{
		dive_on_ground=false;
		effect_create_above(ef_smoke,x,bbox_bottom,1,c_white);
		if (speed_max<10)
		{
			speed_max=10;
		}
		if (image_xscale<0)
		{
			if (hspeed<-7)
			{
				if (hspeed>-10)
				{
					if (!place_meeting(x-1,y,obj_wall))
					or(!place_meeting(x-1,y,obj_semisolid_platform))
					{
						hspeed=-10;
					}
				}
				angle=-320;
			}
		}
		else
		if (image_xscale>0)
		{
			if (hspeed>+7)
			{
				if (hspeed<+10)
				{
					if (!place_meeting(x+1,y,obj_wall))
					or(!place_meeting(x+1,y,obj_semisolid_platform))
					{
						hspeed=+10;
					}
				}
				angle=+320;
			}
		}
	}
}
#endregion /*Dive ground boost END*/

#region /*Ledge Grab*/
if (allow_ledge_grab=true)
{
	if (in_water=true)
	or(x<camera_get_view_x(view_camera[view_current])+25)
	or(x>camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-25)
	{
		can_ledge_grab=false;
	}
	else
	{
		can_ledge_grab=true;
	}
	if (can_ledge_grab=true)
	{
		if (hspeed!=0)
		{
			hspeed_dir=sign(hspeed);
		}
		if (ground_pound<1)
		and(burnt<1)
		{
			if (!position_meeting(x+37*hspeed_dir,bbox_top-16,obj_wall))
			and(position_meeting(x+37*hspeed_dir,bbox_top+8,obj_wall))
			and(yprevious-16<y)
			and(vspeed>0)
			and(!place_meeting(x,y+sprite_height/3,obj_wall))
			and(!key_down)
			{
				if (asset_get_type("snd_grabledge")==asset_sound)
				{
					audio_play_sound(snd_grabledge,0,0);
					audio_sound_gain(snd_grabledge,global.sfx_volume,0);
				}
				gravity=0;
				hspeed=0;
				vspeed =0;
				
				#region /*Move against the ledge*/
				while(!place_meeting(x+hspeed_dir,y,obj_wall))
				{
					x+=hspeed_dir;
				}
				#endregion /*Move against the ledge*/
				
				#region /*Make sure we are the right height*/
				while(position_meeting(x+(17*hspeed_dir),y-5,obj_wall))
				{
					y-=1;
				}
				#endregion /*Make sure we are the right height END*/
				
				ledge_grab_jump=false;
				ledge_grab+=1;
				stick_to_wall=false;
				wall_jump = 0;
				jump=0;
			}
		}
		if (ledge_grab>0)
		{
			ledge_grab+=1;
		}
		if (ledge_grab>false)
		{
			gravity=0;
			hspeed=0;
			if (place_meeting(x-1,y,obj_wall))
			{
				image_xscale=-1;
			}
			else
			if (place_meeting(x+1,y,obj_wall))
			{
				image_xscale=+1;
			}
			vspeed =0;
			if (asset_get_type("spr_player_ledge_grab")==asset_sprite)
			{
				sprite_index=spr_player_ledge_grab;
			}
			else
			if (asset_get_type("spr_player_wall_slide")==asset_sprite)
			{
				sprite_index=spr_player_wall_slide;
			}
			if (key_left)
			and(image_xscale=-1)
			or(key_right)
			and(image_xscale=+1)
			{
				if (ledge_grab>10)
				{
					if (image_xscale>0)
					{
						angle=+360;
					}
					else
					{
						angle=-360;
					}
					if (asset_get_type("snd_pullup")==asset_sound)
					{
						audio_play_sound(snd_pullup,0,0);
						audio_sound_gain(snd_pullup,global.sfx_volume,0);
					}
					vspeed = -8;
					ledge_grab=false;
					ledge_grab_jump=true;
					stick_to_wall=false;
					wall_jump = 0;
				}
			}
			else
			if (key_jump)
			or(key_up)
			{
				if (image_xscale>0)
				{
					angle=+360;
				}
				else
				{
					angle=-360;
				}
				if (asset_get_type("snd_pullupfast")==asset_sound)
				{
					audio_play_sound(snd_pullupfast,0,0);
					audio_sound_gain(snd_pullupfast,global.sfx_volume,0);
				}
				vspeed = -normal_jump_height;
				ledge_grab=false;
				ledge_grab_jump=true;
				stick_to_wall=false;
				wall_jump = 0;
			}
			if (key_left)
			and(image_xscale=+1)
			or(key_right)
			and(image_xscale=-1)
			or(key_down)
			{
				if (ledge_grab>10)
				{
					hspeed=+0.1*-hspeed_dir;
					ledge_grab=false;
					ledge_grab_jump=true;
					stick_to_wall=false;
					wall_jump = 0;
				}
			}
		}
		if (place_meeting(x,y+1,obj_wall))
		{
			ledge_grab_jump=false;
		}
	}
}
#endregion /*Ledge Grab END*/

#region /*ledge_grab_jump / Get up over ledge*/
if (ledge_grab_jump=true)
and(stick_to_wall=false)
{
	if (image_xscale=-1)
	and(!place_meeting(x,y-4,obj_wall))
	{
		hspeed-=0.1;
	}
	else
	if (image_xscale=+1)
	and(!place_meeting(x,y+4,obj_wall))
	{
		hspeed+=0.1;
	}
	if (place_meeting(x,y+1,obj_wall))
	and(vspeed>=0)
	{
		ledge_grab_jump=false;
	}
}
#endregion /*ledge_grab_jump / Get up over ledge END*/

#region /*Put sprite angle at right angle*/
if (angle<-360)
{
	angle+=16;
}
else
if (angle>+360)
{
	angle-=16;
}
else
if (ground_pound=true)
{
	angle=lerp(angle,0,0.2);
}
else
{
	if (!place_meeting(x,y+1,obj_wall))
	and(vspeed>0)
	{
		if (key_left)
		and(!key_right)
		{
			angle=lerp(angle,0+10,0.1);
		}
		else
		if (key_right)
		and(!key_left)
		{
			angle=lerp(angle,0-10,0.1);
		}
		else
		{
			angle=lerp(angle,0,0.1);
		}
	}
	else
	{
		angle=lerp(angle,0,0.1);
	}
}
#endregion /*Put sprite angle at right angle*/

#region /*In Water*/
if (asset_get_type("obj_water")==asset_object)
{
	if (position_meeting(x,y,obj_water))
	or (asset_get_type("obj_water_level")==asset_object)
	and (instance_exists(obj_water_level))
	and (y > obj_water_level.y)
	{
		dive = false;
		in_water = true;
		jump = 0;
		midair_jumps_left = number_of_jumps;
		speed_max = 4;
		allow_roll = false;
		can_ground_pound = false;
		ground_pound = false;
		can_wall_jump = false;
		stick_to_wall = false;
		can_dive = true; /*Can dive when you jump out of water still*/
		wall_jump = false;
		spring = false;
		
		if (key_up)
		or(key_jump_hold)
		and(!key_down)
		{
			if (vspeed>1)
			{
				vspeed =1;
			}
		}
		else
		if (key_down)
		{
			if (vspeed>5)
			{
				vspeed =5;
			}
		}
		else
		{
			if (vspeed>2)
			{
				vspeed =2;
			}
		}
		
		#region /*Set the gravity underwater*/
		gravity_direction=270; /*Direction of the gravity*/
		if (!place_meeting(x,y+1,obj_wall))
		{
			gravity=0.1; /*Set gravity*/
		}
		else
		{
			gravity=0;
		}
		#endregion /*Set the gravity underwater END*/

		if (key_jump)
		{
			
			#region /*Swim up*/
			{
				if (key_up)
				{
					vspeed = -6;
				}
				else
				if (key_down)
				{
					vspeed = -2;
				}
				else
				{
					vspeed = -4;
				}
				if (asset_get_type("snd_swim")==asset_sound)
				{
					audio_play_sound(snd_swim,0,0);
					audio_sound_gain(snd_swim,global.sfx_volume,0);
				}
				if (asset_get_type("obj_bubble")==asset_object)
				{
					obj=instance_create_depth(x,y,0,obj_bubble);
					with(obj)
					{
						direction=random(360);
						speed=random(2);
					}
				}
			}
			#endregion /*Swim up END*/
			
		}
		if (asset_get_type("obj_bubble")==asset_object)
		{
			if (floor(random(30-1))=0)
			{
				obj=instance_create_depth(x,y,0,obj_bubble);
				with(obj)
				{
					direction=random(360);
					speed=random(2);
				}
			}
		}
		if (place_meeting(x,y+1,obj_wall))
		{
			if (hspeed<-2)
			{
				hspeed=-2;
			}
			if (hspeed>+2)
			{
				hspeed=+2;
			}
		}
		
		#region /*Slow down if not pressing anything*/
		if (!key_left)
		{
			if (hspeed<0)
			{
				hspeed+=0.1;
			}
		}
		if (!key_right)
		{
			if (hspeed>0)
			{
				hspeed-=0.1;
			}
		}
		#endregion /*Slow down if not pressing anything END*/
		
	}
	else
	{
		in_water = false;
		allow_roll = false;
		can_ground_pound = true;
		can_wall_jump = true;
	}
}
#endregion /*In Water END*/

#region /*Drowning*/
if (allow_drowning = true)
{
	
	if (millisecond_until_drowning > (seconds_until_drowning*60))
	{
		millisecond_until_drowning = (seconds_until_drowning*60)
	}
	if (millisecond_until_drowning < 0)
	{
		millisecond_until_drowning = 0;
	}
	
	if (in_water = true)
	{
		millisecond_until_drowning -=1;
		if (millisecond_until_drowning < 0)
		{
			millisecond_until_drowning = 0;
			hp -= 2;
		}
	}
	else
	{
		millisecond_until_drowning +=12; /*12 frames = 0.2 seconds*/
	}
}
#endregion /*Drowning END*/

#region /*Water Splash Effect*/
if (in_water != old_in_water)
{
	
	#region /*Jump out of water*/
	if (key_jump_hold)
	and (in_water = false)
	and (vspeed > -normal_jump_height)
	{
		vspeed = -normal_jump_height;
		
		#region /*Jump sound effect*/
		if (asset_get_type("snd_jump")==asset_sound)
		{
			audio_play_sound(snd_jump,0,0);
			audio_sound_gain(snd_jump,global.sfx_volume,0);
		}
		if (asset_get_type("snd_swim")==asset_sound)
		{
			audio_play_sound(snd_swim,0,0);
			audio_sound_gain(snd_swim,global.sfx_volume,0);
		}
		#endregion /*Jump sound effect END*/
		
	}
	#endregion /*Jump out of water END*/
	
	old_in_water = in_water;
	
	if (asset_get_type("obj_water")==asset_object)
	and(asset_get_type("obj_water_splash")==asset_object)
	{
		instance_create_depth(x,instance_nearest(x,y,obj_water).bbox_top,0,obj_water_splash);
		if (asset_get_type("obj_water_splash_particle")==asset_object)
		{
			repeat(10)
			{
				obj=instance_create_depth(x,bbox_top,0,obj_water_splash_particle);
				with(obj)
				{
					direction=random_range(0,180);
					speed=random_range(2,10);
				}
			}
		}
	}
}
#endregion /*Water Splash Effect END*/

#region /*Speedup to Dashspeed*/
if (abs(hspeed)>7)
and(invincible>0)
and(power_meter_running_sound=true)
{
	speedunit+=2;
	if (speedunit>100)
	{
		speedunit=100;
		if (asset_get_type("snd_power_meter_running")==asset_sound)
		{
			if (!audio_is_playing(snd_power_meter_running))
			{
				audio_stop_sound(voice);
				voice=audio_play_sound(snd_power_meter_running,0,0);
				audio_sound_gain(snd_power_meter_running,global.sfx_volume,0);
			}
		}
		if (place_meeting(x,y+1,obj_wall))
		{
			speeddash=true;
		}
	}
}
else
{
	speedunit-=1;
	if (speedunit<0)
	{
		speedunit=0;
	}
	speeddash=false;
}
#endregion /*Speedup to Dashspeed END*/

#region /*Interaction with other players*/
if (asset_get_type("obj_player")==asset_object)
and(in_water=false)
{
			
	#region /*Jump on other players heads*/
	if (position_meeting(x,bbox_bottom+1,obj_player))
	and(!place_meeting(x,y-1,obj_wall))
	and(vspeed>0)
	and(ground_pound=false)
	and(stick_to_wall=false)
	{
		ground_pound=false;
		dive=false;
		midair_jumps_left=number_of_jumps;
		draw_xscale=0.75;
		draw_yscale=1.5;
		if (key_jump_hold)
		{
			vspeed = -higher_jump_height;
		}
		else
		{
			vspeed = -8;
		}
		with(instance_nearest(x,bbox_bottom,obj_player))
		{
			draw_xscale=1.5;
			draw_yscale=0.75;
		}
	}
	#endregion /*Jump on other players heads END*/
	
}
#endregion /*Interaction with other players END*/

#region /*Health Handeling*/
if (takendamage>0)
{
	takendamage-=0.5;
}

#region /*Make the player die if you have 0 HP*/
if (hp<=0)
{
	die=true;
	invincibility=false;
}
#endregion /*Make the player die if you have 0 HP END*/

#region /*Don't gain more HP than your max HP*/
if (hp>max_hp)
{
	if (allow_overflow_hp=true)
	{
		overflow_hp+=1;
		if (overflow_hp>=max_overflow_hp)
		{
			max_hp+=1;
			overflow_hp=0;
		}
	}
	hp=max_hp;
}
#endregion /*Don't gain more HP than your max HP END*/

#endregion /*Health Handeling END*/

#region /*Burnt*/
if (asset_get_type("obj_lava")==asset_object)
{
	if (place_meeting(x,y,obj_lava))
	{
		if (allow_survive_lava=true)
		and(hp>0)
		{
			burnt=true;
			dive=false;
			ground_pound=false;
			stick_to_wall=false;
			crouch=false;
			speed_max=8;
			takendamage=100;
			if (invincible<1)
			{
				audio_stop_sound(voice);
				voice=audio_play_sound(voice_burned,0,0);
				audio_sound_gain(voice_burned,global.voices_volume,0);
				audio_sound_pitch(voice_burned, default_voice_pitch);
				hp-=1;
			}
			if (invincible>0)
			{
				audio_stop_sound(voice);
				voice=audio_play_sound(voice_burned,0,0);
				audio_sound_gain(voice_burned,global.voices_volume,0);
				audio_sound_pitch(voice_burned, default_voice_pitch);
			}
			if (vspeed>0)
			{
				vspeed = -15;
			}
		}
		else
		{
			die=true;
		}
	}
}
if (burnt=true)
{
	effect_create_above(ef_smoke,x,bbox_bottom,0,c_black);
	if (place_meeting(x,y+1,obj_wall))
	{
		audio_play_sound(voice_burned_running,0,0);
		audio_sound_gain(voice_burned_running,global.voices_volume,0);
		audio_sound_pitch(voice_burned_running, default_voice_pitch);
		burnt=2;
		dive=false;
		ground_pound=false;
		crouch=false;
		speed_max=8;
		vspeed = -7.5;
	}
}
else
if (burnt=2)
{
	effect_create_above(ef_smoke,x,bbox_bottom,0,c_black);
	if (place_meeting(x,y+1,obj_wall))
	{
		burnt=false;
	}
}
#endregion /*Burnt END*/

#region /*Die*/
if (die=true)
{
	
	#region /*Update Checkpoint Time*/
	global.checkpoint_millisecond=global.timeattack_millisecond;
	global.checkpoint_second=global.timeattack_second;
	global.checkpoint_minute=global.timeattack_minute;
	global.checkpoint_realmillisecond=global.timeattack_realmillisecond;
	#endregion /*Update Checkpoint Time END*/
	
	#region /*Update Level Editor Checkpoint Time*/
	if (asset_get_type("room_leveleditor")==asset_room)
	and(room=room_leveleditor)
	and(global.actually_play_edited_level=true)
	{
		
		#region /*Create directory for saving custom levels*/
		if (!directory_exists(working_directory+"/Custom Levels"))
		{
			directory_create(working_directory+"/Custom Levels");
		}
		#endregion /*Create directory for saving custom levels END*/
		
		ini_open(working_directory+"/Custom Levels/custom_level_save.ini");
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_millisecond",global.timeattack_millisecond);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_second",global.timeattack_second);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_minute",global.timeattack_minute);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_realmillisecond",global.timeattack_realmillisecond);
		ini_close();
	}
	#endregion /*Update Level Editor Checkpoint Time END*/
	
	if (asset_get_type("obj_player")==asset_object)
	and(global.pause=false)
	{
		if (instance_number(obj_player)<=1)
		{
			audio_stop_sound(global.music);
			audio_stop_sound(global.music_underwater);
			music=noone;
			music_underwater=noone;
			if (asset_get_type("snd_music_invincible")==asset_sound)
			{
				audio_stop_sound(snd_music_invincible);
			}
			if (asset_get_type("snd_skidding")==asset_sound)
			{
				audio_stop_sound(snd_skidding);
			}
			if (asset_get_type("snd_skidding_ice")==asset_sound)
			{
				audio_stop_sound(snd_skidding_ice);
			}
			if (asset_get_type("snd_skiddingvertical")==asset_sound)
			{
				audio_stop_sound(snd_skiddingvertical);
			}
		}
		speed=0;
		takendamage=0;
		invinvible=false;
		if (asset_get_type("snd_die")==asset_sound)
		{
			audio_play_sound(snd_die,0,0);
			audio_sound_gain(snd_die,global.sfx_volume,0);
		}
		if (asset_get_type("obj_player_die")==asset_object)
		{
			
			#region /*Player 1 Die*/
			if (player=1)
			{
				obj=instance_create_depth(x,y,0,obj_player_die);
				with(obj)
				{
					player=1;
					if (instance_nearest(x,y,obj_player).sprite_die>noone){sprite_index=instance_nearest(x,y,obj_player).sprite_die;}else
					{sprite_index=instance_nearest(x,y,obj_player).sprite_stand;}
					voice_damage=instance_nearest(x,y,obj_player).voice_damage;
					default_voice_pitch=instance_nearest(x,y,obj_player).default_voice_pitch;
					default_xscale=instance_nearest(x,y,obj_player).default_xscale;
					default_yscale=instance_nearest(x,y,obj_player).default_yscale;
				}
			}
			#endregion /*Player 1 Die END*/
			
			else
			
			#region /*Player 2 Die*/
			if (player=2)
			{
				obj=instance_create_depth(x,y,0,obj_player_die);
				with(obj)
				{
					player=2;
					if (instance_nearest(x,y,obj_player).sprite_die>noone){sprite_index=instance_nearest(x,y,obj_player).sprite_die;}else
					{sprite_index=instance_nearest(x,y,obj_player).sprite_stand;}
					voice_damage=instance_nearest(x,y,obj_player).voice_damage;
					default_voice_pitch=instance_nearest(x,y,obj_player).default_voice_pitch;
					default_xscale=instance_nearest(x,y,obj_player).default_xscale;
					default_yscale=instance_nearest(x,y,obj_player).default_yscale;
				}
			}
			#endregion /*Player 2 Die END*/
			
			else
			
			#region /*Player 3 Die*/
			if (player=3)
			{
				obj=instance_create_depth(x,y,0,obj_player_die);
				with(obj)
				{
					player=3;
					if (instance_nearest(x,y,obj_player).sprite_die>noone){sprite_index=instance_nearest(x,y,obj_player).sprite_die;}else
					{sprite_index=instance_nearest(x,y,obj_player).sprite_stand;}
					voice_damage=instance_nearest(x,y,obj_player).voice_damage;
					default_voice_pitch=instance_nearest(x,y,obj_player).default_voice_pitch;
					default_xscale=instance_nearest(x,y,obj_player).default_xscale;
					default_yscale=instance_nearest(x,y,obj_player).default_yscale;
				}
			}
			#endregion /*Player 3 Die END*/
			
			else
			
			#region /*Player 4 Die*/
			if (player=4)
			{
				obj=instance_create_depth(x,y,0,obj_player_die);
				with(obj)
				{
					player=4;
					if (instance_nearest(x,y,obj_player).sprite_die>noone){sprite_index=instance_nearest(x,y,obj_player).sprite_die;}else
					{sprite_index=instance_nearest(x,y,obj_player).sprite_stand;}
					voice_damage=instance_nearest(x,y,obj_player).voice_damage;
					default_voice_pitch=instance_nearest(x,y,obj_player).default_voice_pitch;
					default_xscale=instance_nearest(x,y,obj_player).default_xscale;
					default_yscale=instance_nearest(x,y,obj_player).default_yscale;
				}
			}
			#endregion /*Player 4 Die END*/
			
		}
		else
		
		#region /*Restart Game*/
		{
			game_restart();
		}
		#endregion /*Restart Game END*/
		
		instance_destroy();
	}
}
#endregion /*Die END*/

#region /*If you touch spikes, take damage*/
if (asset_get_type("obj_spikes")==asset_object)
and(instance_exists(obj_spikes))
{
	if (place_meeting(x-1,y,obj_spikes))
	or(place_meeting(x+1,y,obj_spikes))
	or(place_meeting(x,y-1,obj_spikes))
	or(place_meeting(x,y+1,obj_spikes))
	{
		if (takendamage<1)
		and(assist_invincible=false)
		and(invincible<=false)
		{
			if (have_heart_balloon=true)
			{
				have_heart_balloon=false;
			}
			else
			{
				hp-=1;
			}
			takendamage=100;
		}
	}
}
#endregion /*If you touch spikes, take damage END*/

#region /*Invincibility*/
if (asset_get_type("obj_invincibility_powerup")==asset_object)
{
	if (place_meeting(x,y,obj_invincibility_powerup))
	and(instance_nearest(x,y,obj_invincibility_powerup).bounceup = false)
	{
		chain_reaction=0;
		invincible=room_speed*20;
		audio_sound_gain(global.music,0,100);
		audio_sound_gain(global.music_underwater,0,100);
		if (asset_get_type("snd_music_invincible")==asset_sound)
		{
			if (!audio_is_playing(snd_music_invincible))
			{
				audio_play_sound(snd_music_invincible,0,0);
				audio_sound_gain(snd_music_invincible,global.music_volume,0);
			}
		}
		audio_stop_sound(voice);
		voice=audio_play_sound(voice_get_star,0,0);
		audio_sound_gain(voice_get_star,global.voices_volume,0);
		audio_sound_pitch(voice_get_star, default_voice_pitch);
		score+=1000;
		global.hud_show_score=true;
		if (asset_get_type("obj_camera")==asset_object)
		and(instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer=global.hud_hide_time;
			}
		}
		if (asset_get_type("obj_scoreup")==asset_object)
		{
			obj=instance_create_depth(x,y,0,obj_scoreup);
			with(obj)
			{
				scoreup=1000;
			}
		}
		with(instance_nearest(x,y,obj_invincibility_powerup))
		{
			instance_destroy();
		}
	}
}
#endregion /*Invincibility END*/

#region /*Time*/
if (goal=false)
{
	if (global.time_countdown = 0)
	and(allow_timeup = true)
	and(global.player_has_entered_goal = false)
	{
		die = true;
	}
	if (global.time_countdown = 99)
	{
		if (asset_get_type("snd_hurry_up")==asset_sound)
		{
			if (!audio_is_playing(snd_hurry_up))
			{
				audio_play_sound(snd_hurry_up,0,0);
				audio_sound_gain(snd_hurry_up,global.sfx_volume,0);
			}
			if (audio_is_playing(snd_hurry_up))
			{
				audio_stop_sound(global.music);
				audio_stop_sound(global.music_underwater);
			}
		}
	}
}
else
{
	if (global.time_countdown_bonus>0)
	{
		global.hud_show_score=true;
		if (asset_get_type("obj_camera")==asset_object)
		and(instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer=global.hud_hide_time;
			}
		}
		if (global.time_countdown_bonus>3)
		{
			global.time_countdown_bonus-=3;
			score+=150;
		}
		else
		{
			global.time_countdown_bonus-=1;
			score+=50;
		}
		if (asset_get_type("snd_beep")==asset_sound)
		{
			if (!audio_is_playing(snd_beep))
			{
				audio_play_sound(snd_beep,0,true);
				audio_sound_gain(snd_beep,global.sfx_volume,0);
			}
		}
	}
	if (global.time_countdown_bonus = 0)
	{
		if (asset_get_type("snd_beep")==asset_sound)
		{
			if (audio_is_playing(snd_beep))
			{
				audio_stop_sound(snd_beep);
			}
		}
	}
	if (asset_get_type("obj_enemy")==asset_object)
	{
		with(obj_enemy)
		{
			instance_destroy();
		}
	}
}
#endregion /*Time End*/

#region /*Goal*/
if (asset_get_type("obj_goal")==asset_object)
and(instance_exists(obj_goal))
{
	if (distance_to_object(obj_goal) < 1920)
	{
		if (x > instance_nearest(x,y,obj_goal).bbox_right)
		and (x < instance_nearest(x,y,obj_goal).bbox_right+16)
		and (y < instance_nearest(x,y,obj_goal).bbox_bottom)
		and (goal = false)
		{
			if (!collision_line(x,y,instance_nearest(x,y,obj_goal).x,instance_nearest(x,y,obj_goal).y,obj_wall,false,true))
			{
				goal = true;
			}
		}
		else
		if (x<instance_nearest(x,y,obj_goal).bbox_left+4)
		and (goal=true)
		{
			x=instance_nearest(x,y,obj_goal).bbox_left+4;
		}
		if (place_meeting(x,y,obj_goal))
		and (instance_exists(obj_goal))
		and (goal=false)
		{
			audio_stop_sound(global.music);
			audio_stop_sound(global.music_underwater);
			global.music=noone;
			global.music_underwater=noone;
			audio_stop_sound(voice);
			voice=audio_play_sound(voice_enter_goal,0,0);
			audio_sound_gain(voice_enter_goal,global.voices_volume,0);
			audio_sound_pitch(voice_enter_goal, default_voice_pitch);
			goal=true;
			global.goal_active=true;
			if (invincible>100)
			{
				invincible=100;
			}
			audio_stop_sound(global.music);
			audio_stop_sound(global.music_underwater);
			music=noone;
			music_underwater=noone;
			
			#region /*Level Clear Melody*/
			if (level_clear_melody>noone)
			{
				if (!audio_is_playing(level_clear_melody))
				{
					audio_play_sound(level_clear_melody,0,0);
					audio_sound_gain(level_clear_melody,global.music_volume,0);
				}
			}
			else
			if (asset_get_type("snd_level_clear")==asset_sound)
			and(!audio_is_playing(snd_level_clear))
			{
				audio_play_sound(snd_level_clear,0,0);
				audio_sound_gain(snd_level_clear,global.music_volume,0);
			}
			#endregion /*Level Clear Melody END*/
		
		}
	}
}
if (goal=true)
and(global.time_countdown_bonus<=0)
{
	allow_ground_pound=false;
	ground_pound=false;
	allow_dive=false;
	dive=false;
}
#endregion /*Goal End*/

#region /*Homing Attack*/
if (allow_homing_tongue=true)
{
	
	#region /*Homing Enemy*/
	if (!place_meeting(x,y+1,obj_wall))
	and(stick_to_wall=false)
	and(climb=false)
	and(horizontal_rope_climb=false)
	and(key_jump)
	and(asset_get_type("obj_enemy")==asset_object)
	and(instance_exists(obj_enemy))
	and(!collision_line(x,y,instance_nearest(x,y,obj_enemy).x,instance_nearest(x,y,obj_enemy).y,obj_wall,false,true))
	and(distance_to_object(obj_enemy)<hoverstomp_distance)
	and(instance_nearest(x,y,obj_enemy).bbox_bottom>y)
	and(instance_nearest(x,y,obj_enemy).die=false)
	{
		x=instance_nearest(x,y,obj_enemy).x;
		y=instance_nearest(x,y,obj_enemy).bbox_top+y-bbox_bottom+19;
		vspeed = -triple_jump_height;
		stomp_spin=true;
		dive=false;
		ground_pound=false;
		if (speed_max<=4)
		{
			speed_max=4;
		}
	}
	#endregion /*Homing Enemy END*/
	
	else
	
	#region /*Homing Spring*/
	if (!place_meeting(x,y+1,obj_wall))
	and(stick_to_wall=false)
	and(climb=false)
	and(horizontal_rope_climb=false)
	and(key_jump)
	and(asset_get_type("obj_spring")==asset_object)
	and(instance_exists(obj_spring))
	and(!collision_line(x,y,instance_nearest(x,y,obj_spring).x,instance_nearest(x,y,obj_spring).y,obj_wall,false,true))
	and(distance_to_object(obj_spring)<hoverstomp_distance)
	and(instance_nearest(x,y,obj_spring).bbox_bottom>y)
	and(instance_nearest(x,y,obj_spring).can_bounce=0)
	{
		x=instance_nearest(x,y,obj_spring).x;
		y=instance_nearest(x,y,obj_spring).y;
		spring=true;
		spring_animation=0;
		dive=false;
		ground_pound=false;
		instance_nearest(x,y,obj_spring).can_bounce=10;
		if (speed_max<=4)
		{
			speed_max=4;
		}
	}
	#endregion /*Homing Spring END*/
	
}
#endregion /*Homing Attack End*/

if (vspeed>0)
{
	stomp_spin=false;
}

#region /*Spring*/
if (asset_get_type("obj_spring")==asset_object)
and(instance_exists(obj_spring))
and(place_meeting(x,y,obj_spring))
and(instance_nearest(x,y,obj_spring).can_bounce=0)
{
	
	#region /*Play jumping on spring voice clip*/
	audio_stop_sound(voice);
	voice=audio_play_sound(voice_jump_spring,0,0);
	audio_sound_gain(voice_jump_spring,global.voices_volume,0);
	audio_sound_pitch(voice_jump_spring, default_voice_pitch);
	#endregion /*Play jumping on spring voice clip END*/
	
	if (ground_pound = true)
	{
		effect_create_above(ef_smoke,x,bbox_bottom,2,c_white);
		image_index = 0;
		ground_pound = false;
		speed_max = 4;
		if (asset_get_type("obj_camera")==asset_object)
		{
			with(instance_nearest(x,y,obj_camera))
			{
				shake = 10;
			}
		}
		if (asset_get_type("snd_hipattack")==asset_sound)
		{
			audio_play_sound(snd_hipattack,0,0);
			audio_sound_gain(snd_hipattack,global.sfx_volume,0);
		}
		
	}
	
	spring_animation=0;
	move_towards_point(
	instance_nearest(x,y,obj_spring).angle_x,
	instance_nearest(x,y,obj_spring).angle_y,
	instance_nearest(x,y,obj_spring).bounce_height);
	if (hspeed<0)
	{
		image_xscale=-1;
	}
	else
	if (hspeed>0)
	{
		image_xscale=+1;
	}
	can_climb_horizontal_rope_cooldown = 10;
	midair_jumps_left=number_of_jumps;
	can_ground_pound = false;
	chain_reaction=0;
	dive=false;
	draw_xscale=0.5;
	draw_yscale=1.5;
	horizontal_rope_climb=false;
	ledge_grab_jump=false;
	speed_max=4;
	spring=true;
	move_towards_spring_endpoint = true;
	spring_endpoint_x = instance_nearest(x,y,obj_spring).angle_x;
	spring_endpoint_y = instance_nearest(x,y,obj_spring).angle_y;
	stick_to_wall=false;
	instance_nearest(x,y,obj_spring).can_bounce = 10;
	instance_nearest(x,y,obj_spring).image_index=1;
	instance_nearest(x,y,obj_spring).image_speed=1;
}

if (move_towards_spring_endpoint = true)
{
	move_towards_point(spring_endpoint_x, spring_endpoint_y, 20);
	
	if (asset_get_type("obj_spring")==asset_object)
	and(instance_exists(obj_spring))
	and (point_distance(
	spring_endpoint_x,
	spring_endpoint_y,
	instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).x,
	instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).y)<32)
	{
		move_towards_spring_endpoint = true;
	}
	else
	if (distance_to_point(spring_endpoint_x, spring_endpoint_y)<340)
	{
		move_towards_spring_endpoint = false;
		spring_endpoint_x = 0;
		spring_endpoint_y = 0;
	}
	if (asset_get_type("obj_wall")==asset_object)
	and(instance_exists(obj_wall))
	{
		if (place_meeting(x-4, y, obj_wall))
		and (hspeed<0)
		or (place_meeting(x+4, y, obj_wall))
		and (hspeed>0)
		or (place_meeting(x, y-4, obj_wall))
		and (vspeed<0)
		or (place_meeting(x, y+4, obj_wall))
		and (vspeed>0)
		{
			move_towards_spring_endpoint = false;
			spring_endpoint_x = 0;
			spring_endpoint_y = 0;
		}
	}
}

if (spring = true)
{
	if (spring_animation = 0)
	{
		if (image_index > image_number-1)
		{
			image_index=0;
			if(vspeed>=-4)
			if(vspeed>=0)
			{
				if (sprite_spring_transition>noone)
				{
					spring_animation = 1;
				}
				else
				{
					spring_animation = 2;
				}
			}
		}
		
		if (sprite_spring_up>noone){sprite_index = sprite_spring_up;}else
		if (sprite_spring_down>noone){sprite_index = sprite_spring_down;}else
		if (sprite_jump>noone){sprite_index = sprite_jump;}else
		{sprite_index = sprite_stand;}
	}
	else
	if (spring_animation = 1)
	{
		if (image_index > image_number-1)
		{
			image_index=0;
			spring_animation = 2;
		}
		
		if (sprite_spring_transition>noone){sprite_index = sprite_spring_transition;}else
		{spring_animation = 2;}
	}
	else
	if (spring_animation = 2)
	{
		if (sprite_spring_down>noone){sprite_index = sprite_spring_down;}else
		if (sprite_spring_up>noone){sprite_index = sprite_spring_up;}else
		if (key_jump_hold)and(sprite_fall_slower>noone){sprite_index = sprite_fall_slower;}else
		if (sprite_fall>noone){sprite_index = sprite_fall;}else
		if (sprite_double_jump>noone){sprite_index = sprite_double_jump;}else
		if (sprite_jump>noone){sprite_index = sprite_jump;}else
		{sprite_index = sprite_stand;}
	}
	
	image_speed=0.5;
}
#endregion /*Spring END*/

#endregion /*________________________________MORE MOVES________________________________*/

///Platformer Player Part 2
#region /*________________________________Handling the sprites and sounds in the step event________________________________*/
draw_xscale = lerp(draw_xscale, 1, 0.2); /*Make horizontal stretching slowly reset back to 1*/
draw_yscale = lerp(draw_yscale, 1, 0.2); /*Make vertical stretching slowly reset back to 1*/

#region /*A bump sound effect if a player walks into a wall to let them know that they they hit a wall*/

#region /*Left*/
if (key_left)
and(!key_right)
and(place_meeting(bbox_left-1,y,obj_wall))
and(place_meeting(x,y+1,obj_wall))
and(climb=false)
and(stick_to_wall=false)
{
	if (asset_get_type("snd_bump")==asset_sound)
	{
		if (!audio_is_playing(snd_bump))
		{
			audio_play_sound(snd_bump,0,0);
			audio_sound_gain(snd_bump,global.sfx_volume,0);
		}
	}
}
#endregion /*Left END*/

#region /*Right*/
if (key_right)
and(!key_left)
and(place_meeting(bbox_right+1,y,obj_wall))
and(place_meeting(x,y+1,obj_wall))
and(climb=false)
and(stick_to_wall=false)
{
	if (asset_get_type("snd_bump")==asset_sound)
	{
		if (!audio_is_playing(snd_bump))
		{
			audio_play_sound(snd_bump,0,0);
			audio_sound_gain(snd_bump,global.sfx_volume,0);
		}
	}
}
#endregion /*Right END*/

#endregion /*A bump sound effect if a player walks into a wall to let them know that they they hit a wall END*/

if (asset_get_type("obj_vine")==asset_object)
and(!place_meeting(x,y,obj_vine))
{
	climb=false;
}
if (asset_get_type("obj_horizontal_rope")==asset_object)
and(!place_meeting(x,y,obj_horizontal_rope))
{
	horizontal_rope_climb=false;
}
if (hp<=0)
and(asset_get_type("spr_player_hit")==asset_sprite)
{
	sprite_index=spr_player_hit;
}
else

#region /*Climb Horizontal Rope*/
if (can_climb_horizontal_rope_cooldown>0)
{
	can_climb_horizontal_rope_cooldown-=1;
}

if (asset_get_type("obj_horizontal_rope")==asset_object)
and(place_meeting(x,y,obj_horizontal_rope))
and(instance_nearest(x,y,obj_horizontal_rope).active=true)
and(!place_meeting(x,y+1,obj_wall))
and(in_water=false)
{
	if (horizontal_rope_climb = false)
	and(can_climb_horizontal_rope_cooldown <= 0)
	{
		midair_jumps_left = number_of_jumps;
		horizontal_rope_climb = true;
		climb = false;
		jump = 0;
		
		#region /*Make a sound effect that you have started cimbing*/
		if (asset_get_type("snd_catch_ivy")==asset_sound)
		{
			audio_play_sound(snd_catch_ivy,0,0);
			audio_sound_gain(snd_catch_ivy,global.sfx_volume,0);
		}
		audio_stop_sound(voice);
		voice=audio_play_sound(voice_rope_catch,0,0);
		audio_sound_gain(voice_rope_catch,global.voices_volume,0);
		audio_sound_pitch(voice_rope_catch, default_voice_pitch);
		#endregion /*Make a sound effect that you have started cimbing END*/
		
	}
	if (horizontal_rope_climb=true)
	{
		angle=0;
		midair_jumps_left=number_of_jumps;
		can_ground_pound = false;
		can_dive = true;
		chain_reaction=0;
		dive=false;
		gravity=0;
		ground_pound=false;
		hspeed=0;
		laststandingx=x;
		laststandingy=y;
		ledge_grab_jump=false;
		speed_max=4;
		spring=false;
		stick_to_wall=false;
		vspeed =0;
		y=instance_nearest(x,y,obj_horizontal_rope).y+16;
		
		if (key_up)
		and(!key_down)
		and(!place_meeting(x,y-16,obj_wall))
		and(!place_meeting(x,y-32,obj_wall))
		and(!place_meeting(x,y-48,obj_wall))
		and(simple_controls=false)
		{
		
		#region /*Start spinning on rope*/
		if (place_meeting(x-1,y,obj_wall))
		{
			x+=1;
		}
		else
		if (place_meeting(x+1,y,obj_wall))
		{
			x-=1;
		}
		if (image_index<=5)
		and(image_speed>0.3)
		{
			if (asset_get_type("obj_blockbreak")==asset_object)
			{
				instance_create_depth(x,y,0,obj_blockbreak);
				instance_create_depth(x,y+32,0,obj_blockbreak);
				instance_create_depth(x,y+64,0,obj_blockbreak);
			}
		}
		else
		if (image_index>=5)
		and(image_speed>0.3)
		{
			if (asset_get_type("obj_blockbreak")==asset_object)
			{
				instance_create_depth(x,y,0,obj_blockbreak);
				instance_create_depth(x,y-32,0,obj_blockbreak);
				instance_create_depth(x,y-64,0,obj_blockbreak);
			}
		}
		if (image_speed<1)
		{
			if (sprite_climb_under_spin>noone){sprite_index = sprite_climb_under_spin;}else
			{sprite_index = sprite_stand;}
		}
		else
		{
			if (sprite_climb_under_spin_fast>noone){sprite_index = sprite_climb_under_spin_fast;}else
			if (sprite_climb_under_spin>noone){sprite_index = sprite_climb_under_spin;}else
			if (sprite_climb_under_still>noone){sprite_index = sprite_climb_under_still;}else
			{sprite_index = sprite_stand;}
		}
		if (image_index>=image_number-1)
		and(image_number>1)
		{
			if (asset_get_type("snd_swing")==asset_sound)
			{
				audio_play_sound(snd_swing,0,0);
				audio_sound_gain(snd_swing,global.sfx_volume,0);
			}
			image_index=0;
		}
		image_speed+=0.02;
		if (image_speed>1)
		{
			image_speed=1;
		}
		#endregion /*Start spinning on rope END*/
		
		#region /*Jump from rope spin*/
		if (key_jump)
		or(up_key_is_jump_key=true)
		and(!key_up)
		{
			if (asset_get_type("snd_jump")==asset_sound)
			{
				audio_play_sound(snd_jump,0,0);
				audio_sound_gain(snd_jump,global.sfx_volume,0);
			}
			midair_jumps_left -= 1;
			y-=64;
			climb=false;
			horizontal_rope_climb=false;
			spring_animation=0;
			spring=true;
			if (image_speed>=1)
			{
				vspeed = -triple_jump_height*1.25;
				audio_stop_sound(voice);
				voice=audio_play_sound(voice_jump_rope,0,0);
				audio_sound_gain(voice_jump_rope,global.voices_volume,0);
				audio_sound_pitch(voice_jump_rope, default_voice_pitch);
			}
			else
			if (image_speed>=0.9)
			{
				vspeed = -triple_jump_height*1.125;
			}
			else
			if (image_speed>=0.7)
			{
				vspeed = -triple_jump_height;
			}
			else
			if (image_speed>=0.4)
			{
				vspeed = -triple_jump_height/1.5;
			}
			else
			{
				vspeed = -triple_jump_height/2;
			}
		}
		#endregion /*Jump from rope spin END*/
		
		}
		else
		
		#region /*Drop down from rope*/
		if (drop_from_rope=0)
		and(!key_jump_hold)
		or(drop_from_rope=1)
		and(key_down)
		or(drop_from_rope=1)
		and(key_jump)
		or(drop_from_rope=2)
		and(key_down)
		or(drop_from_rope=3)
		and(key_jump)
		or(drop_from_rope=4)
		and(key_down)
		and(key_jump)
		{
			if (!key_up)
			{
				can_climb_horizontal_rope_cooldown = 10;
				can_ground_pound = false;
				climb = false;
				horizontal_rope_climb = false;
				stomp_spin = false;
				midair_jumps_left -= 1;
			}
		}
		#endregion /*Drop down from rope END*/
		
		else
		
		#region /*Climb left on horizontal rope*/
		if (key_left)
		and(!key_right)
		and(!place_meeting(bbox_left-1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			image_xscale=-1;
			if(sprite_climb_under>noone){sprite_index = sprite_climb_under;}else
			{sprite_index = sprite_stand;}
			if (key_sprint)
			or(double_tap_left=3)
			{
				x-=5;
				image_speed=0.5;
			}
			else
			{
				x-=3;
				image_speed=0.3;
			}
			if (asset_get_type("snd_move_ivy")==asset_sound)
			and(!audio_is_playing(snd_move_ivy))
			{
				audio_play_sound(snd_move_ivy,0,0);
				audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
			}
		}
		#endregion /*Climb left on horizontal rope END*/
		
		else
		
		#region /*Bump into wall on left side when climbing horizontal rope*/
		if (key_left)
		and(!key_right)
		and(place_meeting(bbox_left-1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			image_xscale=-1;
			if (sprite_climb_under_still>noone){sprite_index = sprite_climb_under_still;}else
			{sprite_index = sprite_stand;}
			image_speed=0;
			if (asset_get_type("snd_bump")==asset_sound)
			and(!audio_is_playing(snd_bump))
			{
				audio_play_sound(snd_bump,0,0);
				audio_sound_gain(snd_bump,global.sfx_volume,0);
			}
		}
		#endregion /*Bump into wall on left side when climbing horizontal rope END*/
		
		else
		
		#region /*Climb right on horizontal rope*/
		if (key_right)
		and(!key_left)
		and(!place_meeting(bbox_right+1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			image_xscale=+1;
			if (sprite_climb_under>noone){sprite_index = sprite_climb_under;}else
			{sprite_index = sprite_stand;}
			if (key_sprint)
			or(double_tap_right=3)
			{
				x+=5;
				image_speed=0.5;
			}
			else
			{
				x+=3;
				image_speed=0.3;
			}
			if (asset_get_type("snd_move_ivy")==asset_sound)
			and(!audio_is_playing(snd_move_ivy))
			{
				audio_play_sound(snd_move_ivy,0,0);
				audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
			}
		}
		#endregion /*Climb right on horizontal rope END*/
		
		else
		
		#region /*Bump into wall on left side when climbing horizontal rope*/
		if (key_right)
		and(!key_left)
		and(place_meeting(bbox_right+1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			image_xscale=+1;
			if (sprite_climb_under_still>noone){sprite_index = sprite_climb_under_still;}else
			{sprite_index = sprite_stand;}
			image_speed=0;
			if (asset_get_type("snd_bump")==asset_sound)
			and!audio_is_playing(snd_bump)
			{
				audio_play_sound(snd_bump,0,0);
				audio_sound_gain(snd_bump,global.sfx_volume,0);
			}
		}
		#endregion /*Bump into wall on left side when climbing horizontal rope END*/
		
		else
		
		#region /*Look up when on horizontal rope*/
		if (key_up)
		{
			if (sprite_climb_under_look_up>noone){sprite_index = sprite_climb_under_look_up;}else
			if (sprite_climb_under_still>noone){sprite_index = sprite_climb_under_still;}else
			{sprite_index = sprite_stand;}
			image_speed=0.5;
		}
		#endregion /*Look up when on horizontal rope END*/

		else
		{
			if (sprite_climb_under_still>noone)
			{
				sprite_index = sprite_climb_under_still;
			}
			else
			{
				sprite_index = sprite_stand;
			}
		}
		if (instance_nearest(x,y,obj_horizontal_rope).active = false)
		{
			can_climb_horizontal_rope_cooldown = 10;
			can_ground_pound = false;
			climb = false;
			horizontal_rope_climb = false;
			stomp_spin = false;
		}
	}
}
#endregion /*Climb Horizontal Rope END*/

else

#region /*Climb Vine*/
if (asset_get_type("obj_vine")==asset_object)
and(place_meeting(x,y,obj_vine))
{
	if (key_up)
	and(vspeed>=0)
	or(key_up_pressed)
	{
		if (climb=false)
		{
			climb=true;
			horizontal_rope_climb=false;
			jump=0;
			stick_to_wall = false;
			
			#region /*Make a sound effect that you have started cimbing*/
			if (asset_get_type("snd_catch_ivy")==asset_sound)
			{
				audio_play_sound(snd_catch_ivy,0,0);
				audio_sound_gain(snd_catch_ivy,global.sfx_volume,0);
			}
			audio_stop_sound(voice);
			voice=audio_play_sound(voice_rope_catch,0,0);
			audio_sound_gain(voice_rope_catch,global.voices_volume,0);
			audio_sound_pitch(voice_rope_catch, default_voice_pitch);
			#endregion /*Make a sound effect and voice clip that you have started cimbing END*/
			
		}
	}
	if (climb=true)
	{
		gravity=0;
		hspeed=0;
		vspeed =0;
		laststandingx=x;
		laststandingy=y;
		speed_max=4;
		ledge_grab_jump=false;
		ground_pound=false;
		dive=false;
		can_ground_pound = false;
		can_dive = true;
		stomp_spin=false;
		midair_jumps_left=number_of_jumps;
		spring=false;
		chain_reaction=0;
		if (key_up)
		and(!key_down)
		and(place_meeting(x,bbox_top-1,obj_vine))
		and(takendamage<=takendamage_freezetime)
		{
			if (x<instance_nearest(x,y,obj_vine).x)
			{
				x+=4;
			}
			if (x>instance_nearest(x,y,obj_vine).x)
			{
				x-=4;
			}
			if (!position_meeting(x,bbox_top-1,obj_wall))
			{
				if (sprite_vine_climb>noone){sprite_index = sprite_vine_climb;}else
				if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
				{sprite_index = sprite_stand;}
				
				if (key_sprint)
				{
					y-=4;
					image_speed=0.4;
				}
				else
				{
					y-=2;
					image_speed=0.2;
				}
				if (asset_get_type("snd_move_ivy")==asset_sound)
				{
					if (!audio_is_playing(snd_move_ivy))
					{
						audio_play_sound(snd_move_ivy,0,0);
						audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
					}
				}
			}
			else
			{
				if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
				{sprite_index = sprite_stand;}
			}
		}
		else
		if (key_down)
		and(!key_up)
		and(takendamage<=takendamage_freezetime)
		{
			if (x<instance_nearest(x,y,obj_vine).x)
			{
				x+=4;
			}
			if (x>instance_nearest(x,y,obj_vine).x)
			{
				x-=4;
			}
			if (sprite_vine_climb>noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
			{sprite_index = sprite_stand;}
			if (key_sprint)
			{
				y+=5;
				image_speed=0.4;
			}
			else
			{
				y+=3;
				image_speed=0.2;
			}
			if (asset_get_type("snd_move_ivy")==asset_sound)
			{
				if (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy,0,0);
					audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
				}
			}
			if (place_meeting(x,y+1,obj_wall))
			{
				climb=false;
			}
		}
		else
		if (key_left)
		and(!key_right)
		and(!key_up)
		and(!key_down)
		and(!position_meeting(bbox_left-1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			image_xscale=-1;
			if (sprite_vine_climb>noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
			{sprite_index = sprite_stand;}
			if (key_sprint)
			{
				x-=4;
				image_speed=0.4;
			}
			else
			{
				x-=2;
				image_speed=0.2;
			}
			if (asset_get_type("snd_move_ivy")==asset_sound)
			{
				if (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy,0,0);
					audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
				}
			}
		}
		else
		if (key_left)
		and(!key_right)
		and(!key_up)
		and(!key_down)
		and(position_meeting(bbox_left-1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
			{sprite_index = sprite_stand;}
			image_speed=0;
			image_xscale=-1;
			if (asset_get_type("snd_bump")==asset_sound)
			{
				if (!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump,0,0);
					audio_sound_gain(snd_bump,global.sfx_volume,0);
				}
			}
		}
		else
		if (key_right)
		and(!key_left)
		and(!key_up)
		and(!key_down)
		and(!position_meeting(bbox_right+1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			image_xscale=+1;
			if (sprite_vine_climb>noone){sprite_index = sprite_vine_climb;}else
			if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
			{sprite_index = sprite_stand;}
			if (key_sprint)
			{
				x+=4;
				image_speed=0.4;
			}
			else
			{
				x+=2;
				image_speed=0.2;
			}
			if (asset_get_type("snd_move_ivy")==asset_sound)
			{
				if (!audio_is_playing(snd_move_ivy))
				{
					audio_play_sound(snd_move_ivy,0,0);
					audio_sound_gain(snd_move_ivy,global.sfx_volume,0);
				}
			}
		}
		else
		if (key_right)
		and(!key_left)
		and(!key_up)
		and(!key_down)
		and(position_meeting(bbox_right+1,y,obj_wall))
		and(takendamage<=takendamage_freezetime)
		{
			if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
			{sprite_index = sprite_stand;}
			image_speed=0;
			image_xscale=+1;
			if (asset_get_type("snd_bump")==asset_sound)
			{
				if (!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump,0,0);
					audio_sound_gain(snd_bump,global.sfx_volume,0);
				}
			}
		}
		else
		{
			if (sprite_vine_stay>noone){sprite_index = sprite_vine_stay;}else
			{sprite_index = sprite_stand;}
			image_speed=0.2;
		}
		if (key_jump)
		{
			if (!key_down)
			{
				midair_jumps_left -= 1;
				vspeed = -11.5;
			}
			climb=false;
			stomp_spin=false;
			if (hp=1)
			and(max_hp>=2)
			{
				if (asset_get_type("snd_jumpsmall")==asset_sound)
				{
					audio_play_sound(snd_jumpsmall,0,0);
					audio_sound_gain(snd_jumpsmall,global.sfx_volume,0);
				}
				if (asset_get_type("snd_jump")==asset_sound)
				{
					audio_play_sound(snd_jump,0,0);
					audio_sound_gain(snd_jump,global.sfx_volume,0);
					audio_sound_pitch(snd_jump,1.5);
				}
			}
			else
			if (asset_get_type("snd_jump")==asset_sound)
			{
				audio_play_sound(snd_jump,0,0);
				audio_sound_gain(snd_jump,global.sfx_volume,0);
			}
		}
	}
}
#endregion /*Climb Vine END*/

#region /*In Water Animations*/
if (in_water = true)
and (climb = false)
{
	can_ground_pound = false;
	chain_reaction=0;

/*Crouch*/
if (key_down)
and(!key_up)
{
	if (vspeed<-2)
	{
		vspeed = -2;
	}
	if (crouch=false)
	and(can_move=true)
	{
		if (ground_pound=false)
		and(dive=false)
		{
			if (place_meeting(x,y+1,obj_wall))
			{
				crouch = true;
				stick_to_wall = false;
				y+=16;
				if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
				{sprite_index = sprite_stand;}
				mask_index=sprite_mask_crouch;
				if (asset_get_type("snd_crouch")==asset_sound)
				{
					audio_play_sound(snd_crouch,0,0);
					audio_sound_gain(snd_crouch,global.sfx_volume,0);
				}
			}
		}
	}
}
/*Don't Crouch*/
else
if (!key_down)
and(!place_meeting(x,y-8,obj_wall))
and(crouch=true)
{
	if (vspeed>=0)
	{
		crouch=false;
		y-=16;
		draw_xscale=0.75;
		draw_yscale=1.25;
		mask_index=sprite_mask;
		if (asset_get_type("snd_rise")==asset_sound)
		{
			audio_play_sound(snd_rise,0,0);
			audio_sound_gain(snd_rise,global.sfx_volume,0);
		}
	}
}
if (crouch = true)
{
	stick_to_wall = false;
	if (place_meeting(x,y+1,obj_wall))
	{
		if (abs(hspeed)>3)
		{
			if (asset_get_type("snd_skidding")==asset_sound)
			{
				if (!audio_is_playing(snd_skidding))
				{
					audio_play_sound(snd_skidding,0,0);
					audio_sound_gain(snd_skidding,global.sfx_volume,0);
				}
			}
			effect_create_above(ef_smoke,x,bbox_bottom,0,c_white);
		}
		else
		if (asset_get_type("snd_skidding")==asset_sound)
		{
			if (audio_is_playing(snd_skidding))
			{
				audio_stop_sound(snd_skidding);
			}
		}
	}
	if (abs(hspeed)>=2.5)
	and(place_meeting(x,y+1,obj_wall))
	{
		if (asset_get_type("spr_player_slide")==asset_sprite)
		{
			mask_index=sprite_mask_crouch;
			sprite_index=spr_player_slide;
		}
		else
		{
			mask_index=sprite_mask_crouch;
			sprite_index=spr_player_crouch_crawl;
			if (image_index>image_number-1)
			{
				image_speed=0;
			}
			else
			{
				image_speed=0.5;
			}
		}
	}
	else
	if (place_meeting(x,y+1,obj_wall))
	{
		
		#region /*Crouch Stand*/
		if (speed=0)
		and(!key_left)
		and(!key_right)
		{
			if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
			{sprite_index = sprite_stand;}
			if (image_index>image_number-1)
			{
				image_speed=0;
			}
			else
			{
				image_speed=0.5;
			}
		}
		#endregion /*Crouch Stand END*/
		
		#region /*Crouch Crawl*/
		else
		if (key_left)
		or(key_right)
		{
			if (sprite_crouch_crawl>noone){sprite_index = sprite_crouch_crawl;}else
			if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
			{sprite_index = sprite_stand;}
			image_speed=0.5;
		}
		#endregion /*Crouch Crawl END*/
		
	}
	else
	if (!place_meeting(x,y+1,obj_wall))
	{
		if (key_jump)
		{
			image_index=0;
		}
		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.3;
		}
		if (vspeed>0)
		{
			sprite_index = sprite_swim_fall;
		}
		else
		{
			sprite_index = sprite_swim;
		}
	}
}

else
if (asset_get_type("obj_wall")==asset_object)
and(place_meeting(x,y+1,obj_wall))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(place_meeting(x,y+1,obj_semisolid_platform))
{

#region /*Skidding*/
if (hspeed<0)
and(key_right)
or(hspeed>0)
and(key_left)
{
	if (asset_get_type("snd_skidding")==asset_sound)
	{
		if (!audio_is_playing(snd_skidding))
		{
			audio_play_sound(snd_skidding,0,0);
			audio_sound_gain(snd_skidding,global.sfx_volume,0);
		}
	}
	if (asset_get_type("spr_player_swim_skidding")==asset_sprite)
	{
		sprite_index = spr_player_swim_skidding;
	}
	else
	{
		sprite_index = sprite_swim;
	}
	effect_create_above(ef_smoke,x,bbox_bottom,1,c_white);
	if (image_index>image_number-1)
	{
		image_speed = 0;
	}
	else
	{
		image_speed = 0.5;
	}
}
#endregion /*Skidding END*/

//*Look Up*/else if hspeed=0 and key_up and!key_down and can_move=true{if asset_get_type("spr_player_swim_look_up")==asset_sprite{sprite_index=spr_player_swim_look_up;}image_speed=0.1;mask_index=sprite_mask;}
/*Stand*/else if hspeed=0 and!key_left and!key_right{if asset_get_type("spr_player_swim_stand")==asset_sprite{sprite_index=spr_player_swim_stand;}else{sprite_index = sprite_swim;}image_speed=0.1;}
/*Run*/
else
if (hspeed<+0.1)
or(hspeed>-0.1)
{
	if (can_move=true)
	and(goal=false)
	or(goal=true)
	{
		if (speeddash=true)
		{
			sprite_index = sprite_swim;
		}
		else
		if (abs(speed)>=6)
		{
			sprite_index = sprite_swim;
		}
		/*Against Wall*/
		else
		{
			if (place_meeting(x-1,y,obj_wall))
			or(place_meeting(x+1,y,obj_wall))
			{
				sprite_index = sprite_swim;
			}
			/*Walk*/
			else
			{
				sprite_index = sprite_swim;
			}
		}
		image_speed=speed/13.5+0.1;
	}
}
if (image_index<1)
or(image_index=4)
{
	if abs(hspeed)>0
	{
		effect_create_above(ef_smoke,x,bbox_bottom,0,c_white);
	}
}
/*Stand*/else{mask_index=sprite_mask;}}
/*Swimming Sprites*/
else
if (!place_meeting(x,y+1,obj_wall))
{

#region /*Skidding*/
if (hspeed<-0.2)
and(image_xscale>0)
or(hspeed>+0.2)
and(image_xscale<0)
{
	if (asset_get_type("snd_skidding")==asset_sound)
	{
		if (!audio_is_playing(snd_skidding))
		{
			audio_play_sound(snd_skidding,0,0);
			audio_sound_gain(snd_skidding,global.sfx_volume,0);
		}
	}
	if (asset_get_type("spr_player_swim_skidding")==asset_sprite)
	{
		sprite_index=spr_player_swim_skidding;
	}
	else
	{
		sprite_index = sprite_swim;
	}
	if (image_index>image_number-1)
	{
		image_speed=0;
	}
	else
	{
		image_speed=0.5;
	}
}
#endregion /*Skidding END*/

/*Single Swim*/else if key_jump{image_index=0;}if image_index>image_number-1{image_speed=0;}else{image_speed=0.3;}if vspeed>0{sprite_index = sprite_swim_fall;}else{sprite_index = sprite_swim;}
mask_index=sprite_mask;}

}
#endregion /*In Water Animations END*/

else
{

#region /*Crouch*/
if (key_crouch)
{
	if (crouch=false)
	and(can_move=true)
	and(ground_pound=false)
	and(dive=false)
	{
		if (place_meeting(x,y+1,obj_wall))
		or(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
		or(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
		or(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
		{
			crouch=true;
			draw_xscale=1.5;
			draw_yscale=0.5;
			if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
			{image_index=sprite_stand;}
			
			mask_index=sprite_mask_crouch;
			if (!place_meeting(x,y+16,obj_wall))
			{
			y+=32;
			}
			if (asset_get_type("snd_crouch")==asset_sound)
			{
				audio_play_sound(snd_crouch,0,0);
				audio_sound_gain(snd_crouch,global.sfx_volume,0);
			}
		}
	}
}
#endregion /*Crouch END*/

else

#region /*Don't crouch*/
if (!key_down)
and(!place_meeting(x,y-8,obj_wall))
and(crouch=true)
{
	if (vspeed>=0)
	{
		crouch=false;
		y-=16;
		draw_xscale=0.75;
		draw_yscale=1.25;
		mask_index=sprite_mask;
		if (asset_get_type("snd_rise")==asset_sound)
		{
			audio_play_sound(snd_rise,0,0);
			audio_sound_gain(snd_rise,global.sfx_volume,0);
		}
	}
}
#endregion /*Don't crouch END*/

/*Roll*/
if (allow_roll=true)
and(roll=true)
{
	if (asset_get_type("spr_player_roll")==asset_sprite)
	{
		sprite_index=spr_player_roll;
	}
	mask_index=sprite_mask_crouch;
	if (!place_meeting(x,y+1,obj_wall))
	{
		roll=false;
	}
	if (image_index>image_number-1)
	{
		image_speed=0;
		roll=false;
	}
	else
	{
		image_speed=0.5;
	}
}
else
if (crouch = true)
{
	
	#region /*Destroy blocks above you when you jump while crouching*/
	if (key_jump)
	{
		with (instance_create_depth(bbox_left+16, bbox_top, 0, obj_blockbreak))
		{
			image_xscale = 0.5;
			image_yscale = 0.5;
		}
		with (instance_create_depth(x, bbox_top, 0, obj_blockbreak))
		{
			image_xscale = 0.5;
			image_yscale = 0.5;
		}
		with (instance_create_depth(bbox_right-16, bbox_top, 0, obj_blockbreak))
		{
			image_xscale = 0.5;
			image_yscale = 0.5;
		}
	}
	#endregion /*Destroy blocks above you when you jump while crouching END*/
	
	if (place_meeting(x,y+1,obj_wall))
	or(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
	or(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
	or(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
	{
		if (abs(hspeed)>3)
		{
			if (asset_get_type("snd_skidding")==asset_sound)
			{
				if (!audio_is_playing(snd_skidding))
				{
					audio_play_sound(snd_skidding,0,0);
					audio_sound_gain(snd_skidding,global.sfx_volume,0);
				}
			}
			effect_create_above(ef_smoke,x,bbox_bottom,0,c_white);
		}
		else
		if (asset_get_type("snd_skidding")==asset_sound)
		{
			if (audio_is_playing(snd_skidding))
			{
				audio_stop_sound(snd_skidding);
			}
		}
	}
	if (abs(hspeed)>=2.5)
	and(place_meeting(x,y+1,obj_wall))
	or(abs(hspeed)>=2.5)
	and(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
	or(abs(hspeed)>=2.5)
	and(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
	or(abs(hspeed)>=2.5)
	and(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
	{
		mask_index=sprite_mask_crouch;
		if (sprite_crouch_crawl>noone){sprite_index = sprite_crouch_crawl;}else
		if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
		{sprite_index = sprite_stand;}
		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.5;
		}
	}
	else
	if (place_meeting(x,y+1,obj_wall))
	or(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
	or(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
	or(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
	{

	#region /*Crouch Still*/
	if (speed=0)
	and(!key_left)
	and(!key_right)
	{
		sprite_index = sprite_crouch;
		if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
		{sprite_index = sprite_stand;}
		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.5;
		}
	}
	#endregion /*Crouch Still END*/
	
	else
	
	#region /*Crouch Crawl*/
	if (key_left)
	or(key_right)
	{
		if (sprite_crouch_crawl>noone){sprite_index = sprite_crouch_crawl;}else
		if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
		{sprite_index = sprite_stand;}
		image_speed=0.5;
	}
	#endregion /*Crouch Crawl END*/
	}

	else
	if (!place_meeting(x,y+1,obj_wall))
	and(!position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
	and(!position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
	and(!position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
	{
		
		#region /*Crouch Jump*/
		if (vspeed<0)
		{
			if (sprite_crouch_jump>noone){sprite_index = sprite_crouch_jump;}else
			if (sprite_crouch_fall>noone){sprite_index = sprite_crouch_fall;}else
			if (sprite_jump>noone)and(vspeed<=0){sprite_index = sprite_jump;}else
			if (sprite_fall_slower>noone)and(vspeed>0)and(key_a_hold){sprite_index = sprite_fall_slower;}else
			if (sprite_fall>noone)and(vspeed>0){sprite_index = sprite_fall;}else
			if (sprite_jump>noone){sprite_index = sprite_jump;}else
			if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
			{sprite_index = sprite_stand;}
			if (image_index>image_number-1)
			{
				image_speed=0;
			}
			else
			{
				image_speed=0.5;
			}
		}
		#endregion /*Crouch Jump END*/
		
		else
		if (vspeed>0)
		and(stick_to_wall=false)
		{
			if (sprite_crouch_fall>noone){sprite_index = sprite_crouch_fall;}else
			if (sprite_crouch_jump>noone){sprite_index = sprite_crouch_jump;}else
			if (sprite_jump>noone)and(vspeed<=0){sprite_index = sprite_jump;}else
			if (sprite_fall_slower>noone)and(vspeed>0)and(key_a_hold){sprite_index = sprite_fall_slower;}else
			if (sprite_fall>noone)and(vspeed>0){sprite_index = sprite_fall;}else
			if (sprite_jump>noone){sprite_index = sprite_jump;}else
			if (sprite_crouch>noone){sprite_index = sprite_crouch;}else
			{sprite_index = sprite_stand;}
			
			if (image_index>image_number-1)
			{
				image_speed=0;
			}
			else
			{
				image_speed=0.5;
			}
		}
		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.5;
		}
	}
	jump=0;
	mask_index=sprite_mask_crouch;
}
else
if (ground_pound=true)
{
	if (sprite_ground_pound>noone){sprite_index = sprite_ground_pound;}else
	if (sprite_fall>noone){sprite_index = sprite_fall;}else
	if (sprite_jump>noone){sprite_index = sprite_jump;}else
	{sprite_index = sprite_stand;}
	if (image_index>image_number-1)
	{
		image_speed=0;
	}
	else
	{
		image_speed=0.5;
	}
}
else
if (ground_pound=2)
{
	if (sprite_ground_pound_get_up>noone){sprite_index = sprite_ground_pound_get_up;}else
	{
		if (image_index>0)
		{
			image_speed=0;
			ground_pound=false;
		}
	}
	if (image_index>image_number-1)
	{
		image_speed=0;
		ground_pound=false;
	}
	else
	{
		image_speed=0.5;
	}
}
else
if (ground_pound=3)
{
	if (sprite_stomp_spin>noone){sprite_index = sprite_stomp_spin;}else
	if (sprite_jump>noone){sprite_index = sprite_jump;}else
	{sprite_index = sprite_stand;}
	if (image_index>image_number-1)
	{
		image_speed=0;
		ground_pound=false;
	}
	else
	{
		image_speed=0.5;
	}
}
else
if (asset_get_type("obj_wall")==asset_object)
and(place_meeting(x,y+1,obj_wall))
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(x,bbox_bottom+1,obj_semisolid_platform))
and(vspeed =0)
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(bbox_left,bbox_bottom+1,obj_semisolid_platform))
and(vspeed =0)
or(asset_get_type("obj_semisolid_platform")==asset_object)
and(position_meeting(bbox_right,bbox_bottom+1,obj_semisolid_platform))
and(vspeed =0)
{

#region /*Skidding*/
if (hspeed<0)
and(key_right)
or(hspeed>0)
and(key_left)
{
	if (can_move=true)
	{
		if (asset_get_type("obj_ice_block")==asset_object)
		and(place_meeting(x,y+1,obj_ice_block))
		{
			if (asset_get_type("snd_skidding_ice")==asset_sound)
			{
				if (!audio_is_playing(snd_skidding_ice))
				{
					audio_play_sound(snd_skidding_ice,0,0);
					audio_sound_gain(snd_skidding_ice,global.sfx_volume,0);
				}
			}
		}
		else
		if (asset_get_type("snd_skidding")==asset_sound)
		{
			if (!audio_is_playing(snd_skidding))
			{
				audio_play_sound(snd_skidding,0,0);
				audio_sound_gain(snd_skidding,global.sfx_volume,0);
			}
		}
		if (asset_get_type("obj_ice_block")==asset_object)
		and(place_meeting(x,y+1,obj_ice_block))
		{
			if (sprite_skidding_ice>noone){sprite_index = sprite_skidding_ice;image_speed=0.5;}else
			if (sprite_skidding>noone){sprite_index = sprite_skidding;image_speed=0.5;}else
			if (sprite_run>noone){sprite_index = sprite_run;}else
			if (sprite_walk>noone)and(hspeed<>0){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		{
			if (sprite_skidding>noone){sprite_index = sprite_skidding;image_speed=0.5;}else
			if (abs(hspeed)>20)and(sprite_run4>noone){sprite_index = sprite_run4;}else
			if (abs(hspeed)>15)and(sprite_run3>noone){sprite_index = sprite_run3;}else
			if (abs(hspeed)>10)and(sprite_run2>noone){sprite_index = sprite_run2;}else
			if (abs(hspeed)>5)and(sprite_run>noone){sprite_index = sprite_run;}else
			if (sprite_walk>noone)and(hspeed<>0){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		effect_create_above(ef_smoke,x,bbox_bottom,0,c_white);
	}
}
#endregion /*Skidding END*/

else

#region /*Skidding Stop*/
if (hspeed < -0.1)
and(!key_left)
or(hspeed > +0.1)
and(!key_right)
{
	if (sprite_skidding_stop>noone){sprite_index = sprite_skidding_stop;image_speed=0.5;}else
	if (abs(hspeed)>20)and(sprite_run4>noone){sprite_index = sprite_run4;image_speed=speed/10+0.1;}else
	if (abs(hspeed)>15)and(sprite_run3>noone){sprite_index = sprite_run3;image_speed=speed/10+0.1;}else
	if (abs(hspeed)>10)and(sprite_run2>noone){sprite_index = sprite_run2;image_speed=speed/10+0.1;}else
	if (abs(hspeed)>5)and(sprite_run>noone){sprite_index = sprite_run;image_speed=speed/10+0.1;}else
	if (sprite_walk>noone)and(hspeed <> 0){sprite_index = sprite_walk;image_speed=speed/10+0.1;}else
	{sprite_index = sprite_stand;image_speed=0.5;}
}
#endregion /*Skidding Stop END*/

else

#region /*Look Up*/
if (hspeed=0)
and(key_up)
and(!key_down)
and(can_move=true)
{
	if (look_up_start_animation=true)
	{
		if (sprite_look_up_start>noone){sprite_index = sprite_look_up_start;}else
		if (sprite_look_up>noone){sprite_index = sprite_look_up;}else
		{sprite_index = sprite_stand;}
	}
	else
	{
		if (sprite_look_up>noone){sprite_index = sprite_look_up;}else
		{sprite_index = sprite_stand;}
	}
	if (image_index>image_number-1)
	and(look_up_start_animation=true)
	{
		image_index=1;
		look_up_start_animation=false;
	}
	image_speed=0.3;
	mask_index=sprite_mask;
}
#endregion /*Look Up END*/

else

#region /*Stand*/
if (hspeed=0)
and(!key_left)
and(!key_right)
{
	look_up_start_animation=true;
	if (asset_get_type("obj_bump_in_ground")==asset_object)
	and(place_meeting(x,y+1,obj_bump_in_ground))
	{
		if (sprite_standing_on_something>noone){sprite_index = sprite_standing_on_something;}else
		{sprite_index = sprite_stand;}
		image_speed=0.3;
	}
	else
	if (asset_get_type("obj_camera")==asset_object)
	and (instance_exists(obj_camera))
	and (obj_camera.rain = true)
	{
		if (sprite_stand_cold>noone){sprite_index = sprite_stand_cold;}else
		{sprite_index = sprite_stand;}
		image_speed=1;
	}
	else
	{
		sprite_index = sprite_stand;
		image_speed=0.3;
	}
}
#endregion /*Stand END*/

else

#region /*Run*/
if (hspeed < -0.1)
or(hspeed > +0.1)
{
	if (can_move=true)
	and(goal=false)
	or(goal=true)
	{
		if (abs(hspeed)>=20)
		{
			if (sprite_run4>noone){sprite_index = sprite_run4;}else
			if (sprite_run3>noone){sprite_index = sprite_run3;}else
			if (sprite_run2>noone){sprite_index = sprite_run2;}else
			if (sprite_run>noone){sprite_index = sprite_run;}else
			if (sprite_walk>noone)and(hspeed<>0){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed)>=15)
		{
			if (sprite_run3>noone){sprite_index = sprite_run3;}else
			if (sprite_run2>noone){sprite_index = sprite_run2;}else
			if (sprite_run>noone){sprite_index = sprite_run;}else
			if (sprite_walk>noone)and(hspeed<>0){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed)>=10)
		{
			if (sprite_run2>noone){sprite_index = sprite_run2;}else
			if (sprite_run>noone){sprite_index = sprite_run;}else
			if (sprite_walk>noone)and(hspeed<>0){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		if (abs(hspeed)>=5)
		{
			if (sprite_run>noone){sprite_index = sprite_run;}else
			if (sprite_walk>noone)and(hspeed<>0){sprite_index = sprite_walk;}else
			{sprite_index = sprite_stand;}
		}
		else
		{
			
			#region /*Walk*/
			{
				if (sprite_walk>noone)and(hspeed<>0){sprite_index = sprite_walk;}else
				{sprite_index = sprite_stand;}
			}
			#endregion /*Walk END*/
			
		}
		if (asset_get_type("obj_ice_block")==asset_object)
		and(place_meeting(x,y+1,obj_ice_block))
		{
			image_speed=0.5;
		}
		else
		{
			image_speed=speed/10+0.1;
		}
	}
}
#endregion /*Run END*/

else

#region /*Against Wall*/
if (place_meeting(x-1,y,obj_wall))
and(place_meeting(x,y+1,obj_wall))
and(key_left)
or(place_meeting(x+1,y,obj_wall))
and(place_meeting(x,y+1,obj_wall))
and(key_right)
or(place_meeting(x-1,y,obj_wall))
and(place_meeting(x,y+1,obj_semisolid_platform))
and(key_left)
or(place_meeting(x+1,y,obj_wall))
and(place_meeting(x,y+1,obj_semisolid_platform))
and(key_right)
{
	if (crouch=false)
	{
		if (sprite_against_wall>noone){sprite_index = sprite_against_wall;image_speed=0.5;}else
		{sprite_index = sprite_stand;image_speed=0.3;}
	}
	if (asset_get_type("snd_bump")==asset_sound)
	{
		if (!audio_is_playing(snd_bump))
		{
			audio_play_sound(snd_bump,0,0);
			audio_sound_gain(snd_bump,global.sfx_volume,0);
		}
	}
}
#endregion /*Against Wall END*/

else
{
	sprite_index = sprite_stand;
}

if (image_index=floor(1))
or(image_index=floor(6))
{
	if (abs(hspeed)>0)
	{
		effect_create_above(ef_smoke,x,bbox_bottom,0,c_white);
	}
}
/*Stand*/
else
{
	mask_index=sprite_mask;
}
}
else

/*Jumping Sprites*/
if (!place_meeting(x,y+1,obj_wall))
{
	if (burnt>0)
	{
		if (sprite_burnt>noone){sprite_index = sprite_burnt;}else
		if (sprite_die>noone){sprite_index = sprite_die;}else
		if (sprite_jump>noone)and(vspeed<=0){sprite_index = sprite_jump;}else
		if (sprite_fall_slower>noone)and(vspeed>0)and(key_a_hold){sprite_index = sprite_fall_slower;}else
		if (sprite_fall>noone)and(vspeed>0){sprite_index = sprite_fall;}else
		if (sprite_jump>noone){sprite_index = sprite_jump;}else
		{sprite_index = sprite_stand;}
	}
	else
	if (dive=true)
	{
		if (sprite_dive>noone){sprite_index = sprite_dive;}else
		if (sprite_jump>noone)and(vspeed<=0){sprite_index = sprite_jump;}else
		if (sprite_fall_slower>noone)and(vspeed>0)and(key_a_hold){sprite_index = sprite_fall_slower;}else
		if (sprite_fall>noone)and(vspeed>0){sprite_index = sprite_fall;}else
		if (sprite_jump>noone){sprite_index = sprite_jump;}else
		{sprite_index = sprite_stand;}
		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.5;
		}
	}
else
/*wall_slide down*/
if (stick_to_wall = true)
and(vspeed>=0)
{
	if (crouch=false)
	and(ground_pound=false)
	and(ledge_grab=false)
	{
		if (vspeed>0)
		{
			if (sprite_wall_slide_down>noone){sprite_index = sprite_wall_slide_down;}else
			if (sprite_wall_slide>noone){sprite_index = sprite_wall_slide;}else
			{sprite_index = sprite_stand;}
		}
		else
		{
			if (sprite_wall_slide>noone){sprite_index = sprite_wall_slide;}else
			{sprite_index = sprite_stand;}
		}
		image_speed=0.5;
	}
}
else
if (vspeed<0)
{
	if (stomp_spin=true)
	{
		if (sprite_stomp_spin>noone){sprite_index = sprite_stomp_spin;}else
		if (sprite_jump>noone){sprite_index = sprite_jump;}else
		{sprite_index = sprite_stand;}
		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.5;
		}
	}
	else
	if (spring>=2)
	{
		if (asset_get_type("spr_player_spring_double")==asset_sprite)
		{
			sprite_index=spr_player_spring_double;
		}
		else
		{
			sprite_index = sprite_stomp_spin;
		}
		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.5;
		}
	}
	else
	/*Make it look natural when climbing wall*//*IMPORTANT*/
	/*Run up wall / wall_slide up*/
	if (stick_to_wall = true)
	{
		if (crouch=false)
		and(ground_pound=false)
		and(ledge_grab=false)
		{
			if(sprite_wall_slide_up>noone){sprite_index = sprite_wall_slide_up;}else
			if(sprite_wall_slide>noone){sprite_index = sprite_wall_slide;}else
			{sprite_index = sprite_stand;}
			image_speed=0.5;
		}
	}
	else
	if (invincible>30)
	and(asset_get_type("spr_player_invincible_jump")==asset_sprite)
	{
		sprite_index=spr_player_invincible_jump;
		image_speed=1;
	}
	/*Walljump*/
	else
	{
		if (wall_jump >= 0)
		and(asset_get_type("spr_player_wall_jump")==asset_sprite)
		{
			sprite_index=spr_player_wall_jump;
			if (image_index>image_number-1)
			{
				image_speed=0;
			}
			else
			{
				image_speed=0.5;
			}
		}
		else
		
		/*Single Jump*/
		if (jump <= 1)
		{
			if (speeddash=true)
			{
				if (asset_get_type("spr_player_speeddashjump")==asset_sprite)
				{
					sprite_index=spr_player_speeddashjump;
				}
				else
				if (asset_get_type("spr_player_jump2")==asset_sprite)
				and(asset_get_type("spr_player_jump3")==asset_sprite)
				{
					if (sprite_index!=sprite_jump)
					and(sprite_index!=spr_player_jump2)
					and(sprite_index!=spr_player_jump3)
					{
						sprite_index=choose(sprite_jump,spr_player_jump2,spr_player_jump3);
					}
				}
				else
				if (spring = false)
				{
					if (sprite_jump>noone){sprite_index = sprite_jump;}else
					{sprite_index = sprite_stand;}
				}
			}
			else
			if (asset_get_type("spr_player_jump2")==asset_sprite)
			and(asset_get_type("spr_player_jump3")==asset_sprite)
			{
				if (sprite_index!=sprite_jump)
				and(sprite_index!=spr_player_jump2)
				and(sprite_index!=spr_player_jump3)
				{
					sprite_index=choose(sprite_jump,spr_player_jump2,spr_player_jump3);
				}
			}
			else
			if (spring = false)
			{
				if (sprite_jump>noone){sprite_index = sprite_jump;}else
				{sprite_index = sprite_stand;}
			}
		}
		else
		
		#region /*Double Jump*/
		if (jump = 2)
		{
			if (sprite_double_jump>noone){sprite_index = sprite_double_jump;}else
			if (sprite_jump>noone){sprite_index = sprite_jump;}else
			{sprite_index = sprite_stand;}
			image_speed=0.5;
		}
		#endregion /*Double Jump END*/

		else

		#region /*Triple Jump*/
		if (jump > 2)
		{
			if(sprite_triple_jump>noone){sprite_index = sprite_triple_jump;}else
			if(sprite_jump>noone){sprite_index = sprite_jump;}else
			{sprite_index = sprite_stand;}
		}
		#endregion /*Triple Jump*/

		if (image_index>image_number-1)
		{
			image_speed=0;
		}
		else
		{
			image_speed=0.5;
		}
	}
}
else
if (vspeed>0)
and(stick_to_wall=false)
and(spring=false)
{
	if (invincible>30)
	and(asset_get_type("spr_player_invincible_jump")==asset_sprite)
	{
		sprite_index=spr_player_invincible_jump;
		image_speed=1;
	}
	else
	{
		if (speeddash=true)
		{
			if (asset_get_type("spr_player_speeddashjump")==asset_sprite)
			{
				sprite_index=spr_player_speeddashjump;
			}
			else
			{
				if (sprite_fall>noone){sprite_index = sprite_fall;}else
				if (sprite_fall_slower>noone){sprite_index = sprite_fall_slower;}else
				if (sprite_jump>noone){sprite_index = sprite_jump;}else
				{sprite_index = sprite_stand;}
			}
		}
		else
		{
			if (key_jump_hold)
			{
				if (sprite_fall_slower>noone){sprite_index = sprite_fall_slower;}else
				if (sprite_fall>noone){sprite_index = sprite_fall;}else
				if (sprite_jump>noone){sprite_index = sprite_jump;}else
				{sprite_index = sprite_stand;}
			}
			else
			{
				if (sprite_fall>noone){sprite_index = sprite_fall;}else
				if (sprite_fall_slower>noone){sprite_index = sprite_fall_slower;}else
				if (sprite_jump>noone){sprite_index = sprite_jump;}else
				{sprite_index = sprite_stand;}
			}
			if (image_index>image_number-1)
			{
				image_speed=0;
			}
			else
			{
				image_speed=0.5;
			}
		}
	}
}
mask_index=sprite_mask;
}
}

/*Stop skidding ice sound*/if asset_get_type("obj_ice_block")==asset_object{if asset_get_type("snd_skidding_ice")==asset_sound{
if crouch=false{if speed<2 or hspeed>0 and key_right or hspeed<0 and key_left or!key_left and!key_right or!place_meeting(x,y+1,obj_ice_block){if asset_get_type("snd_skidding_ice")==asset_sound{if audio_is_playing(snd_skidding_ice){audio_stop_sound(snd_skidding_ice);}}}}else if!place_meeting(x,y+1,obj_ice_block)or speed<1{if asset_get_type("snd_skidding_ice")==asset_sound{if audio_is_playing(snd_skidding_ice){audio_stop_sound(snd_skidding_ice);}}}}}/*Stop skidding ice sound end*/
/*Stop skidding sound*/if crouch=false{if speed<2 or hspeed>0 and key_right or hspeed<0 and key_left or!key_left and!key_right or!place_meeting(x,y+1,obj_wall){if asset_get_type("snd_skidding")==asset_sound{if audio_is_playing(snd_skidding){audio_stop_sound(snd_skidding);}}}}else if!place_meeting(x,y+1,obj_wall)or speed<1{if asset_get_type("snd_skidding")==asset_sound{if audio_is_playing(snd_skidding){audio_stop_sound(snd_skidding);}}}/*Stop skidding sound end*/

#region /*Footstep sounds*/
if (place_meeting(x,y+1,obj_wall))
{
	if (speed>0)
	and (crouch=false)
	{
		if (hspeed<0)
		and(!key_right)
		or(hspeed>0)
		and(!key_left)
		{
			if (image_index<1)
			{
				
				#region /*Left Footstep Sounds*/
				
				#region /*Dirt Footstep Left*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 1)
				{
					if (asset_get_type("snd_footstep_dirt_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_dirt_left))
						{
							audio_play_sound(snd_footstep_dirt_left,0,0);
							audio_sound_gain(snd_footstep_dirt_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Dirt Footstep Left END*/
				
				else
				
				#region /*Glass Footstep Left*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 2)
				{
					if (asset_get_type("snd_footstep_glass_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_glass_left))
						{
							audio_play_sound(snd_footstep_glass_left,0,0);
							audio_sound_gain(snd_footstep_glass_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Glass Footstep Left END*/
				
				else
				
				#region /*Grass Footstep Left*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 3)
				{
					if (asset_get_type("snd_footstep_grass_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_grass_left))
						{
							audio_play_sound(snd_footstep_grass_left,0,0);
							audio_sound_gain(snd_footstep_grass_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Grass Footstep Left END*/
				
				else
				
				#region /*Gravel Footstep Left*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 4)
				{
					if (asset_get_type("snd_footstep_gravel_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_gravel_left))
						{
							audio_play_sound(snd_footstep_gravel_left,0,0);
							audio_sound_gain(snd_footstep_gravel_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Gravel Footstep Left END*/
				
				else
				
				#region /*Metal Footstep Left*/
				if (asset_get_type("obj_ground")==asset_object)
				and (place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 5)
				{
					if (asset_get_type("snd_footstep_metal_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_metal_left))
						{
							audio_play_sound(snd_footstep_metal_left,0,0);
							audio_sound_gain(snd_footstep_metal_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Metal Footstep Left END*/
				
				else
				
				#region /*Stone Footstep Left*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 6)
				{
					if (asset_get_type("snd_footstep_stone_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_stone_left))
						{
							audio_play_sound(snd_footstep_stone_left,0,0);
							audio_sound_gain(snd_footstep_stone_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Stone Footstep Left END*/
				
				else
				
				#region /*Wood Footstep Left*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 7)
				{
					if (asset_get_type("snd_footstep_wood_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_wood_left))
						{
							audio_play_sound(snd_footstep_wood_left,0,0);
							audio_sound_gain(snd_footstep_wood_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Wood Footstep Left END*/
				
				else
				
				#region /*Default Footstep Left*/
				{
					if (asset_get_type("snd_footstep_default_left")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_default_left))
						{
							audio_play_sound(snd_footstep_default_left,0,0);
							audio_sound_gain(snd_footstep_default_left,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Default Footstep Left END*/
				
				#endregion /*Left Footstep Sounds END*/
				
			}
			else
			if (image_index>image_number/2-1)
			and(image_index<image_number/2+1)
			{
				
				#region /*Right Footstep Sounds*/
				
				#region /*Dirt Footstep Right*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 1)
				{
					if (asset_get_type("snd_footstep_dirt_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_dirt_right))
						{
							audio_play_sound(snd_footstep_dirt_right,0,0);
							audio_sound_gain(snd_footstep_dirt_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Dirt Footstep Right END*/
				
				else
				
				#region /*Glass Footstep Right*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 2)
				{
					if (asset_get_type("snd_footstep_glass_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_glass_right))
						{
							audio_play_sound(snd_footstep_glass_right,0,0);
							audio_sound_gain(snd_footstep_glass_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Glass Footstep Right END*/
				
				else
				
				#region /*Grass Footstep Right*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 3)
				{
					if (asset_get_type("snd_footstep_grass_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_grass_right))
						{
							audio_play_sound(snd_footstep_grass_right,0,0);
							audio_sound_gain(snd_footstep_grass_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Grass Footstep Right END*/
				
				else
				
				#region /*Gravel Footstep Right*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 4)
				{
					if (asset_get_type("snd_footstep_gravel_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_gravel_right))
						{
							audio_play_sound(snd_footstep_gravel_right,0,0);
							audio_sound_gain(snd_footstep_gravel_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Gravel Footstep Right END*/
				
				else
				
				#region /*Metal Footstep Right*/
				if (asset_get_type("obj_ground")==asset_object)
				and (place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 5)
				{
					if (asset_get_type("snd_footstep_metal_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_metal_right))
						{
							audio_play_sound(snd_footstep_metal_right,0,0);
							audio_sound_gain(snd_footstep_metal_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Metal Footstep Right END*/
				
				else
				
				#region /*Stone Footstep Right*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 6)
				{
					if (asset_get_type("snd_footstep_stone_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_stone_right))
						{
							audio_play_sound(snd_footstep_stone_right,0,0);
							audio_sound_gain(snd_footstep_stone_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Stone Footstep Right END*/
				
				else
				
				#region /*Wood Footstep Right*/
				if (asset_get_type("obj_ground")==asset_object)
				and(place_meeting(x,y+1,obj_ground))
				and(instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 7)
				{
					if (asset_get_type("snd_footstep_wood_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_wood_right))
						{
							audio_play_sound(snd_footstep_wood_right,0,0);
							audio_sound_gain(snd_footstep_wood_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Wood Footstep Right END*/
				
				else
				
				#region /*Default Footstep Right*/
				{
					if (asset_get_type("snd_footstep_default_right")==asset_sound)
					{
						if (!audio_is_playing(snd_footstep_default_right))
						{
							audio_play_sound(snd_footstep_default_right,0,0);
							audio_sound_gain(snd_footstep_default_right,global.sfx_volume,0);
						}
					}
				}
				#endregion /*Default Footstep Right END*/
				
				#endregion /*Right Footstep Sounds END*/
				
			}
		}
	}
}
#endregion /*Footstep sounds END*/

#region /*Running Sparks Effect*/
if (place_meeting(x,y+1,obj_wall))
{
	if (abs(hspeed)>4)
	{
		if (spark1_effect=false)
		{
			if (abs(hspeed)<7)
			{
				if (key_sprint)
				and(stick_to_wall=false)
				and(wall_jump = 0)
				{
					audio_stop_sound(voice);
					voice=audio_play_sound(voice_startdash,0,0);
					audio_sound_gain(voice_startdash,global.voices_volume,0);
					audio_sound_pitch(voice_startdash, default_voice_pitch);
				}
			}
			if (asset_get_type("obj_spark1")==asset_object)
			{
				if (hspeed<0)
				{
					var obj=instance_create_depth(bbox_right,bbox_bottom,0,obj_spark1);
					with(obj)
					{
						image_xscale=-1;
					}
				}
				else
				{
					instance_create_depth(bbox_left,bbox_bottom,0,obj_spark1);
				}
			}
			spark1_effect=true;
		}
	}
	else
	{
		spark1_effect=false;
	}
	if (abs(hspeed)>7)
	{
		if (spark2_effect=false)
		{
			if (abs(hspeed)<7.5)
			{
				if (key_sprint)
				and(stick_to_wall=false)
				and(wall_jump = 0)
				{
					if (asset_get_type("snd_speeddash")==asset_sound)
					{
						audio_play_sound(snd_speeddash,0,0);
						audio_sound_gain(snd_speeddash,global.sfx_volume,0);
					}
				}
			}
			if (asset_get_type("obj_spark2")==asset_object)
			{
				if (hspeed<0)
				{
					var obj=instance_create_depth(bbox_right,bbox_bottom,0,obj_spark2);
					with(obj)
					{
						image_xscale=-1;
					}
				}
				else
				{
					instance_create_depth(bbox_left,bbox_bottom,0,obj_spark2);
				}
			}
			spark2_effect=true;
		}
	}
	else
	{
		spark2_effect=false;
	}
}
else
{
	if (abs(hspeed)<4)
	{
		spark1_effect=false;
	}
	spark2_effect=false;
}
#endregion /*Running Sparks Effect END*/

#region /*Speedlines Effect*/
if (vspeed<0)
or(vspeed>0)
and(invincible<1)
or(invincible>0)
{
	if (asset_get_type("obj_speedline")==asset_object)
	{
		instance_create_depth(xx,yy,0,obj_speedline);
	}
}
#endregion /*Speedlines Effect End*/

if (place_meeting(x,y+1,obj_wall))
or (place_meeting(x,y+1,obj_semisolid_platform))
{
	can_dive = true;
}

#endregion /*________________________________Handling the sprites and sounds in the step event________________________________END*/