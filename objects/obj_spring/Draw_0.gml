spring_strong_alpha = point_distance(x, y, angle_x, angle_y)/1000;
draw_sprite_ext(spr_spring, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
draw_sprite_ext(spr_spring_strong, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, spring_strong_alpha);