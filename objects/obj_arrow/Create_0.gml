scr_audio_play(snd_arrow, volume_source.sound);
image_speed = 0.3;
mask_index = spr_wall;

draw_xscale = 0;
draw_yscale = 1;
flat = false;
stomped_delay = 0;
die = false;
die_volting = false;
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
can_die_from_spikes = true;
can_turn_around_at_wall = false;
coil_spring = false;
spawn_blaster_reward_decrease_mask = false;
number_of_times_stomped = 0;
give_rewards = true;
enemyvoice_defeated1 = noone;
enemyvoice_defeated2 = noone;
enemyvoice_defeated3 = noone;
on_ground = false;
blind = true;

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */

if (instance_exists(obj_player))
{
	move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 8);
	image_angle = point_direction(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y);
}