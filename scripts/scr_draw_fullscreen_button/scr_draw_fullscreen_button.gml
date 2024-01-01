function scr_draw_fullscreen_button(fullscreen_x = 0, fullscreen_y = 0, fullscreen_menu = "fullscreen_mode")
{
	if (window_get_fullscreen())
	{
		var fullscreen_text = l10n_text("Windowed");
	}
	else
	{
		var fullscreen_text = l10n_text("Fullscreen");
	}
	draw_menu_checkmark(fullscreen_x, fullscreen_y, string(fullscreen_text), fullscreen_menu, window_get_fullscreen());
			
	var fullscreen_text_width = string_width(fullscreen_text);
			
	/* Draw what key to press to toggle Fullscreen */
	if (os_type == os_macosx)
	&& (global.controls_used_for_navigation != "gamepad")
	{
		draw_sprite_ext(spr_keyboard_key_fn, 0, fullscreen_x + 80 + fullscreen_text_width, fullscreen_y + 16, 0.5, 0.5, 0, c_white, image_alpha);
		scr_draw_text_outlined(fullscreen_x + 80 + fullscreen_text_width + 20, fullscreen_y + 16, "+", global.default_text_size * 1.1, c_black, c_white, image_alpha);
		draw_sprite_ext(spr_keyboard_keys, ord("F"), fullscreen_x + 80 + fullscreen_text_width + 64, fullscreen_y + 16, 0.5, 0.5, 0, c_white, image_alpha);
	}
	else
	if (global.controls_used_for_navigation != "gamepad")
	{
		draw_sprite_ext(spr_keyboard_keys, global.fullscreen_key, fullscreen_x + 80 + fullscreen_text_width, fullscreen_y + 16, 0.5, 0.5, 0, c_white, 1);
	}
}