function scr_update_all_backgrounds()
{
	#region /* Debug toggles */
	var can_update_all_backgrounds = true;
	#endregion /* Debug toggles END */
	
	if (global.can_load_official_and_custom_resources == true)
	and (can_update_all_backgrounds == true)
	{
		
		#region /* Update All Backgrounds */
		
		scr_delete_sprite_properly(global.custom_background1);
		scr_delete_sprite_properly(global.custom_background2);
		scr_delete_sprite_properly(global.custom_background3);
		scr_delete_sprite_properly(global.custom_background4);
		scr_delete_sprite_properly(global.custom_foreground1);
		scr_delete_sprite_properly(global.custom_foreground_above_static_objects);
		scr_delete_sprite_properly(global.custom_foreground2);
		scr_delete_sprite_properly(global.custom_foreground_secret);
		
		if (global.character_select_in_this_menu == "main_game")
		{
			var path = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/backgrounds/";
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var path = working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds/";
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
		{
			global.custom_foreground1 = noone;
		}	
		#endregion /* Update Foreround1 END */
		
		#region /* Update Foreground above static objects official */
		/* PNG small letter File */ if (file_exists(string(path) + "foreground_above_static_objects.png"))
		{
			global.custom_foreground_above_static_objects = sprite_add(string(path) + "foreground_above_static_objects.png", 0, false, false, 0, 0);
		}
		else
		/* BMP small letter File */ if (file_exists(string(path) + "foreground_above_static_objects.bmp"))
		{
			global.custom_foreground_above_static_objects = sprite_add(string(path) + "foreground_above_static_objects.bmp", 0, false, false, 0, 0);
		}
		else
		/* GIF small letter File */ if (file_exists(string(path) + "foreground_above_static_objects.gif"))
		{
			global.custom_foreground_above_static_objects = sprite_add(string(path) + "foreground_above_static_objects.gif", 0, false, false, 0, 0);
		}
		else
		/* JPG small letter File */ if (file_exists(string(path) + "foreground_above_static_objects.jpg"))
		{
			global.custom_foreground_above_static_objects = sprite_add(string(path) + "foreground_above_static_objects.jpg", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_foreground_above_static_objects = noone;
		}
		#endregion /* Update Foreround1 END */
		
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
		{
			global.custom_foreground2 = noone;
		}	
		#endregion /* Update Foreround1 END */
		
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
		{
			global.custom_foreground_secret = noone;
		}	
		#endregion /* Update Foreround secret END */
		
		#endregion /* Update All Backgrounds END */
		
		#region /* Load Level Tileset File */
		scr_delete_sprite_properly(global.custom_tileset);
		if (global.character_select_in_this_menu == "main_game")
		and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png"))
		{
			global.custom_tileset = sprite_add("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png"))
		{
			global.custom_tileset = sprite_add(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets/tileset_default.png", 0, false, false, 0, 0);
		}
		else
		{
			global.custom_tileset = noone;
		}
		#endregion /* Load Level Tileset File END */
		
	}
}