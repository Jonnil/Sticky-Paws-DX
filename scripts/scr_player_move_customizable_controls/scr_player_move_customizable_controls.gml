function scr_player_move_customizable_controls()
{
	/* Customizable Controls */
	
	#region /* Set values from the Input Settings */
	if (player == 1)
	{
		up_is_also_jump = global.player1_up_is_also_jump;
		double_tap_to_run = global.player1_double_tap_to_run;
		double_tap_to_dive = global.player1_double_tap_to_dive;
		cancel_dive_by_pressing_jump_or_dive_button = global.player1_cancel_dive_by_pressing_jump_or_dive_button;
		cancel_dive_by_pressing_opposite_direction = global.player1_cancel_dive_by_pressing_opposite_direction;
		down_and_jump_to_groundpound = global.player1_down_and_jump_to_groundpound;
		wall_jump_setting = global.player1_wall_jump_setting;
		drop_from_rope = global.player1_drop_from_rope;
	}
	else
	if (player == 2)
	{
		up_is_also_jump = global.player2_up_is_also_jump;
		double_tap_to_run = global.player2_double_tap_to_run;
		double_tap_to_dive = global.player2_double_tap_to_dive;
		cancel_dive_by_pressing_jump_or_dive_button = global.player2_cancel_dive_by_pressing_jump_or_dive_button;
		cancel_dive_by_pressing_opposite_direction = global.player2_cancel_dive_by_pressing_opposite_direction;
		down_and_jump_to_groundpound = global.player2_down_and_jump_to_groundpound;
		wall_jump_setting = global.player2_wall_jump_setting;
		drop_from_rope = global.player2_drop_from_rope;
	}
	else
	if (player == 3)
	{
		up_is_also_jump = global.player3_up_is_also_jump;
		double_tap_to_run = global.player3_double_tap_to_run;
		double_tap_to_dive = global.player3_double_tap_to_dive;
		cancel_dive_by_pressing_jump_or_dive_button = global.player3_cancel_dive_by_pressing_jump_or_dive_button;
		cancel_dive_by_pressing_opposite_direction = global.player3_cancel_dive_by_pressing_opposite_direction;
		down_and_jump_to_groundpound = global.player3_down_and_jump_to_groundpound;
		wall_jump_setting = global.player3_wall_jump_setting;
		drop_from_rope = global.player3_drop_from_rope;
	}
	else
	if (player == 4)
	{
		up_is_also_jump = global.player4_up_is_also_jump;
		double_tap_to_run = global.player4_double_tap_to_run;
		double_tap_to_dive = global.player4_double_tap_to_dive;
		cancel_dive_by_pressing_jump_or_dive_button = global.player4_cancel_dive_by_pressing_jump_or_dive_button;
		cancel_dive_by_pressing_opposite_direction = global.player4_cancel_dive_by_pressing_opposite_direction;
		down_and_jump_to_groundpound = global.player4_down_and_jump_to_groundpound;
		wall_jump_setting = global.player4_wall_jump_setting;
		drop_from_rope = global.player4_drop_from_rope;
	}
	#endregion /* Set values from the Input Settings END */
	
	#region /* Crouch Toggling */
	key_crouch_toggle = scr_key_initialize(key_crouch_toggle, 1, player, action.crouch_toggle);
	if (key_crouch_toggle)
	{
		if (player == 1)
		{
			global.player1_crouch_toggle = !global.player1_crouch_toggle;
		}
		else
		if (player == 2)
		{
			global.player2_crouch_toggle = !global.player2_crouch_toggle;
		}
		else
		if (player == 3)
		{
			global.player3_crouch_toggle = !global.player3_crouch_toggle;
		}
		else
		if (player == 4)
		{
			global.player4_crouch_toggle = !global.player4_crouch_toggle;
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
	&& (global.player1_crouch_toggle)
	|| (player == 2)
	&& (global.player2_crouch_toggle)
	|| (player == 3)
	&& (global.player3_crouch_toggle)
	|| (player >= 4)
	&& (global.player4_crouch_toggle);
	#endregion /* Key Crouch Hold END */
	
	#region /* Key Crouch Pressed */
	key_crouch_pressed_temp = scr_key_initialize(key_crouch_pressed_temp, 1, player, action.crouch);
	
	key_crouch_pressed =
	(key_crouch_pressed_temp)
	#endregion /* Key Crouch Pressed END */
	
	#region /* Key Run Hold */
	key_run_hold_temp = scr_key_initialize(key_run_hold_temp, 0, player, action.run);
	
	key_run =
	(key_run_hold_temp)
	|| (player == 1)
	&& (global.player1_run_toggle)
	|| (player == 2)
	&& (global.player2_run_toggle)
	|| (player == 3)
	&& (global.player3_run_toggle)
	|| (player >= 4)
	&& (global.player4_run_toggle);
	#endregion /* Key Run Hold END */
	
	key_run_pressed = scr_key_initialize(key_run_pressed, 1, player, action.run);
	key_run_released = scr_key_initialize(key_run_released, 2, player, action.run);
}