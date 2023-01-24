var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

if (score_up == "Copied")
and (show_remaining_jumps == false)
{
	depth = - 15100;
	scr_draw_text_outlined(get_window_width / 2, get_window_height / 2 + 42, l10n_text("Copied"), global.default_text_size * 2 * image_xscale, c_black, c_lime, image_alpha);
}