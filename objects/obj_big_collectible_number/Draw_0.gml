if (global.show_collision_mask)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x, y, string(big_collectible) + "/" + string(big_collectible_max_number));
}