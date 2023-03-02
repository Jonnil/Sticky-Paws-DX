#region /* If enemies are disabled, destroy this object */
if (global.assist_enable == true)
and (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */

if (stomped_delay > 0)
{
	stomped_delay -= 1;
}

if (die_volting = -1)
or (die_volting = +1)
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
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (x - 32 < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	and (x + 32 > camera_get_view_x(view_camera[view_current]))
	{
		gravity = 0.5; /* The gravity */
	}
	else
	{
		gravity = 0;
	}
	#endregion /* Set the gravity END */
	
	if (flat == true)
	{
		image_speed = 0.5;
		sprite_used = "flattened";
		if (blind == true)
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
			and (sliding_along_ground == 0)
			and (instance_nearest(x, y, obj_player).hold_item_in_hands = "")
			and (instance_nearest(x, y, obj_player).key_dive_hold)
			and (instance_nearest(x, y, obj_player).horizontal_rope_climb = false)
			and (instance_nearest(x, y, obj_player).ground_pound = false)
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
			and (position_meeting(bbox_left - 1, y, obj_player))
			and (instance_nearest(x, y, obj_player).hspeed >= + 8)
			and (instance_nearest(x, y, obj_player).x < x)
			and (sliding_along_ground == 0)
			and (flat == true)
			{
				instance_nearest(x, y, obj_player).dive = false;
				sliding_along_ground = +1;
				sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
				stomped_delay = 10;
				
				if (number_of_times_stomped < 10)
				{
					number_of_times_stomped += 1;
					
					#region /* 1 Coin */
					if (asset_get_type("obj_basic_collectible") == asset_object)
					{
						with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
						{
							image_speed = 1;
							motion_set(90, 10);
							bounce_up = true;
						}
					}
					#endregion /* 1 Coin END */
				
					#region /* 200 Score */
					score += 200;
					if (asset_get_type("obj_score_up") == asset_object)
					{
						with(instance_create_depth(x, y, 0, obj_score_up))
						{
							score_up = 200;
						}
					}
					#endregion /* 200 Score END */
				
					#region /* 1-up */
					if (global.number_of_chain_kills_for_1up <= 1)
					{
						if (asset_get_type("obj_score_up") == asset_object)
						{
							with(instance_create_depth(x, y - 32, 0, obj_score_up))
							{
								score_up = "1-up";
							}
						}
					}
					#endregion /* 1-up END */
					
				}
				audio_sound_pitch(snd_stomp, 1);
				scr_audio_play(snd_stomp, volume_source.sound);
			}
			else
			if (instance_exists(obj_player))
			and (position_meeting(bbox_right + 1, y, obj_player))
			and (instance_nearest(x, y, obj_player).hspeed <= -8)
			and (sliding_along_ground == 0)
			and (flat == true)
			{
				sliding_along_ground = -1;
				sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
				stomped_delay = 10;
				
				if (number_of_times_stomped < 10)
				{
					number_of_times_stomped += 1;
					
					#region /* 1 Coin */
					if (asset_get_type("obj_basic_collectible") == asset_object)
					{
						with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
						{
							image_speed = 1;
							motion_set(90, 10);
							bounce_up = true;
						}
					}
					#endregion /* 1 Coin END */
				
					#region /* 200 Score */
					score += 200;
					if (asset_get_type("obj_score_up") == asset_object)
					{
						with(instance_create_depth(x, y, 0, obj_score_up))
						{
							score_up = 200;
						}
					}
					#endregion /* 200 Score END */
				
					#region /* 1-up */
					if (global.number_of_chain_kills_for_1up <= 1)
					{
						if (asset_get_type("obj_score_up") == asset_object)
						{
							with(instance_create_depth(x, y - 32, 0, obj_score_up))
							{
								score_up = "1-up";
							}
						}
					}
					#endregion /* 1-up END */
					
				}
				audio_sound_pitch(snd_stomp, 1);
				scr_audio_play(snd_stomp, volume_source.sound);
			}
			else
			if (instance_exists(obj_player))
			and (position_meeting(bbox_left - 1, y, obj_player))
			and (instance_nearest(x, y, obj_player).x < x)
			and (sliding_along_ground == 0)
			and (flat == true)
			{
				sliding_along_ground = +1;
				sliding_along_ground_speed = 8;
				stomped_delay = 10;
				
				if (number_of_times_stomped < 10)
				{
					number_of_times_stomped += 1;
					
					#region /* 1 Coin */
					if (asset_get_type("obj_basic_collectible") == asset_object)
					{
						with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
						{
							image_speed = 1;
							motion_set(90, 10);
							bounce_up = true;
						}
					}
					#endregion /* 1 Coin END */
				
					#region /* 200 Score */
					score += 200;
					if (asset_get_type("obj_score_up") == asset_object)
					{
						with(instance_create_depth(x, y, 0, obj_score_up))
						{
							score_up = 200;
						}
					}
					#endregion /* 200 Score END */
				
					#region /* 1-up */
					if (global.number_of_chain_kills_for_1up <= 1)
					{
						if (asset_get_type("obj_score_up") == asset_object)
						{
							with(instance_create_depth(x, y - 32, 0, obj_score_up))
							{
								score_up = "1-up";
							}
						}
					}
					#endregion /* 1-up END */
					
				}
				
				audio_sound_pitch(snd_stomp, 1);
				scr_audio_play(snd_stomp, volume_source.sound);
			}
			else
			if (instance_exists(obj_player))
			and (position_meeting(bbox_right + 1, y, obj_player))
			and (sliding_along_ground == 0)
			and (flat == true)
			{
				sliding_along_ground = -1;
				sliding_along_ground_speed = 8;
				stomped_delay = 10;
				
				if (number_of_times_stomped < 10)
				{
					number_of_times_stomped += 1;
					
					#region /* 1 Coin */
					if (asset_get_type("obj_basic_collectible") == asset_object)
					{
						with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
						{
							image_speed = 1;
							motion_set(90, 10);
							bounce_up = true;
						}
					}
					#endregion /* 1 Coin END */
				
					#region /* 200 Score */
					score += 200;
					if (asset_get_type("obj_score_up") == asset_object)
					{
						with(instance_create_depth(x, y, 0, obj_score_up))
						{
							score_up = 200;
						}
					}
					#endregion /* 200 Score END */
				
					#region /* 1-up */
					if (global.number_of_chain_kills_for_1up <= 1)
					{
						if (asset_get_type("obj_score_up") == asset_object)
						{
							with(instance_create_depth(x, y - 32, 0, obj_score_up))
							{
								score_up = "1-up";
							}
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
if (flat = false)
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
	and (flat = false)
	{
		image_xscale = +1;
	}
	if (place_meeting(x + 2, y, obj_wall))
	and (flat = false)
	{
		image_xscale = -1;
	}
	#endregion /* Turn around END */
	
	if (blind == true)
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

if (blind = false)
and (place_meeting(x, y + 1, obj_wall))
or (blind = false)
and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (!place_meeting(x + 5, y + 1, obj_wall))
	and (!position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform))
	{
		image_xscale = -1;
	}
	else
	if (!place_meeting(x - 5, y + 1, obj_wall))
	and (!position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform))
	{
		image_xscale = +1;
	}
}

if (coil_spring == true)
and (die == false)
and (place_meeting(x, y + 1, obj_wall))
or (coil_spring == true)
and (die == false)
and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (instance_exists(obj_foreground_secret))
	and (place_meeting(x, y, obj_foreground_secret))
	and (obj_foreground_secret.image_alpha < 0.5)
	or (instance_exists(obj_foreground_secret))
	and (!place_meeting(x, y, obj_foreground_secret))
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		and (obj_camera.iris_xscale > 1)
		{
			effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x - 16 - 8,bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x + 16 + 8,bbox_bottom- 8, 0, c_white);
		}
		scr_audio_play(snd_spring, volume_source.sound, 0.1);
	}
	vspeed = -15;
	gravity = 0;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
}

if (sliding_along_ground == -1)
and (flat == true)
and (die == false)
{
	draw_angle += 10;
	if (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	or (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	and (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (!position_meeting(x, bbox_bottom + 1, obj_wall))
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
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
and (flat == true)
and (die == false)
{
	draw_angle -= 10;
	if (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	or (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	and (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(bbox_right + 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(bbox_left - 32, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (!position_meeting(x, bbox_bottom + 1, obj_wall))
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
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
and (flat == true)
and (die == false)
{
	friction = 0.05;
}

#region /* Kill enemy if it's inside the wall */
if (position_meeting(x, y, obj_wall))
and (die == false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 3)
	{
		flat = false;
		die = true;
		die_volting = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter -= 1;
	}
}
#endregion /* Kill enemy if it's inside the wall END */