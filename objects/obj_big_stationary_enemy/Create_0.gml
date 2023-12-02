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
spawn_blaster_reward_decrease_mask = false;
can_die_from_spikes = true;
can_turn_around_at_wall = false;
number_of_times_stomped = 0;
give_rewards = true;
enemyvoice_defeated1 = snd_enemyvoice_big_defeated;
enemyvoice_defeated2 = snd_enemyvoice_big_defeated2;
enemyvoice_defeated3 = snd_enemyvoice_big_defeated3;

sprite_used = "stand";
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
on_ground = false;
blind = false;

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */