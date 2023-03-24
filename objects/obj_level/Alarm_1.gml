#region /* Unlock next level after setting own clear rate to clear */
/* This makes sure that if the level somehow loads as "enter" when it's supposed to load as "clear", */
/* when you reload the save file, it will still unlock the next level and correct itself. */
/* Reloading a save file always sets the clear rate correctly. */
/* Better to have the unlock level code in obj_level than obj_player_map */
if (clear_rate = "clear")
{
	with(instance_create_depth(x, y, 0, obj_unlock_next_level))
	{
		if (instance_exists(obj_level))
		{
			come_from_level = instance_nearest(x, y, obj_level).level;
		}
		hspeed -= move_speed;
	}
	with(instance_create_depth(x, y, 0, obj_unlock_next_level))
	{
		if (instance_exists(obj_level))
		{
			come_from_level = instance_nearest(x, y, obj_level).level;
		}
		hspeed += move_speed;
	}
	with(instance_create_depth(x, y, 0, obj_unlock_next_level))
	{
		if (instance_exists(obj_level))
		{
			come_from_level = instance_nearest(x, y, obj_level).level;
		}
		vspeed -= move_speed;
	}
	with(instance_create_depth(x, y, 0, obj_unlock_next_level))
	{
		if (instance_exists(obj_level))
		{
			come_from_level = instance_nearest(x, y, obj_level).level;
		}
		vspeed += move_speed;
	}
}
global.goal_active = false;
#endregion /* Unlock next level after setting own clear rate to clear END */