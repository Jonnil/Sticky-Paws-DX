#region /*Landing on solid object*/
if (position_meeting(x, bbox_bottom + 1, other))
or (position_meeting(x, bbox_bottom + 2, other))
or (position_meeting(x, bbox_bottom + 3, other))
or (position_meeting(x, bbox_bottom + 4, other))
or (position_meeting(bbox_left, bbox_bottom + 1, other))
or (position_meeting(bbox_left, bbox_bottom + 2, other))
or (position_meeting(bbox_left, bbox_bottom + 3, other))
or (position_meeting(bbox_left, bbox_bottom + 4, other))
or (position_meeting(bbox_right, bbox_bottom + 1, other))
or (position_meeting(bbox_right, bbox_bottom + 2, other))
or (position_meeting(bbox_right, bbox_bottom + 3, other))
or (position_meeting(bbox_right, bbox_bottom + 4, other))
{
	if (vspeed >= 0)
	{
		y -= 1;
	}
}

if (position_meeting(x, bbox_bottom + 1, other))
or (position_meeting(bbox_left, bbox_bottom + 1, other))
or (position_meeting(bbox_right, bbox_bottom + 1, other))
{
	if (vspeed >= 0)
	{
		vspeed = 0;
		gravity = 0;
	}
}
#endregion /*Landing on solid object END*/
