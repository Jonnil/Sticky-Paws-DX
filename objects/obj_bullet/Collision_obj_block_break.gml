/* Collision Event with player object */
if (!die)
{
	if (!die_volting)
	{
		die = true;
		instance_create_depth(xstart, ystart, 0, obj_blaster_reward_decrease_mask);
		global.enemy_counter++;
		if (other.x < x)
		{
			vspeed = -8;
			die_volting = -1;
		}
		else
		{
			vspeed = -8;
			die_volting = +1;
		}
		effect_create_above(ef_smoke, x, y, 2, c_white);
		if (instance_exists(obj_player))
		{
			scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.5, 10);
		}

		scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);

		#region /* Rewards */

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

		#endregion /* Rewards END */

		audio_sound_pitch(snd_stomp, 1);
		scr_audio_play(snd_stomp, volume_source.sound);
	}
}
