function scr_audio_update_underwater_music_transition()
{
	
	#region /* Transition from normal music to underwater music when underwater */
	var transition_time = 5000; /* 5 seconds transition time, for a really smooth transition */
	
	var current_music_playing = global.music; /* Play the regular music by default */

	if (global.music_boss != noone) /* If there is boss music loaded */
	{
		current_music_playing = global.music_boss; /* Then play the boss music */
	}
	
	var active_players = 0;
	var underwater_players = 0;
	var any_invincible_music = false;
	
	if (instance_exists(obj_camera))
	{
		for (var i = 1; i <= global.max_players; i += 1)
		{
			var player_instance = obj_camera.player[i];
			if (player_instance > 0 && instance_exists(player_instance))
			{
				active_players++;
				if (player_instance.in_water)
				{
					underwater_players++;
				}
				if (player_instance.invincible_timer > 2)
				{
					any_invincible_music = true;
				}
			}
		}
	}
	
	var majority_in_water = (active_players > 0) && (underwater_players > active_players * 0.5);
	var majority_out_of_water = (active_players > 0) && (underwater_players < active_players * 0.5);
	
	if (!variable_global_exists("underwater_music_active"))
	{
		global.underwater_music_active = false;
	}
	
	if (majority_in_water)
	{
		global.underwater_music_active = true;
	}
	else
	if (majority_out_of_water || active_players == 0)
	{
		global.underwater_music_active = false;
	}
	
	if (!any_invincible_music) /* Whenever all the players isn't playing the invincibility music */
	{
		/* Whenever a majority of the current players is underwater */
		if (global.underwater_music_active
		&& (current_music_playing != global.music_boss)) /* If boss music is playing, that should always have priority over playing underwater music */
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
