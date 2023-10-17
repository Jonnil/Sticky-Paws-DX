if (distance_to_object(obj_player) < 32)
{
	sign_text_alpha = lerp(sign_text_alpha, 1, 0.3);
}
else
{
	sign_text_alpha = lerp(sign_text_alpha, 0, 0.3);
}

if (sign_text_alpha > 0)
{
	var xx = display_get_gui_width() * 0.5;
	var yy = display_get_gui_height() * 0.5 - 64;
	draw_set_alpha(sign_text_alpha * 0.9);
	
	draw_roundrect_color_ext(
	
	xx - (string_width(sign_text) * 0.41) - 8,
	
	yy - string_height(l10n_text(sign_text)),
	
	xx + (string_width(sign_text) * 0.41) + 8,
	
	yy + 8,
	
	50, 50, c_black, c_black, false);
	
	draw_set_alpha(sign_text_alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	scr_draw_text_outlined(xx, yy, string(sign_text), global.default_text_size, c_black, c_white, sign_text_alpha);
	draw_set_alpha(1);
}