#region /*Collision Event with player*/
if (bounceup = false)
{
	if (place_meeting(x, y - 4, obj_player))
	and (!place_meeting(x, y - 1, obj_wall))
	and (instance_nearest(x, y, obj_player).ground_pound = true)
	
	or(position_meeting(x, bbox_bottom + 1, obj_player)) /*Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching*/
	and (!place_meeting(x, y + 1, obj_wall))
	
	or(position_meeting(bbox_left + 9, bbox_bottom + 1, obj_player)) /*Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching*/
	and (!place_meeting(x, y + 1, obj_wall))
	
	or(position_meeting(bbox_right - 9, bbox_bottom + 1, obj_player)) /*Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching*/
	and (!place_meeting(x, y + 1, obj_wall))
	
	or(place_meeting(bbox_left -4, y, obj_player))
	and (!place_meeting(x - 4, y, obj_wall))
	and (instance_nearest(x, y, obj_player).dive = true)
	or(place_meeting(bbox_right + 4, y, obj_player))
	and (!place_meeting(x + 4, y, obj_wall))
	and (instance_nearest(x, y, obj_player).dive = true)
	or (place_meeting(x, y, obj_blockbreak))
	and (instance_nearest(x, y, obj_blockbreak).can_break_other_blocks = true)
	
	or (instance_exists(obj_enemy_bowlingball))
	and (position_meeting(bbox_left - 10, y, obj_enemy_bowlingball))
	and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
	or (instance_exists(obj_enemy_bowlingball))
	and (position_meeting(bbox_right + 10, y, obj_enemy_bowlingball))
	and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
	or (instance_exists(obj_enemy))
	and (place_meeting(x, bbox_bottom, obj_enemy))
	and (instance_nearest(x, y, obj_enemy).vspeed < 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
	{
		if (instance_exists(obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <= 1)
		and (position_meeting(bbox_right + 10, y, obj_enemy_bowlingball))
		and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
		{
			instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground = +1;
			if (asset_get_type("snd_bump") == asset_sound)
			{
				audio_play_sound(snd_bump, 0, 0);
				audio_sound_gain(snd_bump, global.sound_volume * global.main_volume * 0.1, 0);
			}
		}
		else
		if (instance_exists(obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground >= 1)
		and (position_meeting(bbox_left - 10, y, obj_enemy_bowlingball))
		and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
		{
			instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground = -1;
			if (asset_get_type("snd_bump") == asset_sound)
			{
				audio_play_sound(snd_bump, 0, 0);
				audio_sound_gain(snd_bump, global.sound_volume * global.main_volume * 0.1, 0);
			}
		}
		else
		if (instance_exists(obj_enemy))
		and (instance_nearest(x, y, obj_enemy).vspeed < 0)
		and (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
		{
			instance_nearest(x, y, obj_enemy).vspeed = 0;
			if (asset_get_type("obj_blockbreak") == asset_object)
			{
				with(instance_create_depth(instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).bbox_top - 18, 0, obj_blockbreak))
				{
					image_yscale = 0.1;
					can_break_other_blocks = true;
				}
			}
		}
		if (empty = false)
		{
			if (instance_exists(obj_player))
			{
				scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
			}
			bounceup = true;
			if (asset_get_type("obj_blockbreak") == asset_object)
			{
				with(instance_create_depth(x, y - 32, 0, obj_blockbreak))
				{
					image_yscale = 0.1;
				}
			}
			
			#region /* 1 Basic Collectible*/
			if (item_inside = "none")
			{
				empty = true;
				if (block_type = "question_block")
				and (asset_get_type("obj_basic_collectible") == asset_object)
				{
					if (asset_get_type("snd_basic_collectible") == asset_sound)
					{
						audio_play_sound(snd_basic_collectible, 0, 0);
					}
					var obj;
					obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
					}
				}
				else
				{
					if (place_meeting(x, y + 1, obj_player))
					and (!place_meeting(x, y + 1, obj_wall))
					or (place_meeting(bbox_left -4, y, obj_player))
					and (!place_meeting(x - 4, y, obj_wall))
					and (instance_nearest(x, y, obj_player).dive = true)
					or (place_meeting(bbox_right + 4, y, obj_player))
					and (!place_meeting(x + 4, y, obj_wall))
					and (instance_nearest(x, y, obj_player).dive = true)
					{
						with(instance_nearest(x, y, obj_player))
						{
							dive = false;
							vspeed = +4;
						}
					}
					if (asset_get_type("obj_blockbreak") == asset_object)
					{
						with(instance_create_depth(x, y - 32, 0, obj_blockbreak))
						{
							image_yscale = 0.1;
						}
					}

					if (asset_get_type("obj_brick_particle") == asset_object)
					{
						with(instance_create_depth(x, y, 0, obj_brick_particle))
						{
							motion_set(45, random_range(5, 10));
							brick_particle = true;
						}
						with(instance_create_depth(x, y, 0, obj_brick_particle))
						{
							motion_set(135, random_range(5, 10));
							brick_particle = true;
						}
						with(instance_create_depth(x, y, 0, obj_brick_particle))
						{
							motion_set(225, random_range(5, 10));
							brick_particle = true;
						}
						with(instance_create_depth(x, y, 0, obj_brick_particle))
						{
							motion_set(315, random_range(5, 10));
							brick_particle = true;
						}
					}
					score += 50;
					global.hud_show_score = true;
					if (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							hud_show_score_timer = global.hud_hide_time * 60;
						}
					}
					if (show_scoreup = true)
					{
						if (asset_get_type("obj_scoreup") == asset_object)
						{
							obj = instance_create_depth(x, y, 0, obj_scoreup);
							with(obj)
							{
								scoreup = 50;
							}
						}
					}
					effect_create_above(ef_smoke, x, y, 1, c_dkgray);
					if (asset_get_type("snd_blockbreak") == asset_sound)
					{
						audio_play_sound(snd_blockbreak, 0, 0);
						audio_sound_gain(snd_blockbreak, global.sound_volume * global.main_volume, 0);
					}
					instance_destroy();
				}
			}
			#endregion /* 1 Basic Collectible END*/
			
			#region /* 10 Basic Collectible*/
			if (item_inside = "10_basic_collectibles")
			{
				if (hit <= 4)
				and (empty = false)
				{
					bounceup = true;
					hit += 1;
					if (asset_get_type("obj_blockbreak") == asset_object)
					{
						with(instance_create_depth(x, y - 32, 0, obj_blockbreak))
						{
							image_yscale = 0.1;
						}
					}
					#region /* 2 Basic Collectibles per hit*/
					if asset_get_type("obj_basic_collectible") == asset_object
					{
						if asset_get_type("snd_basic_collectible") == asset_sound
						{
							audio_play_sound(snd_basic_collectible, 0, 0);
						}
						var obj;
						obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
						with(obj)
						{
							image_speed = 1;
							motion_set(90, 10);
							bounceup = true;
						}
						obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
						with(obj)
						{
							image_speed = 1;
							motion_set(90, 10);
							bounceup = true;
							delay_time = 10;
						}
					}
					if (hit >= 5)
					{
						empty = true;
					}
					#endregion /* 2 Basic Collectibles per hit END*/
				}
			}
			#endregion /* 10 Basic Collectible END*/
			
			#region /*Heart Balloon*/
			if (item_inside = "heart_balloon")
			{
				empty = true;
				if (asset_get_type("obj_heart_balloon") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					var obj;
					obj = instance_create_depth(x, bbox_top - 16, 0, obj_heart_balloon);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
					}
				}
			}
			#endregion /*Heart Balloon END*/
			
			#region /* 1-up*/
			if (item_inside = "1-up")
			{
				empty = true;
				if (asset_get_type("obj_extra_life_pickup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					var obj;
					obj = instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						number_of_extra_lives = 1;
					}
				}
			}
			#endregion /* 1-up END*/
			
			#region /* 2-up*/
			if (item_inside = "2-up")
			{
				empty = true;
				if (asset_get_type("obj_extra_life_pickup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					var obj;
					obj = instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						number_of_extra_lives = 2;
					}
				}
			}
			#endregion /* 2-up END*/
			
			#region /* 3-up*/
			if (item_inside = "3-up")
			{
				empty = true;
				if (asset_get_type("obj_extra_life_pickup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					var obj;
					obj = instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup);
					with(obj)
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						number_of_extra_lives = 3;
					}
				}
			}
			#endregion /* 3-up END*/
			
			#region /*Invincibility Powerup*/
			if (item_inside = "invincibility_powerup")
			{
				empty = true;
				if (asset_get_type("obj_invincibility_powerup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					var obj;
					obj = instance_create_depth(x, bbox_top - 32, 0, obj_invincibility_powerup);
					with(obj)
					{
						hspeed = +2;
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						coil_spring = false;
					}
				}
			}
			#endregion /*Invincibility Powerup END*/
			
			#region /*Invincibility Powerup Coil Spring*/
			if (item_inside = "invincibility_powerup_coil_spring")
			{
				empty = true;
				if (asset_get_type("obj_invincibility_powerup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					var obj;
					obj = instance_create_depth(x, bbox_top - 32, 0, obj_invincibility_powerup);
					with(obj)
					{
						hspeed = +2;
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						coil_spring = true;
					}
				}
			}
			#endregion /*Invincibility Powerup END*/
			
		}
	}
}
#endregion /*Collision Event with player END*/

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
xx = lerp(xx, xstart, 0.1);
yy = lerp(yy, ystart, 0.1);
if (bounceup = false)
{
	draw_xscale -= 0.1;
	draw_yscale -= 0.1;
	yy += 4;
	if (draw_xscale <= 1)
	{
		draw_xscale = 1;
		draw_yscale = 1;
		vspeed = + 0;
		yy = ystart;
	}
}
if (bounceup = true)
{
	draw_xscale += 0.1;
	draw_yscale += 0.1;
	yy -= 4;
	if (draw_xscale > 1.5)
	{
		if (empty = true)
		{
			if (block_type = "question_block")
			and (asset_get_type("spr_question_block_empty") == asset_sprite)
			{
				sprite_index = spr_question_block_empty;
			}
			else
			if (block_type = "brick_block")
			and (asset_get_type("spr_brick_block_empty") == asset_sprite)
			{
				sprite_index = spr_brick_block_empty;
			}
			else
			{
				image_blend = c_black;
			}
		}
		bounceup = false;
	}
}