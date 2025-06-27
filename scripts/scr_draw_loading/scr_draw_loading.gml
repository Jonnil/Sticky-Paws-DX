function scr_draw_loading(alpha = 1, xx = display_get_gui_width() * 0.5, yy = display_get_gui_height() * 0.5, loading_string = "Loading")
{
	/* Putting "current_time * -0.5" as the rotation makes the loading icon spin clockwise at a slow steady pace */
	draw_sprite_ext(spr_loading, 0, xx, yy, 1, 1, current_time * -0.5, c_white, alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(xx, yy + 42, l10n_text(loading_string), global.default_text_size, c_black, c_white, alpha);
}