function scr_coil_spring_bouncing()
{

	#region /* Coil spring bouncing code */
	if (coil_spring && !die && on_ground)
	{
		if (instance_exists(obj_foreground_secret))
		&& (place_meeting(x, y, obj_foreground_secret))
		&& (obj_foreground_secret.image_alpha < 0.5)
		|| (instance_exists(obj_foreground_secret))
		&& (!place_meeting(x, y, obj_foreground_secret))
		{
			if (instance_exists(obj_camera) && obj_camera.iris_xscale > 1)
			{
				for(var i = 0; i < 3; i++)
				{
					effect_create_depth(depth - 1, ef_smoke, x + random_range(-16, 16), bbox_bottom + random_range(-8, 0), 0, c_white);
				}
			}
			scr_audio_play(snd_spring, volume_source.sound, 0.1);
		}
		vspeed = -15;
		gravity = 0;
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
	#endregion /* Coil spring bouncing code END */

}
