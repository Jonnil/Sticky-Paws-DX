function scr_draw_darken_screen_when_window_is_unfocused()
{
	
	#region /* If Window is unfocused, make the screen darker */
	if (!window_has_focus()) /* First check if window is unfocused before doing any other code */
	{
		if (self == obj_pause)
		&& (hide_menu_for_clean_screenshots == false)
		|| (self != obj_pause)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, window_get_width() * 3, window_get_height() * 3, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(scr_wave(0.5, 2, 1));
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_roundrect_color_ext(display_get_gui_width() * 0.5 - (string_width(l10n_text("Click to Focus")) * 0.5), display_get_gui_height() * 0.5 - 32, display_get_gui_width() * 0.5 + (string_width(l10n_text("Click to Focus")) * 0.5), display_get_gui_height() * 0.5 + 32, 50, 50, c_black, c_black, false);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Click to Focus"), global.default_text_size, c_black, c_white, scr_wave(0.5, 2, 1));
			draw_set_alpha(1);
		}
	}
	#endregion /* If Window is unfocused, make the screen darker END */
	
}