while(place_meeting(x, y,other))
{
	x+=lengthdir_x(0.5,point_direction(other.x, other.y, x, y));
	y+=lengthdir_y(0.5,point_direction(other.x, other.y, x, y));
}
if (place_meeting(x, bbox_bottom + 1,other))
{
	vspeed = 0;
	gravity = 0;
}
if (place_meeting(x, y - 1,other))
{
	vspeed+=4;
}
if (position_meeting(bbox_left - 1,bbox_bottom-8, other))
or (position_meeting(bbox_left - 1,bbox_top+8, other))
{
	hspeed = 0;
}
if (position_meeting(bbox_right + 1,bbox_bottom-8, other))
or (position_meeting(bbox_right + 1,bbox_top+8, other))
{
	hspeed = 0;
}