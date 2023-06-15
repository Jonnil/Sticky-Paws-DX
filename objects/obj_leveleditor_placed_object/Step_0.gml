if (global.actually_play_edited_level == false)
{
	if (instance_exists(obj_leveleditor))
	{
		var leveleditor_x = obj_leveleditor.x;
		var leveleditor_y = obj_leveleditor.y;
	}
	
	switch (object)
	{
		case level_object_id.id_spring:
			draw_angle = point_direction(x, y, second_x, second_y) - 90;
			break;
		case level_object_id.id_water_level_change_slow:
		case level_object_id.id_water_level_change_fast:
		case level_object_id.id_water_level_change_faster:
			draw_angle = point_direction(x, y, x, second_y) - 90;
			break;
		case level_object_id.id_arrow_sign:
		case level_object_id.id_arrow_sign_small:
			draw_angle = point_direction(x, y, second_x, second_y);
			break;
	}
	
	#region /* Actually drag the object */
	if (drag_object)
	&& (instance_exists(obj_leveleditor))
	{
		x = leveleditor_x;
		y = leveleditor_y;
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
				second_x = leveleditor_x;
				second_y = leveleditor_y;
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
	
	scr_make_sprite_transparent_setting_difficulty_levels();
}