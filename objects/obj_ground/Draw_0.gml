if (global.custom_tileset > noone)
{
	draw_sprite_part_ext(global.custom_tileset, 0, 32 * tile, 0, 32, 32, x-16, y-16, 1, 1, c_white, 1);
}
else
if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 1);
}