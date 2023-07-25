#region /* Touch Player */
if (bounce_up == false)
{
	scr_audio_play(snd_basic_collectible, volume_source.sound);
	alarm[0] = 1; /* Collect the basic collectible */
}
#endregion /* Touch Player END */