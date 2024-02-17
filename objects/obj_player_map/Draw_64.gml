/* Store frequently used values */
var window_height = display_get_gui_height();
var window_width = display_get_gui_width();
var clear_prompt_x = 164;

/* Common conditions for multiple sections */
var common_conditions_met = (nearest_level != noone && can_move && can_enter_level >= 30 && distance_to_level < 4 && speed == 0);

/* Show Enter Level Key */
if (common_conditions_met && nearest_level.clear_rate != "closed") {
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    scr_draw_text_outlined(64, window_height - 20, l10n_text("Play"), global.default_text_size, c_black, c_white, 1);

    if ((global.controls_used_for_navigation == "gamepad" && gamepad_is_connected(global.player_slot[player])) || global.always_show_gamepad_buttons) {
        scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.accept], 32, window_height - 20, 0.5, c_white, 1, 1, 1, player);
    } else if (global.player_can_play[player]) {
        var key_accept = (global.player_[inp.key][player][1][action.accept] > noone) ? global.player_[inp.key][player][1][action.accept] : global.player_[inp.key][player][2][action.accept];
        if (key_accept > noone) {
            draw_sprite_ext(spr_keyboard_keys, key_accept, 32, window_height - 20, 0.5, 0.5, 0, c_white, 1);
        }
    }
}

/* Show Clear Level Key in debug */
if (global.debug_screen && common_conditions_met && nearest_level.clear_rate == "enter") {
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    scr_draw_text_outlined(clear_prompt_x + 32, window_height - 20, l10n_text("Clear"), global.default_text_size, c_black, c_white, 1);

    if (gamepad_is_connected(global.player_slot[player]) && global.controls_used_for_navigation == "gamepad") {
        scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.back], clear_prompt_x, window_height - 20, 0.5, c_white, 1, 1, 1, player);
    } else if (global.player_can_play[player]) {
        var key_back = (global.player_[inp.key][player][1][action.back] > noone) ? global.player_[inp.key][player][1][action.back] : global.player_[inp.key][player][2][action.back];
        if (key_back > noone) {
            draw_sprite_ext(spr_keyboard_keys, key_back, clear_prompt_x, window_height - 20, 0.5, 0.5, 0, c_white, 1);
        }
    }
}

#region /* Show Level Info */
/* Check if conditions are met to show level info */
if (nearest_level != noone && iris_xscale > 9 && move_delay > 10 && distance_to_level < 4 && nearest_level.level_number != 0) {
    if (nearest_level.clear_rate == "enter" || nearest_level.clear_rate == "clear") {
        var show_level_info_x = 180;
        var show_level_info_y = 200;
        var show_big_collectibles_y = -160;
        var total_defeats_y = global.show_defeats_counter && nearest_level.number_of_defeats > 0 ? -32 : -64;
		
        var show_info = global.show_defeats_counter && nearest_level.number_of_defeats > 0 ||
                       nearest_level.number_of_clears > 0 ||
                       nearest_level.level_score > 0 ||
                       (nearest_level.timeattack_realmillisecond < 999999999 && nearest_level.timeattack_realmillisecond > 0) ||
                       at_least_one_big_collectible;
		
        if (show_info) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_alpha(0.9);
            draw_roundrect_color_ext(show_level_info_x - 140, show_level_info_y - abs(show_big_collectibles_y) - 16, show_level_info_x + 140, show_level_info_y + total_defeats_y + 48, 50, 50, c_black, c_black, false);
            draw_set_alpha(1);
			
            /* Draw level info */
            var total_defeats_text = "";
			if (global.show_defeats_counter && nearest_level.number_of_defeats > 0) {
				var total_defeats_text = l10n_text("Total Defeats") + ": " + string(nearest_level.number_of_defeats) + "\n";
			}
			scr_draw_text_outlined(show_level_info_x, show_level_info_y - 150,
			best_time_text + "\n" +
			l10n_text("Best Score") + ": " + string(nearest_level.level_score) + "\n" +
			l10n_text("Times Passed") + ": " + string(nearest_level.number_of_clears) + "\n" +
			total_defeats_text +
			l10n_text("Total Big Fish") + ": " + string(total_big_collectibles),
			global.default_text_size, c_black, c_white, 1);
            
			if (at_least_one_big_collectible) {
                for (var i = 1; i <= global.max_big_collectible; i++) {
                    var sprite_to_draw = global.resource_pack_sprite_big_collectible_outline;
                    if (global.resource_pack_sprite_big_collectible > 0 && nearest_level.big_collectible[i]) {
                        sprite_to_draw = global.resource_pack_sprite_big_collectible;
                    }
                    draw_sprite_ext(sprite_to_draw, 0, show_level_info_x - 72 + (24 * i), show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
                }
            }
        }
    }
}
#endregion /* Show Level Info END */

/* Draw GUI when conditions are met */
if (iris_yscale <= 0.002 || (brand_new_file && can_enter_level_automatically) || black_screen_at_start_delay < 1) {
    if (global.enable_transitions) {
        draw_rectangle_color(0, 0, window_width, window_height, c_black, c_black, c_black, c_black, false);
    }
    black_screen_at_start_delay++;
    scr_draw_loading(1); /* Draw loading screen when transitioning to other rooms */
}

/* Draw darken screen and cursor mouse */
scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();