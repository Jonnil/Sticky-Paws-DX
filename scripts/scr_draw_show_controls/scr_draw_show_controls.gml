/* Have a function for drawing the on-screen controls, for less repeatable code */
function scr_draw_show_controls_key(show_controls_name = "", gp_button = noone, gp_button2 = noone, player_key = noone, player_key2 = noone, player_show_key_x, what_player = 1, yy = show_player_controls_y[what_player], alpha = player_show_controls_alpha[what_player], gp_is_connected, get_window_height) {
	var draw_text_show_controls = false;
	
	var show_controls_button = (gp_button != noone) ? gp_button : gp_button2;
	var show_controls_key = (player_key != noone) ? player_key : player_key2;
	
	if (show_controls_button != noone) && (global.controls_used_for_navigation == "gamepad" && gp_is_connected || global.always_show_gamepad_buttons) {
		draw_text_show_controls = true;
		scr_draw_gamepad_buttons(show_controls_button, player_show_key_x, get_window_height - yy, 0.5, c_white, alpha, 1, 1, what_player);
	}
	else
	if (show_controls_key != noone) {
		draw_text_show_controls = true;
		draw_sprite_ext(spr_keyboard_keys, show_controls_key, player_show_key_x, get_window_height - yy, 0.5, 0.5, 0, c_white, alpha);
	}
	
	if (draw_text_show_controls) {
		scr_draw_text_outlined(player_show_key_x + 22, get_window_height - yy, l10n_text(show_controls_name), global.default_text_size, c_black, global.player_color[what_player], alpha);
	}
}

