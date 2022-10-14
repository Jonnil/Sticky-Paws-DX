#region /* Collect Invincibility Powerup */
if (bounce_up == false)
{
	audio_sound_gain(global.music, 0, 0);
	audio_sound_gain(global.music_underwater, 0, 0);
	if (!audio_is_playing(snd_music_invincible))
	{
		scr_audio_play(snd_music_invincible, volume_source.music);
	}
	score += 1000;
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_score_timer = global.hud_hide_time * 60;
		}
	}
	if (asset_get_type("obj_score_up") == asset_object)
	{
		with(instance_create_depth(x, y, 0, obj_score_up))
		{
			score_up = 1000;
		}
	}
	with(other)
	{
		chain_reaction = 0;
		invincible = true;
		scr_audio_play(voice_get_star, volume_source.voice);
	}
	instance_destroy(); /* Delete after doing all other code */
}
#endregion /* Collect Invincibility Powerup END*/