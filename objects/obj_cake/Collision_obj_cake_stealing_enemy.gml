if (taken = false)
and (taken_intro = true)
{
	audio_play_sound(snd_dive, 0, 0);
	audio_sound_gain(snd_dive, global.sound_volume * global.main_volume, 0);
	taken = true;
}
x = other.x;
y = other.y - 16;