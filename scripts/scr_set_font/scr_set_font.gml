function scr_set_font()
{
	var font_files = ["game_font.ttf", "normal_font.ttc", "open_dyslexic_font.otf"];
	var font_sizes = [34, 24, 24];
	var selected_font_index = global.selected_font;
	var fonts = array_create(array_length_1d(font_files), noone);
	
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