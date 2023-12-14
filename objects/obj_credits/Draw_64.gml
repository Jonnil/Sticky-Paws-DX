var get_window_width = display_get_gui_width();
var get_window_height = display_get_gui_height();

draw_set_alpha(black_background_alpha);
draw_rectangle_colour(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

/* Draw Skip Text */
draw_set_halign(fa_right);
draw_set_valign(fa_top);

var is_gamepad_connected = false;
var is_mobile = false;
var is_keyboard = false;

if (gamepad_is_connected(global.player_slot[1]) && global.player_can_play[1] && global.controls_used_for_menu_navigation == "gamepad")
    || (gamepad_is_connected(global.player_slot[2]) && global.player_can_play[2] && global.controls_used_for_menu_navigation == "gamepad")
    || (gamepad_is_connected(global.player_slot[3]) && global.player_can_play[3] && global.controls_used_for_menu_navigation == "gamepad")
    || (gamepad_is_connected(global.player_slot[4]) && global.player_can_play[4] && global.controls_used_for_menu_navigation == "gamepad")
    || (global.always_show_gamepad_buttons)
{
    is_gamepad_connected = true;
    scr_draw_text_outlined(get_window_width - 64, 0, l10n_text("Skip") + ": " + l10n_text("Hold"), global.default_text_size, c_black, c_white, 1);
    scr_draw_gamepad_buttons(gp_start, get_window_width - 32, 21, 0.5, c_white, 1);
}
else if (os_type == os_ios || os_type == os_android)
{
    is_mobile = true;
    scr_draw_text_outlined(get_window_width - 16, 0, l10n_text("Skip") + ": " + l10n_text("Press and Hold Screen"), global.default_text_size, c_black, c_white, 1);
}
else if (global.controls_used_for_menu_navigation == "keyboard" || global.controls_used_for_menu_navigation == "mouse")
{
    is_keyboard = true;
    draw_menu_button(get_window_width - 370, 0, l10n_text("Skip") + ": " + l10n_text("Hold"), "skip", "skip");
    draw_sprite_ext(spr_keyboard_keys, vk_escape, get_window_width - 32, 21, 0.5, 0.5, 0, c_white, 1);
}

if (skip > 0)
{
    scr_draw_circular_bar(get_window_width - 32, 21, skip, 64, c_red, 20, 1, 6);
}

/* Draw Title Logo or Sprite */
if (sprite_index == global.title_logo_index && global.title_logo_index >= 0)
{
    draw_sprite_ext(sprite_index, image_index, get_window_width * 0.5, y, 402 / sprite_get_height(global.title_logo_index), 402 / sprite_get_height(global.title_logo_index), 0, c_white, image_alpha);
}
else if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, image_index, get_window_width * 0.5, y, 1, 1, 0, c_white, image_alpha);
}

/* Draw Iris Transitions */
if (global.enable_transitions && iris_xscale < 15)
{
	draw_set_alpha(1);
    draw_sprite_ext(spr_iris, 0, get_window_width * 0.5, get_window_height * 0.5, iris_xscale, iris_yscale, 0, c_black, 1);
    draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 0.5 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, 0, get_window_width * 0.5 - iris_xscale * 128, get_window_height * 2, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(get_window_width * 0.5 + iris_xscale * 128 - 1, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(0, get_window_height * 0.5 + iris_yscale * 128, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
}

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();
