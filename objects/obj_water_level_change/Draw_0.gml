if (global.show_collision_mask)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, point_direction(x, y, x, second_y) -90, c_white, 0.5);
	draw_line_width_color(x, y, x, second_y, 4, c_black, c_black);
	draw_line_width_color(x, y, x, second_y, 2, c_white, c_white);
}