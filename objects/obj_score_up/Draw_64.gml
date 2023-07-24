if (score_up == "Copied")
&& (show_remaining_jumps == false)
|| (above_gui)
{
	depth = - 15100;
	draw_set_halign(fa_center);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text(string(score_up)), global.default_text_size * 2 * image_xscale, c_black, c_lime, image_alpha);
}