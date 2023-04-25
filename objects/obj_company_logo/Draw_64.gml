var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (sprite_index >= 0)
{
	draw_sprite_ext(sprite_index, image_index, get_window_width * 0.5, get_window_height * 0.5, 1, 1, 0, c_white, 1);
}

if (global.resource_pack_sprite_splash_easteregg >= 0)
{
	draw_sprite_ext(global.resource_pack_sprite_splash_easteregg, image_index, + 128, get_window_height + sprite_splash_easteregg_yoffset, 1, 1, 0, c_white, 1);
}

if (can_navigate == false) /* When game is loading in assets, display a detailed loading progress, showing exactly what is being loaded in */
{
	global.loading_spinning_angle -= 10;
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 6), 1, 1, global.loading_spinning_angle, c_white, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 5), l10n_text("Loading"), global.default_text_size, c_black, c_white, 1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 4), string(file_found), global.default_text_size, c_black, c_white, 1);
	if (load_ok <= 0)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 3), string(ds_list_size(global.all_loaded_characters)) + " " + l10n_text("Loaded Characters"), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 3), string(ds_list_size(global.all_loaded_characters)) + " " + l10n_text("Loaded Characters") + " " + l10n_text("OK"), global.default_text_size, c_black, c_lime, 1);
	}
	if (load_ok <= 1)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 2), string(ds_list_size(global.all_loaded_resource_pack)) + " " + l10n_text("Loaded Resource Packs"), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32 * 2), string(ds_list_size(global.all_loaded_resource_pack)) + " " + l10n_text("Loaded Resource Packs") + " " + l10n_text("OK"), global.default_text_size, c_black, c_lime, 1);
	}
	if (load_ok <= 2)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32), string(ds_list_size(global.all_loaded_title_backgrounds)) + " " + l10n_text("Loaded Title Backgrounds"), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32 - (32), string(ds_list_size(global.all_loaded_title_backgrounds)) + " " + l10n_text("Loaded Title Backgrounds") + " " + l10n_text("OK"), global.default_text_size, c_black, c_lime, 1);
	}
	if (load_ok <= 3)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, string(ds_list_size(global.all_loaded_title_logos)) + " " + l10n_text("Loaded Title Logos"), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, string(ds_list_size(global.all_loaded_title_logos)) + " " + l10n_text("Loaded Title Logos") + " " + l10n_text("OK"), global.default_text_size, c_black, c_lime, 1);
	}
}
else
{
	if (os_type == os_ios)
	or (os_type = os_android)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 32, l10n_text("Press and Hold Screen"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (gamepad_is_connected(global.player1_slot))
	and (global.controls_used_for_menu_navigation == "controller")
	or (global.always_show_gamepad_buttons == true)
	or (os_type == os_switch)
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 + 32, display_get_gui_height() - 32, l10n_text("Skip") + ":", global.default_text_size, c_black, c_white, 1);
		if (global.player_[inp.gp][1][1][action.accept] > noone)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.accept], display_get_gui_width() * 0.5 + 64, display_get_gui_height() - 32, 0.5, c_white, 1);
		}
		else
		if (global.player_[inp.gp][1][2][action.accept] > noone)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][2][action.accept], display_get_gui_width() * 0.5 + 64, display_get_gui_height() - 32, 0.5, c_white, 1);
		}
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(display_get_gui_width() * 0.5 + 32, display_get_gui_height() - 32, l10n_text("Skip") + ":", global.default_text_size, c_black, c_white, 1);
		if (global.player_[inp.key][1][1][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.accept], display_get_gui_width() * 0.5 + 64, display_get_gui_height() - 32, 0.5, 0.5, 0, c_white, 1);
		}
		else
		if (global.player_[inp.key][1][2][action.accept] > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.accept], display_get_gui_width() * 0.5 + 64, display_get_gui_height() - 32, 0.5, 0.5, 0, c_white, 1);
		}
	}
}

scr_draw_darken_screen_when_window_is_unfocused();

scr_draw_cursor_mouse();