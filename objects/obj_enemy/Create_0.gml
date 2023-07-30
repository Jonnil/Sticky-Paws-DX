depth = +9;

enemyvoice_defeated1 = snd_enemyvoice_defeated;
enemyvoice_defeated2 = snd_enemyvoice_defeated2;
enemyvoice_defeated3 = snd_enemyvoice_defeated3;
mask_index = spr_small_mask;

draw_xscale = 1;
draw_yscale = 1;
die = false;
die_volting = false;
stomped_delay = 0;
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
sliding_along_ground_speed = 8;
can_die_from_spikes = true;
can_turn_around_at_wall = true;
give_rewards = true;
on_ground = false;
coil_spring = false;

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */