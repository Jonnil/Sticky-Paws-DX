#region /*If enemies are disabled, destroy this object*/
if (global.assist_enable = true)
and (global.assist_enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

if (die_volting = -1)
or(die_volting = +1)
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
	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	gravity = 0.5; /*The gravity*/
	#endregion /*Set the gravity END*/
	
}
else
{
	
	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (x > camera_get_view_x(view_camera[view_current]))
		and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		and (y > camera_get_view_y(view_camera[view_current]))
		{
			gravity = 0.5; /*The gravity*/
		}
	}
	else
	{
		gravity = 0;
	}
	#endregion /*Set the gravity END*/
	
	if (flat = true)
	{
		image_speed = 0.5;
		sprite_used = "flattened";
		sprite_index = global.resourcepack_sprite_enemy_bowlingball_stomped;
		
		if (stomped_delay > 0)
		{
			stomped_delay -= 1;
		}
		
		if (stomped_delay = 0)
		{
			if (instance_exists(obj_player))
			and (sliding_along_ground = 0)
			and (instance_nearest(x, y, obj_player).hold_item_in_hands = 0)
			and (instance_nearest(x, y, obj_player).key_dive_hold)
			and (instance_nearest(x, y, obj_player).horizontal_rope_climb = false)
			{
				if (place_meeting(x - 4, y, obj_player))
				or (place_meeting(x + 4, y, obj_player))
				or (place_meeting(x, y + 4, obj_player))
				{
					instance_nearest(x, y, obj_player).hold_item_in_hands = "enemy_bowlingball";
					instance_nearest(x, y, obj_player).dive = false;
					instance_destroy();
				}
			}
			else
			if (instance_exists(obj_player))
			and (position_meeting(bbox_left - 1, y, obj_player))
			and (instance_nearest(x, y, obj_player).hspeed >= +8)
			and (instance_nearest(x, y, obj_player).x < x)
			and (sliding_along_ground = 0)
			and (flat = true)
			{
				instance_nearest(x, y, obj_player).dive = false;
				sliding_along_ground = +1;
				sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
				stomped_delay = 10;
				
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
							audio_sound_gain(snd_1up, global.sfx_volume, 0);
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
				
				if (asset_get_type("snd_stomp") == asset_sound)
				{
					audio_play_sound(snd_stomp, 0, 0);
					audio_sound_gain(snd_stomp, global.sfx_volume, 0);
					audio_sound_pitch(snd_stomp, 1);
				}
			}
			else
			if (instance_exists(obj_player))
			and (position_meeting(bbox_right + 1, y, obj_player))
			and (instance_nearest(x, y, obj_player).hspeed <= -8)
			and (sliding_along_ground = 0)
			and (flat = true)
			{
				sliding_along_ground = -1;
				sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
				stomped_delay = 10;
				
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
							audio_sound_gain(snd_1up, global.sfx_volume, 0);
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
				
				if (asset_get_type("snd_stomp") == asset_sound)
				{
					audio_play_sound(snd_stomp, 0, 0);
					audio_sound_gain(snd_stomp, global.sfx_volume, 0);
					audio_sound_pitch(snd_stomp, 1);
				}
			}
			else
			if (instance_exists(obj_player))
			and (position_meeting(bbox_left - 1, y, obj_player))
			and (instance_nearest(x, y, obj_player).x < x)
			and (sliding_along_ground = 0)
			and (flat = true)
			{
				sliding_along_ground = +1;
				sliding_along_ground_speed = 8;
				stomped_delay = 10;
				
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
							audio_sound_gain(snd_1up, global.sfx_volume, 0);
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
				
				if (asset_get_type("snd_stomp") == asset_sound)
				{
					audio_play_sound(snd_stomp, 0, 0);
					audio_sound_gain(snd_stomp, global.sfx_volume, 0);
					audio_sound_pitch(snd_stomp, 1);
				}
			}
			else
			if (instance_exists(obj_player))
			and (position_meeting(bbox_right + 1, y, obj_player))
			and (sliding_along_ground = 0)
			and (flat = true)
			{
				sliding_along_ground = -1;
				sliding_along_ground_speed = 8;
				stomped_delay = 10;
				
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
							audio_sound_gain(snd_1up, global.sfx_volume, 0);
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
				
				if (asset_get_type("snd_stomp") == asset_sound)
				{
					audio_play_sound(snd_stomp, 0, 0);
					audio_sound_gain(snd_stomp, global.sfx_volume, 0);
					audio_sound_pitch(snd_stomp, 1);
				}
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
	
	#region /*Turn around*/
	if (position_meeting(bbox_left - 1, y, obj_wall))
	and (flat = false)
	{
		image_xscale = +1;
	}
	if (position_meeting(bbox_right + 1, y, obj_wall))
	and (flat = false)
	{
		image_xscale = -1;
	}
	#endregion /*Turn around END*/
	
	sprite_index = global.resourcepack_sprite_enemy_bowlingball_walk;
	image_speed = 0.3;
}

if (coil_spring = true)
and (die = false)
and (place_meeting(x, y + 1, obj_wall))
{
	vspeed = -15;
}

if (sliding_along_ground = -1)
and (flat = true)
and (die = false)
{
	draw_angle += 10;
	if (position_meeting(bbox_left - 1, y, obj_wall))
	{
		sliding_along_ground = +1;
	}
	if (position_meeting(x - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(x + 32, bbox_bottom + 1, obj_wall))
	or (position_meeting(x - 32, bbox_bottom + 1, obj_semisolid_platform))
	and (position_meeting(x + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(x - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(x + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(x + 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(x - 32, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (!position_meeting(x, bbox_bottom + 1, obj_wall))
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		{
			hspeed = -1;
			y += 1;
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
if (sliding_along_ground = +1)
and (flat = true)
and (die = false)
{
	draw_angle -= 10;
	if (position_meeting(bbox_right + 1, y, obj_wall))
	{
		sliding_along_ground = -1;
	}
	if (position_meeting(x - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(x + 32, bbox_bottom + 1, obj_wall))
	or (position_meeting(x - 32, bbox_bottom + 1, obj_semisolid_platform))
	and (position_meeting(x + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(x - 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(x + 32, bbox_bottom + 1, obj_semisolid_platform))
	or (position_meeting(x + 32, bbox_bottom + 1, obj_wall))
	and (position_meeting(x - 32, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (!position_meeting(x, bbox_bottom + 1, obj_wall))
		and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
		{
			hspeed = +1;
			y += 1;
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
if (sliding_along_ground = 0)
and (flat = true)
and (die = false)
{
	friction = 0.05;
}

if (place_meeting(x, y - 1, obj_wall))
and (die = false)
{
	vspeed = 0;
}

#region /*Don't move outside view*/
if (bbox_right < camera_get_view_x(view_camera[view_current]))
and (instance_number(obj_player)>= 2)
and (intro_animation = "")
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	
}
if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
and (instance_number(obj_player)>= 2)
and (intro_animation = "")
{
	x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
}
#endregion /*Don't move outside view END*/

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 10)
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
#endregion /*Kill enemy if it's inside the wall END*/