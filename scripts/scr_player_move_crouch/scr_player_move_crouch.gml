function scr_player_move_crouch()
{

	#region /* Crouch */
	if (key_crouch_hold && allow_crouch && !crouch && can_move && !ground_pound && !dive && on_ground)
	{
		crouch = true;
		draw_xscale = 1.5;
		draw_yscale = 0.5;

		scr_audio_play(snd_squat, volume_source.sound);

		#region /* Get the nearest surface object before changing mask */
		var nearest_surface_object = self;

		if (global.assist_enable)
		&& (global.assist_floor_over_bottomless_pit && bbox_bottom >= room_height)
		&& (sprite_exists(mask_index))
		{
			y = room_height - sprite_get_height(mask_index) * 0.5 + 15;
		}
		else
		{

			#region /* Find the nearest surface object */
			if (instance_exists(obj_wall) || instance_exists(obj_semisolid_platform))
			{
				var wall_obj = instance_exists(obj_wall) ? instance_nearest(x, bbox_bottom, obj_wall) : noone;
				var semisolid_obj = instance_exists(obj_semisolid_platform) ? instance_nearest(x, bbox_bottom, obj_semisolid_platform) : noone;

				if (wall_obj != noone && semisolid_obj != noone)
				{
					nearest_surface_object = (distance_to_object(wall_obj) < distance_to_object(semisolid_obj)) ? wall_obj : semisolid_obj;
				}
				else
				{
					nearest_surface_object = wall_obj != noone ? wall_obj : semisolid_obj;
				}
			}
			#endregion /* Find the nearest surface object END */

		}
		#endregion /* Get the nearest surface object before changing mask END */

		/* After getting the nearest surface object, change to the crouch mask */
		if (sprite_mask_crouch >= 0 && sprite_exists(sprite_mask_crouch))
		{
			mask_index = sprite_mask_crouch;
		}

		/* Teleport the player to the nearest ground surface at the end of the "start crouching" code */
		if (mask_index != undefined && mask_index != noone && nearest_surface_object != self)
		{
			y = nearest_surface_object.y - sprite_get_height(mask_index) * 0.5 - 15;
		}
	}
	#endregion /* Crouch END */

	#region /* Don't crouch */
	if (!key_crouch_hold && crouch)
	{
		if (sprite_mask >= 0 && sprite_exists(sprite_mask))
		{
			var mask_to_use = sprite_mask;
		}
		else
		{
			var mask_to_use = spr_player_stand;
		}

		if (!collision_rectangle(bbox_left, bbox_bottom - sprite_get_height(mask_to_use) - 1, bbox_right, bbox_bottom, obj_wall, false, true))
		{
			/* Player should be able to stop crouching at any point in mid-air, even when traveling upwards */
			draw_xscale = 0.75;
			draw_yscale = 1.25;
			scr_audio_play(snd_rise, volume_source.sound);

			if (on_ground)
			{
				y -= (sprite_get_height(sprite_mask) * 0.5) - 1;
			}

			mask_index = mask_to_use; /* Change to the normal mask at the end of the "end crouching" code */
			crouch = false;
		}
	}
	#endregion /* Don't crouch END */

	#region /* Crouching Animation */
	if (crouch)
	{
		stick_to_wall = false;

		if (on_ground)
		{
			if (abs(hspeed) > 3)
			{
				if (!audio_is_playing(snd_skidding))
				{
					scr_audio_play(snd_skidding, volume_source.sound);
					scr_gamepad_vibration(player, 0.1, 10);
				}
				effect_create_depth(depth - 1, ef_smoke, x, bbox_bottom, 0, c_white);
			}
			else
			{
				if (audio_is_playing(snd_skidding))
				{
					audio_stop_sound(snd_skidding);
				}
			}

			if (abs(hspeed) >= 2.5)
			{
				scr_select_first_valid_sprite(sprite_crouch_crawl, sprite_crouch, sprite_idle, sprite_walk);

				image_speed = (image_index > image_number - 1) ? 0 : (in_water ? 0.3 : 0.5);
			}
			else
			{
				#region /* Crouch Still / Crouch Stand */
				if (speed == 0 && !key_left_hold && !key_right_hold)
				{
					scr_select_first_valid_sprite(sprite_crouch, sprite_idle, sprite_walk);

					image_speed = (image_index > image_number - 1) ? 0 : (in_water ? 0.3 : 0.5);
				}
				#endregion

				#region /* Crouch Crawl */
				else
				if (key_left_hold || key_right_hold)
				{
					scr_select_first_valid_sprite(sprite_crouch_crawl, sprite_crouch, sprite_idle, sprite_walk);

					image_speed = 0.5;
				}
				#endregion /* Crouch Crawl END */

			}
		}
		else
		{

			#region /* Jumping / Falling */
			if (vspeed < 0)
			{
				jump_transition_to_fall_animation = 0;
				if (in_water)
				{
					scr_select_first_valid_sprite(sprite_swim, sprite_crouch_jump, sprite_crouch_fall, sprite_jump, sprite_fall_slower, sprite_fall);
				}
				else
				{
					scr_select_first_valid_sprite(sprite_crouch_jump, sprite_crouch_fall, sprite_jump, sprite_fall_slower, sprite_fall);
				}

				image_speed = (image_index > image_number - 1) ? 0 : 0.5;
			}
			else
			if (!stick_to_wall && vspeed > 0)
			{

				if (sprite_crouch_jump_transition_to_fall > 0)
				{
					if (jump_transition_to_fall_animation == 0)
					{
						image_index = 0;
						jump_transition_to_fall_animation = 1;
					}

					if (jump_transition_to_fall_animation == 1)
					{
						image_speed = 0.5;
						scr_select_first_valid_sprite(sprite_crouch_jump_transition_to_fall);

						if (image_index > image_number - 1)
						{
							image_index = 0;
							jump_transition_to_fall_animation = 2;
						}
					}
				}
				else
				{
					jump_transition_to_fall_animation = 2;
				}

				if (jump_transition_to_fall_animation == 2)
				{
					scr_select_first_valid_sprite(sprite_crouch_fall, sprite_crouch_jump_transition_to_fall, sprite_jump, sprite_fall_slower, sprite_fall);

					/* Underwater specific sprites, only if in_water == true */
					if (in_water)
					{
						scr_select_first_valid_sprite(sprite_swim_fall, sprite_swim, sprite_swim_stand);
					}

					image_speed = (image_index > image_number - 1) ? 0 : (in_water ? 0.3 : 0.5);
				}
			}
			else
			{
				if (in_water)
				{
					if (key_jump)
					{
						image_index = 0;
					}

					image_speed = (image_index > image_number - 1) ? 0 : 0.3;

					scr_select_first_valid_sprite(sprite_swim_fall, sprite_swim, sprite_swim_stand, sprite_idle, sprite_walk);
				}
			}
			#endregion /* Jumping / Falling END */

		}
	}
	#endregion /* Combined Crouching Animation */

}
