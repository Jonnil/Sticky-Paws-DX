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
flying_back = false;
taken_damage = 0;
draw_xscale = 0;
draw_yscale = 0;
red_blink_timer = 0;
has_seen_player = false; /* If boss hasn't seen player, then don't activate the fight yet. */
arrow_xscale = 0;
stuck_in_wall_counter = 0;
sliding_along_ground = 0;
can_die_from_spikes = false;
can_turn_around_at_wall = false;
give_rewards = true;
gravity_direction = 270; /* Direction of the gravity */
blind = false;

enemyvoice_defeated1 = snd_enemyvoice_defeated;
enemyvoice_defeated2 = snd_enemyvoice_defeated2;
enemyvoice_defeated3 = snd_enemyvoice_defeated3;

on_ground = false;

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */