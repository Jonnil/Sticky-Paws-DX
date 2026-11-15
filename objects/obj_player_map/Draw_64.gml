/* Store frequently used values */
var window_height = display_get_gui_height();
var window_width = display_get_gui_width();
var clear_prompt_x = 164;

/* Common conditions for multiple sections */
var common_conditions_met = (nearest_level != noone && stop_at_level && can_move && can_enter_level >= 30 && distance_to_level < 4 && speed == 0);

if (!scr_capture_mode_is_active())
{
/* Show Enter Level Key */
if (common_conditions_met
&& nearest_level.clear_rate != "closed")
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, window_height - 20, l10n_text("Play"), global.default_text_size, c_black, c_white, 1);

	if ((global.controls_used_for_navigation == "gamepad" && gamepad_is_connected(global.player_slot[player])) || global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.accept], 32, window_height - 20, 0.5, c_white, 1, 1, 1, player);
	}
	else
	if (global.player_can_play[player])
	{
		var key_accept = (global.player_[inp.key][player][1][action.accept] > noone) ? global.player_[inp.key][player][1][action.accept] : global.player_[inp.key][player][2][action.accept];
		if (key_accept > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, key_accept, 32, window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
	}
}

/* Show Clear Level Key in debug */
if (global.debug_screen
&& common_conditions_met
&& nearest_level.clear_rate == "enter")
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(clear_prompt_x + 32, window_height - 20, l10n_text("Clear"), global.default_text_size, c_black, c_white, 1);

	if (gamepad_is_connected(global.player_slot[player]) && global.controls_used_for_navigation == "gamepad")
	{
		scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.back], clear_prompt_x, window_height - 20, 0.5, c_white, 1, 1, 1, player);
	}
	else
	if (global.player_can_play[player])
	{
		var key_back = (global.player_[inp.key][player][1][action.back] > noone) ? global.player_[inp.key][player][1][action.back] : global.player_[inp.key][player][2][action.back];
		if (key_back > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, key_back, clear_prompt_x, window_height - 20, 0.5, 0.5, 0, c_white, 1);
		}
	}
}

#region /* Show Level Info */
/* HUD that should always show */
if (iris_xscale > 9)
{
	draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, 32, 0.5, 0.5, 0, c_white, 1);
	draw_set_halign(fa_left);
	scr_draw_text_outlined(64, 32, string(total_big_collectibles) + "/" + string(global.max_total_big_collectibles), global.default_text_size, c_black, c_white, 1);
}

/* A single fresh card covers authored rows and genuine statistics-only levels. */
if (big_collectible_info_can_show(nearest_level, true))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_alpha(0.75);
	draw_roundrect_color_ext(20, 56, big_collectible_info_right, big_collectible_info_bottom, 16, 16, c_black, c_black, false);
	draw_set_alpha(1);
	if (big_collectible_entry_visible)
	{
		scr_big_collectible_selector_draw(big_collectible_entry_cache.state, big_collectible_entry_cache.model,
			big_collectible_entry_left, big_collectible_entry_top, big_collectible_entry_width, big_collectible_entry_height,
			1, player, big_collectible_info_right, big_collectible_entry_scale);
	}
	for (var line_index = 0; line_index < array_length(big_collectible_info_lines); line_index++)
	{
		scr_draw_text_outlined(big_collectible_info_center, big_collectible_info_stats_top + line_index * big_collectible_info_line_height,
			big_collectible_info_lines[line_index], big_collectible_info_text_scale, c_black, c_white, 1);
	}
	if (big_collectible_info_badge != noone)
	{
		var badge_x = big_collectible_info_right - 8 - sprite_get_width(big_collectible_info_badge) * 0.5;
		var badge_y = big_collectible_entry_top + sprite_get_height(big_collectible_info_badge) * 0.5;
		draw_sprite_ext(big_collectible_info_badge, 0, badge_x, badge_y, 1, 1, 0, c_white, 1);
	}
}
#endregion /* Show Level Info END */
}

/* Draw GUI when conditions are met */
if (iris_yscale <= 0.002 || (brand_new_file && can_enter_level_automatically) || black_screen_at_start_delay < 1)
{
	if (global.enable_transitions)
	{
		draw_rectangle_color(0, 0, window_width, window_height, c_black, c_black, c_black, c_black, false);
	}
	black_screen_at_start_delay++;
	scr_draw_loading(1); /* Draw loading screen when transitioning to other rooms */
}

/* If playing the demo version, show how to purchase the game when they finish the demo */
if (global.demo_enable
&& global.demo_over_popup)
{
	can_move = false;
	draw_set_alpha(0.75);
	draw_rectangle_color(0, 0, window_width, window_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(window_width * 0.5, window_height * 0.5 - 32, l10n_text("Thank you for playing the " + string(global.game_name) + " Demo!"), global.default_text_size, c_black, c_white, 1);
	scr_draw_text_outlined(window_width * 0.5, window_height * 0.5, l10n_text("Buy the full version to continue the game"), global.default_text_size, c_black, c_white, 1);
	var demo_end_buttons_x = window_width * 0.5 - 185;
	var purchase_now_y = window_height * 0.5 + 42;
	draw_menu_button(demo_end_buttons_x, purchase_now_y, l10n_text("Purchase Now"), "purchase_now", "purchase_now");
	var continue_demo_y = window_height * 0.5 + 42 + 42;
	draw_menu_button(demo_end_buttons_x, continue_demo_y, l10n_text("Continue Demo"), "continue_demo", "continue_demo");
	
	if (menu != "purchase_now"
	&& menu != "continue_demo")
	{
		menu = "purchase_now";
	}
	
	if (key_up
	&& (menu_delay == 0 && menu_joystick_delay == 0))
	{
		menu_delay = 3;
		menu = "purchase_now";
	}
	
	if (key_down
	&& (menu_delay == 0 && menu_joystick_delay == 0))
	{
		menu_delay = 3;
		menu = "continue_demo";
	}
	
	/* Click Purchase Now */
	var purchase_clicked =
		(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), demo_end_buttons_x, purchase_now_y, demo_end_buttons_x + 370, purchase_now_y + 41)
		&& global.controls_used_for_navigation == "mouse"
		&& mouse_check_button_released(mb_left)
		&& (menu_delay == 0 && menu_joystick_delay == 0))
		|| (menu == "purchase_now"
		&& key_accept_pressed
		&& (menu_delay == 0 && menu_joystick_delay == 0));
	
	if (purchase_clicked)
	{
		menu_delay = 3;
		global.demo_over_popup = false;
		can_move = true;
		menu = noone;
		url_open(global.link_to_steam_page);
	}
	
	/* Click Continue Playing Demo */
	var continue_clicked =
		(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), demo_end_buttons_x, continue_demo_y, demo_end_buttons_x + 370, continue_demo_y + 41)
		&& global.controls_used_for_navigation == "mouse"
		&& mouse_check_button_released(mb_left)
		&& (menu_delay == 0 && menu_joystick_delay == 0))
		|| (menu == "continue_demo"
		&& (key_accept_pressed || key_back_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0));
	
	if (continue_clicked)
	{
		/* Close the pop-up for the demo end screen */
		menu_delay = 3;
		can_move = true;
		menu = noone;
		global.demo_over_popup = false;
	}
}
