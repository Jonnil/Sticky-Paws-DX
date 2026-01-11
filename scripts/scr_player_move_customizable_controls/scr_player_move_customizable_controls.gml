function scr_player_move_customizable_controls()
{
	/* Compact customizable controls */
	var state = function(act, hold) { return scr_key_initialize(false, hold, player, act); };

	up_is_also_jump             = global.player_up_is_also_jump[player];
	double_jump_uses_jump_key   = global.player_double_jump_uses_jump_key[player];
	down_is_also_crouch         = global.player_down_is_also_crouch[player];
	double_tap_to_run           = global.player_double_tap_to_run[player];
	double_tap_to_dive          = global.player_double_tap_to_dive[player];
	cancel_dive_by_jump_or_dive = global.player_cancel_dive_by_jump_or_dive[player];
	cancel_dive_by_opposite_direction = global.player_cancel_dive_by_opposite_direction[player];
	down_and_jump_to_groundpound = global.player_down_and_jump_to_groundpound[player];
	wall_jump_setting           = global.player_wall_jump_setting[player];
	drop_from_rope              = global.player_drop_from_rope[player];

	key_crouch_toggle = state(action.crouch_toggle, 1);
	if (key_crouch_toggle) global.player_crouch_toggle[player] = !global.player_crouch_toggle[player];

	key_tongue          = state(action.tongue, 0);
	key_tongue_pressed  = state(action.tongue, 1);
	key_tongue_released = state(action.tongue, 2);
	key_dive_pressed    = state(action.dive, 1);
	key_dive_hold       = state(action.dive, 0);

	var left_hold   = state(action.left, 0);
	var left_press  = state(action.left, 1);
	var right_hold  = state(action.right, 0);
	var right_press = state(action.right, 1);
	var down_hold   = state(action.down, 0);
	var up_hold     = state(action.up, 0);
	var up_press    = state(action.up, 1);
	var up_release  = state(action.up, 2);

	key_left_hold    = (left_hold && !right_hold)  || active_left;
	key_left_pressed = (left_press && !right_press);
	key_right_hold   = (right_hold && !left_hold)  || active_right;
	key_right_pressed= (right_press && !left_press);
	key_down         = (down_hold && !up_hold)     || active_down;
	key_up           = (up_hold && !down_hold)     || active_up;
	key_up_pressed   = up_press;

	var jump_press   = state(action.jump, 1);
	var jump_hold    = state(action.jump, 0);
	var jump_release = state(action.jump, 2);

	key_jump         = jump_press || (up_is_also_jump && key_up_pressed) || active_jump;
	key_jump_hold    = jump_hold  || (up_is_also_jump && key_up)         || active_jump;
	key_jump_released= jump_release || (up_is_also_jump && up_release);

	key_double_jump  = double_jump_uses_jump_key ? jump_press : state(action.double_jump, 1);

	var crouch_hold  = state(action.crouch, 0);
	var crouch_press = state(action.crouch, 1);

	key_crouch_hold    = crouch_hold || global.player_crouch_toggle[player] || (down_is_also_crouch && key_down);
	key_crouch_pressed = crouch_press || (down_is_also_crouch && state(action.down, 1));

	var run_hold = state(action.run, 0);
	key_run          = run_hold || global.player_run_toggle[player];
	key_run_pressed  = state(action.run, 1);
	key_run_released = state(action.run, 2);
}
