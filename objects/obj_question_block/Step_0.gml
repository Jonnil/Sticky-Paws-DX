#region /* Break this Block */
if (empty)
{
	break_this_block = true;
}

if (can_break_this_block)
and (break_this_block)
and (asset_get_type("obj_player") == asset_object)
and (asset_get_type("obj_wall") == asset_object)
{
	if (place_meeting(x, y + 1, obj_player))
	and (!position_meeting(x, bbox_bottom + 1, obj_wall))
	or (place_meeting(bbox_left - 4, y, obj_player))
	and (!place_meeting(x - 4, y, obj_wall))
	and (variable_instance_exists(obj_player, "dive"))
	and (instance_nearest(x, y, obj_player).dive)
	or (place_meeting(bbox_right + 4, y, obj_player))
	and (!place_meeting(x + 4, y, obj_wall))
	and (variable_instance_exists(obj_player, "dive"))
	and (instance_nearest(x, y, obj_player).dive)
	{
		with(instance_nearest(x, y, obj_player))
		{
			if (variable_instance_exists(self, "dive"))
			{
				dive = false;
			}
			vspeed = +4;
		}
	}
	if (asset_get_type("obj_block_break") == asset_object)
	{
		with(instance_create_depth(x, y - 32, 0, obj_block_break))
		{
			image_yscale = 0.1;
		}
	}
	if (asset_get_type("obj_brick_particle") == asset_object)
	{
		with(instance_create_depth(x, y, 0, obj_brick_particle))
		{
			motion_set(45, random_range(5, 10));
			if (variable_instance_exists(self, "brick_particle"))
			{
				brick_particle = true;
			}
		}
		with(instance_create_depth(x, y, 0, obj_brick_particle))
		{
			motion_set(135, random_range(5, 10));
			if (variable_instance_exists(self, "brick_particle"))
			{
				brick_particle = true;
			}
		}
		with(instance_create_depth(x, y, 0, obj_brick_particle))
		{
			motion_set(225, random_range(5, 10));
			if (variable_instance_exists(self, "brick_particle"))
			{
				brick_particle = true;
			}
		}
		with(instance_create_depth(x, y, 0, obj_brick_particle))
		{
			motion_set(315, random_range(5, 10));
			if (variable_instance_exists(self, "brick_particle"))
			{
				brick_particle = true;
			}
		}
	}
	score += 50;
	if (asset_get_type("obj_camera") == asset_object)
	if (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			if (variable_instance_exists(self, "hud_show_score_timer"))
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
	}
	if (show_score_up)
	and (asset_get_type("obj_score_up") == asset_object)
	{
		with(instance_create_depth(x, y, 0, obj_score_up))
		{
			if (variable_instance_exists(self, "score_up"))
			{
				score_up = 50;
			}
		}
	}
	effect_create_above(ef_smoke, x, y, 1, c_dkgray);
	if (asset_get_type("scr_audio_play") == asset_script)
	{
		scr_audio_play(snd_blockbreak, volume_source.sound);
	}
	instance_destroy();
}
#endregion /* Break this Block END */

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
xx = lerp(xx, xstart, 0.1);
yy = lerp(yy, ystart, 0.1);
if (bounce_up == false)
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
else
if (bounce_up)
{
	draw_xscale += 0.1;
	draw_yscale += 0.1;
	yy -= 4;
	if (draw_xscale > 1.5)
	{
		if (empty)
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
		bounce_up = false;
	}
}

#region /* Collision Event with player */
if (instance_exists(obj_player))
and (distance_to_object(obj_player) < 32)
{
	if (bounce_up == false)
	and (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_wall") == asset_object)
	{
	
		if (place_meeting(x, y - 4, obj_player)) /* If player is ground pounding this block */
		and (!place_meeting(x, y - 1, obj_wall))
		and (variable_instance_exists(obj_player, "ground_pound"))
		and (instance_nearest(x, y, obj_player).ground_pound)
		and (can_be_ground_pounded)
	
		or (position_meeting(x, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
		and (!position_meeting(x, bbox_bottom + 1, obj_wall))
		and (can_be_hit_from_below)
	
		or (position_meeting(bbox_left + 9, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
		and (!position_meeting(x, bbox_bottom + 1, obj_wall))
		and (can_be_hit_from_below)
	
		or (position_meeting(bbox_right - 9, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
		and (!position_meeting(x, bbox_bottom + 1, obj_wall))
		and (can_be_hit_from_below)
	
		or (place_meeting(bbox_left - 4, y, obj_player))
		and (!place_meeting(x - 4, y, obj_wall))
		and (variable_instance_exists(obj_player, "dive"))
		and (instance_nearest(x, y, obj_player).dive)
	
		or (place_meeting(bbox_right + 4, y, obj_player))
		and (!place_meeting(x + 4, y, obj_wall))
		and (variable_instance_exists(obj_player, "dive"))
		and (instance_nearest(x, y, obj_player).dive)
		{
			if (empty == false)
			{
				if (instance_exists(obj_player))
				and (asset_get_type("scr_gamepad_vibration") == asset_script)
				{
					scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
				}
				bounce_up = true;
				if (asset_get_type("obj_block_break") == asset_object)
				{
					with(instance_create_depth(x, y - 32, 0, obj_block_break))
					{
						image_yscale = 0.1;
					}
				}
				scr_different_items_inside();
			}
		}
	}
}
#endregion /* Collision Event with player END */

#region /* Collision Event with enemy bowlingball */
if (instance_exists(obj_enemy_bowlingball))
and (distance_to_object(obj_enemy_bowlingball) < 32)
{
	if (bounce_up == false)
	and (asset_get_type("obj_player") == asset_object)
	and (asset_get_type("obj_wall") == asset_object)
	{
		if (place_meeting(x - 10, y, obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
		
		or (place_meeting(x + 10, y, obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
		
		or (place_meeting(x, y + 1, obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).vspeed <= 0)
		and (can_be_hit_from_below)
		{
			if (empty == false)
			{
				bounce_up = true;
			}
			scr_audio_play(snd_bump, volume_source.sound);
			
			#region /* Change direction */
			if (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground < 0)
			{
				instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground = +1;
			}
			else
			if (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground > 0)
			{
				instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground = -1;
			}
			#endregion /* Change direction END */
			
			if (instance_nearest(x, y, obj_enemy_bowlingball).vspeed <= 0)
			{
				instance_nearest(x, y, obj_enemy_bowlingball).vspeed = 0;
				if (asset_get_type("obj_block_break") == asset_object)
				{
					with(instance_create_depth(instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).bbox_top - 18, 0, obj_block_break))
					{
						image_yscale = 0.1;
						if (variable_instance_exists(self, "can_break_other_blocks"))
						{
							can_break_other_blocks = true;
						}
					}
				}
			}
			if (empty == false)
			{
				if (instance_exists(obj_player))
				and (asset_get_type("scr_gamepad_vibration") == asset_script)
				{
					scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
				}
				bounce_up = true;
				if (asset_get_type("obj_block_break") == asset_object)
				{
					with(instance_create_depth(x, y - 32, 0, obj_block_break))
					{
						image_yscale = 0.1;
					}
				}
				scr_different_items_inside();
			}
		}
	}
}
#endregion /* Collision Event with enemy bowlingball END */