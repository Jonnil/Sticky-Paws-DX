function scr_get_rewards_when_jumped_on()
{
	if (give_rewards)
	{
		
		#region /* Rewards */
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction <= 1)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction <= 1)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
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
			
			audio_sound_pitch(snd_stomp, 1);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		else
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction = 2)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction = 2)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
			#region /* 2 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			#endregion /* 2 Coin END */
			
			#region /* 400 Score */
			score += 400;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 400;
			}
			#endregion /* 400 Score END */
			
			#region /* 1-up */
			if (global.number_of_chain_kills_for_1up <= 2)
			{
				with(instance_create_depth(x, y - 32, 0, obj_score_up))
				{
					score_up = "1-up";
				}
			}
			#endregion /* 1-up END */
			
			audio_sound_pitch(snd_stomp, 1.1);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		else
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction = 3)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction = 3)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
			#region /* 4 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			#endregion /* 4 Coin END */
			
			#region /* 800 Score */
			score += 800;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 800;
			}
			#endregion /* 800 Score END */
			
			#region /* 1-up */
			if (global.number_of_chain_kills_for_1up <= 3)
			{
				with(instance_create_depth(x, y - 32, 0, obj_score_up))
				{
					score_up = "1-up";
				}
			}
			#endregion /* 1-up END */
			
			audio_sound_pitch(snd_stomp, 1.2);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		else
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction = 4)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction = 4)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
			#region /* 4 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			#endregion /* 4 Coin END */
			
			#region /* 1000 Score */
			score += 1000;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 1000;
			}
			#endregion /* 1000 Score END */
			
			#region /* 1-up */
			if (global.number_of_chain_kills_for_1up <= 4)
			{
				with(instance_create_depth(x, y - 32, 0, obj_score_up))
				{
					score_up = "1-up";
				}
			}
			#endregion /* 1-up END */
			
			audio_sound_pitch(snd_stomp, 1.3);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		else
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction == 5)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction == 5)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
			#region /* 4 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			#endregion /* 4 Coin END */
			
			#region /* 2000 Score */
			score += 2000;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 2000;
			}
			#endregion /* 2000 Score END */
			
			#region /* 1-up */
			if (global.number_of_chain_kills_for_1up <= 5)
			{
				with(instance_create_depth(x, y - 16, 0, obj_score_up))
				{
					score_up = "1-up";
				}
			}
			#endregion /* 1-up END */
			
			audio_sound_pitch(snd_stomp, 1.4);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		else
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction == 6)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction == 6)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
			#region /* 4 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			#endregion /* 4 Coin END */
			
			#region /* 4000 Score */
			score += 4000;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 4000;
			}
			#endregion /* 4000 Score END */
			
			#region /* 1-up */
			if (global.number_of_chain_kills_for_1up <= 6)
			{
				with(instance_create_depth(x, y - 32, 0, obj_score_up))
				{
					score_up = "1-up";
				}
			}
			#endregion /* 1-up */
			
			audio_sound_pitch(snd_stomp, 1.5);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		else
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction == 7)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction == 7)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
			#region /* 4 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			#endregion /* 4 Coin END */
			
			#region /* 8000 Score */
			score += 8000;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 8000;
			}
			#endregion /* 8000 Score END */
			
			#region /* 1-up */
			if (global.number_of_chain_kills_for_1up <= 7)
			{
				with(instance_create_depth(x, y - 32, 0, obj_score_up))
				{
					score_up = "1-up";
				}
			}
			#endregion /* 1-up END */
			
			audio_sound_pitch(snd_stomp, 1.6);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		else
		if (instance_exists(obj_player))
		&& (instance_nearest(x, y, obj_player).chain_reaction >= 8)
		&& (number_of_times_stomped < 10)
		|| (other.chain_reaction >= 8)
		&& (number_of_times_stomped < 10)
		{
			number_of_times_stomped ++;
			
			#region /* 4 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 20;
			}
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 30;
			}
			#endregion /* 4 Coin END */
			
			#region /* 1-up */
			if (global.number_of_chain_kills_for_1up <= 8)
			{
				with(instance_create_depth(x, y - 32, 0, obj_score_up))
				{
					score_up = "1-up";
				}
			}
			#endregion /* 1-up END */
			
			audio_sound_pitch(snd_stomp, 1.7);
			scr_audio_play(snd_stomp, volume_source.sound);
		}
		#endregion /* Rewards END */
		
	}
}