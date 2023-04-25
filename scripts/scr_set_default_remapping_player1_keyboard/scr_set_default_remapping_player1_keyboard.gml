function scr_set_default_remapping_player1_keyboard(save_default_controls_to_config = false)
{
	
	#region /* Player 1 Key Remapping */
	
	#region /* Player 1 Key 1 defaults */
	/* global.player_[keyboard/gamepad][player][key1/key2][action] */
	global.player_[inp.key][1][1][action.dive] = ord("X");
	global.player_[inp.key][1][1][action.jump] = ord("Z");
	global.player_[inp.key][1][1][action.crouch] = vk_down;
	global.player_[inp.key][1][1][action.crouch_toggle] = noone;
	global.player_[inp.key][1][1][action.sprint] = vk_lcontrol;
	global.player_[inp.key][1][1][action.sprint_toggle] = 20;
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
	global.player_[inp.key][1][2][action.crouch] = vk_shift;
	global.player_[inp.key][1][2][action.crouch_toggle] = noone;
	global.player_[inp.key][1][2][action.sprint] = ord("X");
	global.player_[inp.key][1][2][action.sprint_toggle] = noone;
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
	
	global.player1_up_is_also_jump = false;
	global.player1_double_tap_to_run = true;
	global.player1_sprint_toggle = false;
	global.player1_double_tap_to_dive = false;
	global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;
	global.player1_cancel_dive_by_pressing_opposite_direction = false;
	global.player1_down_and_jump_to_groundpound = false;
	global.player1_wall_jump_setting = 1;
	global.player1_drop_from_rope = 1;
	global.player1_show_controls = 1;
	#endregion /* Player 1 Keyboard Remapping END */
	
	#region /* After setting the keyboard controls back to default, save these settings in config */
	if (save_default_controls_to_config == true)
	{
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "player1_key_dive", global.player_[inp.key][1][1][action.dive]);
		ini_write_real("config", "player1_key2_dive", global.player_[inp.key][1][2][action.dive]);
		ini_write_real("config", "player1_key_jump", global.player_[inp.key][1][1][action.jump]);
		ini_write_real("config", "player1_key2_jump", global.player_[inp.key][1][2][action.jump]);
		ini_write_real("config", "player1_key_crouch", global.player_[inp.key][1][1][action.crouch]);
		ini_write_real("config", "player1_key2_crouch", global.player_[inp.key][1][2][action.crouch]);
		ini_write_real("config", "player1_key_crouch_toggle", global.player_[inp.key][1][1][action.crouch_toggle]);
		ini_write_real("config", "player1_key2_crouch_toggle", global.player_[inp.key][1][2][action.crouch_toggle]);
		ini_write_real("config", "player1_key_sprint", global.player_[inp.key][1][1][action.sprint]);
		ini_write_real("config", "player1_key2_sprint", global.player_[inp.key][1][2][action.sprint]);
		ini_write_real("config", "player1_key_sprint_toggle", global.player_[inp.key][1][1][action.sprint_toggle]);
		ini_write_real("config", "player1_key2_sprint_toggle", global.player_[inp.key][1][2][action.sprint_toggle]);
		ini_write_real("config", "player1_key_left", global.player_[inp.key][1][1][action.left]);
		ini_write_real("config", "player1_key2_left", global.player_[inp.key][1][2][action.left]);
		ini_write_real("config", "player1_key_right", global.player_[inp.key][1][1][action.right]);
		ini_write_real("config", "player1_key2_right", global.player_[inp.key][1][2][action.right]);
		ini_write_real("config", "player1_key_down", global.player_[inp.key][1][1][action.down]);
		ini_write_real("config", "player1_key2_down", global.player_[inp.key][1][2][action.down]);
		ini_write_real("config", "player1_key_up", global.player_[inp.key][1][1][action.up]);
		ini_write_real("config", "player1_key2_up", global.player_[inp.key][1][2][action.up]);
		ini_write_real("config", "player1_key_tongue", global.player_[inp.key][1][1][action.tongue]);
		ini_write_real("config", "player1_key2_tongue", global.player_[inp.key][1][2][action.tongue]);
		ini_write_real("config", "player1_key_zoom_in", global.player_[inp.key][1][1][action.zoom_in]);
		ini_write_real("config", "player1_key2_zoom_in", global.player_[inp.key][1][2][action.zoom_in]);
		ini_write_real("config", "player1_key_zoom_out", global.player_[inp.key][1][1][action.zoom_out]);
		ini_write_real("config", "player1_key2_zoom_out", global.player_[inp.key][1][2][action.zoom_out]);
		ini_write_real("config", "player1_key_accept", global.player_[inp.key][1][1][action.accept]);
		ini_write_real("config", "player1_key2_accept", global.player_[inp.key][1][2][action.accept]);
		ini_write_real("config", "player1_key_back", global.player_[inp.key][1][1][action.back]);
		ini_write_real("config", "player1_key2_back", global.player_[inp.key][1][2][action.back]);
		ini_write_real("config", "player1_up_is_also_jump", global.player1_up_is_also_jump);
		ini_write_real("config", "player1_double_tap_to_run", global.player1_double_tap_to_run);
		ini_write_real("config", "player1_sprint_toggle", global.player1_sprint_toggle);
		ini_write_real("config", "player1_double_tap_to_dive", global.player1_double_tap_to_dive);
		ini_write_real("config", "player1_cancel_dive_by_pressing_jump_or_dive_button", global.player1_cancel_dive_by_pressing_jump_or_dive_button);
		ini_write_real("config", "player1_cancel_dive_by_pressing_opposite_direction", global.player1_cancel_dive_by_pressing_opposite_direction);
		ini_write_real("config", "player1_down_and_jump_to_groundpound", global.player1_down_and_jump_to_groundpound);
		ini_write_real("config", "player1_wall_jump_setting", global.player1_wall_jump_setting);
		ini_write_real("config", "player1_drop_from_rope", global.player1_drop_from_rope);
		ini_write_real("config", "player1_show_controls", global.player1_show_controls);
		ini_close();
	}
	#endregion /* After setting the keyboard controls back to default, save these settings in config END */
	
}