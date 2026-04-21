/// @function draw_roundrect_glossy_color_ext(x1, y1, x2, y2, xrad, yrad, col1, col2, outline, alpha)
/// @description Draws a glossy rounded rectangle with an integrated drop shadow and highlight strip.
function draw_roundrect_glossy_color_ext(x1, y1, x2, y2, xrad, yrad, col1, col2, outline = false, alpha = 1)
{
	if (alpha <= 0)
	{
		draw_set_alpha(1);
		return;
	}

	var panel_width = abs(x2 - x1);
	var panel_height = abs(y2 - y1);
	var shadow_offset = clamp(round(min(panel_width, panel_height) * 0.08), 2, 6);
	var highlight_inset = 2;
	var highlight_top = y1 + highlight_inset;
	var highlight_bottom = y1 + ((y2 - y1) * 0.48);
	var highlight_left = x1 + highlight_inset;
	var highlight_right = x2 - highlight_inset;
	var outline_col1 = merge_color(col1, c_white, 0.18);
	var outline_col2 = merge_color(col2, c_white, 0.12);
	var gloss_col1 = merge_color(c_white, col1, 0.25);
	var gloss_col2 = merge_color(c_white, col2, 0.45);

	draw_set_alpha(alpha * 0.35);
	draw_roundrect_color_ext(x1 + shadow_offset, y1 + shadow_offset, x2 + shadow_offset, y2 + shadow_offset, xrad, yrad, c_black, c_black, false);

	draw_set_alpha(alpha * 0.92);
	draw_roundrect_color_ext(x1, y1, x2, y2, xrad, yrad, col1, col2, false);

	if (outline)
	{
		draw_set_alpha(alpha);
		draw_roundrect_color_ext(x1, y1, x2, y2, xrad, yrad, outline_col1, outline_col2, true);
	}

	if (highlight_right > highlight_left)
	&& (highlight_bottom > highlight_top)
	{
		draw_set_alpha(alpha * 0.14);
		draw_roundrect_color_ext(
			highlight_left,
			highlight_top,
			highlight_right,
			highlight_bottom,
			max(1, xrad - highlight_inset),
			max(1, yrad - highlight_inset),
			gloss_col1,
			gloss_col2,
			false
		);
	}

	draw_set_alpha(1);
}
