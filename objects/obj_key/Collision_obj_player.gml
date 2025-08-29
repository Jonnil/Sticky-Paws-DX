if (follow_player == noone)
{
	follow_player = other;
	other.keys += 1;
	what_key = other.keys;

	if (what_key >= 2)
	{
		nearest_key = instance_nth_nearest(other.x, other.y, obj_key_follow, other.keys - 1);
	}
}

with(instance_create_depth(x, y, 0, obj_key_follow))
{
	follow_player = instance_nearest(x, y, obj_key).follow_player;
	what_key = instance_nearest(x, y, obj_key).what_key;
	nearest_key = instance_nearest(x, y, obj_key).nearest_key;
}

instance_destroy();
