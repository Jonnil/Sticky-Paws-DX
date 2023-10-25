#region /* Burnt */
with(other)
{
	if (allow_survive_lava)
	&& (hp > 0)
	&& (!burnt)
	&& (!global.goal_active)
	{
		burnt = true;
		dive = false;
		ground_pound = false;
		stick_to_wall = false;
		crouch = false;
		speed_max = 8;
		taken_damage = 100;
		scr_audio_play(voice_burned, volume_source.voice);
		if (invincible_timer <= false)
		{
			hp --;
		}
		if (vspeed > 0)
		{
			vspeed = -15;
		}
	}
	else
	if (!global.goal_active)
	{
		burnt = true;
		invincible_timer = 0;
		die = true;
	}
}
#endregion /* Burnt END */