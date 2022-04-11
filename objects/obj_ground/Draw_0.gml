if (global.custom_tileset >= 0)
{
	draw_sprite_part_ext(global.custom_tileset, 0, 32 * tile, 0, 32, 32, x - 16, y - 16, 1, 1, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_default >= 0)
and (ground_surface = 0)
or (global.make_every_tileset_into_default_tileset = true)
and (global.resource_pack_sprite_tileset_default >= 0)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_default, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_dirt >= 0)
and (ground_surface = 1)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_dirt, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_glass >= 0)
and (ground_surface = 2)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_glass, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_grass >= 0)
and (ground_surface = 3)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_grass, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_gravel >= 0)
and (ground_surface = 4)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_gravel, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_metal >= 0)
and (ground_surface = 5)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_metal, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_stone >= 0)
and (ground_surface = 6)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_stone, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (global.resource_pack_sprite_tileset_wood >= 0)
and (ground_surface = 7)
{
	draw_sprite_ext(global.resource_pack_sprite_tileset_wood, tile, x, y, 1, 1, 0, c_white, 1);
}
else
if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 1);
}