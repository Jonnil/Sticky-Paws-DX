function scr_draw_show_controls(what_player = 1)
{
	/* You need to show what the controls are on the screen by default, so every new player knows how to control the game */
	/* On PC, not every new player is used to controlling a platformer on keyboard, if they don't own a gamepad */
	/* The players that knows how to control the game, should turn off the "show controls" themselves if they want to */
	/* This should hopefully give everyone the best opportunity to learn the controls */
	/* Go to "scr set default remapping player" and check that "player show controls" is set to 1 by default */
	
	if (global.player_show_controls[what_player] >= true)
	{
		if (player_show_controls_alpha[what_player] > 0)
		{
			if (!global.actually_play_edited_level)
			&& (global.play_edited_level)
			{
				var origin_x = 200;
			}
			else
			{
				var origin_x = 0;
			}
			var draw_text_dive = false;
			var draw_text_jump = false;
			var draw_text_crouch = false;
			var draw_text_run = false;
			var draw_text_left = false;
			var draw_text_right = false;
			var draw_text_down = false;
			var draw_text_up = false;
			
			var get_window_height = display_get_gui_height();
			var gamepad_player_is_connected = gamepad_is_connected(what_player - 1)
			
			#region /* Set correct variables for players */
			/* Create arrays for each player */
			var players = [	player[1],	player[2],	player[3],	player[4]];
			
			/* Use the what_player variable to index into the arrays */
			var player_instance = players[what_player - 1];
			
			var player_gamepad_button_dive = global.player_[inp.gp][what_player][1][action.dive];
			var player_gamepad_button2_dive = global.player_[inp.gp][what_player][2][action.dive];
			var player_key_dive = global.player_[inp.key][what_player][1][action.dive];
			var player_key2_dive = global.player_[inp.key][what_player][2][action.dive];
			
			var player_gamepad_button_jump = global.player_[inp.gp][what_player][1][action.jump];
			var player_gamepad_button2_jump = global.player_[inp.gp][what_player][2][action.jump];
			var player_key_jump = global.player_[inp.key][what_player][1][action.jump];
			var player_key2_jump = global.player_[inp.key][what_player][2][action.jump];
			
			var player_gamepad_button_accept = global.player_[inp.gp][what_player][1][action.accept];
			var player_gamepad_button2_accept = global.player_[inp.gp][what_player][2][action.accept];
			var player_key_accept = global.player_[inp.key][what_player][1][action.accept];
			var player_key2_accept = global.player_[inp.key][what_player][2][action.accept];
			
			var player_gamepad_button_crouch = global.player_[inp.gp][what_player][1][action.crouch];
			var player_gamepad_button2_crouch = global.player_[inp.gp][what_player][2][action.crouch];
			var player_key_crouch = global.player_[inp.key][what_player][1][action.crouch];
			var player_key2_crouch = global.player_[inp.key][what_player][2][action.crouch];
			
			var player_gamepad_button_crouch_toggle = global.player_[inp.gp][what_player][1][action.crouch_toggle];
			var player_gamepad_button2_crouch_toggle = global.player_[inp.gp][what_player][2][action.crouch_toggle];
			var player_key_crouch_toggle = global.player_[inp.key][what_player][1][action.crouch_toggle];
			var player_key2_crouch_toggle = global.player_[inp.key][what_player][2][action.crouch_toggle];
			
			var player_gamepad_button_run = global.player_[inp.gp][what_player][1][action.run];
			var player_gamepad_button2_run = global.player_[inp.gp][what_player][2][action.run];
			var player_key_run = global.player_[inp.key][what_player][1][action.run];
			var player_key2_run = global.player_[inp.key][what_player][2][action.run];
			
			var player_run_toggle = global.player_run_toggle[what_player];
			var player_gamepad_button_run_toggle = global.player_[inp.gp][what_player][1][action.run_toggle];
			var player_gamepad_button2_run_toggle = global.player_[inp.gp][what_player][2][action.run_toggle];
			var player_key_run_toggle = global.player_[inp.key][what_player][1][action.run_toggle];
			var player_key2_run_toggle = global.player_[inp.key][what_player][2][action.run_toggle];
			
			var player_gamepad_button_left = global.player_[inp.gp][what_player][1][action.left];
			var player_gamepad_button2_left = global.player_[inp.gp][what_player][2][action.left];
			var player_key_left = global.player_[inp.key][what_player][1][action.left];
			var player_key2_left = global.player_[inp.key][what_player][2][action.left];
			
			var player_gamepad_button_right = global.player_[inp.gp][what_player][1][action.right];
			var player_gamepad_button2_right = global.player_[inp.gp][what_player][2][action.right];
			var player_key_right = global.player_[inp.key][what_player][1][action.right];
			var player_key2_right = global.player_[inp.key][what_player][2][action.right];
			
			var player_gamepad_button_down = global.player_[inp.gp][what_player][1][action.down];
			var player_gamepad_button2_down = global.player_[inp.gp][what_player][2][action.down];
			var player_key_down = global.player_[inp.key][what_player][1][action.down];
			var player_key2_down = global.player_[inp.key][what_player][2][action.down];
			
			var player_gamepad_button_up = global.player_[inp.gp][what_player][1][action.up];
			var player_gamepad_button2_up = global.player_[inp.gp][what_player][2][action.up];
			var player_key_up = global.player_[inp.key][what_player][1][action.up];
			var player_key2_up = global.player_[inp.key][what_player][2][action.up];
			#endregion /* Set correct variables for players END */
			
			#region /* Show Controls for Player */
			if (player_instance > 0)
			&& (instance_exists(player_instance))
			&& (global.player_can_play[what_player])
			&& (!global.goal_active)
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				
				#region /* Show Player Dive Key */
				if (global.controls_used_for_navigation == "gamepad" && gamepad_player_is_connected) || (global.always_show_gamepad_buttons) {
					var dive_button = max(player_gamepad_button_dive, player_gamepad_button2_dive);
					if (dive_button != noone) {
						draw_text_dive = true;
						scr_draw_gamepad_buttons(dive_button, player_show_dive_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
					}
				} else {
					var dive_key = max(player_key_dive, player_key2_dive);
					if (dive_key != noone) {
						draw_text_dive = true;
						draw_sprite_ext(spr_keyboard_keys, dive_key, player_show_dive_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
					}
				}
				if (draw_text_dive)
				{
					scr_draw_text_outlined(player_show_dive_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Dive"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Dive Key END */
				
				#region /* Show Player Jump Key */
				if (global.controls_used_for_navigation == "gamepad" && gamepad_player_is_connected) || (global.always_show_gamepad_buttons) {
					var jump_button = max(player_gamepad_button_jump, player_gamepad_button2_jump);
					if (jump_button != noone) {
						draw_text_jump = true;
						scr_draw_gamepad_buttons(jump_button, player_show_jump_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
					}
				} else {
					var jump_key = max(player_key_jump, player_key2_jump);
					if (jump_key != noone) {
						draw_text_jump = true;
						draw_sprite_ext(spr_keyboard_keys, jump_key, player_show_jump_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
					}
				}
				if (draw_text_jump)
				{
					scr_draw_text_outlined(player_show_jump_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Jump"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Jump Key END */
				
				#region /* Show Player Crouch Key */
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button_crouch > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_crouch = true;
					scr_draw_gamepad_buttons(player_gamepad_button_crouch, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button2_crouch > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_crouch = true;
					scr_draw_gamepad_buttons(player_gamepad_button2_crouch, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button_crouch_toggle > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_crouch = true;
					scr_draw_gamepad_buttons(player_gamepad_button_crouch_toggle, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button2_crouch_toggle > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_crouch = true;
					scr_draw_gamepad_buttons(player_gamepad_button2_crouch_toggle, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key_crouch > noone)
				{
					draw_text_crouch = true;
					draw_sprite_ext(spr_keyboard_keys, player_key_crouch, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key2_crouch > noone)
				{
					draw_text_crouch = true;
					draw_sprite_ext(spr_keyboard_keys, player_key2_crouch, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key_crouch_toggle > noone)
				{
					draw_text_crouch = true;
					draw_sprite_ext(spr_keyboard_keys, player_key_crouch_toggle, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key2_crouch_toggle > noone)
				{
					draw_text_crouch = true;
					draw_sprite_ext(spr_keyboard_keys, player_key2_crouch_toggle, player_show_crouch_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				if (draw_text_crouch)
				{
					scr_draw_text_outlined(player_show_crouch_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Crouch"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Crouch Key END */
				
				#region /* Show Player Run Key */
				if (!player_run_toggle)
				{
					if (gamepad_player_is_connected)
					&& (global.controls_used_for_navigation == "gamepad")
					&& (player_gamepad_button_run > noone)
					|| (global.always_show_gamepad_buttons)
					{
						draw_text_run = true;
						scr_draw_gamepad_buttons(player_gamepad_button_run, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
					}
					else
					if (gamepad_player_is_connected)
					&& (global.controls_used_for_navigation == "gamepad")
					&& (player_gamepad_button2_run > noone)
					|| (global.always_show_gamepad_buttons)
					{
						draw_text_run = true;
						scr_draw_gamepad_buttons(player_gamepad_button2_run, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
					}
					else
					if (gamepad_player_is_connected)
					&& (global.controls_used_for_navigation == "gamepad")
					&& (player_gamepad_button_run_toggle > noone)
					|| (global.always_show_gamepad_buttons)
					{
						draw_text_run = true;
						scr_draw_gamepad_buttons(player_gamepad_button_run_toggle, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
					}
					else
					if (gamepad_player_is_connected)
					&& (global.controls_used_for_navigation == "gamepad")
					&& (player_gamepad_button2_run_toggle > noone)
					|| (global.always_show_gamepad_buttons)
					{
						draw_text_run = true;
						scr_draw_gamepad_buttons(player_gamepad_button2_run_toggle, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
					}
					else
					if (player_key_run > noone)
					{
						draw_text_run = true;
						draw_sprite_ext(spr_keyboard_keys, player_key_run, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
					}
					else
					if (player_key2_run > noone)
					{
						draw_text_run = true;
						draw_sprite_ext(spr_keyboard_keys, player_key2_run, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
					}
					else
					if (player_key_run_toggle > noone)
					{
						draw_text_run = true;
						draw_sprite_ext(spr_keyboard_keys, player_key_run_toggle, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
					}
					else
					if (player_key2_run_toggle > noone)
					{
						draw_text_run = true;
						draw_sprite_ext(spr_keyboard_keys, player_key2_run_toggle, player_show_run_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
					}
				}
				if (draw_text_run)
				{
					scr_draw_text_outlined(player_show_run_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Run"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Run Key END */
				
				#region /* Show Player Left Key */
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button_left > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_left = true;
					scr_draw_gamepad_buttons(player_gamepad_button_left, player_show_left_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button2_left > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_left = true;
					scr_draw_gamepad_buttons(player_gamepad_button2_left, player_show_left_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key_left > noone)
				{
					draw_text_left = true;
					draw_sprite_ext(spr_keyboard_keys, player_key_left, player_show_left_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key2_left > noone)
				{
					draw_text_left = true;
					draw_sprite_ext(spr_keyboard_keys, player_key2_left, player_show_left_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				if (draw_text_left)
				{
					scr_draw_text_outlined(player_show_left_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Left"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Left Key END */
				
				#region /* Show Player Right Key */
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button_right > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_right = true;
					scr_draw_gamepad_buttons(player_gamepad_button_right, player_show_right_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button2_right > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_right = true;
					scr_draw_gamepad_buttons(player_gamepad_button2_right, player_show_right_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key_right > noone)
				{
					draw_text_right = true;
					draw_sprite_ext(spr_keyboard_keys, player_key_right, player_show_right_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key2_right > noone)
				{
					draw_text_right = true;
					draw_sprite_ext(spr_keyboard_keys, player_key2_right, player_show_right_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				if (draw_text_right)
				{
					scr_draw_text_outlined(player_show_right_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Right"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Right Key END */
				
				#region /* Show Player Down Key */
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button_down > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_down = true;
					scr_draw_gamepad_buttons(player_gamepad_button_down, player_show_down_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button2_down > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_down = true;
					scr_draw_gamepad_buttons(player_gamepad_button2_down, player_show_down_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key_down > noone)
				{
					draw_text_down = true;
					draw_sprite_ext(spr_keyboard_keys, player_key_down, player_show_down_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key2_down > noone)
				{
					draw_text_down = true;
					draw_sprite_ext(spr_keyboard_keys, player_key2_down, player_show_down_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				if (draw_text_down)
				{
					scr_draw_text_outlined(player_show_down_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Down"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Down Key END */
				
				#region /* Show Player Up Key */
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button_up > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_up = true;
					scr_draw_gamepad_buttons(player_gamepad_button_up, player_show_up_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (gamepad_player_is_connected)
				&& (global.controls_used_for_navigation == "gamepad")
				&& (player_gamepad_button2_up > noone)
				|| (global.always_show_gamepad_buttons)
				{
					draw_text_up = true;
					scr_draw_gamepad_buttons(player_gamepad_button2_up, player_show_up_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key_up > noone)
				{
					draw_text_up = true;
					draw_sprite_ext(spr_keyboard_keys, player_key_up, player_show_up_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				else
				if (player_key2_up > noone)
				{
					draw_text_up = true;
					draw_sprite_ext(spr_keyboard_keys, player_key2_up, player_show_up_key_x[what_player], get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
				}
				if (draw_text_up)
				{
					scr_draw_text_outlined(player_show_up_key_x[what_player] + 22, get_window_height - show_player_controls_y[what_player], l10n_text("Up"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				}
				#endregion /* Show Player Down Key END */
				
			}
			else
			if (!global.goal_active)
			&& (lives > 0)
			&& (can_spawn_player[what_player])
			&& (instance_exists(obj_player))
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				
				#region /* Show Player Join Game Key */
				var show_gamepad_buttons = global.always_show_gamepad_buttons || (global.controls_used_for_navigation == "gamepad" && gamepad_player_is_connected);
				if (show_gamepad_buttons) {
					var gamepad_button = max(player_gamepad_button_accept, player_gamepad_button2_accept);
					if (gamepad_button != noone) {
						scr_draw_gamepad_buttons(gamepad_button, string_width(l10n_text("Join Game")) + 32, get_window_height - show_player_controls_y[what_player], 0.5, c_white, player_show_controls_alpha[what_player]);
					}
				} else {
					var join_key = max(player_key_accept, player_key2_accept);
					if (join_key != noone) {
						draw_sprite_ext(spr_keyboard_keys, join_key, string_width(l10n_text("Join Game")) + 32, get_window_height - show_player_controls_y[what_player], 0.5, 0.5, 0, c_white, player_show_controls_alpha[what_player]);
					}
				}
				scr_draw_text_outlined(30, get_window_height - show_player_controls_y[what_player], l10n_text("Join Game"), global.default_text_size, c_black, global.player_color[what_player], player_show_controls_alpha[what_player]);
				#endregion /* Show Player Join Game Key END */
				
			}
			#endregion /* Show Controls for Player END */
			
		}
	}
}