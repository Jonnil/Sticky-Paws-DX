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
}