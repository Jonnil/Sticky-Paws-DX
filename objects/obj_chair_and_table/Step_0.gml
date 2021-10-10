#region /*Set the gravity*/
gravity_direction = 270; /*Direction of the gravity*/
if (asset_get_type("obj_wall") == asset_object)
and(!place_meeting(x, y + 1, obj_wall))
{
	gravity = 0.5; /*The gravity*/
}
else
{
	gravity = 0;
}

if (asset_get_type("obj_semisolid_platform") == asset_object)
{
	if (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 4, obj_semisolid_platform))

	or(position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 4, obj_semisolid_platform))

	or(position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 4, obj_semisolid_platform))
	{
		gravity = 0;
	}
}
#endregion /*Set the gravity END*/