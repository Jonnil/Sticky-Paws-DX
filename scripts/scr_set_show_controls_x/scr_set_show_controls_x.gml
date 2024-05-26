function scr_set_show_controls_x(what_player = 1, xx = 32)
{
	
	#region /* Show keys x positions */
	/* For some reason, code within "Show keys x positions" lags the Switch version */
	player_show_dive_key_x[what_player] = xx;
	player_show_jump_key_x[what_player] = string_width(l10n_text("Pounce")) + (xx + 43);
	player_show_crouch_key_x[what_player] = player_show_jump_key_x[what_player] + string_width(l10n_text("Jump")) + 37;
	if (!global.player_run_toggle[what_player]) {
		player_show_run_key_x[what_player] = player_show_crouch_key_x[what_player] + string_width(l10n_text("Crouch")) + 37;
		player_show_left_key_x[what_player] = player_show_run_key_x[what_player] + string_width(l10n_text("Run")) + 37;
		player_show_right_key_x[what_player] = player_show_left_key_x[what_player] + string_width(l10n_text("Left")) + 37;
		player_show_down_key_x[what_player] = player_show_right_key_x[what_player] + string_width(l10n_text("Right")) + 37;
		player_show_up_key_x[what_player] = player_show_down_key_x[what_player] + string_width(l10n_text("Down")) + 37;
	}
	else {
		player_show_run_key_x[what_player] = -999; /* Hide the run key if you have "Always Run" turned on */
		player_show_left_key_x[what_player] = player_show_crouch_key_x[what_player] + string_width(l10n_text("Crouch")) + 37;
		player_show_right_key_x[what_player] = player_show_left_key_x[what_player] + string_width(l10n_text("Left")) + 37;
		player_show_down_key_x[what_player] = player_show_right_key_x[what_player] + string_width(l10n_text("Right")) + 37;
		player_show_up_key_x[what_player] = player_show_down_key_x[what_player] + string_width(l10n_text("Down")) + 37;
	}
	#endregion /* Show keys x positions END */
	
}