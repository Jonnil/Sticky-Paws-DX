function scr_set_length_variable()
{
	can_set_length = true;
	
	#region /* Set length variable */
	if (instance_exists(obj_leveleditor_placed_object))
	{
		if (position_meeting(x - 32, y, obj_leveleditor_placed_object))
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).x == x - 32)
		and (instance_position(x - 32, y, obj_leveleditor_placed_object).y == y)
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
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).x == x + (32 * i))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).y == y)
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
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).x != x + (32 * i))
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).y != y)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).object != object)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).easy != easy)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).normal != normal)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).hard != hard)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).second_x != second_x)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			or (position_meeting(x + (32 * i), y, obj_leveleditor_placed_object))
			and (instance_position(x + (32 * i), y, obj_leveleditor_placed_object).second_y != second_y)
			and (mask_index == spr_wall)
			and (can_set_length == true)
			{
				repeat_length = i - 1;
				can_set_length = false;
			}
		}
		
		/* In case there are overlapping objects not of the same object ID, you still want this object to be saved so it doesn't dissapear and become "repeat length -1" if there is another object with same object ID to the left */
		if (instance_position(x, y, obj_leveleditor_placed_object).object != object)
		{
			repeat_length = 0;
		}
	}
	#endregion /* Set length variable END */
	
}