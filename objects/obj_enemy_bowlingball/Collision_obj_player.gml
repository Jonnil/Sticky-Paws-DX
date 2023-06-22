/* Collision Event with player object */
if (die == false)
&& (stomped_delay == 0)
{
	if (other.vspeed >= 0)
	{
		other.spring = false;
		other.spring_animation = 0;
	}
	if (other.invincible_timer > 0)
	{
		if (other.key_jump_hold)
		{
			other.dive = false;
			with(other)
			{
				dive = false;
				if (simple_controls == false)
				{
					vspeed = -triple_jump_height;
				}
			}
		}
		if (die_volting == false)
		{
			with(instance_nearest(x, y, obj_player))
			{
				dive = false;
				chain_reaction ++;
				midair_jumps_left = number_of_jumps - 1;
				can_dive = true;
			}
			if (other.x < x)
			{
				vspeed = - 8;
				die = true;
				die_volting = -1;
			}
			else
			{
				vspeed = - 8;
				die = true;
				die_volting = +1;
			}
			effect_create_above(ef_smoke, x, y, 2, c_white);
			scr_gamepad_vibration(other.player, 0.5, 10);
			
			scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);

			scr_get_rewards_when_jumped_on();
			
		}
	}
	if (die_volting == false)
	{
		if (other.vspeed > 0)
		|| (other.climb == false)
		&& (other.vspeed < 0)
		|| (other.bbox_bottom < y)
		{
			if (other.ground_pound != true)
			{
				if (abs(other.hspeed) > 7)
				{
					other.jump ++;
					if (other.jump > 2)
					{
						if (other.image_xscale > 0)
						{
							other.angle = +720;
						}
						else
						{
							other.angle = -720;
						}
					}
				}
				with(instance_nearest(x, y, obj_player))
				{
					dive = false;
					chain_reaction ++;
					midair_jumps_left = number_of_jumps - 1;
					can_dive = true;
				}
				effect_create_below(ef_ring, x, y, 0, c_white);
				scr_gamepad_vibration(other.player, 0.5, 10);
				
				scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
				
				scr_get_rewards_when_jumped_on();
				
				speed = 0;
				if (other.key_jump_hold)
				{
					with(other)
					{
						if (in_water)
						{
							vspeed = -4;
						}
						else
						if (simple_controls == false)
						{
							vspeed = -triple_jump_height;
						}
						else
						{
							vspeed = - 8;
						}
					}
					if (stomped_delay == 0)
					{
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (instance_nearest(x, y, obj_player).hspeed >= + 8)
						&& (instance_nearest(x, y, obj_player).x < x)
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = +1;
							sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
							stomped_delay = 5;
						}
						else
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (instance_nearest(x, y, obj_player).hspeed <= -8)
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = -1;
							sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
							stomped_delay = 5;
						}
						else
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (instance_nearest(x, y, obj_player).x < x)
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = +1;
							sliding_along_ground_speed = 8;
							stomped_delay = 5;
						}
						else
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = -1;
							sliding_along_ground_speed = 8;
							stomped_delay = 5;
						}
						else
						if (sliding_along_ground < 0)
						|| (sliding_along_ground > 0)
						{
							sliding_along_ground = 0;
							stomped_delay = 5;
						}
					}
				}
				else
				{
					if (other.in_water)
					{
						other.vspeed = -4;
					}
					else
					{
						other.vspeed = - 8;
					}
					if (stomped_delay == 0)
					{
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (instance_nearest(x, y, obj_player).hspeed >= + 8)
						&& (instance_nearest(x, y, obj_player).x < x)
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = +1;
							sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
							stomped_delay = 5;
						}
						else
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (instance_nearest(x, y, obj_player).hspeed <= -8)
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = -1;
							sliding_along_ground_speed = instance_nearest(x, y, obj_player).speed + 1;
							stomped_delay = 5;
						}
						else
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (instance_nearest(x, y, obj_player).x < x)
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = +1;
							sliding_along_ground_speed = 8;
							stomped_delay = 5;
						}
						else
						if (instance_exists(obj_player))
						&& (place_meeting(x, y, obj_player))
						&& (sliding_along_ground == 0)
						&& (flat)
						{
							sliding_along_ground = -1;
							sliding_along_ground_speed = 8;
							stomped_delay = 5;
						}
						else
						if (sliding_along_ground < 0)
						|| (sliding_along_ground > 0)
						{
							sliding_along_ground = 0;
							stomped_delay = 5;
						}
					}
				}
				if (coil_spring)
				{
					coil_spring = false;
					stomped_delay = 5;
					global.enemy_counter ++;
					if (vspeed < 0)
					{
						vspeed = +1;
					}
				}
				else
				{
					flat = true;
					stomped_delay = 5;
					global.enemy_counter ++;
				}
				image_index = 0;
			}
			else
			if (other.ground_pound)
			{
				die = true;
				global.enemy_counter ++;
				with(instance_nearest(x, y, obj_player))
				{
					dive = false;
					chain_reaction ++;
					midair_jumps_left = number_of_jumps - 1;
					can_dive = true;
				}
				effect_create_below(ef_ring, x, y, 0, c_white);
				scr_gamepad_vibration(other.player, 0.5, 10);
				
				scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
				
				scr_get_rewards_when_jumped_on();
				
				speed = 0;
				image_index = 0;
				if (other.x < x)
				{
					vspeed = - 8;
					die_volting = -1;
				}
				else
				{
					vspeed = - 8;
					die_volting = +1;
				}
			}
		}
		
		else
		
		if (stomped_delay == 0)
		&& (die == false)
		&& (flat == false)
		|| (sliding_along_ground < 0)
		&& (stomped_delay == 0)
		&& (die == false)
		&& (flat)
		|| (sliding_along_ground > 0)
		&& (stomped_delay == 0)
		&& (die == false)
		&& (flat)
		{
			if (other.taken_damage <= 0)
			&& (other.assist_invincible == false)
			{
				if (other.have_heart_balloon)
				{
					other.have_heart_balloon = false;
		
					#region /* Save heart balloon to be false */
					if (other.player == 1)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player1_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					if (other.player = 2)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player2_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					if (other.player = 3)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player3_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					if (other.player = 4)
					{
						ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
						ini_write_real("Player", "player4_have_heart_balloon", false);
						ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
					}
					#endregion /* Save heart balloon to be false END */
					
				}
				else
				{
					other.hp --;
				}
				other.taken_damage = 100;
				scr_gamepad_vibration(other.player, 1, 10);
			}
		}
	}
}