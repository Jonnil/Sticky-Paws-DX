function scr_draw_show_controls_map()
{

	#region /* Show arrows where you can walk */
	if (can_move && can_enter_level >= 30 && speed == 0) {
		if (can_show_arrows < 120) {
			can_show_arrows++;
		}
		if (can_show_arrows >= 120) {
			show_arrows_alpha = lerp(show_arrows_alpha, 1, 0.05);

			#region /* Can go up */
			if (!place_meeting(x, y - 1, obj_wall)) {
				if (global.controls_used_for_navigation == "gamepad" && gamepad_is_connected(global.player_slot[player]) || global.always_show_gamepad_buttons) {
					scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.up], x, y - 48, 0.5, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha, 1, 1, player);
				}
				else if (global.player_can_play[player]) {
					if (global.player_[inp.key][player][1][action.up] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
					else if (global.player_[inp.key][player][2][action.up] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
				}
			}
			#endregion /* Can go up END */

			#region /* Can go down */
			if (!place_meeting(x, y + 1, obj_wall)) {
				if (global.controls_used_for_navigation == "gamepad" && gamepad_is_connected(global.player_slot[player]) || global.always_show_gamepad_buttons) {
					scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.down], x, y + 48, 0.5, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha, 1, 1, player);
				}
				else if (global.player_can_play[player]) {
					if (global.player_[inp.key][player][1][action.down] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
					else if (global.player_[inp.key][player][2][action.down] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
				}
			}
			#endregion /* Can go down END */

			#region /* Can go left */
			if (!place_meeting(x - 1, y, obj_wall)) {
				if (global.controls_used_for_navigation == "gamepad" && gamepad_is_connected(global.player_slot[player]) || global.always_show_gamepad_buttons) {
					scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.left], x - 48, y, 0.5, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha, 1, 1, player);
				}
				else if (global.player_can_play[player]) {
					if (global.player_[inp.key][player][1][action.left] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
					else if (global.player_[inp.key][player][2][action.left] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
				}
			}
			#endregion /* Can go left END */

			#region /* Can go right */
			if (!place_meeting(x + 1, y, obj_wall)) {
				if (global.controls_used_for_navigation == "gamepad" && gamepad_is_connected(global.player_slot[player]) || global.always_show_gamepad_buttons) {
					scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.right], x + 48, y, 0.5, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha, 1, 1, player);
				}
				else if (global.player_can_play[player]) {
					if (global.player_[inp.key][player][1][action.right] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
					else if (global.player_[inp.key][player][2][action.right] > noone) {
						draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1) * show_arrows_alpha);
					}
				}
			}
			#endregion /* Can go right END */

		}
	}
	else {
		can_show_arrows = 0;
		show_arrows_alpha = 0;
	}
	#endregion /* Show arrows where you can walk END */

}
