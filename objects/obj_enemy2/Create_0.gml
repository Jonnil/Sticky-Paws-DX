image_speed = 0.3;
image_xscale = -1;
draw_xscale=1;
draw_yscale=1;
flat = false;
die = false;
die_volting = false;
mask = sprite_index;
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

sprite_index = global.resourcepack_sprite_big_stationary_enemy;
sprite_flat = global.resourcepack_sprite_big_stationary_enemy_flattened;