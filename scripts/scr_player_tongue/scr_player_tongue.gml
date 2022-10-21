function scr_player_tongue()
{
	var rope_lenght_max = 320;
	
	#region /* Tongue */
	if (can_move == true)
	and (global.pause == false)
	{
		if (asset_get_type("obj_tongue") == asset_object)
		{
			if (!instance_exists(obj_tongue))
			{
				can_tongue = true;
			}
		}
		
		#region /* If you are allowed to use tongue, then you are able to use your tongue END */
		if (allow_tongue == true)
		and (can_tongue == true)
		and (climb == false)
		and (horizontal_rope_climb == false)
		and (asset_get_type("obj_tongue") == asset_object)
		{
			
			#region /* Activate Tongue */
			if (mouse_check_button_pressed(mb_left))
			{
				can_tongue = false;
				with(instance_create_depth(x, y, 0, obj_tongue))
				{
					motion_set(point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y), 16);
				}
			}
			
			else
			
			#region /* Use tongue with right stick */
			if (gamepad_axis_value(player - 1, gp_axisrh) != 0)
			or (gamepad_axis_value(player - 1, gp_axisrv) != 0)
			{
				can_tongue = false;
				with(instance_create_depth(x, y, 0, obj_tongue))
				{
					motion_set(point_direction(0, 0, gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axisrh), gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axisrv)), 16);
				}
			}
			#endregion /* Use tongue with right stick END */
			
			else
			
			#region /* Key tongue pressed while moving left stick */
			if (gamepad_axis_value(player - 1, gp_axislh) != 0)
			or (gamepad_axis_value(player - 1, gp_axislv) != 0)
			{
				if (key_tongue_pressed)
				{
					can_tongue = false;
					with(instance_create_depth(x, y, 0, obj_tongue))
					{
						motion_set(point_direction(0, 0, gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axislh), gamepad_axis_value(instance_nearest(x, y, obj_player).player - 1, gp_axislv)), 16);
					}
				}
				
			}
			#endregion /* Key tongue pressed while moving left stick END */
			
			else
			
			#region /* Press Tongue Button */
			if (key_tongue_pressed)
			{
				
				#region /* Key Up */
				if (key_up)
				{
					
					#region /* Key Left */
					if (key_left_hold)
					and (!place_meeting(x - 1, y, obj_wall))
					and (can_collide_with_wall == true)
					or (key_left_hold)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(135, 16);
						}
					}
					#endregion /* Key Left END */
					
					else
					
					#region /* Key Right */
					if (key_right_hold)
					and (!place_meeting(x + 1, y, obj_wall))
					and (can_collide_with_wall == true)
					or (key_right_hold)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(45, 16);
						}
					}
					#endregion /* Key Right END */
					
					else
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(90, 16);
						}
					}
				}
				#endregion /* Key Up END */
				
				else
				
				#region /* Key Left */
				if (key_left_hold)
				and (!place_meeting(x - 1, y, obj_wall))
				and (can_collide_with_wall == true)
				or (key_left_hold)
				{
					
					#region /* Key Up */
					if (key_up)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(135, 16);
						}
					}
					#endregion /* Key Up END */
					
					else
					
					#region /* Key Down */
					if (key_down)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(225, 16);
						}
					}
					#endregion /* Key Down END */
					
					else
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(180, 16);
						}
					}
				}
				#endregion /* Key Left END */
				
				else
				
				#region /* Key Right */
				if (key_right_hold)
				and (!place_meeting(x + 1, y, obj_wall))
				and (can_collide_with_wall == true)
				or (key_right_hold)
				{
					
					#region /* Key Up */
					if (key_up)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(85, 16);
						}
					}
					#endregion /* Key Up END */
					
					else
					
					#region /* Key Down */
					if (key_down)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(315, 16);
						}
					}
					#endregion /* Key Down END */
					
					else
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(0, 16);
						}
					}
				}
				#endregion /* Key Right END */
				
				else
				
				#region /* Key Down */
				if (key_down)
				and (!place_meeting(x, y + 1, obj_wall))
				and (can_collide_with_wall == true)
				or (key_down)
				{
					
					#region /* Key Left */
					if (key_left_hold)
					and (!place_meeting(x - 1, y, obj_wall))
					and (can_collide_with_wall == true)
					or (key_left_hold)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(225, 16);
						}
					}
					#endregion /* Key Left END */
					
					else
					
					#region /* Key Right */
					if (key_right_hold)
					and (!place_meeting(x + 1, y, obj_wall))
					and (can_collide_with_wall == true)
					or (key_right_hold)
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(315, 16);
						}
					}
					#endregion /* Key Right END */
					
					else
					{
						can_tongue = false;
						with(instance_create_depth(x, y, 0, obj_tongue))
						{
							motion_set(270, 16);
						}
					}
				}
				#endregion /* Key Down END */
				
				else
				if (image_xscale < 0)
				and (!place_meeting(x - 1, y, obj_wall))
				and (can_collide_with_wall == true)
				or (image_xscale < 0)
				{
					can_tongue = false;
					with(instance_create_depth(x, y, 0, obj_tongue))
					{
						motion_set(180, 16);
					}
				}
				else
				if (image_xscale > 0)
				and (!place_meeting(x + 1, y, obj_wall))
				and (can_collide_with_wall == true)
				or (image_xscale > 0)
				{
					can_tongue = false;
					with(instance_create_depth(x, y, 0, obj_tongue))
					{
						motion_set(0, 16);
					}
				}
			}
			#endregion /* Press Tongue Button END */
			
			#endregion /* Activate Tongue END */
			
		}
		#endregion /* If you are allowed to use tongue, then you are able to use your tongue */
		
		#region /* Rope Swing */
		if (rope_swing == true)
		{
			can_collide_with_wall = true;
			dive = false;
			can_ground_pound = false;
			ground_pound = false;
			gravity = 0; /* No gravity when rope swinging */
			if (asset_get_type("obj_tongue") == asset_object)
			and (instance_exists(obj_tongue))
			{
				grapple_x = instance_nearest(x, y, obj_tongue).x;
				grapple_y = instance_nearest(x, y, obj_tongue).y;
				rope_angle = point_direction(grapple_x, grapple_y, x, y);
				rope_length = point_distance(grapple_x, grapple_y, x, y);
				var rope_angle_acceleration = -0.4 * dcos(rope_angle);
				
				#region /* Control the tongue */
				
				#region /* Key Left */
				if (key_left_hold)
				and (obj_tongue.y > y)
				and (obj_tongue.x > x - 1)
				and (obj_tongue.x < x + 1)
				and (!place_meeting(x - 4, y, obj_wall))
				and (can_collide_with_wall == true)
				or (key_left_hold)
				and (obj_tongue.y > y)
				and (obj_tongue.x > x - 1)
				and (obj_tongue.x < x + 1)
				{
					rope_angle_acceleration += 0.08;
				}
				#endregion /* Key Left END */
				
				else
				
				#region /* Key Right */
				if (key_right_hold)
				and (obj_tongue.y > y)
				and (obj_tongue.x > x - 1)
				and (obj_tongue.x < x + 1)
				and (!place_meeting(x + 4, y, obj_wall))
				and (can_collide_with_wall == true)
				or (key_right_hold)
				and (obj_tongue.y > y)
				and (obj_tongue.x > x - 1)
				and (obj_tongue.x < x + 1)
				{
					rope_angle_acceleration -= 0.08;
				}
				#endregion /* Key Right END */
				
				else
				
				#region /* Key Left */
				if (key_left_hold)
				and (!place_meeting(x - 4, y, obj_wall))
				and (can_collide_with_wall == true)
				or (key_left_hold)
				{
					rope_angle_acceleration -= 0.08;
				}
				#endregion /* Key Left END */
			
				else
			
				#region /* Key Right */
				if (key_right_hold)
				and (!place_meeting(x + 4, y, obj_wall))
				and (can_collide_with_wall == true)
				or (key_right_hold)
				{
					rope_angle_acceleration += 0.08;
				}
				#endregion /* Key Right END */
				
				#region /* Make rope shorter */
				if (key_up)
				and (obj_tongue.y < y)
				or (key_down)
				and (obj_tongue.y > y)
				{
					if (rope_length > 5)
					and (!place_meeting(x, y - 4, obj_wall))
					and (can_collide_with_wall == true)
					or (rope_length > 5)
					{
						rope_length -= 2;
					}
				}
				#endregion /* Make rope shorter END */
				
				else
				
				#region /* Make rope longer */
				if (key_down)
				and (obj_tongue.y < y)
				or (key_up)
				and (obj_tongue.y > y)
				{
					if (rope_length < rope_lenght_max)
					and (!place_meeting(x, y + 4, obj_wall))
					and (can_collide_with_wall == true)
					or (rope_length < rope_lenght_max)
					{
						rope_length += 2;
					}
				}
				#endregion /* Make rope longer END */
				
				#endregion /* Control the tongue END */
				
				if (rope_length > rope_lenght_max) /* Don't let the rope longer than max length */
				{
					rope_length -= 1;
				}
				rope_length = max(rope_length, 0);
				rope_angle_velocity += rope_angle_acceleration;
				rope_angle += rope_angle_velocity;
				rope_angle_velocity *= 0.99;
				rope_x = grapple_x + lengthdir_x(rope_length, rope_angle);
				rope_y = grapple_y + lengthdir_y(rope_length, rope_angle);
				hspeed = rope_x - x;
				vspeed = rope_y - y;
				
				#region /* Collision for tongue swinging */
				
				#region /* Hitting wall to your left */
				if (place_meeting(x - 1, y, obj_wall))
				{
					if (hspeed <= 0)
					{
						hspeed = 0;
					}
					if (rope_angle_acceleration <= 0)
					{
						rope_angle_acceleration = 0;
					}
					if (rope_angle_velocity <= 0)
					{
						rope_angle_velocity = 0;
					}
				}
				#endregion /* Hitting wall to your left END */
				
				#region /* Hitting wall to your right */
				if (place_meeting(x + 1, y, obj_wall))
				{
					if (hspeed >= 0)
					{
						hspeed = 0;
					}
					if (rope_angle_acceleration >= 0)
					{
						rope_angle_acceleration = 0;
					}
					if (rope_angle_velocity >= 0)
					{
						rope_angle_velocity = 0;
					}
				}
				#endregion /* Hitting wall to your right END */
				
				#region /* Hitting ceiling */
				if (place_meeting(x, y - 1, obj_wall))
				and (vspeed <= 0)
				{
					hspeed = 0;
				}
				#endregion /* Hitting ceiling END */
				
				#region /* Hitting floor */
				if (place_meeting(x, y + 1, obj_wall))
				and (vspeed >= 0)
				{
					vspeed = 0;
				}
				#endregion /* Hitting floor END */
				
				#endregion /* Collision for tongue swinging END */
				
			}

			if (instance_number(instance_nearest(x, y, obj_tongue)) < 1)
			{
				with(instance_nearest(x, y, obj_tongue))
				{
					move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);
				}
				rope_swing = false;
			}
			else
			
			#region /* Key Jump */
			if (key_jump)
			{
			
				#region /* Retrieve tongue */
				with(instance_nearest(x, y, obj_tongue))
				{
					timer = 25;
					move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);
				}
				rope_angle_velocity = 0;
				grapple_x = x;
				grapple_y = y;
				rope_angle = point_direction(grapple_x, grapple_y, x, y);
				rope_length = point_distance(grapple_x, grapple_y, x, y);
				rope_swing = false;
				#endregion /* Retrieve tongue END */
			
				tongue_move_player_toward_wall = false; /* Make sure to disable player moving toward wall when you jump out of a tongue swing */
				tongue_move_player_toward_wall_timer = 0;
				vspeed = -normal_jump_height + vspeed; /* Make the player jump when going out of rope swing */
			}
			#endregion /* Key Jump END */
			
		}
		else
		{
			can_collide_with_wall = true;
		}
		#endregion /* Rope Swing END */
		
		#region /* Fly toward wall when clicking tongue button again */
		if (rope_swing == true)
		and (mouse_check_button_pressed(mb_left))
		or (rope_swing == true)
		and (key_tongue_pressed)
		{
			tongue_move_player_toward_wall = true;
		}
		
		if (instance_exists(obj_tongue))
		and (tongue_move_player_toward_wall == true)
		{
			if (tongue_move_player_toward_wall_timer > 3)
			and (can_collide_with_wall == true)
			{
				if (!place_meeting(x-1, y, obj_wall))
				or (!place_meeting(x+1, y, obj_wall))
				or (!place_meeting(x, y -1, obj_wall))
				or (!place_meeting(x, y+1, obj_wall))
				{
					move_towards_point(instance_nearest(x, y, obj_tongue).x, instance_nearest(x, y, obj_tongue).y, 16); /* This makes the player fly toward the tongue */
				}
			}
			else
			{
				move_towards_point(instance_nearest(x, y, obj_tongue).x, instance_nearest(x, y, obj_tongue).y, 16); /* This makes the player fly toward the tongue */
			}
			tongue_move_player_toward_wall_timer += 1;
			
			#region /* When touching tongue when flying towards it, or when the character has stopped moving and can't move closer to tongue, then retrieve the tongue */
			if (distance_to_object(instance_nearest(x, y, obj_tongue)) < 32)
			{
				
				#region /* Retrieve tongue */
				with(instance_nearest(x, y, obj_tongue))
				{
					timer = 25;
					move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 32);
				}
				rope_angle_velocity = 0;
				grapple_x = x;
				grapple_y = y;
				rope_angle = point_direction(grapple_x, grapple_y, x, y);
				rope_length = point_distance(grapple_x, grapple_y, x, y);
				rope_swing = false;
				#endregion /* Retrieve tongue END */
			
				tongue_move_player_toward_wall = false;
				tongue_move_player_toward_wall_timer = 0;
			}
			#endregion /* When touching tongue when flying towards it, or when the character has stopped moving and can't move closer to tongue, then retrieve the tongue END */
			
		}
		
		#endregion /* Fly toward wall when clicking tongue button again END */
		
	}
	else
	{
		rope_swing = false;
		if (instance_exists(obj_tongue))
		{
			with(obj_tongue)
			{
				instance_destroy();
			}
		}
	}
	#endregion /* Tongue END */
	
}