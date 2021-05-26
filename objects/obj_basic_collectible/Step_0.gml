if (bounceup = false)
{
	visible = true;
	if (asset_get_type("obj_camera") == asset_object)
	and(instance_exists(obj_camera))
	{
		image_index = obj_camera.image_index;
	}
	if (asset_get_type("obj_player") == asset_object)
	{
		if (place_meeting(bbox_left, y, obj_player))
		or(place_meeting(bbox_right, y, obj_player))
		or(place_meeting(x, bbox_top, obj_player))
		or(place_meeting(x, bbox_bottom, obj_player))
		{
			if (asset_get_type("obj_wall") == asset_object)
				and(!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
				{
					effect_create_above(ef_ring, x, y, 0, c_white);
					score += 200;
					global.hud_show_score = true;
					if (asset_get_type("obj_camera") == asset_object)
						if (instance_exists(obj_camera))
						{
							with(obj_camera)
							{
								hud_show_score_timer = global.hud_show_timer;
							}
						}
					with(instance_nearest(x, y, obj_player))
					{
						basic_collectibles += 1;
					}
					global.basic_collectibles += 1;
					global.hud_show_basic_collectibles = true;
					if (asset_get_type("obj_camera") == asset_object)
						and(instance_exists(obj_camera))
						{
							with(obj_camera)
							{
								hud_show_basic_collectibles_timer = global.hud_show_timer;
							}
						}
					if (asset_get_type("snd_coin") == asset_sound)
					{
						audio_play_sound(snd_coin, 0, 0);
						audio_sound_gain(snd_coin, global.sfx_volume, 0);
					}
					instance_destroy();
				}
		}
	}
}

#region /*Bounce up*/
if (bounceup = true)
{
	if (delay >= delay_time)
	{
		if (basic_collectible_sound = false)
		{
			if (asset_get_type("snd_coin") == asset_sound)
			{
				audio_play_sound(snd_coin, 0, 0);
				audio_sound_gain(snd_coin, global.sfx_volume, 0);
			}
			basic_collectible_sound = true;
		}
		visible = true;
		#region /*Set the gravity*/
		gravity_direction = 270; /*Direction of the gravity*/
		gravity = 0.5; /*The gravity*/
		#endregion /*Set the gravity END*/
		if (vspeed > 0)
		and(y > ystart - 32)
		or (delay >= delay_time + 60)
		{
			score += 200;
			global.hud_show_score = true;
			if (asset_get_type("obj_camera") == asset_object)
				and(instance_exists(obj_camera))
				{
					with(obj_camera)
					{
						hud_show_score_timer = global.hud_show_timer;
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
			and(instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					hud_show_basic_collectibles_timer = global.hud_show_timer;
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
	#region /*Don't go outside view boundary*/
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
	#endregion /*Don't go outside view boundary END*/
}
#endregion /*Bounce up END*/