var view_left = camera_get_view_x(view_camera[view_current]) - 22
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 22
var view_top = camera_get_view_y(view_camera[view_current]) - 22
var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 22

#region /* No collision underneath */
if (!place_meeting(x, y + 3, obj_wall))
and (!place_meeting(x, y + 3, obj_semisolid_platform))
{
	if (x < view_right)
	and (x > view_left)
	and (y < view_bottom)
	and (y > view_top)
	{
		if (asset_get_type("obj_block_break") == asset_object)
		{
			instance_create_depth(x, y - 32, 0, obj_block_break);
		}
		if (asset_get_type("obj_cardboard") == asset_object)
		{
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
						motion_set(random_range(103, 167), random_range(5, 10) + instance_nearest(x, y, obj_player).speed * 0.5);
					}
				}
			}
		}
		score += 50;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			
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
			
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		
		if (instance_exists(obj_player))
		{
			scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
		}
		instance_destroy();
	}
}
#endregion /* No collision underneath END */