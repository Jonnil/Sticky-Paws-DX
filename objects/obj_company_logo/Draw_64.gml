var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (sprite_index == spr_company_logo)
{
	draw_sprite_ext(sprite_index, image_index, get_window_width * 0.5, get_window_height * 0.5 - 228, 1, 1, 0, c_white, 1); /* Show the Company Logo above the "Made with GameMaker" logo */
	draw_sprite_ext(spr_made_with_gamemaker, image_index, get_window_width * 0.5, get_window_height * 0.5 + 158, 0.9, 0.9, 0, c_white, made_with_gamemaker_alpha); /* Show that the game was made with GameMaker underneath the Company Logo */
}
else
if (sprite_index >= 0)
{
	draw_sprite_ext(sprite_index, image_index, get_window_width * 0.5, get_window_height * 0.5, 1, 1, 0, c_white, 1);
}

if (global.resource_pack_sprite_splash_easteregg >= 0)
{
	draw_sprite_ext(global.resource_pack_sprite_splash_easteregg, image_index, + 128, get_window_height + sprite_splash_easteregg_yoffset, 1, 1, 0, c_white, 1);
}

if (show_skip_button)
{
	show_skip_button_alpha = lerp(show_skip_button_alpha, 1, 0.1);
}
else
{
	show_skip_button_alpha = 0;
}

if (can_navigate == false) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
{
	scr_draw_loading(1, display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 3));
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32), string(file_found), global.default_text_size, c_black, c_white, 1);
	if (load_ok <= 1)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, string(ds_list_size(global.all_loaded_characters)) + " " + l10n_text("Loaded Characters"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (load_ok <= 2)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, string(ds_list_size(global.all_loaded_resource_pack)) + " " + l10n_text("Loaded Resource Packs"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (load_ok <= 3)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, string(ds_list_size(global.all_loaded_title_backgrounds)) + " " + l10n_text("Loaded Title Backgrounds"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (load_ok <= 4)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, string(ds_list_size(global.all_loaded_title_logo)) + " " + l10n_text("Loaded Title Logos"), global.default_text_size, c_black, c_white, 1);
	}
}
else
if (show_skip_button)
{
	if (os_type == os_ios)
	|| (os_type = os_android)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, l10n_text("Press on Screen"), global.default_text_size, c_black, c_white, show_skip_button_alpha);
	}
	else
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_menu_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 + 32, display_get_gui_height() - 32, l10n_text("Skip") + ":", global.default_text_size, c_black, c_white, show_skip_button_alpha);
		scr_draw_gamepad_buttons(skip_button, display_get_gui_width() * 0.5 + 64, display_get_gui_height() - 32, 0.5, c_white, show_skip_button_alpha);
	}
	else
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 + 32, display_get_gui_height() - 32, l10n_text("Skip") + ":", global.default_text_size, c_black, c_white, show_skip_button_alpha);
		draw_sprite_ext(spr_keyboard_keys, skip_key, display_get_gui_width() * 0.5 + 64, display_get_gui_height() - 32, 0.5, 0.5, 0, c_white, show_skip_button_alpha);
	}
}

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();