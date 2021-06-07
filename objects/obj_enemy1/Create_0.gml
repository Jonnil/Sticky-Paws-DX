depth =+ 9;

image_speed=0.3;
image_xscale=-1;
draw_xscale=1;
draw_yscale=1;
flat=false;
die=false;
die_volting=false;
if (asset_get_type("snd_enemyvoice_defeated")==asset_sound)
{
	enemyvoice_defeated1=snd_enemyvoice_defeated;
}
else
{
	enemyvoice_defeated1=noone;
}
if (asset_get_type("snd_enemyvoice_defeated2")==asset_sound)
{
	enemyvoice_defeated2=snd_enemyvoice_defeated2;
}
else
{
	enemyvoice_defeated2=noone;
}
if (asset_get_type("snd_enemyvoice_defeated3")==asset_sound)
{
	enemyvoice_defeated3=snd_enemyvoice_defeated3;
}
else
{
	enemyvoice_defeated3=noone;
}

#region /*Mask*/
if (asset_get_type("spr_wall")==asset_sprite)
{
	mask_index=spr_wall;
}
#endregion /*Mask END*/

sprite_used = "stand";