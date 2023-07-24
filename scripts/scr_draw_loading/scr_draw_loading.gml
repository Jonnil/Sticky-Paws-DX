function scr_draw_loading(alpha = black_screen_gui_alpha, xx = display_get_gui_width() * 0.5, yy = display_get_gui_height() * 0.5)
{
	global.loading_spinning_angle -= 10;
	draw_sprite_ext(spr_loading, 0, xx, yy, 1, 1, global.loading_spinning_angle, c_white, alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(xx, yy + 42, l10n_text("Loading"), global.default_text_size, c_black, c_white, alpha);
}