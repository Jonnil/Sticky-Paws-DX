function scr_audio_play(soundid, volume_source) /*This script is to just simplify code when wanting to add sound effects to the game*/
{
	if (soundid >= 0) /*Check if the sound even exists, otherwise the game can crash*/
	{
		
		#region /*Loop*/
		if (volume_source = global.ambient_volume)
		or (volume_source = global.music_volume)
		{
			var loop = true;
		}
		else
		{
			var loop = false;
			audio_stop_sound(soundid); /*Stop same sound effects from playing before playing another of the same sound effect*/
		}
		#endregion /*Loop END*/
		
		if (!audio_is_playing(soundid))
		{
			auudio_play_sound(soundid, 0, loop, volume_source * global.main_volume);
		}
	}
}