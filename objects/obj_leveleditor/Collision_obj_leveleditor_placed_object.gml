if (!global.actually_play_edited_level)
{
	with (other)
	{
		if (!obj_leveleditor.pause)
		&& (obj_leveleditor.mouse_use_grab_cursor)
		&& (!obj_leveleditor.drag_object)
		&& (obj_leveleditor.quit_level_editor == 0)
		{
			hover_over_object_indicator = true;
		}
		
		#region /* All code before initializing the object */
		
		if (delay < 3)
		{
			delay ++;
		}
		
		if (instance_exists(obj_leveleditor))
		&& (delay == 3)
		&& (!obj_leveleditor.pause)
		{
			
			#region /* Destroy if erased */
			if (instance_exists(obj_level_player1_start))
			&& (place_meeting(x, y, obj_level_player1_start))
			&& (instance_exists(obj_level_player2_start))
			&& (place_meeting(x, y, obj_level_player2_start))
			&& (instance_exists(obj_level_player3_start))
			&& (place_meeting(x, y, obj_level_player3_start))
			&& (instance_exists(obj_level_player4_start))
			&& (place_meeting(x, y, obj_level_player4_start))
			&& (!obj_leveleditor.drag_object)
			&& (!obj_level_player1_start.drag_object)
			&& (!obj_level_player2_start.drag_object)
			&& (!obj_level_player3_start.drag_object)
			&& (!obj_level_player4_start.drag_object)
			{
				
				#region /* Reset Level Editor Checkpoint */
				if (room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "level_editor")
				{
					ini_open(working_directory + "save_file/custom_level_save.ini");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_x");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_y");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_millisecond");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_second");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_minute");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_realmillisecond");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_direction");
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */			
				}
				#endregion /* Reset Level Editor Checkpoint END */
				
				instance_destroy();
			}
			#endregion /* Destroy if erased END */
			
		}
		
		if (mouse_check_button_released(mb_left))
		|| (instance_exists(obj_leveleditor))
		&& (obj_leveleditor.key_a_released)
		{
			placed_for_the_first_time = false;
		}

		#endregion /* All code before initializing the object */
		
	}
}