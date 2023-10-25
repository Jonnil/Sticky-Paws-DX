function scr_player_move_swimming_in_water()
{
	
	#region /* Swimming In Water */
	if (position_meeting(x, y, obj_water))
	|| (y > obj_water_level.y)
	&& (obj_water_level.y < room_height)
	{
		dive = false;
		if (in_water == false)
		{
			in_water = true;
		}
		if (instance_exists(obj_water))
		&& (instance_nearest(x, y, obj_water).breathable_water)
		{
			in_breathable_water = true;
		}
		else
		if (instance_exists(obj_water_level))
		&& (y > obj_water_level.y)
		&& (obj_water_level.y < room_height)
		&& (instance_nearest(x, y, obj_water_level).breathable_water)
		{
			in_breathable_water = true;
		}
		else
		{
			in_breathable_water = false;
		}
		jump = 0;
		midair_jumps_left = number_of_jumps;
		speed_max = 4;
		allow_roll = false;
		can_ground_pound = false;
		ground_pound = false;
		can_wall_jump = false;
		stick_to_wall = false;
		can_dive = true; /* Can dive when you jump out of water still */
		wall_jump = false;
		spring = false;
		
		if (!on_ground)
		{
			if (key_up)
			&& (!key_down)
			|| (key_jump_hold)
			&& (!key_down)
			{
				if (vspeed > 1)
				{
					vspeed = 1;
				}
			}
			else
			if (key_down)
			&& (!key_up)
			{
				if (vspeed > 5)
				{
					vspeed = 5;
				}
			}
			else
			{
				if (vspeed > 2)
				{
					vspeed = 2;
				}
			}
		}
		
		#region /* Set the gravity underwater */
		gravity_direction = 270; /* Direction of the gravity */
		if (!on_ground)
		{
			gravity = 0.1; /* Set gravity */
		}
		else
		{
			gravity = 0;
			vspeed = 0;
		}
		#endregion /* Set the gravity underwater END */

		if (key_jump)
		{
			
			#region /* Swim up */
			{
				if (key_up)
				&& (!key_down)
				{
					vspeed = -6;
				}
				else
				if (key_down)
				&& (!key_up)
				&& (crouch == false)
				{
					vspeed = -2;
				}
				else
				{
					vspeed = -4;
				}
				scr_audio_play(snd_swim, volume_source.sound);
				with(instance_create_depth(x, y, 0, obj_bubble))
				{
					direction = random(360);
					speed = random(2);
				}
			}
			#endregion /* Swim up END */
			
		}
		if (floor(random(30 - 1)) == 0)
		{
			with(instance_create_depth(x, y, 0, obj_bubble))
			{
				direction = random(360);
				speed = random(2);
			}
		}
		if (on_ground)
		{
			if (hspeed <- 2)
			{
				hspeed = - 2;
			}
			if (hspeed >+ 2)
			{
				hspeed = +2;
			}
		}
		
		#region /* Slow down if not pressing anything */
		if (!key_left_hold)
		{
			if (hspeed < 0)
			{
				hspeed += 0.1;
			}
		}
		if (!key_right_hold)
		{
			if (hspeed > 0)
			{
				hspeed -= 0.1;
			}
		}
		#endregion /* Slow down if not pressing anything END */
		
	}
	else
	{
		in_water = false;
		allow_roll = false;
		can_ground_pound = true;
		can_wall_jump = true;
	}
	#endregion /* Swimming In Water END */
	
}