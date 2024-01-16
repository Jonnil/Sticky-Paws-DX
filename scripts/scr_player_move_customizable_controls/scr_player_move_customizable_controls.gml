function scr_player_move_customizable_controls()
{
	/* Customizable Controls */
	
	#region /* Set values from the Input Settings */
	if (player == 1)
	{
		up_is_also_jump = global.player_up_is_also_jump[1];
		down_is_also_crouch = global.player_down_is_also_crouch[1];
		double_tap_to_run = global.player_double_tap_to_run[1];
		double_tap_to_dive = global.player_double_tap_to_dive[1];
		cancel_dive_by_pressing_jump_or_dive_button = global.player_cancel_dive_by_pressing_jump_or_dive_button[1];
		cancel_dive_by_pressing_opposite_direction = global.player_cancel_dive_by_pressing_opposite_direction[1];
		down_and_jump_to_groundpound = global.player_down_and_jump_to_groundpound[1];
		wall_jump_setting = global.player_wall_jump_setting[1];
		drop_from_rope = global.player_drop_from_rope[1];
	}
	else
	if (player == 2)
	{
		up_is_also_jump = global.player_up_is_also_jump[2];
		down_is_also_crouch = global.player_down_is_also_crouch[2];
		double_tap_to_run = global.player_double_tap_to_run[2];
		double_tap_to_dive = global.player_double_tap_to_dive[2];
		cancel_dive_by_pressing_jump_or_dive_button = global.player_cancel_dive_by_pressing_jump_or_dive_button[2];
		cancel_dive_by_pressing_opposite_direction = global.player_cancel_dive_by_pressing_opposite_direction[2];
		down_and_jump_to_groundpound = global.player_down_and_jump_to_groundpound[2];
		wall_jump_setting = global.player_wall_jump_setting[2];
		drop_from_rope = global.player_drop_from_rope[2];
	}
	else
	if (player == 3)
	{
		up_is_also_jump = global.player_up_is_also_jump[3];
		down_is_also_crouch = global.player_down_is_also_crouch[3];
		double_tap_to_run = global.player_double_tap_to_run[3];
		double_tap_to_dive = global.player_double_tap_to_dive[3];
		cancel_dive_by_pressing_jump_or_dive_button = global.player_cancel_dive_by_pressing_jump_or_dive_button[3];
		cancel_dive_by_pressing_opposite_direction = global.player_cancel_dive_by_pressing_opposite_direction[3];
		down_and_jump_to_groundpound = global.player_down_and_jump_to_groundpound[3];
		wall_jump_setting = global.player_wall_jump_setting[3];
		drop_from_rope = global.player_drop_from_rope[3];
	}
	else
	if (player == 4)
	{
		up_is_also_jump = global.player_up_is_also_jump[4];
		down_is_also_crouch = global.player_down_is_also_crouch[4];
		double_tap_to_run = global.player_double_tap_to_run[4];
		double_tap_to_dive = global.player_double_tap_to_dive[4];
		cancel_dive_by_pressing_jump_or_dive_button = global.player_cancel_dive_by_pressing_jump_or_dive_button[4];
		cancel_dive_by_pressing_opposite_direction = global.player_cancel_dive_by_pressing_opposite_direction[4];
		down_and_jump_to_groundpound = global.player_down_and_jump_to_groundpound[4];
		wall_jump_setting = global.player_wall_jump_setting[4];
		drop_from_rope = global.player_drop_from_rope[4];
	}
	#endregion /* Set values from the Input Settings END */
	
	#region /* Crouch Toggling */
	key_crouch_toggle = scr_key_initialize(key_crouch_toggle, 1, player, action.crouch_toggle);
	if (key_crouch_toggle)
	{
		if (player == 1)
		{
			global.player_crouch_toggle[1] = !global.player_crouch_toggle[1];
		}
		else
		if (player == 2)
		{
			global.player_crouch_toggle[2] = !global.player_crouch_toggle[2];
		}
		else
		if (player == 3)
		{
			global.player_crouch_toggle[3] = !global.player_crouch_toggle[3];
		}
		else
		if (player == 4)
		{
			global.player_crouch_toggle[4] = !global.player_crouch_toggle[4];
		}
	}
	#endregion /* Crouch Toggling END */
	
	key_tongue = scr_key_initialize(key_tongue, 0, player, action.tongue);
	key_tongue_pressed = scr_key_initialize(key_tongue_pressed, 1, player, action.tongue);
	key_tongue_released = scr_key_initialize(key_tongue_released, 2, player, action.tongue);
	key_dive_pressed = scr_key_initialize(key_dive_pressed, 1, player, action.dive);
	key_dive_hold = scr_key_initialize(key_dive_hold, 0, player, action.dive);
	
	key_left_hold_temp = scr_key_initialize(key_left_hold_temp, 0, player, action.left);
	key_left_pressed_temp = scr_key_initialize(key_left_pressed_temp, 1, player, action.left);
	key_right_hold_temp = scr_key_initialize(key_right_hold_temp, 0, player, action.right);
	key_right_pressed_temp = scr_key_initialize(key_right_pressed_temp, 1, player, action.right);
	key_down_hold_temp = scr_key_initialize(key_down_hold_temp, 0, player, action.down);
	key_up_hold_temp = scr_key_initialize(key_up_hold_temp, 0, player, action.up);
	key_up_pressed_temp = scr_key_initialize(key_up_pressed_temp, 1, player, action.up);
	key_up_released_temp = scr_key_initialize(key_up_released_temp, 2, player, action.up);
	
	#region /* Key Left Hold */
	key_left_hold =
	(key_left_hold_temp)
	&& (!key_right_hold_temp)
	|| (active_left);
	#endregion /* Key Left Hold END */
	
	#region /* Key Left Pressed */
	key_left_pressed =
	(key_left_pressed_temp)
	&& (!key_right_pressed_temp)
	#endregion /* Key Left Pressed END */
	
	#region /* Key Right Hold */
	key_right_hold =
	(key_right_hold_temp)
	&& (!key_left_hold_temp)
	|| (active_right);
	#endregion /* Key Right Hold END */
	
	#region /* Key Right Pressed */
	key_right_pressed =
	(key_right_pressed_temp)
	&& (!key_left_pressed_temp)
	#endregion /* Key Right Pressed END */
	
	#region /* Key Down Hold */
	key_down =
	(key_down_hold_temp)
	&& (!key_up_hold_temp)
	|| (active_down);
	#endregion /* Key Down Hold END */
	
	#region /* Key Up Hold */
	key_up =
	(key_up_hold_temp)
	&& (!key_down_hold_temp)
	|| (active_up);
	#endregion /* Key Up Hold END */
	
	#region /* Key Up Pressed */
	key_up_pressed =
	(key_up_pressed_temp)
	#endregion /* Key Up Pressed END */
	
	#region /* Key Jump Pressed */
	key_jump_pressed_temp = scr_key_initialize(key_jump_pressed_temp, 1, player, action.jump);
	
	key_jump =
	(key_jump_pressed_temp)
	|| (up_is_also_jump)
	&& (key_up_pressed)
	|| (active_jump);
	#endregion /* Key Jump Pressed END */
	
	#region /* Key Jump Hold */
	key_jump_hold_temp = scr_key_initialize(key_jump_hold_temp, 0, player, action.jump);
	
	key_jump_hold =
	(key_jump_hold_temp)
	|| (up_is_also_jump)
	&& (key_up)
	|| (active_jump);
	#endregion /* Key Jump Hold END */
	
	#region /* Key Jump Released */
	key_jump_released_temp = scr_key_initialize(key_jump_released_temp, 2, player, action.jump);
	
	key_jump_released =
	(key_jump_released_temp)
	|| (up_is_also_jump)
	&& (key_up_released_temp)
	#endregion /* Key Jump Released END */
	
	#region /* Key Double Jump Pressed */
	key_double_jump = scr_key_initialize(key_double_jump, 1, player, action.double_jump);
	#endregion /* Key Double Jump Pressed END */
	
	#region /* Key Crouch Hold */
	key_crouch_hold_temp = scr_key_initialize(key_crouch_hold_temp, 0, player, action.crouch);
	
	key_crouch_hold =
	(key_crouch_hold_temp)
	|| (player == 1)
	&& (global.player_crouch_toggle[1])
	|| (player == 2)
	&& (global.player_crouch_toggle[2])
	|| (player == 3)
	&& (global.player_crouch_toggle[3])
	|| (player >= 4)
	&& (global.player_crouch_toggle[4])
	|| (down_is_also_crouch)
	&& (key_down);
	#endregion /* Key Crouch Hold END */
	
	#region /* Key Crouch Pressed */
	key_crouch_pressed_temp = scr_key_initialize(key_crouch_pressed_temp, 1, player, action.crouch);
	
	key_crouch_pressed =
	(key_crouch_pressed_temp)
	|| (down_is_also_crouch)
	&& (scr_key_initialize(key_down_hold_temp, 1, player, action.down))
	#endregion /* Key Crouch Pressed END */
	
	#region /* Key Run Hold */
	key_run_hold_temp = scr_key_initialize(key_run_hold_temp, 0, player, action.run);
	
	key_run =
	(key_run_hold_temp)
	|| (player == 1)
	&& (global.player_run_toggle[1])
	|| (player == 2)
	&& (global.player_run_toggle[2])
	|| (player == 3)
	&& (global.player_run_toggle[3])
	|| (player >= 4)
	&& (global.player_run_toggle[4]);
	#endregion /* Key Run Hold END */
	
	key_run_pressed = scr_key_initialize(key_run_pressed, 1, player, action.run);
	key_run_released = scr_key_initialize(key_run_released, 2, player, action.run);
}