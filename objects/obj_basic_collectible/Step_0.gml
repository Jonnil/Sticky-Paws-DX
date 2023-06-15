if (instance_exists(obj_camera))
{
	image_index = obj_camera.image_index;
	
	var object_camera = obj_camera;
	
	#region /* Bounce up */
	if (bounce_up)
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
			
			if (vspeed > 0 && y > ystart - 32 || delay >= delay_time + 60)
			{
				score += 200;
				object_camera.hud_show_score_timer = global.hud_hide_time * 60;
				with(instance_nearest(x, y, obj_player))
				{
					basic_collectibles ++;
				}
				global.basic_collectibles ++;
				
				get_1up_when_collect_basic_collectibles();
				
				object_camera.hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
				effect_create_above(ef_ring, x, y, 0, c_white);
				instance_destroy();
			}
		}
		else
		{
			delay ++;
			visible = false;
			y = ystart;
		}
		
		#region /* Don't go outside view boundary */
		var view_x = camera_get_view_x(view_camera[view_current]);
		var view_y = camera_get_view_y(view_camera[view_current]);
		var view_width = camera_get_view_width(view_camera[view_current]);
		var view_height = camera_get_view_height(view_camera[view_current]);
		x = clamp(x, view_x + 32, view_x + view_width - 32);
		y = clamp(y, view_y + 32, view_y + view_height);
		#endregion /* Don't go outside view boundary END */
		
	}
	#endregion /* Bounce up END */
	
	#region /* Touch Player */
	if (bounce_up == false && distance_to_object(instance_nearest(x, y, obj_player)) < 12)
	{
		effect_create_above(ef_ring, x, y, 0, c_white);
		score += 200;
		global.basic_collectibles ++;
		instance_nearest(x, y, obj_player).basic_collectibles ++;
		get_1up_when_collect_basic_collectibles();
		object_camera.hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
		object_camera.hud_show_score_timer = global.hud_hide_time * 60;
		scr_audio_play(snd_basic_collectible, volume_source.sound);
		instance_destroy();
	}
	#endregion /* Touch Player END */
	
}