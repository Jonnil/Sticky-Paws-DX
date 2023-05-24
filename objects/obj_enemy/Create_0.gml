depth = +9;

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

if (asset_get_type("spr_small_mask") == asset_sprite)
{
	mask_index = spr_small_mask;
}

draw_xscale = 1;
draw_yscale = 1;
die = false;
die_volting = false;
stomped_delay = 0;
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
sliding_along_ground_speed = 8;
can_die_from_spikes = true;
give_rewards = true;