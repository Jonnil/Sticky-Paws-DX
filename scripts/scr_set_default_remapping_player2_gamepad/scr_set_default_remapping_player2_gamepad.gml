function scr_set_default_remapping_player2_gamepad(save_default_controls_to_config = false)
{
	
	#region /* Player 2 Gamepad Remapping */
	
	#region /* Player 2 Gamepad 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][2][1][action.dive] = gp_face3;
	global.player_[inp.gp][2][1][action.jump] = gp_face1;
	global.player_[inp.gp][2][1][action.crouch] = gp_padd;
	global.player_[inp.gp][2][1][action.crouch_toggle] = noone;
	global.player_[inp.gp][2][1][action.sprint] = gp_face3;
	global.player_[inp.gp][2][1][action.sprint_toggle] = noone;
	global.player_[inp.gp][2][1][action.left] = gp_padl;
	global.player_[inp.gp][2][1][action.right] = gp_padr;
	global.player_[inp.gp][2][1][action.down] = gp_padd;
	global.player_[inp.gp][2][1][action.up] = gp_padu;
	global.player_[inp.gp][2][1][action.tongue] = noone;
	global.player_[inp.gp][2][1][action.zoom_in] = joystick_value.joyright_up;
	global.player_[inp.gp][2][1][action.zoom_out] = joystick_value.joyright_down;
	if (os_type == os_switch)
	{
		global.player_[inp.gp][2][1][action.accept] = gp_face2;
		global.player_[inp.gp][2][1][action.back] = gp_face1;
	}
	else
	{
		global.player_[inp.gp][2][1][action.accept] = gp_face1;
		global.player_[inp.gp][2][1][action.back] = gp_face2;
	}
	#endregion /* Player 2 Gamepad 1 defaults END */
	
	#region /* Player 2 Gamepad 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][2][2][action.dive] = noone;
	global.player_[inp.gp][2][2][action.jump] = noone;
	global.player_[inp.gp][2][2][action.crouch] = joystick_value.joyleft_down;
	global.player_[inp.gp][2][2][action.crouch_toggle] = noone;
	global.player_[inp.gp][2][2][action.sprint] = gp_shoulderrb;
	global.player_[inp.gp][2][2][action.sprint_toggle] = noone;
	global.player_[inp.gp][2][2][action.left] = joystick_value.joyleft_left;
	global.player_[inp.gp][2][2][action.right] = joystick_value.joyleft_right;
	global.player_[inp.gp][2][2][action.down] = joystick_value.joyleft_down;
	global.player_[inp.gp][2][2][action.up] = joystick_value.joyleft_up;
	global.player_[inp.gp][2][2][action.tongue] = noone;
	global.player_[inp.gp][2][2][action.zoom_in] = noone;
	global.player_[inp.gp][2][2][action.zoom_out] = noone;
	global.player_[inp.gp][2][2][action.accept] = noone;
	global.player_[inp.gp][2][2][action.back] = noone;
	#endregion /* Player 2 Gamepad 2 defaults END */
	
	global.player2_up_is_also_jump = false;
	global.player2_double_tap_to_run = true;
	global.player2_sprint_toggle = false;
	global.player2_double_tap_to_dive = false;
	global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player2_cancel_dive_by_pressing_opposite_direction = false;
	global.player2_down_and_jump_to_groundpound = false;
	global.player2_wall_jump_setting = 1;
	global.player2_drop_from_rope = 1;
	global.player2_show_controls = 1;
	#endregion /* Player 2 Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	if (save_default_controls_to_config == true)
	{
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "player2_gamepad_button_dive", global.player_[inp.gp][2][1][action.dive]);
		ini_write_real("config", "player2_gamepad_button2_dive", global.player_[inp.gp][2][2][action.dive]);
		ini_write_real("config", "player2_gamepad_button_jump", global.player_[inp.gp][2][1][action.jump]);
		ini_write_real("config", "player2_gamepad_button2_jump", global.player_[inp.gp][2][2][action.jump]);
		ini_write_real("config", "player2_gamepad_button_crouch", global.player_[inp.gp][2][1][action.crouch]);
		ini_write_real("config", "player2_gamepad_button2_crouch", global.player_[inp.gp][2][2][action.crouch]);
		ini_write_real("config", "player2_gamepad_button_crouch_toggle", global.player_[inp.gp][2][1][action.crouch_toggle]);
		ini_write_real("config", "player2_gamepad_button2_crouch_toggle", global.player_[inp.gp][2][2][action.crouch_toggle]);
		ini_write_real("config", "player2_gamepad_button_sprint", global.player_[inp.gp][2][1][action.sprint]);
		ini_write_real("config", "player2_gamepad_button2_sprint", global.player_[inp.gp][2][2][action.sprint]);
		ini_write_real("config", "player2_gamepad_button_sprint_toggle", global.player_[inp.gp][2][1][action.sprint_toggle]);
		ini_write_real("config", "player2_gamepad_button2_sprint_toggle", global.player_[inp.gp][2][2][action.sprint_toggle]);
		ini_write_real("config", "player2_gamepad_button_left", global.player_[inp.gp][2][1][action.left]);
		ini_write_real("config", "player2_gamepad_button2_left", global.player_[inp.gp][2][2][action.left]);
		ini_write_real("config", "player2_gamepad_button_right", global.player_[inp.gp][2][1][action.right]);
		ini_write_real("config", "player2_gamepad_button2_right", global.player_[inp.gp][2][2][action.right]);
		ini_write_real("config", "player2_gamepad_button_down", global.player_[inp.gp][2][1][action.down]);
		ini_write_real("config", "player2_gamepad_button2_down", global.player_[inp.gp][2][2][action.down]);
		ini_write_real("config", "player2_gamepad_button_up", global.player_[inp.gp][2][1][action.up]);
		ini_write_real("config", "player2_gamepad_button2_up", global.player_[inp.gp][2][2][action.up]);
		ini_write_real("config", "player2_gamepad_button_tongue", global.player_[inp.gp][2][1][action.tongue]);
		ini_write_real("config", "player2_gamepad_button2_tongue", global.player_[inp.gp][2][2][action.tongue]);
		ini_write_real("config", "player2_gamepad_button_zoom_in", global.player_[inp.gp][2][1][action.zoom_in]);
		ini_write_real("config", "player2_gamepad_button2_zoom_in", global.player_[inp.gp][2][2][action.zoom_in]);
		ini_write_real("config", "player2_gamepad_button_zoom_out", global.player_[inp.gp][2][1][action.zoom_out]);
		ini_write_real("config", "player2_gamepad_button2_zoom_out", global.player_[inp.gp][2][2][action.zoom_out]);
		ini_write_real("config", "player2_gamepad_button_accept", global.player_[inp.gp][2][1][action.accept]);
		ini_write_real("config", "player2_gamepad_button2_accept", global.player_[inp.gp][2][2][action.accept]);
		ini_write_real("config", "player2_gamepad_button_back", global.player_[inp.gp][2][1][action.back]);
		ini_write_real("config", "player2_gamepad_button2_back", global.player_[inp.gp][2][2][action.back]);
		ini_write_real("config", "player2_up_is_also_jump", global.player2_up_is_also_jump);
		ini_write_real("config", "player2_double_tap_to_run", global.player2_double_tap_to_run);
		ini_write_real("config", "player2_sprint_toggle", global.player2_sprint_toggle);
		ini_write_real("config", "player2_double_tap_to_dive", global.player2_double_tap_to_dive);
		ini_write_real("config", "player2_cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
		ini_write_real("config", "player2_cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
		ini_write_real("config", "player2_down_and_jump_to_groundpound", global.player2_down_and_jump_to_groundpound);
		ini_write_real("config", "player2_wall_jump_setting", global.player2_wall_jump_setting);
		ini_write_real("config", "player2_drop_from_rope", global.player2_drop_from_rope);
		ini_write_real("config", "player2_show_controls", global.player2_show_controls);
		ini_close();
	}
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}