function scr_audio_update_underwater_music_transition()
{
	
	#region /* Transition from normal music to underwater music when underwater */
	var transition_time = 5000;

	if (invincible_timer <= 2) /* Whenever the player isn't playing the invincible music */
	{
		if (in_water) /* Whenever the player is underwater */
		{
			if (global.music_underwater != noone)
			{
				if (current_music_playing != noone)
				{
					audio_sound_gain(current_music_playing, 0, transition_time);
				}
			
				audio_sound_gain(global.music_underwater, global.volume_music * global.volume_main, transition_time);
			}
			else
			if (current_music_playing != noone)
			{
				audio_sound_gain(current_music_playing, global.volume_music * global.volume_main, transition_time);
			
				if (global.music_underwater != noone)
				{
					audio_sound_gain(global.music_underwater, 0, transition_time);
				}
			}
		
			if (global.ambience_underwater != noone)
			{
				if (global.ambience != noone)
				{
					audio_sound_gain(global.ambience, 0, transition_time);
				}
			
				audio_sound_gain(global.ambience_underwater, global.volume_ambient * global.volume_main, transition_time);
			}
			else
			if (global.ambience != noone)
			{
				audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, transition_time);
			
				if (global.ambience_underwater != noone)
				{
					audio_sound_gain(global.ambience_underwater, 0, transition_time);
				}
			}
		}
		else
		{
			if (current_music_playing != noone)
			{
				audio_sound_gain(current_music_playing, global.volume_music * global.volume_main, transition_time);
			
				if (global.music_underwater != noone)
				{
					audio_sound_gain(global.music_underwater, 0, transition_time);
				}
			}
		
			if (global.ambience != noone)
			{
				audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, transition_time);
			
				if (global.ambience_underwater != noone)
				{
					audio_sound_gain(global.ambience_underwater, 0, transition_time);
				}
			}
		}
	}
	#endregion /* Transition from normal music to underwater music when underwater END */
	
}