cutscene_time += 1;
if (cutscene_time = 60*3)
{
	audio_play_sound(cutscene_ahh,0,0);
	audio_sound_gain(cutscene_ahh,global.voices_volume,0);
	image_index = 1;
	image_speed = 0;
}
if (cutscene_time = 60*6)
{
	audio_play_sound(cutscene_huh,0,0);
	audio_sound_gain(cutscene_huh,global.voices_volume,0);
	image_index = 2;
	image_speed = 0;
}
if (cutscene_time = 60*8)
{
	audio_play_sound(cutscene_scream,0,0);
	audio_sound_gain(cutscene_scream,global.voices_volume,0);
	sprite_index = sprite_cutscene_suprised;
	image_index = 0;
	image_speed = 1;
}
if (cutscene_time > 60*9)
and (asset_get_type("snd_cutscene_scream")==asset_sound)
and (!audio_is_playing(snd_cutscene_scream))
{
	with(obj_camera)
	{
		player1 = instance_create_depth(x, y-16, 0, obj_player);
	}
	with(obj_player)
	{
		allow_timeattack = false;
		allow_timeup = false;
		hspeed = +8;
		vspeed = -8;
	}
	instance_destroy();
}