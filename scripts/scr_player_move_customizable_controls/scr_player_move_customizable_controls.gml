function scr_player_move_customizable_controls()
{
	
	#region /* Set correct controller ports */
	if (player == 1)
	{
		var player_gamepad_slot = global.player1_slot;
	}
	else
	if (player == 2)
	{
		var player_gamepad_slot = global.player2_slot;
	}
	else
	if (player == 3)
	{
		var player_gamepad_slot = global.player3_slot;
	}
	else
	if (player == 4)
	{
		var player_gamepad_slot = global.player4_slot;
	}
	#endregion /* Set correct controller ports END */
	
	#region /* Customizable Controls */
	
	#region /* Set values from the Input Settings */
	
	#region /* Up Key Is Jump Key */
	if (player == 1)
	{
		up_is_also_jump = global.player1_up_is_also_jump;
	}
	else
	if (player == 2)
	{
		up_is_also_jump = global.player2_up_is_also_jump;
	}
	else
	if (player == 3)
	{
		up_is_also_jump = global.player3_up_is_also_jump;
	}
	else
	if (player == 4)
	{
		up_is_also_jump = global.player4_up_is_also_jump;
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
	
	#region /* Crouch Toggling */
	key_crouch_toggle = scr_key_initialize(key_crouch_toggle, 1, player, action.crouch_toggle);
	if (key_crouch_toggle)
	{
		if (player <= 1)
		{
			if (global.player1_crouch_toggle == false)
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
			if (global.player2_crouch_toggle == false)
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
			if (global.player3_crouch_toggle == false)
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
			if (global.player4_crouch_toggle == false)
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
	and (!key_right_hold_temp)
	or (active_left);
	#endregion /* Key Left Hold END */
	
	#region /* Key Left Pressed */
	key_left_pressed =
	(key_left_pressed_temp)
	and (!key_right_pressed_temp)
	#endregion /* Key Left Pressed END */
	
	#region /* Key Right Hold */
	key_right_hold =
	(key_right_hold_temp)
	and (!key_left_hold_temp)
	or (active_right);
	#endregion /* Key Right Hold END */
	
	#region /* Key Right Pressed */
	key_right_pressed =
	(key_right_pressed_temp)
	and (!key_left_pressed_temp)
	#endregion /* Key Right Pressed END */
	
	#region /* Key Down Hold */
	key_down =
	(key_down_hold_temp)
	and (!key_up_hold_temp)
	or (active_down);
	#endregion /* Key Down Hold END */
	
	#region /* Key Up Hold */
	key_up =
	(key_up_hold_temp)
	and (!key_down_hold_temp)
	or (active_up);
	#endregion /* Key Up Hold END */
	
	#region /* Key Up Pressed */
	key_up_pressed =
	(key_up_pressed_temp)
	#endregion /* Key Up Pressed END */
	
	#region /* Key Jump Pressed */
	key_jump_pressed_temp = scr_key_initialize(key_jump_pressed_temp, 1, player, action.jump);
	
	key_jump =
	(key_jump_pressed_temp)
	or (variable_instance_exists(self, "up_is_also_jump"))
	and (up_is_also_jump)
	and (key_up_pressed)
	or (active_jump);
	#endregion /* Key Jump Pressed END */
	
	#region /* Key Jump Hold */
	key_jump_hold_temp = scr_key_initialize(key_jump_hold_temp, 0, player, action.jump);
	
	key_jump_hold =
	(key_jump_hold_temp)
	or (variable_instance_exists(self, "up_is_also_jump"))
	and (up_is_also_jump)
	and (key_up)
	or (active_jump);
	#endregion /* Key Jump Hold END */
	
	#region /* Key Jump Released */
	key_jump_released_temp = scr_key_initialize(key_jump_released_temp, 2, player, action.jump);
	
	key_jump_released =
	(key_jump_released_temp)
	or (variable_instance_exists(self, "up_is_also_jump"))
	and (up_is_also_jump)
	and (key_up_released_temp)
	#endregion /* Key Jump Released END */
	
	#region /* Key Double Jump Pressed */
	key_double_jump = scr_key_initialize(key_double_jump, 1, player, action.double_jump);
	#endregion /* Key Double Jump Pressed END */
	
	#region /* Key Crouch Hold */
	key_crouch_hold_temp = scr_key_initialize(key_crouch_hold_temp, 0, player, action.crouch);
	
	key_crouch_hold =
	(key_crouch_hold_temp)
	or (player <= 1)
	and (global.player1_crouch_toggle)
	or (player == 2)
	and (global.player2_crouch_toggle)
	or (player == 3)
	and (global.player3_crouch_toggle)
	or (player >= 4)
	and (global.player4_crouch_toggle);
	#endregion /* Key Crouch Hold END */
	
	#region /* Key Crouch Pressed */
	key_crouch_pressed_temp = scr_key_initialize(key_crouch_pressed_temp, 1, player, action.crouch);
	
	key_crouch_pressed =
	(key_crouch_pressed_temp)
	#endregion /* Key Crouch Pressed END */
	
	#region /* Key Sprint Hold */
	key_sprint_hold_temp = scr_key_initialize(key_sprint_hold_temp, 0, player, action.sprint);
	
	key_sprint =
	(key_sprint_hold_temp)
	or (player <= 1)
	and (global.player1_sprint_toggle)
	or (player == 2)
	and (global.player2_sprint_toggle)
	or (player == 3)
	and (global.player3_sprint_toggle)
	or (player >= 4)
	and (global.player4_sprint_toggle);
	#endregion /* Key Sprint Hold END */
	
	key_sprint_pressed = scr_key_initialize(key_sprint_pressed, 1, player, action.sprint);
	key_sprint_released = scr_key_initialize(key_sprint_released, 2, player, action.sprint);
	
	#region /* Key Spin Hold */
	key_spin =
	(gamepad_button_check(player_gamepad_slot, gp_shoulderl))
	or (gamepad_button_check(player_gamepad_slot, gp_shoulderlb))
	or (gamepad_button_check(player_gamepad_slot, gp_shoulderr))
	or (gamepad_button_check(player_gamepad_slot, gp_shoulderrb));
	#endregion /* Key Spin Hold */
	
	#region /* Key Spin Pressed */
	key_spin_pressed =
	(gamepad_button_check_pressed(player_gamepad_slot, gp_shoulderl))
	or (gamepad_button_check_pressed(player_gamepad_slot, gp_shoulderlb))
	or (gamepad_button_check_pressed(player_gamepad_slot, gp_shoulderr))
	or (gamepad_button_check_pressed(player_gamepad_slot, gp_shoulderrb));
	#endregion /* Key Spin Pressed END */
	
	#region /* Key Always Do Full Jump */
	key_always_do_full_jump = false;
	#endregion /* Key Always Do Full Jump END */
	
	#endregion /* Customizable Controls END */
	
}