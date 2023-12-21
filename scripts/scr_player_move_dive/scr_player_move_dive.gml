function scr_player_move_dive()
{
	
	#region /* Dive */
	if (allow_dive)
	&& (can_move)
	&& (hold_item_in_hands == "")
	&& (!global.pause)
	&& (can_dive)
	&& (drop_off_wall_climb == 0)
	&& (!in_water)
	{
		if (dive == false)
		&& (burnt == false)
		&& (stick_to_wall == false)
		&& (ledge_grab == false)
		&& (!climb)
		&& (!horizontal_rope_climb)
		&& (taken_damage <= taken_damage_freezetime)
		&& (key_dive_pressed) /* Pressing the dive pressed key */
		|| (dive == false)
		&& (burnt == false)
		&& (stick_to_wall == false)
		&& (ledge_grab == false)
		&& (!climb)
		&& (!horizontal_rope_climb)
		&& (taken_damage <= taken_damage_freezetime)
		&& (double_tap_to_dive) /* If you are allowed to double-tap direction to dive */
		&& (double_tap_dive) /* If you double tapped direction to dive */
		{
			if (rope_swing)
			{
				if (instance_exists(obj_tongue))
				{
					with(instance_nearest(x, y, obj_tongue))
					{
						timer = 25;
						move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);
					}
				}
				vspeed = -normal_jump_height + vspeed;
				rope_angle_velocity = 0;
				grapple_x = x;
				grapple_y = y;
				rope_angle = point_direction(grapple_x, grapple_y, x, y);
				rope_length = point_distance(grapple_x, grapple_y, x, y);
				rope_swing = false;
			}
			if (speed_max <8)
			{
				speed_max = 8;
			}
			if (!place_meeting(x, y - 8, obj_wall))
			{
				vspeed = -6;
			}
			else
			{
				vspeed = 0;
			}
					
			#region /* Choose direction to dive */
			if (key_left_hold)
			&& (!key_right_hold)
			|| (image_xscale < 0)
			{
				if (hspeed >- 10)
				{
					if (!place_meeting(x - 4, y, obj_wall))
					{
						hspeed = - 10;
					}
				}
				image_xscale = -1;
			}
			else
			if (key_right_hold)
			&& (!key_left_hold)
			|| (image_xscale > 0)
			{
				if (hspeed <+ 10)
				{
					if (!place_meeting(x + 4, y, obj_wall))
					{
						hspeed = +10;
					}
				}
				image_xscale = +1;
			}
			#endregion /* Choose direction to dive */
					
			ground_pound = false;
			can_ground_pound = false;
			scr_audio_play(snd_dive, volume_source.sound);
			scr_audio_play(voice_dive, volume_source.voice);
			dive = true;
			double_tap_dive = false;
			jump = 0;
			spring = false;
			move_towards_spring_endpoint = false;
			if (!place_meeting(x, y + 1, obj_wall))
			&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
			&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
			{
				crouch = false;
			}
			image_index = 0;
			angle = 0;
			wall_jump = 0;
			glide = false;
			can_glide = 20;
		}
		else
		if (dive)
		{
			if (key_left_hold)
			&& (place_meeting(x + 1, y, obj_wall))
			|| (key_right_hold)
			&& (place_meeting(x - 1, y, obj_wall))
			{
				hspeed = 0;
			}
			
			#region /* Propel the player forward in the direction the player is facing */
			if (image_xscale < 0)
			{
				if (hspeed >-4)
				{
					if (!place_meeting(x - 4, y, obj_wall))
					{
						hspeed = -4;
					}
					else
					if (!place_meeting(x - 1, y, obj_wall))
					{
						hspeed = - 1;
					}
				}
			}
			else
			if (image_xscale > 0)
			{
				if (hspeed <+ 4)
				{
					if (!place_meeting(x + 4, y, obj_wall))
					{
						hspeed = +4;
					}
					else
					if (!place_meeting(x + 1, y, obj_wall))
					{
						hspeed = +1;
					}
				}
			}
			#endregion /* Propel the player forward in the direction the player is facing END */
			
			#region /* If player lands on ground when diving, stop diving */
			if (on_ground)
			{
				if (vspeed >= 0)
				{
					dive = false;
					dive_on_ground = 10;
					can_attack_after_dive_on_ground = can_attack_after_dive_on_ground_max_value;
					ground_pound = false;
					can_ground_pound = false;
				}
			}
			#endregion /* If player lands on ground when diving, stop diving END */

			#region /* If player lands in water when diving, stop diving */
			if (in_water)
			{
				dive = false;
				can_dive = true;
				crouch = false;
			}
			#endregion /* If player lands in water when diving, stop diving END */
			
			#region /* Cancel dive (only when you have enabled dive canceling in settings) */
			if (cancel_dive_by_pressing_jump_or_dive_button)
			{
				if (key_jump)
				|| (key_dive_pressed)
				{
					dive = false;
					can_dive = false;
				}
			}
			if (cancel_dive_by_pressing_opposite_direction)
			{
				if (hspeed < 0)
				&& (key_right_hold)
				|| (hspeed > 0)
				&& (key_left_hold)
				{
					dive = false;
					can_dive = false;
				}
			}
			#endregion /* Cancel dive (only when you have enabled dive canceling in settings) END */
			
		}
	}
	#endregion /* Dive END */
	
}