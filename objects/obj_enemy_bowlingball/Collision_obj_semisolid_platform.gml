if (die_volting == false)
|| (die == false)
{
	
	#region /* Push out of the solid object */
	if (position_meeting(x, bbox_bottom + 1, other))
	{
		y --;
	}
	#endregion /* Push out of the solid object END */

	#region /* Landing on solid object */
	if (position_meeting(x, bbox_bottom + 1, other))
	&& (vspeed >= 0)
	{
		if (instance_exists(obj_foreground_secret))
		&& (place_meeting(x, y, obj_foreground_secret))
		&& (obj_foreground_secret.image_alpha < 0.5)
		|| (instance_exists(obj_foreground_secret))
		&& (!place_meeting(x, y, obj_foreground_secret))
		{
			if (instance_exists(obj_camera))
			&& (obj_camera.iris_xscale > 1)
			{
				effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
				effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
				effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
				effect_create_above(ef_smoke, x - 16 - 8,bbox_bottom- 8, 0, c_white);
				effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
				effect_create_above(ef_smoke, x + 16 + 8,bbox_bottom- 8, 0, c_white);
			}
		}
		vspeed = 0;
		gravity = 0;
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
}
#endregion /* Landing on solid object END */