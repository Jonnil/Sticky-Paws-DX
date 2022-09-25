#region /*Turn around*/
if (die = false)
and (sliding_along_ground = 0)
and (other.die = false)
{
	if (!place_meeting(x, y, obj_bullet))
	and (!place_meeting(x, y, obj_arrow))
	{
		while(place_meeting(x, y, other))
		{
			x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
			y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
		}
	}
	if (position_meeting(bbox_left - 1, y, other))
	and (!position_meeting(bbox_left - 1, y, obj_bullet))
	and (!position_meeting(bbox_left - 1, y, obj_arrow))
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, other))
	and (!position_meeting(bbox_right + 1, y, obj_bullet))
	and (!position_meeting(bbox_right + 1, y, obj_arrow))
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
and (other.speed > speed)
and (other.flat = true)
and (other.sliding_along_ground = 0)
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
		
		scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), global.voice_volume);
		
		#region /*Rewards*/
		
		#region /* 1 Coin*/
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
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
			with(instance_create_depth(x, y, 0, obj_scoreup))
			{
				scoreup = 200;
			}
		}
		#endregion /* 200 Score END*/
		
		#endregion /*Rewards END*/
		
		audio_sound_pitch(snd_stomp, 1);
		scr_audio_play(snd_stomp, global.sound_volume);
	}
}