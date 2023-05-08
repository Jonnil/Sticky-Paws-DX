function scr_set_length_variable()
{
	can_set_length = true;
	var placed_object = obj_leveleditor_placed_object;
	
	#region /* Set length variable */
	if (position_meeting(x - 32, y, placed_object))
	and (instance_position(x - 32, y, placed_object).x == x - 32)
	and (instance_position(x - 32, y, placed_object).y == y)
	and (instance_position(x - 32, y, placed_object).object == object)
	and (instance_position(x - 32, y, placed_object).easy == easy)
	and (instance_position(x - 32, y, placed_object).normal == normal)
	and (instance_position(x - 32, y, placed_object).hard == hard)
	and (instance_position(x - 32, y, placed_object).second_x == second_x)
	and (instance_position(x - 32, y, placed_object).second_y == second_y)
	and (mask_index == spr_wall)
	and (can_set_length == true)
	{
		repeat_length = -1;
		can_set_length = false;
	}
	else
	for(var i = 1; i < (room_width / 32); i += 1)
	{
		var xx = x + (32 * i);
		if (position_meeting(xx, y, placed_object))
		and (instance_position(xx, y, placed_object).x == xx)
		and (instance_position(xx, y, placed_object).y == y)
		and (instance_position(xx, y, placed_object).object == object)
		and (instance_position(xx, y, placed_object).easy == easy)
		and (instance_position(xx, y, placed_object).normal == normal)
		and (instance_position(xx, y, placed_object).hard == hard)
		and (instance_position(xx, y, placed_object).second_x == second_x)
		and (instance_position(xx, y, placed_object).second_y == second_y)
		and (mask_index == spr_wall)
		and (can_set_length == true)
		{
			repeat_length = i;
		}
		else
		if (mask_index == spr_wall)
		and (can_set_length == true)
		{
			if (!position_meeting(xx, y, placed_object))
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).x != xx)
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).y != y)
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).object != object)
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).easy != easy)
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).normal != normal)
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).hard != hard)
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).second_x != second_x)
			or (position_meeting(xx, y, placed_object))
			and (instance_position(xx, y, placed_object).second_y != second_y)
			{
				repeat_length = i - 1;
				can_set_length = false;
			}
		}
	}
	
	/* In case there are overlapping objects not of the same object ID, you still want this object to be saved so it doesn't dissapear and become "repeat length -1" if there is another object with same object ID to the left */
	if (instance_position(x, y, placed_object).object != object)
	{
		repeat_length = 0;
	}
	#endregion /* Set length variable END */
	
}