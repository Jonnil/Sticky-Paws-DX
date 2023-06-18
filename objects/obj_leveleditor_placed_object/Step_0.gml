if (global.actually_play_edited_level == false)
{
	if (drag_object > 0 || place_object_angle)
	{
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
	}
	
	#region /* Actually drag the object */
	if (drag_object)
	{
		x = global.leveleditor_x;
		y = global.leveleditor_y;
	}
	#endregion /* Actually drag the object END */
	
	#region /* Change certain objects angle */
	/* Some objects should not save second x and second y, only objects that actually rotate should save */
	if (place_object_angle)
	{
		switch (object)
		{
			case level_object_id.id_spring:
			case level_object_id.id_door:
			case level_object_id.id_water_level_change_slow:
			case level_object_id.id_water_level_change_fast:
			case level_object_id.id_water_level_change_faster:
			case level_object_id.id_arrow_sign:
			case level_object_id.id_arrow_sign_small:
			case level_object_id.id_water:
			case level_object_id.id_breathable_water:
				if (instance_exists(obj_leveleditor))
				{
					second_x = global.leveleditor_x;
					second_y = global.leveleditor_y;
				}
				if (mouse_check_button_released(mb_left) || obj_leveleditor.key_a_released)
				{
					place_object_angle = false;
				}
				break;
			default:
				second_x = 0;
				second_y = 0;
				break;
		}
	}
	#endregion /* Change certain objects angle END */
	
}