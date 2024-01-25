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
		taken_damage = 200; /* Invincibility frames */
		if (invincible_timer == 0)
		{
			hp --;
		}
		if (vspeed > 0)
		{
			vspeed = -15;
		}
		scr_audio_play(voice_burned, volume_source.voice);
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