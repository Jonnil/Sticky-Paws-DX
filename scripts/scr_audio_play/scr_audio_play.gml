function scr_audio_play(sound_id = noone, what_volume_source = volume_source.sound, volume_modifier = 1) /* This script is to simplify code when wanting to add sound effects to the game */
{
	if (sound_id >= 0) /* Check if the sound even exists, otherwise the game can crash */
	{
		audio_falloff_set_model(audio_falloff_exponent_distance_scaled);
		var falloff_ref_dist = 100; /*100*/
		var fallof_max_dist = 1100; /*300*/
		var fallof_factor = 1;
		
		#region /* Different audio sources play differently */
		if (what_volume_source == volume_source.ambient)
		{
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, true, global.volume_ambient * volume_modifier * global.volume_main);
			}
		}
		else
		if (what_volume_source == volume_source.footstep)
		{
			audio_stop_sound(sound_id); /* Stop same sound effects from playing before playing another of the same sound effect */
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound_at(sound_id, x, y, 0, falloff_ref_dist, fallof_max_dist, fallof_factor, false, 0, global.volume_footstep * volume_modifier * global.volume_main);
			}
		}
		else
		if (what_volume_source == volume_source.jingle)
		{
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, false, global.volume_jingle * volume_modifier * global.volume_main);
			}
		}
		else
		if (what_volume_source == volume_source.music)
		{
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, true, global.volume_music * volume_modifier * global.volume_main);
			}
		}
		else
		if (what_volume_source == volume_source.sound)
		{
			audio_stop_sound(sound_id); /* Stop same sound effects from playing before playing another of the same sound effect */
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound_at(sound_id, x, y, 0, falloff_ref_dist, fallof_max_dist, fallof_factor, false, 0, global.volume_sound * volume_modifier * global.volume_main);
			}
		}
		else
		if (what_volume_source == volume_source.voice)
		{
			audio_stop_sound(sound_id); /* Stop same sound effects from playing before playing another of the same sound effect */
			if (variable_instance_exists(self, "default_voice_pitch"))
			{
				audio_sound_pitch(sound_id, default_voice_pitch);
			}
			if (!audio_is_playing(sound_id))
			{
				voice = audio_play_sound(sound_id, 0, false, global.volume_voice * volume_modifier * global.volume_main);
			}
		}
		#endregion /* Different audio sources play differently END */
		
	}
}