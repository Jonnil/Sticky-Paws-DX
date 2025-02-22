function scr_config_load()
{
	if (file_exists(game_save_id + "save_file/config.ini")) /* Check if config.ini exists before loading any settings */
	{
		ini_open(game_save_id + "save_file/config.ini");
		
		#region /* Set player specific variables. This needs to run FIRST, because other variables are dependent on these being set first */
		for(var i = 1; i <= global.max_players; i += 1)
		{
			
			#region /* Load Player Keyboard Remapping */
			if (ini_key_exists("config", "vibration_strength" + string(i))){global.vibration_strength[i] = ini_read_real("config", "vibration_strength" + string(i), 0);}
			if (ini_key_exists("config", "character_index_player" + string(i))){global.character_index[i - 1] = ini_read_real("config", "character_index_player" + string(i), 0);}
			if (ini_key_exists("config", "skin_for_player" + string(i))){global.actual_skin_for_player[i] = ini_read_real("config", "skin_for_player" + string(i), 0);}
			if (ini_key_exists("config", "voicepack_for_player" + string(i))){global.voicepack_for_player[i] = ini_read_real("config", "voicepack_for_player" + string(i), 0);}
			if (ini_key_exists("config", "player" + string(i) + "_name")){global.player_name[i] = ini_read_string("config", "player" + string(i) + "_name", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_dive")){global.player_[inp.key][i][1][action.dive] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_dive", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_jump")){global.player_[inp.key][i][1][action.jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_double_jump")){global.player_[inp.key][i][1][action.double_jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_double_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_crouch")){global.player_[inp.key][i][1][action.crouch] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_crouch", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_crouch_toggle")){global.player_[inp.key][i][1][action.crouch_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_crouch_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_run")){global.player_[inp.key][i][1][action.run] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_run", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_run_toggle")){global.player_[inp.key][i][1][action.run_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_run_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_left")){global.player_[inp.key][i][1][action.left] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_left", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_right")){global.player_[inp.key][i][1][action.right] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_right", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_down")){global.player_[inp.key][i][1][action.down] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_down", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_up")){global.player_[inp.key][i][1][action.up] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_up", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_tongue")){global.player_[inp.key][i][1][action.tongue] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_tongue", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_zoom_in")){global.player_[inp.key][i][1][action.zoom_in] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_zoom_in", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_zoom_out")){global.player_[inp.key][i][1][action.zoom_out] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_zoom_out", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_accept")){global.player_[inp.key][i][1][action.accept] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_accept", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_back")){global.player_[inp.key][i][1][action.back] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key_back", 0);}
			
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_dive")){global.player_[inp.key][i][2][action.dive] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_dive", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_jump")){global.player_[inp.key][i][2][action.jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_double_jump")){global.player_[inp.key][i][2][action.double_jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_double_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_crouch")){global.player_[inp.key][i][2][action.crouch] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_crouch", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_crouch_toggle")){global.player_[inp.key][i][2][action.crouch_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_crouch_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_run")){global.player_[inp.key][i][2][action.run] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_run", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_run_toggle")){global.player_[inp.key][i][2][action.run_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_run_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_left")){global.player_[inp.key][i][2][action.left] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_left", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_right")){global.player_[inp.key][i][2][action.right] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_right", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_down")){global.player_[inp.key][i][2][action.down] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_down", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_up")){global.player_[inp.key][i][2][action.up] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_up", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_tongue")){global.player_[inp.key][i][2][action.tongue] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_tongue", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_zoom_in")){global.player_[inp.key][i][2][action.zoom_in] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_zoom_in", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_zoom_out")){global.player_[inp.key][i][2][action.zoom_out] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_zoom_out", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_accept")){global.player_[inp.key][i][2][action.accept] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_accept", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_back")){global.player_[inp.key][i][2][action.back] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_key2_back", 0);}
			
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_up_is_also_jump")){global.player_up_is_also_jump[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_up_is_also_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_jump_uses_jump_key")){global.player_double_jump_uses_jump_key[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_jump_uses_jump_key", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_down_is_also_crouch")){global.player_down_is_also_crouch[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_down_is_also_crouch", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_tap_to_run")){global.player_double_tap_to_run[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_tap_to_run", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_run_toggle")){global.player_run_toggle[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_run_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_tap_to_dive")){global.player_double_tap_to_dive[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_tap_to_dive", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_cancel_dive_by_jump_or_dive")){global.player_cancel_dive_by_jump_or_dive[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_cancel_dive_by_jump_or_dive", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_cancel_dive_by_pressing_opposite_direction")){global.player_cancel_dive_by_pressing_opposite_direction[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_cancel_dive_by_pressing_opposite_direction", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_down_and_jump_to_groundpound")){global.player_down_and_jump_to_groundpound[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_down_and_jump_to_groundpound", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_wall_jump_setting")){global.player_wall_jump_setting[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_wall_jump_setting", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_drop_from_rope")){global.player_drop_from_rope[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_drop_from_rope", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_show_controls")){global.player_show_controls[i] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_show_controls", 0);}
			#endregion /* Load Player Keyboard Remapping END */
			
			#region /* Load Player Gamepad Remapping */
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_dive")){global.player_[inp.gp][i][1][action.dive] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_dive", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_jump")){global.player_[inp.gp][i][1][action.jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_double_jump")){global.player_[inp.gp][i][1][action.double_jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_double_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_crouch")){global.player_[inp.gp][i][1][action.crouch] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_crouch", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_crouch_toggle")){global.player_[inp.gp][i][1][action.crouch_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_crouch_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_run")){global.player_[inp.gp][i][1][action.run] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_run", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_run_toggle")){global.player_[inp.gp][i][1][action.run_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_run_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_left")){global.player_[inp.gp][i][1][action.left] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_left", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_right")){global.player_[inp.gp][i][1][action.right] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_right", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_down")){global.player_[inp.gp][i][1][action.down] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_down", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_up")){global.player_[inp.gp][i][1][action.up] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_up", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_tongue")){global.player_[inp.gp][i][1][action.tongue] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_tongue", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_zoom_in")){global.player_[inp.gp][i][1][action.zoom_in] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_zoom_in", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_zoom_out")){global.player_[inp.gp][i][1][action.zoom_out] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_zoom_out", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_accept")){global.player_[inp.gp][i][1][action.accept] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_accept", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_back")){global.player_[inp.gp][i][1][action.back] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button_back", 0);}
			
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_dive")){global.player_[inp.gp][i][2][action.dive] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_dive", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_jump")){global.player_[inp.gp][i][2][action.jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_double_jump")){global.player_[inp.gp][i][2][action.double_jump] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_double_jump", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_crouch")){global.player_[inp.gp][i][2][action.crouch] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_crouch", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_crouch_toggle")){global.player_[inp.gp][i][2][action.crouch_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_crouch_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_run")){global.player_[inp.gp][i][2][action.run] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_run", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_run_toggle")){global.player_[inp.gp][i][2][action.run_toggle] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_run_toggle", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_left")){global.player_[inp.gp][i][2][action.left] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_left", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_right")){global.player_[inp.gp][i][2][action.right] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_right", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_down")){global.player_[inp.gp][i][2][action.down] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_down", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_up")){global.player_[inp.gp][i][2][action.up] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_up", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_tongue")){global.player_[inp.gp][i][2][action.tongue] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_tongue", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_zoom_in")){global.player_[inp.gp][i][2][action.zoom_in] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_zoom_in", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_zoom_out")){global.player_[inp.gp][i][2][action.zoom_out] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_zoom_out", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_accept")){global.player_[inp.gp][i][2][action.accept] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_accept", 0);}
			if (ini_key_exists("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_back")){global.player_[inp.gp][i][2][action.back] = ini_read_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_gamepad_button2_back", 0);}
			#endregion /* Load Player Gamepad Remapping END */
			
		}
		#endregion /* Set player specific variables. This needs to run FIRST, because other variables are dependent on these being set first END */
		
		if (variable_instance_exists(self, "inform_about_report_feature"))
		{
			inform_about_report_feature = ini_read_real("config", "inform_about_report_feature", true);
		}
		global.upload_rules_do_not_show_level = ini_read_real("config", "upload_rules_do_not_show_level", false);
		global.upload_rules_do_not_show_character = ini_read_real("config", "upload_rules_do_not_show_character", false);
		if (ini_key_exists("config", "debug_detailed_mode")){global.debug_detailed_mode = ini_read_real("config", "debug_detailed_mode", false);}
		
		#region /* Debug Collapsed Sections */
		var section_list = [
			"Instructions",
			"System Information",
			"Player Information",
			"Menu Information",
			"Gamepad Information",
			"Switch Information"
		];
		
		for (var i = 0; i < array_length(section_list); i++)
		{
			var key = section_list[i];
			if (ini_key_exists("debug_collapsed_sections", key))
			{
				global.debug_collapsed_sections[? key] = ini_read_real("debug_collapsed_sections", key, false);
			}
			else
			{
				/* If the key doesn't exist, you can set a default */
				global.debug_collapsed_sections[? key] = false;
			}
		}
		#endregion /* Debug Collapsed Sections END */
		
		if (ini_key_exists("config", "enable_level_length_target")){global.enable_level_length_target = ini_read_real("config", "enable_level_length_target", false);}
		if (ini_key_exists("config", "target_length_minutes")){global.target_length_minutes = ini_read_real("config", "target_length_minutes", 3);}
		if (ini_key_exists("config", "first_time_opened_level_editor")){global.first_time_opened_level_editor = ini_read_real("config", "first_time_opened_level_editor", true);}
		if (ini_key_exists("config", "caution_online_do_not_show")){global.caution_online_do_not_show = ini_read_real("config", "caution_online_do_not_show", false);}
		if (ini_key_exists("config", "caution_online_do_not_show")){global.online_enabled = ini_read_real("config", "caution_online_do_not_show", false);}
		if (ini_key_exists("config", "always_show_level_editor_buttons")){global.always_show_level_editor_buttons = ini_read_real("config", "always_show_level_editor_buttons", true);}
		if (ini_key_exists("config", "current_file")){global.file = ini_read_real("config", "current_file", 0);}
		if (ini_key_exists("config", "difficulty")){global.difficulty = ini_read_real("config", "difficulty", 0);}
		if (ini_key_exists("config", "enable_difficutly_layers_in_level_editor")){global.enable_difficutly_layers_in_level_editor = ini_read_real("config", "enable_difficutly_layers_in_level_editor", 0);}
		if (ini_key_exists("config", "automatically_pause_when_window_is_unfocused")){global.automatically_pause_when_window_is_unfocused = ini_read_real("config", "automatically_pause_when_window_is_unfocused", 0);}
		if (ini_key_exists("config", "show_timer")){global.show_timer = ini_read_real("config", "show_timer", 0);}
		if (ini_key_exists("config", "show_defeats_counter")){global.show_defeats_counter = ini_read_real("config", "show_defeats_counter", 1);}
		if (ini_key_exists("config", "show_ranks")){global.show_ranks = ini_read_real("config", "show_ranks", 0);}
		if (ini_key_exists("config", "assist_enable")){global.assist_enable = ini_read_real("config", "assist_enable", 0);}
		if (ini_key_exists("config", "assist_enable_enemies")){global.assist_enable_enemies = ini_read_real("config", "assist_enable_enemies", 0);}
		if (ini_key_exists("config", "assist_enable_spikes")){global.assist_enable_spikes = ini_read_real("config", "assist_enable_spikes", 0);}
		if (ini_key_exists("config", "narrator")){global.narrator = ini_read_real("config", "narrator", 0);}
		if (ini_key_exists("config", "narrator_selection")){global.narrator_selection = ini_read_real("config", "narrator_selection", -1);}
		scr_set_narrator(false); /* After getting the narrator selection from ini file, then run this set narrator script, so that the narrator can be set correctly. Make sure you aren't writing to ini file in this script */
		if (ini_key_exists("config", "show_tutorial_signs")){global.show_tutorial_signs = ini_read_real("config", "show_tutorial_signs", 0);}
		if (ini_key_exists("config", "show_new_items_notification")){global.show_new_items_notification = ini_read_real("config", "show_new_items_notification", 0);}
		if (ini_key_exists("config", "hud_hide_time")){global.hud_hide_time = ini_read_real("config", "hud_hide_time", 0);}
		if (ini_key_exists("config", "players_can_collide")){global.players_can_collide = ini_read_real("config", "players_can_collide", 0);}
		
		#region /* Assist Settings */
		if (ini_key_exists("config", "assist_enable")){global.assist_enable = ini_read_real("config", "assist_enable", 0);}
		if (ini_key_exists("config", "assist_item_appear")){global.assist_item_appear = ini_read_real("config", "assist_item_appear", 0);}
		if (ini_key_exists("config", "assist_extra_hp")){global.assist_extra_hp = ini_read_real("config", "assist_extra_hp", 0);}
		if (ini_key_exists("config", "assist_above_1_hp")){global.assist_above_1_hp = ini_read_real("config", "assist_above_1_hp", 0);}
		if (ini_key_exists("config", "assist_invincibility")){global.assist_invincibility = ini_read_real("config", "assist_invincibility", 0);}
		if (ini_key_exists("config", "assist_moonjump")){global.assist_moonjump = ini_read_real("config", "assist_moonjump", 0);}
		if (ini_key_exists("config", "assist_hover_when_holding_jump")){global.assist_hover_when_holding_jump = ini_read_real("config", "assist_hover_when_holding_jump", 0);}
		if (ini_key_exists("config", "assist_floor_over_bottomless_pit")){global.assist_floor_over_bottomless_pit = ini_read_real("config", "assist_floor_over_bottomless_pit", 0);}
		if (ini_key_exists("config", "assist_breathe_underwater")){global.assist_breathe_underwater = ini_read_real("config", "assist_breathe_underwater", 0);}
		if (ini_key_exists("config", "assist_guiding_arrows")){global.assist_guiding_arrows = ini_read_real("config", "assist_guiding_arrows", 0);}
		if (ini_key_exists("config", "assist_normal_arrows")){global.assist_normal_arrows = ini_read_real("config", "assist_normal_arrows", 0);}
		#endregion /* Assist Settings END */
		
		#region /* Account Settings */
		if (ini_key_exists("config", "username")){global.username = ini_read_string("config", "username", "");}
		#endregion /* Account Settings END */
		
		if (ini_key_exists("config", "fullscreen_mode")){window_set_fullscreen(ini_read_real("config", "fullscreen_mode", 0));}
		if (ini_key_exists("config", "interpolate")){global.interpolate = ini_read_real("config", "interpolate", 0);}
		if (ini_key_exists("config", "show_fps")){global.show_fps = ini_read_real("config", "show_fps", 0);}
		if (ini_key_exists("config", "show_instance_count")){global.show_instance_count = ini_read_real("config", "show_instance_count", 0);}
		if (ini_key_exists("config", "show_collision_mask")){global.show_collision_mask = ini_read_real("config", "show_collision_mask", 0);}
		if (ini_key_exists("config", "volume_main")){global.volume_main = ini_read_real("config", "volume_main", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_music")){global.volume_music = ini_read_real("config", "volume_music", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_melody")){global.volume_melody = ini_read_real("config", "volume_melody", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_sound")){global.volume_sound = ini_read_real("config", "volume_sound", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_ambient")){global.volume_ambient = ini_read_real("config", "volume_ambient", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_footstep")){global.volume_footstep = ini_read_real("config", "volume_footstep", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_voices")){global.volume_voice = ini_read_real("config", "volume_voices", 7000) * 0.0001;}
		if (ini_key_exists("config", "background_brightness_gameplay")){global.background_brightness_gameplay = ini_read_real("config", "background_brightness_gameplay", 0) * 0.0001;}
		if (ini_key_exists("config", "background_brightness_menu")){global.background_brightness_menu = ini_read_real("config", "background_brightness_menu", 0) * 0.0001;}
		if (ini_key_exists("config", "enable_background_layer1")){global.enable_background_layer1 = ini_read_real("config", "enable_background_layer1", 0);}
		if (ini_key_exists("config", "enable_background_layer2")){global.enable_background_layer2 = ini_read_real("config", "enable_background_layer2", 0);}
		if (ini_key_exists("config", "enable_background_layer3")){global.enable_background_layer3 = ini_read_real("config", "enable_background_layer3", 0);}
		if (ini_key_exists("config", "enable_background_layer4")){global.enable_background_layer4 = ini_read_real("config", "enable_background_layer4", 0);}
		if (ini_key_exists("config", "enable_foreground_layer1")){global.enable_foreground_layer1 = ini_read_real("config", "enable_foreground_layer1", 0);}
		if (ini_key_exists("config", "enable_foreground_layer_1_5")){global.enable_foreground_layer_1_5 = ini_read_real("config", "enable_foreground_layer_1_5", 0);}
		if (ini_key_exists("config", "enable_foreground_layer2")){global.enable_foreground_layer2 = ini_read_real("config", "enable_foreground_layer2", 0);}
		if (ini_key_exists("config", "enable_foreground_layer_secret")){global.enable_foreground_layer_secret = ini_read_real("config", "enable_foreground_layer_secret", 0);}
		if (ini_key_exists("config", "enable_transitions")){global.enable_transitions = ini_read_real("config", "enable_transitions", 0);}
		if (ini_key_exists("config", "button_design_color")){global.button_design_color = ini_read_real("config", "button_design_color", 2);}
		if (ini_key_exists("config", "button_design_shape")){global.button_design_shape = ini_read_real("config", "button_design_shape", 1);}
		if (ini_key_exists("config", "button_design_transparency")){global.button_design_transparency = ini_read_real("config", "button_design_transparency", 0);}
		if (ini_key_exists("config", "menu_button_subimg")){global.menu_button_subimg = ini_read_real("config", "menu_button_subimg", 16);}
		
		if (ini_key_exists("config", "select_resource_pack")){global.selected_resource_pack = ini_read_real("config", "select_resource_pack", 0);}
		
		#region/* Load Title Background Config */
		if (ini_key_exists("config", "select_title_background1")){global.selected_title_background[1] = ini_read_real("config", "select_title_background1", 0);}
		if (ini_key_exists("config", "title_background_scale1")){global.title_background_scale[1] = ini_read_real("config", "title_background_scale1", 1);}
		if (ini_key_exists("config", "background_layer_x_scroll1")){global.background_layer_x_scroll[1] = ini_read_real("config", "background_layer_x_scroll1", 1);}
		if (ini_key_exists("config", "background_layer_y_scroll1")){global.background_layer_y_scroll[1] = ini_read_real("config", "background_layer_y_scroll1", 1);}
		if (ini_key_exists("config", "select_title_background2")){global.selected_title_background[2] = ini_read_real("config", "select_title_background2", -1);}
		if (ini_key_exists("config", "title_background_scale2")){global.title_background_scale[2] = ini_read_real("config", "title_background_scale2", 1);}
		if (ini_key_exists("config", "background_layer_x_scroll2")){global.background_layer_x_scroll[2] = ini_read_real("config", "background_layer_x_scroll2", 1);}
		if (ini_key_exists("config", "background_layer_y_scroll2")){global.background_layer_y_scroll[2] = ini_read_real("config", "background_layer_y_scroll2", 1);}
		if (ini_key_exists("config", "select_title_background3")){global.selected_title_background[3] = ini_read_real("config", "select_title_background3", -1);}
		if (ini_key_exists("config", "title_background_scale3")){global.title_background_scale[3] = ini_read_real("config", "title_background_scale3", 1);}
		if (ini_key_exists("config", "background_layer_x_scroll3")){global.background_layer_x_scroll[3] = ini_read_real("config", "background_layer_x_scroll3", 1);}
		if (ini_key_exists("config", "background_layer_y_scroll3")){global.background_layer_y_scroll[3] = ini_read_real("config", "background_layer_y_scroll3", 1);}
		#endregion/* Load Title Background Config END */
		
		if (ini_key_exists("config", "select_title_logo")){global.selected_title_logo = ini_read_real("config", "select_title_logo", 0);}
		if (ini_key_exists("config", "can_load_custom_level_assets")){global.can_load_custom_level_assets = ini_read_real("config", "can_load_custom_level_assets", 0);}
		if (ini_key_exists("config", "zoom_level")){global.zoom_level = ini_read_real("config", "zoom_level", 1);}
		if (ini_key_exists("config", "zoom_world_map")){global.zoom_world_map = ini_read_real("config", "zoom_world_map", 1);}
		if (ini_key_exists("config", "reset_level_zoom_when_going_back_to_map")){global.reset_level_zoom_when_going_back_to_map = ini_read_real("config", "reset_level_zoom_when_going_back_to_map", 0);}
		if (ini_key_exists("config", "reset_world_map_zoom_when_going_back_to_map")){global.reset_world_map_zoom_when_going_back_to_map = ini_read_real("config", "reset_world_map_zoom_when_going_back_to_map", 0);}
		if (ini_key_exists("config", "draw_text_outline")){global.draw_text_outline = ini_read_real("config", "draw_text_outline", true);}
		if (ini_key_exists("config", "resolution_setting")){global.resolution_setting = ini_read_real("config", "resolution_setting", 0);}
		if (ini_key_exists("config", "gui_scale_modifier")){global.gui_scale_modifier = ini_read_real("config", "gui_scale_modifier", 0);}
		if (ini_key_exists("config", "selected_language_id")){global.selected_language_id = ini_read_real("config", "selected_language_id", 1);} /* Load language before loading font, as the font is informed by the language selected */
		if (ini_key_exists("config", "current_language_menu_position")){global.current_language_menu_position = ini_read_real("config", "current_language_menu_position", 1);} /* Load 'global.current_language_menu_position' before loading font, as the font is informed by the language selected */
		if (ini_key_exists("config", "select_font")){global.selected_font = ini_read_real("config", "select_font", 0);scr_set_font();} /* Load font after loading language, as the font is informed by the language selected */
		if (ini_key_exists("config", "show_prompt_when_changing_to_gamepad")){global.show_prompt_when_changing_to_gamepad = ini_read_real("config", "show_prompt_when_changing_to_gamepad", 1);}
		if (ini_key_exists("config", "show_prompt_when_changing_to_keyboard_and_mouse")){global.show_prompt_when_changing_to_keyboard_and_mouse = ini_read_real("config", "show_prompt_when_changing_to_keyboard_and_mouse", 1);}
		if (ini_key_exists("config", "always_show_gamepad_buttons")){global.always_show_gamepad_buttons = ini_read_real("config", "always_show_gamepad_buttons", 0);}
		
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
}