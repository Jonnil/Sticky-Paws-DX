if (!show_remaining_jumps && above_gui)
{
	var gui_width = display_get_gui_width() * 0.5;
	var gui_height = display_get_gui_height() * 0.5;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(image_alpha * 0.9);
	draw_roundrect_color_ext(
	gui_width - (string_width(score_up) * 0.75),
	gui_height - string_height(score_up),
	gui_width + (string_width(score_up) * 0.75),
	gui_height + string_height(score_up), 50, 50, c_black, c_black, false);
	scr_draw_text_outlined(gui_width, gui_height, l10n_text(string(score_up)), global.default_text_size * 1.5, c_black, c_lime, image_alpha);
	draw_set_alpha(1);
	if (instance_number(obj_score_up) >= 2) {
		instance_destroy();
	}
}