function scr_language_menu()
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	var i;
	for(i = 1;
	i < ds_grid_width(global.language_local_data);
	i ++;)
	{
		draw_language_checkmark(400, 52 * (i-1) + 42 + menu_y_offset, global.language_local_data[# i, 0], "Language"+string(i), noone);
	}
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_text_outlined(window_get_width() - 32, 64, Text("Code") + " " + Text("translation by") + " " + Text("Translator name"), global.default_text_size * 1.5, c_menu_outline, c_menu_fill, 1);
	draw_text_outlined(window_get_width() - 32, 128, "(" + Text("Language translations may not be 100% accurate") + ")", global.default_text_size, c_menu_outline, c_menu_fill, 1);
}