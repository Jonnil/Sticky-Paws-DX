if (!die_volting)
|| (!die)
{
	if (sliding_along_ground == -1)
	&& (flat)
	&& (position_meeting(bbox_left - 1, y, obj_wall))
	{
		stomped_delay = 0;
		sliding_along_ground = +1;
		scr_audio_play(snd_bump, volume_source.sound, 0.1);
	}
	else
	if (sliding_along_ground == +1)
	&& (flat)
	&& (position_meeting(bbox_right + 1, y, obj_wall))
	{
		stomped_delay = 0;
		sliding_along_ground = -1;
		scr_audio_play(snd_bump, volume_source.sound, 0.1);
	}

	if (place_meeting(x, bbox_top - 1, obj_wall))
	&& (!die)
	&& (vspeed < 0)
	{
		vspeed = 0;
		scr_audio_play(snd_bump, volume_source.sound, 0.1);
		with(instance_create_depth(x, bbox_top - 18, 0, obj_block_break))
		{
			image_yscale = 0.1;
		}
	}

	#region /* Push out of the solid object */
	while(place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	#endregion /* Push out of the solid object END */

	#region /* Landing on solid object */
	if (place_meeting(x, bbox_bottom + 1, other))
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
				effect_create_depth(depth - 1, ef_smoke, x - 16, bbox_bottom, 0, c_white);
				effect_create_depth(depth - 1, ef_smoke, x, bbox_bottom, 0, c_white);
				effect_create_depth(depth - 1, ef_smoke, x + 16, bbox_bottom, 0, c_white);
				effect_create_depth(depth - 1, ef_smoke, x - 16 - 8, bbox_bottom- 8, 0, c_white);
				effect_create_depth(depth - 1, ef_smoke, x, bbox_bottom- 8, 0, c_white);
				effect_create_depth(depth - 1, ef_smoke, x + 16 + 8, bbox_bottom- 8, 0, c_white);
			}
		}
		vspeed = 0;
		gravity = 0;
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
	#endregion /* Landing on solid object END */

}
