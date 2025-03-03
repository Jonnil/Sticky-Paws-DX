function scr_when_placing_on_difficulty_layer(what_object)
{
	
	#region /* When placing on difficulty layer */
	what_object.placed_for_the_first_time = true;
	if (obj_leveleditor.set_difficulty_mode)
	{
		if (obj_leveleditor.difficulty_layer == 1)
		{
			image_alpha = 1;
			image_blend = c_lime;
			what_object.easy = true;
			what_object.normal = false;
			what_object.hard = false;
		}
		else
		if (obj_leveleditor.difficulty_layer == 2)
		{
			image_alpha = 1;
			image_blend = c_yellow;
			what_object.easy = false;
			what_object.normal = true;
			what_object.hard = false;
		}
		else
		if (obj_leveleditor.difficulty_layer >= 3)
		{
			image_alpha = 1;
			image_blend = c_red;
			what_object.easy = false;
			what_object.normal = false;
			what_object.hard = true;
		}
	}
	#endregion /* When placing on difficulty layer END */
	
}