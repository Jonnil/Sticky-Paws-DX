#region /*Turn around*/
if (die = false)
and (sliding_along_ground = 0)
and (other.die = false)
{
	while(place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	if (position_meeting(bbox_left - 1, y, other))
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, other))
	{
		image_xscale = -1;
	}
}
#endregion /*Turn around END*/

if (sliding_along_ground = +1)
and (other.die = false)
and (die = false)
or (sliding_along_ground = -1)
and (other.die = false)
and (die = false)
{
	if (other.x < x)
	{
		other.die = true;
		other.die_volting = +1;
		other.hspeed = +4;
		other.vspeed = -4;
		if (other.sliding_along_ground <> 0)
		{
			die = true;
			die_volting = -1;
			hspeed = -4;
			vspeed = -4;
		}
	}
	else
	{
		other.die = true;
		other.die_volting = -1;
		other.hspeed = -4;
		other.vspeed = -4;
		if (other.sliding_along_ground <> 0)
		{
			die = true;
			die_volting = +1;
			hspeed = +4;
			vspeed = -4;
		}
	}
}

if (die = false)
and (other.die = false)
and (other.speed > speed)
and (other.flat = true)
and (other.sliding_along_ground = 0)
{
	if (die_volting = false)
	and (other.die_volting = false)
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

		#region /*Enemy Voice Defeated*/
		audio_play_sound(choose(enemyvoice_defeated1,enemyvoice_defeated2,enemyvoice_defeated3), 0, 0);
		audio_sound_gain(enemyvoice_defeated1, global.voices_volume, 0);
		audio_sound_gain(enemyvoice_defeated2, global.voices_volume, 0);
		audio_sound_gain(enemyvoice_defeated3, global.voices_volume, 0);
		#endregion /*Enemy Voice Defeated END*/
		
		#region /*Rewards*/
		
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
		
		#endregion /*Rewards END*/
		
		if (asset_get_type("snd_stomp") == asset_sound)
		{
			audio_play_sound(snd_stomp, 0, 0);
			audio_sound_gain(snd_stomp, global.sfx_volume, 0);
			audio_sound_pitch(snd_stomp, 1);
		}
	}
}