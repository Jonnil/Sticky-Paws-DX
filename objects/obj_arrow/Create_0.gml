/*obj_arrow Create Event*/
if asset_get_type("snd_arrow") == asset_sound
{
	audio_play_sound(snd_arrow, 0, 0);
	audio_sound_gain(snd_arrow, global.sound_volume * global.main_volume, 0);
}
image_speed = 0.3;
if asset_get_type("obj_player") == asset_object and instance_number(obj_player) > 0
{
	if instance_nearest(x, y, obj_player).x < x
	{
		image_xscale = -1;
	}
	else
	if instance_nearest(x, y, obj_player).x > x
	{
		image_xscale = +1;
	}
}
else
if asset_get_type("obj_player_die") == asset_object and instance_number(obj_player_die) > 0
{
	if instance_nearest(x, y, obj_player_die).x < x
	{
		image_xscale = -1;
	}
	else
	if instance_nearest(x, y, obj_player_die).x > x
	{
		image_xscale = +1;
	}
}
else
{
	instance_destroy();
}
draw_xscale = 0;
draw_yscale = 1;
flat = false;
stomped_delay = 0;
die = false;
die_volting = false;
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
if asset_get_type("snd_enemyvoice_defeated") == asset_sound
{
	enemyvoice_defeated1 = noone;
}
else
{
	enemyvoice_defeated1 = noone;
}
if asset_get_type("snd_enemyvoice_defeated2") == asset_sound
{
	enemyvoice_defeated2 = noone;
}
else
{
	enemyvoice_defeated2 = noone;
}
if asset_get_type("snd_enemyvoice_defeated3") == asset_sound
{
	enemyvoice_defeated3 = noone;
}
else
{
	enemyvoice_defeated3 = noone;
}