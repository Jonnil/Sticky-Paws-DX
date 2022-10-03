if (scoreup == "1-up")
{
	global.hud_show_lives = true;
	var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
	{
		lives += 1;
		audio_sound_pitch(snd_1up, 1);
		scr_audio_play(snd_1up, volume_source.sound);
	}
	, [], 1);
	time_source_start(time_source);
}
else
if (scoreup == "2-up")
{
	global.hud_show_lives = true;
	var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
	{
		lives += 1;
		audio_sound_pitch(snd_1up, 1);
		scr_audio_play(snd_1up, volume_source.sound);
	}
	, [], 1);
	time_source_start(time_source);
	var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function()
	{
		lives += 1;
		audio_sound_pitch(snd_1up, 1.1);
		scr_audio_play(snd_1up, volume_source.sound);
	}
	, [], 1);
	time_source_start(time_source);
}
else
if (scoreup == "3-up")
{
	global.hud_show_lives = true;
	var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
	{
		lives += 1;
		audio_sound_pitch(snd_1up, 1);
		scr_audio_play(snd_1up, volume_source.sound);
	}
	, [], 1);
	time_source_start(time_source);
	var time_source = time_source_create(time_source_game, 20, time_source_units_frames, function()
	{
		lives += 1;
		audio_sound_pitch(snd_1up, 1.1);
		scr_audio_play(snd_1up, volume_source.sound);
	}
	, [], 1);
	time_source_start(time_source);
	var time_source = time_source_create(time_source_game, 30, time_source_units_frames, function()
	{
		lives += 1;
		audio_sound_pitch(snd_1up, 1.2);
		scr_audio_play(snd_1up, volume_source.sound);
	}
	, [], 1);
	time_source_start(time_source);
}