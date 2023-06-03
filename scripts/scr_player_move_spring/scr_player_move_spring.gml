function scr_player_move_spring()
{
	
	#region /* Spring */
	if (asset_get_type("obj_spring") == asset_object)
	&& (instance_exists(obj_spring))
	&& (place_meeting(x, y, obj_spring))
	&& (instance_nearest(x, y, obj_spring).can_bounce == 0)
	{
		scr_gamepad_vibration(player, 0.4, 10);
		scr_audio_play(voice_jump_spring, volume_source.voice);
		if (ground_pound >= true)
		{
			effect_create_above(ef_smoke, x, bbox_bottom, 2, c_white);
			image_index = 0;
			ground_pound = false;
			speed_max = 4;
			if (asset_get_type("obj_camera") == asset_object)
			{
				with(instance_nearest(x, y, obj_camera))
				{
					shake = 10;
				}
			}
			scr_audio_play(snd_hipattack, volume_source.sound);
		}
		spring_animation = 0;
		jump_transition_to_fall_animation = 0;
		spring_twist_sprite = true;
		move_towards_point(instance_nearest(x, y, obj_spring).second_x, instance_nearest(x, y, obj_spring).second_y, instance_nearest(x, y, obj_spring).bounce_height);
		if (hspeed < 0)
		{
			image_xscale = -1;
		}
		else
		if (hspeed > 0)
		{
			image_xscale = +1;
		}
		can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 10;
		midair_jumps_left = number_of_jumps;
		can_ground_pound = false;
		can_dive = true; /* Can dive when you jump out of a spring still */
		chain_reaction = 0;
		dive = false;
		draw_xscale = 0.5;
		draw_yscale = 1.5;
		horizontal_rope_climb = false;
		ledge_grab_jump = false;
		speed_max = 4;
		spring = true;
		move_towards_spring_endpoint = true;
		if (asset_get_type("obj_spring") == asset_object)
		&& (instance_exists(obj_spring))
		{
			spring_endpoint_x = instance_nearest(x, y, obj_spring).second_x;
			spring_endpoint_y = instance_nearest(x, y, obj_spring).second_y;
		}
		stick_to_wall = false;
		homing_attack_x = 0;
		homing_attack_y = 0;
		instance_nearest(x, y, obj_spring).can_bounce = 10;
		instance_nearest(x, y, obj_spring).image_index = 1;
		instance_nearest(x, y, obj_spring).image_speed = 1;
	}

	if (move_towards_spring_endpoint)
	{
		move_towards_point(spring_endpoint_x, spring_endpoint_y, 20);
	
		if (asset_get_type("obj_spring") == asset_object)
		&& (instance_exists(obj_spring))
		&& (point_distance(
		spring_endpoint_x,
		spring_endpoint_y,
		instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).x,
		instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).y) < 32)
		{
			move_towards_spring_endpoint = true;
		}
		else
		if (point_distance(x, y, spring_endpoint_x, spring_endpoint_y) < 340)
		{
			move_towards_spring_endpoint = false;
			spring_endpoint_x = 0;
			spring_endpoint_y = 0;
		}
		if (asset_get_type("obj_wall") == asset_object)
		&& (instance_exists(obj_wall))
		{
			if (place_meeting(x - 4, y, obj_wall))
			&& (hspeed < 0)
			|| (place_meeting(x + 4, y, obj_wall))
			&& (hspeed > 0)
			|| (place_meeting(x, y - 4, obj_wall))
			&& (vspeed < 0)
			|| (place_meeting(x, y + 4, obj_wall))
			&& (vspeed > 0)
			{
				move_towards_spring_endpoint = false;
				spring_endpoint_x = 0;
				spring_endpoint_y = 0;
			}
		}
	}

	if (spring)
	{
		if (spring_animation == 0)
		{
			if (image_index > image_number - 1)
			&& (vspeed >= 0)
			{
				if (sprite_spring_transition > noone)
				|| (sprite_jump_transition_to_fall > noone)
				{
					image_index = 0;
					spring_animation = 1;
				}
				else
				{
					image_index = 0;
					spring_animation = 3;
				}
			}
			if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
			if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
			if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
			if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
		}
		else
		if (spring_animation == 1)
		{
			image_index = 0;
			if (sprite_spring_transition > noone){sprite_index = sprite_spring_transition;}else
			if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}
			spring_animation = 2;
		}
		else
		if (spring_animation == 2)
		{
			if (image_index > image_number - 1)
			{
				spring_animation = 3;
			}
			if (sprite_spring_transition > noone){sprite_index = sprite_spring_transition;}else
			if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}
			else
			{
				spring_animation = 3;
			}
		}
		else
		if (spring_animation == 3)
		{
			if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
			if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
			if (key_jump_hold) && (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; if (image_index > image_number - 1){image_index = image_number - 1;}}else
			if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
			if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_exists(sprite_walk)){sprite_index = sprite_walk;}
			if (vspeed <= 0)
			{
				spring_animation = 0;
			}
		}
	
		#region /* Make the cahracter face wherever you're going */
		if (spring_twist_sprite)
		{
			angle = direction - 90;
			if (speed < 6)
			|| (direction >= 90 - 10)
			&& (direction <= 90 + 10)
			{
				spring_twist_sprite = false;
			}
		}
		#endregion /* Make the cahracter face wherever you're going END */
	
		star_image_index ++;
		if (star_image_index == 5)
		{
			effect_create_above(ef_star, x + random_range(-32, +32), y + random_range(-32, +32), 0, c_white);
			star_image_index = 0;
		}
		image_speed = 0.5;
	}
	#endregion /* Spring END */
	
}