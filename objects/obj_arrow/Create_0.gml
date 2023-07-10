scr_audio_play(snd_arrow, volume_source.sound);
image_speed = 0.3;
if instance_exists(obj_player)
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
if instance_exists(obj_player_lose)
{
	if instance_nearest(x, y, obj_player_lose).x < x
	{
		image_xscale = -1;
	}
	else
	if instance_nearest(x, y, obj_player_lose).x > x
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
can_die_from_spikes = true;
coil_spring = false;
number_of_times_stomped = 0;
give_rewards = true;
enemyvoice_defeated1 = noone;
enemyvoice_defeated2 = noone;
enemyvoice_defeated3 = noone;