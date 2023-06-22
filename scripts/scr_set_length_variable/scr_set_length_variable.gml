function scr_set_length_variable()
{
	var can_set_length = true;
	var placed_object = obj_leveleditor_placed_object;
	var inst;
	var step = 32;
	var mask = spr_wall;
	
	inst = instance_position(x - step, y, placed_object);
	if (instance_exists(inst))
	&& (position_meeting(x - step, y, placed_object) &&
		inst.x == x - step && inst.y == y && /* Checking if inst.x == x - step && inst.y == y is essential for the code to work properly, don't remove */
		inst.object == object &&
		inst.easy == easy &&
		inst.normal == normal &&
		inst.hard == hard &&
		inst.second_x == second_x &&
		inst.second_y == second_y &&
		mask_index == mask && can_set_length)
	{
		repeat_length = -1;
	}
	for (var i = 1; i < global.max_length_iterations; i++)
	{
		var xx = x + (step * i);
		var pos = instance_position(xx, y, placed_object);
		if (pos != noone)
		{
			if (pos.x != xx || pos.y != y || pos.object != object ||
				pos.easy != easy || pos.normal != normal ||
				pos.hard != hard || pos.second_x != second_x || 
				pos.second_y != second_y)
			{
				repeat_length = i - 1;
				can_set_length = false;
				break;
			}
			if (mask_index == mask)
			{
				repeat_length = i;
			}
		}
		else if (mask_index == mask)
		{
			repeat_length = i - 1;
			can_set_length = false;
			break;
		}
	}
	if (can_set_length)
	{
		repeat_length = -1;
	}
	/* In case there are overlapping objects not of the same object ID, you still want this object to be saved so it doesn't disappear and become "repeat length -1" if there is another object with the same object ID to the left */
	/* You need to have this code at the end of the script for this to work properly */
	inst = instance_position(x, y, placed_object);
	if (inst != noone && inst.object != object)
	{
		repeat_length = 0;
	}
}