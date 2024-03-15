function scr_enemy_initialize_variables() {
	
	/* If enemies are disabled, destroy this object */
	if (global.assist_enable && !global.assist_enable_enemies) {
		instance_destroy();
	}
	
	blind = false; /* Not blind by default */
	can_die_from_spikes = true;
	can_turn_around_at_wall = true;
	coil_spring = false;
	die = false;
	die_volting = false;
	draw_xscale = 1;
	draw_yscale = 1;
	enemyvoice_defeated1 = snd_enemyvoice_defeated;
	enemyvoice_defeated2 = snd_enemyvoice_defeated2;
	enemyvoice_defeated3 = snd_enemyvoice_defeated3;
	flat = false;
	give_rewards = true;
	number_of_times_stomped = 0;
	on_ground = false;
	sliding_along_ground = 0;
	sliding_along_ground_speed = 8;
	spawn_blaster_reward_decrease_mask = false;
	sprite_used = "stand";
	stomped_delay = 0;
	stuck_in_wall_counter = 0;
	
	depth = +9;
	mask_index = spr_small_mask;
}