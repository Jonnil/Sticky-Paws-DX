function scr_player_move_horizontal_rope()
{
	
	#region /* Climb Horizontal Rope */
	if (horizontal_rope_climb)
	{
		if (hspeed < 0)
		&& (!place_meeting(x - 32, y, obj_horizontal_rope))
		|| (hspeed > 0)
		&& (!place_meeting(x + 32, y, obj_horizontal_rope))
		{
			hspeed = 0;
		}
		if (key_left_hold)
		|| (key_right_hold)
		{
			friction = 0.2;
		}
		else
		{
			friction = 0.5;
		}
		
		#region /* Spinning on horizontal rope */
		if (key_up)
		&& (!key_down)
		&& (!collision_rectangle(bbox_left, bbox_top - 64, bbox_right, bbox_bottom, obj_wall, false, true))
		{
			friction = 0.5; /* Make the character stop horizontal movement sooner when spinning on horizontal rope */
			
			#region /* Start spinning on rope */
			if (image_index <= 5)
			&& (image_speed > 0.3)
			{
				instance_create_depth(x, y, 0, obj_block_break);
				instance_create_depth(x, y + 32, 0, obj_block_break);
				instance_create_depth(x, y + 64, 0, obj_block_break);
			}
			else
			if (image_index >= 5)
			&& (image_speed > 0.3)
			{
				instance_create_depth(x, y, 0, obj_block_break);
				instance_create_depth(x, y - 32, 0, obj_block_break);
				instance_create_depth(x, y - 64, 0, obj_block_break);
			}
			if (image_speed < 1)
			{
				if (sprite_climb_under_spin > noone){sprite_index = sprite_climb_under_spin;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			{
				if (sprite_climb_under_spin_fast> noone){sprite_index = sprite_climb_under_spin_fast;}else
				if (sprite_climb_under_spin > noone){sprite_index = sprite_climb_under_spin;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			if (image_index >= image_number - 1)
			&& (image_number > 1)
			{
				scr_gamepad_vibration(player, 0.2, 10);
				scr_audio_play(snd_swing, volume_source.sound);
				image_index = 0;
			}
			image_speed += 0.02;
			if (image_speed > 1)
			{
				image_speed = 1;
			}
			#endregion /* Start spinning on rope END */
			
			#region /* Jump from rope spin */
			if (key_jump)
			{
				scr_audio_play(snd_jump, volume_source.sound);
				scr_gamepad_vibration(player, 0.4, 10);
				can_climb_horizontal_rope_cooldown = 3;
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				y -= 64;
				climb = false;
				horizontal_rope_climb = false;
				buffer_jump = 0;
				spring_animation = 0;
				spring = true;
				
				#region /* Do a charged upward jump depending on how fast you spin */
				if (image_speed >= 1)
				{
					vspeed = -triple_jump_height * 1.25;
					scr_audio_play(voice_jump_rope, volume_source.voice);
				}
				else
				if (image_speed >= 0.9)
				{
					vspeed = -triple_jump_height * 1.125;
				}
				else
				if (image_speed >= 0.7)
				{
					vspeed = -triple_jump_height;
				}
				else
				{
					vspeed = -normal_jump_height; /* Do the normal upward jump, when you haven't spinned fast enough */
				}
				#endregion /* Do a charged upward jump depending on how fast you spin END */
				
			}
			#endregion /* Jump from rope spin END */
			
		}
		#endregion /* Spinning on horizontal rope END */
		
		else
		
		#region /* Jump upward normally from rope spin if drop down from rope doesn't use jump */
		if (drop_from_rope == 0) /* Drop down from rope: Release Jump */
		&& (key_jump)
		|| (drop_from_rope == 2) /* Drop down from rope: Only Down */
		&& (key_jump)
		|| (drop_from_rope == 4) /* Drop down from rope: Down + Jump */
		&& (key_jump)
		&& (!key_down)
		{
			if (!collision_rectangle(bbox_left, bbox_top - 64, bbox_right, bbox_bottom, obj_wall, false, true))
			{
				scr_audio_play(snd_jump, volume_source.sound);
				can_climb_horizontal_rope_cooldown = 3;
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
				y -= 64;
				climb = false;
				horizontal_rope_climb = false;
				buffer_jump = 0;
				spring_animation = 0;
				spring = true;
				vspeed = -normal_jump_height; /* Do the normal upward jump, no chargeup */
			}
		}
		#endregion /* Jump upward normally from rope spin if drop down from rope doesn't use jump END */
		
		else
		
		#region /* Drop down from rope */
		if (drop_from_rope == 0) /* Drop down from rope: Release Jump */
		&& (!key_jump_hold)
		|| (drop_from_rope == 1) /* Drop down from rope: Down or Jump */
		&& (key_down)
		|| (drop_from_rope == 1) /* Drop down from rope: Down or Jump */
		&& (key_jump)
		|| (drop_from_rope == 2) /* Drop down from rope: Only Down */
		&& (key_down)
		|| (drop_from_rope == 3) /* Drop down from rope: Only Jump */
		&& (key_jump)
		|| (drop_from_rope == 4) /* Drop down from rope: Down + Jump */
		&& (key_down)
		&& (key_jump)
		{
			if (!key_up)
			{
				if (place_meeting(x - 1, y, obj_wall))
				{
					x ++;
				}
				else
				if (place_meeting(x + 1, y, obj_wall))
				{
					x --;
				}
				can_climb_horizontal_rope_cooldown = 3; /* Cooldown timer before you can start climbing again. You should grab a rope below you but not grabbing the same rope you were just on */
				can_ground_pound = false;
				climb = false;
				horizontal_rope_climb = false;
				buffer_jump = 0;
				stomp_spin = false;
				midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
			}
		}
		#endregion /* Drop down from rope END */
		
		else
		
		#region /* Climb left on horizontal rope */
		if (key_left_hold)
		&& (!key_right_hold)
		&& (taken_damage <= taken_damage_freezetime)
		&& (!place_meeting(x - 1, y, obj_wall))
		&& (!place_meeting(x - 20, y, obj_spikes))
		{
			image_xscale = -1;
			if (place_meeting(x - 32, y, obj_horizontal_rope))
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				if (key_run)
				|| (double_tap_left == 3)
				{
					hspeed -= 0.5;
					speed_max = speed_max_run;
					image_speed = speed / 10 + 0.1;
				}
				else
				{
					hspeed -= 0.5;
					speed_max = speed_max_walk;
					image_speed = speed / 10 + 0.1;
				}
				if (!audio_is_playing(snd_move_ivy))
				{
					scr_audio_play(snd_move_ivy, volume_source.sound);
				}
			}
			else
			{
				hspeed = 0;
			}
		}
		#endregion /* Climb left on horizontal rope END */
		
		else
		
		#region /* Climb right on horizontal rope */
		if (key_right_hold)
		&& (!key_left_hold)
		&& (taken_damage <= taken_damage_freezetime)
		&& (!place_meeting(x + 1, y, obj_wall))
		&& (!place_meeting(x + 20, y, obj_spikes))
		{
			image_xscale = +1;
			if (place_meeting(x + 32, y, obj_horizontal_rope))
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
				if (key_run)
				|| (double_tap_right == 3)
				{
					hspeed += 0.5;
					speed_max = speed_max_run;
					image_speed = speed / 10 + 0.1;
				}
				else
				{
					hspeed += 0.5;
					speed_max = speed_max_walk;
					image_speed = speed / 10 + 0.1;
				}
				if (!audio_is_playing(snd_move_ivy))
				{
					scr_audio_play(snd_move_ivy, volume_source.sound);
				}
			}
			else
			{
				hspeed = 0;
			}
		}
		#endregion /* Climb right on horizontal rope END */
		
		else
		
		#region /* Look up when on horizontal rope */
		if (key_up)
		{
			if (speed > 0)
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			{
				if (sprite_climb_under_look_up > noone){sprite_index = sprite_climb_under_look_up;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			image_speed = 0.5;
		}
		#endregion /* Look up when on horizontal rope END */
		
		else
		{
			if (speed > 0)
			{
				if (sprite_climb_under > noone){sprite_index = sprite_climb_under;}else
				if (sprite_climb_under_still > noone){sprite_index = sprite_climb_under_still;}else
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
			else
			if (sprite_climb_under_still > noone)
			{
				sprite_index = sprite_climb_under_still;
			}
			else
			{
				if (sprite_stand > noone) && (typeof(sprite_stand) != "undefined"){sprite_index = sprite_stand;}else
				if (sprite_walk > noone){sprite_index = sprite_walk;}
			}
		}
		
		#region /* Bump into wall on left side when climbing horizontal rope */
		if (key_left_hold)
		&& (!key_right_hold && taken_damage <= taken_damage_freezetime)
		&& (place_meeting(x - 1, y, obj_wall) || place_meeting(x - 20, y, obj_spikes) || !place_meeting(x - 1, y, obj_horizontal_rope))
		{
			if (hspeed < 0)
			{
				hspeed = 0;
			}
			image_xscale = -1;
			if (!audio_is_playing(snd_bump))
			{
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		#endregion /* Bump into wall on left side when climbing horizontal rope END */
		
		else
		
		#region /* Bump into wall on right side when climbing horizontal rope */
		if (key_right_hold)
		&& (!key_left_hold && taken_damage <= taken_damage_freezetime)
		&& (place_meeting(x + 1, y, obj_wall) || place_meeting(x + 20, y, obj_spikes) || !place_meeting(x + 1, y, obj_horizontal_rope))
		{
			if (hspeed > 0)
			{
				hspeed = 0;
			}
			image_xscale = +1;
			if (!audio_is_playing(snd_bump))
			{
				scr_audio_play(snd_bump, volume_source.sound);
			}
		}
		#endregion /* Bump into wall on right side when climbing horizontal rope END */
		
	}
	#endregion /* Climb Horizontal Rope END */
	
}