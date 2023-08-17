function scr_update_all_backgrounds()
{
	
	#region /* Get default backgrounds if they exist */
	ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	var default_background1 = ini_read_string("info", "default_background1", "level1");
	var default_background2 = ini_read_string("info", "default_background2", "level1");
	var default_background3 = ini_read_string("info", "default_background3", "level1");
	var default_background4 = ini_read_string("info", "default_background4", "level1");
	var default_foreground1 = ini_read_string("info", "default_foreground1", "");
	var default_foreground1_5 = ini_read_string("info", "default_foreground1_5", "");
	var default_foreground2 = ini_read_string("info", "default_foreground2", "");
	var default_foreground_secret = ini_read_string("info", "default_foreground_secret", "");
	ini_close();
	#endregion /* Get default backgrounds if they exist END */
	
	#region /* Update All Backgrounds */
	
	scr_delete_sprite_properly(global.custom_background1);
	scr_delete_sprite_properly(global.custom_background2);
	scr_delete_sprite_properly(global.custom_background3);
	scr_delete_sprite_properly(global.custom_background4);
	scr_delete_sprite_properly(global.custom_foreground1);
	scr_delete_sprite_properly(global.custom_foreground1_5);
	scr_delete_sprite_properly(global.custom_foreground2);
	scr_delete_sprite_properly(global.custom_foreground_secret);
	
	if (global.character_select_in_this_menu == "main_game")
	{
		var path = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/background/";
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		var path = working_directory + "custom_levels/" + string(global.level_name) + "/background/";
	}
	
	#region /* Update Background1 */
	/* PNG small letter File */ if (file_exists(string(path) + "background1.png"))
	{
		global.custom_background1 = sprite_add(string(path) + "background1.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "background1.bmp"))
	{
		global.custom_background1 = sprite_add(string(path) + "background1.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "background1.gif"))
	{
		global.custom_background1 = sprite_add(string(path) + "background1.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "background1.jpg"))
	{
		global.custom_background1 = sprite_add(string(path) + "background1.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_background1 != "" && file_exists("levels/" + string(default_background1) + "/background/background1.png"))
	{
		global.custom_background1 = sprite_add("levels/" + string(default_background1) + "/background/background1.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_background1 = noone;
	}
	#endregion /* Update Background1 END */
	
	#region /* Update Background2 */
	/* PNG small letter File */ if (file_exists(string(path) + "background2.png"))
	{
		global.custom_background2 = sprite_add(string(path) + "background2.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "background2.bmp"))
	{
		global.custom_background2 = sprite_add(string(path) + "background2.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "background2.gif"))
	{
		global.custom_background2 = sprite_add(string(path) + "background2.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "background2.jpg"))
	{
		global.custom_background2 = sprite_add(string(path) + "background2.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_background2 != "" && file_exists("levels/" + string(default_background2) + "/background/background2.png"))
	{
		global.custom_background2 = sprite_add("levels/" + string(default_background2) + "/background/background2.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_background2 = noone;
	}
	#endregion /* Update Background2 END */
	
	#region /* Update Background3 */
	/* PNG small letter File */ if (file_exists(string(path) + "background3.png"))
	{
		global.custom_background3 = sprite_add(string(path) + "background3.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "background3.bmp"))
	{
		global.custom_background3 = sprite_add(string(path) + "background3.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "background3.gif"))
	{
		global.custom_background3 = sprite_add(string(path) + "background3.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "background3.jpg"))
	{
		global.custom_background3 = sprite_add(string(path) + "background3.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_background3 != "" && file_exists("levels/" + string(default_background3) + "/background/background3.png"))
	{
		global.custom_background3 = sprite_add("levels/" + string(default_background3) + "/background/background3.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_background3 = noone;
	}
	#endregion /* Update Background3 END */
	
	#region /* Update Background4 */
	/* PNG small letter File */ if (file_exists(string(path) + "background4.png"))
	{
		global.custom_background4 = sprite_add(string(path) + "background4.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "background4.bmp"))
	{
		global.custom_background4 = sprite_add(string(path) + "background4.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "background4.gif"))
	{
		global.custom_background4 = sprite_add(string(path) + "background4.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "background4.jpg"))
	{
		global.custom_background4 = sprite_add(string(path) + "background4.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_background4 != "" && file_exists("levels/" + string(default_background4) + "/background/background4.png"))
	{
		global.custom_background4 = sprite_add("levels/" + string(default_background4) + "/background/background4.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_background4 = noone;
	}
	#endregion /* Update Background4 END */
	
	#region /* Update Foreground1 */
	/* PNG small letter File */ if (file_exists(string(path) + "foreground1.png"))
	{
		global.custom_foreground1 = sprite_add(string(path) + "foreground1.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add(string(path) + "foreground1.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add(string(path) + "foreground1.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add(string(path) + "foreground1.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_foreground1 != "" && file_exists("levels/" + string(default_foreground1) + "/background/foreground1.png"))
	{
		global.custom_foreground1 = sprite_add("levels/" + string(default_foreground1) + "/background/foreground1.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_foreground1 = noone;
	}	
	#endregion /* Update Foreround1 END */
	
	#region /* Update Foreground 1.5 official */
	/* PNG small letter File */ if (file_exists(string(path) + "foreground1_5.png"))
	{
		global.custom_foreground1_5 = sprite_add(string(path) + "foreground1_5.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "foreground1_5.bmp"))
	{
		global.custom_foreground1_5 = sprite_add(string(path) + "foreground1_5.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "foreground1_5.gif"))
	{
		global.custom_foreground1_5 = sprite_add(string(path) + "foreground1_5.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "foreground1_5.jpg"))
	{
		global.custom_foreground1_5 = sprite_add(string(path) + "foreground1_5.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_foreground1_5 != "" && file_exists("levels/" + string(default_foreground1_5) + "/background/foreground1_5.png"))
	{
		global.custom_foreground1_5 = sprite_add("levels/" + string(default_foreground1_5) + "/background/foreground1_5.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_foreground1_5 = noone;
	}
	#endregion /* Update Foreround 1.5 END */
	
	#region /* Update Foreground2 */
	/* PNG small letter File */ if (file_exists(string(path) + "foreground2.png"))
	{
		global.custom_foreground2 = sprite_add(string(path) + "foreground2.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "foreground2.bmp"))
	{
		global.custom_foreground2 = sprite_add(string(path) + "foreground2.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "foreground2.gif"))
	{
		global.custom_foreground2 = sprite_add(string(path) + "foreground2.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "foreground2.jpg"))
	{
		global.custom_foreground2 = sprite_add(string(path) + "foreground2.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_foreground2 != "" && file_exists("levels/" + string(default_foreground2) + "/background/foreground2.png"))
	{
		global.custom_foreground2 = sprite_add("levels/" + string(default_foreground2) + "/background/foreground2.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_foreground2 = noone;
	}	
	#endregion /* Update Foreround2 END */
	
	#region /* Update Foreground secret */
	/* PNG small letter File */ if (file_exists(string(path) + "foreground_secret.png"))
	{
		global.custom_foreground_secret = sprite_add(string(path) + "foreground_secret.png", 0, false, false, 0, 0);
	}
	else
	/* BMP small letter File */ if (file_exists(string(path) + "foreground_secret.bmp"))
	{
		global.custom_foreground_secret = sprite_add(string(path) + "foreground_secret.bmp", 0, false, false, 0, 0);
	}
	else
	/* GIF small letter File */ if (file_exists(string(path) + "foreground_secret.gif"))
	{
		global.custom_foreground_secret = sprite_add(string(path) + "foreground_secret.gif", 0, false, false, 0, 0);
	}
	else
	/* JPG small letter File */ if (file_exists(string(path) + "foreground_secret.jpg"))
	{
		global.custom_foreground_secret = sprite_add(string(path) + "foreground_secret.jpg", 0, false, false, 0, 0);
	}
	else
	if (default_foreground_secret != "" && file_exists("levels/" + string(default_foreground_secret) + "/background/foreground_secret.png"))
	{
		global.custom_foreground_secret = sprite_add("levels/" + string(default_foreground_secret) + "/background/foreground_secret.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_foreground_secret = noone;
	}	
	#endregion /* Update Foreround secret END */
	
	#endregion /* Update All Backgrounds END */
	
	#region /* Load Level Tileset File */
	scr_delete_sprite_properly(global.custom_tileset);
	if (global.character_select_in_this_menu == "main_game" && file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
	{
		global.custom_tileset = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
	}
	else
	if (global.character_select_in_this_menu == "level_editor" && file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png"))
	{
		global.custom_tileset = sprite_add(working_directory + "custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
	}
	else
	{
		global.custom_tileset = noone;
	}
	#endregion /* Load Level Tileset File END */
	
	scr_make_background_visible();
}