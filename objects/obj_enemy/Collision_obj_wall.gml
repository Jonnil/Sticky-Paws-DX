if (die == false)
{
	if (position_meeting(x, bbox_top - 1, obj_wall))
	&& (die == false)
	&& (vspeed < 0)
	{
		vspeed = 0;
		scr_audio_play(snd_bump, volume_source.sound, 0.1);
	}
	
	#region /* Push out of the solid object */
	while(place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	#endregion /* Push out of the solid object END */

	#region /* Landing on solid object */
	if (place_meeting(x, y + 1, other))
	&& (vspeed > 0)
	{
		if (vspeed > 2)
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
			draw_xscale = 1.25;
			draw_yscale = 0.75;
		}
		vspeed = 0;
		gravity = 0;
	}
	
	#region /* Kill enemy if it's inside the wall */
	if (position_meeting(x, y, other))
	&& (die == false)
	&& (draw_xscale >= 0.8)
	{
		stuck_in_wall_counter ++;
		if (stuck_in_wall_counter >= 3)
		{
			flat = false;
			die = true;
			die_volting = true;
		}
	}
	else
	{
		if (stuck_in_wall_counter > 0)
		{
			stuck_in_wall_counter --;
		}
	}
	#endregion /* Kill enemy if it's inside the wall END */
	
}
#endregion /* Landing on solid object END */