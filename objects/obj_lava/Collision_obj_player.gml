#region /* Burnt */
with(other)
{
	if (allow_survive_lava)
	&& (hp > 0)
	{
		burnt = true;
		dive = false;
		ground_pound = false;
		stick_to_wall = false;
		crouch = false;
		speed_max = 8;
		taken_damage = 100;
		if (invincible_timer <= false)
		{
			scr_audio_play(voice_burned, volume_source.voice);
			hp --;
		}
		else
		if (invincible_timer >= true)
		{
			scr_audio_play(voice_burned, volume_source.voice);
		}
		if (vspeed > 0)
		{
			vspeed = -15;
		}
	}
	else
	if (global.goal_active == false)
	{
		die = true;
	}
}
#endregion /* Burnt END */