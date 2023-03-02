#region /* Collision with bowlingball enemy */
if (position_meeting(bbox_left - 10, y, obj_enemy_bowlingball))
and (other.sliding_along_ground <> 0)
and (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
or (position_meeting(bbox_right + 10, y, obj_enemy_bowlingball))
and (other.sliding_along_ground <> 0)
and (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
or (place_meeting(x, bbox_bottom + 8, obj_enemy))
and (instance_nearest(x, y, obj_enemy).vspeed < 0)
and (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
{
	if (asset_get_type("obj_block_break") == asset_object)
	{
		instance_create_depth(x, y - 32, 0, obj_block_break);
	}
	if (asset_get_type("obj_cardboard") == asset_object)
	{
		if (other.x < x)
		{
			var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
			new_instance.sprite_index = sprite_index;
			with(new_instance)
			{
				if (instance_exists(other))
				{
					motion_set(random_range(45 - 32, 45+ 32), random_range(5, 10) + instance_nearest(x, y, other).speed * 0.5);
				}
			}
		}
		else
		{
			var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
			new_instance.sprite_index = sprite_index;
			with(new_instance)
			{
				if (instance_exists(other))
				{
					motion_set(random_range(135 - 32, 135+ 32), random_range(5, 10) + instance_nearest(x, y, other).speed * 0.5);
				}
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
#endregion /* Collision with bowlingball enemy END */