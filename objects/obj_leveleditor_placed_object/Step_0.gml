if (global.actually_play_edited_level == false)
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
	
	#region /* Drag Object */
	if (asset_get_type("obj_leveleditor") == asset_object)
	and (instance_exists(obj_leveleditor))
	and (obj_leveleditor.set_difficulty_mode == false)
	and (obj_leveleditor.can_put_objects_above_other_objects == false)
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
	
}