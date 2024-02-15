function scr_save_player_control_profile(what_player = 1, key0_or_gamepad1 = 0)
{
	if (key0_or_gamepad1 = 0) {
		var inp_what = inp.key;
		var key_or_gamepad_string = "key";
	}
	else
	{
		var inp_what = inp.gp;
		var key_or_gamepad_string = "gamepad_button";
	}
	var section = "player" + string(what_player) + "_profile" + string(global.player_profile[what_player] + 1);
	var key = "player" + string(what_player) + "_" + string(key_or_gamepad_string);
	ini_open(game_save_id + "save_file/config.ini");
	ini_write_real(section, key + "_dive", global.player_[inp_what][what_player][1][action.dive]);
	ini_write_real(section, key + "2_dive", global.player_[inp_what][what_player][2][action.dive]);
	ini_write_real(section, key + "_jump", global.player_[inp_what][what_player][1][action.jump]);
	ini_write_real(section, key + "2_jump", global.player_[inp_what][what_player][2][action.jump]);
	ini_write_real(section, key + "_double_jump", global.player_[inp_what][what_player][1][action.double_jump]);
	ini_write_real(section, key + "2_double_jump", global.player_[inp_what][what_player][2][action.double_jump]);
	ini_write_real(section, key + "_crouch", global.player_[inp_what][what_player][1][action.crouch]);
	ini_write_real(section, key + "2_crouch", global.player_[inp_what][what_player][2][action.crouch]);
	ini_write_real(section, key + "_crouch_toggle", global.player_[inp_what][what_player][1][action.crouch_toggle]);
	ini_write_real(section, key + "2_crouch_toggle", global.player_[inp_what][what_player][2][action.crouch_toggle]);
	ini_write_real(section, key + "_run", global.player_[inp_what][what_player][1][action.run]);
	ini_write_real(section, key + "2_run", global.player_[inp_what][what_player][2][action.run]);
	ini_write_real(section, key + "_run_toggle", global.player_[inp_what][what_player][1][action.run_toggle]);
	ini_write_real(section, key + "2_run_toggle", global.player_[inp_what][what_player][2][action.run_toggle]);
	ini_write_real(section, key + "_left", global.player_[inp_what][what_player][1][action.left]);
	ini_write_real(section, key + "2_left", global.player_[inp_what][what_player][2][action.left]);
	ini_write_real(section, key + "_right", global.player_[inp_what][what_player][1][action.right]);
	ini_write_real(section, key + "2_right", global.player_[inp_what][what_player][2][action.right]);
	ini_write_real(section, key + "_down", global.player_[inp_what][what_player][1][action.down]);
	ini_write_real(section, key + "2_down", global.player_[inp_what][what_player][2][action.down]);
	ini_write_real(section, key + "_up", global.player_[inp_what][what_player][1][action.up]);
	ini_write_real(section, key + "2_up", global.player_[inp_what][what_player][2][action.up]);
	ini_write_real(section, key + "_tongue", global.player_[inp_what][what_player][1][action.tongue]);
	ini_write_real(section, key + "2_tongue", global.player_[inp_what][what_player][2][action.tongue]);
	ini_write_real(section, key + "_zoom_in", global.player_[inp_what][what_player][1][action.zoom_in]);
	ini_write_real(section, key + "2_zoom_in", global.player_[inp_what][what_player][2][action.zoom_in]);
	ini_write_real(section, key + "_zoom_out", global.player_[inp_what][what_player][1][action.zoom_out]);
	ini_write_real(section, key + "2_zoom_out", global.player_[inp_what][what_player][2][action.zoom_out]);
	ini_write_real(section, key + "_accept", global.player_[inp_what][what_player][1][action.accept]);
	ini_write_real(section, key + "2_accept", global.player_[inp_what][what_player][2][action.accept]);
	ini_write_real(section, key + "_back", global.player_[inp_what][what_player][1][action.back]);
	ini_write_real(section, key + "2_back", global.player_[inp_what][what_player][2][action.back]);
	ini_write_real(section, "player" + string(what_player) + "_up_is_also_jump", global.player_up_is_also_jump[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_double_jump_uses_jump_key", global.player_double_jump_uses_jump_key[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_down_is_also_crouch", global.player_down_is_also_crouch[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_double_tap_to_run", global.player_double_tap_to_run[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_run_toggle", global.player_run_toggle[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_double_tap_to_dive", global.player_double_tap_to_dive[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_cancel_dive_by_jump_or_dive", global.player_cancel_dive_by_jump_or_dive[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_cancel_dive_by_opposite_direction", global.player_cancel_dive_by_opposite_direction[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_down_and_jump_to_groundpound", global.player_down_and_jump_to_groundpound[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_wall_jump_setting", global.player_wall_jump_setting[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_drop_from_rope", global.player_drop_from_rope[what_player]);
	ini_write_real(section, "player" + string(what_player) + "_show_controls", global.player_show_controls[what_player]);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}