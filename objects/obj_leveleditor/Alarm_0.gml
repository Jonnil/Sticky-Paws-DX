if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[camera_player])) + "/data/sprite_origin_point.ini"))
or(file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[camera_player])) + "/data/sprite_origin_point.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[camera_player])) + "/data/sprite_origin_point.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[camera_player])) + "/data/sprite_origin_point.ini");
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[camera_player])) + "/data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[camera_player])) + "/data/sprite_origin_point.ini");
	}
	
	#region /*sprite x and y origin points*/
	#region /*sprite y origin point*/
	if (ini_key_exists("sprite origin points", "lives_icon_yorig"))
	{
		lives_icon_yorig = ini_read_real("sprite origin points", "lives_icon_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "lives_icon_yorig", 0);
		lives_icon_yorig = 0;
	}
	#endregion /*sprite y origin point END*/

	#region /*sprite x origin point*/
	if (ini_key_exists("sprite origin points", "lives_icon_xorig"))
	{
		lives_icon_xorig = ini_read_real("sprite origin points", "lives_icon_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "lives_icon_xorig", 0);
		lives_icon_xorig = 0;
	}
	#endregion /*sprite x origin point END*/
	#endregion /*sprite x and y origin points END*/
	
	ini_close();
}
else
{
	lives_icon_xorig = 0;
	lives_icon_yorig = 0;
}

sprite_lives_icon = scr_initialize_custom_character_select_sprite("lives_icon", sprite_lives_icon, lives_icon_xorig, lives_icon_yorig, camera_player, camera_selected_skin);