function scr_player_move_dive()
{
	
	#region /* Dive */
	if (allow_dive == true)
	and (can_move == true)
	and (hold_item_in_hands == "")
	and (global.pause == false)
	and (can_dive == true)
	and (drop_off_wall_climb == 0)
	and (in_water == false)
	{
		if (dive == false)
		and (burnt == false)
		and (stick_to_wall == false)
		and (ledge_grab == false)
		and (climb == false)
		and (horizontal_rope_climb == false)
		and (takendamage <= takendamage_freezetime)
		and (key_dive_pressed) /* Pressing the dive pressed key */
		or (dive == false)
		and (burnt == false)
		and (stick_to_wall == false)
		and (ledge_grab == false)
		and (climb == false)
		and (horizontal_rope_climb == false)
		and (takendamage <= takendamage_freezetime)
		and (double_tap_to_dive == true) /* If you are allowed to double-tap direction to dive */
		and (double_tap_dive == true) /* If you double tapped direction to dive */
		{
			if (rope_swing == true)
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
			and (!key_right_hold)
			or (image_xscale < 0)
			{
				if (hspeed >- 10)
				{
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x - 4, y, obj_wall))
					{
						hspeed = - 10;
					}
				}
				image_xscale = -1;
			}
			else
			if (key_right_hold)
			and (!key_left_hold)
			or (image_xscale > 0)
			{
				if (hspeed <+ 10)
				{
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x + 4, y, obj_wall))
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
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x, y + 1, obj_wall))
			and (asset_get_type("obj_semisolid_platform") == asset_object)
			and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
			and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
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
		if (dive == true)
		{
			if (key_left_hold)
			and (asset_get_type("obj_wall") == asset_object)
			and (place_meeting(x + 1, y, obj_wall))
			or (key_right_hold)
			and (asset_get_type("obj_wall") == asset_object)
			and (place_meeting(x - 1, y, obj_wall))
			{
				hspeed = 0;
			}
			
			#region /* Propel the player forward in the direction the player is facing */
			if (image_xscale < 0)
			{
				if (hspeed >-4)
				{
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x - 4, y, obj_wall))
					{
						hspeed = -4;
					}
					else
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x - 1, y, obj_wall))
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
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x + 4, y, obj_wall))
					{
						hspeed = +4;
					}
					else
					if (asset_get_type("obj_wall") == asset_object)
					and (!place_meeting(x + 1, y, obj_wall))
					{
						hspeed = +1;
					}
				}
			}
			#endregion /* Propel the player forward in the direction the player is facing END */
			
			#region /* If player lands on ground when diving, stop diving */
			if (on_ground == true)
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
			if (in_water == true)
			{
				dive = false;
				can_dive = true;
				crouch = false;
			}
			#endregion /* If player lands in water when diving, stop diving END */
			
			#region /* Cancel dive (only when you have enabled dive canceling in settings) */
			if (cancel_dive_by_pressing_jump_or_dive_button == true)
			{
				if (key_jump)
				or (key_dive_pressed)
				{
					dive = false;
					can_dive = false;
				}
			}
			if (cancel_dive_by_pressing_opposite_direction == true)
			{
				if (hspeed < 0)
				and (key_right_hold)
				or (hspeed > 0)
				and (key_left_hold)
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