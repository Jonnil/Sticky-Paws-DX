function scr_set_font(selected_font_index = global.selected_font)
{
	if (global.selected_language_id == 2) /* If you have selected Japanese language, you can't use certain fonts, as it isn't supported */
	{
		selected_font_index = 1; /* The font you can use is "Normal font" */
	}
	var font_files = ["game_font.ttf", "normal_font.ttc", "open_dyslexic_font.otf"];
	var font_sizes = [34, 24, 24];
	var fonts = array_create(array_length(font_files), noone);
	
	if (file_exists(font_files[selected_font_index]))
	{
		if (fonts[selected_font_index] != noone)
		{
			font_delete(fonts[selected_font_index]);
		}
		fonts[selected_font_index] = font_add(font_files[selected_font_index], font_sizes[selected_font_index], true, false, 32, 128);
		draw_set_font(fonts[selected_font_index]);
	}
}