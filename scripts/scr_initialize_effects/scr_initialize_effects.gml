function scr_initialize_effects()
{

	#region /* Rain Effect */
	if (global.effect_rain)
	{
		if (!part_system_exists(part_system_rain))
		{
			part_system_rain = part_system_create(par_rain_level);
			
			if (global.ambience == noone)
			{
				global.ambience = snd_rain;
			}
			
			if (!audio_is_playing(global.ambience))
			{
				scr_audio_play(global.ambience, volume_source.ambient); /* Play rain sound */
			}
		}
	}
	#endregion /* Rain Effect END */

	#region /* Snow Effect */
	if (global.effect_snow)
	{
		if (!part_system_exists(part_system_snow))
		{
			part_system_snow = part_system_create(par_snow);

			// Uncomment if you want to play snow sound
			// if (!audio_is_playing(snd_snow))
			// {
			//     scr_audio_play(snd_snow, volume_source.ambient);
			// }
		}
	}
	#endregion /* Snow Effect END */

	#region /* Wind Effect */
	if (global.effect_wind)
	{
		if (!layer_exists("WindEffectLayer"))
		{
			layer_create(-100, "WindEffectLayer");
			
			/* Build the FX identifier without using a direct string literal */
			/* This avoids hard-linking the windblown particles prefab so the game can still build even if the prefab is not installed */
			var _fx_identifier_wind = "_effect_" + "windblown_particles";
			
			/* Create the FX object and validate it */
			var _fx_wind = fx_create(_fx_identifier_wind);
			
			/* fx_create() returns -1 on failure, so we must check explicitly. Using "if (_fx_wind)" would treat -1 as true, which is invalid */
			if (_fx_wind != -1)
			{
				fx_set_parameter(_fx_wind, "param_num_particles", 9); /* No more than 9 particles for better performance */
				fx_set_parameter(_fx_wind, "param_particle_spawn_all_at_start", false);
				fx_set_parameter(_fx_wind, "param_particle_initial_velocity_range_x_min", -50);
				fx_set_parameter(_fx_wind, "param_particle_initial_velocity_range_y_min", -50);
				fx_set_parameter(_fx_wind, "param_trails_only", true);
				fx_set_parameter(_fx_wind, "param_trail_chance", 100);
				fx_set_parameter(_fx_wind, "param_blower_force_min", 2);
				fx_set_parameter(_fx_wind, "param_blower_force_max", 7);
				fx_set_parameter(_fx_wind, "param_grav_accel", 150);
				
				layer_set_fx("WindEffectLayer", _fx_wind);
			}
			else
			{
				/* If we get here, the prefab is missing or the FX type is invalid. We keep the layer but simply don't apply an effect */
				show_debug_message("Failed to create wind FX: FX prefab missing or invalid. Skipping wind effect");
			}
		}
	}
	else
	if (layer_exists("WindEffectLayer"))
	{
		layer_destroy("WindEffectLayer");
	}
	#endregion /* Wind Effect END */
	
}
