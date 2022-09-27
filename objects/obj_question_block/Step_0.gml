#region /*Collision Event with player*/
if (bounceup = false)
{
	if (place_meeting(x, y - 4, obj_player))
	and (!place_meeting(x, y - 1, obj_wall))
	and (instance_nearest(x, y, obj_player).ground_pound = true)
	and (can_be_ground_pounded = true)
	
	or (position_meeting(x, bbox_bottom + 1, obj_player)) /*Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching*/
	and (!place_meeting(x, y + 1, obj_wall))
	and (can_be_hit_from_below = true)
	
	or (position_meeting(bbox_left + 9, bbox_bottom + 1, obj_player)) /*Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching*/
	and (!place_meeting(x, y + 1, obj_wall))
	and (can_be_hit_from_below = true)
	
	or (position_meeting(bbox_right - 9, bbox_bottom + 1, obj_player)) /*Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching*/
	and (!place_meeting(x, y + 1, obj_wall))
	and (can_be_hit_from_below = true)
	
	or (place_meeting(bbox_left -4, y, obj_player))
	and (!place_meeting(x - 4, y, obj_wall))
	and (instance_nearest(x, y, obj_player).dive = true)
	
	or (place_meeting(bbox_right + 4, y, obj_player))
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
	and (can_be_hit_from_below = true)
	{
		if (instance_exists(obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <= 1)
		and (position_meeting(bbox_right + 10, y, obj_enemy_bowlingball))
		and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
		{
			instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground = +1;
			scr_audio_play(snd_bump, volume_source.sound);
		}
		else
		if (instance_exists(obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground >= 1)
		and (position_meeting(bbox_left - 10, y, obj_enemy_bowlingball))
		and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
		{
			instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground = -1;
			scr_audio_play(snd_bump, volume_source.sound);
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
			
			#region /*Different Items Inside*/
			
			#region /*No Items Inside (1 Basic Collectible if it's a question block)*/
			if (item_inside = "none")
			{
				empty = true;
				if (block_type = "question_block")
				and (asset_get_type("obj_basic_collectible") == asset_object)
				{
					scr_audio_play(snd_basic_collectible, volume_source.sound);
					with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
					}
					can_break_this_block = false;
				}
				else
				if (block_type = "brick_block")
				{
					can_break_this_block = true;
					break_this_block = true;
				}
			}
			#endregion /*No Items Inside (1 Basic Collectible if it's a question block) END*/
			
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
						scr_audio_play(snd_basic_collectible, volume_source.sound);
						with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
						{
							image_speed = 1;
							motion_set(90, 10);
							bounceup = true;
						}
						with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
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
				if (asset_get_type("obj_heart_balloon") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					with(instance_create_depth(x, bbox_top - 16, 0, obj_heart_balloon))
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
					}
				}
				empty = true;
			}
			#endregion /*Heart Balloon END*/
			
			#region /* 1-up*/
			if (item_inside = "1-up")
			{
				if (asset_get_type("obj_extra_life_pickup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						number_of_extra_lives = 1;
					}
				}
				empty = true;
			}
			#endregion /* 1-up END*/
			
			#region /* 2-up*/
			if (item_inside = "2-up")
			{
				if (asset_get_type("obj_extra_life_pickup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						number_of_extra_lives = 2;
					}
				}
				empty = true;
			}
			#endregion /* 2-up END*/
			
			#region /* 3-up*/
			if (item_inside = "3-up")
			{
				if (asset_get_type("obj_extra_life_pickup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					with(instance_create_depth(x, bbox_top - 16, 0, obj_extra_life_pickup))
					{
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						number_of_extra_lives = 3;
					}
				}
				empty = true;
			}
			#endregion /* 3-up END*/
			
			#region /*Invincibility Powerup*/
			if (item_inside = "invincibility_powerup")
			{
				if (asset_get_type("obj_invincibility_powerup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					with(instance_create_depth(x, bbox_top - 32, 0, obj_invincibility_powerup))
					{
						hspeed = +2;
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						coil_spring = false;
					}
				}
				empty = true;
			}
			#endregion /*Invincibility Powerup END*/
			
			#region /*Invincibility Powerup Coil Spring*/
			if (item_inside = "invincibility_powerup_coil_spring")
			{
				if (asset_get_type("obj_invincibility_powerup") == asset_object)
				and (!place_meeting(x, y - 1, obj_wall))
				{
					with(instance_create_depth(x, bbox_top - 32, 0, obj_invincibility_powerup))
					{
						hspeed = +2;
						image_speed = 1;
						motion_set(90, 10);
						bounceup = true;
						coil_spring = true;
					}
				}
				empty = true;
			}
			#endregion /*Invincibility Powerup END*/
			
			#endregion /*Different Items Inside END*/
			
		}
	}
}
#endregion /*Collision Event with player END*/

#region /*Break this Block*/
if (empty = true)
{
	break_this_block = true;
}

if (can_break_this_block = true)
and (break_this_block = true)
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
			with(instance_create_depth(x, y, 0, obj_scoreup))
			{
				scoreup = 50;
			}
		}
	}
	effect_create_above(ef_smoke, x, y, 1, c_dkgray);
	scr_audio_play(snd_blockbreak, volume_source.sound);
	instance_destroy();
}
#endregion /*Break this Block END*/

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