draw_self();
draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);
if (hit >= 4)
{
	draw_sprite_ext(spr_cracks, image_index, xx, yy, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}