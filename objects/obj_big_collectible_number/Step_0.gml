if (place_meeting(x, y, obj_big_collectible))
{
	with(instance_nearest(x, y, obj_big_collectible))
	{
		big_collectible = instance_nearest(x, y, obj_big_collectible_number).big_collectible;
		big_collectible_number_max = instance_nearest(x, y, obj_big_collectible_number).big_collectible_number_max;
	}
}