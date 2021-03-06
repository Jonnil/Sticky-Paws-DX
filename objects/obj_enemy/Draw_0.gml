draw_sprite_ext(sprite_index,image_index,x,y,draw_xscale*image_xscale,draw_yscale,image_angle,image_blend,image_alpha);
draw_xscale=lerp(draw_xscale,1,0.1);
draw_yscale=lerp(draw_yscale,1,0.1);