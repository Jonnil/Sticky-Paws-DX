#region /*Turn around*/
if (die = false)
and (sliding_along_ground = 0)
and (other.die = false)
{
	while(place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	if (position_meeting(bbox_left - 1, y, other))
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, other))
	{
		image_xscale = -1;
	}
}
#endregion /*Turn around END*/

if (sliding_along_ground = +1)
and (other.die = false)
and (die = false)
or (sliding_along_ground = -1)
and (other.die = false)
and (die = false)
{
	if (other.x < x)
	{
		other.die = true;
		other.die_volting = +1;
		other.hspeed = +4;
		other.vspeed = -4;
		if (other.sliding_along_ground <> 0)
		{
			die = true;
			die_volting = -1;
			hspeed = -4;
			vspeed = -4;
		}
	}
	else
	{
		other.die = true;
		other.die_volting = -1;
		other.hspeed = -4;
		other.vspeed = -4;
		if (other.sliding_along_ground <> 0)
		{
			die = true;
			die_volting = +1;
			hspeed = +4;
			vspeed = -4;
		}
	}
}