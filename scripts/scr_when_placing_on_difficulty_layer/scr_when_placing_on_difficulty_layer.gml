function scr_when_placing_on_difficulty_layer()
{
	
	#region /*When placing on difficulty layer*/
	obj.placed_for_the_first_time = true;
	if (obj_leveleditor.set_difficulty_mode = true)
	{
		if (obj_leveleditor.difficulty_layer = 1)
		{
			obj.easy = true;
			obj.normal = false;
			obj.hard = false;
		}
		else
		if (obj_leveleditor.difficulty_layer = 2)
		{
			obj.easy = false;
			obj.normal = true;
			obj.hard = false;
		}
		else
		if (obj_leveleditor.difficulty_layer >= 3)
		{
			obj.easy = false;
			obj.normal = false;
			obj.hard = true;
		}
	}
	#endregion /*When placing on difficulty layer END*/
	
}