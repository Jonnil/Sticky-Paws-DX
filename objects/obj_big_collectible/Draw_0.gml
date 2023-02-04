draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, image_index, xstart, ystart, image_xscale, image_yscale, image_angle, image_blend, 1);
draw_self();
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
scr_draw_text_outlined(x, y, string(big_collectible));