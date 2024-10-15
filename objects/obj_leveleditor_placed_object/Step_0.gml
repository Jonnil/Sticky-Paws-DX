if (!global.actually_play_edited_level)
{
	if (!drag_object)
	{
		hover_over_object_indicator = false;
	}
	
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
		if (obj_leveleditor.if_clear_checked)
		{
			ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			ini_write_real("info", "clear_check", false); /* Set clear check to false when trying to upload within the level editor */
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			obj_leveleditor.if_clear_checked = false;
		}
		x = global.leveleditor_x;
		y = global.leveleditor_y;
	}
	#endregion /* Actually drag the object END */
	
	#region /* Change certain objects angle */
	/* Some objects should not save second x and second y, only objects that actually rotate should save */
	if (place_object_angle)
	{
		
		/* Make sure that you can drag the second x and second y outside of the view without the origin point being deactivated */
		global.deactivate_timer = 0;
		instance_activate_region(obj_leveleditor.cam_x - 32, obj_leveleditor.cam_y - 32, obj_leveleditor.cam_width + 32, obj_leveleditor.cam_height + 32, true);
		
		switch (object)
		{
			case LEVEL_OBJECT_ID.ID_SPRING:
			case LEVEL_OBJECT_ID.ID_DOOR:
			case LEVEL_OBJECT_ID.ID_DOOR_LOCKED:
			case LEVEL_OBJECT_ID.ID_WARP_BOX:
			case LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE:
			case LEVEL_OBJECT_ID.ID_WARP_BOX_LOCKED:
			case LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE_LOCKED:
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN:
			case LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL:
			case LEVEL_OBJECT_ID.ID_WATER:
			case LEVEL_OBJECT_ID.ID_LAVA:
			case LEVEL_OBJECT_ID.ID_BREATHABLE_WATER:
				second_x = global.leveleditor_x;
				second_y = global.leveleditor_y;
				break;
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST:
			case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER:
				second_x = x;
				second_y = global.leveleditor_y;
				break;
			default:
				second_x = 0;
				second_y = 0;
				break;
		}
		if (mouse_check_button_released(mb_left) || instance_exists(obj_leveleditor) && obj_leveleditor.key_a_released)
		{
			place_object_angle = false;
		}
	}
	#endregion /* Change certain objects angle END */
	
}