#region /* Turn around */
if (!die)
&& (other.die == false)
{
	if (!place_meeting(x, y, obj_bullet))
	&& (!place_meeting(x, y, obj_arrow))
	{
		while(place_meeting(x, y, other))
		{
			x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
			y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
		}
	}
	if (position_meeting(bbox_left - 1, y, other))
	&& (!position_meeting(bbox_left - 1, y, obj_bullet))
	&& (!position_meeting(bbox_left - 1, y, obj_arrow))
	&& (other.die == false)
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, other))
	&& (!position_meeting(bbox_right + 1, y, obj_bullet))
	&& (!position_meeting(bbox_right + 1, y, obj_arrow))
	&& (other.die == false)
	{
		image_xscale = -1;
	}
}
#endregion /* Turn around END */