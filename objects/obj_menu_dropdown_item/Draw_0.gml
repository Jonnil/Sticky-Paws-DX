if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x, bbox_top, x+370, bbox_bottom))
and (global.controls_used_for_menu_navigation = "mouse")
{
	draw_sprite_ext(spr_menu_dropdown_item, 0, x, y, 1, 1, 0, c_lime, 1);
}
else
{
	draw_sprite_ext(spr_menu_dropdown_item, 0, x, y, 1, 1, 0, c_white, 1);
}
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_outlined(x+32, y, string(text), global.default_text_size, c_white, c_black, 1);