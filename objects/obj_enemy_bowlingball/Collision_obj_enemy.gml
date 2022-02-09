#region /*Turn around*/
if (die = false)
and (sliding_along_ground = 0)
{
	while(place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	if (position_meeting(bbox_left - 1, y, other))
	and (other.die = false)
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, other))
	and (other.die = false)
	{
		image_xscale = -1;
	}
}
#endregion /*Turn around END*/

if (sliding_along_ground = +1)
or (sliding_along_ground = -1)
{
	with(other)
	{
		if (instance_nearest(x, y, obj_enemy_bowlingball).x < x)
		{
			die = true;
			die_volting = +1;
			hspeed = +4;
			vspeed = -4;
		}
		else
		{
			die = true;
			die_volting = -1;
			hspeed = -4;
			vspeed = -4;
		}
	}
}