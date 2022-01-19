depth =+ 9;

if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index=spr_wall;
}

image_speed=0.3;
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	if (instance_nearest(x,y,obj_player).x<x)
	{
		image_xscale=-1;
	}
	else
	{
		image_xscale=+1;
	}
}
draw_xscale=0;
draw_yscale=1;
flat=false;
die=false;
die_volting=false;
give_rewards = true;
if (asset_get_type("snd_enemyvoice_defeated") == asset_sound)
{
	enemyvoice_defeated1=snd_enemyvoice_defeated;
}
else
{
	enemyvoice_defeated1=noone;
}
if (asset_get_type("snd_enemyvoice_defeated2") == asset_sound)
{
	enemyvoice_defeated2=snd_enemyvoice_defeated2;
}
else
{
	enemyvoice_defeated2=noone;
}
if (asset_get_type("snd_enemyvoice_defeated3") == asset_sound)
{
	enemyvoice_defeated3=snd_enemyvoice_defeated3;
}
else
{
	enemyvoice_defeated3=noone;
}