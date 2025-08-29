#region /* Turn around */
if (!die && sliding_along_ground == 0 && !other.die)
{
	if (!place_meeting(x, y, obj_bullet))
	&& (!place_meeting(x, y, obj_arrow))
	{
		while(place_meeting(x, y, other))
		{
			x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
			y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
		}
	}
	if (position_meeting(bbox_left - 1, y, other))
	&& (!position_meeting(bbox_left - 1, y, obj_bullet))
	&& (!position_meeting(bbox_left - 1, y, obj_arrow))
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, other))
	&& (!position_meeting(bbox_right + 1, y, obj_bullet))
	&& (!position_meeting(bbox_right + 1, y, obj_arrow))
	{
		image_xscale = -1;
	}
}
#endregion /* Turn around END */

#region /* Defeat other enemies with bowlingball */
if (!other.die)
&& (!die)
&& (!die_volting)
&& (!other.die_volting)
{
	if (sliding_along_ground == +1)
	|| (sliding_along_ground == -1)
	|| (speed > 8)
	{

		#region /* If bowlingball is hitting boss */
		if (other.object_index == obj_boss)
		{
			if (other.x > x)
			{
				die_volting = +1;
				hspeed = +4;
			}
			else
			{
				die_volting = -1;
				hspeed = -4;
			}
			die = true;
			scr_different_items_inside(bbox_top);
			vspeed = -8;
		}
		#endregion /* If bowlingball is hitting boss END */

		else

		#region /* If bowlingball is hitting regualr enemy */
		{
			if (other.x < x)
			{
				other.die_volting = +1;
				other.hspeed = +4;
				if (other.sliding_along_ground <> 0)
				{
					die = true;
					scr_different_items_inside(bbox_top);
					die_volting = -1;
					hspeed = -4;
					vspeed = -4;
				}
			}
			else
			{
				other.die_volting = -1;
				other.hspeed = -4;
				if (other.sliding_along_ground <> 0)
				{
					die = true;
					scr_different_items_inside(bbox_top);
					die_volting = +1;
					hspeed = +4;
					vspeed = -4;
				}
			}
			other.die = true;
			with(other)
			{
				scr_different_items_inside(bbox_top);
			}
			other.vspeed = -8;
		}
		#endregion /* If bowlingball is hitting regualr enemy END */

	}
}
#endregion /* Defeat other enemies with bowlingball END */

if (!die)
&& (!die_volting)
&& (!other.die_volting)
&& (other.speed > speed)
&& (other.flat)
&& (other.sliding_along_ground == 0)
{
	global.enemy_counter++;
	if (other.x < x)
	{
		vspeed = -8;
		die_volting = -1;
		die = true;
		scr_different_items_inside(bbox_top);
	}
	else
	{
		vspeed = -8;
		die_volting = +1;
		die = true;
		scr_different_items_inside(bbox_top);
	}
	effect_create_above(ef_smoke, x, y, 2, c_white);
	if (instance_exists(obj_player))
	{
		scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.5, 10);
	}

	scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);

	#region /* Rewards */
	if (!empty)
	{

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

	}
	#endregion /* Rewards END */

	audio_sound_pitch(snd_stomp, 1);
	scr_audio_play(snd_stomp, volume_source.sound);
}
