if (!die)
&& (!die_volting)
&& (stomped_delay == 0)
{
	flat = true;
	coil_spring = false;
	stomped_delay = 5;
	vspeed = -10;
	draw_angle = 180;
	if (other.x < x)
	{
		hspeed = +1;
	}
	else
	{
		hspeed = -1;
	}

	effect_create_depth(depth - 1, ef_smoke, x, y, 2, c_white);
	if (instance_exists(obj_player))
	{
		scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.5, 10);
	}

	scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);

	#region /* Rewards */
	if (number_of_times_stomped < 10)
	&& (!empty)
	{
		number_of_times_stomped++;

		#region /* 1 Coin */
		with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
		{
			image_speed = 1;
			motion_set(90, 10);
			bounce_up = true;
		}
		#endregion /* 1 Coin END */

		#region /* 200 Score */
		score += 200;
		with(instance_create_depth(x, y, 0, obj_score_up))
		{
			score_up = 200;
		}
		#endregion /* 200 Score END */

		#region /* 1-up */
		if (global.number_of_chain_kills_for_1up <= 1)
		{
			with(instance_create_depth(x, y - 32, 0, obj_score_up))
			{
				score_up = "1-up";
			}
		}
		#endregion /* 1-up END */

	}
	#endregion /* Rewards END */

	audio_sound_pitch(snd_stomp, 1);
	scr_audio_play(snd_stomp, volume_source.sound);
}
