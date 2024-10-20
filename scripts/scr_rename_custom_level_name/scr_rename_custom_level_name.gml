function scr_rename_custom_level_name()
{
	
	#region /* Save the newly entered name */
	ini_open(game_save_id + "save_file/custom_level_save.ini");
	ini_section_delete(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	
	/* For actual folder name, replace illegal characters with underscore only for naming folder */
	var folder_name = global.level_name;
	folder_name = scr_replace_illegal_characters(folder_name);
	
	/* To rename the level, need to copy level files into new named folder */
	scr_copy_move_files(
	game_save_id + "custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)),
	game_save_id + "custom_levels/" + folder_name, true); /* Need to write the entire path here instead of using variable, because the level name changes mid-code */
	
	if (global.level_name != "")
	{
		ini_open(game_save_id + "custom_levels/" + folder_name + "/data/level_information.ini");
		ini_write_string("info", "level_name", global.level_name); /* Write the actual unfiltered level name you typed */
		if (creating_daily_build)
		{
			ini_write_real("info", "if_daily_build", true);
		}
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		thumbnail_level_name[global.select_level_index] = global.level_name;
	}
	
	global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, folder_name); /* After renaming a level, make sure "select level index" is updated */
	global.level_name = folder_name; /* Set the global level name to the filtered level name, because it will be reading filtered folder names */
	
	#endregion /* Save the newly entered name END */
	
	#region /* Properly reload all levels so the level with a new name can be initialized */
	scr_load_custom_level_initializing();
	
	for(var i = 1; i <= global.max_players; i ++)
	{
		can_input_player_name[i] = 2;
		player_accept_selection[i] = false;
	}
	
	can_navigate = true;
	menu_delay = 3;
	open_sub_menu = false;
	show_level_editor_corner_menu = true;
	file_found = "";
	level_editor_edit_name = false;
	
	menu = "load_custom_level";
	#endregion /* Properly reload all levels so the level with a new name can be initialized END */
	
}