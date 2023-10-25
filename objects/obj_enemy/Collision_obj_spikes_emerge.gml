#region /* Enemy touching emerging spikes */
if (instance_exists(obj_spikes_emerge))
&& (can_die_from_spikes)
{
	if (instance_nearest(x, y, obj_spikes_emerge).image_angle == 0)
	&& (place_meeting(x, y + 2, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x - 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x + 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	&& (vspeed >= 0)
	|| (instance_nearest(x, y, obj_spikes_emerge).image_angle = 90)
	&& (place_meeting(x + 2, y, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x, y - 1, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x, y + 1, instance_nearest(x, y, obj_spikes_emerge)))
	&& (hspeed >= 0)
	|| (instance_nearest(x, y, obj_spikes_emerge).image_angle = 180)
	&& (place_meeting(x, y - 2, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x - 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x + 1, y, instance_nearest(x, y, obj_spikes_emerge)))
	&& (vspeed <= 0)
	|| (instance_nearest(x, y, obj_spikes_emerge).image_angle = 270)
	&& (place_meeting(x - 2, y, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x, y - 1, instance_nearest(x, y, obj_spikes_emerge)))
	&& (!place_meeting(x, y + 1, instance_nearest(x, y, obj_spikes_emerge)))
	&& (hspeed <= 0)
	{
		if (x < instance_nearest(x, y, obj_spikes_emerge).x)
		&& (!die)
		{
			die_volting = -1;
		}
		else
		if (!die)
		{
			die_volting = +1;
		}
		vspeed = - 8;
		die = true;
	}
}
#endregion /* Enemy touching emerging spikes END */