scr_enemy_initialize_variables();

depth = +10;
gravity_direction = 270; /* Direction of the gravity */
image_xscale = -1;

angle = 0;
arrow_xscale = 0;
blind = true;
can_die_from_spikes = false;
can_jump_on_head = false;
can_turn_around_at_wall = false;
draw_xscale = 0;
draw_yscale = 0;
flying_back = false;
has_seen_player = false; /* If boss hasn't seen player, then don't activate the fight yet. */
hp = 3;
red_blink_timer = 0;
taken_damage = 0;
time = 0;