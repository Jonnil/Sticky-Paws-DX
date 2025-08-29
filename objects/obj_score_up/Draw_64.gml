if (!show_remaining_jumps && above_gui)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(image_alpha * 0.9);
	draw_roundrect_color_ext(
	above_gui_x - (string_width(score_up) * 0.75 * above_gui_scale),
	image_yscale * above_gui_y - string_height(score_up) * above_gui_scale,
	above_gui_x + (string_width(score_up) * 0.75 * above_gui_scale),
	image_yscale * above_gui_y + string_height(score_up) * above_gui_scale, 50, 50, c_black, c_black, false);
	scr_draw_text_outlined(above_gui_x, above_gui_y, l10n_text(string(score_up)), above_gui_scale * image_xscale * global.default_text_size * 1.5, c_black, c_lime, image_alpha);
	draw_set_alpha(1);
}
