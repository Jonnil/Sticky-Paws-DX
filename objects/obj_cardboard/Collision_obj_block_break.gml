if (place_meeting(x, y, obj_block_break))
{
	alarm[1] = 1; /* Break cardboard */
	break_cardboard_source_x = other.x;
	if (instance_exists(obj_player))
	{
		break_cardboard_source_speed = instance_nearest(x, y, obj_player).speed;
	}
	else
	{
		break_cardboard_source_speed = random_range(1, 2);
	}
}