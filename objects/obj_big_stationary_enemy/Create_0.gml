image_speed = 0.3;
image_xscale = -1;
draw_xscale = 1;
draw_yscale = 1;
flat = false;
stomped_delay = 0;
die = false;
die_volting = false;
mask = spr_big_stationary_enemy;
coil_spring = false;
can_die_from_spikes = true;
number_of_times_stomped = 0;
give_rewards = true;
if (asset_get_type("snd_enemyvoice_big_defeated") == asset_sound)
{
	enemyvoice_defeated1 = snd_enemyvoice_big_defeated;
}
else
{
	enemyvoice_defeated1 = noone;
}
if (asset_get_type("snd_enemyvoice_big_defeated2") == asset_sound)
{
	enemyvoice_defeated2 = snd_enemyvoice_big_defeated2;
}
else
{
	enemyvoice_defeated2 = noone;
}
if (asset_get_type("snd_enemyvoice_big_defeated3") == asset_sound)
{
	enemyvoice_defeated3 = snd_enemyvoice_big_defeated3;
}
else
{
	enemyvoice_defeated3 = noone;
}

sprite_used = "stand";
stuck_in_wall_counter = 0;
sliding_along_ground = 0;