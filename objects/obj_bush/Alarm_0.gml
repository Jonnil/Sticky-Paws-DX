if (!position_meeting(bbox_left - 1, y - 8, obj_bush))
&& (!position_meeting(bbox_right + 1, y - 8, obj_bush))
{
	image_index = 0;
}
else
if (!position_meeting(bbox_left - 1, y - 8, obj_bush))
&& (position_meeting(bbox_right + 1, y - 8, obj_bush))
{
	image_index = 1;
}
else
if (position_meeting(bbox_left - 1, y - 8, obj_bush))
&& (position_meeting(bbox_right + 1, y - 8, obj_bush))
{
	image_index = 2;
}
else
if (position_meeting(bbox_left - 1, y - 8, obj_bush))
&& (!position_meeting(bbox_right + 1, y - 8, obj_bush))
{
	image_index = 3;
}