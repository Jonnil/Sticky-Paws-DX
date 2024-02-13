var draw_x = x; /* Store x position to avoid repeated calculations */
var draw_y = y; /* Store y position to avoid repeated calculations */
var draw_scale = scale; /* Store scale to avoid repeated calculations */

#region /* Draw level sprite */
draw_sprite_ext(spr_level_ring, image_index, draw_x, draw_y, draw_scale, draw_scale, image_angle, ring_color, image_alpha);
draw_sprite_ext(spr_level, image_index, draw_x, draw_y, draw_scale, draw_scale, image_angle, level_color, image_alpha);
draw_sprite_ext(spr_level_crown, image_index, draw_x, draw_y, draw_scale, draw_scale, image_angle, c_white, level_perfect);
#endregion /* Draw level sprite END */

if (level_number != 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    scr_draw_text_outlined(draw_x, draw_y, string(level_number), global.default_text_size * 2, c_black, c_white, image_alpha);
}

if (checkpoint_x > 0 || checkpoint_y > 0) { /* Show if Checkpoint is activated */
    draw_sprite_ext(spr_checkpoint, 1, draw_x + 32, draw_y, 0.5, 0.5, 0, c_white, 1);
}