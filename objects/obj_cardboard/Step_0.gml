if (place_meeting(x, y - 1, obj_player))
{
	draw_xscale = lerp(draw_xscale, 1.1, 0.3);
	draw_yscale = lerp(draw_yscale, 0.9, 0.3);
}
else
{
	draw_xscale = lerp(draw_xscale, 1, 0.3);
	draw_yscale = lerp(draw_yscale, 1, 0.3);
}

#region /* Collision with player */
if (instance_exists(obj_player))
&& (distance_to_object(obj_player) < 32)
{
	if (place_meeting(x, bbox_bottom, obj_player))
	&& (instance_nearest(x, y, obj_player).vspeed < 0)
	|| (place_meeting(x, y - 32, obj_player)) /* You should always break the cardboard box before landing on it when doing a cardboard box, so it's effortless to break */
	&& (instance_nearest(x, y, obj_player).vspeed > 0) /* Only break cardboard with groundpound when traveling down */
	&& (instance_nearest(x, y, obj_player).ground_pound)
	|| (place_meeting(bbox_left - 8, y, obj_player))
	&& (instance_nearest(x, y, obj_player).dive)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(bbox_right + 8, y, obj_player))
	&& (instance_nearest(x, y, obj_player).dive)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(bbox_left - 1, y, obj_player))
	&& (instance_nearest(x, y, obj_player).wall_jump > 0)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(bbox_right + 1, y, obj_player))
	&& (instance_nearest(x, y, obj_player).wall_jump > 0)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))

	|| (place_meeting(bbox_left - 8, y, obj_player))
	&& (instance_nearest(x, y, obj_player).move_towards_spring_endpoint)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(bbox_right + 8, y, obj_player))
	&& (instance_nearest(x, y, obj_player).move_towards_spring_endpoint)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(x, bbox_top - 8, obj_player))
	&& (instance_nearest(x, y, obj_player).move_towards_spring_endpoint)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(x, bbox_bottom + 8, obj_player))
	&& (instance_nearest(x, y, obj_player).move_towards_spring_endpoint)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))

	|| (place_meeting(bbox_left - 8, y, obj_player))
	&& (instance_nearest(x, y, obj_player).speed > 30)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(bbox_right + 8, y, obj_player))
	&& (instance_nearest(x, y, obj_player).speed > 30)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(x, bbox_top - 8, obj_player))
	&& (instance_nearest(x, y, obj_player).speed > 30)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	|| (place_meeting(x, bbox_bottom + 8, obj_player))
	&& (instance_nearest(x, y, obj_player).speed > 30)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	{
		instance_create_depth(x, y - 32, 0, obj_block_break);
		if (instance_nearest(x, y, obj_player).x < x)
		{
			var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
			new_instance.sprite_index = sprite_index;
			with(new_instance)
			{
				if (instance_exists(obj_player))
				{
					motion_set(random_range(13, 77), random_range(5, 10) + instance_nearest(x, y, obj_player).speed * 0.5);
				}
			}
		}
		else
		{
			var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
			new_instance.sprite_index = sprite_index;
			with(new_instance)
			{
				if (instance_exists(obj_player))
				{
					motion_set(random_range(103, 135 + 32), random_range(5, 10) + instance_nearest(x, y, obj_player).speed * 0.5);
				}
			}
		}
		score += 50;
		if (instance_exists(obj_camera))
		{
			
			#region /* Only do the breaking smoke effect and sound effect if it's inside the view */
			if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
			&& (x > camera_get_view_x(view_camera[view_current]))
			&& (bbox_bottom < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			&& (y > camera_get_view_y(view_camera[view_current]))
			{
				effect_create_above(ef_smoke, x, y, 1, c_dkgray);
				scr_audio_play(snd_blockbreak, volume_source.sound);
			}
			#endregion /* Only do the breaking smoke effect and sound effect if it's inside the view END */
			
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		
		scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
		instance_destroy();
	}
}
#endregion /* Collision with player END */

#region /* Collision with bowlingball enemy */
if (instance_exists(obj_enemy_bowlingball))
&& (distance_to_object(obj_enemy_bowlingball) < 32)
{
	if (position_meeting(bbox_left - 10, y, obj_enemy_bowlingball))
	&& (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
	|| (position_meeting(bbox_right + 10, y, obj_enemy_bowlingball))
	&& (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
	|| (place_meeting(x, bbox_bottom + 8, obj_enemy))
	&& (instance_nearest(x, y, obj_enemy).vspeed < 0)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
	{
		instance_create_depth(x, y - 32, 0, obj_block_break);
		if (instance_nearest(x, y, obj_enemy_bowlingball).x < x)
		{
			var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
			new_instance.sprite_index = sprite_index;
			with(new_instance)
			{
				if (instance_exists(obj_enemy_bowlingball))
				{
					motion_set(random_range(13, 77), random_range(5, 10) + instance_nearest(x, y, obj_enemy_bowlingball).speed * 0.5);
				}
			}
		}
		else
		{
			var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
			new_instance.sprite_index = sprite_index;
			with(new_instance)
			{
				if (instance_exists(obj_enemy_bowlingball))
				{
					motion_set(random_range(103, 135 + 32), random_range(5, 10) + instance_nearest(x, y, obj_enemy_bowlingball).speed * 0.5);
				}
			}
		}
		score += 50;
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
	
		#region /* Only do the breaking smoke effect and sound effect if it's inside the view */
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		&& (x > camera_get_view_x(view_camera[view_current]))
		&& (bbox_bottom < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		&& (y > camera_get_view_y(view_camera[view_current]))
		{
			effect_create_above(ef_smoke, x, y, 1, c_dkgray);
			scr_audio_play(snd_blockbreak, volume_source.sound);
		}
		#endregion /* Only do the breaking smoke effect and sound effect if it's inside the view END */
	
		if (instance_exists(obj_player))
		{
			scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
		}
		instance_destroy();
	}
}
#endregion /* Collision with bowlingball enemy END */