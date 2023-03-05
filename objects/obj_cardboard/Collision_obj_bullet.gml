#region /* Collision with bullet */
if (asset_get_type("obj_bullet") == asset_object)
and (instance_exists(obj_bullet))
and (distance_to_object(obj_bullet) < 32)
and (other.die == false)
{
	if (place_meeting(x, y, obj_bullet))
	or (place_meeting(x - 5, y, obj_bullet))
	or (place_meeting(x + 5, y, obj_bullet))
	{
		
		#region /* Turn into cardboard particle */
		if (asset_get_type("obj_cardboard") == asset_object)
		{
			if (other.x < x)
			{
				var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
				new_instance.sprite_index = sprite_index;
				with(new_instance)
				{
					motion_set(random_range(13, 77), random_range(5, 10) + other.speed * 0.5);
				}
			}
			else
			{
				var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
				new_instance.sprite_index = sprite_index;
				with(new_instance)
				{
					motion_set(random_range(103, 167), random_range(5, 10) + other.speed * 0.5);
				}
			}
		}
		#endregion /* Turn into cardboard particle END */
		
		if (instance_exists(obj_player))
		{
			scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
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
		
		if (other.x < x)
		{
			with(other)
			{
				die = true;
				vspeed = - 8;
				die_volting = - 1;
			}
		}
		else
		{
			with(other)
			{
				die = true;
				vspeed = - 8;
				die_volting = +1;
			}
		}
		instance_destroy();
	}
}
#endregion /* Collision with bullet END */