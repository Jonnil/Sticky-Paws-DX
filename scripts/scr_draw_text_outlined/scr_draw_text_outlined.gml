/// @desc scr_draw_text_outlined(x, y, string, text_size, outline_color, text_color, image_alpha);
/// @description scr_draw_text_outlined(x, y, string, text_size, outline_color, text_color, image_alpha);
/// @arg x
/// @arg y
/// @arg string
/// @arg text_size
/// @arg outline_color
/// @arg text_color
/// @arg image_alpha

function scr_draw_text_outlined(x_position = x, y_position = y, string_text = "", text_size = global.default_text_size, outline_color = c_white, text_color = c_black, img_alpha = 1)
{
	#region /* Debug toggles */
	var draw_outline = true; /* Drawing outline this way is intense on performance */
	var draw_fill = true;
	#endregion /* Debug toggles END */
	
	var y_offset = 0; /* Y origin position offset for broken fonts */
	
	#region /* Draw outline of text first */
	if (draw_outline == true)
	{
		/* This is an "array", meaning a list, to get the first value in a list you ask for 
		"vector[0]" then add more [0] if the list has a list in it 
		example
		vector[0][0] gives us 1 */
		var vector = [ 
		[1, 1],
		[- 1, - 1],
		[0, 1],
		[1, 0],
		[0, - 1],
		[- 1, 0],
		[- 1, 1],
		[1, - 1]
		]; 
		
		var i;
		for(i = 0; i < array_height_2d(vector) - 1; i += 1) /* Make outline text */
		{
			if (string_width(string_text) >= 1280)
			and (window_get_width() <= 1280)
			{
				draw_text_transformed_color(x_position + vector[i][0], y_position + vector[i][1] + y_offset, string_text, text_size * 0.75, text_size * 0.75, 0, outline_color, outline_color, outline_color, outline_color, img_alpha);
			}
			else
			{
				draw_text_transformed_color(x_position + vector[i][0], y_position + vector[i][1] + y_offset, string_text, text_size, text_size, 0, outline_color, outline_color, outline_color, outline_color, img_alpha);
			}
		}
	}
	#endregion /* Draw outline of text first END */
	
	if (draw_fill == true)
	{
		if (string_width(string_text) >= 1280)
		and (window_get_width() <= 1280)
		{
			draw_text_transformed_color(x_position, y_position + y_offset, string_text, text_size * 0.75, text_size * 0.75, 0, text_color, text_color, text_color, text_color, img_alpha); /* Draw normal text above outline text */
		}
		else
		{
			draw_text_transformed_color(x_position, y_position + y_offset, string_text, text_size, text_size, 0, text_color, text_color, text_color, text_color, img_alpha); /* Draw normal text above outline text */
		}
	}
}