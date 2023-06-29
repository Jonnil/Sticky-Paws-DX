function scr_set_length_variable()
{
	var can_set_length = true;
	var placed_object = obj_leveleditor_placed_object;
	
	#region /* Set length variable */
	if (position_meeting(x - 32, y, placed_object))
	&& (instance_position(x - 32, y, placed_object).x == x - 32)
	&& (instance_position(x - 32, y, placed_object).y == y)
	&& (instance_position(x - 32, y, placed_object).object == object)
	&& (instance_position(x - 32, y, placed_object).easy == easy)
	&& (instance_position(x - 32, y, placed_object).normal == normal)
	&& (instance_position(x - 32, y, placed_object).hard == hard)
	&& (instance_position(x - 32, y, placed_object).second_x == second_x)
	&& (instance_position(x - 32, y, placed_object).second_y == second_y)
	&& (mask_index == spr_wall)
	&& (can_set_length)
	{
		repeat_length = -1;
		can_set_length = false;
	}
	else
	for(var i = 1; i < (room_width / 32); i ++)
	{
		var xx = x + (32 * i);
		if (position_meeting(xx, y, placed_object))
		&& (instance_position(xx, y, placed_object).x == xx)
		&& (instance_position(xx, y, placed_object).y == y)
		&& (instance_position(xx, y, placed_object).object == object)
		&& (instance_position(xx, y, placed_object).easy == easy)
		&& (instance_position(xx, y, placed_object).normal == normal)
		&& (instance_position(xx, y, placed_object).hard == hard)
		&& (instance_position(xx, y, placed_object).second_x == second_x)
		&& (instance_position(xx, y, placed_object).second_y == second_y)
		&& (mask_index == spr_wall)
		&& (can_set_length)
		{
			repeat_length = i;
		}
		else
		if (mask_index == spr_wall)
		&& (can_set_length)
		{
			if (!position_meeting(xx, y, placed_object))
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).x != xx)
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).y != y)
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).object != object)
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).easy != easy)
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).normal != normal)
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).hard != hard)
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).second_x != second_x)
			|| (position_meeting(xx, y, placed_object))
			&& (instance_position(xx, y, placed_object).second_y != second_y)
			{
				repeat_length = i - 1;
				can_set_length = false;
			}
		}
	}
	
	/* In case there are overlapping objects not of the same object ID, you still want this object to be saved so it doesn't dissapear and become "repeat length -1" if there is another object with same object ID to the left */
	var inst = instance_position(x, y, placed_object);
	if (inst != noone && inst.object != object)
	{
		repeat_length = 0;
	}
	#endregion /* Set length variable END */
	
}

//function scr_set_length_variable()
//{
//	var can_set_length = true;
//	var placed_object = obj_leveleditor_placed_object;
//	var inst;
//	var step = 32;
//	var mask = spr_wall;
	
//	inst = instance_position(x - step, y, placed_object);
//	if (instance_exists(inst))
//	&& (position_meeting(x - step, y, placed_object) &&
//		inst.x == x - step && inst.y == y && /* Checking if inst.x == x - step && inst.y == y is essential for the code to work properly, don't remove */
//		inst.object == object &&
//		inst.easy == easy &&
//		inst.normal == normal &&
//		inst.hard == hard &&
//		inst.second_x == second_x &&
//		inst.second_y == second_y &&
//		mask_index == mask && can_set_length)
//	{
//		repeat_length = -1;
//	}
//	for (var i = 1; i < global.max_length_iterations; i++)
//	{
//		var xx = x + (step * i);
//		var pos = instance_position(xx, y, placed_object);
//		if (pos != noone)
//		{
//			if (pos.x != xx || pos.y != y || pos.object != object ||
//				pos.easy != easy || pos.normal != normal ||
//				pos.hard != hard || pos.second_x != second_x || 
//				pos.second_y != second_y)
//			{
//				repeat_length = i - 1;
//				can_set_length = false;
//				break;
//			}
//			if (mask_index == mask)
//			{
//				repeat_length = i;
//			}
//		}
//		else if (mask_index == mask)
//		{
//			repeat_length = i - 1;
//			can_set_length = false;
//			break;
//		}
//	}
//	if (can_set_length)
//	{
//		repeat_length = -1;
//	}
//	/* In case there are overlapping objects not of the same object ID, you still want this object to be saved so it doesn't disappear and become "repeat length -1" if there is another object with the same object ID to the left */
//	/* You need to have this code at the end of the script for this to work properly */
//	inst = instance_position(x, y, placed_object);
//	if (inst != noone && inst.object != object)
//	{
//		repeat_length = 0;
//	}
//}