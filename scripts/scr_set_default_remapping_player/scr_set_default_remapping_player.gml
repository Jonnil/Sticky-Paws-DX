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
	global.player_down_is_also_crouch[what_player] = true;
	global.player_double_tap_to_run[what_player] = true;
	global.player_run_toggle[what_player] = false;
	global.player_double_tap_to_dive[what_player] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[what_player] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[what_player] = false;
	global.player_down_and_jump_to_groundpound[what_player] = false;
	global.player_wall_jump_setting[what_player] = 1;
	global.player_drop_from_rope[what_player] = 1;
	global.player_show_controls[what_player] = 1;
	#endregion /* Player Gamepad Remapping END */
	
	#region /* After setting the gamepad controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player" + string(what_player) + "_profile" + string(global.player_profile[what_player])))
	{
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_dive", global.player_[inp.gp][what_player][1][action.dive]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_dive", global.player_[inp.gp][what_player][2][action.dive]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_jump", global.player_[inp.gp][what_player][1][action.jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_jump", global.player_[inp.gp][what_player][2][action.jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_double_jump", global.player_[inp.gp][what_player][1][action.double_jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_double_jump", global.player_[inp.gp][what_player][2][action.double_jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_crouch", global.player_[inp.gp][what_player][1][action.crouch]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_crouch", global.player_[inp.gp][what_player][2][action.crouch]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_crouch_toggle", global.player_[inp.gp][what_player][1][action.crouch_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_crouch_toggle", global.player_[inp.gp][what_player][2][action.crouch_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_run", global.player_[inp.gp][what_player][1][action.run]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_run", global.player_[inp.gp][what_player][2][action.run]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_run_toggle", global.player_[inp.gp][what_player][1][action.run_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_run_toggle", global.player_[inp.gp][what_player][2][action.run_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_left", global.player_[inp.gp][what_player][1][action.left]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_left", global.player_[inp.gp][what_player][2][action.left]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_right", global.player_[inp.gp][what_player][1][action.right]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_right", global.player_[inp.gp][what_player][2][action.right]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_down", global.player_[inp.gp][what_player][1][action.down]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_down", global.player_[inp.gp][what_player][2][action.down]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_up", global.player_[inp.gp][what_player][1][action.up]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_up", global.player_[inp.gp][what_player][2][action.up]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_tongue", global.player_[inp.gp][what_player][1][action.tongue]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_tongue", global.player_[inp.gp][what_player][2][action.tongue]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_zoom_in", global.player_[inp.gp][what_player][1][action.zoom_in]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_zoom_in", global.player_[inp.gp][what_player][2][action.zoom_in]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_zoom_out", global.player_[inp.gp][what_player][1][action.zoom_out]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_zoom_out", global.player_[inp.gp][what_player][2][action.zoom_out]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_accept", global.player_[inp.gp][what_player][1][action.accept]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_accept", global.player_[inp.gp][what_player][2][action.accept]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button_back", global.player_[inp.gp][what_player][1][action.back]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_gamepad_button2_back", global.player_[inp.gp][what_player][2][action.back]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_up_is_also_jump", global.player_up_is_also_jump[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_down_is_also_crouch", global.player_down_is_also_crouch[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_double_tap_to_run", global.player_double_tap_to_run[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_run_toggle", global.player_run_toggle[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_double_tap_to_dive", global.player_double_tap_to_dive[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_cancel_dive_by_pressing_jump_or_dive_button", global.player_cancel_dive_by_pressing_jump_or_dive_button[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_cancel_dive_by_pressing_opposite_direction", global.player_cancel_dive_by_pressing_opposite_direction[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_down_and_jump_to_groundpound", global.player_down_and_jump_to_groundpound[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_wall_jump_setting", global.player_wall_jump_setting[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_drop_from_rope", global.player_drop_from_rope[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_show_controls", global.player_show_controls[what_player]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
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
	global.player_down_is_also_crouch[what_player] = true;
	global.player_double_tap_to_run[what_player] = true;
	global.player_run_toggle[what_player] = false;
	global.player_double_tap_to_dive[what_player] = false;
	global.player_cancel_dive_by_pressing_jump_or_dive_button[what_player] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[what_player] = false;
	global.player_down_and_jump_to_groundpound[what_player] = false;
	global.player_wall_jump_setting[what_player] = 1;
	global.player_drop_from_rope[what_player] = 1;
	global.player_show_controls[what_player] = 1;
	#endregion /* Player Keyboard Remapping END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	ini_open(working_directory + "save_file/config.ini");
	if (save_default_controls_to_config)
	|| (!ini_section_exists("player" + string(what_player) + "_profile" + string(global.player_profile[what_player])))
	{
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_dive", global.player_[inp.key][what_player][1][action.dive]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_dive", global.player_[inp.key][what_player][2][action.dive]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_jump", global.player_[inp.key][what_player][1][action.jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_jump", global.player_[inp.key][what_player][2][action.jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_double_jump", global.player_[inp.key][what_player][1][action.double_jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_double_jump", global.player_[inp.key][what_player][2][action.double_jump]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_crouch", global.player_[inp.key][what_player][1][action.crouch]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_crouch", global.player_[inp.key][what_player][2][action.crouch]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_crouch_toggle", global.player_[inp.key][what_player][1][action.crouch_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_crouch_toggle", global.player_[inp.key][what_player][2][action.crouch_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_run", global.player_[inp.key][what_player][1][action.run]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_run", global.player_[inp.key][what_player][2][action.run]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_run_toggle", global.player_[inp.key][what_player][1][action.run_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_run_toggle", global.player_[inp.key][what_player][2][action.run_toggle]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_left", global.player_[inp.key][what_player][1][action.left]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_left", global.player_[inp.key][what_player][2][action.left]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_right", global.player_[inp.key][what_player][1][action.right]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_right", global.player_[inp.key][what_player][2][action.right]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_down", global.player_[inp.key][what_player][1][action.down]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_down", global.player_[inp.key][what_player][2][action.down]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_up", global.player_[inp.key][what_player][1][action.up]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_up", global.player_[inp.key][what_player][2][action.up]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_tongue", global.player_[inp.key][what_player][1][action.tongue]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_tongue", global.player_[inp.key][what_player][2][action.tongue]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_zoom_in", global.player_[inp.key][what_player][1][action.zoom_in]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_zoom_in", global.player_[inp.key][what_player][2][action.zoom_in]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_zoom_out", global.player_[inp.key][what_player][1][action.zoom_out]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_zoom_out", global.player_[inp.key][what_player][2][action.zoom_out]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_accept", global.player_[inp.key][what_player][1][action.accept]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_accept", global.player_[inp.key][what_player][2][action.accept]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key_back", global.player_[inp.key][what_player][1][action.back]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_key2_back", global.player_[inp.key][what_player][2][action.back]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_up_is_also_jump", global.player_up_is_also_jump[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_down_is_also_crouch", global.player_down_is_also_crouch[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_double_tap_to_run", global.player_double_tap_to_run[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_run_toggle", global.player_run_toggle[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_double_tap_to_dive", global.player_double_tap_to_dive[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_cancel_dive_by_pressing_jump_or_dive_button", global.player_cancel_dive_by_pressing_jump_or_dive_button[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_cancel_dive_by_pressing_opposite_direction", global.player_cancel_dive_by_pressing_opposite_direction[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_down_and_jump_to_groundpound", global.player_down_and_jump_to_groundpound[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_wall_jump_setting", global.player_wall_jump_setting[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_drop_from_rope", global.player_drop_from_rope[what_player]);
		ini_write_real("player" + string(what_player) + "_profile" + string(global.player_profile[what_player]), "player" + string(what_player) + "_show_controls", global.player_show_controls[what_player]);
	}
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}