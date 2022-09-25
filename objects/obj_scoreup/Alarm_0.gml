if (scoreup = "1-UP")
{
	global.hud_show_lives = true;
	lives += 1;
	audio_sound_pitch(snd_1up, 1);
	scr_audio_play(snd_1up, global.sound_volume);
}
else
if (scoreup = "2-UP")
{
	global.hud_show_lives = true;
	lives += 2;
	audio_sound_pitch(snd_1up, 1.1);
	scr_audio_play(snd_1up, global.sound_volume);
}
else
if (scoreup = "3-UP")
{
	global.hud_show_lives = true;
	lives += 3;
	audio_sound_pitch(snd_1up, 1.2);
	scr_audio_play(snd_1up, global.sound_volume);
}