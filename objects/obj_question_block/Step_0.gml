#region /* Break this Block */
if (empty)
{
	break_this_block = true;
}

if (can_break_this_block)
&& (break_this_block)
{
	if (instance_exists(obj_player))
	{
		if (place_meeting(x, y + 1, obj_player))
		&& (!position_meeting(x, bbox_bottom + 1, obj_wall))
		|| (place_meeting(bbox_left - 4, y, obj_player))
		&& (!place_meeting(x - 4, y, obj_wall))
		&& (instance_nearest(x, y, obj_player).dive)
		|| (place_meeting(bbox_right + 4, y, obj_player))
		&& (!place_meeting(x + 4, y, obj_wall))
		&& (instance_nearest(x, y, obj_player).dive)
		{
			instance_nearest(x, y, obj_player).dive = false;
			instance_nearest(x, y, obj_player).vspeed = +4;
		}
	}
	with(instance_create_depth(x, y - 32, 0, obj_block_break))
	{
		image_yscale = 0.1;
	}
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
	score += 50;
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
	}
	if (show_score_up)
	{
		with(instance_create_depth(x, y, 0, obj_score_up))
		{
			score_up = 50;
		}
	}
	effect_create_above(ef_smoke, x, y, 1, c_dkgray);
	scr_audio_play(snd_blockbreak, volume_source.sound);
	instance_destroy();
}
#endregion /* Break this Block END */

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
xx = lerp(xx, xstart, 0.1);
yy = lerp(yy, ystart, 0.1);
if (!bounce_up)
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
			{
				sprite_index = spr_question_block_empty;
			}
			else
			if (block_type = "brick_block")
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
&& (distance_to_object(obj_player) < 32)
{
	if (!bounce_up)
	{
		if (place_meeting(x, y - 4, obj_player)) /* If player is ground pounding this block */
		&& (!place_meeting(x, y - 1, obj_wall))
		&& (instance_nearest(x, y, obj_player).ground_pound == 1)
		&& (can_be_ground_pounded)
		
		|| (position_meeting(x, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
		&& (!position_meeting(x, bbox_bottom + 1, obj_wall))
		&& (can_be_hit_from_below)
		
		|| (position_meeting(bbox_left + 9, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
		&& (!position_meeting(x, bbox_bottom + 1, obj_wall))
		&& (can_be_hit_from_below)
		
		|| (position_meeting(bbox_right - 9, bbox_bottom + 1, obj_player)) /* Has to be position_meeting, otherwise there are specific situations where you can break a block from above just by crouching */
		&& (!position_meeting(x, bbox_bottom + 1, obj_wall))
		&& (can_be_hit_from_below)
		
		|| (place_meeting(bbox_left - 4, y, obj_player))
		&& (!place_meeting(x - 4, y, obj_wall))
		&& (instance_nearest(x, y, obj_player).dive)
		&& (can_be_hit_from_below)
		
		|| (place_meeting(bbox_right + 4, y, obj_player))
		&& (!place_meeting(x + 4, y, obj_wall))
		&& (instance_nearest(x, y, obj_player).dive)
		&& (can_be_hit_from_below)
		{
			if (!empty)
			{
				instance_nearest(x, y, obj_player).dive = false;
				instance_nearest(x, y, obj_player).vspeed = +4;
				if (instance_exists(obj_player))
				{
					scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
				}
				bounce_up = true;
				with(instance_create_depth(x, y - 32, 0, obj_block_break))
				{
					image_yscale = 0.1;
				}
				scr_different_items_inside(bbox_top);
			}
		}
	}
}
#endregion /* Collision Event with player END */

#region /* Collision Event with enemy bowlingball */
if (instance_exists(obj_enemy_bowlingball))
&& (distance_to_object(obj_enemy_bowlingball) < 32)
&& (!instance_nearest(x, y, obj_enemy_bowlingball).die)
{
	if (!bounce_up)
	{
		if (place_meeting(x - 10, y, obj_enemy_bowlingball))
		&& (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
		
		|| (place_meeting(x + 10, y, obj_enemy_bowlingball))
		&& (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
		
		|| (place_meeting(x, y + 1, obj_enemy_bowlingball))
		&& (instance_nearest(x, y, obj_enemy_bowlingball).vspeed <= 0)
		&& (can_be_hit_from_below)
		{
			if (!empty)
			{
				bounce_up = true;
			}
			scr_audio_play(snd_bump, volume_source.sound);
			
			if (instance_nearest(x, y, obj_enemy_bowlingball).vspeed <= 0)
			{
				instance_nearest(x, y, obj_enemy_bowlingball).vspeed = 0;
				with(instance_create_depth(instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).bbox_top - 18, 0, obj_block_break))
				{
					image_yscale = 0.1;
					can_break_other_blocks = true;
				}
			}
			if (!empty)
			{
				if (instance_exists(obj_player))
				{
					scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
				}
				bounce_up = true;
				with(instance_create_depth(x, y - 32, 0, obj_block_break))
				{
					image_yscale = 0.1;
				}
				scr_different_items_inside(bbox_top);
			}
		}
	}
}
#endregion /* Collision Event with enemy bowlingball END */