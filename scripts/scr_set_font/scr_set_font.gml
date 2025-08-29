function scr_set_font(selected_font_index = global.selected_font)
{
	/* Only try to check the language if the DS grid is valid and has enough columns */
	if (global.language_local_data != 0
	&& ds_grid_width(global.language_local_data) > global.selected_language_id)
	{
		if (global.language_local_data[# global.selected_language_id, 0] == "日本語 (Japanese)")
		{
			selected_font_index = 1; /* Use the "Normal font" for Japanese */
		}
	}
	else
	{
		show_debug_message("[scr_set_font] Warning: language_local_data is not loaded or selected_language_id is invalid. Using default font index " + string(selected_font_index));
	}

	var font_files = [
		"font_game.ttf",
		"font_normal.ttc",
		"font_open_dyslexic.otf"
	];

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
