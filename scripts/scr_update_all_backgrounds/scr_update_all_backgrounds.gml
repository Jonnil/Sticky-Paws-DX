function scr_update_all_backgrounds()
{
	var time_source_period = 1; /* Limit Concurrent Processes */
	/* 1 frame delay between each sprite delete and sprite add */
	/* If your game is doing many memory-intensive operations simultaneously (such as loading multiple large resources at the same time) */
	/* try to stagger these operations so that they don't all happen at once */
	
	/* Set what file path to use */
	if (global.character_select_in_this_menu == "main_game")
	{
		global.path_to_use = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/";
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		global.default_background1 = ini_read_string("info", "default_background1", "");
		global.default_background2 = ini_read_string("info", "default_background2", "");
		global.default_background3 = ini_read_string("info", "default_background3", "");
		global.default_background4 = ini_read_string("info", "default_background4", "");
		global.default_foreground1 = ini_read_string("info", "default_foreground1", "");
		global.default_foreground1_5 = ini_read_string("info", "default_foreground1_5", "");
		global.default_foreground2 = ini_read_string("info", "default_foreground2", "");
		global.default_foreground_secret = ini_read_string("info", "default_foreground_secret", "");
		ini_close();
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	&& (global.can_load_custom_level_assets)
	{
		global.path_to_use = global.use_cache_or_working + "custom_levels/" + global.level_name + "/background/";
		ini_open(global.use_cache_or_working + "custom_levels/" + global.level_name + "/data/level_information.ini");
		global.default_background1 = ini_read_string("info", "default_background1", "level1");
		global.default_background2 = ini_read_string("info", "default_background2", "level1");
		global.default_background3 = ini_read_string("info", "default_background3", "level1");
		global.default_background4 = ini_read_string("info", "default_background4", "level1");
		global.default_foreground1 = ini_read_string("info", "default_foreground1", "");
		global.default_foreground1_5 = ini_read_string("info", "default_foreground1_5", "");
		global.default_foreground2 = ini_read_string("info", "default_foreground2", "");
		global.default_foreground_secret = ini_read_string("info", "default_foreground_secret", "");
		ini_close();
	}
	else
	{
		global.path_to_use = "";
		ini_open(global.use_cache_or_working + "custom_levels/" + global.level_name + "/data/level_information.ini");
		global.default_background1 = ini_read_string("info", "default_background1", "level1");
		global.default_background2 = ini_read_string("info", "default_background2", "level1");
		global.default_background3 = ini_read_string("info", "default_background3", "level1");
		global.default_background4 = ini_read_string("info", "default_background4", "level1");
		global.default_foreground1 = ini_read_string("info", "default_foreground1", "");
		global.default_foreground1_5 = ini_read_string("info", "default_foreground1_5", "");
		global.default_foreground2 = ini_read_string("info", "default_foreground2", "");
		global.default_foreground_secret = ini_read_string("info", "default_foreground_secret", "");
		ini_close();
		
	}
	show_debug_message("Set what file path to use");
	#region /* Update All Backgrounds */
	
	scr_delete_sprite_properly(global.custom_background1);
	scr_delete_sprite_properly(global.custom_background2);
	scr_delete_sprite_properly(global.custom_background3);
	scr_delete_sprite_properly(global.custom_background4);
	scr_delete_sprite_properly(global.custom_foreground1);
	scr_delete_sprite_properly(global.custom_foreground1_5);
	scr_delete_sprite_properly(global.custom_foreground2);
	scr_delete_sprite_properly(global.custom_foreground_secret);
	scr_delete_sprite_properly(global.custom_tileset);
	
	#region /* Update Background1 */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "background1.png"))
		{
			global.custom_background1 = sprite_add(string(global.path_to_use) + "background1.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "background1.bmp"))
		{
			global.custom_background1 = sprite_add(string(global.path_to_use) + "background1.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "background1.gif"))
		{
			global.custom_background1 = sprite_add(string(global.path_to_use) + "background1.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "background1.jpg"))
		{
			global.custom_background1 = sprite_add(string(global.path_to_use) + "background1.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "background1.jpeg"))
		{
			global.custom_background1 = sprite_add(string(global.path_to_use) + "background1.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_background1 != "" && file_exists("levels/" + string(global.default_background1) + "/background/background1.png"))
		{
			global.custom_background1 = sprite_add("levels/" + string(global.default_background1) + "/background/background1.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_background1 = noone;
		}
		show_debug_message("Update Background1");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Background1 END */
	
	#region /* Update Background2 */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "background2.png"))
		{
			global.custom_background2 = sprite_add(string(global.path_to_use) + "background2.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "background2.bmp"))
		{
			global.custom_background2 = sprite_add(string(global.path_to_use) + "background2.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "background2.gif"))
		{
			global.custom_background2 = sprite_add(string(global.path_to_use) + "background2.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "background2.jpg"))
		{
			global.custom_background2 = sprite_add(string(global.path_to_use) + "background2.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "background2.jpeg"))
		{
			global.custom_background2 = sprite_add(string(global.path_to_use) + "background2.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_background2 != "" && file_exists("levels/" + string(global.default_background2) + "/background/background2.png"))
		{
			global.custom_background2 = sprite_add("levels/" + string(global.default_background2) + "/background/background2.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_background2 = noone;
		}
		show_debug_message("Update Background2");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Background2 END */
	
	#region /* Update Background3 */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "background3.png"))
		{
			global.custom_background3 = sprite_add(string(global.path_to_use) + "background3.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "background3.bmp"))
		{
			global.custom_background3 = sprite_add(string(global.path_to_use) + "background3.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "background3.gif"))
		{
			global.custom_background3 = sprite_add(string(global.path_to_use) + "background3.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "background3.jpg"))
		{
			global.custom_background3 = sprite_add(string(global.path_to_use) + "background3.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "background3.jpeg"))
		{
			global.custom_background3 = sprite_add(string(global.path_to_use) + "background3.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_background3 != "" && file_exists("levels/" + string(global.default_background3) + "/background/background3.png"))
		{
			global.custom_background3 = sprite_add("levels/" + string(global.default_background3) + "/background/background3.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_background3 = noone;
		}
		show_debug_message("Update Background3");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Background3 END */
	
	#region /* Update Background4 */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "background4.png"))
		{
			global.custom_background4 = sprite_add(string(global.path_to_use) + "background4.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "background4.bmp"))
		{
			global.custom_background4 = sprite_add(string(global.path_to_use) + "background4.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "background4.gif"))
		{
			global.custom_background4 = sprite_add(string(global.path_to_use) + "background4.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "background4.jpg"))
		{
			global.custom_background4 = sprite_add(string(global.path_to_use) + "background4.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "background4.jpeg"))
		{
			global.custom_background4 = sprite_add(string(global.path_to_use) + "background4.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_background4 != "" && file_exists("levels/" + string(global.default_background4) + "/background/background4.png"))
		{
			global.custom_background4 = sprite_add("levels/" + string(global.default_background4) + "/background/background4.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_background4 = noone;
		}
		show_debug_message("Update Background4");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Background4 END */
	
	#region /* Update Foreground1 */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "foreground1.png"))
		{
			global.custom_foreground1 = sprite_add(string(global.path_to_use) + "foreground1.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "foreground1.bmp"))
		{
			global.custom_foreground1 = sprite_add(string(global.path_to_use) + "foreground1.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "foreground1.gif"))
		{
			global.custom_foreground1 = sprite_add(string(global.path_to_use) + "foreground1.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "foreground1.jpg"))
		{
			global.custom_foreground1 = sprite_add(string(global.path_to_use) + "foreground1.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "foreground1.jpeg"))
		{
			global.custom_foreground1 = sprite_add(string(global.path_to_use) + "foreground1.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_foreground1 != "" && file_exists("levels/" + string(global.default_foreground1) + "/background/foreground1.png"))
		{
			global.custom_foreground1 = sprite_add("levels/" + string(global.default_foreground1) + "/background/foreground1.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_foreground1 = noone;
		}
		show_debug_message("Update Foreground1");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Foreround1 END */
	
	#region /* Update Foreground 1.5 */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "foreground1_5.png"))
		{
			global.custom_foreground1_5 = sprite_add(string(global.path_to_use) + "foreground1_5.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "foreground1_5.bmp"))
		{
			global.custom_foreground1_5 = sprite_add(string(global.path_to_use) + "foreground1_5.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "foreground1_5.gif"))
		{
			global.custom_foreground1_5 = sprite_add(string(global.path_to_use) + "foreground1_5.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "foreground1_5.jpg"))
		{
			global.custom_foreground1_5 = sprite_add(string(global.path_to_use) + "foreground1_5.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "foreground1_5.jpeg"))
		{
			global.custom_foreground1_5 = sprite_add(string(global.path_to_use) + "foreground1_5.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_foreground1_5 != "" && file_exists("levels/" + string(global.default_foreground1_5) + "/background/foreground1_5.png"))
		{
			global.custom_foreground1_5 = sprite_add("levels/" + string(global.default_foreground1_5) + "/background/foreground1_5.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_foreground1_5 = noone;
		}
		show_debug_message("Update Foreground 1.5");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Foreround 1.5 END */
	
	#region /* Update Foreground2 */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "foreground2.png"))
		{
			global.custom_foreground2 = sprite_add(string(global.path_to_use) + "foreground2.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "foreground2.bmp"))
		{
			global.custom_foreground2 = sprite_add(string(global.path_to_use) + "foreground2.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "foreground2.gif"))
		{
			global.custom_foreground2 = sprite_add(string(global.path_to_use) + "foreground2.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "foreground2.jpg"))
		{
			global.custom_foreground2 = sprite_add(string(global.path_to_use) + "foreground2.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "foreground2.jpeg"))
		{
			global.custom_foreground2 = sprite_add(string(global.path_to_use) + "foreground2.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_foreground2 != "" && file_exists("levels/" + string(global.default_foreground2) + "/background/foreground2.png"))
		{
			global.custom_foreground2 = sprite_add("levels/" + string(global.default_foreground2) + "/background/foreground2.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_foreground2 = noone;
		}
		show_debug_message("Update Foreground2");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Foreround2 END */
	
	#region /* Update Foreground secret */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		/* PNG small letter File */ if (file_exists(string(global.path_to_use) + "foreground_secret.png"))
		{
			global.custom_foreground_secret = sprite_add(string(global.path_to_use) + "foreground_secret.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(global.path_to_use) + "foreground_secret.bmp"))
		{
			global.custom_foreground_secret = sprite_add(string(global.path_to_use) + "foreground_secret.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(global.path_to_use) + "foreground_secret.gif"))
		{
			global.custom_foreground_secret = sprite_add(string(global.path_to_use) + "foreground_secret.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(global.path_to_use) + "foreground_secret.jpg"))
		{
			global.custom_foreground_secret = sprite_add(string(global.path_to_use) + "foreground_secret.jpg", 0, false, false, 0, 0);
		}
		else
		/* JPEG small letter File */ if (file_exists(string(global.path_to_use) + "foreground_secret.jpeg"))
		{
			global.custom_foreground_secret = sprite_add(string(global.path_to_use) + "foreground_secret.jpeg", 0, false, false, 0, 0);
		}
		else
		if (global.default_foreground_secret != "" && file_exists("levels/" + string(global.default_foreground_secret) + "/background/foreground_secret.png"))
		{
			global.custom_foreground_secret = sprite_add("levels/" + string(global.default_foreground_secret) + "/background/foreground_secret.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_foreground_secret = noone;
		}
		show_debug_message("Update Foreground secret");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Foreround secret END */
	
	#endregion /* Update All Backgrounds END */
	
	#region /* Update Level Tileset */
	var time_source = time_source_create(time_source_game, time_source_period, time_source_units_frames, function(){
		if (global.character_select_in_this_menu == "main_game" && file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
		{
			global.custom_tileset = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
		}
		else
		if (global.character_select_in_this_menu == "level_editor" && file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/tilesets/tileset_default.png"))
		{
			global.custom_tileset = sprite_add(global.use_cache_or_working + "custom_levels/" + global.level_name + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_tileset = noone;
		}
		show_debug_message("Update Level Tileset");
	}, [], 1);
	time_source_start(time_source); time_source_period += 1;
	#endregion /* Update Level Tileset END */
	
}