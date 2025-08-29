if (place_meeting(x, y, obj_key_fragment))
{
	with(instance_nearest(x, y, obj_key_fragment))
	{
		if (key_fragment == 0)
		{
			key_fragment = instance_nearest(x, y, obj_key_fragment_number).key_fragment;
		}
	}
}
