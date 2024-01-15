function scr_set_default_remapping_player1_gamepad(save_default_controls_to_config = false)
{
	
	#region /* Player 1 Gamepad Remapping */
	
	#region /* Player 1 Gamepad 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][1][1][action.dive] = gp_face3;
	global.player_[inp.gp][1][1][action.jump] = gp_face1;
	global.player_[inp.gp][1][1][action.double_jump] = gp_face1;
	global.player_[inp.gp][1][1][action.crouch] = gp_padd;
	global.player_[inp.gp][1][1][action.crouch_toggle] = noone;
	global.player_[inp.gp][1][1][action.run] = gp_face3;
	global.player_[inp.gp][1][1][action.run_toggle] = noone;
	global.player_[inp.gp][1][1][action.left] = gp_padl;
	global.player_[inp.gp][1][1][action.right] = gp_padr;
	global.player_[inp.gp][1][1][action.down] = gp_padd;
	global.player_[inp.gp][1][1][action.up] = gp_padu;
	global.player_[inp.gp][1][1][action.tongue] = noone;
	global.player_[inp.gp][1][1][action.zoom_in] = JOYSTICK_VALUE.JOYRIGHT_UP;
	global.player_[inp.gp][1][1][action.zoom_out] = JOYSTICK_VALUE.JOYRIGHT_DOWN;
	if (os_type == os_switch)
	{
		global.player_[inp.gp][1][1][action.accept] = gp_face2;
		global.player_[inp.gp][1][1][action.back] = gp_face1;
	}
	else
	{
		global.player_[inp.gp][1][1][action.accept] = gp_face1;
		global.player_[inp.gp][1][1][action.back] = gp_face2;
	}
	#endregion /* Player 1 Gamepad 1 defaults END */
	
	#region /* Player 1 Gamepad 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][1][2][action.dive] = noone;
	global.player_[inp.gp][1][2][action.jump] = noone;
	global.player_[inp.gp][1][2][action.double_jump] = noone;
	global.player_[inp.gp][1][2][action.crouch] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][1][2][action.crouch_toggle] = noone;
	global.player_[inp.gp][1][2][action.run] = gp_shoulderrb;
	global.player_[inp.gp][1][2][action.run_toggle] = noone;
	global.player_[inp.gp][1][2][action.left] = JOYSTICK_VALUE.JOYLEFT_LEFT;
	global.player_[inp.gp][1][2][action.right] = JOYSTICK_VALUE.JOYLEFT_RIGHT;
	global.player_[inp.gp][1][2][action.down] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][1][2][action.up] = JOYSTICK_VALUE.JOYLEFT_UP;
	global.player_[inp.gp][1][2][action.tongue] = noone;
	global.player_[inp.gp][1][2][action.zoom_in] = noone;
	global.player_[inp.gp][1][2][action.zoom_out] = noone;
	global.player_[inp.gp][1][2][action.accept] = noone;
	global.player_[inp.gp][1][2][action.back] = noone;
	#endregion /* Player 1 Gamepad 2 defaults END */
	
	global.player_up_is_also_jump[1] = false;
	global.player_down_is_also_crouch[1] = true;
	global.player_double_tap_to_run[1] = true;
	global.player_run_toggle[1] = false;
	global.player_double_tap_to_dive[1] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[1] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[1] = false;
	global.player_down_and_jump_to_groundpound[1] = false;
	global.player_wall_jump_setting[1] = 1;
	global.player_drop_from_rope[1] = 1;
	global.player_show_controls[1] = 1;
	#endregion /* Player 1 Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player1_profile" + string(global.player_profile[1])))
	{
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_dive", global.player_[inp.gp][1][1][action.dive]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_dive", global.player_[inp.gp][1][2][action.dive]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_jump", global.player_[inp.gp][1][1][action.jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_jump", global.player_[inp.gp][1][2][action.jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_double_jump", global.player_[inp.gp][1][1][action.double_jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_double_jump", global.player_[inp.gp][1][2][action.double_jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_crouch", global.player_[inp.gp][1][1][action.crouch]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_crouch", global.player_[inp.gp][1][2][action.crouch]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_crouch_toggle", global.player_[inp.gp][1][1][action.crouch_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_crouch_toggle", global.player_[inp.gp][1][2][action.crouch_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_run", global.player_[inp.gp][1][1][action.run]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_run", global.player_[inp.gp][1][2][action.run]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_run_toggle", global.player_[inp.gp][1][1][action.run_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_run_toggle", global.player_[inp.gp][1][2][action.run_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_left", global.player_[inp.gp][1][1][action.left]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_left", global.player_[inp.gp][1][2][action.left]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_right", global.player_[inp.gp][1][1][action.right]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_right", global.player_[inp.gp][1][2][action.right]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_down", global.player_[inp.gp][1][1][action.down]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_down", global.player_[inp.gp][1][2][action.down]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_up", global.player_[inp.gp][1][1][action.up]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_up", global.player_[inp.gp][1][2][action.up]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_tongue", global.player_[inp.gp][1][1][action.tongue]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_tongue", global.player_[inp.gp][1][2][action.tongue]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_zoom_in", global.player_[inp.gp][1][1][action.zoom_in]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_zoom_in", global.player_[inp.gp][1][2][action.zoom_in]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_zoom_out", global.player_[inp.gp][1][1][action.zoom_out]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_zoom_out", global.player_[inp.gp][1][2][action.zoom_out]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_accept", global.player_[inp.gp][1][1][action.accept]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_accept", global.player_[inp.gp][1][2][action.accept]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button_back", global.player_[inp.gp][1][1][action.back]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_gamepad_button2_back", global.player_[inp.gp][1][2][action.back]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_up_is_also_jump[1]", global.player_up_is_also_jump[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_down_is_also_crouch[1]", global.player_down_is_also_crouch[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_double_tap_to_run[1]", global.player_double_tap_to_run[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_run_toggle", global.player_run_toggle[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_double_tap_to_dive[1]", global.player_double_tap_to_dive[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_cancel_dive_by_pressing_jump_or_dive_button[1]", global.player_cancel_dive_by_pressing_jump_or_dive_button[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_cancel_dive_by_pressing_opposite_direction[1]", global.player_cancel_dive_by_pressing_opposite_direction[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_down_and_jump_to_groundpound[1]", global.player_down_and_jump_to_groundpound[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_wall_jump_setting", global.player_wall_jump_setting[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_drop_from_rope[1]", global.player_drop_from_rope[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_show_controls", global.player_show_controls[1]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player1_keyboard(save_default_controls_to_config = false)
{
	
	#region /* Player 1 Key Remapping */
	
	#region /* Player 1 Key 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][1][1][action.dive] = ord("X");
	global.player_[inp.key][1][1][action.jump] = ord("Z");
	global.player_[inp.key][1][1][action.double_jump] = ord("Z");
	global.player_[inp.key][1][1][action.crouch] = vk_down;
	global.player_[inp.key][1][1][action.crouch_toggle] = noone;
	global.player_[inp.key][1][1][action.run] = vk_lcontrol;
	global.player_[inp.key][1][1][action.run_toggle] = 20;
	global.player_[inp.key][1][1][action.left] = vk_left;
	global.player_[inp.key][1][1][action.right] = vk_right;
	global.player_[inp.key][1][1][action.down] = vk_down;
	global.player_[inp.key][1][1][action.up] = vk_up;
	global.player_[inp.key][1][1][action.tongue] = noone;
	global.player_[inp.key][1][1][action.zoom_in] = 187;
	global.player_[inp.key][1][1][action.zoom_out] = 189;
	global.player_[inp.key][1][1][action.accept] = ord("Z");
	global.player_[inp.key][1][1][action.back] = ord("X");
	#endregion /* Player 1 Key 1 defaults END */
	
	#region /* Player 1 Key 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][1][2][action.dive] = noone;
	global.player_[inp.key][1][2][action.jump] = vk_space;
	global.player_[inp.key][1][2][action.double_jump] = vk_space;
	global.player_[inp.key][1][2][action.crouch] = vk_shift;
	global.player_[inp.key][1][2][action.crouch_toggle] = noone;
	global.player_[inp.key][1][2][action.run] = ord("X");
	global.player_[inp.key][1][2][action.run_toggle] = noone;
	global.player_[inp.key][1][2][action.left] = ord("A");
	global.player_[inp.key][1][2][action.right] = ord("D");
	global.player_[inp.key][1][2][action.down] = ord("S");
	global.player_[inp.key][1][2][action.up] = ord("W");
	global.player_[inp.key][1][2][action.tongue] = noone;
	global.player_[inp.key][1][2][action.zoom_in] = vk_add;
	global.player_[inp.key][1][2][action.zoom_out] = vk_subtract;
	global.player_[inp.key][1][2][action.accept] = vk_enter;
	global.player_[inp.key][1][2][action.back] = vk_backspace;
	#endregion /* Player 1 Key 2 defaults END */
	
	global.player_up_is_also_jump[1] = false;
	global.player_down_is_also_crouch[1] = true;
	global.player_double_tap_to_run[1] = true;
	global.player_run_toggle[1] = false;
	global.player_double_tap_to_dive[1] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[1] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[1] = false;
	global.player_down_and_jump_to_groundpound[1] = false;
	global.player_wall_jump_setting[1] = 1;
	global.player_drop_from_rope[1] = 1;
	global.player_show_controls[1] = 1;
	#endregion /* Player 1 Keyboard Remapping END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player1_profile" + string(global.player_profile[1])))
	{
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_dive", global.player_[inp.key][1][1][action.dive]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_dive", global.player_[inp.key][1][2][action.dive]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_jump", global.player_[inp.key][1][1][action.jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_jump", global.player_[inp.key][1][2][action.jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_double_jump", global.player_[inp.key][1][1][action.double_jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_double_jump", global.player_[inp.key][1][2][action.double_jump]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_crouch", global.player_[inp.key][1][1][action.crouch]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_crouch", global.player_[inp.key][1][2][action.crouch]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_crouch_toggle", global.player_[inp.key][1][1][action.crouch_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_crouch_toggle", global.player_[inp.key][1][2][action.crouch_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_run", global.player_[inp.key][1][1][action.run]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_run", global.player_[inp.key][1][2][action.run]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_run_toggle", global.player_[inp.key][1][1][action.run_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_run_toggle", global.player_[inp.key][1][2][action.run_toggle]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_left", global.player_[inp.key][1][1][action.left]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_left", global.player_[inp.key][1][2][action.left]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_right", global.player_[inp.key][1][1][action.right]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_right", global.player_[inp.key][1][2][action.right]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_down", global.player_[inp.key][1][1][action.down]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_down", global.player_[inp.key][1][2][action.down]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_up", global.player_[inp.key][1][1][action.up]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_up", global.player_[inp.key][1][2][action.up]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_tongue", global.player_[inp.key][1][1][action.tongue]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_tongue", global.player_[inp.key][1][2][action.tongue]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_zoom_in", global.player_[inp.key][1][1][action.zoom_in]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_zoom_in", global.player_[inp.key][1][2][action.zoom_in]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_zoom_out", global.player_[inp.key][1][1][action.zoom_out]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_zoom_out", global.player_[inp.key][1][2][action.zoom_out]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_accept", global.player_[inp.key][1][1][action.accept]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_accept", global.player_[inp.key][1][2][action.accept]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key_back", global.player_[inp.key][1][1][action.back]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_key2_back", global.player_[inp.key][1][2][action.back]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_up_is_also_jump[1]", global.player_up_is_also_jump[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_down_is_also_crouch[1]", global.player_down_is_also_crouch[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_double_tap_to_run[1]", global.player_double_tap_to_run[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_run_toggle", global.player_run_toggle[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_double_tap_to_dive[1]", global.player_double_tap_to_dive[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_cancel_dive_by_pressing_jump_or_dive_button[1]", global.player_cancel_dive_by_pressing_jump_or_dive_button[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_cancel_dive_by_pressing_opposite_direction[1]", global.player_cancel_dive_by_pressing_opposite_direction[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_down_and_jump_to_groundpound[1]", global.player_down_and_jump_to_groundpound[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_wall_jump_setting", global.player_wall_jump_setting[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player_drop_from_rope[1]", global.player_drop_from_rope[1]);
		ini_write_real("player1_profile" + string(global.player_profile[1]), "player1_show_controls", global.player_show_controls[1]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player2_gamepad(save_default_controls_to_config = false)
{
	
	#region /* Player 2 Gamepad Remapping */
	
	#region /* Player 2 Gamepad 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][2][1][action.dive] = gp_face3;
	global.player_[inp.gp][2][1][action.jump] = gp_face1;
	global.player_[inp.gp][2][1][action.double_jump] = gp_face1;
	global.player_[inp.gp][2][1][action.crouch] = gp_padd;
	global.player_[inp.gp][2][1][action.crouch_toggle] = noone;
	global.player_[inp.gp][2][1][action.run] = gp_face3;
	global.player_[inp.gp][2][1][action.run_toggle] = noone;
	global.player_[inp.gp][2][1][action.left] = gp_padl;
	global.player_[inp.gp][2][1][action.right] = gp_padr;
	global.player_[inp.gp][2][1][action.down] = gp_padd;
	global.player_[inp.gp][2][1][action.up] = gp_padu;
	global.player_[inp.gp][2][1][action.tongue] = noone;
	global.player_[inp.gp][2][1][action.zoom_in] = JOYSTICK_VALUE.JOYRIGHT_UP;
	global.player_[inp.gp][2][1][action.zoom_out] = JOYSTICK_VALUE.JOYRIGHT_DOWN;
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
	global.player_[inp.gp][2][2][action.double_jump] = noone;
	global.player_[inp.gp][2][2][action.crouch] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][2][2][action.crouch_toggle] = noone;
	global.player_[inp.gp][2][2][action.run] = gp_shoulderrb;
	global.player_[inp.gp][2][2][action.run_toggle] = noone;
	global.player_[inp.gp][2][2][action.left] = JOYSTICK_VALUE.JOYLEFT_LEFT;
	global.player_[inp.gp][2][2][action.right] = JOYSTICK_VALUE.JOYLEFT_RIGHT;
	global.player_[inp.gp][2][2][action.down] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][2][2][action.up] = JOYSTICK_VALUE.JOYLEFT_UP;
	global.player_[inp.gp][2][2][action.tongue] = noone;
	global.player_[inp.gp][2][2][action.zoom_in] = noone;
	global.player_[inp.gp][2][2][action.zoom_out] = noone;
	global.player_[inp.gp][2][2][action.accept] = noone;
	global.player_[inp.gp][2][2][action.back] = noone;
	#endregion /* Player 2 Gamepad 2 defaults END */
	
	global.player_up_is_also_jump[2] = false;
	global.player_down_is_also_crouch[2] = true;
	global.player_double_tap_to_run[2] = true;
	global.player_run_toggle[2] = false;
	global.player_double_tap_to_dive[2] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[2] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[2] = false;
	global.player_down_and_jump_to_groundpound[2] = false;
	global.player_wall_jump_setting[2] = 1;
	global.player_drop_from_rope[2] = 1;
	global.player_show_controls[2] = 1;
	#endregion /* Player 2 Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player2_profile" + string(global.player_profile[2])))
	{
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_dive", global.player_[inp.gp][2][1][action.dive]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_dive", global.player_[inp.gp][2][2][action.dive]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_jump", global.player_[inp.gp][2][1][action.jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_jump", global.player_[inp.gp][2][2][action.jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_double_jump", global.player_[inp.gp][2][1][action.double_jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_double_jump", global.player_[inp.gp][2][2][action.double_jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_crouch", global.player_[inp.gp][2][1][action.crouch]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_crouch", global.player_[inp.gp][2][2][action.crouch]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_crouch_toggle", global.player_[inp.gp][2][1][action.crouch_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_crouch_toggle", global.player_[inp.gp][2][2][action.crouch_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_run", global.player_[inp.gp][2][1][action.run]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_run", global.player_[inp.gp][2][2][action.run]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_run_toggle", global.player_[inp.gp][2][1][action.run_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_run_toggle", global.player_[inp.gp][2][2][action.run_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_left", global.player_[inp.gp][2][1][action.left]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_left", global.player_[inp.gp][2][2][action.left]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_right", global.player_[inp.gp][2][1][action.right]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_right", global.player_[inp.gp][2][2][action.right]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_down", global.player_[inp.gp][2][1][action.down]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_down", global.player_[inp.gp][2][2][action.down]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_up", global.player_[inp.gp][2][1][action.up]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_up", global.player_[inp.gp][2][2][action.up]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_tongue", global.player_[inp.gp][2][1][action.tongue]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_tongue", global.player_[inp.gp][2][2][action.tongue]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_zoom_in", global.player_[inp.gp][2][1][action.zoom_in]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_zoom_in", global.player_[inp.gp][2][2][action.zoom_in]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_zoom_out", global.player_[inp.gp][2][1][action.zoom_out]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_zoom_out", global.player_[inp.gp][2][2][action.zoom_out]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_accept", global.player_[inp.gp][2][1][action.accept]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_accept", global.player_[inp.gp][2][2][action.accept]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button_back", global.player_[inp.gp][2][1][action.back]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_gamepad_button2_back", global.player_[inp.gp][2][2][action.back]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_up_is_also_jump[2]", global.player_up_is_also_jump[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_down_is_also_crouch[2]", global.player_down_is_also_crouch[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_double_tap_to_run[2]", global.player_double_tap_to_run[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_run_toggle", global.player_run_toggle[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_double_tap_to_dive[2]", global.player_double_tap_to_dive[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_cancel_dive_by_pressing_jump_or_dive_button[2]", global.player_cancel_dive_by_pressing_jump_or_dive_button[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_cancel_dive_by_pressing_opposite_direction[2]", global.player_cancel_dive_by_pressing_opposite_direction[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_down_and_jump_to_groundpound[2]", global.player_down_and_jump_to_groundpound[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_wall_jump_setting", global.player_wall_jump_setting[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_drop_from_rope[2]", global.player_drop_from_rope[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_show_controls", global.player_show_controls[2]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player2_keyboard(save_default_controls_to_config = false)
{
	
	#region /* Player 2 Key Remapping (everything should be set to noone) */
	
	#region /* Player 2 Key 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][2][1][action.dive] = noone;
	global.player_[inp.key][2][1][action.jump] = noone;
	global.player_[inp.key][2][1][action.double_jump] = noone;
	global.player_[inp.key][2][1][action.crouch] = noone;
	global.player_[inp.key][2][1][action.crouch_toggle] = noone;
	global.player_[inp.key][2][1][action.run] = noone;
	global.player_[inp.key][2][1][action.run_toggle] = noone;
	global.player_[inp.key][2][1][action.left] = noone;
	global.player_[inp.key][2][1][action.right] = noone;
	global.player_[inp.key][2][1][action.down] = noone;
	global.player_[inp.key][2][1][action.up] = noone;
	global.player_[inp.key][2][1][action.tongue] = noone;
	global.player_[inp.key][2][1][action.zoom_in] = noone;
	global.player_[inp.key][2][1][action.zoom_out] = noone;
	global.player_[inp.key][2][1][action.accept] = noone;
	global.player_[inp.key][2][1][action.back] = noone;
	#endregion /* Player 2 Key 1 defaults END */
	
	#region /* Player 1 Key 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][2][2][action.dive] = noone;
	global.player_[inp.key][2][2][action.jump] = noone;
	global.player_[inp.key][2][2][action.double_jump] = noone;
	global.player_[inp.key][2][2][action.crouch] = noone;
	global.player_[inp.key][2][2][action.crouch_toggle] = noone;
	global.player_[inp.key][2][2][action.run] = noone;
	global.player_[inp.key][2][2][action.run_toggle] = noone;
	global.player_[inp.key][2][2][action.left] = noone;
	global.player_[inp.key][2][2][action.right] = noone;
	global.player_[inp.key][2][2][action.down] = noone;
	global.player_[inp.key][2][2][action.up] = noone;
	global.player_[inp.key][2][2][action.tongue] = noone;
	global.player_[inp.key][2][2][action.zoom_in] = noone;
	global.player_[inp.key][2][2][action.zoom_out] = noone;
	global.player_[inp.key][2][2][action.accept] = noone;
	global.player_[inp.key][2][2][action.back] = noone;
	#endregion /* Player 2 Key 2 defaults END */
	
	global.player_up_is_also_jump[2] = false;
	global.player_down_is_also_crouch[2] = true;
	global.player_double_tap_to_run[2] = true;
	global.player_run_toggle[2] = false;
	global.player_double_tap_to_dive[2] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[2] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[2] = false;
	global.player_down_and_jump_to_groundpound[2] = false;
	global.player_wall_jump_setting[2] = 1;
	global.player_drop_from_rope[2] = 1;
	global.player_show_controls[2] = 1;
	#endregion /* Player 2 Keyboard Remapping (everything should be set to noone) END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player2_profile" + string(global.player_profile[2])))
	{
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_dive", global.player_[inp.key][2][1][action.dive]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_dive", global.player_[inp.key][2][2][action.dive]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_jump", global.player_[inp.key][2][1][action.jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_jump", global.player_[inp.key][2][2][action.jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_double_jump", global.player_[inp.key][2][1][action.double_jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_double_jump", global.player_[inp.key][2][2][action.double_jump]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_crouch", global.player_[inp.key][2][1][action.crouch]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_crouch", global.player_[inp.key][2][2][action.crouch]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_crouch_toggle", global.player_[inp.key][2][1][action.crouch_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_crouch_toggle", global.player_[inp.key][2][2][action.crouch_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_run", global.player_[inp.key][2][1][action.run]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_run", global.player_[inp.key][2][2][action.run]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_run_toggle", global.player_[inp.key][2][1][action.run_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_run_toggle", global.player_[inp.key][2][2][action.run_toggle]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_left", global.player_[inp.key][2][1][action.left]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_left", global.player_[inp.key][2][2][action.left]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_right", global.player_[inp.key][2][1][action.right]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_right", global.player_[inp.key][2][2][action.right]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_down", global.player_[inp.key][2][1][action.down]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_down", global.player_[inp.key][2][2][action.down]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_up", global.player_[inp.key][2][1][action.up]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_up", global.player_[inp.key][2][2][action.up]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_tongue", global.player_[inp.key][2][1][action.tongue]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_tongue", global.player_[inp.key][2][2][action.tongue]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_zoom_in", global.player_[inp.key][2][1][action.zoom_in]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_zoom_in", global.player_[inp.key][2][2][action.zoom_in]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_zoom_out", global.player_[inp.key][2][1][action.zoom_out]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_zoom_out", global.player_[inp.key][2][2][action.zoom_out]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_accept", global.player_[inp.key][2][1][action.accept]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_accept", global.player_[inp.key][2][2][action.accept]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key_back", global.player_[inp.key][2][1][action.back]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_key2_back", global.player_[inp.key][2][2][action.back]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_up_is_also_jump[2]", global.player_up_is_also_jump[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_down_is_also_crouch[2]", global.player_down_is_also_crouch[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_double_tap_to_run[2]", global.player_double_tap_to_run[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_run_toggle", global.player_run_toggle[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_double_tap_to_dive[2]", global.player_double_tap_to_dive[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_cancel_dive_by_pressing_jump_or_dive_button[2]", global.player_cancel_dive_by_pressing_jump_or_dive_button[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_cancel_dive_by_pressing_opposite_direction[2]", global.player_cancel_dive_by_pressing_opposite_direction[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_down_and_jump_to_groundpound[2]", global.player_down_and_jump_to_groundpound[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_wall_jump_setting", global.player_wall_jump_setting[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player_drop_from_rope[2]", global.player_drop_from_rope[2]);
		ini_write_real("player2_profile" + string(global.player_profile[2]), "player2_show_controls", global.player_show_controls[2]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player3_gamepad(save_default_controls_to_config = false)
{
	
	#region /* Player 3 Gamepad Remapping */
	
	#region /* Player 3 Gamepad 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][3][1][action.dive] = gp_face3;
	global.player_[inp.gp][3][1][action.jump] = gp_face1;
	global.player_[inp.gp][3][1][action.double_jump] = gp_face1;
	global.player_[inp.gp][3][1][action.crouch] = gp_padd;
	global.player_[inp.gp][3][1][action.crouch_toggle] = noone;
	global.player_[inp.gp][3][1][action.run] = gp_face3;
	global.player_[inp.gp][3][1][action.run_toggle] = noone;
	global.player_[inp.gp][3][1][action.left] = gp_padl;
	global.player_[inp.gp][3][1][action.right] = gp_padr;
	global.player_[inp.gp][3][1][action.down] = gp_padd;
	global.player_[inp.gp][3][1][action.up] = gp_padu;
	global.player_[inp.gp][3][1][action.tongue] = noone;
	global.player_[inp.gp][3][1][action.zoom_in] = JOYSTICK_VALUE.JOYRIGHT_UP;
	global.player_[inp.gp][3][1][action.zoom_out] = JOYSTICK_VALUE.JOYRIGHT_DOWN;
	if (os_type == os_switch)
	{
		global.player_[inp.gp][3][1][action.accept] = gp_face2;
		global.player_[inp.gp][3][1][action.back] = gp_face1;
	}
	else
	{
		global.player_[inp.gp][3][1][action.accept] = gp_face1;
		global.player_[inp.gp][3][1][action.back] = gp_face2;
	}
	#endregion /* Player 3 Gamepad 1 defaults END */
	
	#region /* Player 3 Gamepad 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][3][2][action.dive] = noone;
	global.player_[inp.gp][3][2][action.jump] = noone;
	global.player_[inp.gp][3][2][action.double_jump] = noone;
	global.player_[inp.gp][3][2][action.crouch] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][3][2][action.crouch_toggle] = noone;
	global.player_[inp.gp][3][2][action.run] = gp_shoulderrb;
	global.player_[inp.gp][3][2][action.run_toggle] = noone;
	global.player_[inp.gp][3][2][action.left] = JOYSTICK_VALUE.JOYLEFT_LEFT;
	global.player_[inp.gp][3][2][action.right] = JOYSTICK_VALUE.JOYLEFT_RIGHT;
	global.player_[inp.gp][3][2][action.down] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][3][2][action.up] = JOYSTICK_VALUE.JOYLEFT_UP;
	global.player_[inp.gp][3][2][action.tongue] = noone;
	global.player_[inp.gp][3][2][action.zoom_in] = noone;
	global.player_[inp.gp][3][2][action.zoom_out] = noone;
	global.player_[inp.gp][3][2][action.accept] = noone;
	global.player_[inp.gp][3][2][action.back] = noone;
	#endregion /* Player 3 Gamepad 2 defaults END */
	
	global.player_up_is_also_jump[3] = false;
	global.player_down_is_also_crouch[3] = true;
	global.player_double_tap_to_run[3] = true;
	global.player_run_toggle[3] = false;
	global.player_double_tap_to_dive[3] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[3] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[3] = false;
	global.player_down_and_jump_to_groundpound[3] = false;
	global.player_wall_jump_setting[3] = 1;
	global.player_drop_from_rope[3] = 1;
	global.player_show_controls[3] = 1;
	#endregion /* Player 3 Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player3_profile" + string(global.player_profile[3])))
	{
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_dive", global.player_[inp.gp][3][1][action.dive]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_dive", global.player_[inp.gp][3][2][action.dive]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_jump", global.player_[inp.gp][3][1][action.jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_jump", global.player_[inp.gp][3][2][action.jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_double_jump", global.player_[inp.gp][3][1][action.double_jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_double_jump", global.player_[inp.gp][3][2][action.double_jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_crouch", global.player_[inp.gp][3][1][action.crouch]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_crouch", global.player_[inp.gp][3][2][action.crouch]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_crouch_toggle", global.player_[inp.gp][3][1][action.crouch_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_crouch_toggle", global.player_[inp.gp][3][2][action.crouch_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_run", global.player_[inp.gp][3][1][action.run]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_run", global.player_[inp.gp][3][2][action.run]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_run_toggle", global.player_[inp.gp][3][1][action.run_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_run_toggle", global.player_[inp.gp][3][2][action.run_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_left", global.player_[inp.gp][3][1][action.left]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_left", global.player_[inp.gp][3][2][action.left]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_right", global.player_[inp.gp][3][1][action.right]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_right", global.player_[inp.gp][3][2][action.right]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_down", global.player_[inp.gp][3][1][action.down]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_down", global.player_[inp.gp][3][2][action.down]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_up", global.player_[inp.gp][3][1][action.up]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_up", global.player_[inp.gp][3][2][action.up]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_tongue", global.player_[inp.gp][3][1][action.tongue]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_tongue", global.player_[inp.gp][3][2][action.tongue]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_zoom_in", global.player_[inp.gp][3][1][action.zoom_in]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_zoom_in", global.player_[inp.gp][3][2][action.zoom_in]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_zoom_out", global.player_[inp.gp][3][1][action.zoom_out]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_zoom_out", global.player_[inp.gp][3][2][action.zoom_out]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_accept", global.player_[inp.gp][3][1][action.accept]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_accept", global.player_[inp.gp][3][2][action.accept]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button_back", global.player_[inp.gp][3][1][action.back]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_gamepad_button2_back", global.player_[inp.gp][3][2][action.back]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_up_is_also_jump[3]", global.player_up_is_also_jump[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_down_is_also_crouch[3]", global.player_down_is_also_crouch[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_double_tap_to_run[3]", global.player_double_tap_to_run[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_run_toggle", global.player_run_toggle[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_double_tap_to_dive[3]", global.player_double_tap_to_dive[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_cancel_dive_by_pressing_jump_or_dive_button[3]", global.player_cancel_dive_by_pressing_jump_or_dive_button[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_cancel_dive_by_pressing_opposite_direction[3]", global.player_cancel_dive_by_pressing_opposite_direction[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_down_and_jump_to_groundpound[3]", global.player_down_and_jump_to_groundpound[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_wall_jump_setting", global.player_wall_jump_setting[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_drop_from_rope[3]", global.player_drop_from_rope[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_show_controls", global.player_show_controls[3]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player3_keyboard(save_default_controls_to_config = false)
{
	
	#region /* Player 3 Key Remapping (everything should be set to noone) */
	
	#region /* Player 3 Key 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][3][1][action.dive] = noone;
	global.player_[inp.key][3][1][action.jump] = noone;
	global.player_[inp.key][3][1][action.double_jump] = noone;
	global.player_[inp.key][3][1][action.crouch] = noone;
	global.player_[inp.key][3][1][action.crouch_toggle] = noone;
	global.player_[inp.key][3][1][action.run] = noone;
	global.player_[inp.key][3][1][action.run_toggle] = noone;
	global.player_[inp.key][3][1][action.left] = noone;
	global.player_[inp.key][3][1][action.right] = noone;
	global.player_[inp.key][3][1][action.down] = noone;
	global.player_[inp.key][3][1][action.up] = noone;
	global.player_[inp.key][3][1][action.tongue] = noone;
	global.player_[inp.key][3][1][action.zoom_in] = noone;
	global.player_[inp.key][3][1][action.zoom_out] = noone;
	global.player_[inp.key][3][1][action.accept] = noone;
	global.player_[inp.key][3][1][action.back] = noone;
	#endregion /* Player 3 Key 1 defaults END */
	
	#region /* Player 1 Key 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][3][2][action.dive] = noone;
	global.player_[inp.key][3][2][action.jump] = noone;
	global.player_[inp.key][3][2][action.double_jump] = noone;
	global.player_[inp.key][3][2][action.crouch] = noone;
	global.player_[inp.key][3][2][action.crouch_toggle] = noone;
	global.player_[inp.key][3][2][action.run] = noone;
	global.player_[inp.key][3][2][action.run_toggle] = noone;
	global.player_[inp.key][3][2][action.left] = noone;
	global.player_[inp.key][3][2][action.right] = noone;
	global.player_[inp.key][3][2][action.down] = noone;
	global.player_[inp.key][3][2][action.up] = noone;
	global.player_[inp.key][3][2][action.tongue] = noone;
	global.player_[inp.key][3][2][action.zoom_in] = noone;
	global.player_[inp.key][3][2][action.zoom_out] = noone;
	global.player_[inp.key][3][2][action.accept] = noone;
	global.player_[inp.key][3][2][action.back] = noone;
	#endregion /* Player 3 Key 2 defaults END */
	
	global.player_up_is_also_jump[3] = false;
	global.player_down_is_also_crouch[3] = true;
	global.player_double_tap_to_run[3] = true;
	global.player_run_toggle[3] = false;
	global.player_double_tap_to_dive[3] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[3] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[3] = false;
	global.player_down_and_jump_to_groundpound[3] = false;
	global.player_wall_jump_setting[3] = 1;
	global.player_drop_from_rope[3] = 1;
	global.player_show_controls[3] = 1;
	#endregion /* Player 3 Keyboard Remapping (everything should be set to noone) END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player3_profile" + string(global.player_profile[3])))
	{
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_dive", global.player_[inp.key][3][1][action.dive]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_dive", global.player_[inp.key][3][2][action.dive]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_jump", global.player_[inp.key][3][1][action.jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_jump", global.player_[inp.key][3][2][action.jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_double_jump", global.player_[inp.key][3][1][action.double_jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_double_jump", global.player_[inp.key][3][2][action.double_jump]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_crouch", global.player_[inp.key][3][1][action.crouch]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_crouch", global.player_[inp.key][3][2][action.crouch]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_crouch_toggle", global.player_[inp.key][3][1][action.crouch_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_crouch_toggle", global.player_[inp.key][3][2][action.crouch_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_run", global.player_[inp.key][3][1][action.run]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_run", global.player_[inp.key][3][2][action.run]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_run_toggle", global.player_[inp.key][3][1][action.run_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_run_toggle", global.player_[inp.key][3][2][action.run_toggle]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_left", global.player_[inp.key][3][1][action.left]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_left", global.player_[inp.key][3][2][action.left]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_right", global.player_[inp.key][3][1][action.right]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_right", global.player_[inp.key][3][2][action.right]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_down", global.player_[inp.key][3][1][action.down]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_down", global.player_[inp.key][3][2][action.down]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_up", global.player_[inp.key][3][1][action.up]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_up", global.player_[inp.key][3][2][action.up]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_tongue", global.player_[inp.key][3][1][action.tongue]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_tongue", global.player_[inp.key][3][2][action.tongue]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_zoom_in", global.player_[inp.key][3][1][action.zoom_in]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_zoom_in", global.player_[inp.key][3][2][action.zoom_in]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_zoom_out", global.player_[inp.key][3][1][action.zoom_out]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_zoom_out", global.player_[inp.key][3][2][action.zoom_out]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_accept", global.player_[inp.key][3][1][action.accept]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_accept", global.player_[inp.key][3][2][action.accept]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key_back", global.player_[inp.key][3][1][action.back]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_key2_back", global.player_[inp.key][3][2][action.back]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_up_is_also_jump[3]", global.player_up_is_also_jump[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_down_is_also_crouch[3]", global.player_down_is_also_crouch[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_double_tap_to_run[3]", global.player_double_tap_to_run[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_run_toggle", global.player_run_toggle[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_double_tap_to_dive[3]", global.player_double_tap_to_dive[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_cancel_dive_by_pressing_jump_or_dive_button[3]", global.player_cancel_dive_by_pressing_jump_or_dive_button[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_cancel_dive_by_pressing_opposite_direction[3]", global.player_cancel_dive_by_pressing_opposite_direction[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_down_and_jump_to_groundpound[3]", global.player_down_and_jump_to_groundpound[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_wall_jump_setting", global.player_wall_jump_setting[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player_drop_from_rope[3]", global.player_drop_from_rope[3]);
		ini_write_real("player3_profile" + string(global.player_profile[3]), "player3_show_controls", global.player_show_controls[3]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player4_gamepad(save_default_controls_to_config = false)
{
	
	#region /* Player 4 Gamepad Remapping */
	
	#region /* Player 4 Gamepad 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][4][1][action.dive] = gp_face3;
	global.player_[inp.gp][4][1][action.jump] = gp_face1;
	global.player_[inp.gp][4][1][action.double_jump] = gp_face1;
	global.player_[inp.gp][4][1][action.crouch] = gp_padd;
	global.player_[inp.gp][4][1][action.crouch_toggle] = noone;
	global.player_[inp.gp][4][1][action.run] = gp_face3;
	global.player_[inp.gp][4][1][action.run_toggle] = noone;
	global.player_[inp.gp][4][1][action.left] = gp_padl;
	global.player_[inp.gp][4][1][action.right] = gp_padr;
	global.player_[inp.gp][4][1][action.down] = gp_padd;
	global.player_[inp.gp][4][1][action.up] = gp_padu;
	global.player_[inp.gp][4][1][action.tongue] = noone;
	global.player_[inp.gp][4][1][action.zoom_in] = JOYSTICK_VALUE.JOYRIGHT_UP;
	global.player_[inp.gp][4][1][action.zoom_out] = JOYSTICK_VALUE.JOYRIGHT_DOWN;
	if (os_type == os_switch)
	{
		global.player_[inp.gp][4][1][action.accept] = gp_face2;
		global.player_[inp.gp][4][1][action.back] = gp_face1;
	}
	else
	{
		global.player_[inp.gp][4][1][action.accept] = gp_face1;
		global.player_[inp.gp][4][1][action.back] = gp_face2;
	}
	#endregion /* Player 4 Gamepad 1 defaults END */
	
	#region /* Player 4 Gamepad 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.gp][4][2][action.dive] = noone;
	global.player_[inp.gp][4][2][action.jump] = noone;
	global.player_[inp.gp][4][2][action.double_jump] = noone;
	global.player_[inp.gp][4][2][action.crouch] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][4][2][action.crouch_toggle] = noone;
	global.player_[inp.gp][4][2][action.run] = gp_shoulderrb;
	global.player_[inp.gp][4][2][action.run_toggle] = noone;
	global.player_[inp.gp][4][2][action.left] = JOYSTICK_VALUE.JOYLEFT_LEFT;
	global.player_[inp.gp][4][2][action.right] = JOYSTICK_VALUE.JOYLEFT_RIGHT;
	global.player_[inp.gp][4][2][action.down] = JOYSTICK_VALUE.JOYLEFT_DOWN;
	global.player_[inp.gp][4][2][action.up] = JOYSTICK_VALUE.JOYLEFT_UP;
	global.player_[inp.gp][4][2][action.tongue] = noone;
	global.player_[inp.gp][4][2][action.zoom_in] = noone;
	global.player_[inp.gp][4][2][action.zoom_out] = noone;
	global.player_[inp.gp][4][2][action.accept] = noone;
	global.player_[inp.gp][4][2][action.back] = noone;
	#endregion /* Player 4 Gamepad 2 defaults END */
	
	global.player_up_is_also_jump[4] = false;
	global.player_down_is_also_crouch[4] = true;
	global.player_double_tap_to_run[4] = true;
	global.player_run_toggle[4] = false;
	global.player_double_tap_to_dive[4] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[4] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[4] = false;
	global.player_down_and_jump_to_groundpound[4] = false;
	global.player_wall_jump_setting[4] = 1;
	global.player_drop_from_rope[4] = 1;
	global.player_show_controls[4] = 1;
	#endregion /* Player 4 Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player4_profile" + string(global.player_profile[4])))
	{
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_dive", global.player_[inp.gp][4][1][action.dive]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_dive", global.player_[inp.gp][4][2][action.dive]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_jump", global.player_[inp.gp][4][1][action.jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_jump", global.player_[inp.gp][4][2][action.jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_double_jump", global.player_[inp.gp][4][1][action.double_jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_double_jump", global.player_[inp.gp][4][2][action.double_jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_crouch", global.player_[inp.gp][4][1][action.crouch]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_crouch", global.player_[inp.gp][4][2][action.crouch]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_crouch_toggle", global.player_[inp.gp][4][1][action.crouch_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_crouch_toggle", global.player_[inp.gp][4][2][action.crouch_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_run", global.player_[inp.gp][4][1][action.run]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_run", global.player_[inp.gp][4][2][action.run]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_run_toggle", global.player_[inp.gp][4][1][action.run_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_run_toggle", global.player_[inp.gp][4][2][action.run_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_left", global.player_[inp.gp][4][1][action.left]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_left", global.player_[inp.gp][4][2][action.left]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_right", global.player_[inp.gp][4][1][action.right]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_right", global.player_[inp.gp][4][2][action.right]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_down", global.player_[inp.gp][4][1][action.down]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_down", global.player_[inp.gp][4][2][action.down]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_up", global.player_[inp.gp][4][1][action.up]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_up", global.player_[inp.gp][4][2][action.up]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_tongue", global.player_[inp.gp][4][1][action.tongue]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_tongue", global.player_[inp.gp][4][2][action.tongue]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_zoom_in", global.player_[inp.gp][4][1][action.zoom_in]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_zoom_in", global.player_[inp.gp][4][2][action.zoom_in]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_zoom_out", global.player_[inp.gp][4][1][action.zoom_out]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_zoom_out", global.player_[inp.gp][4][2][action.zoom_out]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_accept", global.player_[inp.gp][4][1][action.accept]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_accept", global.player_[inp.gp][4][2][action.accept]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button_back", global.player_[inp.gp][4][1][action.back]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_gamepad_button2_back", global.player_[inp.gp][4][2][action.back]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_up_is_also_jump[4]", global.player_up_is_also_jump[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_down_is_also_crouch[4]", global.player_down_is_also_crouch[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_double_tap_to_run[4]", global.player_double_tap_to_run[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_run_toggle", global.player_run_toggle[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_double_tap_to_dive[4]", global.player_double_tap_to_dive[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_cancel_dive_by_pressing_jump_or_dive_button[4]", global.player_cancel_dive_by_pressing_jump_or_dive_button[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_cancel_dive_by_pressing_opposite_direction[4]", global.player_cancel_dive_by_pressing_opposite_direction[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_down_and_jump_to_groundpound[4]", global.player_down_and_jump_to_groundpound[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_wall_jump_setting", global.player_wall_jump_setting[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_drop_from_rope[4]", global.player_drop_from_rope[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_show_controls", global.player_show_controls[4]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the gamepad controls back to default, save these settings in config END */
	
}

function scr_set_default_remapping_player4_keyboard(save_default_controls_to_config = false)
{
	
	#region /* Player 4 Key Remapping (everything should be set to noone) */
	
	#region /* Player 4 Key 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][4][1][action.dive] = noone;
	global.player_[inp.key][4][1][action.jump] = noone;
	global.player_[inp.key][4][1][action.double_jump] = noone;
	global.player_[inp.key][4][1][action.crouch] = noone;
	global.player_[inp.key][4][1][action.crouch_toggle] = noone;
	global.player_[inp.key][4][1][action.run] = noone;
	global.player_[inp.key][4][1][action.run_toggle] = noone;
	global.player_[inp.key][4][1][action.left] = noone;
	global.player_[inp.key][4][1][action.right] = noone;
	global.player_[inp.key][4][1][action.down] = noone;
	global.player_[inp.key][4][1][action.up] = noone;
	global.player_[inp.key][4][1][action.tongue] = noone;
	global.player_[inp.key][4][1][action.zoom_in] = noone;
	global.player_[inp.key][4][1][action.zoom_out] = noone;
	global.player_[inp.key][4][1][action.accept] = noone;
	global.player_[inp.key][4][1][action.back] = noone;
	#endregion /* Player 4 Key 1 defaults END */
	
	#region /* Player 1 Key 2 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][4][2][action.dive] = noone;
	global.player_[inp.key][4][2][action.jump] = noone;
	global.player_[inp.key][4][2][action.double_jump] = noone;
	global.player_[inp.key][4][2][action.crouch] = noone;
	global.player_[inp.key][4][2][action.crouch_toggle] = noone;
	global.player_[inp.key][4][2][action.run] = noone;
	global.player_[inp.key][4][2][action.run_toggle] = noone;
	global.player_[inp.key][4][2][action.left] = noone;
	global.player_[inp.key][4][2][action.right] = noone;
	global.player_[inp.key][4][2][action.down] = noone;
	global.player_[inp.key][4][2][action.up] = noone;
	global.player_[inp.key][4][2][action.tongue] = noone;
	global.player_[inp.key][4][2][action.zoom_in] = noone;
	global.player_[inp.key][4][2][action.zoom_out] = noone;
	global.player_[inp.key][4][2][action.accept] = noone;
	global.player_[inp.key][4][2][action.back] = noone;
	#endregion /* Player 4 Key 2 defaults END */
	
	global.player_up_is_also_jump[4] = false;
	global.player_down_is_also_crouch[4] = true;
	global.player_double_tap_to_run[4] = true;
	global.player_run_toggle[4] = false;
	global.player_double_tap_to_dive[4] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[4] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[4] = false;
	global.player_down_and_jump_to_groundpound[4] = false;
	global.player_wall_jump_setting[4] = 1;
	global.player_drop_from_rope[4] = 1;
	global.player_show_controls[4] = 1;
	#endregion /* Player 4 Keyboard Remapping (everything should be set to noone) END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player4_profile" + string(global.player_profile[4])))
	{
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_dive", global.player_[inp.key][4][1][action.dive]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_dive", global.player_[inp.key][4][2][action.dive]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_jump", global.player_[inp.key][4][1][action.jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_jump", global.player_[inp.key][4][2][action.jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_double_jump", global.player_[inp.key][4][1][action.double_jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_double_jump", global.player_[inp.key][4][2][action.double_jump]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_crouch", global.player_[inp.key][4][1][action.crouch]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_crouch", global.player_[inp.key][4][2][action.crouch]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_crouch_toggle", global.player_[inp.key][4][1][action.crouch_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_crouch_toggle", global.player_[inp.key][4][2][action.crouch_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_run", global.player_[inp.key][4][1][action.run]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_run", global.player_[inp.key][4][2][action.run]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_run_toggle", global.player_[inp.key][4][1][action.run_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_run_toggle", global.player_[inp.key][4][2][action.run_toggle]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_left", global.player_[inp.key][4][1][action.left]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_left", global.player_[inp.key][4][2][action.left]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_right", global.player_[inp.key][4][1][action.right]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_right", global.player_[inp.key][4][2][action.right]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_down", global.player_[inp.key][4][1][action.down]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_down", global.player_[inp.key][4][2][action.down]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_up", global.player_[inp.key][4][1][action.up]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_up", global.player_[inp.key][4][2][action.up]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_tongue", global.player_[inp.key][4][1][action.tongue]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_tongue", global.player_[inp.key][4][2][action.tongue]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_zoom_in", global.player_[inp.key][4][1][action.zoom_in]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_zoom_in", global.player_[inp.key][4][2][action.zoom_in]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_zoom_out", global.player_[inp.key][4][1][action.zoom_out]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_zoom_out", global.player_[inp.key][4][2][action.zoom_out]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_accept", global.player_[inp.key][4][1][action.accept]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_accept", global.player_[inp.key][4][2][action.accept]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key_back", global.player_[inp.key][4][1][action.back]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_key2_back", global.player_[inp.key][4][2][action.back]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_up_is_also_jump[4]", global.player_up_is_also_jump[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_down_is_also_crouch[4]", global.player_down_is_also_crouch[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_double_tap_to_run[4]", global.player_double_tap_to_run[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_run_toggle", global.player_run_toggle[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_double_tap_to_dive[4]", global.player_double_tap_to_dive[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_cancel_dive_by_pressing_jump_or_dive_button[4]", global.player_cancel_dive_by_pressing_jump_or_dive_button[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_cancel_dive_by_pressing_opposite_direction[4]", global.player_cancel_dive_by_pressing_opposite_direction[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_down_and_jump_to_groundpound[4]", global.player_down_and_jump_to_groundpound[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_wall_jump_setting", global.player_wall_jump_setting[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player_drop_from_rope[4]", global.player_drop_from_rope[4]);
		ini_write_real("player4_profile" + string(global.player_profile[4]), "player4_show_controls", global.player_show_controls[4]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}