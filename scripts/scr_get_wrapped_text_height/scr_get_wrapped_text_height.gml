/// @function scr_get_wrapped_text_height(text, max_width, sep, scale)
/* Returns the height (in pixels) of the text when wrapped to max_width, */
/* using the current font. 'sep' is the vertical separation between lines */
/* Optionally, a scale factor can be provided (default is 1) */
function scr_get_wrapped_text_height(text, max_width, sep, scale = 1)
{
	/* Split the text into words */
	var words = string_split(text, " ");
	var lines = [];
	var current_line = "";
	
	for (var i = 0; i < array_length(words); i++)
	{
		var word = words[i];
		/* If adding the word (scaled) exceeds max_width, push the current line and start a new one */
		if (string_width(current_line + word) * scale > max_width)
		{
			array_push(lines, current_line);
			current_line = word + " ";
		}
		else
		{
			current_line += word + " ";
		}
	}
	if (string_length(string_trim(current_line)) > 0)
	{
		array_push(lines, current_line);
	}
	
	var num_lines = array_length(lines);
	/* Use a representative character (e.g., "W") to measure a single line's height and apply scale */
	var line_height = string_height("W") * scale;
	return num_lines * line_height + (num_lines - 1) * sep;
}