function scr_set_length_variable()
{
	instance_activate_object(obj_leveleditor_placed_object);
	can_set_length = true;
	
	#region /* Set length variable */
	if (instance_exists(obj_leveleditor_placed_object))
	{
		if (position_meeting(x - 32, y, obj_leveleditor_placed_object))
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).object == object)
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).easy == easy)
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).normal == normal)
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).hard == hard)
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).second_x == second_x)
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).second_y == second_y)
		and (mask_index == spr_wall)
		and (can_set_length == true)
		{
			repeat_length = -1;
			can_set_length = false;
		}
		else
		for(i = 1; i < (room_width / 32); i += 1)
		{
			if (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).object == object)
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).easy == easy)
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).normal == normal)
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).hard == hard)
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).second_x == second_x)
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).second_y == second_y)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			{
				repeat_length = i;
			}
			else
			if (!position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).object != object)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			{
				repeat_length = i - 1;
				can_set_length = false;
			}
		}
	}
	#endregion /* Set length variable END */
	
}