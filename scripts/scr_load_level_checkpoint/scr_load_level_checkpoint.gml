function scr_load_level_checkpoint()
{
	
	#region /* Load Level Checkpoint */
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		global.level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)); /* Set the global level name variable to take from loaded main level */
	}
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(working_directory + "custom_level_save.ini");
	}
	global.checkpoint_x = ini_read_real(global.level_name, "checkpoint_x", 0);
	global.checkpoint_y = ini_read_real(global.level_name, "checkpoint_y", 0);
	global.checkpoint_millisecond = ini_read_real(global.level_name, "checkpoint_millisecond", 0);
	global.checkpoint_second = ini_read_real(global.level_name, "checkpoint_second", 0);
	global.checkpoint_minute = ini_read_real(global.level_name, "checkpoint_minute", 0);
	global.checkpoint_realmillisecond = ini_read_real(global.level_name, "checkpoint_realmillisecond", 0);
	ini_close(); /* Only reading save data */
	if (!instance_exists(obj_camera))
	{
		if (global.checkpoint_x > 0 || global.checkpoint_y > 0)
		{
			camera_set_view_pos(view_camera[view_current], global.checkpoint_x, global.checkpoint_y); /* Set camera position to be on the last used checkpoint position */
			instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_camera);
		}
		else
		{
			camera_set_view_pos(view_camera[view_current], x, y); /* Set camera position to be on the x and y position */
			instance_create_depth(x, y, 0, obj_camera);
		}
	}
	#endregion /* Load Level Checkpoint END */
	
}