function scr_draw_darken_screen_when_window_is_unfocused()
{
	
	#region /* If Window is unfocused, make the screen darker */
	if (!window_has_focus())
	{
		if (debug_target == obj_pause
		&& !hide_menu_for_clean_screenshots)
		|| (debug_target != obj_pause)
		{
			var gui_width = display_get_gui_width();
			var gui_height = display_get_gui_height();
			var half_width = gui_width * 0.5;
			var half_height = gui_height * 0.5;
			
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
			
			if (global.enable_option_for_pc)
			{
				var focus_text = l10n_text("Click to Focus");
				var wave_alpha = scr_wave(0.5, 2, 1);
				var text_width = string_width(focus_text) * 0.5;
				
				draw_set_alpha(wave_alpha);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_roundrect_color_ext(half_width - text_width, half_height - 32, half_width + text_width, half_height + 32, 50, 50, c_black, c_black, false);
				scr_draw_text_outlined(half_width, half_height, focus_text, global.default_text_size, c_black, c_white, wave_alpha);
			}
			draw_set_alpha(1);
		}
	}
	#endregion /* If Window is unfocused, make the screen darker END */
	
}