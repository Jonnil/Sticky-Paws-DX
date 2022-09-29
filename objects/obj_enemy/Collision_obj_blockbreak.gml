/* Collision Event with player object */
if (die = false)
{
	if (die_volting = false)
	{
		global.enemy_counter += 1;
		if (other.x < x)
		{
			vspeed = - 8;
			die_volting = -1;
			die = true;
		}
		else
		{
			vspeed = - 8;
			die_volting = +1;
			die = true;
		}
		effect_create_above(ef_smoke, x, y, 2, c_white);
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		{
			scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.5, 10);
		}
		
		scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
		
		#region /* Rewards */
		
		#region /* 1 Coin */
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounceup = true;
			}
		}
		#endregion /* 1 Coin END */
		
		#region /* 200 Score */
		score += 200;
		if (asset_get_type("obj_scoreup") == asset_object)
		{
			with(instance_create_depth(x, y, 0, obj_scoreup))
			{
				scoreup = 200;
			}
		}
		#endregion /* 200 Score END */
		
		#endregion /* Rewards END */
		
		audio_sound_pitch(snd_stomp, 1);
		scr_audio_play(snd_stomp, volume_source.sound);
	}
}