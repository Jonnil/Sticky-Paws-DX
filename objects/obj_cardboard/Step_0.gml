if (length == 1)
{
	sprite_index = spr_cardboard_block;
	mask_index = spr_cardboard_block;
}
else
if (length == 2)
{
	sprite_index = spr_cardboard;
	mask_index = spr_cardboard;
}
else
if (length == 3)
{
	sprite_index = spr_cardboard_long;
	mask_index = spr_cardboard_long;
}
if (asset_get_type("obj_player") == asset_object)
and (place_meeting(x, y - 1, obj_player))
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
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	if (place_meeting(x, bbox_bottom, obj_player))
	and (instance_nearest(x, y, obj_player).vspeed < 0)
	or (place_meeting(x, y - 16, obj_player))
	and (instance_nearest(x, y, obj_player).ground_pound == true)
	or (place_meeting(bbox_left - 8, y, obj_player))
	and (instance_nearest(x, y, obj_player).dive == true)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(bbox_right + 8, y, obj_player))
	and (instance_nearest(x, y, obj_player).dive == true)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(bbox_left - 1, y, obj_player))
	and (instance_nearest(x, y, obj_player).wall_jump > 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(bbox_right + 1, y, obj_player))
	and (instance_nearest(x, y, obj_player).wall_jump > 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	
	or (place_meeting(bbox_left - 8, y, obj_player))
	and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint == true)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(bbox_right + 8, y, obj_player))
	and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint == true)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(x, bbox_top - 8, obj_player))
	and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint == true)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(x, bbox_bottom + 8, obj_player))
	and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint == true)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	
	or (place_meeting(bbox_left - 8, y, obj_player))
	and (instance_nearest(x, y, obj_player).speed > 20)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(bbox_right + 8, y, obj_player))
	and (instance_nearest(x, y, obj_player).speed > 20)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(x, bbox_top - 8, obj_player))
	and (instance_nearest(x, y, obj_player).speed > 20)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	or (place_meeting(x, bbox_bottom + 8, obj_player))
	and (instance_nearest(x, y, obj_player).speed > 20)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	
	or (position_meeting(bbox_left - 10, y, obj_enemy_bowlingball))
	and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
	or (position_meeting(bbox_right + 10, y, obj_enemy_bowlingball))
	and (instance_nearest(x, y, obj_enemy_bowlingball).sliding_along_ground <> 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
	or (place_meeting(x, bbox_bottom + 8, obj_enemy))
	and (instance_nearest(x, y, obj_enemy).vspeed < 0)
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
	
	or (place_meeting(bbox_left - 8, y, obj_boss))
	and (!collision_line(x, y, instance_nearest(x, y, obj_boss).x, instance_nearest(x, y, obj_boss).y, obj_wall, false, true))
	or (place_meeting(bbox_right + 8, y, obj_boss))
	and (!collision_line(x, y, instance_nearest(x, y, obj_boss).x, instance_nearest(x, y, obj_boss).y, obj_wall, false, true))
	
	or (!place_meeting(x, y + 2, obj_wall))
	and (!place_meeting(x, y + 2, obj_semisolid_platform))
	and (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	and (x < obj_camera.view_x_center + 980 - sprite_width)
	and (x > obj_camera.view_x_center - 980)
	and (y < obj_camera.view_y_center + 980)
	and (y > obj_camera.view_y_center - 980)
	
	or (asset_get_type("obj_block_break") == asset_object)
	and (place_meeting(x, y, obj_block_break))
	{
		if (position_meeting(bbox_left + 3,bbox_bottom + 1, instance_nearest(x, y, obj_player)))
		or (position_meeting(bbox_right - 3,bbox_bottom + 1, instance_nearest(x, y, obj_player)))
		{
			if (asset_get_type("obj_block_break") == asset_object)
			{
				instance_create_depth(x, y - 32, 0, obj_block_break);
			}
		}
		if (asset_get_type("obj_cardboard") == asset_object)
		{
			if (instance_nearest(x, y, obj_player).x < x)
			{
				var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
				new_instance.sprite_index = sprite_index;
				with(new_instance)
				{
					motion_set(random_range(45 - 32, 45+ 32), random_range(5, 10) + instance_nearest(x, y, obj_player).speed / 2);
				}
			}
			else
			{
				var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
				new_instance.sprite_index = sprite_index;
				with(new_instance)
				{
					motion_set(random_range(135 - 32, 135+ 32), random_range(5, 10) + instance_nearest(x, y, obj_player).speed / 2);
				}
			}
		}
		score += 50;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		
		#region /* Only do the breaking smoke effect and sound effect if it's inside the view */
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (x > camera_get_view_x(view_camera[view_current]))
		and (bbox_bottom < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		and (y > camera_get_view_y(view_camera[view_current]))
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
#endregion /* Collision with player END */

#region /* Collision with bullet */
if (asset_get_type("obj_bullet") == asset_object)
and (instance_exists(obj_bullet))
and (distance_to_object(obj_bullet) < 32)
and (instance_nearest(x, y, obj_bullet).die = false)
{
	if (place_meeting(x, y, obj_bullet))
	or (place_meeting(x - 5, y, obj_bullet))
	or (place_meeting(x + 5, y, obj_bullet))
	{
		
		#region /* Turn into cardboard particle */
		if (asset_get_type("obj_cardboard") == asset_object)
		{
			if (instance_nearest(x, y, obj_bullet).x < x)
			{
				var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
				new_instance.sprite_index = sprite_index;
				with(instance_create_depth(x, y, 0, new_instance))
				{
					motion_set(random_range(45 - 32, 45+ 32), random_range(5, 10) + instance_nearest(x, y, obj_bullet).speed / 2);
				}
			}
			else
			{
				var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
				new_instance.sprite_index = sprite_index;
				with(instance_create_depth(x, y, 0, new_instance))
				{
					motion_set(random_range(135 - 32, 135+ 32), random_range(5, 10) + instance_nearest(x, y, obj_bullet).speed / 2);
				}
			}
		}
		#endregion /* Turn into cardboard particle END */
		
		with(instance_nearest(x, y, obj_bullet))
		{
			if (instance_exists(obj_player))
			{
				scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
			}
			instance_destroy();
		}
		if (asset_get_type("obj_block_break") == asset_object)
		{
			instance_create_depth(x, y - 32, 0, obj_block_break);
		}
		score += 50;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		
		#region /* Only do the breaking smoke effect and sound effect if it's inside the view */
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (x > camera_get_view_x(view_camera[view_current]))
		and (bbox_bottom < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		and (y > camera_get_view_y(view_camera[view_current]))
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
#endregion /* Collision with bullet END */