#region /* Make player spring */
if (can_bounce == 0)
{
	audio_sound_pitch(snd_spring, 1);
	scr_audio_play(snd_spring, volume_source.sound);
	if (!other.horizontal_rope_climb)
	{
		image_index = 1;
		image_speed = 1;
		with(other)
		{
			var nearest_spring = instance_nearest(x, y, obj_spring);
			can_climb_horizontal_rope_cooldown = 3;
			can_dive = true; /* Can dive when you jump out of a spring still */
			can_ground_pound = false;
			chain_reaction = 0;
			climb = false;
			dive = false;
			draw_xscale = 0.5;
			draw_yscale = 1.5;
			homing_attack_x = 0;
			homing_attack_y = 0;
			horizontal_rope_climb = false;
			nearest_spring.can_bounce = 10;
			nearest_spring.image_index = 1;
			nearest_spring.image_speed = 1;
			jump_transition_to_fall_animation = 0;
			ledge_grab_jump = false;
			midair_jumps_left = number_of_jumps;
			move_towards_point(nearest_spring.second_x, nearest_spring.second_y, nearest_spring.bounce_height);
			move_towards_spring_endpoint = true;
			scr_audio_play(voice_jump_spring, volume_source.voice);
			scr_gamepad_vibration(player, 0.4, 10);
			speed_max = 4;
			spring = true;
			spring_animation = 0;
			spring_endpoint_x = nearest_spring.second_x;
			spring_endpoint_y = nearest_spring.second_y;
			spring_twist_sprite = true;
			stick_to_wall = false;
			
			if (ground_pound >= true)
			{
				effect_create_above(ef_smoke, x, bbox_bottom, 2, c_white);
				image_index = 0;
				ground_pound = false;
				speed_max = 4;
				with(instance_nearest(x, y, obj_camera))
				{
					shake = 10;
				}
				scr_audio_play(snd_hipattack, volume_source.sound);
			}
			if (hspeed < 0)
			{
				image_xscale = -1;
			}
			else
			if (hspeed > 0)
			{
				image_xscale = +1;
			}
		}
	}
}
#endregion /* Make player spring END */