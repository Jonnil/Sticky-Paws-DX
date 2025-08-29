/* Heart above head */
if (have_heart_balloon) {
	xx_heart = lerp(xx_heart, x, 0.05);
	yy_heart = lerp(yy_heart, y - 64, 0.05);
	draw_line_width_color(xx, yy, xx_heart, yy_heart, 6, c_black, c_black);
	draw_line_width_color(xx, yy, xx_heart, yy_heart, 3, c_white, c_white);
	draw_sprite_ext(spr_heart, 0, xx_heart, yy_heart, 1, 1, point_direction(xx_heart, yy_heart, xx, yy) + 90, c_white, 1);
}

scr_draw_show_controls_map();

if (sprite_exists(sprite_index)) {
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale, draw_yscale * default_yscale, 0, image_blend, 1);
}

/* Draw Iris Transitions */
if (global.enable_transitions && iris_xscale < 15) {
	draw_set_alpha(1);
	draw_sprite_ext(spr_iris, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
	draw_rectangle_color(-32, -32, room_width, yy - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(-32, -32, xx - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(xx + iris_xscale * 128 - 1, -32, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(-32, yy + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
}
