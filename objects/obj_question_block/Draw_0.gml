if (sprite_index >= 0)
{
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}
if (hit >= 4)
{
	draw_sprite_ext(spr_cracks, image_index, xx, yy, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha); /* Show cracks on the block if you've hit it multiple times, to let the player know when the last hit is happening */
}

scr_draw_text_outlined(x, y - 32, "bounce_up: " + string(bounce_up));