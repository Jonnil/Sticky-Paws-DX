#region /*Turn around*/
if (die=false)
and (other.die=false)
{
	while(place_meeting(x,y,other))
	{
		x+=lengthdir_x(0.5,point_direction(other.x,other.y,x,y));
		y+=lengthdir_y(0.5,point_direction(other.x,other.y,x,y));
	}
	if (position_meeting(bbox_left-1,y,other))
	and (other.die=false)
	{
		image_xscale=+1;
	}
	if (position_meeting(bbox_right+1,y,other))
	and (other.die=false)
	{
		image_xscale=-1;
	}
}
#endregion /*Turn around END*/