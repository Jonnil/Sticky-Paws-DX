function scr_set_default_remapping_player_gamepad(what_player = 1, save_default_controls_to_config = false)
{
	
	#region /* Player Gamepad Remapping */
	
	#region /* Player Gamepad 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][what_player][1][action.dive] = gp_face3;
	global.player_[inp.gp][what_player][1][action.jump] = gp_face1;
	global.player_[inp.gp][what_player][1][action.double_jump] = gp_face1;
	global.player_[inp.gp][what_player][1][action.crouch] = gp_padd;
	global.player_[inp.gp][what_player][1][action.crouch_toggle] = noone;
	global.player_[inp.gp][what_player][1][action.run] = gp_face3;
	global.player_[inp.gp][what_player][1][action.run_toggle] = noone;
	global.player_[inp.gp][what_player][1][action.left] = gp_padl;
	global.player_[inp.gp][what_player][1][action.right] = gp_padr;
	global.player_[inp.gp][what_player][1][action.down] = gp_padd;
	global.player_[inp.gp][what_player][1][action.up] = gp_padu;
	global.player_[inp.gp][what_player][1][action.tongue] = noone;
	global.player_[inp.gp][what_player][1][action.zoom_in] = JOYSTICK_VALUE.JOYRIGHT_UP;
	global.player_[inp.gp][what_player][1][action.zoom_out] = JOYSTICK_VALUE.JOYRIGHT_DOWN;
	if (os_type == os_switch)
	{
		global.player_[inp.gp][what_player][1][action.accept] = gp_face2;
		global.player_[inp.gp][what_player][1][action.back] = gp_face1;
	}
	else
	{
		global.player_[inp.gp][what_player][1][action.accept] = gp_face1;
		global.player_[inp.gp][what_player][1][action.back] = gp_face2;
	}
	#endregion /* Player Gamepad 1 defaults END */
	
	#region /* Player Gamepad 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][what_player][2][action.dive] = noone;
	global.player_[inp.gp][what_player][2][action.jump] = noone;
	global.player_[inp.gp][what_player][2][action.double_jump] = noone;
	global.player_[inp.gp][what_player][2][action.crouch] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][what_player][2][action.crouch_toggle] = noone;
	global.player_[inp.gp][what_player][2][action.run] = gp_shoulderrb;
	global.player_[inp.gp][what_player][2][action.run_toggle] = noone;
	global.player_[inp.gp][what_player][2][action.left] = JOYSTICK_VALUE.JOYLEFT_LEFT;
	global.player_[inp.gp][what_player][2][action.right] = JOYSTICK_VALUE.JOYLEFT_RIGHT;
	global.player_[inp.gp][what_player][2][action.down] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][what_player][2][action.up] = JOYSTICK_VALUE.JOYLEFT_UP;
	global.player_[inp.gp][what_player][2][action.tongue] = noone;
	global.player_[inp.gp][what_player][2][action.zoom_in] = noone;
	global.player_[inp.gp][what_player][2][action.zoom_out] = noone;
	global.player_[inp.gp][what_player][2][action.accept] = noone;
	global.player_[inp.gp][what_player][2][action.back] = noone;
	#endregion /* Player Gamepad 2 defaults END */
	
	global.player_up_is_also_jump[what_player] = false;
	global.player_double_jump_uses_jump_key[what_player] = true;
	global.player_down_is_also_crouch[what_player] = true;
	global.player_double_tap_to_run[what_player] = true;
	global.player_run_toggle[what_player] = false;
	global.player_double_tap_to_dive[what_player] = false;
	global.player_cancel_dive_by_jump_or_dive[what_player] = false;
	global.player_cancel_dive_by_opposite_direction[what_player] = false;
	global.player_down_and_jump_to_groundpound[what_player] = false;
	global.player_wall_jump_setting[what_player] = 1;
	global.player_drop_from_rope[what_player] = 1;
	global.player_show_controls[what_player] = 0; /* Needs to be set to 0 by default for best performance */
	#endregion /* Player Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	if (save_default_controls_to_config) {
		scr_save_player_control_profile(what_player, 1);
	}
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player_keyboard(what_player = 1, save_default_controls_to_config = false)
{
	
	#region /* Player Key Remapping */
	
	if (what_player == 1)
	{
		
		#region /* Player 1 Key 1 defaults */
		/* global.player_[keyboard/gamepad][player][key1/key2][action] */
		global.player_[inp.key][what_player][1][action.dive] = ord("X");
		global.player_[inp.key][what_player][1][action.jump] = ord("Z");
		global.player_[inp.key][what_player][1][action.double_jump] = ord("Z");
		global.player_[inp.key][what_player][1][action.crouch] = vk_down;
		global.player_[inp.key][what_player][1][action.crouch_toggle] = noone;
		global.player_[inp.key][what_player][1][action.run] = vk_lcontrol;
		global.player_[inp.key][what_player][1][action.run_toggle] = 20;
		global.player_[inp.key][what_player][1][action.left] = vk_left;
		global.player_[inp.key][what_player][1][action.right] = vk_right;
		global.player_[inp.key][what_player][1][action.down] = vk_down;
		global.player_[inp.key][what_player][1][action.up] = vk_up;
		global.player_[inp.key][what_player][1][action.tongue] = noone;
		global.player_[inp.key][what_player][1][action.zoom_in] = 187;
		global.player_[inp.key][what_player][1][action.zoom_out] = 189;
		global.player_[inp.key][what_player][1][action.accept] = ord("Z");
		global.player_[inp.key][what_player][1][action.back] = ord("X");
		#endregion /* Player 1 Key 1 defaults END */
		
		#region /* Player 1 Key 2 defaults */
		/* global.player_[keyboard/gamepad][player][key1/key2][action] */
		global.player_[inp.key][what_player][2][action.dive] = noone;
		global.player_[inp.key][what_player][2][action.jump] = vk_space;
		global.player_[inp.key][what_player][2][action.double_jump] = vk_space;
		global.player_[inp.key][what_player][2][action.crouch] = vk_shift;
		global.player_[inp.key][what_player][2][action.crouch_toggle] = noone;
		global.player_[inp.key][what_player][2][action.run] = ord("X");
		global.player_[inp.key][what_player][2][action.run_toggle] = noone;
		global.player_[inp.key][what_player][2][action.left] = ord("A");
		global.player_[inp.key][what_player][2][action.right] = ord("D");
		global.player_[inp.key][what_player][2][action.down] = ord("S");
		global.player_[inp.key][what_player][2][action.up] = ord("W");
		global.player_[inp.key][what_player][2][action.tongue] = noone;
		global.player_[inp.key][what_player][2][action.zoom_in] = vk_add;
		global.player_[inp.key][what_player][2][action.zoom_out] = vk_subtract;
		global.player_[inp.key][what_player][2][action.accept] = vk_enter;
		global.player_[inp.key][what_player][2][action.back] = vk_backspace;
		#endregion /* Player 1 Key 2 defaults END */
		
	}
	else
	if (what_player >= 2)
	{
		
		#region /* Player Other Key 1 defaults */
		/* global.player_[keyboard/gamepad][player][key1/key2][action] */
		global.player_[inp.key][what_player][1][action.dive] = noone;
		global.player_[inp.key][what_player][1][action.jump] = noone;
		global.player_[inp.key][what_player][1][action.double_jump] = noone;
		global.player_[inp.key][what_player][1][action.crouch] = noone;
		global.player_[inp.key][what_player][1][action.crouch_toggle] = noone;
		global.player_[inp.key][what_player][1][action.run] = noone;
		global.player_[inp.key][what_player][1][action.run_toggle] = noone;
		global.player_[inp.key][what_player][1][action.left] = noone;
		global.player_[inp.key][what_player][1][action.right] = noone;
		global.player_[inp.key][what_player][1][action.down] = noone;
		global.player_[inp.key][what_player][1][action.up] = noone;
		global.player_[inp.key][what_player][1][action.tongue] = noone;
		global.player_[inp.key][what_player][1][action.zoom_in] = noone;
		global.player_[inp.key][what_player][1][action.zoom_out] = noone;
		global.player_[inp.key][what_player][1][action.accept] = noone;
		global.player_[inp.key][what_player][1][action.back] = noone;
		#endregion /* Player Other Key 1 defaults END */
		
		#region /* Player Other Key 2 defaults */
		/* global.player_[keyboard/gamepad][player][key1/key2][action] */
		global.player_[inp.key][what_player][2][action.dive] = noone;
		global.player_[inp.key][what_player][2][action.jump] = noone;
		global.player_[inp.key][what_player][2][action.double_jump] = noone;
		global.player_[inp.key][what_player][2][action.crouch] = noone;
		global.player_[inp.key][what_player][2][action.crouch_toggle] = noone;
		global.player_[inp.key][what_player][2][action.run] = noone;
		global.player_[inp.key][what_player][2][action.run_toggle] = noone;
		global.player_[inp.key][what_player][2][action.left] = noone;
		global.player_[inp.key][what_player][2][action.right] = noone;
		global.player_[inp.key][what_player][2][action.down] = noone;
		global.player_[inp.key][what_player][2][action.up] = noone;
		global.player_[inp.key][what_player][2][action.tongue] = noone;
		global.player_[inp.key][what_player][2][action.zoom_in] = noone;
		global.player_[inp.key][what_player][2][action.zoom_out] = noone;
		global.player_[inp.key][what_player][2][action.accept] = noone;
		global.player_[inp.key][what_player][2][action.back] = noone;
		#endregion /* Player Other Key 2 defaults END */
		
	}
	
	global.player_up_is_also_jump[what_player] = false;
	global.player_double_jump_uses_jump_key[what_player] = true;
	global.player_down_is_also_crouch[what_player] = true;
	global.player_double_tap_to_run[what_player] = true;
	global.player_run_toggle[what_player] = false;
	global.player_double_tap_to_dive[what_player] = false;
	global.player_cancel_dive_by_jump_or_dive[what_player] = false;
	global.player_cancel_dive_by_opposite_direction[what_player] = false;
	global.player_down_and_jump_to_groundpound[what_player] = false;
	global.player_wall_jump_setting[what_player] = 1;
	global.player_drop_from_rope[what_player] = 1;
	global.player_show_controls[what_player] = 0; /* Needs to be set to 0 by default for best performance */
	#endregion /* Player Keyboard Remapping END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	if (save_default_controls_to_config) {
		scr_save_player_control_profile(what_player, 0);
	}
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}