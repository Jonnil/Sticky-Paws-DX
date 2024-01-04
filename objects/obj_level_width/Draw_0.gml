#region /* Draw black rectangle outside level border */
if (!global.actually_play_edited_level)
&& (global.play_edited_level == false)
{
	draw_set_alpha(0.75); /* Make the level border transparent */
	draw_rectangle_color(x - 16, 1, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /* Draw black rectangle outside level border END */

#region /* When dragging this object, show arrows telling player they can move this object in specific direction */
if (drag_object)
{
	draw_set_color(c_white);
	draw_arrow(x, y, x - scr_wave(32, 64, 1), y, 32);
	draw_arrow(x, y, x + scr_wave(32, 64, 1), y, 32);
}
#endregion /* When dragging this object, show arrows telling player they can move this object in specific direction END */

draw_sprite_ext(spr_level_height, 0, x, y, 1, 1, 0, c_white, 1);

if (!global.actually_play_edited_level)
&& (global.play_edited_level == false)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x + 32, y, l10n_text("Width") + ": " + string(bbox_left), global.default_text_size, c_black, c_white, 1);	
}