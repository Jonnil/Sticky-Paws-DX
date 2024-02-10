var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var clear_prompt_x = 164;
if (instance_exists(obj_level)) /* Must check if obj_level exists or not */
{
	var nearest_level = instance_nearest(x, y, obj_level);
	var distance_to_level = distance_to_object(nearest_level);
}
else
{
	var nearest_level = 0;
	var distance_to_level = 0;
}

#region /* Show Enter Level Key */
if (can_move)
&& (can_enter_level >= 30)
&& (point_distance(xx, yy, x, y) < 30)
&& (distance_to_level < 4)
&& (speed == 0)
&& (nearest_level.clear_rate != "closed")
&& (!global.pause) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, get_window_height - 20, l10n_text("Play"), global.default_text_size, c_black, c_white, 1);
	
	if (global.controls_used_for_navigation == "gamepad")
	&& (gamepad_is_connected(global.player_slot[player]))
	|| (global.always_show_gamepad_buttons) {
		scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.accept], 32, get_window_height - 20, 0.5, c_white, 1, 1, 1, player);
	}
	else
	if (global.player_can_play[player]) {
		if (global.player_[inp.key][player][1][action.accept] > noone) {
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
		else
		if (global.player_[inp.key][player][2][action.accept] > noone) {
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.accept], 32, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
	}
	
	#region /* Click the play button in world map */
	if (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 0, display_get_gui_height() - 42, 140, display_get_gui_height())
	|| point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		draw_set_alpha(0.5);
		draw_roundrect_color_ext(0, display_get_gui_height() - 42, 140, display_get_gui_height(), 50, 50, c_white, c_white, false);
		draw_set_alpha(1);
	}
	#endregion /* Click the play button in world map END */
	
}
#endregion /* Show Enter Level Key END */

#region /* Show Clear Level Key in debug */
if (global.debug_screen) {
	if (can_move)
	&& (can_enter_level >= 30)
	&& (distance_to_level < 4)
	&& (speed == 0)
	&& (nearest_level.clear_rate = "enter")
	&& (!global.pause) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(clear_prompt_x + 32, get_window_height - 20, l10n_text("Clear"), global.default_text_size, c_black, c_white, 1);
		if (gamepad_is_connected(global.player_slot[player]))
		&& (global.controls_used_for_navigation == "gamepad") {
			scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.back], clear_prompt_x, get_window_height - 20, 0.5, c_white, 1, 1, 1, player);
		}
		else
		if (global.player_can_play[player]) {
			if (global.player_[inp.key][player][1][action.back] > noone) {
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
			else
			if (global.player_[inp.key][player][2][action.back] > noone) {
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.back], clear_prompt_x, get_window_height - 20, 0.5, 0.5, 0, c_white, 1);
			}
		}
		
		#region /* Click the clear button in world map */
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 141, display_get_gui_height() - 42, 140 + 140, display_get_gui_height())) {
			draw_set_alpha(0.5);
			draw_roundrect_color_ext(141, display_get_gui_height() - 42, 140 + 140, display_get_gui_height(), 50, 50, c_white, c_white, false);
			draw_set_alpha(1);
		}
		#endregion /* Click the clear button in world map END */
		
	}
}
#endregion /* Show Clear Level Key in debug END */

#region /* Show Level Info */
if (iris_xscale > 9)
&& (move_delay > 10)
&& (point_distance(xx, yy, x, y) < 30)
&& (distance_to_level < 4)
&& (nearest_level.level_number != 0) {
	if (nearest_level.clear_rate == "enter")
	|| (nearest_level.clear_rate == "clear") {
		var show_level_info_x = 180;
		var show_level_info_y = 200;
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		show_big_collectibles_y = -160;
		best_time_y = -128;
		best_score_y = -96;
		times_cleared_y = -64;
		if (global.show_defeats_counter)
		&& (nearest_level.number_of_defeats > 0) {
			total_defeats_y = -32;
		}
		else {
			total_defeats_y = -64;
		}
		
		if (global.show_defeats_counter)
		&& (nearest_level.number_of_defeats > 0)
		|| (nearest_level.number_of_clears > 0)
		|| (nearest_level.level_score > 0)
		|| (nearest_level.timeattack_realmillisecond < 999999999)
		&& (nearest_level.timeattack_realmillisecond > 0)
		|| (at_least_one_big_collectible) {
			draw_set_alpha(0.9);
			draw_roundrect_color_ext(show_level_info_x - 140, show_level_info_y - abs(show_big_collectibles_y) - 16, show_level_info_x + 140, show_level_info_y + total_defeats_y + 16, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
		}
		
		#region /* Total number of defeats */
		if (global.show_defeats_counter && nearest_level.number_of_defeats > 0) {
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + total_defeats_y, l10n_text("Total Defeats") + ": " + string(nearest_level.number_of_defeats), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Total number of defeats END */
		
		#region /* Number of times played */
		if (nearest_level.number_of_clears > 0) {
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + times_cleared_y, l10n_text("Times Passed") + ": " + string(nearest_level.number_of_clears), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Number of times played END */
		
		#region /* Show High Score */
		if (nearest_level.level_score > 0) {
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + best_score_y, l10n_text("Best Score") + ": " + string(nearest_level.level_score), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Show High Score END */
		
		#region /* Show Fastest Time */
		if (nearest_level.timeattack_realmillisecond < 999999999)
		&& (nearest_level.timeattack_realmillisecond > 0) {
			scr_draw_text_outlined(show_level_info_x, show_level_info_y + best_time_y, l10n_text("Best Time") + ": " + string(nearest_level.timeattack_minute) + ":" +
			string(string_replace_all(string_format(nearest_level.timeattack_second, 2, 0), " ", "0")) + "." +
			string(string_replace_all(string_format(nearest_level.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Show Fastest Time END */
		
		#region /* Show Big Collectible */
		if (at_least_one_big_collectible) {
			for(var i = 1; i <= global.max_big_collectible; i += 1) {
				if (global.resource_pack_sprite_big_collectible > 0
				&& nearest_level.big_collectible[i]) {
					draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, show_level_info_x - 72 + (24 * i), show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
				}
				else
				if (global.resource_pack_sprite_big_collectible > 0) {
					draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, show_level_info_x - 72 + (24 * i), show_level_info_y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
				}
			}
		}
		#endregion /* Show Big Collectible END */
		
	}
}
#endregion /* Show Level Info END */

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();

#region /* Make the screen completly black in Draw GUI during specific cases, so there is no chance to see something you're not supposed to see */
if (iris_yscale <= 0.002)
|| (brand_new_file && can_enter_level_automatically)
|| (black_screen_at_start_delay < 1) { /* Have a black screen at the first frame so transitions look natural */
	if (global.enable_transitions) {
		draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
	}
	black_screen_at_start_delay ++;
	scr_draw_loading(1); /* Draw loading screen when transitioning to other rooms */
}
#endregion /* Make the screen completly black in Draw GUI during specific cases, so there is no chance to see something you're not supposed to see END */