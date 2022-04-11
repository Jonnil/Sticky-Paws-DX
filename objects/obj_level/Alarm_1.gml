if (clear_rate = "clear")
{
	with(instance_create_depth(x - 32, y, 0, obj_unlock_next_level))
	{
		hspeed -= move_speed;
	}
	with(instance_create_depth(x + 32, y, 0, obj_unlock_next_level))
	{
		hspeed += move_speed;
	}
	with(instance_create_depth(x, y - 32, 0, obj_unlock_next_level))
	{
		vspeed -= move_speed;
	}
	with(instance_create_depth(x, y + 32, 0, obj_unlock_next_level))
	{
		vspeed += move_speed;
	}
}
