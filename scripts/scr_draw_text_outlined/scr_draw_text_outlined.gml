/// @function scr_draw_text_outlined()
/// @description Draws outlined text by drawing the text in four directions, then the filled text.

/* Optimization Notes: */
/* - **Loop Unrolling:** Instead of building an array of offsets and looping over it, */
/*   the code directly makes four calls to draw_text_transformed_color. This avoids the overhead */
/*   of array allocation and iteration at runtime */
/* - **Caching Multiplications:** The text size is stored in a local variable (`ts`) to avoid recalculating */
/*   the multiplication for each offset. This reduces redundant operations */
function scr_draw_text_outlined(x_position = x, y_position = y, string_text = "", text_size = global.default_text_size, outline_color = c_black, text_color = c_white, img_alpha = 1)
{
	/* Draw outline of text if enabled and outline color is valid */
	if (global.draw_text_outline && outline_color != noone)
	{
		/* Cache the text size multiplier to avoid recalculating it for each offset */
		var ts = text_size;
		
		/* Unrolled loop: Instead of iterating through an array, directly draw the outline */
		/* in four directions (left, right, up, down). This is more efficient */
		draw_text_transformed_color(x_position - ts, y_position, string_text, text_size, text_size, 0,
			outline_color, outline_color, outline_color, outline_color, img_alpha);
		draw_text_transformed_color(x_position + ts, y_position, string_text, text_size, text_size, 0,
			outline_color, outline_color, outline_color, outline_color, img_alpha);
		draw_text_transformed_color(x_position, y_position - ts, string_text, text_size, text_size, 0,
			outline_color, outline_color, outline_color, outline_color, img_alpha);
		draw_text_transformed_color(x_position, y_position + ts, string_text, text_size, text_size, 0,
			outline_color, outline_color, outline_color, outline_color, img_alpha);
	}
	
	/* Draw the filled text on top of the outlined text */
	draw_text_transformed_color(x_position, y_position, string_text, text_size, text_size, 0,
		text_color, text_color, text_color, text_color, img_alpha);
}