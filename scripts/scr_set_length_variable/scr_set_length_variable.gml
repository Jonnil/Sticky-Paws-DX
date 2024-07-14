function scr_set_length_variable()
{
	if (global.can_save_length_variable) /* This function saves object_placement_all.json size, but lags the game. Make this optional and false by default */
	{
		
		#region /* Set length variable */
		var placed_object = obj_leveleditor_placed_object;
		if (mask_index == spr_wall) /* Only objects with wall mask should be checked */
		{
			var can_set_length = true;
			var inst = instance_position(x - 32, y, placed_object);
			if (position_meeting(x - 32, y, placed_object) /* Objects to the right of the same object type should not be saved */
			&& inst.x == x - 32
			&& inst.y == y
			&& inst.object == object
			&& inst.easy == easy
			&& inst.normal == normal
			&& inst.hard == hard
			&& inst.second_x == second_x
			&& inst.second_y == second_y)
			{
				repeat_length = -1;
				can_set_length = false;
			}
			else
			if (instance_exists(obj_level_width))
			{
				for(var i = 1; i < global.max_length_iterations; i ++)
				{
					var xx = x + (32 * i);
					var inst = instance_position(xx, y, placed_object);
					if (can_set_length /* Save how many objects to the right are repeated */
					&& position_meeting(xx, y, placed_object)
					&& inst.x == xx
					&& inst.y == y
					&& inst.object == object
					&& inst.easy == easy
					&& inst.normal == normal
					&& inst.hard == hard
					&& inst.second_x == second_x
					&& inst.second_y == second_y)
					{
						repeat_length = i;
					}
					else
					if (can_set_length)
					{
						if (!position_meeting(xx, y, placed_object))
						|| (position_meeting(xx, y, placed_object))
						&& (
							inst.x != xx
							|| inst.y != y
							|| inst.object != object
							|| inst.easy != easy
							|| inst.normal != normal
							|| inst.hard != hard
							|| inst.second_x != second_x
							|| inst.second_y != second_y
						)
						{
							repeat_length = i - 1;
							can_set_length = false;
						}
					}
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
}