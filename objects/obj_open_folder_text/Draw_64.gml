var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

draw_set_alpha(image_alpha * 0.99);
draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var key_open_localappdata_x = get_window_width * 0.5 - 238;

if (os_type == os_windows)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 128, l10n_text("Add custom things in Local Appdata"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, 91, key_open_localappdata_x, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 38, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, ord("R"), key_open_localappdata_x + 74, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	draw_set_halign(fa_left);
	scr_draw_text_outlined(key_open_localappdata_x + 110, get_window_height * 0.5 - 90, l10n_text("Then type path name"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
}
else
if (os_type == os_macosx)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 128, l10n_text("Add custom things in Finder"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, vk_shift, key_open_localappdata_x, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 38, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_key_command, 0, key_open_localappdata_x + 74, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 110, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, ord("G"), key_open_localappdata_x + 146, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	draw_set_halign(fa_left);
	scr_draw_text_outlined(key_open_localappdata_x + 182, get_window_height * 0.5 - 90, l10n_text("Then type path name"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
}
else
if (os_type == os_linux)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 128, l10n_text("Add custom things in .config"), global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, vk_alt, key_open_localappdata_x, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	scr_draw_text_outlined(key_open_localappdata_x + 38, get_window_height * 0.5 - 90, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
	draw_sprite_ext(spr_keyboard_keys, vk_f2, key_open_localappdata_x + 74, get_window_height * 0.5 - 90, 0.75, 0.75, 0, c_white, image_alpha);
	draw_set_halign(fa_left);
	scr_draw_text_outlined(key_open_localappdata_x + 110, get_window_height * 0.5 - 90, l10n_text("Then type") + " " + "~/.config/" + string(global.game_name_appdata), global.default_text_size * 1.1, c_black, c_white, image_alpha);
}

draw_set_halign(fa_center);
if (get_window_width <= 1350)
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string_replace_all(string(open_folder_string), "\\", "/"), global.default_text_size * 0.75, c_black, c_white, image_alpha);
}
else
{
	scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5, string_replace_all(string(open_folder_string), "\\", "/"), global.default_text_size, c_black, c_white, image_alpha);
}

if (!close)
{
	if (show_copy_to_clipboard_button)
	{
		draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Copy to Clipboard"), "copy_to_clipboard", "copy_to_clipboard");
	}
	draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Back"), "back_open_folder_text", "back_open_folder_text");
	draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
}

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();