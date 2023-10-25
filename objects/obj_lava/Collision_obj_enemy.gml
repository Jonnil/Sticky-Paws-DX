with(other)
{
	if (!die)
	{
		image_blend = c_dkgray;
		if (vspeed < 0)
		&& (!die)
		{
			die_volting = -1;
		}
		else
		if (!die)
		{
			die_volting = +1;
		}
		vspeed = -8;
		die = true;
	}
}