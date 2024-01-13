/* Collision Event with player object */
if (!die)
{
	if (other.vspeed >= 0)
	{
		other.spring = false;
		other.spring_animation = 0;
	}
	if (stomped_delay <= 0)
	{
		if (other.invincible_timer > 0)
		|| (other.taken_damage > 0)
		|| (other.dive)
		|| (other.can_attack_after_dive_on_ground > 0)
		{
			if (other.key_jump_hold)
			&& (!other.horizontal_rope_climb)
			{
				other.dive = false;
				other.vspeed = -other.triple_jump_height;
			}
			if (!die_volting)
			{
				if (coil_spring)
				{
					coil_spring = false;
					stomped_delay = 20;
					global.enemy_counter ++;
					if (vspeed < 0)
					{
						vspeed = +1;
					}
				}
				else
				{
					flat = true;
					stomped_delay = 10;
					die = true;
					/* If the enemy is a bullet being blasted out of a blaster, the enemy have to spawn a special object that targets the original blaster, so the blaster can count how many of its bullets have been defeated by the player */
					if (spawn_blaster_reward_decrease_mask)
					{
						instance_create_depth(xstart, ystart, 0, obj_blaster_reward_decrease_mask);
					}
					global.enemy_counter ++;
					with(instance_nearest(x, y, obj_player))
					{
						chain_reaction ++;
						midair_jumps_left = number_of_jumps - 1;
						can_dive = true;
					}
					vspeed = -8;
					if (other.x < x)
					{
						die_volting = -1;
					}
					else
					{
						die_volting = +1;
					}
				}
				effect_create_above(ef_smoke, x, y, 2, c_white);
				scr_gamepad_vibration(other.player, 0.5, 10);
				scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
				scr_get_rewards_when_jumped_on();
			}
		}
	}
	if (!die_volting)
	&& (stomped_delay <= 0)
	{
		if (other.vspeed > 0)
		|| (other.climb == false)
		&& (other.vspeed < 0)
		|| (other.bbox_bottom < y)
		{
			if (other.ground_pound != true)
			&& (flat == false)
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
				if (coil_spring)
				{
					coil_spring = false;
					stomped_delay = 20;
					global.enemy_counter ++;
					if (vspeed < 0)
					{
						vspeed = +1;
					}
				}
				else
				{
					flat = true;
					stomped_delay = 10;
					die = true;
					/* If the enemy is a bullet being blasted out of a blaster, the enemy have to spawn a special object that targets the original blaster, so the blaster can count how many of its bullets have been defeated by the player */
					if (spawn_blaster_reward_decrease_mask)
					{
						instance_create_depth(xstart, ystart, 0, obj_blaster_reward_decrease_mask);
					}
					global.enemy_counter ++;
					with(instance_nearest(x, y, obj_player))
					{
						chain_reaction ++;
						midair_jumps_left = number_of_jumps - 1;
						can_dive = true;
					}
				}
				effect_create_below(ef_ring, x, y, 0, c_white);
				scr_gamepad_vibration(other.player, 0.5, 10);
				scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
				scr_get_rewards_when_jumped_on();
				speed = 0;
				if (!other.horizontal_rope_climb)
				{
					if (other.in_water)
					{
						other.vspeed = -4;
					}
					else
					{
						other.vspeed = other.key_jump_hold ? -other.triple_jump_height : -8;
					}
				}
				image_index = 0;
			}
			else
			if (other.ground_pound) /* Ground pound the enemy and kill it instantly */
			&& (flat == false)
			{
				die = true;
				/* If the enemy is a bullet being blasted out of a blaster, the enemy have to spawn a special object that targets the original blaster, so the blaster can count how many of its bullets have been defeated by the player */
				if (spawn_blaster_reward_decrease_mask)
				{
					instance_create_depth(xstart, ystart, 0, obj_blaster_reward_decrease_mask);
				}
				global.enemy_counter ++;
				with(instance_nearest(x, y, obj_player))
				{
					chain_reaction ++;
					midair_jumps_left = number_of_jumps - 1;
					can_dive = true;
				}
				coil_spring = false;
				flat = true;
				stomped_delay = 10;
				effect_create_below(ef_ring, x, y, 0, c_white);
				scr_gamepad_vibration(other.player, 0.5, 10);
				scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
				scr_get_rewards_when_jumped_on();
				speed = 0;
				image_index = 0;
				vspeed = -8;
				if (other.x < x)
				{
					die_volting = -1;
				}
				else
				{
					die_volting = +1;
				}
			}
		}
		else
		if (other.taken_damage <= 0)
		&& (other.invincible_timer == 0)
		{
			if (other.have_heart_balloon)
			{
				other.have_heart_balloon = false;
				
				#region /* Save heart balloon to be false */
				ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
				ini_write_real("Player", "player" + string(other.player) + "_have_heart_balloon", false);
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
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