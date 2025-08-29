/* Store frequently used values */
var window_width = display_get_gui_width();
var window_height = display_get_gui_height();
var is_gamepad_connected = gamepad_is_connected(global.player_slot[1]);
var controls_used_for_navigation = global.controls_used_for_navigation;
var always_show_gamepad_buttons = global.always_show_gamepad_buttons;
var assist_enable = global.assist_enable;
var playergame = global.playergame;
var doing_clear_check_level = global.doing_clear_check_level;
var doing_clear_check_character = global.doing_clear_check_character;
var enable_transitions = global.enable_transitions;

/* Draw GUI elements */
scr_zoom_camera_draw_gui(10);

/* Show pause button if using mouse controls */
if (global.controls_used_for_navigation == "mouse")
{
	draw_menu_button_sprite(spr_menu_button, window_width - 185, 0,,, 0.5, 1, 185, 42, l10n_text(global.actually_play_edited_level ? "Pause" : "Edit Level"), "pause", "pause");
}

/* Show Assist Mode indication */
if (assist_enable)
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(window_width - 32, window_height - 32, l10n_text("Assist Mode"), global.default_text_size, c_black, c_white, 1);
}

/* Show Controls */
if (os_type != os_ios && os_type != os_android && !global.goal_active)
{
	for (var i = 1; i <= global.max_players; i++)
	{
		if (global.player_can_play[i] && global.player_show_controls[i] != 0 && player_show_controls_alpha[i] != 0)
		{
			scr_draw_show_controls(i);
		}
	}
}

/* Show input change prompts */
if (playergame == 1)
{
	if (global.show_prompt_when_changing_to_gamepad && show_controller_input_change_prompt_y != 0)
	{
		draw_sprite_ext(spr_change_input_to_controller, 0, 110, window_height + 300 + show_controller_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
	if (global.show_prompt_when_changing_to_keyboard_and_mouse && show_keyboard_and_mouse_input_change_prompt_y != 0)
	{
		draw_sprite_ext(spr_change_input_to_keyboard, 0, 110, window_height + 300 + show_keyboard_and_mouse_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
}

scr_virtual_keys();

/* Letterboxing during cutscenes */
if (show_letterbox > 0)
{
	draw_set_alpha(1);
	draw_rectangle_color(0, 0, window_width, letterbox_top_y, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(0, letterbox_bottom_y, window_width, window_height, c_black, c_black, c_black, c_black, false);
}

scr_draw_level_hud();

/* Clear check indicators */
if (doing_clear_check_level || doing_clear_check_character)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var clear_message = doing_clear_check_level ? "Clear from the start" : "Clear level 1 before upload";
	scr_draw_text_outlined(window_width * 0.5, 32, l10n_text(clear_message), global.default_text_size, c_black, c_white, 1);
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
}

/* Playtest Level Buttons */
if (show_playtest_buttons)
{
	var playtest_invincibility_blend = global.playtest_invincibility ? c_white : c_dkgray;
	var playtest_moonjump_blend = global.playtest_moonjump ? c_white : c_dkgray;

	if (global.character_select_in_this_menu == "level_editor")
	{
		draw_sprite_ext(spr_menu_button_pause, 0, 32, window_height - 32, 1, 1, 0, c_white, 1);

		if (is_gamepad_connected
		&& controls_used_for_navigation == "gamepad"
		|| always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(gp_select, 32 + 20, window_height - 32 + 20, 0.4, c_white, 1, 1, 1, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, vk_escape, 32 + 20, window_height - 32 + 20, 0.4, 0.4, 0, c_white, 1);
		}
	}

	draw_sprite_ext(spr_leveleditor_icon_invincibility, 0, playtest_invincibility_x, window_height - 32, 1, 1, 0, playtest_invincibility_blend, 1);
	draw_sprite_ext(spr_leveleditor_icon_moonjump, 0, playtest_moonjump_x, window_height - 32, 1, 1, 0, playtest_moonjump_blend, 1);

	if (is_gamepad_connected
	&& controls_used_for_navigation == "gamepad"
	|| always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(invincibility_button, playtest_invincibility_x + 20, window_height - 32 + 20, 0.4, c_white, 1, 1, 1, 1);
		scr_draw_gamepad_buttons(moonjump_button, playtest_moonjump_x + 20, window_height - 32 + 20, 0.4, c_white, 1, 1, 1, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, invincibility_key, playtest_invincibility_x + 20, window_height - 32 + 20, 0.4, 0.4, 0, c_white, 1);
		draw_sprite_ext(spr_keyboard_keys, moonjump_key, playtest_moonjump_x + 20, window_height - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
}

/* Darken screen when window is unfocused or during transitions */
if (enable_transitions && (black_screen_gui_alpha > 0.2 || pause_playtest))
{
	draw_set_alpha(black_screen_gui_alpha);
	draw_rectangle_color(0, 0, window_width * 2, window_height * 2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	if (lives >= 1 || pause_playtest)
	{
		scr_draw_loading(black_screen_gui_alpha);
	}
}
