depth = +9;

if (asset_get_type("snd_enemyvoice_defeated") == asset_sound)
{
	enemyvoice_defeated1 =snd_enemyvoice_defeated;
}
else
{
	enemyvoice_defeated1 = noone;
}
if (asset_get_type("snd_enemyvoice_defeated2") == asset_sound)
{
	enemyvoice_defeated2 =snd_enemyvoice_defeated2;
}
else
{
	enemyvoice_defeated2 = noone;
}
if (asset_get_type("snd_enemyvoice_defeated3") == asset_sound)
{
	enemyvoice_defeated3 =snd_enemyvoice_defeated3;
}
else
{
	enemyvoice_defeated3 = noone;
}

if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}

draw_xscale = 1;
draw_yscale = 1;
die = false;