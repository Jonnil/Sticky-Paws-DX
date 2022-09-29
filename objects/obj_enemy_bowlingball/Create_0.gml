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
if (asset_get_type("snd_enemyvoice_defeated") == asset_sound)
{
	enemyvoice_defeated1 = snd_enemyvoice_defeated;
}
else
{
	enemyvoice_defeated1 = noone;
}
if (asset_get_type("snd_enemyvoice_defeated2") == asset_sound)
{
	enemyvoice_defeated2 = snd_enemyvoice_defeated2;
}
else
{
	enemyvoice_defeated2 = noone;
}
if (asset_get_type("snd_enemyvoice_defeated3") == asset_sound)
{
	enemyvoice_defeated3 = snd_enemyvoice_defeated3;
}
else
{
	enemyvoice_defeated3 = noone;
}

#region /* Mask */
if (asset_get_type("spr_small_mask") == asset_sprite)
{
	mask_index = spr_small_mask;
}
#endregion /* Mask END */

sprite_used = "stand";

if (blind = true)
{
	if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}else
	if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}
}
else
{
	if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}else
	if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}
}