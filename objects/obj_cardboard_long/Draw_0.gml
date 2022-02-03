if (brick_particle = false)
{
	image_speed = 0.1;
}
if (brick_particle = true)
{
	if (asset_get_type("obj_cardboard_long_particle") == asset_object)
	{
		instance_change(obj_cardboard_long_particle, true);
	}
	
	#region /*Set the gravity*/
	gravity_direction = 270;
	gravity = 0.5;
	#endregion /*Set the gravity END*/
	
	#region /*Destroy outside view*/
	if (x<camera_get_view_x(view_camera[view_current]) + sprite_width)
	or(x >camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + sprite_width)
	or(y <camera_get_view_y(view_camera[view_current]) + sprite_width)
	or(y >camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + sprite_width)
	{
		instance_destroy();
	}
	#endregion /*Destroy outside view END*/
	
	if (hspeed < 0)
	{
		image_angle += speed;
	}
	if (hspeed > 0)
	{
		image_angle-= speed;
	}
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);
	mask_index = noone;
}
if (asset_get_type("spr_cardboard_long") == asset_sprite)
{
	draw_sprite_ext(spr_cardboard_long, image_index, x, y,draw_xscale,draw_yscale, image_angle, image_blend, image_alpha);
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

if (brick_particle = false)
{
	if (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	{
		if (place_meeting(x, bbox_bottom, obj_player))
		and (instance_nearest(x, y, obj_player).vspeed < 0)
		or(place_meeting(x, y - 16, obj_player))
		and (instance_nearest(x, y, obj_player).ground_pound = true)
		or(place_meeting(bbox_left- 8,y, obj_player))
		and (instance_nearest(x, y, obj_player).dive = true)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		or(place_meeting(bbox_right +8,y, obj_player))
		and (instance_nearest(x, y, obj_player).dive = true)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		or(place_meeting(bbox_left - 1, y, obj_player))
		and (instance_nearest(x, y, obj_player).wall_jump > 0)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		or(place_meeting(bbox_right + 1, y, obj_player))
		and (instance_nearest(x, y, obj_player).wall_jump > 0)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		
		or(place_meeting(bbox_left- 8,y, obj_player))
		and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint = true)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		or(place_meeting(bbox_right- 8,y, obj_player))
		and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint = true)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		or(place_meeting(x, bbox_top- 8, obj_player))
		and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint = true)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		or(place_meeting(x, bbox_bottom+8, obj_player))
		and (instance_nearest(x, y, obj_player).move_towards_spring_endpoint = true)
		and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		
		or(place_meeting(bbox_left- 8,y, obj_boss))
		and (!collision_line(x, y, instance_nearest(x, y, obj_boss).x, instance_nearest(x, y, obj_boss).y, obj_wall, false, true))
		or(place_meeting(bbox_right- 8,y, obj_boss))
		and (!collision_line(x, y, instance_nearest(x, y, obj_boss).x, instance_nearest(x, y, obj_boss).y, obj_wall, false, true))
		
		or(!place_meeting(x, y + 2, obj_wall))
		and (x<camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) +outside_view_offset)
		and (x >camera_get_view_x(view_camera[view_current]) -outside_view_offset)
		and (bbox_bottom<camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) +outside_view_offset)
		and (y >camera_get_view_y(view_camera[view_current]) -outside_view_offset)
		and (!place_meeting(x, y + 2, obj_semisolid_platform))
		and (x<camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) +outside_view_offset)
		and (x >camera_get_view_x(view_camera[view_current]) -outside_view_offset)
		and (bbox_bottom<camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) +outside_view_offset)
		and (y >camera_get_view_y(view_camera[view_current]) -outside_view_offset)
		
		or(asset_get_type("obj_blockbreak") == asset_object)
		and (place_meeting(x, y, obj_blockbreak))
		{
			if (position_meeting(bbox_left + 3,bbox_bottom + 1, instance_nearest(x, y, obj_player)))
			or(position_meeting(bbox_right-3,bbox_bottom + 1, instance_nearest(x, y, obj_player)))
			{
				if (asset_get_type("obj_blockbreak") == asset_object)
				{
					instance_create_depth(x, y - 32, 0, obj_blockbreak);
				}
			}
			if (asset_get_type("obj_cardboard_long") == asset_object)
			{
				if (instance_nearest(x, y, obj_player).x < x)
				{
					obj = instance_create_depth(x, y, 0, obj_cardboard_long);
					with(obj)
					{
						motion_set(random_range(45-32, 45+ 32), random_range(5, 10) + instance_nearest(x, y, obj_player).speed/ 2);
						mask_index = noone;
						brick_particle = true;
					}
				}
				else
				{
					obj = instance_create_depth(x, y, 0, obj_cardboard_long);
					with(obj)
					{
						motion_set(random_range(135-32, 135+ 32), random_range(5, 10) + instance_nearest(x, y, obj_player).speed/ 2);
						mask_index = noone;
						brick_particle = true;
					}
				}
			}
			score += 50;
			global.hud_show_score = true;
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					hud_show_score_timer = global.hud_hide_time * 60;
				}
			}
			
			#region /*Only do the breaking smoke effect and sound effect if it's inside the view*/
			if (x<camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
			and (x >camera_get_view_x(view_camera[view_current]))
			and (bbox_bottom<camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			and (y >camera_get_view_y(view_camera[view_current]))
			{
				effect_create_above(ef_smoke, x, y, 1, c_dkgray);
				if (asset_get_type("snd_blockbreak") == asset_sound)
				{
					audio_play_sound(snd_blockbreak, 0, 0);
					audio_sound_gain(snd_blockbreak, global.sfx_volume, 0);
				}
			}
			#endregion /*Only do the breaking smoke effect and sound effect if it's inside the view END*/
			
			instance_destroy();
		}
	}
	
	#region /*Collision with bullet*/
	if (asset_get_type("obj_bullet") == asset_object)
	and (instance_exists(obj_bullet))
	and (distance_to_object(obj_bullet) < 32)
	and (instance_nearest(x, y, obj_bullet).die = false)
	{
		if (place_meeting(x, y, obj_bullet))
		or(place_meeting(x- 5,y, obj_bullet))
		or(place_meeting(x +5,y, obj_bullet))
		{
			
			#region /*Turn into cardboard particle*/
			if (asset_get_type("obj_cardboard_long") == asset_object)
			{
				if (instance_nearest(x, y, obj_bullet).x < x)
				{
					obj = instance_create_depth(x, y, 0, obj_cardboard_long);
					with(obj)
					{
						motion_set(random_range(45-32, 45+ 32), random_range(5, 10) + instance_nearest(x, y, obj_bullet).speed/ 2);
						mask_index = noone;
						brick_particle = true;
					}
				}
				else
				{
					obj = instance_create_depth(x, y, 0, obj_cardboard_long);
					with(obj)
					{
						motion_set(random_range(135-32, 135+ 32), random_range(5, 10) + instance_nearest(x, y, obj_bullet).speed/ 2);
						mask_index = noone;
						brick_particle = true;
					}
				}
			}
			#endregion /*Turn into cardboard particle END*/
			
			with(instance_nearest(x, y, obj_bullet))
			{
				instance_destroy();
			}
			if (asset_get_type("obj_blockbreak") == asset_object)
			{
				instance_create_depth(x, y - 32, 0, obj_blockbreak);
			}
			score += 50;
			global.hud_show_score = true;
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					hud_show_score_timer = global.hud_hide_time * 60;
				}
			}
			
			#region /*Only do the breaking smoke effect and sound effect if it's inside the view*/
			if (x<camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
			and (x >camera_get_view_x(view_camera[view_current]))
			and (bbox_bottom<camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			and (y >camera_get_view_y(view_camera[view_current]))
			{
				effect_create_above(ef_smoke, x, y, 1, c_dkgray);
				if (asset_get_type("snd_blockbreak") == asset_sound)
				{
					audio_play_sound(snd_blockbreak, 0, 0);
					audio_sound_gain(snd_blockbreak, global.sfx_volume, 0);
				}
			}
			#endregion /*Only do the breaking smoke effect and sound effect if it's inside the view END*/
			
			instance_destroy();
		}
	}
	#endregion /*Collision with bullet END*/
}