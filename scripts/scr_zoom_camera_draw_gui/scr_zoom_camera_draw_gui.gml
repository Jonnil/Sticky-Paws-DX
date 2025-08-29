function scr_zoom_camera_draw_gui(width = 10)
{
	if (zoom_border_lerp > 0)
	{
		zoom_border_lerp = lerp(zoom_border_lerp, 0, 0.1);
		draw_set_alpha(zoom_border_lerp);
		draw_rectangle_color(0, width + 1, width, display_get_gui_height() - (width + 1), c_red, c_red, c_red, c_red, false); /* Left */
		draw_rectangle_color(display_get_gui_width() - width, 0, display_get_gui_width() + width, display_get_gui_height() - (width + 1), c_red, c_red, c_red, c_red, false); /* Right */
		draw_rectangle_color(0, 0, display_get_gui_width() - (width + 1), width, c_red, c_red, c_red, c_red, false); /* Top */
		draw_rectangle_color(0, display_get_gui_height() - width, display_get_gui_width(), display_get_gui_height(), c_red, c_red, c_red, c_red, false); /* Bottom */
		draw_set_alpha(1);
	}

	if (show_zoom_value > 0)
	{
		if (room == rm_leveleditor)
		{
			var what_zoom_value = global.zoom_level;
		}
		else
		{
			var what_zoom_value = global.zoom_world;
		}
		show_zoom_value--;

		if (global.debug_screen)
		{
			draw_set_halign(fa_left);
			scr_draw_text_outlined(display_get_gui_width() - 200, 100, l10n_text("Zoom") + ": " + string(what_zoom_value), global.default_text_size, c_black, c_white, 1);
		}
	}
}
