if (asset_get_type("snd_water_getout") == asset_sound)
{
	audio_play_sound(snd_water_getout, 0, 0);
	audio_sound_gain(snd_water_getout, global.sfx_volume, 0);
}