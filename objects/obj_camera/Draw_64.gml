var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

scr_zoom_camera_draw_gui(10);

scr_draw_level_hud();

#region /* Show a pause button on screen when using the mouse */
if (global.controls_used_for_navigation == "mouse") {
	menu_cursor_index += 0.3;
	if (!global.actually_play_edited_level) {
		var pause_text = l10n_text("Edit Level");
	}
	else {
		var pause_text = l10n_text("Pause");
	}
	draw_menu_button_sprite(spr_menu_button, display_get_gui_width() - 185, 0,,, 0.5, 1, 185, 42, string(pause_text), "pause", "pause");
}
#endregion /* Show a pause button on screen when using the mouse END */

#region /* Show if you have Assist mode enabled or not */
if (global.assist_enable) {
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("Assist Mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Show if you have Assist mode enabled or not END */

#region /* Show Controls */
if (os_type != os_ios && os_type != os_android) {
	for (var i = 1; i <= global.max_players; i += 1) {
		if (!global.goal_active)
		&& (global.player_can_play[i])
		&& (global.player_show_controls[i] != 0)
		&& (player_show_controls_alpha[i] != 0) {
			scr_draw_show_controls(i);
		}
	}
}
#endregion /* Show Controls END */

#region /* Show what input is used */
if (global.playergame == 1) { /* Only show controller input change if there is only one player in the game */
	if (global.show_prompt_when_changing_to_gamepad && show_controller_input_change_prompt_y != 0) {
		draw_sprite_ext(spr_change_input_to_controller, 0, 110, get_window_height + 300 + show_controller_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
	if (global.show_prompt_when_changing_to_keyboard_and_mouse && show_keyboard_and_mouse_input_change_prompt_y != 0) {
		draw_sprite_ext(spr_change_input_to_keyboard, 0, 110, get_window_height + 300 + show_keyboard_and_mouse_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
}
#endregion /* Show what input is used END */

scr_virtual_keys();

#region /* Letterboxing during cutscenes (when the player object is absent) */
if (show_letterbox > 0) {
	draw_rectangle_color(0, 0, get_window_width, letterbox_top_y, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(0, letterbox_bottom_y, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
}
#endregion /* Letterboxing during cutscenes (when the player object is absent) END */

if (global.doing_clear_check_level || global.doing_clear_check_character) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (global.doing_clear_check_level) {
		scr_draw_text_outlined(get_window_width * 0.5, 32, l10n_text("Clear from the start"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (global.doing_clear_check_character) {
		scr_draw_text_outlined(get_window_width * 0.5, 32, l10n_text("Clear level 1 before upload"), global.default_text_size, c_black, c_white, 1);
	}
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
}

#region /* Playtest Level Buttons */
if (show_playtest_buttons) {
	if (global.playtest_invincibility) {
		var playtest_invincibility_blend = c_white;
	}
	else {
		var playtest_invincibility_blend = c_dkgray;
	}
	if (global.playtest_moonjump) {
		var playtest_moonjump_blend = c_white;
	}
	else {
		var playtest_moonjump_blend = c_dkgray;
	}
	if (global.character_select_in_this_menu == "level_editor") {
		draw_sprite_ext(spr_menu_button_pause, 0, 32, display_get_gui_height() - 32, 1, 1, 0, c_white, 1);
	}
	draw_sprite_ext(spr_leveleditor_icon_invincibility, 0, playtest_invincibility_x, display_get_gui_height() - 32, 1, 1, 0, playtest_invincibility_blend, 1);
	draw_sprite_ext(spr_leveleditor_icon_moonjump, 0, playtest_moonjump_x, display_get_gui_height() - 32, 1, 1, 0, playtest_moonjump_blend, 1);
	
	#region /* Draw Pause Key */
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons) {
		scr_draw_gamepad_buttons(gp_select, 32 + 20, display_get_gui_height() - 32 + 20, 0.4, c_white, 1, 1, 1, 1);
	}
	else {
		draw_sprite_ext(spr_keyboard_keys, vk_escape, 32 + 20, display_get_gui_height() - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Pause key END */
	
	#region /* Draw Invincibility Key */
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons) {
		scr_draw_gamepad_buttons(invincibility_button, playtest_invincibility_x + 20, display_get_gui_height() - 32 + 20, 0.4, c_white, 1, 1, 1, 1);
	}
	else {
		draw_sprite_ext(spr_keyboard_keys, invincibility_key, playtest_invincibility_x + 20, display_get_gui_height() - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Invincibility key END */
	
	#region /* Draw Moonjump Key */
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons) {
		scr_draw_gamepad_buttons(moonjump_button, playtest_moonjump_x + 20, display_get_gui_height() - 32 + 20, 0.4, c_white, 1, 1, 1, 1);
	}
	else {
		draw_sprite_ext(spr_keyboard_keys, moonjump_key, playtest_moonjump_x + 20, display_get_gui_height() - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Moonjump key END */
	
}
#endregion /* Playtest Level Buttons END */

#region /* Defeat Counter */
if (hud_show_defeats_y != -64 && global.show_defeats_counter) {
	if (sprite_exists(sprite_lives_icon)) {
		draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_defeats_y, 0.75, 0.75, 0, c_gray, 1);
	}
	else {
		draw_sprite_ext(spr_1up, 0, 32, hud_show_defeats_y, 0.75, 0.75, 0, c_gray, 1);
	}
	draw_line_width_color(32 - 16, hud_show_defeats_y - 16, 32 + 16, hud_show_defeats_y + 16, 3, c_red, c_red);
	draw_line_width_color(32 - 16, hud_show_defeats_y + 16, 32 + 16, hud_show_defeats_y - 16, 3, c_red, c_red);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, hud_show_defeats_y, string(global.lives_until_assist), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Defeat Counter END */

#region /* Lives Counter (Show above defeat counter) */
if (hud_show_lives_y != -64) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	if (sprite_exists(sprite_lives_icon)) {
		draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_lives_y, 1, 1, 0, c_white, 1);
	}
	else {
		draw_sprite_ext(spr_1up, 0, 32, hud_show_lives_y, 1, 1, 0, c_white, 1);
	}
	scr_draw_text_outlined(64, hud_show_lives_y, lives, global.default_text_size, c_black, c_white, 1);
}
#endregion /* Lives Counter (Show above defeat counter) END */

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (black_screen_gui_alpha > 0.2 || pause_playtest) {
	if (global.enable_transitions && !pause_playtest) {
		draw_set_alpha(black_screen_gui_alpha);
		draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	
	#region /* Draw loading screen when transitioning to other rooms */
	if (lives >= 1 || pause_playtest) {
		scr_draw_loading(black_screen_gui_alpha);
	}
	#endregion /* Draw loading screen when transitioning to other rooms END */
	
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */

scr_debug_screen();