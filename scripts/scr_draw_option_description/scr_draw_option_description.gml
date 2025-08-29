function scr_draw_option_description()
{
	/* Description that shows up when changing certain options */
	var text_fill = c_white;

	if (global.option_default == 1)
	{
		var option_default = l10n_text("On by default");
		text_fill = c_lime;
	}
	else
	if (global.option_default == 0)
	{
		var option_default = l10n_text("Off by default");
	}
	else
	{
		var option_default = "";
	}

	var option_description_text = "";

	if (global.option_description != "" && global.option_default == -2)
	{
		option_description_text = l10n_text("Default") + ": " + string(global.option_description);
	}
	else
	if (global.option_description != "" && option_default != "")
	{
		option_description_text = string(global.option_description) + " - " + string(option_default);
	}
	else
	if (global.option_description != "")
	{
		option_description_text = string(global.option_description);
	}
	else
	{
		option_description_text = string(option_default);
	}

	if (option_description_text != "")
	{
		draw_set_alpha(1);

		/* Ensure the GUI width is valid; if not, use a default value */
		var gui_width = display_get_gui_width();

		if (gui_width <= 0)
		{
			gui_width = 1280; /* Default width if GUI width is unavailable */
		}

		/* Wrap text at 98% of the screen width */
		var max_text_width = gui_width * 0.98;
		var padding = 20; /* Extra padding around text */

		/* Use a scale factor for text. If not set, default to 1 */
		var scale = (global.default_text_size != undefined && global.default_text_size > 0) ? global.default_text_size * 0.9 : 1;
		var line_sep = 32; /* Vertical separation between lines */

		/* Get the wrapped text height using our helper function with scaling */
		var text_height = scr_get_wrapped_text_height(option_description_text, max_text_width, line_sep, scale);

		/* Compute natural (scaled) width of the text */
		var natural_width = string_width(option_description_text) * scale;

		if (natural_width <= 0)
		{
			if (global.debug_screen)
			{
				show_debug_message("[scr_draw_option_description] WARNING: Computed natural width is 0. Using max_text_width as fallback.");
			}
			natural_width = max_text_width;
		}

		var text_width = (natural_width < max_text_width) ? natural_width : max_text_width;

		if (text_width <= 0)
		{
			if (global.debug_screen)
			{
				show_debug_message("[scr_draw_option_description] ERROR: Final computed text width is 0. Aborting drawing of option description.");
			}
			return;
		}

		/*
		   Position the black box:
		   - Fix the bottom of the box at (display_get_gui_height() - 10)
		   - Draw the text so that its bottom is at (rect_bottom - padding)
		   - Compute the top of the box as the bottom minus the text height and one padding value.
		*/
		var rect_bottom = display_get_gui_height() - 10;
		var rect_top = rect_bottom - (max(32, text_height * 0.8)) - padding;

		/* Draw a rounded rectangle that hugs the text */
		draw_roundrect_color_ext(
			(gui_width - text_width) * 0.5 - padding,
			rect_top,
			(gui_width + text_width) * 0.5 + padding,
			rect_bottom,
			50, 50, c_black, c_black, false
		);

		/* Set alignment so that the text is centered horizontally and bottom aligned */
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);

		/* Draw the text using draw_text_ext_transformed:
		   The bottom of the text is aligned at (rect_bottom - padding), hugging the bottom.
		*/
		draw_text_ext_transformed(
			gui_width * 0.5,
			rect_bottom - padding,
			option_description_text,
			line_sep,
			max_text_width,
			scale, scale,
			0
		);
	}

	/* Reset so that the description disappears when not needed */
	global.option_default = -1;
	global.option_description = "";
}
