if (global.actually_play_edited_level == true)
or (global.play_edited_level == true)
{
	scr_spawn_objects_when_starting_room(); /* Only spawn objects AFTER saving custom level */
}

if (global.actually_play_edited_level == false)
and (x < (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 12)
and (x > camera_get_view_x(view_camera[view_current]) - 12)
and (y < (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 12)
and (y > camera_get_view_y(view_camera[view_current]) - 12)
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Change certain objects angle */
	/* Some objects should not save second x and second y, only objects that actually rotate should save */
	if (place_object_angle == true)
	{
		if (object == level_object_id.id_spring)
		or (object == level_object_id.id_door)
		or (object == level_object_id.id_water_level_change_slow)
		or (object == level_object_id.id_water_level_change_fast)
		or (object == level_object_id.id_water_level_change_faster)
		or (object == level_object_id.id_arrow_sign)
		or (object == level_object_id.id_arrow_sign_small)
		or (object == level_object_id.id_water)
		{
			if (instance_exists(obj_leveleditor))
			{
				second_x = obj_leveleditor.x;
				second_y = obj_leveleditor.y;
			}
			if (mouse_check_button_released(mb_left))
			or (instance_exists(obj_leveleditor))
			and (obj_leveleditor.key_a_released)
			{
				place_object_angle = false;
			}
		}
		else
		{
			second_x = 0;
			second_y = 0;
		}
	}
	#endregion /* Change certain objects angle END */
	
	if (distance_to_object(obj_leveleditor) < 100)
	{
		/* Insert code that checks if view is moving, only then should the transparency difficulty layers be updated. For now just have it be in step event */
		scr_make_sprite_transparent_setting_difficulty_levels();
		
		#region /* Drag Object */
		if (asset_get_type("obj_leveleditor") == asset_object)
		and (instance_exists(obj_leveleditor))
		and (obj_leveleditor.set_difficulty_mode == false)
		and (delay > 1)
		{
		
			#region /* Click on object to start drag */
			if (mouse_check_button_pressed(mb_left))
			or (obj_leveleditor.key_a_pressed)
			{
				if (!keyboard_check(vk_space))
				and (!mouse_check_button(mb_middle))
				and (!mouse_check_button(mb_right))
				and (variable_instance_exists(obj_leveleditor, "drag_object"))
				and (obj_leveleditor.drag_object == false)
				and (variable_instance_exists(obj_leveleditor, "fill_mode"))
				and (obj_leveleditor.fill_mode == false)
				and (variable_instance_exists(obj_leveleditor, "erase_mode"))
				and (obj_leveleditor.erase_mode == false)
				and (variable_instance_exists(obj_leveleditor, "pause"))
				and (obj_leveleditor.pause == false)
				and (variable_instance_exists(obj_leveleditor, "menu_delay"))
				and (obj_leveleditor.menu_delay == 0)
				and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
				and (asset_get_type("obj_level_player_1_start") == asset_object)
				and (!place_meeting(x, y, obj_level_player_1_start))
				and (asset_get_type("obj_level_player_2_start") == asset_object)
				and (!place_meeting(x, y, obj_level_player_2_start))
				and (asset_get_type("obj_level_player_3_start") == asset_object)
				and (!place_meeting(x, y, obj_level_player_3_start))
				and (asset_get_type("obj_level_player_4_start") == asset_object)
				and (!place_meeting(x, y, obj_level_player_4_start))
				and (asset_get_type("obj_level_height") == asset_object)
				and (!position_meeting(x, y, obj_level_height))
				and (asset_get_type("obj_level_width") == asset_object)
				and (!position_meeting(x, y, obj_level_width))
				and (asset_get_type("obj_water_level_height") == asset_object)
				and (!position_meeting(x, y, obj_water_level_height))
				and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
				and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
				and (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32)) /* Can't place objects when clicking the play button */
				{
					if (obj_leveleditor.show_grid == true)
					and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 32 - 32 - 32, 80 + obj_leveleditor.icons_at_top_y + 16 - 32 - 32, display_get_gui_width() + 64 + 32, 80 + obj_leveleditor.icons_at_top_y + 16 + 32 + 32)) /* Up and down buttons when grid is on */
					or (obj_leveleditor.show_grid == false)
					{
						if (!keyboard_check(vk_space))
						and (!mouse_check_button(mb_middle))
						{
							if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
							{
								if (drag_object <= false)
								and (variable_instance_exists(obj_leveleditor, "pause"))
								and (obj_leveleditor.pause == false)
								and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
								and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64))
								{
									if (obj_leveleditor.set_difficulty_mode == true)
									and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
									or (obj_leveleditor.set_difficulty_mode == false)
									and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
									{
										if (obj_leveleditor.show_grid == true)
										and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 32 - 32, 80 + 32 + 16 - 32, display_get_gui_width() + 64, 80 + 32 + 16 + 32)) /* Up and down buttons when grid is on */
										or (obj_leveleditor.show_grid == false)
										{
											effect_create_above(ef_ring, x, y, 0, c_white);
											drag_object = true;
											drag_xstart = x;
											drag_ystart = y;
											obj_leveleditor.drag_object = true;
										}
									}
								}
							}
						}
					}
				}
			}
			#endregion /* Click on object to start drag END */
		
			#region /* Actually drag the object */
			if (drag_object == true)
			{
				depth = -300;
				x = obj_leveleditor.x;
				y = obj_leveleditor.y;
			}
			#endregion /* Actually drag the object END */
		
			#region /* Release the object */
			if (mouse_check_button_released(mb_left))
			or (obj_leveleditor.key_a_released)
			{
				if (drag_object == true)
				{
					drag_release_timer = 3;
					drag_object = 0.5;
					obj_leveleditor.drag_object = false;
					dragged_from_original_place = false;
				
					#region /* Reset depth to normal when releasing object */
					if (object == level_object_id.id_water)
					or (object == level_object_id.id_breathable_water)
					or (object == level_object_id.id_water_surface)
					{
						depth = -20;
					}
					else
					{
						depth = -19;
					}
					#endregion /* Reset depth to normal when releasing object END */
				
				}
			}
			#endregion /* Release the object END */
		}
	
		if (drag_release_timer > 0)
		{
			drag_release_timer -= 1;
		}
		else
		if (drag_object == 0.5)
		{
			drag_object = false;
			dragged_from_original_place = false;
		}
	
		if (drag_xstart != x)
		or (drag_ystart != y)
		{
			dragged_from_original_place = true;
		}
		#endregion /* Drag Object END */
		
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

#region /* Big collectible uses old ID's, need to update them so old levels are compatible */
if (object == 35)
or (object == 36)
or (object == 37)
or (object == 38)
{
	object = 34;
}
else
if (object == 351)
or (object == 361)
or (object == 371)
or (object == 381)
{
	object = 341;
}
else
if (object == 49)
or (object == 50)
or (object == 51)
or (object == 52)
{
	object = 48;
}
else
if (object == 84)
or (object == 85)
or (object == 86)
or (object == 87)
{
	object = 83;
}
#endregion /* Big collectible uses old ID's, need to update them so old levels are compatible END */