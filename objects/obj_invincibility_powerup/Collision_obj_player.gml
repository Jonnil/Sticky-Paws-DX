#region /* Collect Invincibility Powerup */
if (!bounce_up)
{
	global.level_score += 1000;
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
	}
	with(instance_create_depth(x, y, 0, obj_score_up))
	{
		score_up = 1000;
	}
	with(other)
	{
		chain_reaction = 0;
		invincible_timer = default_invincibility_duration_in_frames;
		scr_audio_play(voice_get_star, volume_source.voice);
	}
	instance_destroy(); /* Delete after doing all other code */
}
#endregion /* Collect Invincibility Powerup END */
