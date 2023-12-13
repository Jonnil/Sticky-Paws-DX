function scr_draw_text_outlined(x_position = x, y_position = y, string_text = "", text_size = global.default_text_size, outline_color = c_white, text_color = c_black, img_alpha = 1)
{
	var text_size_adjusted = (string_width(string_text) >= 1280 && window_get_width() <= 1280) ? text_size * 0.75 : text_size;
	
	/* Draw outline of text */
	var outline_positions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
	if (outline_color != noone) {
		for (var i = 0; i < array_length(outline_positions); i++) {
			var outline_offset = outline_positions[i];
			draw_text_transformed_color(x_position + outline_offset[0] * text_size_adjusted, y_position + outline_offset[1] * text_size_adjusted, string_text, text_size_adjusted, text_size_adjusted, 0, outline_color, outline_color, outline_color, outline_color, img_alpha);
		}
	}
	
	/* Draw filled text */
	draw_text_transformed_color(x_position, y_position, string_text, text_size_adjusted, text_size_adjusted, 0, text_color, text_color, text_color, text_color, img_alpha);
}