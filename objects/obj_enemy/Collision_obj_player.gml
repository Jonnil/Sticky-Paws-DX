/* Collision Event with player object */
if (!die)
&& (invincibility_when_spawned == 0)
{
	if (other.vspeed >= 0)
	{
		other.spring = false;
		other.spring_animation = 0;
	}
	if (stomped_delay <= 0)
	{
		if (other.invincible_timer > 0)
		|| (can_be_attacked_by_damage_invulnerability && other.taken_damage > 0)
		|| (can_be_attacked_by_dive && (other.dive || other.can_attack_after_dive_on_ground > 0))
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
					stomped_delay = 5;
					die = true;
					scr_different_items_inside(bbox_top);
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
		if (can_be_attacked_by_stomp)
		&& (!other.on_ground /* When player is in the air, it counts as you jumping at the enemy */
		&& !other.climb
		&& other.stick_to_wall == 0
		|| other.vspeed > 0
		|| !other.climb
		&& other.vspeed < 0
		|| other.bbox_bottom < y
		|| other.triplejumpdelay > 0) /* If you land on the ground too early, but you haven't been standing on the ground for too long, make it so it still counts as you jumping on the enemy */
		{
			if (other.ground_pound != true)
			&& (!flat)
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
					stomped_delay = 5;
					die = true;
					scr_different_items_inside(bbox_top);
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
			if (other.ground_pound >= 1) /* Ground pound the enemy and kill it instantly */
			&& (!flat)
			{
				die = true;
				scr_different_items_inside(bbox_top);
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
				stomped_delay = 5;
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
		with(other)
		{
			scr_player_move_take_damage();
		}
	}
}