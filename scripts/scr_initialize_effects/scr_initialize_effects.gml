function scr_initialize_effects()
{
	
	#region /* Rain Effect */
	if (global.effect_rain)
	{
		if (!part_system_exists(part_system_rain))
		{
			part_system_rain = part_system_create(par_rain_level);
			
			if (!audio_is_playing(snd_rain))
			{
				scr_audio_play(snd_rain, volume_source.ambient); /* Play rain sound */
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
			//	 scr_audio_play(snd_snow, volume_source.ambient);
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
			
			/* Create the FX object and validate it */
			var _fx_wind = fx_create("_effect_windblown_particles");
			
			if (_fx_wind)
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
				show_debug_message("Failed to create wind FX: Invalid FX object. Check FX identifier.");
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