function scr_draw_show_controls(what_player = 1, yy = show_player_controls_y[what_player], alpha = player_show_controls_alpha[what_player], player_exist = player[what_player]) {
	/* You need to show what the controls are on the screen by default, so every new player knows how to control the game */
	/* On PC, not every new player is used to controlling a platformer on keyboard, if they don't own a gamepad */
	/* The players that knows how to control the game, should turn off the "show controls" themselves if they want to */
	/* This should hopefully give everyone the best opportunity to learn the controls */
	/* Go to "scr set default remapping player" and check that "player show controls" is set to 1 by default */
	
	var get_window_height = display_get_gui_height();
	var gamepad_player_is_connected = gamepad_is_connected(what_player - 1);
	
	#region /* Set correct variables for players */
	var gp_button_dive = global.player_[inp.gp][what_player][1][action.dive];
	var gp_button2_dive = global.player_[inp.gp][what_player][2][action.dive];
	var player_key_dive = global.player_[inp.key][what_player][1][action.dive];
	var player_key2_dive = global.player_[inp.key][what_player][2][action.dive];
	
	var gp_button_jump = global.player_[inp.gp][what_player][1][action.jump];
	var gp_button2_jump = global.player_[inp.gp][what_player][2][action.jump];
	var player_key_jump = global.player_[inp.key][what_player][1][action.jump];
	var player_key2_jump = global.player_[inp.key][what_player][2][action.jump];
	
	var gp_button_accept = global.player_[inp.gp][what_player][1][action.accept];
	var gp_button2_accept = global.player_[inp.gp][what_player][2][action.accept];
	var player_key_accept = global.player_[inp.key][what_player][1][action.accept];
	var player_key2_accept = global.player_[inp.key][what_player][2][action.accept];
	
	var gp_button_crouch = global.player_[inp.gp][what_player][1][action.crouch];
	var gp_button2_crouch = global.player_[inp.gp][what_player][2][action.crouch];
	var player_key_crouch = global.player_[inp.key][what_player][1][action.crouch];
	var player_key2_crouch = global.player_[inp.key][what_player][2][action.crouch];
	
	/* If crouch buttons are not found, find crouch toggle buttons instead */
	if (gp_button_crouch == noone) {
		var gp_button_crouch = global.player_[inp.gp][what_player][1][action.crouch_toggle];
	}
	if (gp_button2_crouch == noone) {
		var gp_button2_crouch = global.player_[inp.gp][what_player][2][action.crouch_toggle];
	}
	if (player_key_crouch == noone) {
		var player_key_crouch = global.player_[inp.key][what_player][1][action.crouch_toggle];
	}
	if (player_key2_crouch == noone) {
		var player_key2_crouch = global.player_[inp.key][what_player][2][action.crouch_toggle];
	}
	
	var gp_button_run = global.player_[inp.gp][what_player][1][action.run];
	var gp_button2_run = global.player_[inp.gp][what_player][2][action.run];
	var player_key_run = global.player_[inp.key][what_player][1][action.run];
	var player_key2_run = global.player_[inp.key][what_player][2][action.run];
	
	/* If run buttons are not found, find run toggle buttons instead */
	if (gp_button_run == noone) {
		var gp_button_run = global.player_[inp.gp][what_player][1][action.run_toggle];
	}
	if (gp_button2_run == noone) {
		var gp_button2_run = global.player_[inp.gp][what_player][2][action.run_toggle];
	}
	if (player_key_run == noone) {
		var player_key_run = global.player_[inp.key][what_player][1][action.run_toggle];
	}
	if (player_key2_run == noone) {
		var player_key2_run = global.player_[inp.key][what_player][2][action.run_toggle];
	}
	
	var gp_button_left = global.player_[inp.gp][what_player][1][action.left];
	var gp_button2_left = global.player_[inp.gp][what_player][2][action.left];
	var player_key_left = global.player_[inp.key][what_player][1][action.left];
	var player_key2_left = global.player_[inp.key][what_player][2][action.left];
	
	var gp_button_right = global.player_[inp.gp][what_player][1][action.right];
	var gp_button2_right = global.player_[inp.gp][what_player][2][action.right];
	var player_key_right = global.player_[inp.key][what_player][1][action.right];
	var player_key2_right = global.player_[inp.key][what_player][2][action.right];
	
	var gp_button_down = global.player_[inp.gp][what_player][1][action.down];
	var gp_button2_down = global.player_[inp.gp][what_player][2][action.down];
	var player_key_down = global.player_[inp.key][what_player][1][action.down];
	var player_key2_down = global.player_[inp.key][what_player][2][action.down];
	
	var gp_button_up = global.player_[inp.gp][what_player][1][action.up];
	var gp_button2_up = global.player_[inp.gp][what_player][2][action.up];
	var player_key_up = global.player_[inp.key][what_player][1][action.up];
	var player_key2_up = global.player_[inp.key][what_player][2][action.up];
	#endregion /* Set correct variables for players END */
	
	#region /* Show Controls for Player */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	if (player_exist > 0) {
		scr_draw_show_controls_key("Dive", gp_button_dive, gp_button2_dive, player_key_dive, player_key2_dive, player_show_dive_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
		scr_draw_show_controls_key("Jump", gp_button_jump, gp_button2_jump, player_key_jump, player_key2_jump, player_show_jump_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
		scr_draw_show_controls_key("Crouch", gp_button_crouch, gp_button2_crouch, player_key_crouch, player_key2_crouch, player_show_crouch_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
		scr_draw_show_controls_key("Run", gp_button_run, gp_button2_run, player_key_run, player_key2_run, player_show_run_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
		scr_draw_show_controls_key("Left", gp_button_left, gp_button2_left, player_key_left, player_key2_left, player_show_left_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
		scr_draw_show_controls_key("Right", gp_button_right, gp_button2_right, player_key_right, player_key2_right, player_show_right_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
		scr_draw_show_controls_key("Down", gp_button_down, gp_button2_down, player_key_down, player_key2_down, player_show_down_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
		scr_draw_show_controls_key("Up", gp_button_up, gp_button2_up, player_key_up, player_key2_up, player_show_up_key_x[what_player], what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
	}
	else
	if (lives != 0 && can_spawn_player[what_player]) {
		scr_draw_show_controls_key("Join Game", gp_button_accept, gp_button2_accept, player_key_accept, player_key2_accept, 32, what_player, yy, alpha, gamepad_player_is_connected, get_window_height);
	}
	#endregion /* Show Controls for Player END */
	
}