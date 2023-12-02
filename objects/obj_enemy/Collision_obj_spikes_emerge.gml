#region /* Enemy touching emerging spikes */
if (can_die_from_spikes)
{
	if (other.image_angle == 0)
	&& (place_meeting(x, y + 2, other))
	&& (!place_meeting(x - 1, y, other))
	&& (!place_meeting(x + 1, y, other))
	//&& (vspeed >= 0)
	|| (other.image_angle = 90)
	&& (place_meeting(x + 2, y, other))
	&& (!place_meeting(x, y - 1, other))
	&& (!place_meeting(x, y + 1, other))
	//&& (hspeed >= 0)
	|| (other.image_angle = 180)
	&& (place_meeting(x, y - 2, other))
	&& (!place_meeting(x - 1, y, other))
	&& (!place_meeting(x + 1, y, other))
	//&& (vspeed <= 0)
	|| (other.image_angle = 270)
	&& (place_meeting(x - 2, y, other))
	&& (!place_meeting(x, y - 1, other))
	&& (!place_meeting(x, y + 1, other))
	//&& (hspeed <= 0)
	{
		if (x < other.x)
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
#endregion /* Enemy touching emerging spikes END */