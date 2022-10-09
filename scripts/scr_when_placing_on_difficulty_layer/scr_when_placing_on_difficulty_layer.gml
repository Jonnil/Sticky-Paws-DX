function scr_when_placing_on_difficulty_layer()
{
	
	#region /* When placing on difficulty layer */
	obj.placed_for_the_first_time = true;
	if (obj_leveleditor.set_difficulty_mode == true)
	{
		if (obj_leveleditor.difficulty_layer == 1)
		{
			image_alpha = 1;
			image_blend = c_lime;
			obj.easy = true;
			obj.normal = false;
			obj.hard = false;
		}
		else
		if (obj_leveleditor.difficulty_layer == 2)
		{
			image_alpha = 1;
			image_blend = c_yellow;
			obj.easy = false;
			obj.normal = true;
			obj.hard = false;
		}
		else
		if (obj_leveleditor.difficulty_layer >= 3)
		{
			image_alpha = 1;
			image_blend = c_red;
			obj.easy = false;
			obj.normal = false;
			obj.hard = true;
		}
	}
	#endregion /* When placing on difficulty layer END */
	
}