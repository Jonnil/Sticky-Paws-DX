if (place_meeting(x, y, obj_big_collectible))
{
	with(instance_nearest(x, y, obj_big_collectible))
	{
		if (big_collectible == 0)
		{
			big_collectible = instance_nearest(x, y, obj_big_collectible_number).big_collectible;
		}
	}
}
