image_index = obj_camera.image_index;

function get_1up_when_collect_basic_collectibles()
{
	
	#region /* Get 1-up if you get 100 basic collectibles */
	var basic_collectible_threshold = 100;
	if (global.basic_collectibles >= basic_collectible_threshold)
	{
		global.basic_collectibles = 0;
		with(obj_camera)
		{
			hud_show_lives_timer = global.hud_hide_time * 60;
		}
		var nearest_instance = instance_nearest(x, y, obj_player);
		if (instance_exists(nearest_instance))
		{
			with(instance_create_depth(nearest_instance.x, nearest_instance.y - 16, 0, obj_score_up))
			{
				score_up = "1-up";
			}
		}
		else if (instance_exists(obj_player))
		{
			with(instance_create_depth(obj_player.x, obj_player.y - 16, 0, obj_score_up))
			{
				score_up = "1-up";
			}
		}
	}
	#endregion /* Get 1-up if you get 100 basic collectibles END */
	
}

#region /* Bounce up */
if (bounce_up == true)
{
	if (delay >= delay_time)
	{
		if (basic_collectible_sound == false)
		{
			scr_audio_play(snd_basic_collectible, volume_source.sound);
			basic_collectible_sound = true;
		}
		depth = -100;
		visible = true;
		gravity_direction = 270;
		gravity = 0.5;
		
		if (vspeed > 0)
		and (y > ystart - 32)
		or (delay >= delay_time + 60)
		{
			score += 200;
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
			with(instance_nearest(x, y, obj_player))
			{
				basic_collectibles += 1;
			}
			global.basic_collectibles += 1;
			
			get_1up_when_collect_basic_collectibles();
			
			with(obj_camera)
			{
				hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
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
	x = clamp(x, camera_get_view_x(view_camera[view_current]) + 32, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32);
	y = clamp(y, camera_get_view_y(view_camera[view_current]) + 32, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]));
	#endregion /* Don't go outside view boundary END */
	
}
#endregion /* Bounce up END */

#region /* Touch Player */
if (bounce_up == false)
and (distance_to_object(instance_nearest(x, y, obj_player) < 32))
{
	if (place_meeting(x - 10, y, instance_nearest(x, y, obj_player)))
	or (place_meeting(x + 10, y, instance_nearest(x, y, obj_player)))
	or (place_meeting(x, y - 10, instance_nearest(x, y, obj_player)))
	or (place_meeting(x, y + 10, instance_nearest(x, y, obj_player)))
	{
		effect_create_above(ef_ring, x, y, 0, c_white);
		with(instance_nearest(x, y, obj_player))
		{
			score += 200;
			basic_collectibles += 1;
			global.basic_collectibles += 1;
		}
		
		get_1up_when_collect_basic_collectibles();
		
		with(obj_camera)
		{
			hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
			hud_show_score_timer = global.hud_hide_time * 60;
		}
		scr_audio_play(snd_basic_collectible, volume_source.sound);
		instance_destroy();
	}
}
#endregion /* Touch Player END */