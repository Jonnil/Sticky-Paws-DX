draw_self();
show_wall = lerp(show_wall, 0, 0.1);
draw_sprite_ext(spr_wall, 0, x, y, 1, 1, 0, c_white, show_wall);