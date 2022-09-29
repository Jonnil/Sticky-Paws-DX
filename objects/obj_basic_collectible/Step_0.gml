sprite_index = global.resource_pack_sprite_basic_collectible;

if (bounceup = false)
{
	visible = true;
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	{
		image_index = obj_camera.image_index;
	}
	if (asset_get_type("obj_player") == asset_object)
	{
		if (place_meeting(bbox_left, y, obj_player))
		or (place_meeting(bbox_right, y, obj_player))
		or (place_meeting(x, bbox_top, obj_player))
		or (place_meeting(x, bbox_bottom, obj_player))
		or(asset_get_type("obj_enemy_bowlingball") == asset_object)
		and (place_meeting(x, bbox_bottom, obj_enemy_bowlingball))
		and (instance_nearest(x, y, obj_enemy_bowlingball).flat = true)
		and (instance_nearest(x, y, obj_enemy_bowlingball).die = false)
		and (instance_nearest(x, y, obj_enemy_bowlingball).die_volting = false)
		{
			if (asset_get_type("obj_wall") == asset_object)
			and (instance_exists(obj_player))
			and (instance_exists(obj_wall))
			and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
			and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_semisolid_platform, false, true))
			or (asset_get_type("obj_wall") == asset_object)
			and (asset_get_type("obj_enemy_bowlingball") == asset_object)
			and (place_meeting(x, bbox_bottom, obj_enemy_bowlingball))
			and (instance_nearest(x, y, obj_enemy_bowlingball).flat = true)
			and (!collision_line(x, y, instance_nearest(x, y, obj_enemy_bowlingball).x, instance_nearest(x, y, obj_enemy_bowlingball).y, obj_wall, false, true))
			{
				effect_create_above(ef_ring, x, y, 0, c_white);
				score += 200;
				global.hud_show_score = true;
				if (asset_get_type("obj_camera") == asset_object)
					if (instance_exists(obj_camera))
					{
						with(obj_camera)
						{
							hud_show_score_timer = global.hud_hide_time * 60;
						}
					}
				with(instance_nearest(x, y, obj_player))
				{
					basic_collectibles += 1;
				}
				global.basic_collectibles += 1;
				global.hud_show_basic_collectibles = true;
				if (asset_get_type("obj_camera") == asset_object)
				and (instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
					}
				}
				scr_audio_play(snd_basic_collectible, volume_source.sound);
				instance_destroy();
			}
		}
	}
}

#region /* Bounce up */
if (bounceup = true)
{
	if (delay >= delay_time)
	{
		if (basic_collectible_sound = false)
		{
			scr_audio_play(snd_basic_collectible, volume_source.sound);
			basic_collectible_sound = true;
		}
		depth = - 100;
		visible = true;
		#region /* Set the gravity */
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		#endregion /* Set the gravity END */
		if (vspeed > 0)
		and (y > ystart - 32)
		or(delay >= delay_time + 60)
		{
			score += 200;
			global.hud_show_score = true;
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					hud_show_score_timer = global.hud_hide_time * 60;
				}
			}
			if (asset_get_type("obj_player") == asset_object)
			{
				with(instance_nearest(x, y, obj_player))
				{
					basic_collectibles += 1;
				}
			}
			global.basic_collectibles += 1;
			global.hud_show_basic_collectibles = true;
			if (asset_get_type("obj_camera") == asset_object)
			and (instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
				}
			}
			effect_create_above(ef_ring, x, y, 0, c_white);
			instance_destroy();
		}
	}
	else
	{
		delay += 1;
		visible = false;
		y = ystart;
	}
	#region /* Don't go outside view boundary */
	if (x < camera_get_view_x(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + 32;
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32;
	}
	if (y < camera_get_view_y(view_camera[view_current]) + 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + 32;
	}
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	{
		y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
	}
	#endregion /* Don't go outside view boundary END */
}
#endregion /* Bounce up END */