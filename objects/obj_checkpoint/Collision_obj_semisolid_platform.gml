/* Collision Event with a solid object */

if (position_meeting(x, bbox_bottom + 1, other))
|| (position_meeting(x, bbox_bottom + 2, other))
|| (position_meeting(x, bbox_bottom + 3, other))
|| (position_meeting(x, bbox_bottom + 4, other))
|| (position_meeting(bbox_left, bbox_bottom + 1, other))
|| (position_meeting(bbox_left, bbox_bottom + 2, other))
|| (position_meeting(bbox_left, bbox_bottom + 3, other))
|| (position_meeting(bbox_left, bbox_bottom + 4, other))
|| (position_meeting(bbox_right, bbox_bottom + 1, other))
|| (position_meeting(bbox_right, bbox_bottom + 2, other))
|| (position_meeting(bbox_right, bbox_bottom + 3, other))
|| (position_meeting(bbox_right, bbox_bottom + 4, other))
{
	if (vspeed >= 0)
	{
		y --;
	}
}

#region /* Landing on solid object */
if (position_meeting(x, bbox_bottom + 1, other))
|| (position_meeting(bbox_left, bbox_bottom + 1, other))
|| (position_meeting(bbox_right, bbox_bottom + 1, other))
{
	
	#region /* Smoke Landing Effect */
	if (instance_exists(obj_camera))
	&& (obj_camera.iris_xscale > 1)
	{
		if (instance_exists(obj_foreground_secret))
		&& (place_meeting(x, y, obj_foreground_secret))
		&& (obj_foreground_secret.image_alpha < 0.5)
		|| (instance_exists(obj_foreground_secret))
		&& (!place_meeting(x, y, obj_foreground_secret))
		{
			if (vspeed > 2)
			{
				if (position_meeting(x - 24, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x - 24, bbox_bottom - 8, 0, c_white);
				}
				if (position_meeting(x - 16, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
				}
				if (position_meeting(x, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_bottom - 8, 0, c_white);
				}
				if (position_meeting(x + 16, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
				}
				if (position_meeting(x + 24, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x + 24, bbox_bottom - 8, 0, c_white);	
				}
			}
		}
	}
	#endregion /* Smoke Landing Effect END */
	
	if (vspeed >= 0)
	{
		vspeed = 0;
		gravity = 0;
	}
}
#endregion /* Landing on solid object END */
