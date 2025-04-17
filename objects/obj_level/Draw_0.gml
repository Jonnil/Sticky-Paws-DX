var draw_x = x; /* Store x position to avoid repeated calculations */
var draw_y = y; /* Store y position to avoid repeated calculations */
var draw_scale = scale; /* Store scale to avoid repeated calculations */
var draw_alpha = image_alpha; /* Store alpha to avoid repeated calculations */

#region /* Draw level sprite */
draw_sprite_ext(spr_level_ring, 0, draw_x, draw_y, draw_scale, draw_scale, 0, ring_color, draw_alpha);
draw_sprite_ext(spr_level, 0, draw_x, draw_y, draw_scale, draw_scale, 0, level_color, draw_alpha);
if (level_perfect)
{
	draw_sprite_ext(spr_level_crown, 0, draw_x, draw_y, draw_scale, draw_scale, 0, c_white, level_perfect);
}
#endregion /* Draw level sprite END */

if (level_number != 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    scr_draw_text_outlined(draw_x, draw_y, string(level_number), global.default_text_size * 2, c_black, c_white, draw_alpha);
}

if (checkpoint_x != 0
|| checkpoint_y != 0) /* Show if Checkpoint is activated */
{
    draw_sprite_ext(spr_checkpoint, 1, draw_x + 32, draw_y, 0.5, 0.5, 0, c_white, 1);
}

if (cleared_with_debug)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(draw_x, draw_y + 32, l10n_text("Used Debug"), global.default_text_size, c_black, c_white);
}