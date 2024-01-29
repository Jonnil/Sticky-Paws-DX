if (stomped_delay > 0)
{
	stomped_delay --;
}

if (die_volting = -1)
|| (die_volting = +1)
{
	depth = -900;
	if (die_volting = - 1)
	{
		draw_angle -= 20;
		hspeed = +4;
	}
	else
	{
		draw_angle += 20;
		hspeed = -4;
	}
	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	gravity = 0.5; /* The gravity */
	#endregion /* Set the gravity END */
	
}
else
{
	
	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	if (!place_meeting(x, y + 1, obj_wall))
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	&& (x - 32 < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	&& (x + 32 > camera_get_view_x(view_camera[view_current]))
	|| (die)
	{
		gravity = 0.5; /* The gravity */
	}
	else
	{
		gravity = 0;
	}
	#endregion /* Set the gravity END */
	
	if (flat)
	{
		image_speed = 0.5;
		sprite_used = "flattened";
		if (blind)
		{
			if (global.resource_pack_sprite_enemy_bowlingball_blind_stomped > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_stomped;}else
			if (global.resource_pack_sprite_enemy_bowlingball_stomped > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_stomped;}
		}
		else
		{
			if (global.resource_pack_sprite_enemy_bowlingball_stomped > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_stomped;}else
			if (global.resource_pack_sprite_enemy_bowlingball_blind_stomped > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_stomped;}
		}
		if (stomped_delay == 0)
		{
			if (instance_exists(obj_player))
			&& (sliding_along_ground == 0)
			&& (instance_nearest(x, y, obj_player).hold_item_in_hands = "")
			&& (instance_nearest(x, y, obj_player).key_dive_hold)
			&& (!instance_nearest(x, y, obj_player).horizontal_rope_climb)
			&& (instance_nearest(x, y, obj_player).ground_pound == 0)
			{
				if (distance_to_object(instance_nearest(x, y, obj_player)) < 16)
				{
					instance_nearest(x, y, obj_player).hold_item_in_hands = "enemy_bowlingball";
					instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped = number_of_times_stomped;
					instance_nearest(x, y, obj_player).dive = false;
					instance_destroy();
				}
			}
			else
			if (instance_exists(obj_player))
			&& (position_meeting(bbox_left - 1, y, obj_player))
			&& (instance_nearest(x, y, obj_player).hspeed >= + 8)
			&& (instance_nearest(x, y, obj_player).x < x)
			&& (sliding_along_ground == 0)
			&& (flat)
			{
				instance_nearest(x, y, obj_player).dive = false;
				sliding_along_ground = +1;
				sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
				stomped_delay = 5;
				
				if (number_of_times_stomped < 10)
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
					
				}
				audio_sound_pitch(snd_stomp, 1);
				scr_audio_play(snd_stomp, volume_source.sound);
			}
			else
			if (instance_exists(obj_player))
			&& (position_meeting(bbox_right + 1, y, obj_player))
			&& (instance_nearest(x, y, obj_player).hspeed <= -8)
			&& (sliding_along_ground == 0)
			&& (flat)
			{
				sliding_along_ground = -1;
				sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
				stomped_delay = 5;
				
				if (number_of_times_stomped < 10)
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
					
				}
				audio_sound_pitch(snd_stomp, 1);
				scr_audio_play(snd_stomp, volume_source.sound);
			}
			else
			if (instance_exists(obj_player))
			&& (position_meeting(bbox_left - 1, y, obj_player))
			&& (instance_nearest(x, y, obj_player).x < x)
			&& (sliding_along_ground == 0)
			&& (flat)
			{
				sliding_along_ground = +1;
				sliding_along_ground_speed = 8;
				stomped_delay = 5;
				
				if (number_of_times_stomped < 10)
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
					
				}
				
				audio_sound_pitch(snd_stomp, 1);
				scr_audio_play(snd_stomp, volume_source.sound);
			}
			else
			if (instance_exists(obj_player))
			&& (position_meeting(bbox_right + 1, y, obj_player))
			&& (sliding_along_ground == 0)
			&& (flat)
			{
				sliding_along_ground = -1;
				sliding_along_ground_speed = 8;
				stomped_delay = 5;
				
				if (number_of_times_stomped < 10)
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
					
				}
				
				audio_sound_pitch(snd_stomp, 1);
				scr_audio_play(snd_stomp, volume_source.sound);
			}
		}
	}
}
if (!flat)
&& (!die)
{
	if (image_xscale < 0)
	{
		hspeed = - 1;
	}
	else
	{
		hspeed = +1;
	}
	
	#region /* Turn around */
	if (place_meeting(x - 2, y, obj_wall))
	{
		image_xscale = +1;
	}
	if (place_meeting(x + 2, y, obj_wall))
	{
		image_xscale = -1;
	}
	#endregion /* Turn around END */
	
	if (blind)
	{
		if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}else
		if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}
	}
	else
	{
		if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}else
		if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}
	}
	image_speed = 0.3;
}

if (!blind)
&& (!die)
&& (place_meeting(x, y + 1, obj_wall) || position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (!place_meeting(x + 5, y + 1, obj_wall))
	&& (!position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform))
	{
		image_xscale = -1;
	}
	else
	if (!place_meeting(x - 5, y + 1, obj_wall) && !position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform))
	{
		image_xscale = +1;
	}
}

if (coil_spring)
&& (!die)
&& (place_meeting(x, y + 1, obj_wall))
|| (coil_spring)
&& (!die)
&& (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (instance_exists(obj_foreground_secret))
	&& (place_meeting(x, y, obj_foreground_secret))
	&& (obj_foreground_secret.image_alpha < 0.5)
	|| (instance_exists(obj_foreground_secret))
	&& (!place_meeting(x, y, obj_foreground_secret))
	{
		if (instance_exists(obj_camera))
		&& (obj_camera.iris_xscale > 1)
		{
			effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x - 16 - 8, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x + 16 + 8, bbox_bottom- 8, 0, c_white);
		}
		scr_audio_play(snd_spring, volume_source.sound, 0.1);
	}
	vspeed = -15;
	gravity = 0;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
}

if (sliding_along_ground == -1)
&& (flat)
&& (!die)
{
	draw_angle += 10;
	if (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	&& (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	|| (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	&& (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	&& (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	&& (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (!position_meeting(x, bbox_bottom + 1, obj_wall))
		&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		{
			hspeed = -0.5;
			y += 10;
			gravity = 1;
		}
		else
		{
			hspeed = -sliding_along_ground_speed;
		}
	}
	else
	{
		hspeed = -sliding_along_ground_speed;
	}
}
else
if (sliding_along_ground == +1)
&& (flat)
&& (!die)
{
	draw_angle -= 10;
	if (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	&& (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	|| (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	&& (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	&& (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	&& (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (!position_meeting(x, bbox_bottom + 1, obj_wall))
		&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		{
			hspeed = +0.5;
			y += 10;
			gravity = 1;
		}
		else
		{
			hspeed = +sliding_along_ground_speed;
		}
	}
	else
	{
		hspeed = +sliding_along_ground_speed;
	}
}
else
if (sliding_along_ground == 0)
&& (flat)
&& (!die)
{
	friction = 0.05;
}