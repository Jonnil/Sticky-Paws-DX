function scr_draw_text_outlined(x_position = x, y_position = y, string_text = "", text_size = global.default_text_size, outline_color = c_black, text_color = c_white, img_alpha = 1)
{
	/* Draw outline of text */
	if (global.draw_text_outline && outline_color != noone) { /* Let it be an option that the player can disable text outline, because it can help improve performance */
		var outline_positions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
		for(var i = 0; i < array_length(outline_positions); i++) {
			var outline_offset = outline_positions[i];
			draw_text_transformed_color(
			x_position + outline_offset[0] * text_size,
			y_position + outline_offset[1] * text_size,
			string_text,
			text_size,
			text_size,
			0,
			outline_color,
			outline_color,
			outline_color,
			outline_color,
			img_alpha);
		}
	}
	
	/* Draw filled text */
	draw_text_transformed_color(x_position, y_position, string_text, text_size, text_size, 0, text_color, text_color, text_color, text_color, img_alpha);
}