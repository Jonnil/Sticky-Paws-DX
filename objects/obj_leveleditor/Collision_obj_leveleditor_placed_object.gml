if (global.actually_play_edited_level == false)
{
	with (other)
	{
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		
		/* Insert code that checks if view is moving, only then should the transparency difficulty layers be updated. For now just have it be in step event */
		scr_make_sprite_transparent_setting_difficulty_levels();
		
		#region /* All code before initializing the object */
		
		#region /* Make object change difficulty layer depending on what difficulty layer is selected */
		if (asset_get_type("obj_leveleditor") == asset_object)
		and (instance_exists(obj_leveleditor))
		and (variable_instance_exists(obj_leveleditor, "difficulty_layer"))
		and (obj_leveleditor.difficulty_layer > 0)
		and (variable_instance_exists(obj_leveleditor, "drag_object"))
		and (obj_leveleditor.drag_object == false)
		and (variable_instance_exists(obj_leveleditor, "pause"))
		and (obj_leveleditor.pause == false)
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (!keyboard_check(vk_space))
		and (!mouse_check_button(mb_middle))
		{
			if (obj_leveleditor.erase_mode == true)
			and (mouse_check_button(mb_left))
			or (mouse_check_button(mb_right))
			or (instance_exists(obj_leveleditor))
			and (obj_leveleditor.erase_mode == true)
			and (obj_leveleditor.key_a_hold)
			or (instance_exists(obj_leveleditor))
			and (obj_leveleditor.key_b_hold)
			{
				if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			
				/* Erase brush size 1 */
				or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
				or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
				or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
				/* Erase brush size 1 END */
			
				/* Erase brush size 2 */
				or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
				or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
				or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
				or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
				or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
				/* Erase brush size 2 END */
			
				/* Erase brush size 3 */
				or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
				or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
				or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
				or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
				or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
				or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
				or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
				/* Erase brush size 3 END */
			
				/* Erase brush size 4 */
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
				or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
				/* Erase brush size 4 END */
			
				/* Erase brush size 5 */
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
				or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
				/* Erase brush size 5 END */
			
				{
					if (obj_leveleditor.difficulty_layer == 1)
					{
						if (easy == true)
						{
							easy = false;
						}
					}
					else
					if (obj_leveleditor.difficulty_layer == 2)
					{
						if (normal == true)
						{
							normal = false;
						}
					}
					else
					if (obj_leveleditor.difficulty_layer == 3)
					{
						if (hard == true)
						{
							hard = false;
						}
					}
				}
			}
		}
		#endregion /* Make object change difficulty layer depending on what difficulty layer is selected END */
		
		if (delay < 3)
		{
			delay += 1;
		}
		
		if (asset_get_type("obj_leveleditor") == asset_object)
		and (instance_exists(obj_leveleditor))
		and (delay == 3)
		and (variable_instance_exists(obj_leveleditor, "pause"))
		and (obj_leveleditor.pause == false)
		{
			
			#region /* Destroy if erased */
			if (asset_get_type("obj_level_player_1_start") == asset_object)
			and (instance_exists(obj_level_player_1_start))
			and (place_meeting(x, y, obj_level_player_1_start))
			and (asset_get_type("obj_level_player_2_start") == asset_object)
			and (instance_exists(obj_level_player_2_start))
			and (place_meeting(x, y, obj_level_player_2_start))
			and (asset_get_type("obj_level_player_3_start") == asset_object)
			and (instance_exists(obj_level_player_3_start))
			and (place_meeting(x, y, obj_level_player_3_start))
			and (asset_get_type("obj_level_player_4_start") == asset_object)
			and (instance_exists(obj_level_player_4_start))
			and (place_meeting(x, y, obj_level_player_4_start))
			and (obj_leveleditor.drag_object == false)
			and (obj_level_player_1_start.drag_object == false)
			and (obj_level_player_2_start.drag_object == false)
			and (obj_level_player_3_start.drag_object == false)
			and (obj_level_player_4_start.drag_object == false)
			{
				
				#region /* Reset Level Editor Checkpoint */
				if (asset_get_type("room_leveleditor") == asset_room)
				and (room == room_leveleditor)
				and (global.character_select_in_this_menu == "level_editor")
				{
					ini_open(working_directory + "/save_files/custom_level_save.ini");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_x");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_y");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_millisecond");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_second");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_minute");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_realmillisecond");
					ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_direction");
					ini_close();			
				}
				#endregion /* Reset Level Editor Checkpoint END */
				
				instance_destroy();
			}
			#endregion /* Destroy if erased END */
			
		}
		
		#region /* Delete / Erase Objects */
		if (asset_get_type("obj_leveleditor") == asset_object)
		and (instance_exists(obj_leveleditor))
		and (variable_instance_exists(obj_leveleditor, "difficulty_layer"))
		and (obj_leveleditor.difficulty_layer == 0)
		and (variable_instance_exists(obj_leveleditor, "drag_object"))
		and (obj_leveleditor.drag_object == false)
		and (variable_instance_exists(obj_leveleditor, "erase_mode"))
		and (obj_leveleditor.erase_mode == true)
		and (variable_instance_exists(obj_leveleditor, "scroll_view"))
		and (obj_leveleditor.scroll_view == false)
		and (variable_instance_exists(obj_leveleditor, "pause"))
		and (obj_leveleditor.pause == false)
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64))
		and (!keyboard_check(vk_space))
		and (!mouse_check_button(mb_middle))
		{
			if (obj_leveleditor.set_difficulty_mode == true)
			and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
			or (obj_leveleditor.set_difficulty_mode == false)
			and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
			{
				if (mouse_check_button(mb_right))
				or (mouse_check_button(mb_left))
				or (instance_exists(obj_leveleditor))
				and (obj_leveleditor.key_a_hold)
				or (instance_exists(obj_leveleditor))
				and (obj_leveleditor.key_b_hold)
				{
					if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			
					/* Erase brush size 1 */
					or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
					or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
					or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
					/* Erase brush size 1 END */
			
					/* Erase brush size 2 */
					or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
					or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
					or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
					or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
					or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
					/* Erase brush size 2 END */
			
					/* Erase brush size 3 */
					or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
					or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
					or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
					or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
					or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
					or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
					or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
					/* Erase brush size 3 END */
			
					/* Erase brush size 4 */
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
					or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
					/* Erase brush size 4 END */
			
					/* Erase brush size 5 */
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
					or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
					/* Erase brush size 5 END */
			
					{
						audio_sound_pitch(snd_leveleditor_erase_object, random_range(0.9, 1.1));
						scr_audio_play(snd_leveleditor_erase_object, volume_source.sound);
						with(obj_leveleditor)
						{
							move_snap(global.grid_hsnap, global.grid_vsnap); /* Make sure to always move snap */
						}
						instance_destroy();
					}
				}
			}
		}
		#endregion /* Delete / Erase Objects END */
		
		if (mouse_check_button_released(mb_left))
		or (instance_exists(obj_leveleditor))
		and (obj_leveleditor.key_a_released)
		{
			placed_for_the_first_time = false;
		}

		#endregion /* All code before initializing the object */
		
		#region /* Difficulty settings per object */
		
		#region /* Set to appear on difficulty level */
		if (!mouse_check_button(mb_right))
		and (instance_exists(obj_leveleditor))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (mouse_check_button(mb_left))
		and (obj_leveleditor.drag_object == false)
		and (obj_leveleditor.erase_mode == false)
		and (obj_leveleditor.pause == false)
		
		or (instance_exists(obj_leveleditor))
		and (!obj_leveleditor.key_b_hold)
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (obj_leveleditor.drag_object == false)
		and (obj_leveleditor.erase_mode == false)
		and (obj_leveleditor.key_a_hold)
		and (obj_leveleditor.pause == false)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			
			/* Place Brush Size 1 */
			or (obj_leveleditor.place_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
			or (obj_leveleditor.place_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.place_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
			/* Place Brush Size 1 END */
			
			/* Place Brush Size 2 */
			or (obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
			or (obj_leveleditor.place_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
			/* Place Brush Size 2 END */
			
			/* Place Brush Size 3 */
			or (obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
			or (obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.place_brush_size >= 3) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
			/* Place Brush Size 3 END */
			
			/* Place Brush Size 4 */
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.place_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
			/* Place Brush Size 4 END */
			
			/* Place Brush Size 5 */
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.place_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
			/* Place Brush Size 5 END */
			
			{
				if (obj_leveleditor.difficulty_layer == 1)
				and (obj_leveleditor.set_difficulty_mode == true)
				{
					if (easy == false)
					{
						easy = true;
						placed_for_the_first_time = true;
					}
				}
				else
				if (obj_leveleditor.difficulty_layer == 2)
				and (obj_leveleditor.set_difficulty_mode == true)
				{
					if (normal == false)
					{
						normal = true;
						placed_for_the_first_time = true;
					}
				}
				else
				if (obj_leveleditor.difficulty_layer == 3)
				and (obj_leveleditor.set_difficulty_mode == true)
				{
					if (hard == false)
					{
						hard = true;
						placed_for_the_first_time = true;
					}
				}
			}
		}
		#endregion /* Set to appear on difficulty level END */
		
		#region /* Set to dissapear on difficulty level */
		if (!mouse_check_button(mb_left))
		and (instance_exists(obj_leveleditor))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (mouse_check_button(mb_right))
		and (obj_leveleditor.pause == false)
		
		or (instance_exists(obj_leveleditor))
		and (!obj_leveleditor.key_a_hold)
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and (obj_leveleditor.key_b_hold)
		and (obj_leveleditor.pause == false)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			/* erase_brush_size >= 1 */
			or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
			or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.erase_brush_size >= 1) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
			/* erase_brush_size >= 2 */
			or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
			or (obj_leveleditor.erase_brush_size >= 2) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
			/* erase_brush_size >= 3 */
			or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
			or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.erase_brush_size >= 3) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
			/* erase_brush_size >= 4 */
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.erase_brush_size >= 4) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
			/* erase_brush_size >= 5 */
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
			or (obj_leveleditor.erase_brush_size >= 5) and (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
			{
				if (obj_leveleditor.difficulty_layer == 0)
				{
					if (easy == true)
					{
						easy = false;
					}
					if (normal == true)
					{
						normal = false;
					}
					if (hard == true)
					{
						hard = false;
					}
				}
				else
				if (obj_leveleditor.difficulty_layer == 1)
				and (obj_leveleditor.set_difficulty_mode == true)
				{
					if (easy == true)
					{
						easy = false;
					}
				}
				else
				if (obj_leveleditor.difficulty_layer == 2)
				and (obj_leveleditor.set_difficulty_mode == true)
				{
					if (normal == true)
					{
						normal = false;
					}
				}
				else
				if (obj_leveleditor.difficulty_layer == 3)
				and (obj_leveleditor.set_difficulty_mode == true)
				{
					if (hard == true)
					{
						hard = false;
					}
				}
				
				#region /* Run this code after setting difficulty variables to false. If all difficulty variables are false, then delete the object */
				if (easy == false)
				and (normal == false)
				and (hard == false)
				{
					instance_destroy();
				}
				#endregion /* Run this code after setting difficulty variables to false. If all difficulty variables are false, then delete the object END */
				
			}
		}
		#endregion /* Set to dissapear on difficulty level END */
		
		#endregion /* Difficulty settings per object END */
		
	}
}