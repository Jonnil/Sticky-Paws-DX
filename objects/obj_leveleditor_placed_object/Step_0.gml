if (global.actually_play_edited_level)
|| (global.play_edited_level)
{
	scr_spawn_objects_when_starting_room(); /* Only spawn objects AFTER saving custom level */
}

if (global.actually_play_edited_level == false)
{
	
	#region /* Actually drag the object */
	if (drag_object)
	&& (instance_exists(obj_leveleditor))
	{
		x = obj_leveleditor.x;
		y = obj_leveleditor.y;
	}
	#endregion /* Actually drag the object END */
	
	#region /* Change certain objects angle */
	/* Some objects should not save second x and second y, only objects that actually rotate should save */
	if (place_object_angle)
	{
		if (object == level_object_id.id_spring)
		|| (object == level_object_id.id_door)
		|| (object == level_object_id.id_water_level_change_slow)
		|| (object == level_object_id.id_water_level_change_fast)
		|| (object == level_object_id.id_water_level_change_faster)
		|| (object == level_object_id.id_arrow_sign)
		|| (object == level_object_id.id_arrow_sign_small)
		|| (object == level_object_id.id_water)
		|| (object == level_object_id.id_breathable_water)
		{
			if (instance_exists(obj_leveleditor))
			{
				second_x = obj_leveleditor.x;
				second_y = obj_leveleditor.y;
			}
			if (mouse_check_button_released(mb_left))
			|| (instance_exists(obj_leveleditor))
			&& (obj_leveleditor.key_a_released)
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
		var get_window_height = display_get_gui_height();
		var get_window_width = display_get_gui_width();
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		
		#region /* Make object change difficulty layer depending on what difficulty layer is selected */
		if (instance_exists(obj_leveleditor))
		&& (obj_leveleditor.difficulty_layer > 0)
		&& (obj_leveleditor.drag_object == false)
		&& (obj_leveleditor.pause == false)
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, get_window_height - 64, get_window_width, room_height * 2))
		&& (!keyboard_check(vk_space))
		&& (!mouse_check_button(mb_middle))
		{
			if (obj_leveleditor.erase_mode)
			&& (mouse_check_button(mb_left))
			|| (mouse_check_button(mb_right))
			|| (instance_exists(obj_leveleditor))
			&& (obj_leveleditor.erase_mode)
			&& (obj_leveleditor.key_a_hold)
			|| (instance_exists(obj_leveleditor))
			&& (obj_leveleditor.key_b_hold)
			{
				if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			
				/* Erase brush size 1 */
				|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
				/* Erase brush size 1 END */
			
				/* Erase brush size 2 */
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
				/* Erase brush size 2 END */
			
				/* Erase brush size 3 */
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
				/* Erase brush size 3 END */
			
				/* Erase brush size 4 */
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
				/* Erase brush size 4 END */
			
				/* Erase brush size 5 */
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
				/* Erase brush size 5 END */
			
				{
					if (obj_leveleditor.difficulty_layer == 1)
					{
						if (easy)
						{
							easy = false;
						}
					}
					else
					if (obj_leveleditor.difficulty_layer == 2)
					{
						if (normal)
						{
							normal = false;
						}
					}
					else
					if (obj_leveleditor.difficulty_layer == 3)
					{
						if (hard)
						{
							hard = false;
						}
					}
				}
			}
		}
		#endregion /* Make object change difficulty layer depending on what difficulty layer is selected END */
	
		#region /* Delete / Erase Objects */
		if (!keyboard_check(vk_escape))
		{
			if (instance_exists(obj_leveleditor))
			&& (obj_leveleditor.difficulty_layer == 0)
			&& (obj_leveleditor.drag_object == false)
			&& (obj_leveleditor.erase_mode)
			&& (obj_leveleditor.scroll_view == false)
			&& (obj_leveleditor.pause == false)
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, - 64, get_window_width, + 64))
			&& (!keyboard_check(vk_space))
			&& (!mouse_check_button(mb_middle))
			{
				if (obj_leveleditor.set_difficulty_mode)
				&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, get_window_height - 64, get_window_width, room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
				|| (obj_leveleditor.set_difficulty_mode == false)
				&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height - 64, get_window_width, room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
				{
					if (mouse_check_button(mb_right))
					|| (mouse_check_button(mb_left))
					|| (instance_exists(obj_leveleditor))
					&& (obj_leveleditor.key_a_hold)
					|| (instance_exists(obj_leveleditor))
					&& (obj_leveleditor.key_b_hold)
					{
						if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
						
						/* Erase brush size 1 */
						|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
						|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
						|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
						/* Erase brush size 1 END */
						
						/* Erase brush size 2 */
						|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
						|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
						|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
						|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
						|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
						/* Erase brush size 2 END */
						
						/* Erase brush size 3 */
						|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
						|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
						|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
						|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
						|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
						|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
						|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
						/* Erase brush size 3 END */
						
						/* Erase brush size 4 */
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
						|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
						/* Erase brush size 4 END */
						
						/* Erase brush size 5 */
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
						|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
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
		}
		#endregion /* Delete / Erase Objects END */
	
		#region /* Difficulty settings per object */
	
		#region /* Set to appear on difficulty level */
		if (!mouse_check_button(mb_right))
		&& (instance_exists(obj_leveleditor))
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, get_window_height - 64, get_window_width, room_height * 2))
		&& (mouse_check_button(mb_left))
		&& (obj_leveleditor.drag_object == false)
		&& (obj_leveleditor.erase_mode == false)
		&& (obj_leveleditor.pause == false)
	
		|| (instance_exists(obj_leveleditor))
		&& (!obj_leveleditor.key_b_hold)
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
		&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, get_window_height - 64, get_window_width, room_height * 2))
		&& (obj_leveleditor.drag_object == false)
		&& (obj_leveleditor.erase_mode == false)
		&& (obj_leveleditor.key_a_hold)
		&& (obj_leveleditor.pause == false)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
		
			/* Place Brush Size 1 */
			|| (obj_leveleditor.place_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
			|| (obj_leveleditor.place_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
			|| (obj_leveleditor.place_brush_size >= 1) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
			/* Place Brush Size 1 END */
		
			/* Place Brush Size 2 */
			|| (obj_leveleditor.place_brush_size >= 2) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
			|| (obj_leveleditor.place_brush_size >= 2) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
			|| (obj_leveleditor.place_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
			|| (obj_leveleditor.place_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
			|| (obj_leveleditor.place_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
			/* Place Brush Size 2 END */
		
			/* Place Brush Size 3 */
			|| (obj_leveleditor.place_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
			|| (obj_leveleditor.place_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
			|| (obj_leveleditor.place_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
			|| (obj_leveleditor.place_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
			|| (obj_leveleditor.place_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
			|| (obj_leveleditor.place_brush_size >= 3) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
			|| (obj_leveleditor.place_brush_size >= 3) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
			/* Place Brush Size 3 END */
		
			/* Place Brush Size 4 */
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
			|| (obj_leveleditor.place_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
			/* Place Brush Size 4 END */
		
			/* Place Brush Size 5 */
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
			|| (obj_leveleditor.place_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
			/* Place Brush Size 5 END */
		
			{
				if (obj_leveleditor.difficulty_layer == 1)
				&& (obj_leveleditor.set_difficulty_mode)
				{
					if (easy == false)
					{
						easy = true;
						placed_for_the_first_time = true;
					}
				}
				else
				if (obj_leveleditor.difficulty_layer == 2)
				&& (obj_leveleditor.set_difficulty_mode)
				{
					if (normal == false)
					{
						normal = true;
						placed_for_the_first_time = true;
					}
				}
				else
				if (obj_leveleditor.difficulty_layer == 3)
				&& (obj_leveleditor.set_difficulty_mode)
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
		if (!keyboard_check(vk_escape))
		{
			if (!mouse_check_button(mb_left))
			&& (instance_exists(obj_leveleditor))
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, get_window_height - 64, get_window_width, room_height * 2))
			&& (mouse_check_button(mb_right))
			&& (obj_leveleditor.pause == false)
			
			|| (instance_exists(obj_leveleditor))
			&& (!obj_leveleditor.key_a_hold)
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2))
			&& (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, get_window_height - 64, get_window_width, room_height * 2))
			&& (obj_leveleditor.key_b_hold)
			&& (obj_leveleditor.pause == false)
			{
				if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
				/* erase_brush_size >= 1 */
				|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 1) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 32, id))
				/* erase_brush_size >= 2 */
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 2) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 32, id))
				/* erase_brush_size >= 3 */
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 3) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 64, id))
				/* erase_brush_size >= 4 */
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 4) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 64, id))
				/* erase_brush_size >= 5 */
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 64, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y - 32, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 32, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 64, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 96, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 64, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x + 32, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 32, obj_leveleditor.y + 96, id))
				|| (obj_leveleditor.erase_brush_size >= 5) && (position_meeting(obj_leveleditor.x - 64, obj_leveleditor.y + 96, id))
				{
					if (obj_leveleditor.difficulty_layer == 0)
					{
						if (easy)
						{
							easy = false;
						}
						if (normal)
						{
							normal = false;
						}
						if (hard)
						{
							hard = false;
						}
					}
					else
					if (obj_leveleditor.difficulty_layer == 1)
					&& (obj_leveleditor.set_difficulty_mode)
					{
						if (easy)
						{
							easy = false;
						}
					}
					else
					if (obj_leveleditor.difficulty_layer == 2)
					&& (obj_leveleditor.set_difficulty_mode)
					{
						if (normal)
						{
							normal = false;
						}
					}
					else
					if (obj_leveleditor.difficulty_layer == 3)
					&& (obj_leveleditor.set_difficulty_mode)
					{
						if (hard)
						{
							hard = false;
						}
					}
					
					/* Run this code after setting difficulty variables to false. If all difficulty variables are false, then delete the object. Only run this code here in step event */
					if (!easy && !normal && !hard){instance_destroy();}
					
				}
			}
		}
		#endregion /* Set to dissapear on difficulty level END */
		
		#endregion /* Difficulty settings per object END */
		
	}
	
}