/*Collision Event with player object*/
if (die = false)
and (die_volting = false)
and (vspeed >= 0)
and (stomped_delay = 0)
{
	flat = true;
	coil_spring = false;
	stomped_delay = 10;
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
	
	effect_create_above(ef_smoke, x, y, 2, c_white);
	
	#region /*Enemy Voice Defeated*/
	audio_play_sound(choose(enemyvoice_defeated1,enemyvoice_defeated2,enemyvoice_defeated3), 0, 0);
	audio_sound_gain(enemyvoice_defeated1, global.voices_volume * global.main_volume, 0);
	audio_sound_gain(enemyvoice_defeated2, global.voices_volume * global.main_volume, 0);
	audio_sound_gain(enemyvoice_defeated3, global.voices_volume * global.main_volume, 0);
	#endregion /*Enemy Voice Defeated END*/
	
	#region /*Rewards*/
	if (number_of_times_stomped < 10)
	{
		number_of_times_stomped += 1;
		
		#region /* 1 Coin*/
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			var obj;
			obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				motion_set(90, 10);
				bounceup = true;
			}
		}
		#endregion /* 1 Coin END*/
		
		#region /* 200 Score*/
		score += 200;
		if (asset_get_type("obj_scoreup") == asset_object)
		{
			obj = instance_create_depth(x, y, 0, obj_scoreup);
			with(obj)
			{
				scoreup = 200;
			}
		}
		#endregion /* 200 Score END*/
		
		#region /* 1-UP*/
		if (global.number_of_chain_kills_for_1up <= 1)
		{
			lives+= 1;
			global.hud_show_lives = true;
			if (asset_get_type("snd_1up") == asset_sound)
			{
				audio_play_sound(snd_1up, 0, 0);
				audio_sound_gain(snd_1up, global.sound_volume * global.main_volume, 0);
			}
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				obj = instance_create_depth(x, y - 32, 0, obj_scoreup);
				with(obj)
				{
					scoreup = "1-UP";
				}
			}
		}
		#endregion /* 1-UP END*/
		
	}
	#endregion /*Rewards END*/
	
	if (asset_get_type("snd_stomp") == asset_sound)
	{
		audio_play_sound(snd_stomp, 0, 0);
		audio_sound_gain(snd_stomp, global.sound_volume * global.main_volume, 0);
		audio_sound_pitch(snd_stomp, 1);
	}
}