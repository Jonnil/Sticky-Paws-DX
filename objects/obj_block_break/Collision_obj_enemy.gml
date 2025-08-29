with(other)
{
	if (die = false)
	{
		if (die_volting = false)
		{
			die = true;
			if (other.x < x)
			{
				die_volting = - 1;
				vspeed = - 8;
			}
			else
			{
				die_volting = +1;
				vspeed = - 8;
			}
		}
	}
}
