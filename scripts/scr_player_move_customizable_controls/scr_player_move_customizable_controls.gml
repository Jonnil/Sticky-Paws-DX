function scr_player_move_customizable_controls()
{
	
	#region /* Customizable Controls */
	
	#region /* Set values from the Input Settings */
	
	#region /* Up Key Is Jump Key */
	if (player == 1)
	{
		up_key_is_jump_key = global.player1_up_key_is_jump_key;
	}
	else
	if (player == 2)
	{
		up_key_is_jump_key = global.player2_up_key_is_jump_key;
	}
	else
	if (player == 3)
	{
		up_key_is_jump_key = global.player3_up_key_is_jump_key;
	}
	else
	if (player == 4)
	{
		up_key_is_jump_key = global.player4_up_key_is_jump_key;
	}
	#endregion /* Up Key Is Jump Key END */
	
	#region /* Double-tap direction to run */
	if (player == 1)
	{
		double_tap_to_run = global.player1_double_tap_to_run;
	}
	else
	if (player == 2)
	{
		double_tap_to_run = global.player2_double_tap_to_run;
	}
	else
	if (player == 3)
	{
		double_tap_to_run = global.player3_double_tap_to_run;
	}
	else
	if (player == 4)
	{
		double_tap_to_run = global.player4_double_tap_to_run;
	}
	#endregion /* Double-tap direction to run END */
	
	#region /* Double-tap direction to dive */
	if (player == 1)
	{
		double_tap_to_dive = global.player1_double_tap_to_dive;
	}
	else
	if (player == 2)
	{
		double_tap_to_dive = global.player2_double_tap_to_dive;
	}
	else
	if (player == 3)
	{
		double_tap_to_dive = global.player3_double_tap_to_dive;
	}
	else
	if (player == 4)
	{
		double_tap_to_dive = global.player4_double_tap_to_dive;
	}
	#endregion /* Double-tap direction to run END */
	
	#region /* Cancel dive by pressing the jump or dive key */
	if (player == 1)
	{
		cancel_dive_by_pressing_jump_or_dive_button = global.player1_cancel_dive_by_pressing_jump_or_dive_button;
	}
	else
	if (player == 2)
	{
		cancel_dive_by_pressing_jump_or_dive_button = global.player2_cancel_dive_by_pressing_jump_or_dive_button;
	}
	else
	if (player == 3)
	{
		cancel_dive_by_pressing_jump_or_dive_button = global.player3_cancel_dive_by_pressing_jump_or_dive_button;
	}
	else
	if (player == 4)
	{
		cancel_dive_by_pressing_jump_or_dive_button = global.player4_cancel_dive_by_pressing_jump_or_dive_button;
	}
	#endregion /* Cancel dive by pressing the jump or dive key END */
	
	#region /* Cancel dive by pressing the opposite direction */
	if (player == 1)
	{
		cancel_dive_by_pressing_opposite_direction = global.player1_cancel_dive_by_pressing_opposite_direction;
	}
	else
	if (player == 2)
	{
		cancel_dive_by_pressing_opposite_direction = global.player2_cancel_dive_by_pressing_opposite_direction;
	}
	else
	if (player == 3)
	{
		cancel_dive_by_pressing_opposite_direction = global.player3_cancel_dive_by_pressing_opposite_direction;
	}
	else
	if (player == 4)
	{
		cancel_dive_by_pressing_opposite_direction = global.player4_cancel_dive_by_pressing_opposite_direction;
	}
	#endregion /* Cancel dive by pressing the opposite direction END */
	
	#region /* Down + Jump to Ground Pound */
	if (player == 1)
	{
		down_and_jump_to_groundpound = global.player1_down_and_jump_to_groundpound;
	}
	else
	if (player == 2)
	{
		down_and_jump_to_groundpound = global.player2_down_and_jump_to_groundpound;
	}
	else
	if (player == 3)
	{
		down_and_jump_to_groundpound = global.player3_down_and_jump_to_groundpound;
	}
	else
	if (player == 4)
	{
		down_and_jump_to_groundpound = global.player4_down_and_jump_to_groundpound;
	}
	#endregion /* Down + Jump to Ground Pound END */
	
	#region /* Hold Direction Wall jump */
	if (player == 1)
	{
		wall_jump_setting = global.player1_wall_jump_setting;
	}
	else
	if (player == 2)
	{
		wall_jump_setting = global.player2_wall_jump_setting;
	}
	else
	if (player == 3)
	{
		wall_jump_setting = global.player3_wall_jump_setting;
	}
	else
	if (player == 4)
	{
		wall_jump_setting = global.player4_wall_jump_setting;
	}
	#endregion /* Hold Direction Wall jump END */
	
	#region /* Drop down form Horizontal Rope */
	if (player == 1)
	{
		drop_from_rope = global.player1_drop_from_rope;
	}
	else
	if (player == 2)
	{
		drop_from_rope = global.player2_drop_from_rope;
	}
	else
	if (player == 3)
	{
		drop_from_rope = global.player3_drop_from_rope;
	}
	else
	if (player == 4)
	{
		drop_from_rope = global.player4_drop_from_rope;
	}
	#endregion /* Drop down form Horizontal Rope END */
	
	#endregion /* Set values from the Input Settings END */
	
	#region /* Initialize Player Controls */
	
	#region /* Player 1 Controls */
	if (player <= 1)
	{
		var this_player_key_crouch_toggle = global.player1_key_crouch_toggle;
		var this_player_key2_crouch_toggle = global.player1_key2_crouch_toggle;
		var this_player_gamepad_button_crouch_toggle = global.player1_gamepad_button_crouch_toggle;
		var this_player_gamepad_button2_crouch_toggle = global.player1_gamepad_button2_crouch_toggle;
		var this_player_key_tongue = global.player1_key_tongue;
		var this_player_key2_tongue = global.player1_key2_tongue;
		var this_player_gamepad_button_tongue = global.player1_gamepad_button_tongue;
		var this_player_gamepad_button2_tongue = global.player1_gamepad_button2_tongue;
		var this_player_key_dive = global.player1_key_dive;
		var this_player_key2_dive = global.player1_key2_dive;
		var this_player_gamepad_button_dive = global.player1_gamepad_button_dive;
		var this_player_gamepad_button2_dive = global.player1_gamepad_button2_dive;
		var this_player_key_jump = global.player1_key_jump;
		var this_player_key2_jump = global.player1_key2_jump;
		var this_player_gamepad_button_jump = global.player1_gamepad_button_jump;
		var this_player_gamepad_button2_jump = global.player1_gamepad_button2_jump;
		var this_player_key_up = global.player1_key_up;
		var this_player_key2_up = global.player1_key2_up;
		var this_player_gamepad_button_up = global.player1_gamepad_button_up;
		var this_player_gamepad_button2_up = global.player1_gamepad_button2_up;
		var this_player_key_down = global.player1_key_down;
		var this_player_key2_down = global.player1_key2_down;
		var this_player_gamepad_button_down = global.player1_gamepad_button_down;
		var this_player_gamepad_button2_down = global.player1_gamepad_button2_down;
		var this_player_key_left = global.player1_key_left;
		var this_player_key2_left = global.player1_key2_left;
		var this_player_gamepad_button_left = global.player1_gamepad_button_left;
		var this_player_gamepad_button2_left = global.player1_gamepad_button2_left;
		var this_player_key_right = global.player1_key_right;
		var this_player_key2_right = global.player1_key2_right;
		var this_player_gamepad_button_right = global.player1_gamepad_button_right;
		var this_player_gamepad_button2_right = global.player1_gamepad_button2_right;
		var this_player_key_crouch = global.player1_key_crouch;
		var this_player_key2_crouch = global.player1_key2_crouch;
		var this_player_gamepad_button_crouch = global.player1_gamepad_button_crouch;
		var this_player_gamepad_button2_crouch = global.player1_gamepad_button2_crouch;
		var this_player_key_sprint = global.player1_key_sprint;
		var this_player_key2_sprint = global.player1_key2_sprint;
		var this_player_gamepad_button_sprint = global.player1_gamepad_button_sprint;
		var this_player_gamepad_button2_sprint = global.player1_gamepad_button2_sprint;
	}
	#endregion /* Player 1 Controls END */

	#region /* Player 2 Controls */
	if (player == 2)
	{
		var this_player_key_crouch_toggle = global.player2_key_crouch_toggle;
		var this_player_key2_crouch_toggle = global.player2_key2_crouch_toggle;
		var this_player_gamepad_button_crouch_toggle = global.player2_gamepad_button_crouch_toggle;
		var this_player_gamepad_button2_crouch_toggle = global.player2_gamepad_button2_crouch_toggle;
		var this_player_key_tongue = global.player2_key_tongue;
		var this_player_key2_tongue = global.player2_key2_tongue;
		var this_player_gamepad_button_tongue = global.player2_gamepad_button_tongue;
		var this_player_gamepad_button2_tongue = global.player2_gamepad_button2_tongue;
		var this_player_key_dive = global.player2_key_dive;
		var this_player_key2_dive = global.player2_key2_dive;
		var this_player_gamepad_button_dive = global.player2_gamepad_button_dive;
		var this_player_gamepad_button2_dive = global.player2_gamepad_button2_dive;
		var this_player_key_jump = global.player2_key_jump;
		var this_player_key2_jump = global.player2_key2_jump;
		var this_player_gamepad_button_jump = global.player2_gamepad_button_jump;
		var this_player_gamepad_button2_jump = global.player2_gamepad_button2_jump;
		var this_player_key_up = global.player2_key_up;
		var this_player_key2_up = global.player2_key2_up;
		var this_player_gamepad_button_up = global.player2_gamepad_button_up;
		var this_player_gamepad_button2_up = global.player2_gamepad_button2_up;
		var this_player_key_down = global.player2_key_down;
		var this_player_key2_down = global.player2_key2_down;
		var this_player_gamepad_button_down = global.player2_gamepad_button_down;
		var this_player_gamepad_button2_down = global.player2_gamepad_button2_down;
		var this_player_key_left = global.player2_key_left;
		var this_player_key2_left = global.player2_key2_left;
		var this_player_gamepad_button_left = global.player2_gamepad_button_left;
		var this_player_gamepad_button2_left = global.player2_gamepad_button2_left;
		var this_player_key_right = global.player2_key_right;
		var this_player_key2_right = global.player2_key2_right;
		var this_player_gamepad_button_right = global.player2_gamepad_button_right;
		var this_player_gamepad_button2_right = global.player2_gamepad_button2_right;
		var this_player_key_crouch = global.player2_key_crouch;
		var this_player_key2_crouch = global.player2_key2_crouch;
		var this_player_gamepad_button_crouch = global.player2_gamepad_button_crouch;
		var this_player_gamepad_button2_crouch = global.player2_gamepad_button2_crouch;
		var this_player_key_sprint = global.player2_key_sprint;
		var this_player_key2_sprint = global.player2_key2_sprint;
		var this_player_gamepad_button_sprint = global.player2_gamepad_button_sprint;
		var this_player_gamepad_button2_sprint = global.player2_gamepad_button2_sprint;
	}
	#endregion /* Player 2 Controls END */

	#region /* Player 3 Controls */
	if (player == 3)
	{
		var this_player_key_crouch_toggle = global.player3_key_crouch_toggle;
		var this_player_key2_crouch_toggle = global.player3_key2_crouch_toggle;
		var this_player_gamepad_button_crouch_toggle = global.player3_gamepad_button_crouch_toggle;
		var this_player_gamepad_button2_crouch_toggle = global.player3_gamepad_button2_crouch_toggle;
		var this_player_key_tongue = global.player3_key_tongue;
		var this_player_key2_tongue = global.player3_key2_tongue;
		var this_player_gamepad_button_tongue = global.player3_gamepad_button_tongue;
		var this_player_gamepad_button2_tongue = global.player3_gamepad_button2_tongue;
		var this_player_key_dive = global.player3_key_dive;
		var this_player_key2_dive = global.player3_key2_dive;
		var this_player_gamepad_button_dive = global.player3_gamepad_button_dive;
		var this_player_gamepad_button2_dive = global.player3_gamepad_button2_dive;
		var this_player_key_jump = global.player3_key_jump;
		var this_player_key2_jump = global.player3_key2_jump;
		var this_player_gamepad_button_jump = global.player3_gamepad_button_jump;
		var this_player_gamepad_button2_jump = global.player3_gamepad_button2_jump;
		var this_player_key_up = global.player3_key_up;
		var this_player_key2_up = global.player3_key2_up;
		var this_player_gamepad_button_up = global.player3_gamepad_button_up;
		var this_player_gamepad_button2_up = global.player3_gamepad_button2_up;
		var this_player_key_down = global.player3_key_down;
		var this_player_key2_down = global.player3_key2_down;
		var this_player_gamepad_button_down = global.player3_gamepad_button_down;
		var this_player_gamepad_button2_down = global.player3_gamepad_button2_down;
		var this_player_key_left = global.player3_key_left;
		var this_player_key2_left = global.player3_key2_left;
		var this_player_gamepad_button_left = global.player3_gamepad_button_left;
		var this_player_gamepad_button2_left = global.player3_gamepad_button2_left;
		var this_player_key_right = global.player3_key_right;
		var this_player_key2_right = global.player3_key2_right;
		var this_player_gamepad_button_right = global.player3_gamepad_button_right;
		var this_player_gamepad_button2_right = global.player3_gamepad_button2_right;
		var this_player_key_crouch = global.player3_key_crouch;
		var this_player_key2_crouch = global.player3_key2_crouch;
		var this_player_gamepad_button_crouch = global.player3_gamepad_button_crouch;
		var this_player_gamepad_button2_crouch = global.player3_gamepad_button2_crouch;
		var this_player_key_sprint = global.player3_key_sprint;
		var this_player_key2_sprint = global.player3_key2_sprint;
		var this_player_gamepad_button_sprint = global.player3_gamepad_button_sprint;
		var this_player_gamepad_button2_sprint = global.player3_gamepad_button2_sprint;
	}
	#endregion /* Player 3 Controls END */

	#region /* Player 4 Controls */
	if (player >= 4)
	{
		var this_player_key_crouch_toggle = global.player4_key_crouch_toggle;
		var this_player_key2_crouch_toggle = global.player4_key2_crouch_toggle;
		var this_player_gamepad_button_crouch_toggle = global.player4_gamepad_button_crouch_toggle;
		var this_player_gamepad_button2_crouch_toggle = global.player4_gamepad_button2_crouch_toggle;
		var this_player_key_tongue = global.player4_key_tongue;
		var this_player_key2_tongue = global.player4_key2_tongue;
		var this_player_gamepad_button_tongue = global.player4_gamepad_button_tongue;
		var this_player_gamepad_button2_tongue = global.player4_gamepad_button2_tongue;
		var this_player_key_dive = global.player4_key_dive;
		var this_player_key2_dive = global.player4_key2_dive;
		var this_player_gamepad_button_dive = global.player4_gamepad_button_dive;
		var this_player_gamepad_button2_dive = global.player4_gamepad_button2_dive;
		var this_player_key_jump = global.player4_key_jump;
		var this_player_key2_jump = global.player4_key2_jump;
		var this_player_gamepad_button_jump = global.player4_gamepad_button_jump;
		var this_player_gamepad_button2_jump = global.player4_gamepad_button2_jump;
		var this_player_key_up = global.player4_key_up;
		var this_player_key2_up = global.player4_key2_up;
		var this_player_gamepad_button_up = global.player4_gamepad_button_up;
		var this_player_gamepad_button2_up = global.player4_gamepad_button2_up;
		var this_player_key_down = global.player4_key_down;
		var this_player_key2_down = global.player4_key2_down;
		var this_player_gamepad_button_down = global.player4_gamepad_button_down;
		var this_player_gamepad_button2_down = global.player4_gamepad_button2_down;
		var this_player_key_left = global.player4_key_left;
		var this_player_key2_left = global.player4_key2_left;
		var this_player_gamepad_button_left = global.player4_gamepad_button_left;
		var this_player_gamepad_button2_left = global.player4_gamepad_button2_left;
		var this_player_key_right = global.player4_key_right;
		var this_player_key2_right = global.player4_key2_right;
		var this_player_gamepad_button_right = global.player4_gamepad_button_right;
		var this_player_gamepad_button2_right = global.player4_gamepad_button2_right;
		var this_player_key_crouch = global.player4_key_crouch;
		var this_player_key2_crouch = global.player4_key2_crouch;
		var this_player_gamepad_button_crouch = global.player4_gamepad_button_crouch;
		var this_player_gamepad_button2_crouch = global.player4_gamepad_button2_crouch;
		var this_player_key_sprint = global.player4_key_sprint;
		var this_player_key2_sprint = global.player4_key2_sprint;
		var this_player_gamepad_button_sprint = global.player4_gamepad_button_sprint;
		var this_player_gamepad_button2_sprint = global.player4_gamepad_button2_sprint;
	}
	#endregion /* Player 4 Controls END */

	#endregion /* Initialize Player Controls END */
	
	#region /* Crouch Toggling */
	key_crouch_toggle = scr_key_initialize(key_crouch_toggle, 1, player, this_player_key_crouch_toggle, this_player_key2_crouch_toggle, this_player_gamepad_button_crouch_toggle, this_player_gamepad_button2_crouch_toggle);
	if (key_crouch_toggle)
	{
		if (player <= 1)
		{
			if (global.player1_crouch_toggle = false)
			{
				global.player1_crouch_toggle = true;
			}
			else
			{
				global.player1_crouch_toggle = false;
			}
		}
		else
		if (player == 2)
		{
			if (global.player2_crouch_toggle = false)
			{
				global.player2_crouch_toggle = true;
			}
			else
			{
				global.player2_crouch_toggle = false;
			}
		}
		else
		if (player == 3)
		{
			if (global.player3_crouch_toggle = false)
			{
				global.player3_crouch_toggle = true;
			}
			else
			{
				global.player3_crouch_toggle = false;
			}
		}
		else
		if (player == 4)
		{
			if (global.player4_crouch_toggle = false)
			{
				global.player4_crouch_toggle = true;
			}
			else
			{
				global.player4_crouch_toggle = false;
			}
		}
	}
	#endregion /* Crouch Toggling END */
	
	key_tongue = scr_key_initialize(key_tongue, 0, player, this_player_key_tongue, this_player_key2_tongue, this_player_gamepad_button_tongue, this_player_gamepad_button2_tongue);
	key_tongue_pressed = scr_key_initialize(key_tongue_pressed, 1, player, this_player_key_tongue, this_player_key2_tongue, this_player_gamepad_button_tongue, this_player_gamepad_button2_tongue);
	key_tongue_released = scr_key_initialize(key_tongue_released, 2, player, this_player_key_tongue, this_player_key2_tongue, this_player_gamepad_button_tongue, this_player_gamepad_button2_tongue);
	key_dive_pressed = scr_key_initialize(key_dive_pressed, 1, player, this_player_key_dive, this_player_key2_dive, this_player_gamepad_button_dive, this_player_gamepad_button2_dive);
	key_dive_hold = scr_key_initialize(key_dive_pressed, 0, player, this_player_key_dive, this_player_key2_dive, this_player_gamepad_button_dive, this_player_gamepad_button2_dive);
	
	key_left_hold_temp = scr_key_initialize(key_left_hold_temp, 0, player, this_player_key_left, this_player_key2_left, this_player_gamepad_button_left, this_player_gamepad_button2_left);
	key_left_pressed_temp = scr_key_initialize(key_left_pressed_temp, 1, player, this_player_key_left, this_player_key2_left, this_player_gamepad_button_left, this_player_gamepad_button2_left);
	key_right_hold_temp = scr_key_initialize(key_right_hold_temp, 0, player, this_player_key_right, this_player_key2_right, this_player_gamepad_button_right, this_player_gamepad_button2_right);
	key_right_pressed_temp = scr_key_initialize(key_right_pressed_temp, 1, player, this_player_key_right, this_player_key2_right, this_player_gamepad_button_right, this_player_gamepad_button2_right);
	key_down_hold_temp = scr_key_initialize(key_down_hold_temp, 0, player, this_player_key_down, this_player_key2_down, this_player_gamepad_button_down, this_player_gamepad_button2_down);
	key_up_hold_temp = scr_key_initialize(key_up_hold_temp, 0, player, this_player_key_up, this_player_key2_up, this_player_gamepad_button_up, this_player_gamepad_button2_up);
	key_up_pressed_temp = scr_key_initialize(key_up_pressed_temp, 1, player, this_player_key_up, this_player_key2_up, this_player_gamepad_button_up, this_player_gamepad_button2_up);
	key_up_released_temp = scr_key_initialize(key_up_released_temp, 2, player, this_player_key_up, this_player_key2_up, this_player_gamepad_button_up, this_player_gamepad_button2_up);
	
	#region /* Key Left Hold */
	key_left_hold =
	(key_left_hold_temp)
	and (!key_right_hold_temp)
	or (gamepad_axis_value(player - 1, gp_axislh) < 0)
	or (active_left == true);
	#endregion /* Key Left Hold END */
	
	#region /* Key Left Pressed */
	key_left_pressed =
	(key_left_pressed_temp)
	and (!key_right_pressed_temp)
	or (gamepad_axis_value(player - 1, gp_axislh) < 0);
	#endregion /* Key Left Pressed END */
	
	#region /* Key Right Hold */
	key_right_hold =
	(key_right_hold_temp)
	and (!key_left_hold_temp)
	or (gamepad_axis_value(player - 1, gp_axislh) > 0)
	or (active_right == true);
	#endregion /* Key Right Hold END */
	
	#region /* Key Right Pressed */
	key_right_pressed =
	(key_right_pressed_temp)
	and (!key_left_pressed_temp)
	or (gamepad_axis_value(player - 1, gp_axislh) > 0);
	#endregion /* Key Right Pressed END */
	
	#region /* Key Down Hold */
	key_down =
	(key_down_hold_temp)
	and (!key_up_hold_temp)
	or (gamepad_axis_value(player - 1, gp_axislv) > 0)
	or (active_down == true);
	#endregion /* Key Down Hold END */
	
	#region /* Key Up Hold */
	key_up =
	(key_up_hold_temp)
	and (!key_down_hold_temp)
	or (gamepad_axis_value(player - 1, gp_axislv) < 0)
	or (active_up == true);
	#endregion /* Key Up Hold END */
	
	#region /* Key Up Pressed */
	key_up_pressed =
	(key_up_pressed_temp)
	or (gamepad_axis_value(player - 1, gp_axislv) < 0);
	#endregion /* Key Up Pressed END */
	
	#region /* Key Jump Pressed */
	key_jump_pressed_temp = scr_key_initialize(key_jump_pressed_temp, 1, player, this_player_key_jump, this_player_key2_jump, this_player_gamepad_button_jump, this_player_gamepad_button2_jump);
	
	key_jump =
	(key_jump_pressed_temp)
	or (variable_instance_exists(self, "up_key_is_jump_key"))
	and (up_key_is_jump_key == true)
	and (key_up_pressed)
	or (active_jump == true);
	#endregion /* Key Jump Pressed END */
	
	#region /* Key Jump Hold */
	key_jump_hold_temp = scr_key_initialize(key_jump_hold_temp, 0, player, this_player_key_jump, this_player_key2_jump, this_player_gamepad_button_jump, this_player_gamepad_button2_jump);
	
	key_jump_hold =
	(key_jump_hold_temp)
	or (variable_instance_exists(self, "up_key_is_jump_key"))
	and (up_key_is_jump_key == true)
	and (key_up)
	or (active_jump == true);
	#endregion /* Key Jump Hold END */
	
	#region /* Key Jump Released */
	key_jump_released_temp = scr_key_initialize(key_jump_released_temp, 2, player, this_player_key_jump, this_player_key2_jump, this_player_gamepad_button_jump, this_player_gamepad_button2_jump);
	
	key_jump_released =
	(key_jump_released_temp)
	or (variable_instance_exists(self, "up_key_is_jump_key"))
	and (up_key_is_jump_key == true)
	and (key_up_released_temp)
	#endregion /* Key Jump Released END */
	
	#region /* Key Crouch Hold */
	key_crouch_hold_temp = scr_key_initialize(key_crouch_hold_temp, 0, player, this_player_key_crouch, this_player_key2_crouch, this_player_gamepad_button_crouch, this_player_gamepad_button2_crouch);
	
	key_crouch_hold =
	(key_crouch_hold_temp)
	or (gamepad_axis_value(player - 1, gp_axislv) > 0)
	or (player <= 1)
	and (global.player1_crouch_toggle == true)
	or (player = 2)
	and (global.player2_crouch_toggle == true)
	or (player = 3)
	and (global.player3_crouch_toggle == true)
	or (player >= 4)
	and (global.player4_crouch_toggle == true);
	#endregion /* Key Crouch Hold END */
	
	#region /* Key Crouch Pressed */
	key_crouch_pressed_temp = scr_key_initialize(key_crouch_pressed_temp, 1, player, this_player_key_crouch, this_player_key2_crouch, this_player_gamepad_button_crouch, this_player_gamepad_button2_crouch);
	
	key_crouch_pressed =
	(key_crouch_pressed_temp)
	or (gamepad_axis_value(player - 1, gp_axislv) > 0);
	#endregion /* Key Crouch Pressed END */
	
	#region /* Key Sprint Hold */
	key_sprint_hold_temp = scr_key_initialize(key_sprint_hold_temp, 0, player, this_player_key_sprint, this_player_key2_sprint, this_player_gamepad_button_sprint, this_player_gamepad_button2_sprint);
	
	key_sprint =
	(key_sprint_hold_temp)
	or (player <= 1)
	and (global.player1_sprint_toggle == true)
	or (player = 2)
	and (global.player2_sprint_toggle == true)
	or (player = 3)
	and (global.player3_sprint_toggle == true)
	or (player >= 4)
	and (global.player4_sprint_toggle == true);
	#endregion /* Key Sprint Hold END */
	
	key_sprint_pressed = scr_key_initialize(key_sprint_pressed, 1, player, this_player_key_sprint, this_player_key2_sprint, this_player_gamepad_button_sprint, this_player_gamepad_button2_sprint);
	key_sprint_released = scr_key_initialize(key_sprint_released, 2, player, this_player_key_sprint, this_player_key2_sprint, this_player_gamepad_button_sprint, this_player_gamepad_button2_sprint);
	
	#region /* Key Spin Hold */
	key_spin =
	(gamepad_button_check(player - 1, gp_shoulderl))
	or (gamepad_button_check(player - 1, gp_shoulderlb))
	or (gamepad_button_check(player - 1, gp_shoulderr))
	or (gamepad_button_check(player - 1, gp_shoulderrb));
	#endregion /* Key Spin Hold */
	
	#region /* Key Spin Pressed */
	key_spin_pressed =
	(gamepad_button_check_pressed(player - 1, gp_shoulderl))
	or (gamepad_button_check_pressed(player - 1, gp_shoulderlb))
	or (gamepad_button_check_pressed(player - 1, gp_shoulderr))
	or (gamepad_button_check_pressed(player - 1, gp_shoulderrb));
	#endregion /* Key Spin Pressed END */
	
	#region /* Key Always Do Full Jump */
	key_always_do_full_jump = false;
	#endregion /* Key Always Do Full Jump END */
	
	#endregion /* Customizable Controls END */
	
}