function scr_audio_play(sound_id, what_volume_source = volume_source.sound, volume_modifier = 1) /* This script is to simplify code when wanting to add sound effects to the game */
{
	var sound_exists = sound_id >= 0;

	if (sound_exists) /* Check if the sound even exists, otherwise the game can crash */
	{
		audio_falloff_set_model(audio_falloff_exponent_distance_scaled);
		var falloff_ref_dist = 100;
		var fallof_max_dist = 1100;
		var fallof_factor = 1;

		#region /* Different audio sources play differently */
		if (what_volume_source == volume_source.ambient)
		{
			audio_sound_gain(sound_id, global.volume_ambient * volume_modifier * global.volume_main, 0);
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, true);
			}
		}
		else
		if (what_volume_source == volume_source.footstep)
		{
			audio_sound_gain(sound_id, global.volume_footstep * volume_modifier * global.volume_main, 0);
			audio_stop_sound(sound_id); /* Stop same sound effects from playing before playing another of the same sound effect */
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound_at(sound_id, x, y, 0, falloff_ref_dist, fallof_max_dist, fallof_factor, false, 0);
			}
		}
		else
		if (what_volume_source == volume_source.melody)
		{
			audio_sound_gain(sound_id, global.volume_melody * volume_modifier * global.volume_main, 0);
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, false);
			}
		}
		else
		if (what_volume_source == volume_source.music)
		{
			audio_sound_gain(sound_id, global.volume_music * volume_modifier * global.volume_main, 0);
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound(sound_id, 0, true);
			}
		}
		else
		if (what_volume_source == volume_source.sound)
		{
			audio_sound_gain(sound_id, global.volume_sound * volume_modifier * global.volume_main, 0);
			audio_stop_sound(sound_id); /* Stop same sound effects from playing before playing another of the same sound effect */
			if (!audio_is_playing(sound_id))
			{
				audio_play_sound_at(sound_id, x, y, 0, falloff_ref_dist, fallof_max_dist, fallof_factor, false, 0);
			}
		}
		else
		if (what_volume_source == volume_source.voice)
		{
			if (object_index == obj_player)
			{
				scr_player_move_choose_voice_clips(); /* If "obj player" is running this "scr audio play" script, then choose random voice clip with this custom script */
			}
			audio_sound_gain(sound_id, global.volume_voice * volume_modifier * global.volume_main, 0);
			audio_stop_sound(sound_id); /* Stop same sound effects from playing before playing another of the same sound effect */
			if (variable_instance_exists(self, "default_voice_pitch"))
			{
				audio_sound_pitch(sound_id, default_voice_pitch);
			}
			if (!audio_is_playing(sound_id))
			{
				voice = audio_play_sound(sound_id, 0, false);
			}
		}
		#endregion /* Different audio sources play differently END */

	}
}
