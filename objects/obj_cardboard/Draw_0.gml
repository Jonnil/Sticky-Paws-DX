if (brick_particle == true)
{
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);
}
if (asset_get_type("spr_cardboard") == asset_sprite)
{
	draw_sprite_ext(spr_cardboard, image_index, x, y, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}