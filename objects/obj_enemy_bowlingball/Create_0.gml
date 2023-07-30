depth = +9;

image_speed = 0.3;
image_xscale = -1;
draw_xscale = 1;
draw_yscale = 1;
draw_angle = 0;
flat = false;
stomped_delay = 0;
die = false;
die_volting = false;
sliding_along_ground = 0;
sliding_along_ground_speed = 8;
number_of_times_stomped = 0;
stuck_in_wall_counter = 0;
coil_spring = false;
blind = false;
can_die_from_spikes = true;
can_turn_around_at_wall = false;
give_rewards = true;
enemyvoice_defeated1 = snd_enemyvoice_defeated;
enemyvoice_defeated2 = snd_enemyvoice_defeated2;
enemyvoice_defeated3 = snd_enemyvoice_defeated3;
on_ground = false;
blind = false;

mask_index = spr_small_mask;

sprite_used = "stand";

if (blind)
{
	if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}else
	if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}
}
else
{
	if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}else
	if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}
}

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */