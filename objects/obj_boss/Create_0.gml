angle = 0;
depth = +10;
time = 0;
image_xscale = -1;
die_volting = false;
die = false;
can_jump_on_head = false;
hp = 3;
flat = false;
stomped_delay = 0;
flying_back= false;
takendamage = 0;
draw_xscale = 0;
draw_yscale = 0;
redblinktimer = 0;
has_seen_player = false; /*If boss hasn't seen player, then don't activate the fight yet.*/
arrow_xscale = 0;
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
can_die_from_spikes = false;

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