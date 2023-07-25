function scr_player_move_ground_pound()
{
	
	#region /* Ground Pound */
	if (allow_ground_pound)
	&& (can_move)
	&& (global.pause == false)
	&& (can_ground_pound)
	&& (taken_damage <= taken_damage_freezetime)
	&& (dive == false)
	&& (burnt == false)
	&& (crouch == false)
	&& (climb == false)
	&& (ledge_grab == false)
	&& (horizontal_rope_climb == false)
	{
		if (key_crouch_pressed)
		&& (joystick_can_ground_pound)
		|| (down_and_jump_to_groundpound)
		&& (key_down)
		&& (key_jump)
		{
			if (!place_meeting(x, y + 8, obj_wall))
			&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
			&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
			&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
			{
				if (ground_pound != true)
				{
					ground_pound_cooldown = 1;
					spring_twist_sprite = false;
					can_climb_horizontal_rope_cooldown = sprite_get_height(mask_index) / 6;
					ground_pound = true;
					stick_to_wall = false;
					move_towards_spring_endpoint = false;
					wall_jump = 0;
					if (image_xscale > 0)
					{
						angle = +360;
					}
					else
					{
						angle = -360;
					}
					image_index = 0;
					scr_audio_play(snd_rolling, volume_source.sound);
					hspeed = 0;
					speed_max = 1;
					if (image_index > image_number - 1)
					{
						image_speed = 0;
						vspeed = +16;
					}
					else
					{
						image_speed = 0.5;
						vspeed = -4;
					}
				}
			}
		}
		if (ground_pound)
		{
			if (ground_pound_cooldown > 0)
			&& (!key_crouch_hold)
			{
				ground_pound_cooldown -= 0.5;
			}
			if (key_crouch_pressed)
			&& (ground_pound_cooldown == 0)
			{
				image_index = image_number - 1;
				image_speed = 0;
				vspeed = +16;
			}
			if (vspeed > 8)
			{
				vspeed = +24;
			}
			
			#region /* If touching the ground when doing a ground pound */
			if (on_ground)
			{
				with(instance_create_depth(x, bbox_bottom, 0, obj_block_break))
				{
					can_break_other_blocks = true;
					image_xscale = 0.75; /* Make the blockbreak hitbox smaller than a block so you don't accidentally break unintended blocks around you */
					image_yscale = 0.75; /* But not too small so you can't hit the blocks you intend to break */
				}
				scr_gamepad_vibration(player, 0.5, 10);
				effect_create_above(ef_smoke, x, bbox_bottom, 2, c_white);
				
				#region /* Continuesly break blocks underneath you, if they are breakable */
				if (key_crouch_hold)
				&& (place_meeting(x, y + 1, obj_question_block))
				&& (instance_nearest(x, y + 1, obj_question_block).item_inside == "none")
				&& (instance_nearest(x, y + 1, obj_question_block).block_type == "brick_block")
				|| (key_crouch_hold)
				&& (place_meeting(x, y + 1, obj_question_block))
				&& (instance_nearest(x, y + 1, obj_question_block).can_break_this_block)
				{
					ground_pound = 1;
					speed_max = 0;
				}
				else
				{
					image_index = 0;
					ground_pound = 2;
					speed_max = 4;
				}
				#endregion /* Continuesly break blocks underneath you, if they are breakable END */
				
				with(instance_nearest(x, y, obj_camera))
				{
					shake = 10;
				}
				scr_audio_play(snd_hipattack, volume_source.sound);
			}
			#endregion /* If touching the ground when doing a ground pound END */
	
			else
			if (key_up)
			&& (vspeed >4)
			|| (key_dive_pressed)
			&& (vspeed >4)
			|| (vspeed <-4)
			{
				image_index = 0;
				ground_pound = false;
				speed_max = 4;
				spring_animation = 2;
			}
		}
		else
		if (ground_pound == 2)
		{
			if (on_ground)
			{
				speed_max = 0;
				hspeed = 0;
				if (allow_ground_pound_jump)
				&& (key_jump_hold)
				{
					can_ground_pound = true;
					effect_create_above(ef_smoke, x, bbox_bottom, 1, c_white);
					ground_pound = 3;
					image_index = 0;
					midair_jumps_left = clamp(midair_jumps_left - 1, 0, number_of_jumps);
					speed_max = 4;
					vspeed = -higher_jump_height;
					if (image_xscale > 0)
					{
						angle = -360;
					}
					else
					{
						angle = +360;
					}
				}
			}
			if (image_index > image_number - 1)
			{
				speed_max = 4;
				ground_pound = false;
			}
		}
		else
		if (ground_pound == 3)
		{
			if (key_sprint)
			{
				speed_max = 8;
			}
			else
			{
				speed_max = 4;
			}
			if (image_index > image_number - 1)
			|| (vspeed > 0)
			{
				ground_pound = false;
			}
		}
	}
	if (can_ground_pound == false)
	&& (!key_down)
	{
		can_ground_pound = true;
	}

	#region /* joystick_can_ground_pound makes sure that when ground pounding using the joystick doesn't make the cahracter ground pound on every frame */

	#region /* You must have this code before the next code otherwise the joystick_can_ground_pound is always set to true */
	if (joystick_can_ground_pound == false)
	&& (gamepad_axis_value(global.player1_slot, gp_axislv) <= 0)
	&& (player <= 1)
	|| (joystick_can_ground_pound == false)
	&& (gamepad_axis_value(global.player2_slot, gp_axislv) <= 0)
	&& (player <= 2)
	|| (joystick_can_ground_pound == false)
	&& (gamepad_axis_value(global.player3_slot, gp_axislv) <= 0)
	&& (player <= 3)
	|| (joystick_can_ground_pound == false)
	&& (gamepad_axis_value(global.player4_slot, gp_axislv) <= 0)
	&& (player <= 4)
	{
		joystick_can_ground_pound = true;
	}
	#endregion /* You must have this code before the next code otherwise the joystick_can_ground_pound is always set to true END */

	#region /* You must have this code after the previous code otherwise the joystick_can_ground_pound is always set to true */
	if (joystick_can_ground_pound)
	&& (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
	&& (player <= 1)
	|| (joystick_can_ground_pound)
	&& (gamepad_axis_value(global.player2_slot, gp_axislv) > 0)
	&& (player <= 2)
	|| (joystick_can_ground_pound)
	&& (gamepad_axis_value(global.player3_slot, gp_axislv) > 0)
	&& (player <= 3)
	|| (joystick_can_ground_pound = true)
	&& (gamepad_axis_value(global.player4_slot, gp_axislv) > 0)
	&& (player <= 4)
	{
		joystick_can_ground_pound = false;
	}
	#endregion /* You must have this code after the previous code otherwise the joystick_can_ground_pound is always set to true END */

	#endregion /* joystick_can_ground_pound makes sure that when ground pounding using the joystick doesn't make the cahracter ground pound on every frame END */

	#endregion /* Ground Pound END */
	
}