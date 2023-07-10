if (global.actually_play_edited_level == false)
{
	if (drag_object > 0 || place_object_angle)
	{
		switch (object)
		{
			case LEVEL_OBJECT_ID.ID_SPRING:
				draw_angle = point_direction(x, y, second_x, second_y) - 90;
				break;
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER:
				draw_angle = point_direction(x, y, x, second_y) - 90;
				break;
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN:
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL:
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
			case LEVEL_OBJECT_ID.ID_SPRING:
			case LEVEL_OBJECT_ID.ID_DOOR:
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN:
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL:
			case LEVEL_OBJECT_ID.ID_WATER:
			case LEVEL_OBJECT_ID.ID_BREATHABLE_WATER:
				second_x = global.leveleditor_x;
				second_y = global.leveleditor_y;
				break;
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER:
				second_x = x;
				second_y = global.leveleditor_y;
			default:
				second_x = 0;
				second_y = 0;
				break;
		}
		if (mouse_check_button_released(mb_left) || obj_leveleditor.key_a_released)
		{
			place_object_angle = false;
		}
	}
	#endregion /* Change certain objects angle END */
	
}