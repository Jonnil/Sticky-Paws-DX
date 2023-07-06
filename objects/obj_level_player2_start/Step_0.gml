var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

if (global.play_edited_level)
{
	visible = false;
}

#region /* Push yourself out of other level start objects way */
if (instance_exists(obj_level_player1_start))
&& (place_meeting(x, y, obj_level_player1_start))
&& (obj_level_player1_start.drag_object == false)
{
	x -= 32;
}
#endregion /* Push yourself out of other level start objects way END */

#region /* Drag Object */
if (instance_exists(obj_leveleditor))
&& (obj_leveleditor.pause == false)
{
	if (!keyboard_check(vk_space))
	&& (!mouse_check_button(mb_middle))
	&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	{
		if (mouse_check_button_pressed(mb_left))
		|| (obj_leveleditor.key_a_pressed)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			{
				if (drag_object < true)
				{
					drag_object = true;
					obj_leveleditor.drag_object = true;
				}
			}
		}
	}
	
	#region /* Drag the object */
	if (drag_object)
	&& (instance_exists(obj_leveleditor))
	{
		x = obj_leveleditor.x;
		y = obj_leveleditor.y;
	}
	#endregion /* Drag the object END */
	
	#region /* Release the object */
	if (mouse_check_button_released(mb_left))
	|| (obj_leveleditor.key_a_released)
	{
		if (drag_object)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
}
#endregion /* Release the object END */

#endregion /* Drag Object END */

if (drag_release_timer > 0)
{
	drag_release_timer --;
}
else
{
	if (drag_object == 0.5)
	{
		drag_object = false;
		move_snap(32, 32);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (x < 0 + sprite_width - 32)
{
	x = 0 + sprite_width - 32
}
if (x > room_width)
{
	x = room_width;
}
if (y < 64)
{
	y = 64
}
if (y > room_height)
{
	y = room_height;
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */

if (global.play_edited_level)
|| (global.actually_play_edited_level)
{
	if (global.actually_play_edited_level)
	{
		if (!instance_exists(obj_camera))
		{
			
			#region /* Load Custom Level Checkpoint */
			if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
			&& (global.character_select_in_this_menu == "main_game")
			|| (file_exists(working_directory + "custom_level_save.ini"))
			&& (global.character_select_in_this_menu == "level_editor")
			{
				if (global.character_select_in_this_menu == "main_game")
				{
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_x"))
					{
						global.checkpoint_x = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_x", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_y"))
					{
						global.checkpoint_y = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_y", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_millisecond"))
					{
						global.checkpoint_millisecond = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_millisecond", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_second"))
					{
						global.checkpoint_second = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_second", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_minute"))
					{
						global.checkpoint_minute = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_minute", 0);
					}
					if (ini_key_exists(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_realmillisecond"))
					{
						global.checkpoint_realmillisecond = ini_read_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
					}
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				else
				if (global.character_select_in_this_menu == "level_editor")
				{
					ini_open(working_directory + "custom_level_save.ini");
					if (ini_key_exists(string(global.level_name), "checkpoint_x"))
					{
						global.checkpoint_x = ini_read_real(string(global.level_name), "checkpoint_x", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_y"))
					{
						global.checkpoint_y = ini_read_real(string(global.level_name), "checkpoint_y", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_millisecond"))
					{
						global.checkpoint_millisecond = ini_read_real(string(global.level_name), "checkpoint_millisecond", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_second"))
					{
						global.checkpoint_second = ini_read_real(string(global.level_name), "checkpoint_second", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_minute"))
					{
						global.checkpoint_minute = ini_read_real(string(global.level_name), "checkpoint_minute", 0);
					}
					if (ini_key_exists(string(global.level_name), "checkpoint_realmillisecond"))
					{
						global.checkpoint_realmillisecond = ini_read_real(string(global.level_name), "checkpoint_realmillisecond", 0);
					}
					ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
				}
				
				if (global.checkpoint_x > 0)
				|| (global.checkpoint_y > 0)
				{
					camera_set_view_pos(view_camera[view_current], global.checkpoint_x, global.checkpoint_y); /* Set camera position to be on the last used checkpoint position */
					instance_activate_object(obj_camera);
					instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_camera);
				}
			}
			#endregion /* Load Checkpoint END */
			
		}
	}
	
	#region /* Destroy the level player 2 start if player 2 has spawned in the level */
	if (instance_exists(obj_camera))
	{
		instance_destroy();
	}
	#endregion /* Destroy the level player 2 start if player 2 has spawned in the level END */
	
}