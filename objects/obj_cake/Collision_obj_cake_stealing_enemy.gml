if (!taken)
&& (taken_intro)
{
	scr_audio_play(snd_dive, volume_source.sound);
	taken = true;
}
x = other.x;
y = other.y - 16;
has_gravity = false;
